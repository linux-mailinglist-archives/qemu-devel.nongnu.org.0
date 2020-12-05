Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2434A2CFB5D
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 13:54:45 +0100 (CET)
Received: from localhost ([::1]:55282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klX5I-0005Tx-8L
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 07:54:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klX0X-0002k7-VQ
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 07:49:49 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klX0W-0006R4-3v
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 07:49:49 -0500
Received: by mail-ot1-x343.google.com with SMTP id i6so1921404otr.2
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 04:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r+0Ab0hE4VvTknfU4DTUQ8AnvurkH+rsMi6CDv9CFn4=;
 b=KGChlUD8kQuSgTTU6nG+nOf+aQWlvKyKN5UvCr5MHMS7nN6azXXkavg+90EHk2/zMh
 SoYfDdwgQ2TbFGb0EzdHkBbKVSoFU96fUoh5/Ppu7ryl+tpYmJcvVc/qvtdtVZpZW2ra
 emyq8oNzmJ9yYeAN0OmOC1BJ0gG8i4PDOFYAFaxMGnxuLwTeWY/jHaYgQo7C3ySWAFKu
 MppU9mBrqyKeV9KUDhI88htJSlXvRXIjO+uFMDHnnaPd0EKOSeNjdl25bn+NMgQewCSh
 T25FttucOoig4LqJ17D7MEmhyK+K2ij+kKEbQwM6HTQVNKQEgzHX7udNA+7FKu9Uwv1c
 t7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r+0Ab0hE4VvTknfU4DTUQ8AnvurkH+rsMi6CDv9CFn4=;
 b=PmdpBp7Qvso91PQGazHkWSjLvXU42VuAQAECKkYZ0xJgoBajWDeWgorTYcoqwZfDr0
 56Qu6ZHmfRU5iC51GJCZoS7L2SbxwTz7kBSGRUQbfh2QHAgzfxL8JWRSuOea/sXIkpV5
 /JZI6dZmtbK25ojF/FVXTsfXJ/2KvpuoavSEQjs7e4CWTTjTGyO+5pVT8MNvYzYASKHb
 QtRcWyiO+9gVx0Rn7QPchYOl2AdRbTNPgqIQgDVJoHmVTPsuL9M5bpCwVsPT/MqjKFjs
 2LnQH4sXJN2nRy3IShCKvR8ARzAtiMz1RdrlP0Yh2InAlx6AJQCw0RO3g+++pDFleHBu
 bC/g==
X-Gm-Message-State: AOAM532Inqseulab/0vWpd2NZmiCWXhNLJwjJEc4kuIFdo3J72Nfstdy
 tWDV4ArirmeO8mEnezHXHfkC5Q==
X-Google-Smtp-Source: ABdhPJxU6ZjVrMYivk42VIxm9IJkQY5zQwZgW6kPzHx+ZTiIQcXCjY/SrJW7rNqH/BiLuc35i5Mn2g==
X-Received: by 2002:a9d:64da:: with SMTP id n26mr6858330otl.64.1607172586935; 
 Sat, 05 Dec 2020 04:49:46 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id g3sm1392742oif.26.2020.12.05.04.49.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 04:49:46 -0800 (PST)
Subject: Re: [PATCH 5/5] hw/mips/malta: Rewrite CP0_MVPConf0 access using
 deposit()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 qemu-devel@nongnu.org
References: <20201204222622.2743175-1-f4bug@amsat.org>
 <20201204222622.2743175-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a02b6c72-b3dc-7435-875b-9ced878ecc2a@linaro.org>
Date: Sat, 5 Dec 2020 06:49:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201204222622.2743175-6-f4bug@amsat.org>
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
> PTC field has 8 bits, PVPE has 4. We plan to use the
> "hw/registerfields.h" API with MIPS CPU definitions
> (target/mips/cpu.h). Meanwhile we use magic 8 and 4.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> We want to move that to mips_cpu_reset() later,
> because this is not Malta specific but cpu-specific.
> However SMP 'cpus' come from MachineState ("hw/boards.h").
> So meanwhile this is early review.
> ---
>  hw/mips/malta.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

