Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203A35B6916
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 09:56:57 +0200 (CEST)
Received: from localhost ([::1]:47278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY0mu-0007Sc-7o
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 03:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0iC-00047U-QZ
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 03:52:04 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0iB-0006RT-2W
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 03:52:04 -0400
Received: by mail-wm1-x32e.google.com with SMTP id e18so2692629wmq.3
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 00:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=eNS5KekNwBS3111BT2wqS4H4zqus9NbfRNlN1VFNRec=;
 b=Ti35s9aV15Ls4bzrhIj11qa68V5v7NxVxPelaj4G4ING5+p5hyAKhvY/mf0jp4VuOE
 8gJz1LEThMFKGUiMOnlZuvRk3tLc+L8iJcg4EStelhoujUj/GUEaVpAPigNOqhEthYSc
 NqR8z2zCxV9gE+IMxlup/dNucmOkMWkL9HFPJV2FugA/N4yWmbct3OVdYebBSlWXWPLI
 45ES7/DX68BltbjLBG5p639EIp0i4TXioUcoD6qJb1n0kD49D7C72M5s33SWldUCm/Pz
 jYX6RPueUPWto698ouIA9HBrSxvQAuvVS+P4E06FX+DIUF/DBOoVyV0OogMX7x1nBaIR
 LmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=eNS5KekNwBS3111BT2wqS4H4zqus9NbfRNlN1VFNRec=;
 b=x4MelzvdQhuVYIT8CzbTB08z0ou4zks5Rz6Xnv+9z9ELXyBJE8acM8srux8RD32cMF
 bq9U7OqFmVtH27rRhqrwrw5EKLma7J9ehSmYjk4nwbgFquSUIsMu62GKsgiFQiLZ5wbG
 43GRY4A8LFvDknKXNVyIWxbOFhkkOWZQTxJ0IyFpXJQkpMbG4Vr3hHp4oIcWeoiH5CTU
 ZyRWYSGBqCvFi3KRD8gYpDKIrQYYLwFlE2D5dNmD2jlZmFRlz/ZCoQOSkuwxT8BSF1Qs
 rvefc7Rvsja8+R4KeGoNkim+00InZVF/ruH1XvCFjtM1pPcMRK3oNtG91trKJxUezMB0
 ZNgw==
X-Gm-Message-State: ACgBeo3XxuBMKc2OO0OIqGyjbieqvPYmQ+YvRrflGj9PjtkwAjBqSPGh
 4W9v5OqFQDCgaMN+reVO0TH/pQ==
X-Google-Smtp-Source: AA6agR7Pr+cw3HQFxx8u3AKoPzIyhn99DfJz9Q1Mtz1/EeIaqVO+zSYWC0zg+Bwrfw0cZcTKrRXbxg==
X-Received: by 2002:a1c:2b46:0:b0:3b3:34c1:4cd8 with SMTP id
 r67-20020a1c2b46000000b003b334c14cd8mr1435238wmr.42.1663055521162; 
 Tue, 13 Sep 2022 00:52:01 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a7bc7cb000000b003b3401f1e24sm12425104wmk.28.2022.09.13.00.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 00:52:00 -0700 (PDT)
Message-ID: <692fdb95-95c1-c1e1-2a86-c8e43d1b648a@linaro.org>
Date: Tue, 13 Sep 2022 08:51:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 04/24] disas/nanomips: Delete NMD class second field
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
 <20220912122635.74032-5-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220912122635.74032-5-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/12/22 13:26, Milica Lazarevic wrote:
> We're deleting the m_pc field of the NMD class. It's now part of the
> Dis_info struct that this patch introduces. Currently, the Dis_info
> struct has just one field, m_pc, which we need for address calculation
> in the ADDRESS function.
> 
> We're filling Dis_info at the entrance of the nanoMIPS disassembler.
> I.e. print_insn_nanomips. Next, we're adding that information as an
> argument wherever we need to.
> 
> Since NMD class now has no more fields, the NMD constructor is
> also deleted.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 1368 ++++++++++++++++++++++----------------------
>   disas/nanomips.h   | 1292 +++++++++++++++++++++--------------------
>   2 files changed, 1331 insertions(+), 1329 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

