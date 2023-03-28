Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C1B6CCB2E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 22:03:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phFXN-0000DH-VO; Tue, 28 Mar 2023 16:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFXK-0000Cn-4k
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:03:18 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFXI-0001X9-Ky
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:03:17 -0400
Received: by mail-pj1-x1029.google.com with SMTP id j13so11964659pjd.1
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 13:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680033795;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SkQ30XiiKqgTnCo8q3d61HM0F5o2MX09hDkuQyjB0xA=;
 b=ZzZmse+lflK+QqfxtN+xB6OF36dznZgBGU/q4W/M1u2dQvQ+cD1OTgjeQ4CAPbZsH0
 u6jJUA/gW3NoMpjv+PlmuAqWNJtn0FEEW/3rSRaVqZw12SKoMn4gqECTi69Ez6eMac65
 zGShvrfmFSsTOXw/WWNuiKr5HB5YiOSeqm5QXBmykLnMmpOfoHogvFvQZWVxkG9NZM8w
 9+VqHujotTNRQxp8r9ITRM5zA5YnilhcO0sDZSorpRcmYKcphhg6tSF00ft7cVo2Ed1Q
 JVy7f/rv/YiXP5tOoAOCbGu4lWK9cDoids/BulKZNhLcLQy3UiuAanu2aygs4OzM6zx9
 2VWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680033795;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SkQ30XiiKqgTnCo8q3d61HM0F5o2MX09hDkuQyjB0xA=;
 b=s6OU+iD1FPMfCrgE8h7vcDYp/sv1OENYbdhmP2rDohP3iLQ6OVd2eFZeIrIIf5nAPB
 VYsf+cPsS0s6ehzvMf2b3EYmAwu7jvM/69+TcfdefMyI76wXXTj7Bc8IqAZgiaeF9hT5
 64aiG9xNe7h7ZKOOhziGPxRDMcwEaW8IpMBBVlN3WgaX8yuh0F/Jv4Ef3sOrt0A3Fepd
 q9avRzHK0Nii1KUdq8lhPim8cvZOFIHB//UKSkd5Qz9MprSImxR2ZWOVsWwSmVbf4cQj
 jaNWh2DvVGIK0kStTuP2JRVDNxzwm3xHylUZMxXJcVVUc3cMrwSjZuBtNsrpC62nwmcp
 CBBQ==
X-Gm-Message-State: AO0yUKXZdHAVg0RrphtELGSj0Db3TDE3pBMlBAXRPeC8dUq5Cr2hpdHq
 +vFHkM6dtg8xd9QW6ICLBNolSAUqRZimmScPTyE=
X-Google-Smtp-Source: AK7set/PsJ5RwtR2ta9qDlbMKCLpaeUQa+dS5v40FnXf836r0iYR1RjgTX4PeS7tmmlkZ+7fnoDu0Q==
X-Received: by 2002:a05:6a20:3baf:b0:da:a06f:7e91 with SMTP id
 b47-20020a056a203baf00b000daa06f7e91mr14488722pzh.44.1680033794947; 
 Tue, 28 Mar 2023 13:03:14 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 j24-20020a62e918000000b0062d942f0ad3sm2769570pfh.51.2023.03.28.13.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 13:03:14 -0700 (PDT)
Message-ID: <c29203fe-b709-bb88-ff3d-29479911f9c6@linaro.org>
Date: Tue, 28 Mar 2023 13:03:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 08/44] target/loongarch: Implement vsadd/vssub
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-9-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-9-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

On 3/27/23 20:05, Song Gao wrote:
> This patch includes:
> - VSADD.{B/H/W/D}[U];
> - VSSUB.{B/H/W/D}[U].
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    | 17 +++++++++++++++++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 17 +++++++++++++++++
>   target/loongarch/insns.decode               | 17 +++++++++++++++++
>   3 files changed, 51 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

