Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A38592651
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Aug 2022 22:38:17 +0200 (CEST)
Received: from localhost ([::1]:55866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNKNE-0006Lu-0e
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 16:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNKLm-0004tZ-5w
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 16:36:46 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNKLk-00046x-Gv
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 16:36:45 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so5245979pjf.2
 for <qemu-devel@nongnu.org>; Sun, 14 Aug 2022 13:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=L24t9vRMWav2CTSn6zd7jmIoTkq64AYlVoGMB5HPHSM=;
 b=tPeI/I151DtfC/LkWxgVdbo//bFKmlSIWpPBF+B34c7X1cCF3J3gQ8uA4M5I5Vjcvg
 2zxbiFPYH6C0geQ1tvcNqf03CY4cVmmaHBG93zo8Xe20GgDIXUAALiWhr+8LkU3D05hP
 baT5GnIE+5kaRM8fmcmvrjn4Vco4h1Wq0uc+YYlUYcOdptZuZZr3GvKb80kdlvEQ9Arc
 MyeE4l05CVPj4ACk76VYrSV56bSpSjJryakC2An5U3T/xkYXyAq/PVSt+wGZHEooZsdX
 9HVAY2AiZtotQu4scBHR/A2Ko5MoKYvrHy3TnTYVAeNkPwpS2hdGMqFEKH/LayxDlCTI
 jl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=L24t9vRMWav2CTSn6zd7jmIoTkq64AYlVoGMB5HPHSM=;
 b=3TDV/9cjwGTb4XClTXZmJDNH6E8t/ooOJEI1aMSop/usa41nmWRGtoIxn5YdCrfYQN
 v3/15JlWSYPSI9nUB3KEzX4YSKVQPaDMcsezEAWKg/4MIcpvTZsRv1446MsLE5yYd0f+
 +hu6klMQxdilm7ETnXma9MXiKTRZ+y27/PLie9tYyAPY/OT0Fi/Fo8YHu/HphaylL/VW
 nO1bICsV40BIVyCc2GcdfpBA6zC/N8xiCEdM/Ny12s+p1JHEJ+Zus5ZrC95zgL9ZrF5q
 wOD8fojZK0zegDRpEifm/tDQG525hqxMUrX8jZKlBdlMl33mlkEiuwGHd61NXMoiVFKP
 GTNg==
X-Gm-Message-State: ACgBeo1o0+nWtThChcNB0iXQJquMDmAfzNwV13a3Pj+Ly4XdBdAgXGz3
 UKJuH5/qV9IAgO1saMalMJE4CCS59NxpBQ==
X-Google-Smtp-Source: AA6agR6W25phhBmqKfPD6uSkUlmlQd03LnMJvKnCcPf3cLVQ5WHHw4Cw2b0oBiQZYfN1PGYFzXKnLw==
X-Received: by 2002:a17:903:3284:b0:171:4250:86fc with SMTP id
 jh4-20020a170903328400b00171425086fcmr13670383plb.159.1660509402724; 
 Sun, 14 Aug 2022 13:36:42 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8012:29b7:7129:d9b8:d112:9475?
 ([2605:ef80:8012:29b7:7129:d9b8:d112:9475])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a170903245200b001641b2d61d4sm5778397pls.30.2022.08.14.13.36.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Aug 2022 13:36:41 -0700 (PDT)
Message-ID: <9d1976f0-22c5-c4c1-b729-b5c398e83322@linaro.org>
Date: Sun, 14 Aug 2022 15:36:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/1] loongarch patch queue
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220814134745.8824-1-richard.henderson@linaro.org>
In-Reply-To: <20220814134745.8824-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 8/14/22 08:47, Richard Henderson wrote:
> The following changes since commit 93f3dd604825824a7239aaf704baf74730aa3007:
> 
>    Merge tag 'pull-target-arm-20220812' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-08-12 10:46:43 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-la-20220814
> 
> for you to fetch changes up to 1f90ce64fc6043470209f825c7763950ec2067a1:
> 
>    docs/system/loongarch: Update the LoongArch document (2022-08-13 04:45:03 -0700)
> 
> ----------------------------------------------------------------
> Loongarch docs update

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Xiaojuan Yang (1):
>        docs/system/loongarch: Update the LoongArch document
> 
>   docs/system/loongarch/loongson3.rst | 104 +++++++++++++++++++++++++++++++++---
>   target/loongarch/README             |  49 +----------------
>   2 files changed, 97 insertions(+), 56 deletions(-)


