Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526866606FE
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 20:18:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDsDY-0008W4-9x; Fri, 06 Jan 2023 14:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDsD0-0008UL-Kt
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:17:18 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDsCz-0000Ba-5q
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:16:54 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 l1-20020a17090a384100b00226f05b9595so681415pjf.0
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 11:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bHNlsgXUM2l8uGHKj5hP48j1VPU70mblGDAgat/O9JQ=;
 b=rIAVg0ngjXsEqiM4odVL0+/OIa/LmNps88Rj679SkW2xKeXsV4pMdqLL3CknFxAaFZ
 8zKQYBhV3oL09vCLdaUOWZOAE9h6o1KYn+tPv9qcZa+Ao8u1rrRJmRjOgn1y+5I5XoD5
 vWmospq4LLClnTT3iB9iC7CaM4O87pWYePFQb4j86Q0aJdC9hF2uMBHaI2zRtO3vrpSn
 hafN5OYSV08xixLH5mqIKqk2f40+0x9/3eCnaDNYzVN6gfWJuOWTxDq7wprmPXIQFSfM
 HZ32FHqC1Gm2njkAhevfmtSezOjgGrhpmH0E+09jIEmrRX+w4Fkcv2/M7+5mlswzqIOi
 9dpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bHNlsgXUM2l8uGHKj5hP48j1VPU70mblGDAgat/O9JQ=;
 b=KffVmT2xBwH4PSwPXSyc6xeNI7TGdVb3qgQc06M1BcyLNXQMo9F8KytLKzXps2S9hF
 xteOr10irha+/2ZV/oIf5NvsYj/UlMMhxu4Yd+GOXVGo/4naIWeVIzrJ2zwZlE3r+D+K
 K/j955HKtfBfwuWHOWbbFQWOtA02Lqpapl6P98QraLiJRny8ImceMvvKHuLQNsuA76bV
 caPIkJg+v5gxJH/w8esSNIfN3xJRu8Ln++5sgbfyMNwIQdLR+pUvWwCprtYFEba5TkTL
 APJrbrpNqDYamdAmgCRT87wfbb9Ht16M+lt5qMP8boIzDKG41W38W0VGtwNTTel2ES07
 aT1Q==
X-Gm-Message-State: AFqh2kojTiNJdkluZeqMboZQNFk1yOjwGvDtIOr5A6cEkagAbIszw0c2
 6Ga6hhLt77LlwpEQqhrYORfPYjsmNfPa7xEf
X-Google-Smtp-Source: AMrXdXt+ouk/xz3SCMzgV3yjbatu6MSknvjdqNW2CK51RQRNJHt409BV9sRFzCnTv9214ZUyMn9zwg==
X-Received: by 2002:a17:90a:7142:b0:226:19ea:5c2a with SMTP id
 g2-20020a17090a714200b0022619ea5c2amr34338075pjs.43.1673032611749; 
 Fri, 06 Jan 2023 11:16:51 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a63e00d000000b00485cbedd34bsm1219400pgh.89.2023.01.06.11.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 11:16:51 -0800 (PST)
Message-ID: <8446ae9b-edda-8e09-6e02-aa4a14c16eb8@linaro.org>
Date: Fri, 6 Jan 2023 11:16:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 8/8] hw/mips/fuloong2e: Open code bonito_init()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Bernhard Beschow
 <shentey@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230105130710.49264-1-philmd@linaro.org>
 <20230105130710.49264-9-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105130710.49264-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 1/5/23 05:07, Philippe Mathieu-Daudé wrote:
> This helper is trivial and is called once, directly open-code it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/mips/fuloong2e.c    |  6 +++++-
>   hw/pci-host/bonito.c   | 15 ---------------
>   include/hw/mips/mips.h |  3 ---
>   3 files changed, 5 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

