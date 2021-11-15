Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84504503F4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 13:02:33 +0100 (CET)
Received: from localhost ([::1]:51542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmagy-0005fx-Fz
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 07:02:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmaen-0004qA-99
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 07:00:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmaek-0004sk-Re
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 07:00:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636977612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lEKYlMbxAjSusv+rGPwblnW6jaEJin9JWkWnnoBOEHY=;
 b=gZss16Z8JN+3liYwRoW9V8pSvBW2thKBC09zjV2SyUpUL0KpKTKZ/8FsBfwkne5nUlCdBe
 XMTHlTDDz9GPZAdV/FufHTEOC5UhHgvmsc3d9jknBDMNsBH+itvAw4kF8OqHCqEVqZ3EHm
 ecF4KVZQSdlYzTDn8eOTKofmP34XoYw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-KSzxucP3Nzatp2TopzXPcA-1; Mon, 15 Nov 2021 07:00:11 -0500
X-MC-Unique: KSzxucP3Nzatp2TopzXPcA-1
Received: by mail-wm1-f70.google.com with SMTP id
 l187-20020a1c25c4000000b0030da46b76daso9531357wml.9
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 04:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lEKYlMbxAjSusv+rGPwblnW6jaEJin9JWkWnnoBOEHY=;
 b=uvX3YvoUH7pOigyh6YLqJostZkdp6D2i324kzks0P7h2pemkbj51lPtxePKPYuoJGO
 MmEfJRpIlYT+DYOm7lg9Ga/I8KJ6XX2q8JfP5qQLMr09XGZwk13GSyTsyGpfgAUTm13b
 OqxjQA3tOl1GorZJddY3pVbMhtEl/afSs+8Nm0OnDlb7uUO72YJYHLZEQ/j/7cXr4ujm
 g15DmTNgiWIL/XzsrLidVnjJRj2TijVoDHv2+k490TINuvznjf1fzZ365IS9Bqp0nYPP
 FR5ivfKRCjKkWIt959zfiwoWCEBKKOUM6Sj7ZGaBKTtUOtM6v9rp2FajfsD9KuuEkfyL
 SiGw==
X-Gm-Message-State: AOAM531ZNbMvGTu0IFPIfpDM/vwZJmIaiSwUNPu8hvWiWmcNx+ufd0Mq
 iSmZK0EqDkggoLsTe8DaZ4VXVs5G+BdzyuAWf4+5DBEAPPWIaae/cOK6KA887VqWMPrLkrWPtgT
 oAgRLsWXB6CTQ0hk=
X-Received: by 2002:a05:600c:4e07:: with SMTP id
 b7mr56242057wmq.8.1636977609865; 
 Mon, 15 Nov 2021 04:00:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBXdy1MSRjJGaA0REE1ym+yN4TaZgtQ1nzFtLXJPIOLaWf2dJPYEOX1iigF2EMBEsdlnbiug==
X-Received: by 2002:a05:600c:4e07:: with SMTP id
 b7mr56241954wmq.8.1636977609325; 
 Mon, 15 Nov 2021 04:00:09 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id f19sm24858550wmq.34.2021.11.15.04.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 04:00:09 -0800 (PST)
Message-ID: <619cd983-4339-f70d-af25-678f5a7ebd83@redhat.com>
Date: Mon, 15 Nov 2021 13:00:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 19/25] block_int-common.h: split function pointers in
 BlockDriver
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-20-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-20-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
> Similar to the header split, also the function pointers in BlockDriver
> can be split in I/O and global state.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/block/block_int-common.h | 458 ++++++++++++++++---------------
>   1 file changed, 237 insertions(+), 221 deletions(-)
>
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index 79a3d801d2..9857e775fe 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -96,6 +96,7 @@ typedef struct BdrvTrackedRequest {
>   
>   
>   struct BlockDriver {
> +    /* Fields initialized in struct definition and never changed. */

I find this a bit difficult to understand.  Perhaps we could be more 
verbose to make it easier to read?  Like

“These fields are initialized when this object is created, and are never 
changed afterwards”

And I’d also add an empty line below to make visually clear that this 
does not describe the single subsequent field (format_name) but the 
whole chunk of fields.

I also wonder if we could substantiate the claim “never changed 
afterwards” by making these fields consts.  Then again, I suppose 
technically none of the fields in BlockDriver is supposed to be mutable 
(except for .list), neither these fields nor the function pointers...  
Yeah, maybe scratch that idea.

>       const char *format_name;
>       int instance_size;

[...]

> +    int coroutine_fn (*bdrv_save_vmstate)(BlockDriverState *bs,
> +                                          QEMUIOVector *qiov,
> +                                          int64_t pos);
> +    int coroutine_fn (*bdrv_load_vmstate)(BlockDriverState *bs,
> +                                          QEMUIOVector *qiov,
> +                                          int64_t pos);

In patch 18, you classified bdrv_co_readv_vmstate() and 
bdrv_co_writev_vmstate() as I/O functions.  They call these methods, 
though, so something doesn’t seem quite right.

Now I also remember you classified the global bdrv_save_vmstate() and 
bdrv_load_vmstate() functions as GS.  I don’t mind either way; AFAIU 
they are I/O functions that are generally called under the BQL.  But the 
classification should be consistent, of course.

> +
> +    int (*bdrv_change_backing_file)(BlockDriverState *bs,
> +        const char *backing_file, const char *backing_fmt);
> +
> +    void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
> +    void (*bdrv_lock_medium)(BlockDriverState *bs, bool locked);

Above bdrv_is_inserted(), there’s a comment (“removable device 
specific”) that I think should be duplicated here.

> +
> +    /* TODO Better pass a option string/QDict/QemuOpts to add any rule? */
> +    int (*bdrv_debug_breakpoint)(BlockDriverState *bs, const char *event,
> +        const char *tag);
> +    int (*bdrv_debug_remove_breakpoint)(BlockDriverState *bs,
> +        const char *tag);
> +    int (*bdrv_debug_resume)(BlockDriverState *bs, const char *tag);
> +    bool (*bdrv_debug_is_suspended)(BlockDriverState *bs, const char *tag);
> +    void (*bdrv_refresh_limits)(BlockDriverState *bs, Error **errp);

Originally, there was an empty line before bdrv_refresh_limits(), and 
I’d keep it.

[...]

> +    /**
> +     * Try to get @bs's logical and physical block size.
> +     * On success, store them in @bsz and return zero.
> +     * On failure, return negative errno.
> +     */
> +    int (*bdrv_probe_blocksizes)(BlockDriverState *bs, BlockSizes *bsz);

Originally, there was a comment above this function (“I/O API, even 
though if it's a filter jumps on parent”) that you added in patch 6 and 
that I didn’t understand.  Given this, I’m not unhappy to see it go 
again, but now I wonder about its purpose even more...

> +    /**
> +     * Try to get @bs's geometry (cyls, heads, sectors)
> +     * On success, store them in @geo and return 0.
> +     * On failure return -errno.
> +     * Only drivers that want to override guest geometry implement this
> +     * callback; see hd_geometry_guess().
> +     */
> +    int (*bdrv_probe_geometry)(BlockDriverState *bs, HDGeometry *geo);

(Here, too)

[...]

> +    /**
> +     * Register/unregister a buffer for I/O. For example, when the driver is
> +     * interested to know the memory areas that will later be used in iovs, so
> +     * that it can do IOMMU mapping with VFIO etc., in order to get better
> +     * performance. In the case of VFIO drivers, this callback is used to do
> +     * DMA mapping for hot buffers.
> +     */
> +    void (*bdrv_register_buf)(BlockDriverState *bs, void *host, size_t size);
> +    void (*bdrv_unregister_buf)(BlockDriverState *bs, void *host);
> +    QLIST_ENTRY(BlockDriver) list;

This field is interesting because it’s the only mutable field in the 
whole struct.  I think it should be separated from the function pointers 
above and given a comment like “This field is modified only under the 
BQL, and is part of the global state”.

> +
> +    /*
> +     * I/O API functions. These functions are thread-safe.
> +     *
> +     * See include/block/block-io.h for more information about
> +     * the I/O API.
> +     */
> +
> +    int coroutine_fn (*bdrv_co_create)(BlockdevCreateOptions *opts,
> +                                       Error **errp);
> +    int coroutine_fn (*bdrv_co_create_opts)(BlockDriver *drv,
> +                                            const char *filename,
> +                                            QemuOpts *opts,
> +                                            Error **errp);

Now this is really interesting.  Technically I suppose these should work 
in any thread, but trying to do so results in:

$ touch /tmp/iothread-create-test.qcow2
$ ./qemu-system-x86_64 -object iothread,id=iothr0 -qmp stdio <<EOF
{"execute": "qmp_capabilities"}
{"execute":"blockdev-add","arguments":{"node-name":"proto","driver":"file","filename":"/tmp/iothread-create-test.qcow2"}}
{"execute":"x-blockdev-set-iothread","arguments":{"node-name":"proto","iothread":"iothr0"}}
{"execute":"blockdev-create","arguments":{"job-id":"create","options":{"driver":"qcow2","file":"proto","size":0}}}
EOF
{"QMP": {"version": {"qemu": {"micro": 90, "minor": 1, "major": 6}, 
"package": "v6.2.0-rc0-40-gd02d5fe5fb-dirty"}, "capabilities": ["oob"]}}
{"return": {}}
{"return": {}}
{"return": {}}
{"timestamp": {"seconds": 1636973542, "microseconds": 338117}, "event": 
"JOB_STATUS_CHANGE", "data": {"status": "created", "id": "create"}}
{"timestamp": {"seconds": 1636973542, "microseconds": 338197}, "event": 
"JOB_STATUS_CHANGE", "data": {"status": "running", "id": "create"}}
{"return": {}}
qemu: qemu_mutex_unlock_impl: Operation not permitted
[1]    86154 IOT instruction (core dumped)  ./qemu-system-x86_64 -object 
iothread,id=iothr0 -qmp stdio <<<''

So something’s fishy and perhaps we should investigate this...  I mean, 
I can’t really imagine a case where someone would need to run a 
blockdev-create job in an I/O thread, but right now the interface allows 
for it.

And then bdrv_create() is classified as global state, and also 
bdrv_co_create_opts_simple(), which is supposed to be a drop-in function 
for this .bdrv_co_create_opts function.  So that can’t work.

Also, I believe there might have been some functions you classified as 
GS that are called from .create* implementations.  I accepted that, 
given the abort I sketched above.  However, if we classify image 
creation as I/O, then those would need to be re-evaluated. For example, 
qcow2_co_create_opts() calls bdrv_create_file(), which is a GS function.

Some of this issues could be addressed by making .bdrv_co_create_opts a 
GS function and .bdrv_co_create an I/O function.  I believe that would 
be the ideal split, even though as shown above .bdrv_co_create doesn’t 
work in an I/O thread, and then you have the issue of probably all 
format drivers’ .bdrv_co_create implementations calling 
bdrv_open_blockdev_ref(), which is a GS function.

(VMDK even calls blk_new_open(), blk_new_with_bs(), and blk_unref(), 
none of which can ever be I/O functions, I think.)

I believe in practice the best is to for now classify all create-related 
functions as GS functions.  This is supported by the fact that 
qmp_blockdev_create() specifically creates the create job in the main 
context (with a TODO comment) and requires block drivers to error out 
when they encounter a node in a different AioContext.

> +    int coroutine_fn (*bdrv_co_amend)(BlockDriverState *bs,
> +                                      BlockdevAmendOptions *opts,
> +                                      bool force,
> +                                      Error **errp);
> +
>       /* aio */
>       BlockAIOCB *(*bdrv_aio_preadv)(BlockDriverState *bs,
>           int64_t offset, int64_t bytes, QEMUIOVector *qiov,

[...]

> @@ -443,47 +632,20 @@ struct BlockDriver {

Right above here (i.e. line 631), there’s an attribute 
`has_variable_length`.  I believe that should go up to the immutable 
fields section.

>       int64_t (*bdrv_get_allocated_file_size)(BlockDriverState *bs);
>       BlockMeasureInfo *(*bdrv_measure)(QemuOpts *opts, BlockDriverState *in_bs,
>                                         Error **errp);
> -

I’d keep this empty line.

Hanna

>       int coroutine_fn (*bdrv_co_pwritev_compressed)(BlockDriverState *bs,
>           int64_t offset, int64_t bytes, QEMUIOVector *qiov);
>       int coroutine_fn (*bdrv_co_pwritev_compressed_part)(BlockDriverState *bs,
>           int64_t offset, int64_t bytes, QEMUIOVector *qiov,
>           size_t qiov_offset);


