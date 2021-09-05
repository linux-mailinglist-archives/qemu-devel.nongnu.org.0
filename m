Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD55400EA6
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 10:05:28 +0200 (CEST)
Received: from localhost ([::1]:56910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMn9b-0006OD-6o
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 04:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMn8B-0004M9-FU
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 04:03:59 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMn86-0004qT-AB
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 04:03:58 -0400
Received: by mail-wr1-x431.google.com with SMTP id z4so4901155wrr.6
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 01:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ONDliamBoZzm2VL6YJKXlkz2ekKu0QeUOQxu5FK8uWY=;
 b=fu80oLwpeK7TKEI65D1qoNioFiLvMzIoq7dQIRF+JaFxGZyhVq6xm/vDEtD7qPjDLq
 3reA1ABuU9bQXn6lLgHXqZzg/Y/4Kq08nduCbS8LkArs823QiQIPAWNxANNCpUM2UOZL
 Pf3RQN2S5KYMVlfInqBx+p2PIS1RNuw2X338NdXOrrcRTkXd8T3c3XpvN++70ZeaowdV
 Zr0NqA1k7la5NWkGCFFjF0Bemx7H3xTFnd7IDzxqyi2QAAK/eVOE782wcs+Kxel5JxOG
 e2SdgXvzaiB7aaHyXNm0I3fTuIxRacKJZe78QdLGWTW5l4p7OxK27UwG5HurFmIvv2Os
 +CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ONDliamBoZzm2VL6YJKXlkz2ekKu0QeUOQxu5FK8uWY=;
 b=NYY2ILBOqc53bki7qis4rgN5PdX6Gzv613eE+/F/56vUW4TIHBFeCI8YrMeR+BmTia
 eVV6axVq+tVZebaEwsR+P9c/8wsZDWJdAHkfdjcYDuwMLolGhWJ+qdA6hwlDOTh1ggMA
 X6Rni475Jy1VRrruWpLanZw448orSr66XYWjj8H8P0a+TPMFFwSPWEB4B2/raw25FbSo
 jiSmPAzix/tdbnFUcejZChEBn9iUqmfQVnkAiq6Ub3iVJX/QuCYJZite+D6OZ7FPzqFR
 HcY0r/k96G8Dov7tPqRAAdAFNWw8WAs4T8ooNG+zKGJMOOggT5ZpMYxbNPA+Xs0rXJGF
 7nJw==
X-Gm-Message-State: AOAM531BVxGrsAQ+Gp+J3h/QOpei00ZLYhUa42JzjkmuXREqzpGeU0oT
 AFIKS41GNm2HGmlQfEfcV5yUpQ==
X-Google-Smtp-Source: ABdhPJxix6RhZiSMjUriDnhnPBhNWFrKjpaNcNDniUGFS0Y1kLv6g64YZDzCEH7iDt0fEMuYMOEDAg==
X-Received: by 2002:a5d:4f02:: with SMTP id c2mr7111384wru.311.1630829032148; 
 Sun, 05 Sep 2021 01:03:52 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id m4sm3904664wmc.3.2021.09.05.01.03.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 01:03:51 -0700 (PDT)
Subject: Re: [PATCH v10 01/16] target/riscv: Introduce temporary in
 gen_add_uw()
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-2-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8f28bf0-ffbc-eb49-7d77-698aecc442fd@linaro.org>
Date: Sun, 5 Sep 2021 10:03:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210904203516.2570119-2-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-3.832, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/4/21 10:35 PM, Philipp Tomsich wrote:
> Following the recent changes in translate.c, gen_add_uw() causes
> failures on CF3 and SPEC2017 due to the reuse of arg1.  Fix these
> regressions by introducing a temporary.
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> ---
> 
> Changes in v10:
> - new patch
> 
>   target/riscv/insn_trans/trans_rvb.c.inc | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Fixes: 191d1dafae9c ("target/riscv: Add DisasExtend to gen_arith*")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


