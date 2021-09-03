Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968B540059A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:15:04 +0200 (CEST)
Received: from localhost ([::1]:44332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMEeV-0004pG-KL
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEa6-0004pR-Rp
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:10:36 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEa5-0002cV-6p
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:10:30 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m9so129162wrb.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yJj673R8tVHoOI5p8OctJYJelo1hNmbZ1xfmdBnvOJU=;
 b=KCPm0seWx6K7WoXkOpsJ5tjyzRl6x1fq2HUx1ABY3+PjICIHrnN0u47UrFLv4h4Str
 PCfkvNTrQsE8t2zFlKFbFvNUj/0t93WG8Vla0VK6cWU0/AgQ/ix4Im4yPd3/EigmDR+9
 KidPkrZi+bvGMRRQw6iQ9DX7haaLsILz+lR3Ubw/CtO1gi8xbLEMkeazHGoOK/ik1LKt
 4u43f7JU9vYP2mHE+2gMi7adotB5SVVovb0L9p9PEW+bbJbq6nwPrYdkRuJkyDBQ5ulB
 gXF7mfRpqM4bS5uVNYnh9mPEbVO0G2woVljx9oob/POFRywzHFk4yPNS7/gIRkBQZa/A
 6fKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yJj673R8tVHoOI5p8OctJYJelo1hNmbZ1xfmdBnvOJU=;
 b=AIrAGpr8P22JuzFnZyWsZui65nT438YJlXA91nA+2SloQ2iUCQYks+qihwLDafSYEi
 3ueUIydVfGIph7JxX9AujNCHiluieBeijAuQUSRQAJ8nZ4yjefNrLTu1lyTc8LLFnBqN
 wgu/NnzxrKGGu2vsMEKAZ6eRSLe4N2acdyewuP49r9E+VxOr6SssVxayDm6/mGZzUfP+
 c9197SqqUMF5h+e1xQhSk+I8y/rBfhGqvLAETawCJav+Q2Zy8qkfWSjjk+mgvOHP5Jdo
 mmQjbkDnisf2WwQB3s0RStMQTgMY9BZOnjJgWsWGlUI9usl3iyA1jUgB/VgqMfdb0e59
 obTw==
X-Gm-Message-State: AOAM5338omkL5xi6uFMFZ0IN201O1g04svO/u55/GCdqJWVY4AVOqmgs
 s8dL1TKPYYYikBijMo+R4/5tjg==
X-Google-Smtp-Source: ABdhPJw+U8wTg5aA4aCgDex5vN8K8KRWRKMbfgS4tKEzwLJ04A3W9RKqiWCDZcipao6j+GtabWYqKQ==
X-Received: by 2002:adf:a2c4:: with SMTP id t4mr613137wra.258.1630696226689;
 Fri, 03 Sep 2021 12:10:26 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id u27sm115064wru.2.2021.09.03.12.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:10:26 -0700 (PDT)
Subject: Re: [PATCH 07/24] target/arm: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d004f466-df7a-e32b-d999-0501989aeef8@linaro.org>
Date: Fri, 3 Sep 2021 21:10:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Warner Losh <imp@bsdimp.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 5:16 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/cpu.h     | 3 +--
>   target/arm/cpu.c     | 7 +++++--
>   target/arm/cpu_tcg.c | 6 +++---
>   3 files changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

