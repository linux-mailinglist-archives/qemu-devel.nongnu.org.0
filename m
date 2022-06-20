Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AF25522C4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:31:42 +0200 (CEST)
Received: from localhost ([::1]:43862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3LFU-0002aj-2Z
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o3LEI-0001q4-OX
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:30:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o3LEC-0006SN-WC
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:30:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655746219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JekTRJu+Dab5DiMy+XjKUBzN59D0vLArtVdg2RgjGM8=;
 b=OR0agFDAsH28mLLOjPEjqxhtJxxb7y3lpkzuG+9NoCFFLneLbR1Jr8Hl0f1IgjJKeJndtC
 ZPKeRhfQ7OafMCW836otUw1E5J7ox+lDSYERVMXdSlzchHjmj3kNZI7t7bx/AwkxGVCw3s
 zOUBfAilHbw9yvnS5WfCSD+JNpiZ3LA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-51BlffuBOim83E2pL3WSZA-1; Mon, 20 Jun 2022 13:30:16 -0400
X-MC-Unique: 51BlffuBOim83E2pL3WSZA-1
Received: by mail-wm1-f70.google.com with SMTP id
 2-20020a1c0202000000b0039c94528746so7153952wmc.6
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=JekTRJu+Dab5DiMy+XjKUBzN59D0vLArtVdg2RgjGM8=;
 b=8E4VH7AjS8Tc2zJH6jILV/jp+TKImarVLVS4D2+nwZSGEMV3ge5o+8hrmIB7wIVR0x
 lalsCz3+0kZhA8RJW7FJJ5SPgjsnJoBhobvewc9FWwwt6VueUdFmJVR5iVQHL41KirU1
 zcDpC9996wBFm/Mmq7QeUWikZ+1b5NnQXiHPP1YQB9yUV83AJeSTegtE/mAVujOqwLBF
 CWVG6RZ/Sj97tvhmN/8n2QZikmbJn5Lzg0n3q4f1K9D1z0sEhj21JYzhr6Ny5sR3DdFy
 NAjwUU+M9qpJT9240QNgTEUFg5cz579tjOqKiBIwBTBs95rpFHvBXCRZUNeEJgpxHvXX
 +V7Q==
X-Gm-Message-State: AOAM533cBCHo/oMzF8BOT1MUKCXTvUyeQUGl6WRU+AO12Z8CjIp1Nxno
 tIMx1MCFCBBmDQ6/GT5jqmlC7ojNBSR65S8PTghBXvI8Zi1hWxjbhTGC3+3xu9eIOeL08NA5g4Z
 ZLzT3+6fhWtgpK3M=
X-Received: by 2002:a05:600c:4f95:b0:39c:9897:5290 with SMTP id
 n21-20020a05600c4f9500b0039c98975290mr36466377wmq.149.1655746213770; 
 Mon, 20 Jun 2022 10:30:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlSzxQAtGYNrTVbc/dmbkLS2ZvrEkxaDqFk8pCk3Mv4bN2cXDr2+SMwHSjn1KAZosyXm8ZkA==
X-Received: by 2002:a05:600c:4f95:b0:39c:9897:5290 with SMTP id
 n21-20020a05600c4f9500b0039c98975290mr36466351wmq.149.1655746213542; 
 Mon, 20 Jun 2022 10:30:13 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 v1-20020a5d6781000000b0021b93b29cacsm2283538wru.99.2022.06.20.10.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:30:13 -0700 (PDT)
Date: Mon, 20 Jun 2022 18:30:11 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] migration: Remove RDMA_UNREGISTRATION_EXAMPLE
Message-ID: <YrCuoxF6iPWQxh4q@work-vm>
References: <20220620150918.57471-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220620150918.57471-1-quintela@redhat.com>
User-Agent: Mutt/2.2.5 (2022-05-16)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Nobody has ever showed up to unregister individual pages, and another
> set of patches written by Daniel P. Berrangé <berrange@redhat.com>
> just remove qemu_rdma_signal_unregister() function needed here.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/rdma.c | 41 -----------------------------------------
>  1 file changed, 41 deletions(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 672d1958a9..8504152f39 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -1370,30 +1370,6 @@ const char *print_wrid(int wrid)
>      return wrid_desc[wrid];
>  }
>  
> -/*
> - * RDMA requires memory registration (mlock/pinning), but this is not good for
> - * overcommitment.
> - *
> - * In preparation for the future where LRU information or workload-specific
> - * writable writable working set memory access behavior is available to QEMU
> - * it would be nice to have in place the ability to UN-register/UN-pin
> - * particular memory regions from the RDMA hardware when it is determine that
> - * those regions of memory will likely not be accessed again in the near future.
> - *
> - * While we do not yet have such information right now, the following
> - * compile-time option allows us to perform a non-optimized version of this
> - * behavior.
> - *
> - * By uncommenting this option, you will cause *all* RDMA transfers to be
> - * unregistered immediately after the transfer completes on both sides of the
> - * connection. This has no effect in 'rdma-pin-all' mode, only regular mode.
> - *
> - * This will have a terrible impact on migration performance, so until future
> - * workload information or LRU information is available, do not attempt to use
> - * this feature except for basic testing.
> - */
> -/* #define RDMA_UNREGISTRATION_EXAMPLE */
> -
>  /*
>   * Perform a non-optimized memory unregistration after every transfer
>   * for demonstration purposes, only if pin-all is not requested.
> @@ -1571,18 +1547,6 @@ static uint64_t qemu_rdma_poll(RDMAContext *rdma, struct ibv_cq *cq,
>          if (rdma->nb_sent > 0) {
>              rdma->nb_sent--;
>          }
> -
> -        if (!rdma->pin_all) {
> -            /*
> -             * FYI: If one wanted to signal a specific chunk to be unregistered
> -             * using LRU or workload-specific information, this is the function
> -             * you would call to do so. That chunk would then get asynchronously
> -             * unregistered later.
> -             */
> -#ifdef RDMA_UNREGISTRATION_EXAMPLE
> -            qemu_rdma_signal_unregister(rdma, index, chunk, wc.wr_id);
> -#endif
> -        }
>      } else {
>          trace_qemu_rdma_poll_other(print_wrid(wr_id), wr_id, rdma->nb_sent);
>      }
> @@ -2137,11 +2101,6 @@ retry:
>  
>      chunk_end = ram_chunk_end(block, chunk + chunks);
>  
> -    if (!rdma->pin_all) {
> -#ifdef RDMA_UNREGISTRATION_EXAMPLE
> -        qemu_rdma_unregister_waiting(rdma);
> -#endif
> -    }
>  
>      while (test_bit(chunk, block->transit_bitmap)) {
>          (void)count;
> -- 
> 2.35.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


