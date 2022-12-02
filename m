Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E48F6407D5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 14:43:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p16JB-0001o4-ET; Fri, 02 Dec 2022 08:42:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p16J8-0001nX-8i
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 08:42:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p16J5-0007l1-PZ
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 08:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669988542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Zo6Ye7qtksKaVvrbusy1zu4YJyh5/bxw70BTaOIBUw=;
 b=OAPzSru5Z6zfjypcLWPjEvdM/1zgbR/vG836doJNswW7OR/RIvrMw2uFXhWdnzXWFa5D4R
 +TqMvdMHSZSHRXvLsY7RMxkw2HvLDgdq/T7mFoDNBlvOExOUnMeRM6W8Umom7FlA1XK8Fc
 ydEv8Ck28xJn5S/Q5oSDWlgeHEKejdA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-60-5CDS-05YPhGuIoe66uSBEQ-1; Fri, 02 Dec 2022 08:42:21 -0500
X-MC-Unique: 5CDS-05YPhGuIoe66uSBEQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 p14-20020a05600c204e00b003cf4cce4da5so1950017wmg.0
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 05:42:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Zo6Ye7qtksKaVvrbusy1zu4YJyh5/bxw70BTaOIBUw=;
 b=enL/2nzG8oYNEjwRBs7Efu3QLR4AC+yoRqlBgrr8hAbqGhXoskj8JRgvFNezHxO/wP
 8KRN19O62OsOmizXcNEIKABEjAzTdhJKLVV7JBPbFAyFeC1JuW2ujLQS+pTNtGSGAXjj
 WqZuk7hQTmutoCIhIXU8YhORH+lymwXit1ETkEcnl4+vLeRk8PBM7dPT1BDmBeNXim21
 B3/WFijJy/yQ9P2sBDBlEVwQjbj4uL2OgQGGp1wbQWsSQ5EPOrvk3+d4AimZgCTH8u93
 Iwg7V3kZUd5bfFh/Uq8I5Q8FisnWFYAI1PC9mbj6JQ1BPFxDxAYa77zb8+zBaOQUp6ip
 eunw==
X-Gm-Message-State: ANoB5pmVYx1y3ivFu8qBWMljjd/GupHsgvApPJpdu/KUVKnHm2qShHR+
 /Y7z+CjBc8uVyzPYvlblj8GmK2/JUwQwk4mCTX589Y3jAYXcRHmOvITWLi69YiZJcQRLumh0B1k
 L/EiebIkYdz9zZos=
X-Received: by 2002:a05:600c:4fd6:b0:3cf:d952:db2b with SMTP id
 o22-20020a05600c4fd600b003cfd952db2bmr34876316wmq.19.1669988540232; 
 Fri, 02 Dec 2022 05:42:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7tDWoJJzcd5u6CIINfpaxx8V0E4U4r9obry12xwiKeGDr9qjuQ9TJb/lxOQwGQvFw093HWeQ==
X-Received: by 2002:a05:600c:4fd6:b0:3cf:d952:db2b with SMTP id
 o22-20020a05600c4fd600b003cfd952db2bmr34876306wmq.19.1669988539937; 
 Fri, 02 Dec 2022 05:42:19 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 o16-20020adfead0000000b00241cfa9333fsm7195349wrn.5.2022.12.02.05.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 05:42:19 -0800 (PST)
