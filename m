Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F7A66068A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 19:44:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDrgw-0003RH-Hw; Fri, 06 Jan 2023 13:43:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDrgt-0003Nk-A4
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:43:43 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDrgn-0002I1-Qb
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:43:42 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so2575616pjj.4
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 10:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SDLNAO4/YMk0bUOCUa91+u89KLPIh5R+uh3uO9QTako=;
 b=w5PPkuxGCgZeG4zcoy8X/xGPojg+XqWBSE943tl7nolAFok7kQmfagsgg13sAQL/r3
 z9/4ha4xQPbulYFUhNLPLgrfEL+5XIQLTXwcBTFDgs+V2wKRW7y7jWwF3h8s8F5QhN3t
 /QXKpqeVbFUCjy8oxlRolTRdjqvkjdkJ6eGcJ/kVSfGyIRTPxOa92zjUsXs8Np3GLAX7
 /uYCo4gVb0dg11cl+0t8ezqLrW+C7cwaYz/kzYcQomLIZXokR14iDUcj036ngIlfsnta
 dabAvVQBsKGD8kv/7e/TDwlybWM0UCbzNwJ6yILCwumAFv8ZGYksIo0kLDf/1DcRaZYk
 qYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SDLNAO4/YMk0bUOCUa91+u89KLPIh5R+uh3uO9QTako=;
 b=s3nmkHeRgRxLGyPNtVSLX6oeo+ddw9Zewxs+XvIvhOnpS6RcXpul9UgqjTV4zP3JGJ
 fopK2Pg8TV6V5QmwejX1izGAYLIYa80iu0qzc2bVrw3yq4cLBcQT+SOEAJM+VV3c0Zz3
 Uf5yG1q7ZR2aRLRZeSgirlRo7ezbAAfUy9Ml+KNSeCyvNENyfyNPIS70zAlOrQqL0G5Y
 /wA3+n5mGZX79hlMJCN9m7mg57Vk2stpMacESX+XQfLEyMLIZZfzK3kjQIGSjMaDnzEa
 rZ/DXf7CVri+mJ/8UkfqCeNnjwxxR4dKddCSDHLiU8DFaLYHW62/xxh9Tp0N2zcEPi9v
 eqkQ==
X-Gm-Message-State: AFqh2krkIPZHop7KVeQEKX3WgUMGmayP2WsW08A0653oafYqsbUhAK8D
 V/DcGC0duRSC6sivXxUo1QyoFdDUUy3+1q/x
X-Google-Smtp-Source: AMrXdXsuj1nJM2gHDGsdXI3Kq4RLlgs8E7VaN/yDm5bu+ZrkzK+zh2F/gs8e3rcTLOcn58SyNdp4MA==
X-Received: by 2002:a17:902:7c07:b0:193:bec:2122 with SMTP id
 x7-20020a1709027c0700b001930bec2122mr3410280pll.32.1673030616183; 
 Fri, 06 Jan 2023 10:43:36 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a1709027e0e00b00193132018ecsm910693plm.170.2023.01.06.10.43.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 10:43:35 -0800 (PST)
Message-ID: <032e8158-3256-1d5d-ceb6-1e696b614989@linaro.org>
Date: Fri, 6 Jan 2023 10:43:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/8] hw/pci-host/bonito: Use 'bonito_host' for PCI host
 bridge code
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Bernhard Beschow
 <shentey@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230105130710.49264-1-philmd@linaro.org>
 <20230105130710.49264-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105130710.49264-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
> To make it easier to differentiate between the Host Bridge
> object and its PCI function #0, rename bonito_pcihost* as
> bonito_host*.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/pci-host/bonito.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

