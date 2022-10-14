Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 998575FEC81
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 12:23:58 +0200 (CEST)
Received: from localhost ([::1]:36122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojHrA-0005wp-Sj
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 06:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ojHo3-0003dg-Vq
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 06:20:44 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:47055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ojHo2-0006Xo-77
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 06:20:43 -0400
Received: by mail-pl1-x62c.google.com with SMTP id l1so4295008pld.13
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 03:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ffc+IO4cQ30imo1COWQIclNPFfVX+eoFUkZ7zeNJI40=;
 b=k9l9UZdby43pcP4SP1PpBM3ZJBL7D25Wru5HenR9Qg312h1GQ4sxhhiN9CVKYdG9ch
 sFRLzy1iSRzCQognrc8FWND/p85huXGcsjgjA3k3MzEOCdus711AHaAagQ4EGXYaGwrh
 Ru0SwrfZGMSwBhlPp9oHjBPUIehXIxCVbzfcvH5GRRdovmPSKw5+k2MdBbZRnDNO5Fr6
 D6qh2AGD3vYEJBetpbukAfJ6ys9EiZYPt/+yy3fV526L8+KzoLCpuqOBuQSHnFvylFwd
 zVPtooKT0wX9YYgpN9K2fpD/HaNPcKP350HS7VOtMQsSRKjTSuIs/OqqAilzhz0HByqy
 DI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ffc+IO4cQ30imo1COWQIclNPFfVX+eoFUkZ7zeNJI40=;
 b=aA2tGAJFa1/xoiWG7GOtTAalqzyKzb06W+5T+xE57GC6J9II3lcb8/DCIiA9hcBjgz
 LZnLlq+WpViYm+VNaBGCqh7cGpYEDRDriBG8MXR2e4NCF9Gq7yFSQIIGFJqiwzkYj1H+
 FQDvWDf4DqA2/GGXU4Camdrab/y7neh30hmZfivrszPd4872IYHLOS6NJIYuPltTCFJ1
 CNZEwTZCQ2LVJe51Aq+YZpzS3paz89bPtMvYbfb2VNbndnJG5a03zO/AkphNKhUnvjGM
 CLiPpsOtCcIO8oF+ucm8PgKlsPBA/rxsjOwM5mQCW65EHzcTAeHbIDa1ZEfPg0u3LbLf
 0jKg==
X-Gm-Message-State: ACrzQf2QpkBbz+2XHxHSe18oW14pAqfVuR5PzvcwtqIO+2NUhgApxCjs
 41xVm4i7Y1XLuAeLzIzzGy/9vA==
X-Google-Smtp-Source: AMsMyM5aPRr5G/IrHZO8q33H/ldXrBKwJ4iFxpiXra3E7C5Rb5XbLrkiSZpoU+seVN+KamWPR4rzEg==
X-Received: by 2002:a17:90b:4f90:b0:20d:43be:11a1 with SMTP id
 qe16-20020a17090b4f9000b0020d43be11a1mr5147362pjb.66.1665742840279; 
 Fri, 14 Oct 2022 03:20:40 -0700 (PDT)
Received: from [10.1.28.222] (110-175-13-142.static.tpgi.com.au.
 [110.175.13.142]) by smtp.gmail.com with ESMTPSA id
 a29-20020aa795bd000000b0056234327070sm1394354pfk.95.2022.10.14.03.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 03:20:39 -0700 (PDT)
Message-ID: <26bbfbca-4233-ff30-910a-d5080f979c51@linaro.org>
Date: Fri, 14 Oct 2022 21:20:33 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3] tcg/loongarch64: Add direct jump support
To: Qi Hu <huqi@loongson.cn>, WANG Xuerui <git@xen0n.name>
Cc: qemu-devel@nongnu.org
References: <20221014034020.1167864-1-huqi@loongson.cn>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221014034020.1167864-1-huqi@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/14/22 14:40, Qi Hu wrote:
> Similar to the ARM64, LoongArch has PC-relative instructions such as
> PCADDU18I. These instructions can be used to support direct jump for
> LoongArch. Additionally, if instruction "B offset" can cover the target
> address(target is within ±128MB range), a single "B offset" plus a nop
> will be used by "tb_target_set_jump_target".
> 
> Signed-off-by: Qi Hu<huqi@loongson.cn>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 56 +++++++++++++++++++++++++++++---
>   tcg/loongarch64/tcg-target.h     |  5 ++-
>   2 files changed, 53 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

