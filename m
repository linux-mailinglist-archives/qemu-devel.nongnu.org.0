Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C703F73DB
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:57:53 +0200 (CEST)
Received: from localhost ([::1]:44306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqbQ-0006tB-58
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIqVL-0006lW-NT
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:51:35 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIqVK-00075d-5A
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:51:35 -0400
Received: by mail-wr1-x431.google.com with SMTP id q11so8778115wrr.9
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L/YVpq+J77Bycj8+nBOzgX/yrWqFCZT6pOaOlDG/U0A=;
 b=rn/lwwC4ZfcwQp/jvUpN559apPSnI6ujgKn+ejhEu9E1sFcYGtlaKbnpnvyK1CTl0c
 s9hJGj8xpOuYFLURS9pY2oaFFH7KwSrkLJEuVZ7qB3O0VSZPxew21mutAs29s82e1C2U
 ECEklj75YSyw9KGiMWWOWMXlEiPQSrgOtGGJiBA1ghl89VISVnM2w6WeUmSzQyBvoBez
 NVhuEMDRBFVcfwzL1Ob4+I9offmCeMuRtQ8Hz5Ek980SO4idzZLr9EPsQ2q+ZIdoKIOt
 KW959/0zjTlvhqgYV3nCoB0spay0BaO69Q4SZkjBKPxZC6jbZPFZM/UnN5k700JVEW60
 dBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L/YVpq+J77Bycj8+nBOzgX/yrWqFCZT6pOaOlDG/U0A=;
 b=myL3hShsbVtBgPqS9FumsWwBOC3sBxOwIwuksstsLAPE/nWy9t/dJIFopdPowWE8K6
 oDceQ1cafQRh6sYx2AtLT3pkRMNfH5Vub01ka2mgZbRBGXakvWC25ooSW+pZkPrytovX
 20cBOEDL/WaNI4Ku79RUvLjRQH4+I74XP6KOlgfTx6WfYQps9AtR7qIQXjMWG4ADVBEk
 sR4NyYOIKzxoT24m44t+0J+H+05I7lkQYrFnqD+doxE7cPnP/A7XaaH5N0fTVwAwqiFX
 bxSG8ldMkKNSmZIfesodbOPcAnJjKEUX6cysSye87fTsNt/h3AOuqcnrzRgL8Wdgkq4E
 i0uA==
X-Gm-Message-State: AOAM530RMVm5bnkdC7gFsBDAC9oSxhGcPUk+y+BsA+GhP6ZRFLsT4Ez2
 rkJol/msnf29e5eDT/PEDa0=
X-Google-Smtp-Source: ABdhPJwVecvJ+N80bV+4AV0NSr7XQteQF0HyYGUzIvR7CyK063UkMCZ5+gvqFMzFAkhc/fWpIvFLPA==
X-Received: by 2002:a05:6000:22d:: with SMTP id
 l13mr24521198wrz.410.1629888692967; 
 Wed, 25 Aug 2021 03:51:32 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id e3sm21486676wrv.65.2021.08.25.03.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 03:51:32 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Remove duplicated check_cp1_enabled() calls
 in Loongson EXT
To: qemu-devel@nongnu.org
References: <20210816001031.1720432-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e5da4026-b6c1-152a-b9ea-8f56161896c1@amsat.org>
Date: Wed, 25 Aug 2021 12:51:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816001031.1720432-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.24,
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
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 2:10 AM, Philippe Mathieu-Daudé wrote:
> We already call check_cp1_enabled() earlier in the "pre-conditions"
> checks for GSLWXC1 and GSLDXC1 in gen_loongson_lsdc2() prologue.
> Remove the duplicated calls.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/tcg/translate.c | 2 --
>  1 file changed, 2 deletions(-)

Thanks, applied to mips-next.

