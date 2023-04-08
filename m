Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387BF6DB8D3
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 06:26:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pl09Y-00022g-8i; Sat, 08 Apr 2023 00:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl09C-0001qA-3V
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 00:25:55 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl098-0006Sg-7R
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 00:25:52 -0400
Received: by mail-pj1-x1035.google.com with SMTP id c3so765304pjg.1
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 21:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680927949;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PXCwDtr2uHzOCiDI6gx9ciDRk0+XSVPCl10fYBMrOZU=;
 b=ajc5KDjyqXmm3NUhwaTQfNt74Vh03C8A4QjJBsHhqpatOEHjIwrsnnsJeIV1mR4Q//
 IH0YOeZ/wRmreO2AyYzmeyJuhK4a6Ljm4vkvshnwFkSu++QDSSNkcr1mYou8eymOKNTK
 w786J7PWGGOOgTqhO2r20p26oOpmjkka4g434lWGOkcRHf0lWcSAZ4Ucf+lH5lPKTUC1
 6/h8tPD5w6rtPylQwXgYWq8OwBkeRZWmcZK8oSylz77qxoRqauLmZnakWNVN//mmkUBs
 PgAZXndCQqApDyeml0rj84fIz0mO/XpJ+yqvRosXHibT0pibUfgwKQSPUhd4KFp4CWUG
 uqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680927949;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PXCwDtr2uHzOCiDI6gx9ciDRk0+XSVPCl10fYBMrOZU=;
 b=o8EFpqWGqa/ysbF7yCNmHzCG8hNrOVfJ0erNHQrydU5ilotKScE7aucFz1d/F+ptW8
 npo7j4tergXJNW/KXsdFhH1rPT3X/9emwUO9DQ+NxHEn5igp8httBR/vC107YbPllF/m
 /TJ0Gzrzt/Sy7xnOpIAMrhBTHPo7L6s5tHPkhHlWlhlUnkjGoTZkUSldukUbNrYJwF2K
 FjN7Cpqa+iAY0AgHI7vg7tdrRNoDuA/Zsl6KMphu41q5yS5aGH3nigg21TGPPhq+GvK8
 lGuNBSiMzB1spCdMUb+Bpeib2QadUmgQ26CD+bZoTbOF3D+UN6u17Sf0D+ADmEJIYAS7
 /BhA==
X-Gm-Message-State: AAQBX9f+VziQkJIZi5Ds3BT5xc8q6VHSOfOyFEN27MZg1LHBD2huMRY2
 Lj54+R8JYj0qbUBOh9QVeKWMeQ==
X-Google-Smtp-Source: AKy350bDO0xahEhFC+PBYeLvGOB3qgL/GrI8UhnYhnHZrwNfuMLU6DzeTNpPUrbd5lsuyvBPxO8WQQ==
X-Received: by 2002:a17:903:2452:b0:19d:1fce:c9ec with SMTP id
 l18-20020a170903245200b0019d1fcec9ecmr6359202pls.37.1680927948795; 
 Fri, 07 Apr 2023 21:25:48 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a170902b59200b0019f1264c7d7sm3631549pls.103.2023.04.07.21.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 21:25:48 -0700 (PDT)
Message-ID: <c7be234f-331f-0dfe-3fd4-04896c094680@linaro.org>
Date: Fri, 7 Apr 2023 21:25:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/10] target/arm: Restrict KVM-specific fields from
 ArchCPU
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405160454.97436-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
> These fields shouldn't be accessed when KVM is not available.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/cpu.h | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

