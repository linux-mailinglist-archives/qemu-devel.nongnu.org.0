Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726C7525C81
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 09:48:26 +0200 (CEST)
Received: from localhost ([::1]:44672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npQ2D-0002PE-F9
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 03:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npPts-0006hC-3E; Fri, 13 May 2022 03:39:49 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npPtp-0002MC-IM; Fri, 13 May 2022 03:39:46 -0400
Received: by mail-ej1-x62a.google.com with SMTP id kq17so14590164ejb.4;
 Fri, 13 May 2022 00:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4zlpd61YdTxxT8Mw3fAIKRSsJQr6JLUIdn4eXvkcQxU=;
 b=PFXX2eHgSH1h3CEpDLPIrz9W9sL8bsJo0AMh2S8rq0BFiaFOrVtHThgjy+N2nA7xsJ
 zAYwKjpl/56p04jQBvN8Q/w2SgYfNo8ZNAsxz4paHDxjwKEBYdI2Zq0Y9hOLOfeFxw4c
 EUqkLGeo+L17XCXao1m7GoBw496QNy6OkVYseTCoEctPB9uzjo2o5gkOe4mH7vYDUgJk
 JKM22K8O/b974Xx4DdvDQQO/vHeU7FpziDs88R/gADW+lg+9ZynBJYf0yvNRTwvkRbEc
 Q+kDtZrtvoLPBhm0xF5aXGDlDTVIGV5oa8C9bDyw1y7WkAX+X5YZUFYfSml3yLyrUeF4
 z1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4zlpd61YdTxxT8Mw3fAIKRSsJQr6JLUIdn4eXvkcQxU=;
 b=iban+Oprplplnai9KiTMo+d8ZrNt51IufD2rIenDtQDlndlpHBd+lwP2VEm7XjmgNP
 gHyx33f9yqqWCsic7bfCFeruz2WqOLfdp340C8u4IGnQMTcwIA9EUqLyh2112+BT+4va
 VqIDEXUAWesxZAwu4zJD65Kp73D31jqIYEZCL5Sqgg2eN1VaPrpCC09sdtV9nHgAJhiD
 bt4zoZSeiQ64VNmSZmJ4uAWxUwOCfq6yiEtKsVqKuTeRuhkQG0KfMujbfDMqAldHD7f7
 3b/pWJG8VzPx71xgcd/a/zgCWYenHmY301Eibadx2Woq6Tk/sX/0Ol5W1Vcek1ipcLB4
 mudg==
X-Gm-Message-State: AOAM5325fspsnW7wsGfEam8XSTWgpqaAVkj/3SZ5UecXEqLY4xAXKS35
 9iCxNGSR6iwEqa9Qjw6yIgk=
X-Google-Smtp-Source: ABdhPJxWmiH5H8Giy5ICf6HAbyHUYc90dnRGrnayu7QEeuC4Lspkos0/mjD3uPHOgkycahM9zhDOvw==
X-Received: by 2002:a17:907:6e88:b0:6fa:888d:74a7 with SMTP id
 sh8-20020a1709076e8800b006fa888d74a7mr3088248ejc.335.1652427583759; 
 Fri, 13 May 2022 00:39:43 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a170906648c00b006f3ef214db2sm504092ejm.24.2022.05.13.00.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 00:39:43 -0700 (PDT)
Message-ID: <bcb08bee-1573-1ee8-3715-8eb3d252fd24@redhat.com>
Date: Fri, 13 May 2022 09:39:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 5/7] block: Make 'bytes' param of bdrv_co_{pread, pwrite, 
 preadv, pwritev}() an int64_t
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20220512233849.2219275-1-afaria@redhat.com>
 <20220512235103.2224817-2-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220512235103.2224817-2-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
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

On 5/13/22 01:51, Alberto Faria wrote:
> For consistency with other I/O functions, and in preparation to
> implement bdrv_{pread,pwrite}() using generated_co_wrapper.
> 
> unsigned int fits in int64_t, so all callers remain correct.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/coroutines.h           | 4 ++--
>   include/block/block_int-io.h | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/block/coroutines.h b/block/coroutines.h
> index 830ecaa733..3f41238b33 100644
> --- a/block/coroutines.h
> +++ b/block/coroutines.h
> @@ -91,11 +91,11 @@ int coroutine_fn blk_co_do_flush(BlockBackend *blk);
>    */
>   
>   int generated_co_wrapper
> -bdrv_preadv(BdrvChild *child, int64_t offset, unsigned int bytes,
> +bdrv_preadv(BdrvChild *child, int64_t offset, int64_t bytes,
>               QEMUIOVector *qiov, BdrvRequestFlags flags);
>   
>   int generated_co_wrapper
> -bdrv_pwritev(BdrvChild *child, int64_t offset, unsigned int bytes,
> +bdrv_pwritev(BdrvChild *child, int64_t offset, int64_t bytes,
>                QEMUIOVector *qiov, BdrvRequestFlags flags);
>   
>   int generated_co_wrapper
> diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
> index d4d3bed783..d1a6970dc6 100644
> --- a/include/block/block_int-io.h
> +++ b/include/block/block_int-io.h
> @@ -56,7 +56,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
>       QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags);
>   
>   static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
> -    int64_t offset, unsigned int bytes, void *buf, BdrvRequestFlags flags)
> +    int64_t offset, int64_t bytes, void *buf, BdrvRequestFlags flags)
>   {
>       QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
>       IO_CODE();
> @@ -65,7 +65,7 @@ static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
>   }
>   
>   static inline int coroutine_fn bdrv_co_pwrite(BdrvChild *child,
> -    int64_t offset, unsigned int bytes, const void *buf, BdrvRequestFlags flags)
> +    int64_t offset, int64_t bytes, const void *buf, BdrvRequestFlags flags)
>   {
>       QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
>       IO_CODE();