Message-ID: <632abcb8-3a66-2b93-eb33-ef12953abd18@redhat.com>
Date: Fri, 2 Dec 2022 14:42:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH] test-bdrv-drain: keep graph manipulations out of
 coroutines
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, kwolf@redhat.com
References: <20221202132701.531048-1-pbonzini@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221202132701.531048-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.258, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 02/12/2022 um 14:27 schrieb Paolo Bonzini:
> Changes to the BlockDriverState graph will have to take the
> corresponding lock for writing, and therefore cannot be done
> inside a coroutine.  Move them outside the test body.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/unit/test-bdrv-drain.c | 63 ++++++++++++++++++++++++++----------
>  1 file changed, 46 insertions(+), 17 deletions(-)
> 
> diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
> index 6ae44116fe79..d85083dd4f9e 100644
> --- a/tests/unit/test-bdrv-drain.c
> +++ b/tests/unit/test-bdrv-drain.c
> @@ -199,25 +199,40 @@ static void do_drain_end_unlocked(enum drain_type drain_type, BlockDriverState *
>      }
>  }
>  
> +static BlockBackend *blk;
> +static BlockDriverState *bs, *backing;
> +
> +static void test_drv_cb_init(void)
> +{
> +    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
> +    bs = bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
> +                              &error_abort);
> +    blk_insert_bs(blk, bs, &error_abort);
> +
> +    backing = bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_abort);
> +    bdrv_set_backing_hd(bs, backing, &error_abort);
> +}
> +
> +static void test_drv_cb_fini(void)

fini stands for "finito"? :)

Anyways, an alternative solution for this is also here (probably coming
from you too):
https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03517.html

Thank you,
Emanuele

> +{
> +    bdrv_unref(backing);
> +    bdrv_unref(bs);
> +    blk_unref(blk);
> +    backing = NULL;
> +    bs = NULL;
> +    blk = NULL;
> +}
> +
>  static void test_drv_cb_common(enum drain_type drain_type, bool recursive)
>  {
> -    BlockBackend *blk;
> -    BlockDriverState *bs, *backing;
>      BDRVTestState *s, *backing_s;
>      BlockAIOCB *acb;
>      int aio_ret;
>  
>      QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, NULL, 0);
>  
> -    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
> -    bs = bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
> -                              &error_abort);
>      s = bs->opaque;
> -    blk_insert_bs(blk, bs, &error_abort);
> -
> -    backing = bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_abort);
>      backing_s = backing->opaque;
> -    bdrv_set_backing_hd(bs, backing, &error_abort);
>  
>      /* Simple bdrv_drain_all_begin/end pair, check that CBs are called */
>      g_assert_cmpint(s->drain_count, ==, 0);
> @@ -252,30 +267,44 @@ static void test_drv_cb_common(enum drain_type drain_type, bool recursive)
>  
>      g_assert_cmpint(s->drain_count, ==, 0);
>      g_assert_cmpint(backing_s->drain_count, ==, 0);
> -
> -    bdrv_unref(backing);
> -    bdrv_unref(bs);
> -    blk_unref(blk);
>  }
>  
> -static void test_drv_cb_drain_all(void)
> +static void test_drv_cb_do_drain_all(void)
>  {
>      test_drv_cb_common(BDRV_DRAIN_ALL, true);
>  }
>  
> -static void test_drv_cb_drain(void)
> +static void test_drv_cb_do_drain(void)
>  {
>      test_drv_cb_common(BDRV_DRAIN, false);
>  }
>  
> +static void test_drv_cb_drain_all(void)
> +{
> +    test_drv_cb_init();
> +    test_drv_cb_do_drain_all();
> +    test_drv_cb_fini();
> +}
> +
> +static void test_drv_cb_drain(void)
> +{
> +    test_drv_cb_init();
> +    test_drv_cb_do_drain();
> +    test_drv_cb_fini();
> +}
> +
>  static void test_drv_cb_co_drain_all(void)
>  {
> -    call_in_coroutine(test_drv_cb_drain_all);
> +    test_drv_cb_init();
> +    call_in_coroutine(test_drv_cb_do_drain_all);
> +    test_drv_cb_fini();
>  }
>  
>  static void test_drv_cb_co_drain(void)
>  {
> -    call_in_coroutine(test_drv_cb_drain);
> +    test_drv_cb_init();
> +    call_in_coroutine(test_drv_cb_do_drain);
> +    test_drv_cb_fini();
>  }
>  
>  static void test_quiesce_common(enum drain_type drain_type, bool recursive)
> 


