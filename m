Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1F22CFB55
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 13:50:37 +0100 (CET)
Received: from localhost ([::1]:49720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klX1I-0002nu-Kj
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 07:50:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klWzA-0001Z6-U5
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 07:48:26 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klWz8-00061O-OX
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 07:48:24 -0500
Received: by mail-ot1-x343.google.com with SMTP id o11so5322990ote.4
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 04:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=neEnVOej4e7RWx5aJaIZ5LXIKuwkAelxhG6HzDeEd60=;
 b=ZkR6VGg6V04pYcaFw67VqmMzgKe11+urBAyZfmBWA3p8aOuSKKX7SxOpxhw8DqdzfP
 vz8FDtpMyIBjLd9Zl7ZQhfpNgzcvuI/HU17eDJAdyBdHvqxn+4bgKlZTVpYOMVMvN5FR
 lJGLmMYgxRVwtI2bf4O5HyqWc16cQbs1n+P6Yom10bDbgzyHMFS/+wWn5fhZHp12iOR7
 khGKWgQdO8onbUTDp/vKFSP5w0pexgZ61tcwR0ZRDPDTsSy2fZqe5oT1A1pc8yGt/43y
 SurxDyyfHP52NCRfwaU+nSi8fyLOBJOnFhddLE3b+NW9MmGYHILDWOGqydFISYAJHFwE
 0NNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=neEnVOej4e7RWx5aJaIZ5LXIKuwkAelxhG6HzDeEd60=;
 b=I0PlFJ2dkUD6TGJ2osfwNmKYlR7rl76B1CqF8MxRCUSvxNIt6kAqbdVCXZLiloUc3+
 UEnxpsMpHP0GClcHW9Il4Qfalx/XuRIT27//BGdSwEaURi2PDNjdva3vu1gYoC/Fvyqn
 brSLd+K8qftjIKZbKutBAFiBGmizOUWH45w4nXUZCHquIHUC/xCFA/754hebxKNho0bS
 0pHdaGRuLlcPU8I8SQJ6S8JbaVJZYV+H3LU6TXulBvSr/uBzkq7zEils0eHBMJp3doHf
 VD+C9gvL6eHiosog72K6oKCsJRywXr4Q5tAEzlYgKnnXK/1Pq5k9eT0xxnJ+DY2uPx+O
 s0QQ==
X-Gm-Message-State: AOAM533STYCGF9cidwrk1tlzMoezEOGth8N6R92qn4ffByLbImFLDNCr
 IBb/yv4h44e0a5uweHbsZnM/2g==
X-Google-Smtp-Source: ABdhPJxDpzcpldJcK4jrdS9nuv8h6o1UmvrssqjEPzjxXcBkRrl5HF25HK8t0lT84W303IAadlh3+w==
X-Received: by 2002:a9d:620f:: with SMTP id g15mr6126416otj.361.1607172501551; 
 Sat, 05 Dec 2020 04:48:21 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id u10sm1319250otj.31.2020.12.05.04.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 04:48:20 -0800 (PST)
Subject: Re: [PATCH 3/5] target/mips: Do not initialize MT registers if MT ASE
 absent
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 qemu-devel@nongnu.org
References: <20201204222622.2743175-1-f4bug@amsat.org>
 <20201204222622.2743175-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <75d0934f-0c35-6faf-374c-572b182e88df@linaro.org>
Date: Sat, 5 Dec 2020 06:48:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201204222622.2743175-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 4:26 PM, Philippe Mathieu-Daudé wrote:
> Do not initialize MT-related config registers if the MT ASE
> is not present. As some functions access the 'mvp' structure,
> we still zero-allocate it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate_init.c.inc | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

