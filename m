Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB21736F454
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 05:15:27 +0200 (CEST)
Received: from localhost ([::1]:48068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcJcl-0006Xq-07
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 23:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcJah-0005Dt-5c
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 23:13:19 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:44899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcJae-0004hg-AL
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 23:13:18 -0400
Received: by mail-pf1-x42a.google.com with SMTP id m11so4361301pfc.11
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 20:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t8ouAQpoWnBpPmE/MjiM7+GP9SVXxgn8dRqsf5VfeA4=;
 b=vW+Q8h0XgIYXg2uAo3+CEXOOSwIcyX9AB4rFSaHfzvLiKSSswk5uJ/ZRAZZdPHsSxy
 I5Nat8PcPFr5YASRtAOtM5NvueqSxOlzSgI/Ph4R1SKxmdkR1ClGL1NLXL3IG89yjMUn
 T8yCuRyVL9NeOIKJAu1F7QNLuKEyrzYmK/Q9Eame8FZjgFBer3ODsO3u8vciLJ9+f28t
 b5Rore8NocIcS+gWYysSYxG9o4J2NAHepJHTV1h52a9lEiWbwFFmxN9wBAjLF6PQdypv
 sr2ftdJwleyWldc8EZhDlUoR4fo8m1QDXFR/jXxbeyWq07tzdGUS0sl0JXUXBWdUBLK4
 AHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t8ouAQpoWnBpPmE/MjiM7+GP9SVXxgn8dRqsf5VfeA4=;
 b=DuqKPhlC9EbuTJe7TtJVfTgQ0moNNiPjAc1bY55foabPlg+ics0xN31Y+UulzfGzss
 8CMYkqmij+V+TMI4xVm8SWCAYXB4WagGiH3OUDX2WawCpexCSFWlItWtJzDwfnbxKGHm
 VRyW28Rp2iam5VAKtEXnDNrGVBxvmmBV2H9vs9vZoIJi6d/LvLH8uM+cMCH6f9OeN5vV
 sZ5ZGqaZHaA/SF2XoFfxisuqyF+ddSmhfrA38qGRjml2m8PFuofCDsVw35nBhcY5E4oB
 TaPatjQieaXLqSseMFE89UCriV199P5BeJnJHBOUw8D521nN5MvSgjKlLBAShIQ0zxWp
 4XRQ==
X-Gm-Message-State: AOAM532mfLTFbKTcPy2E/VmEthMvPOEhxsZEc8r9zSgO8Bo4Ub23FDIE
 w/lmAVse2xnfIz1O1LjXv1zW5g==
X-Google-Smtp-Source: ABdhPJxPLo7NDL2JelgeOUKp1aXdxGTzhnm57kTtjfvcOJYGYAznxYQ/+NtJWkco8hK3BqZhzU55Qw==
X-Received: by 2002:a05:6a00:1409:b029:27f:fb6a:24b5 with SMTP id
 l9-20020a056a001409b029027ffb6a24b5mr3128125pfu.18.1619752394474; 
 Thu, 29 Apr 2021 20:13:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id n20sm381460pjq.45.2021.04.29.20.13.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 20:13:14 -0700 (PDT)
Subject: Re: [PATCH v2 1/7] target/ppc: move opcode table logic to translate.c
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
 <20210429162130.2412-2-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2e3c4f17-1bec-7e3d-ca99-8b5da661ce6d@linaro.org>
Date: Thu, 29 Apr 2021 20:13:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210429162130.2412-2-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: farosas@linux.ibm.com, lucas.araujo@eldorado.org.br,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 9:21 AM, Bruno Larsen (billionai) wrote:
> code motion to remove opcode callback table from
> translate_init.c.inc to translate.c in preparation to remove
> the #include <translate_init.c.inc> from translate.c. Also created
> destroy_ppc_opcodes and removed that logic from ppc_cpu_unrealize
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/internal.h           |   8 +
>   target/ppc/translate.c          | 394 ++++++++++++++++++++++++++++++++
>   target/ppc/translate_init.c.inc | 391 +------------------------------
>   3 files changed, 403 insertions(+), 390 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

