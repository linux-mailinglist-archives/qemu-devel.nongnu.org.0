Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4232544F221
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 09:17:04 +0100 (CET)
Received: from localhost ([::1]:58908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mloDe-00011d-GQ
	for lists+qemu-devel@lfdr.de; Sat, 13 Nov 2021 03:17:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mloBr-0000Cg-VI
 for qemu-devel@nongnu.org; Sat, 13 Nov 2021 03:15:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mloBn-0007BA-Dy
 for qemu-devel@nongnu.org; Sat, 13 Nov 2021 03:15:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636791306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ADQ/fWil+HIBPU7P5gN2KfWyx5S7bqXZ5+6LlozHw9I=;
 b=LyQEm9J/LlwbcX/GVZ6zzEQHsUIFGBvfJiOPlk3Fryg0ZWiUawv1s4SzM9GxSyNDh9aU0p
 C9aHbAh17RiyQ5Say8nltwZXqDjOEJgnWZDd2Pwy6eDm3fRK2IWVtc8m0TXCXnXfeW3eSk
 NCuY+MJzUlY5lq/dGBHPUZzd/UIlYC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-5-RH5EXyOA6oIMzB6EOazg-1; Sat, 13 Nov 2021 03:15:03 -0500
X-MC-Unique: 5-RH5EXyOA6oIMzB6EOazg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 696AA871803;
 Sat, 13 Nov 2021 08:15:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1723860854;
 Sat, 13 Nov 2021 08:14:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6C87411380A7; Sat, 13 Nov 2021 09:14:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-trivial@nongnu.org
Subject: Re: [PATCH] softmmu/qdev-monitor: fix use-after-free in qdev_set_id()
References: <20211102163342.31162-1-stefanha@redhat.com>
 <a3004034-0221-bb40-3b22-2c57824cac83@redhat.com>
 <8735odk16h.fsf@dusky.pond.sub.org>
Date: Sat, 13 Nov 2021 09:14:44 +0100
In-Reply-To: <8735odk16h.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Wed, 03 Nov 2021 11:01:42 +0100")
Message-ID: <87o86oqxor.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nominating for qemu-trivial.

Markus Armbruster <armbru@redhat.com> writes:

> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>
>> Cc'ing Markus
>>
>> On 11/2/21 17:33, Stefan Hajnoczi wrote:
>>> Reported by Coverity (CID 1465222).
>>>=20
>>> Fixes: 4a1d937796de0fecd8b22d7dbebf87f38e8282fd ("softmmu/qdev-monitor:=
 add error handling in qdev_set_id")
>>> Cc: Damien Hedde <damien.hedde@greensocs.com>
>>> Cc: Kevin Wolf <kwolf@redhat.com>
>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>>  softmmu/qdev-monitor.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>>> index 4851de51a5..06f86a1a96 100644
>>> --- a/softmmu/qdev-monitor.c
>>> +++ b/softmmu/qdev-monitor.c
>>> @@ -581,8 +581,8 @@ const char *qdev_set_id(DeviceState *dev, char *id,=
 Error **errp)
>>>          if (prop) {
>>>              dev->id =3D id;
>>>          } else {
>>> -            g_free(id);
>>>              error_setg(errp, "Duplicate device ID '%s'", id);
>>> +            g_free(id);
>>>              return NULL;
>>>          }
>>>      } else {
>>>=20
>>
>> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>


