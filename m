Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E51FF530B03
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 10:12:21 +0200 (CEST)
Received: from localhost ([::1]:60952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt3Aq-0002Cu-8O
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 04:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nt31n-0008C7-El
 for qemu-devel@nongnu.org; Mon, 23 May 2022 04:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nt31j-0001BZ-Dk
 for qemu-devel@nongnu.org; Mon, 23 May 2022 04:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653292974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SzcFpesy3GNeXBCHGs8eHw/uo3jwebvAmETs+BryBOE=;
 b=RD/smr1VQdI5U2wwwqp5BunQ90+YcORAp5aBScsjcvbApBSW24iIploHvPPnYmMF2jFWBd
 9avi4wQWjSyqXohC6pWBa5P9ppdDAnjEPRmcS8co4GekAYRcbKnm+jG6ootd48v6H3ckS/
 ZMBsCv0w9tCaQqCWdass8/9ipbSpQLY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-CTuAfBUcNz-_1vnARXlubg-1; Mon, 23 May 2022 04:02:53 -0400
X-MC-Unique: CTuAfBUcNz-_1vnARXlubg-1
Received: by mail-wr1-f72.google.com with SMTP id
 z5-20020a5d4d05000000b0020e6457f2b4so3289143wrt.1
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 01:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SzcFpesy3GNeXBCHGs8eHw/uo3jwebvAmETs+BryBOE=;
 b=3sTI47YmUo8ZMiQcTtfSyvyJgDrM/fJGGiXCoGFhIUbjOJ4Z5u6DDwwh97jpiz+Ft8
 0R3vDmK9WLnLS3kU9+mz31FxSfg17utfiYMXx46ydFLRf8cuiXe/l9WDnoP0Q/RTNrxE
 DOqyh7Pttofdm0bscJkCPovpuhDIzXnDY54VP1GLNe45pTPb1CiwyfFZ+9CnacYBmgXw
 palR8e5aTgFJM71zlx6U+fABYFsgadhozIUmNbbNKim2AbIj//jtOiLkgM/t6oZUlYI2
 LfyXw9LXJnRK5ueZQ9W7HsdoZipq/dROllOY/Hofy8dYCLArFjILr0xpOy5HAoD2sST0
 1Ohg==
X-Gm-Message-State: AOAM533MS9/glFoWFLCXrW5swMx2bzvvZW4Y4nbrQmJc8JYZkPOdjzLC
 U16UuW6chrtCwlj63Bhpsk5iQkCcSdXcAUNzivplAEtUNr+YdBBbIQUS5oKFJfWqRtgS2VvfzL+
 34AaMB0FoDOhE0vM=
X-Received: by 2002:a5d:584b:0:b0:20c:6317:1f77 with SMTP id
 i11-20020a5d584b000000b0020c63171f77mr18240351wrf.355.1653292971765; 
 Mon, 23 May 2022 01:02:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwivvofTazccRnFEpBzWclDpt3Vai1to356puEK0t06Cr4IMV/icqWKYZRVmB4L/RGuGwR93w==
X-Received: by 2002:a5d:584b:0:b0:20c:6317:1f77 with SMTP id
 i11-20020a5d584b000000b0020c63171f77mr18240322wrf.355.1653292971371; 
 Mon, 23 May 2022 01:02:51 -0700 (PDT)
Received: from [192.168.149.183]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 i17-20020adfaad1000000b0020d0c37b350sm11120428wrc.27.2022.05.23.01.02.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 01:02:50 -0700 (PDT)
Message-ID: <d610a1f6-db5a-28c8-2cb7-5c383053b512@redhat.com>
Date: Mon, 23 May 2022 10:02:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] block: drop unused bdrv_co_drain() API
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Alberto Faria <afaria@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20220521122714.3837731-1-stefanha@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20220521122714.3837731-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 21/05/2022 um 14:27 schrieb Stefan Hajnoczi:
> bdrv_co_drain() has not been used since commit 9a0cec664eef ("mirror:
> use bdrv_drained_begin/bdrv_drained_end") in 2016. Remove it so there
> are fewer drain scenarios to worry about.
> 
> Use bdrv_drained_begin()/bdrv_drained_end() instead. They are "mixed"
> functions that can be called from coroutine context. Unlike
> bdrv_co_drain(), these functions provide control of the length of the
> drained section, which is usually the right thing.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Thank you,
Emanuele

> ---
>  include/block/block-io.h |  1 -
>  block/io.c               | 15 ---------------
>  2 files changed, 16 deletions(-)
> 
> diff --git a/include/block/block-io.h b/include/block/block-io.h
> index 62c84f0519..053a27141a 100644
> --- a/include/block/block-io.h
> +++ b/include/block/block-io.h
> @@ -270,7 +270,6 @@ void bdrv_drained_end_no_poll(BlockDriverState *bs, int *drained_end_counter);
>                     cond); })
>  
>  void bdrv_drain(BlockDriverState *bs);
> -void coroutine_fn bdrv_co_drain(BlockDriverState *bs);
>  
>  int generated_co_wrapper
>  bdrv_truncate(BdrvChild *child, int64_t offset, bool exact,
> diff --git a/block/io.c b/block/io.c
> index 789e6373d5..1e9bf09a49 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -588,21 +588,6 @@ void bdrv_unapply_subtree_drain(BdrvChild *child, BlockDriverState *old_parent)
>      BDRV_POLL_WHILE(child->bs, qatomic_read(&drained_end_counter) > 0);
>  }
>  
> -/*
> - * Wait for pending requests to complete on a single BlockDriverState subtree,
> - * and suspend block driver's internal I/O until next request arrives.
> - *
> - * Note that unlike bdrv_drain_all(), the caller must hold the BlockDriverState
> - * AioContext.
> - */
> -void coroutine_fn bdrv_co_drain(BlockDriverState *bs)
> -{
> -    IO_OR_GS_CODE();
> -    assert(qemu_in_coroutine());
> -    bdrv_drained_begin(bs);
> -    bdrv_drained_end(bs);
> -}
> -
>  void bdrv_drain(BlockDriverState *bs)
>  {
>      IO_OR_GS_CODE();
> 


