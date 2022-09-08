Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EE45B15FE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 09:50:23 +0200 (CEST)
Received: from localhost ([::1]:58058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWCIo-0004Fq-3A
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 03:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWCF5-0001dQ-Pr
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 03:46:31 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:46010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWCF4-0003Q7-8T
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 03:46:31 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so1118081wmb.4
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 00:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=DhLqb6+PC2DsBAOxuSMWxkJpnOzD4mDj8ZSprdoU6k4=;
 b=EWWsDNK908ohYPw9AdIkIK5Zjcl7SOE0aNGKZBUuPKZoMFFUA7gEeEmRsW4UWWo4sd
 FO1x2Twqq3dYH6p50uu87rYusuZWSduyUqGMe+GnD9SYctlU8D5ENNZ8xb0uHrvA1boP
 PA77MiFEoN26Nap9Rlknloe+bjxgA+1FA0Owg4kQrjuXGItg1aEN1kD1Q8Z7hVCO3lp4
 Bhsxk46Cgkly8pP9YzU3P8GOMTqDQiHYzXK7MTp5wMQgJm0OwlzWOVC7HDKHColQrCL4
 lAdTCdd0NCk6X6z0EbRlY4ZPtWaFSIDVdAuSnozSUYFdlLEnNMNO4O1HvfGVsB5RIvFh
 DFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=DhLqb6+PC2DsBAOxuSMWxkJpnOzD4mDj8ZSprdoU6k4=;
 b=vhvJPr8myTNwKcLWN01W3Xa0P9CAlsUngfx3lV+Ak6BeUb8HEspXwRTaJ4YjBZrQZ+
 lkHLTpDRGfpGYP0dJN4YHp45SkHW4lzx15eqPEyosquC/kmOLHGmsBM0FhWn4idhTUbe
 +Th3Q1lHUf1aXmQGYPcSId5fijpZoe7CgLFEKCmd+5ElMRkKVhsWAGYFM6UDfnyauKQ4
 fZpH+bMKwUGxRUQKTPVdYUrqPM5qI2+2FUA5epZWFxzMGJO2svRrtIjZcbZbKIl4VBku
 Qnh4YU/6J3LnJhb4raI/KJCrEPhblEPU8UP+swOqEiymTAncm5kUeMonaJ8r202vrZb+
 SaRQ==
X-Gm-Message-State: ACgBeo3aHfQZIZz/Qx7hgiKIz1oe6V9eMGaqF6bGzH0YZwCcDhaOpNQ+
 94dCmCvX22vDOKIg2UkIrkjscA==
X-Google-Smtp-Source: AA6agR5KVd7tj4Z8HSqYyAAcE3Uvm68CWuwERbUEahjlm82AvFg2gAtl8ulahTg0tiY/eXatH1eWOQ==
X-Received: by 2002:a05:600c:4f43:b0:3a6:2335:f5de with SMTP id
 m3-20020a05600c4f4300b003a62335f5demr1315436wmq.109.1662623188519; 
 Thu, 08 Sep 2022 00:46:28 -0700 (PDT)
Received: from [192.168.1.87] ([109.78.97.14])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a5d528b000000b0021e42e7c7dbsm18798489wrv.83.2022.09.08.00.46.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 00:46:28 -0700 (PDT)
Message-ID: <9eba2b9e-ebe0-bf2d-2dc7-75ae81b0592e@linaro.org>
Date: Thu, 8 Sep 2022 08:46:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 11/11] RISC-V: Add initial support for T-Head C906 and
 C910 CPUs
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
 <20220906122243.1243354-12-christoph.muellner@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220906122243.1243354-12-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 9/6/22 13:22, Christoph Muellner wrote:
> +    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C910,       rv64_thead_c906_cpu_init),

Why model both if they're identical?


r~

