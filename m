Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633B8543AFF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 20:01:43 +0200 (CEST)
Received: from localhost ([::1]:38898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyzzx-0000ol-5D
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 14:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyzy0-0008JQ-PH
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 13:59:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyzxy-0001th-CM
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 13:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654711177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6h+fwLL6afS9UTIKB2Cf6oTrogRylh5y0FT3qnOCZqw=;
 b=MNLPZPQgvJAvO5lc0u7WSd3dYuPVCPRDmf6grIrFov/pKEVySo9AvgtXBCkZSnI3lPP0o0
 TDz81rqbj0Y5j0SLK6gjHAKd+fZhbYS4zmB4mP39r838plfEmm8jJqOzxOEJ8Pt8HhRuhl
 DmVypulQ28fm6F32lyBUIfLzL4Y10k4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-1fKhEJSHMmSWtpqGfReAJQ-1; Wed, 08 Jun 2022 13:59:36 -0400
X-MC-Unique: 1fKhEJSHMmSWtpqGfReAJQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m22-20020a7bcb96000000b0039c4f6ade4dso2582241wmi.8
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 10:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=6h+fwLL6afS9UTIKB2Cf6oTrogRylh5y0FT3qnOCZqw=;
 b=6/YgHJUuwaLDUf5CqfMp3Ozxfbt4sBRcgcsZfH6h2R4e0uRBgaU0hAAlFMbPLzNZk9
 thxTLNHqSG9SpRTNw/wOtHeOxvrwSyIFjDZWzffPILDOA2oWpiFK/3642jh3De7VKrcx
 79ZADRT6jcpI+AmhkLqkIBMWgPSIebaI0XP0sM5M13e5DdiAfr60vvn8/RtRd8tN3P+A
 CLo8CmITilqFeO2U1A9Gr/XcXmqijp9ctusZH4nngcbLaB87nYaKAbccvZF1W+Y7Cpet
 K3NvfdYcN8+gNkcr4YAKpGoKm5jhgA2dLLYMP3GlDorpSCAsTFXwdnA96GlJnrgqja1a
 cWeA==
X-Gm-Message-State: AOAM5330w+MezYv/yeUAINnWffeVJxycBw692AvBd98oJ00DVlhtX4VX
 E5TTxmMmnMUDG8Jd2pZdxB+HM4FhSMpQ+XwHjVxKbYsz6qu08OZetFIRMHz65ZEQQ9bI+8/Yhym
 3QRNlMwleEgyFO74=
X-Received: by 2002:a05:600c:4f90:b0:394:970a:71bd with SMTP id
 n16-20020a05600c4f9000b00394970a71bdmr416220wmq.158.1654711174720; 
 Wed, 08 Jun 2022 10:59:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3RaokvMhwObczuRKdKk4818oHHFDYOc35GK+pMZp5z9Nokdtaa/JBbi8a3NbQo5pfCFI4FQ==
X-Received: by 2002:a05:600c:4f90:b0:394:970a:71bd with SMTP id
 n16-20020a05600c4f9000b00394970a71bdmr416191wmq.158.1654711174370; 
 Wed, 08 Jun 2022 10:59:34 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 j3-20020adfea43000000b0020d02262664sm21585668wrn.25.2022.06.08.10.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 10:59:33 -0700 (PDT)
Date: Wed, 8 Jun 2022 18:59:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 03/20] migration: remove unreachble RDMA code in
 save_hook impl
