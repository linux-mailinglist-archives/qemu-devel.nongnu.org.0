Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB7A50AF78
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 07:17:07 +0200 (CEST)
Received: from localhost ([::1]:35630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhlfF-0000Ne-Ok
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 01:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhlce-000789-IQ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 01:14:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhlcb-0001lM-LW
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 01:14:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650604459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cxbajAeHTwy8RZfSaA6C/qK89raXSlkRmlIqMBWe0G4=;
 b=B5Iu0MpAkKCHgWCA7hI4PL6HSyr5mhl1GoQqzXN1ItfT2tcnTYqIV6oYqaD9YwNayBIENb
 5DECxO3+jVjIoMujfifjcfB3qpqYz5ZXHb4A1lPawQuk4d+drDtZ6JyuMFqavxfXB7wYEP
 dmcviBtTgZ5q5cE2pMvm5T9PtitpkcE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-b0g4q3XfNM2Ad74YtJ-o_A-1; Fri, 22 Apr 2022 01:14:16 -0400
X-MC-Unique: b0g4q3XfNM2Ad74YtJ-o_A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E64FD866DF9;
 Fri, 22 Apr 2022 05:14:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91E17415F4E;
 Fri, 22 Apr 2022 05:14:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7000421E6A1F; Fri, 22 Apr 2022 07:14:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v8 10/17] vfio-user: run vfio-user context
References: <cover.1650379269.git.jag.raman@oracle.com>
 <1f71b01f49b461a41130ac9d19355344c3752f7d.1650379269.git.jag.raman@oracle.com>
 <87zgkepjn5.fsf@pond.sub.org>
 <4781D386-AF48-43C9-ADC0-7DAF2DB52F11@oracle.com>
Date: Fri, 22 Apr 2022 07:14:13 +0200
In-Reply-To: <4781D386-AF48-43C9-ADC0-7DAF2DB52F11@oracle.com> (Jag Raman's
 message of "Thu, 21 Apr 2022 17:52:14 +0000")
Message-ID: <87ee1pn1i2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jag Raman <jag.raman@oracle.com> writes:

>> On Apr 21, 2022, at 10:59 AM, Markus Armbruster <armbru@redhat.com> wrot=
e:
>>=20
>> Jagannathan Raman <jag.raman@oracle.com> writes:
>>=20
>>> Setup a handler to run vfio-user context. The context is driven by
>>> messages to the file descriptor associated with it - get the fd for
>>> the context and hook up the handler with it
>>>=20
>>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>> qapi/misc.json            | 23 ++++++++++
>>> hw/remote/vfio-user-obj.c | 95 ++++++++++++++++++++++++++++++++++++++-
>>> 2 files changed, 117 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/qapi/misc.json b/qapi/misc.json
>>> index b83cc39029..f3cc4a4854 100644
>>> --- a/qapi/misc.json
>>> +++ b/qapi/misc.json
>>> @@ -553,3 +553,26 @@
>>> ##
>>> { 'event': 'RTC_CHANGE',
>>>   'data': { 'offset': 'int', 'qom-path': 'str' } }
>>> +
>>> +##
>>> +# @VFU_CLIENT_HANGUP:
>>> +#
>>> +# Emitted when the client of a TYPE_VFIO_USER_SERVER closes the
>>> +# communication channel
>>> +#
>>> +# @id: ID of the TYPE_VFIO_USER_SERVER object
>>> +#
>>> +# @device: ID of attached PCI device
>>=20
>> Is this the ID set with -device id=3D... and such?
>
> Yes, that is correct. It=E2=80=99s the ID set with the =E2=80=9C-device i=
d=3D=E2=80=A6=E2=80=9D option/

What happens when the device was added *without* id=3D...?  DeviceState
member @id is null then.

I figure we need to make @device optional here, present if the device
has an ID.  I recommend to also add a member @qom-path, like we did for
MEMORY_DEVICE_SIZE_CHANGE in commit d89dd28f0e2.


