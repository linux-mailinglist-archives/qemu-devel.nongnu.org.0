Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD99489FDB
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 20:08:07 +0100 (CET)
Received: from localhost ([::1]:60138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n701W-0004F5-9a
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 14:08:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n6zr6-0000WG-PK
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 13:57:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n6zr1-00019D-VI
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 13:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641841034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z4PZvZTFMYL3hRz7be/v8yQaGUM2t5FSQWtltc6RY9U=;
 b=KAi7X6klzeszGmG1aPJMZXiyfobQ89YxDmLr6O5HBmq/95bNh2HPqGZJQszdSDmLtf/xvR
 sheLWwpBgP76tTSaKR9JKSnWiSsPqAXmavGhRtVkBZIOnU9Z4MgkFmWlzXct8cwnqSQaE/
 BFbhFHaDcWQwi2OIxqe1SxZsu+xMROM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-o3AJokrdMbmXS3K0RQ9LTQ-1; Mon, 10 Jan 2022 13:57:08 -0500
X-MC-Unique: o3AJokrdMbmXS3K0RQ9LTQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r2-20020a05600c35c200b00345c3b82b22so49375wmq.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 10:57:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z4PZvZTFMYL3hRz7be/v8yQaGUM2t5FSQWtltc6RY9U=;
 b=z116gvcTffOi+kiq56FWAAzdC/cm3YQ0ZmuIY+OZZ9fDvsh0JuF5ZXvPOjX+F3Fl0/
 ytzmFN2pzAbHeoDeuTO9g7cDbk6u60pxVHnRBKEEdF5RzP2EUWsm5/K4qWLESUfTbjFM
 fUZHyhPK7zqnkmlpEeV5lVukVKeK2jDbS+HtNRtRQuJNfGmlu9GwI8ZLaqxQMsQ/u0LE
 OOpYbXLXlSRtH5q5aYeCvovtRyu1zanuK13CWxi+uWx7CYGXOXUu6E9t8wDuyhNS3rdn
 PrMhzlWlcOUyG5z3u7JH5aoH3mXqdadAinXZ12d0zB16r3i7foOVC0KoPgv4nQRyt36g
 28Ug==
X-Gm-Message-State: AOAM533Bw11xnS2IZb9ZXZZKe2i19b7CI6Xg8seOmb8HLBpWirKjgsJm
 qiW4RWiMoAMiSH7ZOMkV3RX0rC7Nb1yeo0I0/NNrI8e029Qeb8eAmkPWfnaW6sNwvK2va1l1SBf
 mnOcctXJBSjEqTUk=
X-Received: by 2002:a7b:c055:: with SMTP id u21mr23363695wmc.0.1641841027167; 
 Mon, 10 Jan 2022 10:57:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsy0aVqMviLvmaDSfGyDvyTVzrrIdl5Vym++TC4Al6u4wEjp6970HyJc2XAm9rzCfuXYlJzQ==
X-Received: by 2002:a7b:c055:: with SMTP id u21mr23363684wmc.0.1641841026928; 
 Mon, 10 Jan 2022 10:57:06 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id o10sm7944081wmq.31.2022.01.10.10.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 10:57:06 -0800 (PST)
Message-ID: <bfa45a4d-4d6e-f2c0-ed62-8bc184196c66@redhat.com>
Date: Mon, 10 Jan 2022 19:57:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] block-backend: prevent dangling BDS pointers across
 aio_poll()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20211214143542.14758-1-stefanha@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211214143542.14758-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-stable@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.12.21 15:35, Stefan Hajnoczi wrote:
> The BlockBackend root child can change when aio_poll() is invoked. This
> happens when a temporary filter node is removed upon blockjob
> completion, for example.
>
> Functions in block/block-backend.c must be aware of this when using a
> blk_bs() pointer across aio_poll() because the BlockDriverState refcnt
> may reach 0, resulting in a stale pointer.
>
> One example is scsi_device_purge_requests(), which calls blk_drain() to
> wait for in-flight requests to cancel. If the backup blockjob is active,
> then the BlockBackend root child is a temporary filter BDS owned by the
> blockjob. The blockjob can complete during bdrv_drained_begin() and the
> last reference to the BDS is released when the temporary filter node is
> removed. This results in a use-after-free when blk_drain() calls
> bdrv_drained_end(bs) on the dangling pointer.

By the way, I have a BZ for this, though it’s about block-stream instead 
of backup (https://bugzilla.redhat.com/show_bug.cgi?id=2036178).  But 
I’m happy to report your patch seems* to fix that problem, too!  (Thanks 
for fixing my BZs! :))

*I’ve written a reproducer in iotest form 
(https://gitlab.com/hreitz/qemu/-/blob/stefans-fix-and-a-test/tests/qemu-iotests/tests/stream-error-on-reset), 
and so far I can only assume it indeed reproduces the report, but I 
found that iotest to indeed be fixed by this patch.  (Which made me very 
happy.)

Hanna

> Explicitly hold a reference to bs across block APIs that invoke
> aio_poll().
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v2:
> - Audit block/block-backend.c and fix additional cases
> ---
>   block/block-backend.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 12ef80ea17..a40ad7fa92 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -828,10 +828,12 @@ void blk_remove_bs(BlockBackend *blk)
>       notifier_list_notify(&blk->remove_bs_notifiers, blk);
>       if (tgm->throttle_state) {
>           bs = blk_bs(blk);
> +        bdrv_ref(bs);
>           bdrv_drained_begin(bs);
>           throttle_group_detach_aio_context(tgm);
>           throttle_group_attach_aio_context(tgm, qemu_get_aio_context());
>           bdrv_drained_end(bs);
> +        bdrv_unref(bs);
>       }
>   
>       blk_update_root_state(blk);
> @@ -1705,6 +1707,7 @@ void blk_drain(BlockBackend *blk)
>       BlockDriverState *bs = blk_bs(blk);
>   
>       if (bs) {
> +        bdrv_ref(bs);
>           bdrv_drained_begin(bs);
>       }
>   
> @@ -1714,6 +1717,7 @@ void blk_drain(BlockBackend *blk)
>   
>       if (bs) {
>           bdrv_drained_end(bs);
> +        bdrv_unref(bs);
>       }
>   }
>   
> @@ -2044,10 +2048,13 @@ static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
>       int ret;
>   
>       if (bs) {
> +        bdrv_ref(bs);
> +
>           if (update_root_node) {
>               ret = bdrv_child_try_set_aio_context(bs, new_context, blk->root,
>                                                    errp);
>               if (ret < 0) {
> +                bdrv_unref(bs);
>                   return ret;
>               }
>           }
> @@ -2057,6 +2064,8 @@ static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
>               throttle_group_attach_aio_context(tgm, new_context);
>               bdrv_drained_end(bs);
>           }
> +
> +        bdrv_unref(bs);
>       }
>   
>       blk->ctx = new_context;
> @@ -2326,11 +2335,13 @@ void blk_io_limits_disable(BlockBackend *blk)
>       ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
>       assert(tgm->throttle_state);
>       if (bs) {
> +        bdrv_ref(bs);
>           bdrv_drained_begin(bs);
>       }
>       throttle_group_unregister_tgm(tgm);
>       if (bs) {
>           bdrv_drained_end(bs);
> +        bdrv_unref(bs);
>       }
>   }
>   


