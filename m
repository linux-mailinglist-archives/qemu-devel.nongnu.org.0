Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E94752A4F7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:34:34 +0200 (CEST)
Received: from localhost ([::1]:36092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyHQ-0003AB-Iy
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyCg-0005DF-BK; Tue, 17 May 2022 10:29:38 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:39605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyCd-00080y-Il; Tue, 17 May 2022 10:29:38 -0400
Received: by mail-ej1-x636.google.com with SMTP id tk15so11565046ejc.6;
 Tue, 17 May 2022 07:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Xc2VF3b1WxrtvcWnwFH1p2w5rk+TI2Kp87oH+vpwb2s=;
 b=MnbB9zJDlq/3L95qcYu7VOdW4y3cLO0nKZYkBpndj6fvEaDcQUGbaJtxw4sadYwNMA
 07APe5X17YobCsUvteWv0szA0T8dadDMGUmdNqTjKMiF3iU2aNgYh4W3uQxpTZgTYJcb
 f/leLJLrifFhmWvrkfOvVET8L8d0/pHKIT/LykFw7x1tjRqBx/epjun1geFco23v+iEI
 1HOIcpRZcJlvA3NmE9e1DwEjFxlrS0reDYp3QYWeDuEfrRgwyOw0A5RuQs3ChMVz+WWv
 VNeStnGL4K1QAIv1pwOBAC5N2y5LxWutK69Fi/SpvwlfpEYOPfPni3M3AvT/Qe3DDSa8
 3tlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Xc2VF3b1WxrtvcWnwFH1p2w5rk+TI2Kp87oH+vpwb2s=;
 b=Rfg1va97INlKlUI8Rbe3VPrBLY0vPHXJ3MlbrtUUKWq7dwHvKTBYr+D0DIuqa7+3Cf
 IztaV+LeGDZhd5cFQ2zwmMqs2SzmiUweOSfqHcgh+6g2bPjDbUIu4gLVblavFzDQQDWf
 Na5LNJeRnvVtTVPBwWHV76+AZgW7RDZF5c4SV8RWtGax487vTlTIMudoDaKchse4qnss
 mhvewcCWCV78wnAYMp6Jy9m9WB6ILmHGJHRpgGNAhaEj3N1VT3j94zrmyubuvkEFyd/v
 d3hw5DU2vcpoIyCVdtP3cgTkZXoaCqDFGRFWGXYV/nWF91AcKBlWgH0mAYcp0Z8RSOED
 nU7g==
X-Gm-Message-State: AOAM532HII8enhMcar8LYj9rykHStMK5S550AXt/6h/kqyebSJRfqvHs
 5sFjMmmohB/nUeKH6WEE3SU=
X-Google-Smtp-Source: ABdhPJxWydRcXMyTolmICD2Cvj/WscmXhPGIFmVJ5s21/w9sq0VlA4tEwsLQOEA6qYLTrVhcBP9Omg==
X-Received: by 2002:a17:907:3e8e:b0:6f4:ff62:a399 with SMTP id
 hs14-20020a1709073e8e00b006f4ff62a399mr21159236ejc.298.1652797773953; 
 Tue, 17 May 2022 07:29:33 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 er22-20020a170907739600b006f3ef214e29sm1125265ejc.143.2022.05.17.07.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:29:33 -0700 (PDT)
Message-ID: <07498980-ce5a-caa7-959d-b82b77d30d2b@redhat.com>
Date: Tue, 17 May 2022 16:29:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 17/18] block: Reorganize some declarations in
 block-backend-io.h
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113907.200001-6-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220517113907.200001-6-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
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

