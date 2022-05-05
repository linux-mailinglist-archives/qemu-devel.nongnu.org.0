Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABC751B7AD
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 07:58:26 +0200 (CEST)
Received: from localhost ([::1]:34730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmUVN-0005Mk-6A
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 01:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmUPc-00044h-49
 for qemu-devel@nongnu.org; Thu, 05 May 2022 01:52:28 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:33071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmUPZ-0003vx-8j
 for qemu-devel@nongnu.org; Thu, 05 May 2022 01:52:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651729943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MEhlTbeKxMdLBNfm69HgFOwBRGJTMoSP0tNsikFwyFs=;
 b=hYJdwDditdigESNcvzMKmpmbnRIQ0y8T7zBLstFGfxOc6RmcCsQbm8VjYQAY/5pfEPAbR9
 uJEWba8yKF0L3F1jwjsf2zBwjYfz7g7+G3LnF+AvU0tX8QNYwX21rkbJFvXwfV3soPUrAn
 uDBOn/aF0D6uqFG0PpwT8mGDvzNopIk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-mTCRuQkFNUGbTX_S7MZXYQ-1; Thu, 05 May 2022 01:52:22 -0400
X-MC-Unique: mTCRuQkFNUGbTX_S7MZXYQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF3BE1D96CA2;
 Thu,  5 May 2022 05:52:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97BE940CF8FE;
 Thu,  5 May 2022 05:52:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 86FEF21E6880; Thu,  5 May 2022 07:52:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  "pbonzini@redhat.com"
 <pbonzini@redhat.com>,  "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>,  "thuth@redhat.com" <thuth@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,  "berrange@redhat.com"
 <berrange@redhat.com>,  "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>,  "quintela@redhat.com"
 <quintela@redhat.com>,  "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>,  "peterx@redhat.com"
 <peterx@redhat.com>,  "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,  Elena
 Ufimtseva <elena.ufimtseva@oracle.com>,  John Johnson
 <john.g.johnson@oracle.com>,  Kanth Ghatraju <kanth.ghatraju@oracle.com>
Subject: Re: [PATCH v9 07/17] vfio-user: define vfio-user-server object
References: <cover.1651586203.git.jag.raman@oracle.com>
 <48d0f7214036d48b1f70b90a8c4a6c2a46363ee9.1651586203.git.jag.raman@oracle.com>
 <871qx97c8s.fsf@pond.sub.org>
 <45821C65-9A66-44BC-AC00-BC3BEAF982BF@oracle.com>
Date: Thu, 05 May 2022 07:52:20 +0200
In-Reply-To: <45821C65-9A66-44BC-AC00-BC3BEAF982BF@oracle.com> (Jag Raman's
 message of "Wed, 4 May 2022 15:24:37 +0000")
Message-ID: <87v8ukzfu3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.74; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jag Raman <jag.raman@oracle.com> writes:

>> On May 4, 2022, at 7:45 AM, Markus Armbruster <armbru@redhat.com> wrote:
>>=20
>> Jagannathan Raman <jag.raman@oracle.com> writes:
>>=20
>>> Define vfio-user object which is remote process server for QEMU. Setup
>>> object initialization functions and properties necessary to instantiate
>>> the object
>>>=20
>>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>>> ---
>>> qapi/qom.json | 20 +++-
>>> include/hw/remote/machine.h | 2 +
>>> hw/remote/machine.c | 27 +++++
>>> hw/remote/vfio-user-obj.c | 210 ++++++++++++++++++++++++++++++++++++
>>> MAINTAINERS | 1 +
>>> hw/remote/meson.build | 1 +
>>> hw/remote/trace-events | 3 +
>>> 7 files changed, 262 insertions(+), 2 deletions(-)
>>> create mode 100644 hw/remote/vfio-user-obj.c
>>>=20
>>> diff --git a/qapi/qom.json b/qapi/qom.json
>>> index eeb5395ff3..582def0522 100644
>>> --- a/qapi/qom.json
>>> +++ b/qapi/qom.json
>>> @@ -703,6 +703,20 @@
>>> { 'struct': 'RemoteObjectProperties',
>>> 'data': { 'fd': 'str', 'devid': 'str' } }
>>>=20
>>> +##
>>> +# @VfioUserServerProperties:
>>> +#
>>> +# Properties for x-vfio-user-server objects.
>>> +#
>>> +# @socket: socket to be used by the libvfio-user library
>>> +#
>>> +# @device: the id of the device to be emulated at the server
>>=20
>> Suggest "the ID", because "id" is not a word.
>>=20
>> What kind of ID is this? The kind set with -device id=3D...?
>
> Yes, it=E2=80=99s the =E2=80=9Cid=E2=80=9D sub-option of the =E2=80=9C-de=
vice=E2=80=9D option. Will update this comment.

I was just double-checking.  I think the comment is okay with "the ID".

> Thank you!

You're welcome!


