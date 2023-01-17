Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFB766E8AF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 22:43:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHtiy-0006ZE-0l; Tue, 17 Jan 2023 16:42:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHtit-0006YL-AF
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 16:42:29 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHtir-0003Y2-Gq
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 16:42:26 -0500
Received: by mail-pg1-x529.google.com with SMTP id h192so23047787pgc.7
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 13:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o5DxAltWo1aKEgrqrZE3ecb33VrHVfohQgjyfzaFsiQ=;
 b=QiDQHx6G+8AcwFu0hBxmy3kljQ4BCbsJnHGKcj0kn0KxktNX1bZLst9pNFBG3ONIzA
 FLnYuqFvz2QqmOlpLyt1f5FDooT933g1Or08udfcye2QsfVmGl1hvJnPKCou4Sc9L5wh
 BRG3wkhAY928VmO04ao4RzzKaDezIayUoQMOuN7TdIoiMLUtqIzrR5Mu7kVruBXbdOsm
 foM3iqGZ+oOw9GlrzgGPlGWFzgcW6TkxT/lPAG9OVK9BaIjQRRiIkVP/R/HzSrHU9huh
 FTkbIYTbVIA9YPj2gHHVvWqVU545FmNfNv3G6wbcmExHrwqYG7nK/S670ABAWSMfTcID
 8wNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o5DxAltWo1aKEgrqrZE3ecb33VrHVfohQgjyfzaFsiQ=;
 b=CvL3yXztL6PI3Q/Rpvm6KAgOLZogBqf9J/CqWZbcnxyqsQCtZU8Kn6gRwh/Fv1Dou5
 wFaYPq+gxQvg4qQ47Ihvx7ufugs7MQVvqkTYYE1rkbS+6qRGMOECcKbeFKd7Lanf3/t0
 o5Witi9XvsJgFUn1NZCYcgNU9h0/u+oP+P/dhR8xtDLcGtVDeBLdI5torQUwbSGX1siN
 VeYo0uVfwTR6Bd3ZVzYbjb10D/GOHq9xrZk9CHaoVv4pmtAH6LK497m7NgOQF4ocKMbC
 ZdYJAkOZX4+/w+TXOxayh9t1Nw90+skQmmDPcWVIFOjaV+rwA6dopyPZ6yNyKeLqPx3c
 N4Xw==
X-Gm-Message-State: AFqh2kqXnCHTS3T4Ea64YJu4A2sIH0KCK+KfjRMZ7XxLK6O/7bWc6HKF
 uCJ+0EEXMZtjpBeOfJ4KavyT8g==
X-Google-Smtp-Source: AMrXdXtAVfmzko/2mOtfeOD3mxkFbm3jGEg3z+z71JiNEP7ogiszCoppDib95ZFbB1GPHNJp3287FA==
X-Received: by 2002:aa7:85d5:0:b0:582:6732:ee0b with SMTP id
 z21-20020aa785d5000000b005826732ee0bmr26495235pfn.28.1673991744103; 
 Tue, 17 Jan 2023 13:42:24 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 y206-20020a6264d7000000b0058659177fb8sm19115756pfb.86.2023.01.17.13.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 13:42:23 -0800 (PST)
Message-ID: <be662a38-c0fd-daf4-88e6-4adcde57fd57@linaro.org>
Date: Tue, 17 Jan 2023 11:42:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH qemu v2 3/3] target/arm/gdbstub: Support reading M
 security extension registers from GDB
Content-Language: en-US
To: ~dreiss-meta <dreiss@meta.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <167398464577.10345.18365355650640365165-3@git.sr.ht>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <167398464577.10345.18365355650640365165-3@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 1/9/23 13:05, ~dreiss-meta wrote:
> From: David Reiss <dreiss@meta.com>
> 
> Follows a fairly similar pattern to the existing special register debug
> support.  Only reading is implemented, but it should be possible to
> implement writes.
> 
> Signed-off-by: David Reiss <dreiss@meta.com>
> ---
>   target/arm/cpu.h      |  15 +++++-
>   target/arm/gdbstub.c  | 116 ++++++++++++++++++++++++++++++++++++++++++
>   target/arm/m_helper.c |  23 ++++-----
>   3 files changed, 139 insertions(+), 15 deletions(-)

Is there a reason why these are separate from m_systemreg?


r~

