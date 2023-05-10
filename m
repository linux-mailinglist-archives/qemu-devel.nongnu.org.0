Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA216FDED4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 15:42:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwk4q-0006Nx-W3; Wed, 10 May 2023 09:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwk4n-0006Ez-2A
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:41:53 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwk4l-0008Op-DY
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:41:52 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f42bcf5df1so19853005e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 06:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683726110; x=1686318110;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MW8oLC+FXMRy3/hWEmLXL2e3CcATva98IAF8Mo3gmMg=;
 b=BgMW4y/y8b174NF/Kf3CKJG5JRIaRU7oItbcEbjpDqbxCKLrM9r4MjMOWwVa7yKtMI
 s8CTVmvbqy4hFgzo0zFa2GZ9GzNiQXZr6k/7e5PRFXu8Saotd9xO0N5xHhr9UVGQom1C
 rgdOIjHZEtROhEAdqWiZWZ4RpedLa2rs/M3SzfcCvdUMkMlBrW3+MidkxkR/FJ2piiSB
 vZM0ExyCT8sZtVCjalENa/7BfrQb0EhPy4TRIcaAqE6fNgRaQqPmHthvEMzpRYV0DoeL
 ZYE8YDFKP/MMjSo0XaJ8HfIXqYOJHhMC71C5fh8GI364gLmWvoGGRD0KaTmVnazurgnT
 nugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683726110; x=1686318110;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MW8oLC+FXMRy3/hWEmLXL2e3CcATva98IAF8Mo3gmMg=;
 b=Lc797rlKnD7cWPYruWH6cN1VkdQEWpW9gxxSkDSqgso1EcuES6fDoNNN+ovCJAiQ5f
 OBZe9npcJ7QDDgBvib0KklLbphnYmt8nE1Zb9slqrEyupXTd2I7vd8neuHd8UzBg8PgB
 Wc6zcmtfleeP7eklL+TLvSiG5DdJXDfE+hsRIP3BkYBjq0wuoDY9UfHzjDrd35VD8nqr
 kk+Czkvy+ZOkHvlaFoY4/KiTNsWLw8Q3Ih4xt5ubPmyU63ZeRRoFMmhvmFVvhWyP6x8Y
 GHvvXCp44jkqbyPHzCuzwkFlNv9PybrMHqxg1D6vi/oFRBquylHL4swUC774nKW/NRFY
 syxg==
X-Gm-Message-State: AC+VfDxUGUxNmNF3Vxi2WaMt4DmkjhDcd1vRfIuB5tn0CLzsVti50+fz
 OFGoYkgWXsvrw+eIDRw4juLhfQ==
X-Google-Smtp-Source: ACHHUZ5W0H8KQYB93tA85UfvlCjDHXzelZwDyb+c0fKJLu9Y0sMS9seVd8poF7JsYewg6UxKBU45aw==
X-Received: by 2002:a1c:f204:0:b0:3f3:f7f0:2203 with SMTP id
 s4-20020a1cf204000000b003f3f7f02203mr11803738wmc.12.1683726109911; 
 Wed, 10 May 2023 06:41:49 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k14-20020a7bc40e000000b003f4272c2d0csm8015412wmi.36.2023.05.10.06.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 06:41:49 -0700 (PDT)
Message-ID: <59c4c9e9-4050-0c1a-138f-69bc869561de@linaro.org>
Date: Wed, 10 May 2023 15:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 11/16] target/sh4: Use MO_ALIGN where required
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: jiaxun.yang@flygoat.com, crwulff@gmail.com, marex@denx.de,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
 <20230502160846.1289975-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230502160846.1289975-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/5/23 18:08, Richard Henderson wrote:
> Mark all memory operations that are not already marked with UNALIGN.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sh4/translate.c | 102 ++++++++++++++++++++++++++---------------
>   1 file changed, 66 insertions(+), 36 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