On 5/17/22 13:39, Alberto Faria wrote:
> Keep generated_co_wrapper and coroutine_fn pairs together. This should
> make it clear that each I/O function has these two versions.
> 
> Also move blk_co_{pread,pwrite}()'s implementations out of the header
> file for consistency.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> ---
>   block/block-backend.c             | 22 ++++++++
>   include/sysemu/block-backend-io.h | 87 +++++++++++++------------------
>   2 files changed, 59 insertions(+), 50 deletions(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 52be1d9116..920ba0dd1f 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1318,6 +1318,17 @@ blk_co_do_preadv_part(BlockBackend *blk, int64_t offset, int64_t bytes,
>       return ret;
>   }
>   
> +int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset, int64_t bytes,
> +                              void *buf, BdrvRequestFlags flags)
> +{
> +    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
> +    IO_OR_GS_CODE();
> +
> +    assert(bytes <= SIZE_MAX);
> +
> +    return blk_co_preadv(blk, offset, bytes, &qiov, flags);
> +}
> +
>   int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
>                                  int64_t bytes, QEMUIOVector *qiov,
>                                  BdrvRequestFlags flags)
> @@ -1399,6 +1410,17 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
>       return ret;
>   }
>   
> +int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
> +                               const void *buf, BdrvRequestFlags flags)
> +{
> +    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
> +    IO_OR_GS_CODE();
> +
> +    assert(bytes <= SIZE_MAX);
> +
> +    return blk_co_pwritev(blk, offset, bytes, &qiov, flags);
> +}
> +
>   int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
>                                   int64_t bytes, QEMUIOVector *qiov,
>                                   BdrvRequestFlags flags)
> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
> index 004493ec36..30ed979fb1 100644
> --- a/include/sysemu/block-backend-io.h
> +++ b/include/sysemu/block-backend-io.h
> @@ -88,11 +88,6 @@ uint32_t blk_get_request_alignment(BlockBackend *blk);
>   uint32_t blk_get_max_transfer(BlockBackend *blk);
>   uint64_t blk_get_max_hw_transfer(BlockBackend *blk);
>   
> -int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
> -                                   BlockBackend *blk_out, int64_t off_out,
> -                                   int64_t bytes, BdrvRequestFlags read_flags,
> -                                   BdrvRequestFlags write_flags);
> -
>   
>   /*
>    * "I/O or GS" API functions. These functions can run without
> @@ -105,9 +100,16 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
>   int generated_co_wrapper blk_pread(BlockBackend *blk, int64_t offset,
>                                      int64_t bytes, void *buf,
>                                      BdrvRequestFlags flags);
> -int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
> -                                    int64_t bytes, const void *buf,
> +int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset, int64_t bytes,
> +                              void *buf, BdrvRequestFlags flags);
> +
> +int generated_co_wrapper blk_preadv(BlockBackend *blk, int64_t offset,
> +                                    int64_t bytes, QEMUIOVector *qiov,
>                                       BdrvRequestFlags flags);
> +int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
> +                               int64_t bytes, QEMUIOVector *qiov,
> +                               BdrvRequestFlags flags);
> +
>   int generated_co_wrapper blk_preadv_part(BlockBackend *blk, int64_t offset,
>                                            int64_t bytes, QEMUIOVector *qiov,
>                                            size_t qiov_offset,
> @@ -115,12 +117,20 @@ int generated_co_wrapper blk_preadv_part(BlockBackend *blk, int64_t offset,
>   int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
>                                       int64_t bytes, QEMUIOVector *qiov,
>                                       size_t qiov_offset, BdrvRequestFlags flags);
> -int generated_co_wrapper blk_preadv(BlockBackend *blk, int64_t offset,
> -                                    int64_t bytes, QEMUIOVector *qiov,
> +
> +int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
> +                                    int64_t bytes, const void *buf,
>                                       BdrvRequestFlags flags);
> -int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
> -                               int64_t bytes, QEMUIOVector *qiov,
> -                               BdrvRequestFlags flags);
> +int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
> +                               const void *buf, BdrvRequestFlags flags);
> +
> +int generated_co_wrapper blk_pwritev(BlockBackend *blk, int64_t offset,
> +                                     int64_t bytes, QEMUIOVector *qiov,
> +                                     BdrvRequestFlags flags);
> +int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
> +                                int64_t bytes, QEMUIOVector *qiov,
> +                                BdrvRequestFlags flags);
> +
>   int generated_co_wrapper blk_pwritev_part(BlockBackend *blk, int64_t offset,
>                                             int64_t bytes, QEMUIOVector *qiov,
>                                             size_t qiov_offset,
> @@ -129,36 +139,18 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
>                                        int64_t bytes,
>                                        QEMUIOVector *qiov, size_t qiov_offset,
>                                        BdrvRequestFlags flags);
> -int generated_co_wrapper blk_pwritev(BlockBackend *blk, int64_t offset,
> -                                     int64_t bytes, QEMUIOVector *qiov,
> -                                     BdrvRequestFlags flags);
> -int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
> -                                int64_t bytes, QEMUIOVector *qiov,
> -                                BdrvRequestFlags flags);
> -
> -static inline int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset,
> -                                            int64_t bytes, void *buf,
> -                                            BdrvRequestFlags flags)
> -{
> -    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
> -    IO_OR_GS_CODE();
>   
> -    assert(bytes <= SIZE_MAX);
> -
> -    return blk_co_preadv(blk, offset, bytes, &qiov, flags);
> -}
> -
> -static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
> -                                             int64_t bytes, const void *buf,
> -                                             BdrvRequestFlags flags)
> -{
> -    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
> -    IO_OR_GS_CODE();
> -
> -    assert(bytes <= SIZE_MAX);
> +int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
> +                                               int64_t offset, int64_t bytes,
> +                                               const void *buf);
> +int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
> +                                          int64_t bytes, const void *buf);
>   
> -    return blk_co_pwritev(blk, offset, bytes, &qiov, flags);
> -}
> +int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
> +                                           int64_t bytes,
> +                                           BdrvRequestFlags flags);
> +int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
> +                                      int64_t bytes, BdrvRequestFlags flags);
>   
>   int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offset,
>                                         int64_t bytes);
> @@ -173,16 +165,6 @@ int generated_co_wrapper blk_ioctl(BlockBackend *blk, unsigned long int req,
>   int coroutine_fn blk_co_ioctl(BlockBackend *blk, unsigned long int req,
>                                 void *buf);
>   
> -int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
> -                                               int64_t offset, int64_t bytes,
> -                                               const void *buf);
> -int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
> -                                          int64_t bytes, const void *buf);
> -int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
> -                                           int64_t bytes,
> -                                           BdrvRequestFlags flags);
> -int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
> -                                      int64_t bytes, BdrvRequestFlags flags);
>   int generated_co_wrapper blk_truncate(BlockBackend *blk, int64_t offset,
>                                         bool exact, PreallocMode prealloc,
>                                         BdrvRequestFlags flags, Error **errp);
> @@ -190,4 +172,9 @@ int coroutine_fn blk_co_truncate(BlockBackend *blk, int64_t offset, bool exact,
>                                    PreallocMode prealloc, BdrvRequestFlags flags,
>                                    Error **errp);
>   
> +int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
> +                                   BlockBackend *blk_out, int64_t off_out,
> +                                   int64_t bytes, BdrvRequestFlags read_flags,
> +                                   BdrvRequestFlags write_flags);
> +
>   #endif /* BLOCK_BACKEND_IO_H */


