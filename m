Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1A1443FCC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 11:04:15 +0100 (CET)
Received: from localhost ([::1]:38944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miD7u-00020B-9I
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 06:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miD5i-0007y3-3H
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 06:02:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miD5f-00061o-Sq
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 06:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635933714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i2ero4QE77Grw+jq42BT6eBvByBlJLtj9BO0d+OZBp0=;
 b=hdYcYf70IMtQ4dITJhoVDNoimZ6CCzSp+D+K9w4Ak38PW0W+jAVNe5z/i5Mmm+izvB+KPj
 yjuhr7gTCj9D1uQlzPn3eShFrmrVGtbiroWFIFhWYhLCUhjtBILXp+Ph0Aeb0vrYhxYK+r
 NWjCZ99XtYgx7j7ZEh/8JmZDkujIuU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-gCl-HAvAN-uE9QFHQ8UA6A-1; Wed, 03 Nov 2021 06:01:53 -0400
X-MC-Unique: gCl-HAvAN-uE9QFHQ8UA6A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF98B1927801;
 Wed,  3 Nov 2021 10:01:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0B395C1BB;
 Wed,  3 Nov 2021 10:01:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 71E9311380A7; Wed,  3 Nov 2021 11:01:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] softmmu/qdev-monitor: fix use-after-free in qdev_set_id()
References: <20211102163342.31162-1-stefanha@redhat.com>
 <a3004034-0221-bb40-3b22-2c57824cac83@redhat.com>
Date: Wed, 03 Nov 2021 11:01:42 +0100
In-Reply-To: <a3004034-0221-bb40-3b22-2c57824cac83@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 3 Nov 2021 10:46:36
 +0100")
Message-ID: <8735odk16h.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Cc'ing Markus
>
> On 11/2/21 17:33, Stefan Hajnoczi wrote:
>> Reported by Coverity (CID 1465222).
>>=20
>> Fixes: 4a1d937796de0fecd8b22d7dbebf87f38e8282fd ("softmmu/qdev-monitor: =
add error handling in qdev_set_id")
>> Cc: Damien Hedde <damien.hedde@greensocs.com>
>> Cc: Kevin Wolf <kwolf@redhat.com>
>> Cc: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>  softmmu/qdev-monitor.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>> index 4851de51a5..06f86a1a96 100644
>> --- a/softmmu/qdev-monitor.c
>> +++ b/softmmu/qdev-monitor.c
>> @@ -581,8 +581,8 @@ const char *qdev_set_id(DeviceState *dev, char *id, =
Error **errp)
>>          if (prop) {
>>              dev->id =3D id;
>>          } else {
>> -            g_free(id);
>>              error_setg(errp, "Duplicate device ID '%s'", id);
>> +            g_free(id);
>>              return NULL;
>>          }
>>      } else {
>>=20
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


