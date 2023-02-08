Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CC368F831
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:38:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPqGS-0003ad-Dq; Wed, 08 Feb 2023 14:37:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPqGI-0003Zw-8C
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:37:47 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPqGB-0007yo-0W
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:37:43 -0500
Received: by mail-pf1-x430.google.com with SMTP id v3so634684pfn.6
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 11:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ttq6Wnz6qXqY/d1z/JX7mEqLBZoEer1h18I+kstmcP4=;
 b=OYxXdVdNEs09nCw42WI9nNjphMKT0kNptoDm+NweYDfnYdCLKbq6NxznSO+nF9s+5s
 tb+NGyY8rWLLTbKJEjeXoedlJh7mUUhbySpkHwrGTM4t5QqbHOntLIG0Gupa8M6zkDr1
 N6PZt4pHi7QcLl4gsJulWnTRiXDAFig1H3RqMGMBe2rMcW/ludHc/NDQafCZSRYoG3zQ
 QemLOy/WNC+o7TwdVu2tH0d6LgOF+T5DgiA04ieUehsDmA3S5pSR0IyN1r0kkZO2gD6m
 joT0qIbUjnZTG7tm6ZJGm6C3TMB2jQ/syP+lV0ziD+IKMHK6JRnmZCiyc8RTWpKnydh5
 OmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ttq6Wnz6qXqY/d1z/JX7mEqLBZoEer1h18I+kstmcP4=;
 b=pjG6OZbTPbcciJlc+1M+5R68m1j+qqpTivXE1pkmlwGnhIOy7CKaAKiJbhFBRNA5YP
 XLUsRCyb1hDi4BqDxhnBHkmBRFX3n4wZflJrlqQARz1Hnd/P8nk0sXdUOg0mVx7HkNLm
 unaGJEULlTtopXYr3apXm/I13zC+wnMhYhKeEBdYFepo0sY3F4g07zMvKVpf8mfHjGsW
 zbW69XJEOgBw1BXhQ5zQPrjYo+MJhmtUCi5U6ezmRM4dpTxKqflzOP34HL1fxLfpV6M1
 OGLkWZxH5ktXtiSEyNl8TtSldPcUAq71evdl/YeHBIZDiJmL5Z5rPBBfuYplhd2WowOi
 Wiow==
X-Gm-Message-State: AO0yUKVLaNT4uucw1LtlqjgW/RTUqGbWSn+ZOcOx5+7gA7YxBf815985
 DyclcCRphFGG2W4A5PCMgkFvEA==
X-Google-Smtp-Source: AK7set8eVQyP62DwTnNe8CcpVWqVKhflz6A2iVykrL9U70hjbqObu8zHd5ZscSaERUgn2qzSOX+lvA==
X-Received: by 2002:a62:1c8d:0:b0:593:6a1f:362e with SMTP id
 c135-20020a621c8d000000b005936a1f362emr1976814pfc.7.1675885056981; 
 Wed, 08 Feb 2023 11:37:36 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 v18-20020a62a512000000b005a816b7c3e8sm2449787pfm.24.2023.02.08.11.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 11:37:36 -0800 (PST)
Message-ID: <dcfbdf50-b7d3-2e01-2a08-c88e55a96d53@linaro.org>
Date: Wed, 8 Feb 2023 09:37:32 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/7] hw/ide: Rename ISA specific ide_init_ioport() as
 ide_init_ioport_isa()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>
References: <20230208000743.79415-1-philmd@linaro.org>
 <20230208000743.79415-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230208000743.79415-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 2/7/23 14:07, Philippe Mathieu-Daudé wrote:
> Rename ide_init_ioport() as ide_init_ioport_isa() to make
> explicit it expects an ISA device.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/ide/ioport.c           | 2 +-
>   hw/ide/isa.c              | 2 +-
>   hw/ide/piix.c             | 4 ++--
>   include/hw/ide/internal.h | 2 +-
>   4 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

