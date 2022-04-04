Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD504F1392
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 13:04:50 +0200 (CEST)
Received: from localhost ([::1]:55278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbKVt-0002uq-DW
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 07:04:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1nbKU3-0001vl-5D; Mon, 04 Apr 2022 07:02:55 -0400
Received: from [2a00:1450:4864:20::22f] (port=42954
 helo=mail-lj1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1nbKU1-00088z-O4; Mon, 04 Apr 2022 07:02:54 -0400
Received: by mail-lj1-x22f.google.com with SMTP id c15so12324129ljr.9;
 Mon, 04 Apr 2022 04:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=H1XwW/NhOAPUn3cY23zazn67TPlhMOf/gmFe3OeKk2I=;
 b=RR79StKUaufACzJ/m7S9H2SyXXV4S8DWTJRb3EJ3S415ocEIzbPU7LS8LVrQ6+bEyn
 Tkg3YUAmCXvQb1w+W2hMPVv8Gwrm7y1vH9aHntS75YcgRAwUOBwxJmbRMIVLAD0K/z4C
 qxoSyxA6ECMGTiIukVNZUj9LNiQmdD5CEKppBf/ZCbAD5zarTwERLWW+1emGxjRY64kC
 vq5xNNTuZu+4qDup1Y8gz5kJCwD5FLfDdXGDGLR28gmrfWJ8DXOEsfjEIKALox5Mgkxk
 H9nQwcwuOjH+YQ8+QoVO4zhENf03Ivj1D5gEM4mORTQT81ga/xrfjsegnknSCTPtWaZC
 ovGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=H1XwW/NhOAPUn3cY23zazn67TPlhMOf/gmFe3OeKk2I=;
 b=yrHgymcenTJKoXNu/JYNGomIjgh4lAUr/SB6RV1NonMNXLXRGcT6lTYXJM7To12Sj2
 QhZkRQzaqQSkeXTl0WnvfqjTIGG/VgIsL72t52Bq2mhxKSk+B33YChyzJZJAtx3QiS3N
 oA8/TGKxf9K+JIev4QRkltR5cWYA/u8aD1etzXLqsaYil+cZTuihhsNE3NDrFIIWU1je
 8EpypjfD8DrMfSarbdgoFzxY10vPGS8811C6ZbDAHN+KUag/VshLG/yOmTGFny2atqMQ
 tc4cS6UVLSJ46WAFUFSUVUXbErAQoNqYr3zkOuid/uQvHDfr1vv8UMYqYfuF1/n88rP5
 HxAQ==
X-Gm-Message-State: AOAM531H7LjSs6rkQPTPfqdQAGSJbOpf5qXSFuPRZF9c/rL7XIq2a4tS
 L0yXaU6YaoLARvrtlzNCLSc=
X-Google-Smtp-Source: ABdhPJzju2S4k8/uyOB1CpfwJLk2AKDN1yK1YO3RYj4BwoTy5u07ZvdKyfdcP4bRAl2s+ZffRU5xIA==
X-Received: by 2002:a05:651c:17a3:b0:245:f39e:f2d2 with SMTP id
 bn35-20020a05651c17a300b00245f39ef2d2mr21819087ljb.490.1649070171310; 
 Mon, 04 Apr 2022 04:02:51 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a2e9ecf000000b0024b0f17f790sm704881ljk.21.2022.04.04.04.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 04:02:50 -0700 (PDT)
Date: Mon, 4 Apr 2022 13:02:49 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Tong Ho <tong.ho@xilinx.com>
Subject: Re: [PATCH 1/1] xlnx-bbram: hw/nvram: Fix uninitialized Error *
Message-ID: <20220404110248.GA2422@fralle-msi>
References: <20220401190631.1697408-1-tong.ho@xilinx.com>
 <20220401190631.1697408-2-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401190631.1697408-2-tong.ho@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -1006
X-Spam_score: -100.7
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-100.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 alistair@alistair23.me, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2022 Apr 01] Fri 12:06:31, Tong Ho wrote:
> This adds required initialization of Error * variable.
> 
> Signed-off-by: Tong Ho <tong.ho@xilinx.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/nvram/xlnx-bbram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/nvram/xlnx-bbram.c b/hw/nvram/xlnx-bbram.c
> index b70828e5bf..6ed32adad9 100644
> --- a/hw/nvram/xlnx-bbram.c
> +++ b/hw/nvram/xlnx-bbram.c
> @@ -89,7 +89,7 @@ static bool bbram_pgm_enabled(XlnxBBRam *s)
>  
>  static void bbram_bdrv_error(XlnxBBRam *s, int rc, gchar *detail)
>  {
> -    Error *errp;
> +    Error *errp = NULL;
>  
>      error_setg_errno(&errp, -rc, "%s: BBRAM backstore %s failed.",
>                       blk_name(s->blk), detail);
> -- 
> 2.25.1
> 
> 

