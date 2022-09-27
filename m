Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC295EBDB1
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:45:04 +0200 (CEST)
Received: from localhost ([::1]:51264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od6D9-0004oN-SW
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1od5QR-0001zr-HC
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:54:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1od5QO-0004vk-0s
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664265279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0+Kz73S6neiN2Bm5QOfPiRO36+XH+8AMcNc1Npinuxw=;
 b=Ibtl1M8InA5LtZCKjE0wWWrnKxDFUucbtboMU/B0IbBPGlXOyM+vHowRtYHm8P5s634qsX
 M0kXUzKtg8ZYK/z3zoUVqgTvBATfM50WeZd+9kl9VkedWEi3zfqk/itKN8aoPPTfbIXWBU
 XzOp1Gp3wHxMozTW4ofRrROpGxx5MvY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-NQ-hlzj2MHW4mz4M26bVng-1; Tue, 27 Sep 2022 03:54:37 -0400
X-MC-Unique: NQ-hlzj2MHW4mz4M26bVng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCD7E862FE0;
 Tue, 27 Sep 2022 07:54:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D2CE2166B26;
 Tue, 27 Sep 2022 07:54:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6027421E691D; Tue, 27 Sep 2022 09:54:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Kevin Wolf <kwolf@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,  qemu-devel@nongnu.org,
 dinechin@redhat.com,  Gerd Hoffmann <kraxel@redhat.com>,  =?utf-8?Q?Marc?=
 =?utf-8?Q?-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: Re: [PATCH v6 3/5] module: add Error arguments to module_load and
 module_load_qom
References: <20220923232104.28420-1-cfontana@suse.de>
 <20220923232104.28420-4-cfontana@suse.de>
 <YzGBOwBQucv1F2NL@redhat.com>
 <3dc4a54e-7d04-36db-0931-2fb8d068b5f2@suse.de>
Date: Tue, 27 Sep 2022 09:54:34 +0200
In-Reply-To: <3dc4a54e-7d04-36db-0931-2fb8d068b5f2@suse.de> (Claudio Fontana's
 message of "Mon, 26 Sep 2022 15:54:41 +0200")
Message-ID: <87a66lmev9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Claudio Fontana <cfontana@suse.de> writes:

> On 9/26/22 12:38, Kevin Wolf wrote:
>> Am 24.09.2022 um 01:21 hat Claudio Fontana geschrieben:
>>> improve error handling during module load, by changing:
>>>
>>> bool module_load(const char *prefix, const char *lib_name);
>>> void module_load_qom(const char *type);
>>>
>>> to:
>>>
>>> int module_load(const char *prefix, const char *name, Error **errp);
>>> int module_load_qom(const char *type, Error **errp);
>>>
>>> where the return value is:
>>>
>>>  -1 on module load error, and errp is set with the error
>>>   0 on module or one of its dependencies are not installed
>>>   1 on module load success
>>>   2 on module load success (module already loaded or built-in)
>>>
>>> module_load_qom_one has been introduced in:
>>>
>>> commit 28457744c345 ("module: qom module support"), which built on top of
>>> module_load_one, but discarded the bool return value. Restore it.
>>>
>>> Adapt all callers to emit errors, or ignore them, or fail hard,
>>> as appropriate in each context.
>>>
>>> Some memory leaks also fixed as part of the module_load changes.
>>>
>>> audio: when attempting to load an audio module, report module load errors.
>>> block: when attempting to load a block module, report module load errors.
>>> console: when attempting to load a display module, report module load errors.
>>>
>>> qdev: when creating a new qdev Device object (DeviceState), report load errors.
>>>       If a module cannot be loaded to create that device, now abort execution.
>>>
>>> qom/object.c: when initializing a QOM object, or looking up class_by_name,
>>>               report module load errors.
>>>
>>> qtest: when processing the "module_load" qtest command, report errors
>>>        in the load of the module.
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> 
>>> diff --git a/block/dmg.c b/block/dmg.c
>>> index 007b8d9996..a422cf8d5b 100644
>>> --- a/block/dmg.c
>>> +++ b/block/dmg.c
>>> @@ -434,6 +434,7 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>>>      uint64_t plist_xml_offset, plist_xml_length;
>>>      int64_t offset;
>>>      int ret;
>>> +    Error *local_err = NULL;
>>>  
>>>      ret = bdrv_apply_auto_read_only(bs, NULL, errp);
>>>      if (ret < 0) {
>>> @@ -446,8 +447,15 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>>>          return -EINVAL;
>>>      }
>>>  
>>> -    block_module_load("dmg-bz2");
>>> -    block_module_load("dmg-lzfse");
>>> +    if (block_module_load("dmg-bz2", &local_err) < 0) {
>>> +        error_report_err(local_err);
>>> +        return -EINVAL;
>>> +    }
>>> +    local_err = NULL;
>>> +    if (block_module_load("dmg-lzfse", &local_err) < 0) {
>>> +        error_report_err(local_err);
>>> +        return -EINVAL;
>
> I am concerned about the resources allocation here though,
> is returning EINVAL here right, vs using "goto fail"?
>
> I matched the behavior of the preceding call:
>
>     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
>                                BDRV_CHILD_IMAGE, false, errp);
>     if (!bs->file) {
>         return -EINVAL;
>     }
>
> But afterwards the code goes:
> .
>     /* locate the UDIF trailer */
>     offset = dmg_find_koly_offset(bs->file, errp);
>     if (offset < 0) {
>         ret = offset;
>         goto fail;
>     }
>
> Should the resources be freed or not in your view?

Functions should generally fail cleanly, and that means undoing side
effects such as allocations.

Typically, we undo in reverse order, and goto the right spot in that
sequence.

When the undo can be made to work whether the "do" happened or not, we
can use fewer labels for simplicity.  For instance, g_free(mumble) works
as long as mumble is initialized to NULL.

In this function:

   fail:
       g_free(s->types);
       g_free(s->offsets);
       g_free(s->lengths);
       g_free(s->sectors);
       g_free(s->sectorcounts);
       qemu_vfree(s->compressed_chunk);
       qemu_vfree(s->uncompressed_chunk);
       return ret;

I figure this undoes side effects hidden in the read functions called.

Potential issue before this patch: I can't see bdrv_open_child() being
undone.  Shouldn't we close bs->file?  And what about
bdrv_open_child()'s side effect on @options?

[...]


