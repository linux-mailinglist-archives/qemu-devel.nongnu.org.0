Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB324DBF82
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 07:26:27 +0100 (CET)
Received: from localhost ([::1]:34478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUjac-0007D1-Nx
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 02:26:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUjVH-0003mA-Rg
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 02:20:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUjVB-00051L-VN
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 02:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647498048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xZhzloJ35tvCP4U0AaPZwVntBLCHkROeUDQhJNk1mTg=;
 b=hm/lek9wTM9xlOobetxQMlmYDpq2dsJrtxoYT0+2GiPYQn16xAfG8he3HTY+3tDmPR72n4
 CNapNrZt/+5qU7EZvam1apbKyPjMmLfI0KEXfatK4UdwU/JNFdTAjpRV15WTzv9JsbOmH6
 aTuFzu/HqBwtY3lDcNbhLC7ME9sMz9s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-ny0qitLMPVu1cIM3wPSvmg-1; Thu, 17 Mar 2022 02:20:45 -0400
X-MC-Unique: ny0qitLMPVu1cIM3wPSvmg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0549805A30;
 Thu, 17 Mar 2022 06:20:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E03D2D476;
 Thu, 17 Mar 2022 06:20:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EFAB221E66C8; Thu, 17 Mar 2022 07:20:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH v2 2/2] Added parameter to take screenshot with
 screendump as
References: <20220315044740.155268-1-kshitij.suri@nutanix.com>
 <20220315044740.155268-2-kshitij.suri@nutanix.com>
 <87sfrivxk3.fsf@pond.sub.org>
 <98a777da-4ff5-784f-78ca-790dd3064a7b@nutanix.com>
Date: Thu, 17 Mar 2022 07:20:38 +0100
In-Reply-To: <98a777da-4ff5-784f-78ca-790dd3064a7b@nutanix.com> (Kshitij
 Suri's message of "Wed, 16 Mar 2022 23:45:03 +0530")
Message-ID: <87v8wdqevd.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kshitij Suri <kshitij.suri@nutanix.com> writes:

> On 16/03/22 6:55 pm, Markus Armbruster wrote:
>> Kshitij Suri <kshitij.suri@nutanix.com> writes:
>>
>>> From: "kshitij.suri" <kshitij.suri@nutanix.com>
>>>
>>> Currently screendump only supports PPM format, which is un-compressed and not
>>> standard. Added a "format" parameter to qemu monitor screendump capabilites
>>> to support PNG image capture using libpng. The param was added in QAPI schema
>>> of screendump present in ui.json along with png_save() function which converts
>>> pixman_image to PNG. HMP command equivalent was also modified to support the
>>> feature.
>>>
>>> Example usage:
>>> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
>>> "format":"png" } }
>>>
>>> Resolves: https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_718&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=UZZDywEeidD1LndEhKddMf_0v-jePIgMYErGImjYyvjYRJFdnv6LAHgRmZ0IpvIL&s=jc09kdvD1ULKCC9RgwWcsK6eweue3ZkyD8F9kCx5yUs&e=
>>>
>>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>>> ---
>>> diff to v1:
>>>    - Removed repeated alpha conversion operation.
>>>    - Modified logic to mirror png conversion in vnc-enc-tight.c file.
>>>    - Added a new CONFIG_PNG parameter for libpng support.
>>>    - Changed input format to enum instead of string.
>>>    - Improved error handling.
>>>   hmp-commands.hx    |  11 ++---
>>>   monitor/hmp-cmds.c |  19 ++++++++-
>>>   qapi/ui.json       |  24 +++++++++--
>>>   ui/console.c       | 102 +++++++++++++++++++++++++++++++++++++++++++--
>>>   4 files changed, 144 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>>> index 70a9136ac2..5eda4eeb24 100644
>>> --- a/hmp-commands.hx
>>> +++ b/hmp-commands.hx
>>> @@ -244,17 +244,18 @@ ERST
>>>   
>>>       {
>>>           .name       = "screendump",
>>> -        .args_type  = "filename:F,device:s?,head:i?",
>>> -        .params     = "filename [device [head]]",
>>> -        .help       = "save screen from head 'head' of display device 'device' "
>>> -                      "into PPM image 'filename'",
>>> +        .args_type  = "filename:F,device:s?,head:i?,format:f?",
>>> +        .params     = "filename [device [head]] [format]",
>>> +        .help       = "save screen from head 'head' of display device 'device'"
>>> +                      "in specified format 'format' as image 'filename'."
>>> +                      "Currently only 'png' and 'ppm' formats are supported.",
>>>           .cmd        = hmp_screendump,
>>>           .coroutine  = true,
>>>       },
>>>   
>>>   SRST
>>>   ``screendump`` *filename*
>>> -  Save screen into PPM image *filename*.
>>> +  Save screen as an image *filename*, with default format of PPM.
>>>   ERST
>>>   
>>>       {
>>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>>> index 8c384dc1b2..9a640146eb 100644
>>> --- a/monitor/hmp-cmds.c
>>> +++ b/monitor/hmp-cmds.c
>>> @@ -1677,9 +1677,26 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
>>>       const char *filename = qdict_get_str(qdict, "filename");
>>>       const char *id = qdict_get_try_str(qdict, "device");
>>>       int64_t head = qdict_get_try_int(qdict, "head", 0);
>>> +    const char *input_format  = qdict_get_str(qdict, "format");
>>>       Error *err = NULL;
>>> +    ImageFormat format;
>>>   
>>> -    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
>>
>> The second id != NULL looks wrong.  Shouldn't it be head != NULL?

Can't: @head is not a pointer.

>> Not your patch's fault, of course.
>
> As per hmp-commands.hx input is of format [device [head]] so maybe
> works as a pair.

I looked: no, it works because it duplicates qmp_screendump()'s default.

qmp_screendump()'s behavior:

* If neither @device nor @head are present, default to console #0.

* If only @device is present, default to head 0 of the specified device.

* If both are present, default to the specified head of the specified
  device.

* If only @head is present, error out.

Ideally, we'd have hmp_screendump() pass its arguments unadulterated to
qmp_screendump(), so logic isn't duplicated.

Unfortunately, this turns out to be a bit troublesome.
qdict_get_try_int() *forces* us to supply a default value, and doesn't
tell us whether argument is present.  We'd have to use qdict_haskey()
for that:

    qmp_screendump(filename, id != NULL, id, qdict_haskey("head"), head,
                   &err);

The current code instead replaces case "only @device is present" by
"both are present".  Works, because the default it uses matches the one
in qmp_screendump().

I find this less obvious, but I'm not sure it's worth patching.

Note that case "only @head is present" isn't possible because the
arguments are positional.

>                  Is it alright if I investigate and send in another patch
> after this?

Let's not bother.


