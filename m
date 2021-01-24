Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C7F301EEF
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 22:43:40 +0100 (CET)
Received: from localhost ([::1]:34446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3nAY-0000ru-Un
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 16:43:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3n8X-00008P-Sn
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 16:41:33 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:43022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3n8V-0004ad-Rw
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 16:41:33 -0500
Received: by mail-pg1-x52b.google.com with SMTP id n10so7602314pgl.10
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 13:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QaOXhfEfmCY4o+DxpRSYOvLGce44Tf6m0e6zGTklaYo=;
 b=FCrsHU/7IoiOcZDpErrZa/6h4nVicGM2Dc0HTX13Ll6jQU+8gYECZY7SQvAt63fhj2
 /3B31eHlxt8MjYf2RwQPKxpisQHm+/kEQeKgwr9ho5ZppNEx1m5to0VNIfSfT0c5aZG9
 ViA+zv7ZZKZ50nKUoN1GuXPcE1q6Je0fo80/ZZSSh49yRmmfs32gU/IHtzp+ksz5kN5G
 Yb+OXn+lFu9WBaTXSMYFzx2kaZliMizWG/NDx8v63pw0NmtmnOoacGnsDl8lVQ3KowjI
 5EyJuhAvAjmQ2SbZqJ+YpOHA4FDTWnX2uSfrJDIeWIn5qwNUt+Gugr+Tl4i2qoD6xjIf
 CHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QaOXhfEfmCY4o+DxpRSYOvLGce44Tf6m0e6zGTklaYo=;
 b=pRWAQBoqJoqF9QLIo/y3ARWgFxWBMkMekFqOHq98ys222PyQt+iUe2AmXR7V1ziHNa
 9kCG5Gfv9AXkhi+419okVPv9nQiJtC370AtZX0sQQCImT45YNZw72VpV+ZinOEqELo0C
 mS2pPu6s2lzyeRDXfl0p5t2UuoR6HwBAUOLqrHDSqNgbxAZFecZFNkk3ZNx2nUe6atfl
 4ErHJZqG4qVSmVivd1cwV6m1lXkX3+J3vO1ciFI7e29P2qfvuKEl4XEbQ1iTEgRujX8o
 0BCtS8wyFoVuslQYjIOK6qlc1zf6n83Lt8WNpgjukouv9/ZguisIxEP7gWKHeO/1G2x7
 53Rg==
X-Gm-Message-State: AOAM533LW2hjHs/fnuprpc3QfbiYFdjQD3gec4/o+1M/m6d6tALu1DLz
 GW8QAnkzyCClbMfBXCF0BiAQ2g==
X-Google-Smtp-Source: ABdhPJwrBv3Tnj3PaaaD/sqVUOOOEb0JeM5CTLPvJgCXe5BWoj/xCQf1ks84SQuJBLFxFxJCxbh2YQ==
X-Received: by 2002:a65:680d:: with SMTP id l13mr14613009pgt.370.1611524489980; 
 Sun, 24 Jan 2021 13:41:29 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id i4sm6201242pfo.40.2021.01.24.13.41.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 13:41:29 -0800 (PST)
Subject: Re: [PATCH v2 06/25] util: Add CRC16 (CCITT) calculation routines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-7-bmeng.cn@gmail.com>
 <b9c150df-00e4-c785-1e89-dc135a51f4ac@amsat.org>
 <2927f234-a9d0-8fd8-c99e-b858aed1287c@linaro.org>
 <a87dbd17-b6cb-ae0f-10a8-9617c49a807f@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <21456d3c-559e-3ea6-bc5e-2abcfa088da0@linaro.org>
Date: Sun, 24 Jan 2021 11:41:25 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a87dbd17-b6cb-ae0f-10a8-9617c49a807f@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/24/21 10:24 AM, Philippe Mathieu-Daudé wrote:
> On 1/24/21 9:07 PM, Richard Henderson wrote:
>> Doesn't this get put in libutil, where it is only pulled from the archive when
>> needed?  Also, libutil is built once, not per-target.
> 
> Hmm I just sent a pull request with this change squashed in.
> Should I cancel it?

I guess not.

> My view is we don't install libqemuutil.a anywhere, so why overload
> building unused objects when some configuration don't need it?

My view is that util/meson.build should not be overly complicated with
conditionals.

If we were building objects per-target, that would be one thing.  If we were
doing --whole-archive, and including unused code in the executables, that would
be another thing.  But otherwise...


r~

