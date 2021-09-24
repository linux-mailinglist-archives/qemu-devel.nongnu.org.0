Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96811417E80
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 02:01:54 +0200 (CEST)
Received: from localhost ([::1]:55264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTv8b-0008U7-F8
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 20:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTv6g-0007hZ-IN
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 19:59:54 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:41846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTv6e-0007BJ-VJ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 19:59:54 -0400
Received: by mail-qk1-x734.google.com with SMTP id m7so13194209qke.8
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 16:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AB86dvi9nH2xKtlpWJBSslzKS3ISjIuhy7CizgAYPEw=;
 b=GBvySnVdR3Rd3HkTRU/OkMPOl9N2pBk007YlKkD7XYNFnp6m0djvC0ulFKAAKVhqfa
 yuwYaePViqC1/r5VFqEV5Uuqds0BNtlO+H32485jQdjOc/EMyKEQ6txuCKvSUPag7YZ+
 ol2cr1spo67YDcH8ZNZoFzK7VqlE3qOX34dHIZF+8MhJis9yPVhVLaTpZt0Eh7PRCdqV
 uG5DpEK9Dw0Vm3KT8KXQuISRDc2FPgh5vL+EgPh9Ih/MIF1Dk5Ro33MBrVFVwHchGDfn
 gY2wcIc6909uujcLc76wBje1AlKDjS72GRKoQfoyiy/QITRavelC676PM0AXPr9Bo2T+
 mUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AB86dvi9nH2xKtlpWJBSslzKS3ISjIuhy7CizgAYPEw=;
 b=BjPR9cvgd3yJNDgDZ5vE9qXbyRv0xkb258YB4I2jEr1UMjIY6M6Z7qZmVJSaN007DU
 NRArBEF/winro0hpFC3tfwI1qJhe2WWuaOcaYNP7zzOs9hc3C17pE0Bz5EzSDhdRKmSZ
 Ct9pwzF6M+qzDRqdkTFy7vhRSLtI1OBnm/Gn7oZIKpI/YyO9YBXg3KTA9UzDfM8KAt3s
 +T56l7REEm/1ddWWbS6/Kwzg9vRYOVaafhoDuj1X2r5RjlEZUCsQR4neON0u10MvNxzv
 AE6aT/+6zl1OX8U9OuVcwrRzL0L6MPivfhlN6QixoFjRLTHZtzJuiVw+/+O4rnsVWMEL
 FBKg==
X-Gm-Message-State: AOAM533BrHxBgAmUuhbkn/E13mMor5mmYPrtkK2arVKwGS0U6XfqG/7k
 QVr7KOhB/sM+Ad+zWrzjgokTdw==
X-Google-Smtp-Source: ABdhPJyTuTpdVS50/Ka2SoPTbCr/fbx5XrGn5nKwhPrxa5iR0zQ0m7RpjJU+iMFbh3CtaKys5TqsBg==
X-Received: by 2002:a37:ab15:: with SMTP id u21mr13441646qke.394.1632527991748; 
 Fri, 24 Sep 2021 16:59:51 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id p201sm5135828qke.27.2021.09.24.16.59.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 16:59:51 -0700 (PDT)
Subject: Re: [PATCH v5 23/30] tcg/loongarch64: Add softmmu load/store helpers, 
 implement qemu_ld/qemu_st ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-24-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <625927b6-4629-d93c-e505-4c03ae9c7ec0@linaro.org>
Date: Fri, 24 Sep 2021 19:59:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210924172527.904294-24-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 1:25 PM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   tcg/loongarch64/tcg-target-con-set.h |   2 +
>   tcg/loongarch64/tcg-target.c.inc     | 353 +++++++++++++++++++++++++++
>   2 files changed, 355 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

