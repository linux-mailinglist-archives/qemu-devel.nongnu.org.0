Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D1E64FB5A
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 18:39:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6b9O-00051n-EK; Sat, 17 Dec 2022 12:39:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6b9L-00051V-Hz
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:39:03 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6b9J-00048f-VJ
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:39:03 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso9194613pjt.0
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 09:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eks8jnVYYxSNuu1efsA4JmN9bzvUVgEahCciWCkd1mM=;
 b=CmmhREkRHb9LK7D086RAFBjVvO6graVkDwH+qBWFXZg07Mqvd1c0VXx97qgZ6oU87a
 xnlrgeHkWCE7ElSvUeRycdN1L2GA4u/KhZ3LMPAS2s3NSiLLvgjCTIff/Ut1GQUrhVDg
 ZuVyupIyzqXuJgQOX6wdZQ7LCe+L7tBk7uYBS+SVAJ5BLUEQJABMmP/Pye6BJluAr0Wr
 VazwUzeHRHPKRK24UrtiLeGZ+6pOzgPSRDb962jH1Ze9L3RARV3fGYSwfcRVdj5bl9G2
 SOv3YlMJaVU8BSiJYmm5vBctCRIWOsrOX4CMZ0JgGou50UySRNaeb00QV/mbX8VTbE3C
 F0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eks8jnVYYxSNuu1efsA4JmN9bzvUVgEahCciWCkd1mM=;
 b=avRixl49CC0lNzAW6XsrYv2mV/WCivZB+HMr6yDpzQpftzmZ+C4wScb+68/0JQea6u
 GB5eea0L7Jq3V5jmMza17wka3EAc/eY0M31IJDYXlgf8QFGfN9CKyC5tz7Z/ZCmoOutk
 V3/1bSGX0kPKMiRHUDevzLDoqDKlGsGMp4QmQzvhH8yRPGsaPCUcE/FSZU3LC/b4WQrT
 cVinFNysyeiPMWMMNLG4RZrGDaJYhTwpEswsSFADliCnMwDeDC/MmRg4272LXigh8Pbt
 rnbD/q9WWAteD4imZln+Yk1KUpdGIoTY5N7QlCKySbwWUhvoHPICg/3ZL3jORo8ftBgY
 e5fw==
X-Gm-Message-State: ANoB5plWgdmvAWS+A1yIZC46Jb4D3eHnqZzmereJ1ixfwyIZ6LnUZMKF
 Yxn0KkQ1CeA1/vxu3kA1DN408g==
X-Google-Smtp-Source: AA0mqf5X1d0hB8jxtDMhbODs9J200eiXBwutXRyIkt44whIIx/cgMWXrNNFNysq4k+FgP1JxIOCrkg==
X-Received: by 2002:a17:902:f243:b0:189:d051:129 with SMTP id
 j3-20020a170902f24300b00189d0510129mr29855400plc.66.1671298740383; 
 Sat, 17 Dec 2022 09:39:00 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:dbe7:d50a:f977:e69b?
 ([2602:47:d48c:8101:dbe7:d50a:f977:e69b])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a170903234a00b00177fb862a87sm3826117plh.20.2022.12.17.09.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 09:38:59 -0800 (PST)
Message-ID: <2c6b5147-23db-343c-67a4-9a5cc6e4d8e8@linaro.org>
Date: Sat, 17 Dec 2022 09:38:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/5] hw/s390x/pv: Restrict Protected Virtualization to
 sysemu
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20221217152454.96388-1-philmd@linaro.org>
 <20221217152454.96388-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221217152454.96388-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 12/17/22 07:24, Philippe Mathieu-Daudé wrote:
> Protected Virtualization is irrelevant in user emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/s390x/cpu_features.c | 4 ++++
>   target/s390x/cpu_models.c   | 4 +++-
>   2 files changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

