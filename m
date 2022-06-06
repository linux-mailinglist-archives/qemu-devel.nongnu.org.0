Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 061B453E5B3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 18:27:00 +0200 (CEST)
Received: from localhost ([::1]:44282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyFZC-0002zK-Jh
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 12:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyFRz-0004Hf-Ph
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 12:19:32 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:41516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyFRx-0001Ll-TL
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 12:19:31 -0400
Received: by mail-pg1-x535.google.com with SMTP id e66so13270181pgc.8
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 09:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vNmtWm60jUY8ST/y4CsCZs9u/UkYeZ6yUlP9MvlITPk=;
 b=fcn5DPF9L/HGQAh7IqdrbqyoAOLaMCEQoTEkM7pNNOd+smJxpShaJwYFBxVsQPPZBY
 2HPazh1SoNdmp4x/ty+VWnCXio8yxViBB21OCXKrAi32EDPdhZd3Qfk5VhgHCvV1Ai8k
 AkMpJ35COEQNXIyQsSqNgyC8B+y8RtpJbSaqS6jA9VjDDDsHhzMKA9N3GIGGBKqC6vui
 JVMci9C+GAwLbp30PTEA06pZC5/m7fCAmk1ksfpXIThSLGSQOD4Ep0J2RIA03m2zMPhW
 XU56QR6xbaVzxPpbyUPtpmR5Ce7sp1y2f75nxD2237zqr+1TpcDS63HkkkukOOpjr7Le
 Wkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vNmtWm60jUY8ST/y4CsCZs9u/UkYeZ6yUlP9MvlITPk=;
 b=tYMQLsjGqZkJinIB9Atk+k++svT1XGuV2/fHn/NeC3z8ohoJnL+b/2OTb5nTyDxdTe
 SBRCQx4Etx6bjFYUcGe0iv+TZdSiyHPHjxH9XAhfRLopvO+yFXC9XkN+zDH6u7I26XKr
 ngONKjULEoigFDsO1UQ0WNzDxN9bCq+fooZatArwDJlQdKyGX2F8NXdtFdZlx+B0jMus
 9Dj5J/LRu6/gXuEfL1uXlML+YlHzYeqmkk6OeUfFqcSO+oLdgV6yUl4OBhfNaUVzityd
 +tqdTsljB1yklSOtiTLjqmdkAWxtrEhutxMo0HFRS70SodNtzMPFdm+D5F26cLR/gIMg
 eLng==
X-Gm-Message-State: AOAM533CigzkcaKy4xg4aGSVUn3ZFgm4dz/YMkQD2CBAL3vsUvVq5B4W
 UhHdAeHCkuJwRri8Q1CL6Khzjw==
X-Google-Smtp-Source: ABdhPJzi4FBeVez2CIlSV5uCjoxXMdilWG5YeEmw8eP4b4kKHFd4xG/+v3+aoPVGuEK3/0Bxy1KqhA==
X-Received: by 2002:a63:f046:0:b0:3fd:a876:10c9 with SMTP id
 s6-20020a63f046000000b003fda87610c9mr6886095pgj.237.1654532368330; 
 Mon, 06 Jun 2022 09:19:28 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:dd1c:9738:3e40:ffe0?
 ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 iw10-20020a170903044a00b0016188a4005asm10733616plb.122.2022.06.06.09.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 09:19:27 -0700 (PDT)
Message-ID: <b092fa65-384c-46ee-ccf9-b8912358bcb2@linaro.org>
Date: Mon, 6 Jun 2022 09:19:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 20/71] target/arm: Add ID_AA64SMFR0_EL1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-21-richard.henderson@linaro.org>
 <CAFEAcA_HoMLWudYorTmJTgqGPv1mwi8jZ3GkhjQB3TorZCOrWg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_HoMLWudYorTmJTgqGPv1mwi8jZ3GkhjQB3TorZCOrWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

On 6/6/22 06:05, Peter Maydell wrote:
> /*
>   * There is a range of kernels between kernel commit 73433762fcae
>   * and f81cb2c3ad41 which have a bug where the kernel doesn't expose
>   * SYS_ID_AA64ZFR0_EL1 via the ONE_REG API unless the VM has enabled
>   * SVE support, so we only read it here, rather than together with all
>   * the other ID registers earlier.
>   */

Thanks for the wording.  And looking at those two commits makes it all make sense.


r~