Message-ID: <YqDjggpJz2A5cIPy@work-vm>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-4-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524110235.145079-4-berrange@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> The QEMUFile 'save_hook' callback has a 'size_t size' parameter.
> 
> The RDMA impl of this has logic that takes different actions
> depending on whether the value is zero or non-zero. It has
> commented out logic that would have taken further actions
> if the value was negative.
> 
> The only place where the 'save_hook' callback is invoked is
> the ram_control_save_page() method, which passes 'size'
> through from its caller. The only caller of this method is
> in turn control_save_page(). This method unconditionally
> passes the 'TARGET_PAGE_SIZE' constant for the 'size' parameter.
> 
> IOW, the only scenario for 'size' that can execute in the
> qemu_rdma_save_page method is 'size > 0'. The remaining code
> has been unreachable since RDMA support was first introduced
> 9 years ago.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Ah good; less rdma code!



Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/rdma.c | 120 +++++++++--------------------------------------
>  1 file changed, 21 insertions(+), 99 deletions(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 672d1958a9..6e7756bee7 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -1486,34 +1486,6 @@ static uint64_t qemu_rdma_make_wrid(uint64_t wr_id, uint64_t index,
>      return result;
>  }
>  
> -/*
> - * Set bit for unregistration in the next iteration.
> - * We cannot transmit right here, but will unpin later.
> - */
> -static void qemu_rdma_signal_unregister(RDMAContext *rdma, uint64_t index,
> -                                        uint64_t chunk, uint64_t wr_id)
> -{
> -    if (rdma->unregistrations[rdma->unregister_next] != 0) {
> -        error_report("rdma migration: queue is full");
> -    } else {
> -        RDMALocalBlock *block = &(rdma->local_ram_blocks.block[index]);
> -
> -        if (!test_and_set_bit(chunk, block->unregister_bitmap)) {
> -            trace_qemu_rdma_signal_unregister_append(chunk,
> -                                                     rdma->unregister_next);
> -
> -            rdma->unregistrations[rdma->unregister_next++] =
> -                    qemu_rdma_make_wrid(wr_id, index, chunk);
> -
> -            if (rdma->unregister_next == RDMA_SIGNALED_SEND_MAX) {
> -                rdma->unregister_next = 0;
> -            }
> -        } else {
> -            trace_qemu_rdma_signal_unregister_already(chunk);
> -        }
> -    }
> -}
> -
>  /*
>   * Consult the connection manager to see a work request
>   * (of any kind) has completed.
> @@ -3278,23 +3250,7 @@ qio_channel_rdma_shutdown(QIOChannel *ioc,
>   *        Offset is an offset to be added to block_offset and used
>   *        to also lookup the corresponding RAMBlock.
>   *
> - *    @size > 0 :
> - *        Initiate an transfer this size.
> - *
> - *    @size == 0 :
> - *        A 'hint' or 'advice' that means that we wish to speculatively
> - *        and asynchronously unregister this memory. In this case, there is no
> - *        guarantee that the unregister will actually happen, for example,
> - *        if the memory is being actively transmitted. Additionally, the memory
> - *        may be re-registered at any future time if a write within the same
> - *        chunk was requested again, even if you attempted to unregister it
> - *        here.
> - *
> - *    @size < 0 : TODO, not yet supported
> - *        Unregister the memory NOW. This means that the caller does not
> - *        expect there to be any future RDMA transfers and we just want to clean
> - *        things up. This is used in case the upper layer owns the memory and
> - *        cannot wait for qemu_fclose() to occur.
> + *    @size : Number of bytes to transfer
>   *
>   *    @bytes_sent : User-specificed pointer to indicate how many bytes were
>   *                  sent. Usually, this will not be more than a few bytes of
> @@ -3323,61 +3279,27 @@ static size_t qemu_rdma_save_page(QEMUFile *f, void *opaque,
>  
>      qemu_fflush(f);
>  
> -    if (size > 0) {
> -        /*
> -         * Add this page to the current 'chunk'. If the chunk
> -         * is full, or the page doesn't belong to the current chunk,
> -         * an actual RDMA write will occur and a new chunk will be formed.
> -         */
> -        ret = qemu_rdma_write(f, rdma, block_offset, offset, size);
> -        if (ret < 0) {
> -            error_report("rdma migration: write error! %d", ret);
> -            goto err;
> -        }
> -
> -        /*
> -         * We always return 1 bytes because the RDMA
> -         * protocol is completely asynchronous. We do not yet know
> -         * whether an  identified chunk is zero or not because we're
> -         * waiting for other pages to potentially be merged with
> -         * the current chunk. So, we have to call qemu_update_position()
> -         * later on when the actual write occurs.
> -         */
> -        if (bytes_sent) {
> -            *bytes_sent = 1;
> -        }
> -    } else {
> -        uint64_t index, chunk;
> -
> -        /* TODO: Change QEMUFileOps prototype to be signed: size_t => long
> -        if (size < 0) {
> -            ret = qemu_rdma_drain_cq(f, rdma);
> -            if (ret < 0) {
> -                fprintf(stderr, "rdma: failed to synchronously drain"
> -                                " completion queue before unregistration.\n");
> -                goto err;
> -            }
> -        }
> -        */
> -
> -        ret = qemu_rdma_search_ram_block(rdma, block_offset,
> -                                         offset, size, &index, &chunk);
> -
> -        if (ret) {
> -            error_report("ram block search failed");
> -            goto err;
> -        }
> -
> -        qemu_rdma_signal_unregister(rdma, index, chunk, 0);
> +    /*
> +     * Add this page to the current 'chunk'. If the chunk
> +     * is full, or the page doesn't belong to the current chunk,
> +     * an actual RDMA write will occur and a new chunk will be formed.
> +     */
> +    ret = qemu_rdma_write(f, rdma, block_offset, offset, size);
> +    if (ret < 0) {
> +        error_report("rdma migration: write error! %d", ret);
> +        goto err;
> +    }
>  
> -        /*
> -         * TODO: Synchronous, guaranteed unregistration (should not occur during
> -         * fast-path). Otherwise, unregisters will process on the next call to
> -         * qemu_rdma_drain_cq()
> -        if (size < 0) {
> -            qemu_rdma_unregister_waiting(rdma);
> -        }
> -        */
> +    /*
> +     * We always return 1 bytes because the RDMA
> +     * protocol is completely asynchronous. We do not yet know
> +     * whether an  identified chunk is zero or not because we're
> +     * waiting for other pages to potentially be merged with
> +     * the current chunk. So, we have to call qemu_update_position()
> +     * later on when the actual write occurs.
> +     */
> +    if (bytes_sent) {
> +        *bytes_sent = 1;
>      }
>  
>      /*
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


