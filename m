Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA9D3F4EFF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:08:33 +0200 (CEST)
Received: from localhost ([::1]:36996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDR2-0003s5-Hs
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDPw-0002nI-Tw
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:07:24 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDPv-00066v-II
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:07:24 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 j4-20020a17090a734400b0018f6dd1ec97so410925pjs.3
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 10:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wpJqkdVCVsuKeGfFobn/6P2m/jcYpMZZWCPhf1kBp1o=;
 b=B6Pm4H3qsD35eLi2DiEhKoFKzFtuUe1MO8gAmsUE9yscDoPOrnOgCxjpgA27G01Z62
 LMKO8NtyHDNOF6y6VXqfzoDRZg9TN4P6FTPxPKcf/Pi5OLsi7w2HZEstTupgHZiZRy6R
 qOPHwXdven1mKjKlltiLTm6A5KIr7l4URJtsKsWa5BtLg7S9Mqfheuc/EegZ4ZpKoLJe
 Tu2NmI2Z9aHvMHNzL734Qc6nA9YW5p/78tPs1ns3CtN5Jq3T+JbxXCrZSudTuyvrTyLg
 0aVTWi3np0yldi46/JEUqr96+XhyfIDjBIhlG8FQz72JQEqxnEwjqaOPD/nOzveXH5h2
 HhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wpJqkdVCVsuKeGfFobn/6P2m/jcYpMZZWCPhf1kBp1o=;
 b=bHYyz0A6+wi4QQf3FcA+md06sICGsZ/yCJGuFeS4xMClx83i/pWH0rN+HwTHIb33KG
 slvTYkY6azBZJBOmt+XcVOrKTPJL8nrEsftqwTT4kHMLfsJoyibKNxUkuRS21Pm2f4jo
 YOl8opZBALahX8qNna8Xyam6E5EiAXZVUnmi+s1mcswMi2LVIp+E2ApDAo8IgQ6s7Clr
 30oJ3crXTLno4n/jlPYTie7yrM+64GtssVR+t95wAJxeZDgc20PtJ1K0fHJyrDC+2uTq
 T+iJ2mWjs0h64G4jNYTPcKTHS55AiDzuX9kgg4Z/P7137rlHr2ljBViLqCJ0F5Cnu0st
 0lqg==
X-Gm-Message-State: AOAM531PW3ELKm4C0Vteu70BjaaPs1fhj/+esDCiTdUg+xvLVMbD2KhT
 8IPnfKxdFaypo+G9jJg5OcIjGr7GhqUc0Q==
X-Google-Smtp-Source: ABdhPJzAHhZfPWFIoVhHKG+WOxKiCpQefVPpUNj+LwBv4aWZN0IgB/82kzyZ6tPk4naZliKzDrwtMA==
X-Received: by 2002:a17:90a:708c:: with SMTP id
 g12mr21447630pjk.13.1629738441791; 
 Mon, 23 Aug 2021 10:07:21 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id p3sm20152755pjt.0.2021.08.23.10.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 10:07:21 -0700 (PDT)
Subject: Re: [PATCH v3 06/15] target/riscv: Reassign instructions to the
 Zbs-extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
 <20210823164038.2195113-7-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57193833-c447-03bf-11b4-e55642d8d776@linaro.org>
Date: Mon, 23 Aug 2021 10:07:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164038.2195113-7-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 9:40 AM, Philipp Tomsich wrote:
> The following instructions are part of Zbs:
>   - b{set,clr,ext,inv}
>   - b{set,clr,ext,inv}i
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> ---
> 
> Changes in v3:
> - The changes to the Zbs instructions (i.e. the REQUIRE_ZBS macro) and
>    its use for qualifying the Zba instructions) are moved into a
>    separate commit.
> 
>   target/riscv/insn32.decode              | 17 +++++++++--------
>   target/riscv/insn_trans/trans_rvb.c.inc | 24 +++++++++++++++---------
>   2 files changed, 24 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

