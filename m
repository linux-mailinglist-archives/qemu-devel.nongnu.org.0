Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3494966A555
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 22:49:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGRvB-0005sA-Bd; Fri, 13 Jan 2023 16:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGRv8-0005rj-Hv
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 16:49:06 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGRv7-0000M5-1i
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 16:49:06 -0500
Received: by mail-pl1-x630.google.com with SMTP id jl4so24738372plb.8
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 13:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mk0ZfECJfbnCTsf2tCogm22kYy70CHHuS4Z4oKQDJn0=;
 b=fhXURGGwDlkeW2VI60b686Mz6kuxjTS24codg61tDFYn+ojt7AArnvO8LjeC25F7TJ
 7xEMIaMC377L+uppmw+yxEz9XYXn4Kp4V+8Cnr8qVJy76Q27NNuksyd6ys/LM7uzwYHr
 y9R4KNBV10wJbjyoVvMrXeZVweA77L5pmmXrqVzBKmVnQdJri2prcYXJMko1RvTVUBPh
 EHnhLH/hesrpbxZJX89HU292arHJwqNXo1Ss6/KHUmvWMtaTT6qnj5s2/ou28gZysViw
 duQtH9LN3O9S69kfoILiVJfqRICQpoJPnL3lRLyClLvxD2obroDM9obbU9A4js5jtGPv
 tN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mk0ZfECJfbnCTsf2tCogm22kYy70CHHuS4Z4oKQDJn0=;
 b=ccicbq5Vktuu0cigopOkc6scIN6w8RhQGRcG4LbiMtn2D1I7GlaxlWq2djj+Zhbmcf
 6oSCdgXlJILphol/MDi53UMqJ2GDo6sliJTRGyrJNPxML+P821O7SFXr0jLt8migSbt8
 /0epgAf0R6Tw96zSP6ebK5/8W6MSrAVhVIn56xTO4GT55VbuYD/xmGUYFLbn43zyq7iZ
 URVplPsTJQve8gyLqD6BnF2a/hXaDtapHLVOjs8Nz6D6DaJguKljufJIT3GS8HrY0TeZ
 cHznd9LD6hZSar8TG+SzR468Mi7ERVEJnzNTnhVQEhA0EAymOnZZVgywNi/fW51pQyz/
 WeOA==
X-Gm-Message-State: AFqh2kpypeUKEiXsKp/RsbUI9CV6dFIJOLqeYztZpADfwyg4i++H0nDU
 CNfer5ZjCsJy8iCEgocE7ve9vg==
X-Google-Smtp-Source: AMrXdXs/xuvotcaA/Qa5i2yctMBXbrLfNyLf/Rnv8fkdDv+tCmTEW6NP6jh6fYNnAMh1hm7K9Vxyvg==
X-Received: by 2002:a17:90a:b110:b0:223:4308:1ab4 with SMTP id
 z16-20020a17090ab11000b0022343081ab4mr84887435pjq.46.1673646543427; 
 Fri, 13 Jan 2023 13:49:03 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 m2-20020a17090a5a4200b00219220edf0dsm12860376pji.48.2023.01.13.13.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 13:49:02 -0800 (PST)
Message-ID: <8e316d5b-1b4f-56d6-3ad5-cc4d0a200fcf@linaro.org>
Date: Fri, 13 Jan 2023 11:48:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 05/28] target/arm: Move cpregs code out of cpu.h
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-6-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/13/23 06:03, Fabiano Rosas wrote:
> Since commit cf7c6d1004 ("target/arm: Split out cpregs.h") we now have
> a cpregs.h header which is more suitable for this code.
> 
> Code moved verbatim.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/cpregs.h | 98 +++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu.h    | 91 -----------------------------------------
>   2 files changed, 98 insertions(+), 91 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

