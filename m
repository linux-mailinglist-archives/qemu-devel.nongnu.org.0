Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D286213E6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 14:55:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osP3y-00037M-6N; Tue, 08 Nov 2022 08:54:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1osP3v-00036I-Kx
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:54:47 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1osP3u-00083e-6d
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:54:47 -0500
Received: by mail-lj1-x22a.google.com with SMTP id d3so21216700ljl.1
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 05:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DU97Bhg/h7xnHLfOjgiKU7bQHjyEEl5hAMZrQQ+2Uls=;
 b=Uiim2ekKDVbWfS4uAxsM2T1qmTOyDIb9Fut9U3YmNiM5/2y/QdqQPAYB88b2/gsy5Q
 oSYMGqlYaVPU5V58105zyQ92kLUHuAeuuWmol375sR1RllhatwtT4i+yHyywN1nnK82S
 leY75tvU4kj3o+IhgfEjjK6HAv0FaISIegN9fjpSrRPqeEt6IQza3IxmCcFmOHnBZLLM
 n/cNtLfSxykoWJiGGx3XasAya9UhVUJTh04bR3wzs5vp20gtth+YD0I4Ti9nkSvOhFxZ
 UDwDT61XIuqgYjXvEq4k1O6QbKJ522VhPH8aTSYDLCFqucHwU2P1JwBDX3gf9v29McOp
 OqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DU97Bhg/h7xnHLfOjgiKU7bQHjyEEl5hAMZrQQ+2Uls=;
 b=k69CJioN/9IW+7Gx8uJTEoImORvpKTFTPXvWPpHV8x16b3ShTPxPxMVKMWX+qkhqaw
 2PoRdDXvoi0vrXnEIlDgF7RYRjn/BQT0bGQz0iVND9di0OX89OaMLa33gRwaVlVHXY/I
 vQV7t/x1TppoGsF6K156/grRNI2zbIwYnfJSZ2l40FZIbM2iLn+Z2VfiA7EUv+6LGxjR
 I8CSKWjYXcQqA0fj5PPuWxZ862lgpxOw8psm88YgXxe5Lt8Qd4yaTMvlY59SI10MI5/+
 pKSCr7kcyKEW7PwFqoh5pkNfk0fTis/e/L29ybx7iwR3Mmhh6VmJqddb1Xu6SAHd0z9g
 DFDQ==
X-Gm-Message-State: ACrzQf2sWUejk3Z8qGyP8FI803jgEhIp7aGBvb1bZLY+61IEjoU7yCbw
 cvQjaLkVliQTbwi5WzPua4R/IBF4TVDvvA==
X-Google-Smtp-Source: AMsMyM44YyZ7VW/g50xm562Ec8A7MyAKNUF7diarbyavz3FsAGBeHZam2blR/d5HrCUZlTunHRrTOQ==
X-Received: by 2002:a2e:9083:0:b0:277:e69:f69 with SMTP id
 l3-20020a2e9083000000b002770e690f69mr20486237ljg.358.1667915684324; 
 Tue, 08 Nov 2022 05:54:44 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 h20-20020ac250d4000000b004a240eb0217sm1789121lfm.251.2022.11.08.05.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 05:54:43 -0800 (PST)
Date: Tue, 8 Nov 2022 14:54:42 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, francisco.iglesias@amd.com, edgar.iglesias@amd.com
Subject: Re: [QEMU][PATCH v2 5/5] MAINTAINERS: Include canfd tests under
 Xilinx CAN
Message-ID: <20221108135441.GE4571@fralle-msi>
References: <20221022054746.28217-1-vikram.garhwal@amd.com>
 <20221022054746.28217-6-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221022054746.28217-6-vikram.garhwal@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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

On [2022 Oct 21] Fri 22:47:46, Vikram Garhwal wrote:
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 538af2885c..a642026361 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1756,7 +1756,7 @@ M: Francisco Iglesias <francisco.iglesias@amd.com>
>  S: Maintained
>  F: hw/net/can/xlnx-*
>  F: include/hw/net/xlnx-*
> -F: tests/qtest/xlnx-can-test*
> +F: tests/qtest/xlnx-can*-test*
>  
>  EDU
>  M: Jiri Slaby <jslaby@suse.cz>
> -- 
> 2.17.1
> 
> 

