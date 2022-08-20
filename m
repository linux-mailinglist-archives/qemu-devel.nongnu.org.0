Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BB359AABB
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 04:39:26 +0200 (CEST)
Received: from localhost ([::1]:45358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPEOT-0001Sp-2f
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 22:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPEN4-0006vy-JQ
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 22:37:58 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPEN3-0007o6-1T
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 22:37:58 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 w11-20020a17090a380b00b001f73f75a1feso9101397pjb.2
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 19:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=yNw7jrBIre57YZQFGOUU6VXeNgVe+bgdkK68WlvMBBc=;
 b=OrQvt7k8krrDKvJY0Sez1I2D9RdMqeTUE0z1/XC2yY8Jgi/OOD2wXjCGRjLXDGFeu4
 PYd+irRkC29wxWTubMz94f3KNzkFmK4RH05t57A398ZZHgQQmBYLtSMspJ0lh1cDu0Nk
 NAw1dEddrsAoPM9fH37K5MNxSv/N6HXsoHa4l3+TiGHwXEF8YoiulJy5fjHFB/APCves
 cuPyj+ILaYST4n/SZs3dvty4vDfhmqJkqglTCC1BrDVotJ74SjKmsqASCeZkifE89nQd
 TzdGihb5EvO775jebKq6BDxh/pJYwuzwS8nlY2p86TXWZM3ijyajIbIf8PRLYRD3A9rB
 lP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=yNw7jrBIre57YZQFGOUU6VXeNgVe+bgdkK68WlvMBBc=;
 b=PHu0WJE2XlwiNpRCn+0SwgT6VvnHesI6Htm7c9q9C7T2sZRkNmwDYM3Cho5O/ue1pf
 ufJOcisc9ngrob7diuRCCSFbcQ8zhwhLypV5/2/khQz+UbPHWpEoErBjN0+9eNb9Fxtc
 wISUmXz3TkwCs6vercN+usFUZlMoDM7YJSMGtLnB/HS4ZnWowh3OFFmd6c/5kEQ7dssp
 +xQUZhX6OxMjTU/s7lZilU3e+lb3XkkFXTy3KcBC1/4fffodWMpPZL/iv0/GQ2NFnfTb
 DZ6vOwBGYb9GT4yGSRYCT4SY0zdFadEetXYZOixMtMuxS6C1YbVG1FHu6ZG0XCHuo1gi
 QZeA==
X-Gm-Message-State: ACgBeo1U8c40HEI+/ikeEgMAO4dw6eGCaMdGUixg0Vb5kZxtRGaUUoeE
 N4gdORUbisaaoAdgpxPA12psyXd5Zbg49w==
X-Google-Smtp-Source: AA6agR6jZZouSZpjnJ8XTz1Cdftt9Elnk7H/3CtpviNHzwrBQ8NOa7YQ7MDyiOgpN08h+EyPshRQtw==
X-Received: by 2002:a17:90b:350a:b0:1f5:6a5e:5d12 with SMTP id
 ls10-20020a17090b350a00b001f56a5e5d12mr17376080pjb.46.1660963074425; 
 Fri, 19 Aug 2022 19:37:54 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:f37:9eb9:ca02:d0cb?
 ([2602:47:d49d:ec01:f37:9eb9:ca02:d0cb])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a170902ead200b0016a6caacaefsm3790807pld.103.2022.08.19.19.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 19:37:53 -0700 (PDT)
Message-ID: <e9fa6da1-d33e-94ab-9ace-fca711334afc@linaro.org>
Date: Fri, 19 Aug 2022 19:37:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/6] target/arm: Sort KVM reads of AArch32 ID registers
 into encoding order
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
 <20220819110052.2942289-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819110052.2942289-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/19/22 04:00, Peter Maydell wrote:
> The code that reads the AArch32 ID registers from KVM in
> kvm_arm_get_host_cpu_features() does so almost but not quite in
> encoding order.  Move the read of ID_PFR2 down so it's really in
> encoding order.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/kvm64.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

