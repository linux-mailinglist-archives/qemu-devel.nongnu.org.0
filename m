Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D1F5787A6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 18:43:22 +0200 (CEST)
Received: from localhost ([::1]:57800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDTq5-0000ft-Jy
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 12:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDTmk-0004o8-IK; Mon, 18 Jul 2022 12:39:54 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:34744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDTmi-0003Fn-VO; Mon, 18 Jul 2022 12:39:54 -0400
Received: by mail-ej1-x630.google.com with SMTP id oy13so22268440ejb.1;
 Mon, 18 Jul 2022 09:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fUsx3j4xId5yQLWmvFeaX0YZauDarbCpuTrPAXXPdjM=;
 b=XeKFCAVf1SkPJ+3540fEu+ZRtxWlofN+yfOrlRvZDSW0oY43MDlLt7HGg98OiY2/Gv
 VzEcsXN3C9Q/jGmJ4pNwyIi2dwpBanFT7yyXaBSHpFZhu4GFObQef2A7SauNcrGTZnSk
 FuzVZRpYQi9QmVHfvu2r76wEnw2ilhCmrzzouTp4lBoFg2e3Pk5nZeatz6PoqoB4FTx9
 /XMtwv7gfJXEzxtZ9uzHla9SNMC46uyXnqCNpgk4IOfgLTMNgE+X33eNyKXHyY/F74Dj
 TE2VBQG9ewMZL1QGuDcYCAkzcKU/Ylb0tzxOhSsEmjHu3wgNCKywWhl8TgThaEztb9iz
 abpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fUsx3j4xId5yQLWmvFeaX0YZauDarbCpuTrPAXXPdjM=;
 b=Tk17MfdyjavxtaIVUJfWHvR+Cpv1w9GOxPyNd/RvgmipEBLfx07TF71/luniUSYBZs
 CbuW9rU1juM6fNgrOtilpaINw55wZOFtWbwHBQNO3cd62FDaQMygBYsuXDClyNFxqrPb
 RH1JhvFiqcXk4Ozm5B0mA0LltEWP9zYT5Yrf7C1YPY/i/Po+2OaxbTcztGJuuWtvRSOH
 zZLk/fpsfSyZ2JLZ0yE1NKVy423IIqim3HP3sUFrf/P2y/sYcPGuaW4UoGBsrUhTkhbZ
 gS7u0zsZcLZ3/DzEkgkzBc7JarZt3R2MJz/FbPoDT4JwdNZm9ZDaksyX6LyHD8ynAspn
 jWpg==
X-Gm-Message-State: AJIora/g6NY9iK74xwLM61HAe+pZcabhu8+4KuPZJhjF58aeIuexm/Xb
 p0bMkvKxa+cnRGEv2Axgwmo=
X-Google-Smtp-Source: AGRyM1uHaIkfP0O8vTjQOxqtD1XZ09YanwxtJDGbamljS241x5LBtvcA50wQOSOIi17W2UoBqAvGvQ==
X-Received: by 2002:a17:906:5d16:b0:72f:248d:525a with SMTP id
 g22-20020a1709065d1600b0072f248d525amr7344540ejt.441.1658162389991; 
 Mon, 18 Jul 2022 09:39:49 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 24-20020a170906329800b006fecf74395bsm5727174ejw.8.2022.07.18.09.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 09:39:49 -0700 (PDT)
Message-ID: <ea2b8793-532d-e7c1-c34f-a9ef89f8586d@redhat.com>
Date: Mon, 18 Jul 2022 18:39:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 7/8] block: use the new _change_ API instead of
 _can_set_ and _set_
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-8-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220712211911.1302836-8-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 7/12/22 23:19, Emanuele Giuseppe Esposito wrote:
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 674eaaa2bf..6e90ac3a6a 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -2184,8 +2184,12 @@ static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
>           bdrv_ref(bs);
>   
>           if (update_root_node) {
> -            ret = bdrv_child_try_set_aio_context(bs, new_context, blk->root,
> -                                                 errp);
> +            /*
> +             * update_root_node MUST be false for blk_root_set_aio_ctx_commit(),
> +             * as we are already in the commit function of a transaction.
> +             */
> +            ret = bdrv_child_try_change_aio_context(bs, new_context, blk->root,
> +                                                    errp);
>               if (ret < 0) {
>                   bdrv_unref(bs);
>                   return ret;


Looking further at blk_do_set_aio_context:

         if (tgm->throttle_state) {
             bdrv_drained_begin(bs);
             throttle_group_detach_aio_context(tgm);
             throttle_group_attach_aio_context(tgm, new_context);
             bdrv_drained_end(bs);
         }

Perhaps the drained_begin/drained_end pair can be moved to 
blk_set_aio_context?  It shouldn't be needed from the change_aio_ctx 
callback, because bs is already drained.  If so, blk_do_set_aio_context 
would become just:

      if (tgm->throttle_state) {
          throttle_group_detach_aio_context(tgm);
          throttle_group_attach_aio_context(tgm, new_context);
      }
      blk->ctx = new_context;

and blk_set_aio_context would be something like:

     if (bs) {
         bdrv_ref(bs);
         ret = bdrv_child_try_set_aio_context(bs, new_context, blk->root,
                                              errp);
         if (ret < 0) {
             goto out_no_drain;
         }
         bdrv_drained_begin(bs);
     }
     ret = blk_do_set_aio_context(blk, new_context, errp);
     if (bs) {
         bdrv_drained_end(bs);
out_no_drain;
         bdrv_unref(bs);
     }
     return ret;

Paolo

