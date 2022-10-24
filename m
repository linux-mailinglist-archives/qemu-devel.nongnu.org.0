Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A64760BE34
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 01:08:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on6V9-00081j-9H; Mon, 24 Oct 2022 19:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6V2-00080S-8K
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:04:55 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6Uz-0004pQ-BO
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:04:52 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so4885993pjc.3
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 16:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NHRDNfeFt6+ldbmM3kYFxAh0cI/sDL8PdJVgoIy8I2I=;
 b=pTcpVetQqS+wywk5BF3mQqlx950Y/hiEjjFQQuIn5kCJiRgnrDoV7ZYfU7gId1jlks
 qSZrAhYRXGcTCrrknXdBIQTNdEpjpLKPnAK4zeFJzDPpccI5WKp3cdvEfe2Wqm1EadOe
 MlIaW7AtopJ+EFwb34/Utr1VqZlB8KoEcXTu9EcmqSZW4VicFN5CJFcpDcDA58WUgv1D
 X2DbYMRW+NHVKpO2RmwEt02MeKteeRBf2Pxjg5ajbiTRIv+YXlefucjxO1yiu2FYNix9
 YcXOdcq6UA432WWNsCjePFxYHXoV2/1oz51pDQ50lCIAXw2xcuRcwd4H0ZKrjGWZI7CS
 sAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NHRDNfeFt6+ldbmM3kYFxAh0cI/sDL8PdJVgoIy8I2I=;
 b=p2aA+kmRHzTEs8M9p9iC6877IcQWE1Jlvbf7NhFG5ReT8YqvlQh+oC6Zr6e08n0fbO
 32AsPos+I7puqKWwXaHdok7SuHLNQXUfePc0roj1Op0IsWakbD1vTsaFWXt5hid6SZnW
 Pk8XN+aFWwnWlmm87x0mhSBveBrKZeakj22re/hocPgXjG56WwrRKlcL3rVM98aZ3An+
 FPLQiUbku1RFZgi52HZfpSlZ6rsdSPIJ5Gnv4ZFtWJoP09SVLpYZEU170cVUCcUTSLvg
 xyR01Zs+a62Dhje48B1oFKt/39uyTbXxFYg2nhRClT/bVNY4UNSisFuaYv7LDnSjTgBN
 SBHA==
X-Gm-Message-State: ACrzQf1PlNBLtweMJUvsXj90Y3fN3yP1g8EjIwNNfYKjMSiinPbmcEX8
 y5xQTMjue5z/1B3U2wox8m48IW891+oP6Q==
X-Google-Smtp-Source: AMsMyM6KR5k2GKQ6g+XKCyDNbtAG83HMjbVgfJJo0lLmiJGXjRVJGpMVEE69Ixyi+zmyZPGrsFFwmg==
X-Received: by 2002:a17:902:be18:b0:178:b9c9:97b8 with SMTP id
 r24-20020a170902be1800b00178b9c997b8mr34710584pls.38.1666652687840; 
 Mon, 24 Oct 2022 16:04:47 -0700 (PDT)
Received: from [192.168.136.227] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 64-20020a621443000000b00553d573222fsm277399pfu.199.2022.10.24.16.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 16:04:46 -0700 (PDT)
Message-ID: <b9953552-fbb5-0029-dc76-eefc7651b4d4@linaro.org>
Date: Tue, 25 Oct 2022 09:04:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 00/26] target/s390x: pc-relative translation blocks
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ping.

On 10/6/22 13:43, Richard Henderson wrote:
> This is the S390 specific changes required to reduce the
> amount of translation for address space randomization.
> 
> Begin with some generic cleanups, then prepare by using
> displacements instead of addresses when possible, then
> add some tcg infrastructure to avoid a code gen ugly,
> then finalize the conversion.
> 
> 
> r~
> 
> 
> Richard Henderson (26):
>    target/s390x: Use tcg_constant_* in local contexts
>    target/s390x: Use tcg_constant_* for DisasCompare
>    target/s390x: Use tcg_constant_i32 for fpinst_extract_m34
>    target/s390x: Use tcg_constant_* in translate_vx.c.inc
>    target/s390x: Change help_goto_direct to work on displacements
>    target/s390x: Introduce gen_psw_addr_disp
>    target/s390x: Remove pc argument to pc_to_link_into
>    target/s390x: Use gen_psw_addr_disp in pc_to_link_info
>    target/s390x: Use gen_psw_addr_disp in save_link_info
>    target/s390x: Use gen_psw_addr_disp in op_sam
>    target/s390x: Use ilen instead in branches
>    target/s390x: Move masking of psw.addr to cpu_get_tb_cpu_state
>    target/s390x: Add disp argument to update_psw_addr
>    target/s390x: Don't set gbea for user-only
>    target/s390x: Introduce per_enabled
>    target/s390x: Disable conditional branch-to-next for PER
>    target/s390x: Introduce help_goto_indirect
>    target/s390x: Split per_branch
>    target/s390x: Simplify help_branch
>    target/s390x: Split per_breaking_event from per_branch_*
>    target/s390x: Remove PER check from use_goto_tb
>    target/s390x: Pass original r2 register to BCR
>    tcg: Pass TCGTempKind to tcg_temp_new_internal
>    tcg: Introduce tcg_temp_ebb_new_*
>    tcg: Introduce tcg_temp_is_normal_*
>    target/s390x: Enable TARGET_TB_PCREL
> 
>   include/tcg/tcg-op.h                |   4 +
>   include/tcg/tcg.h                   |  49 +-
>   target/s390x/cpu-param.h            |   1 +
>   target/s390x/cpu.h                  |  13 +-
>   target/s390x/cpu.c                  |  12 +
>   target/s390x/tcg/translate.c        | 858 ++++++++++++----------------
>   tcg/tcg.c                           |  14 +-
>   target/s390x/tcg/translate_vx.c.inc |  45 +-
>   target/s390x/tcg/insn-data.def      |   2 +-
>   9 files changed, 461 insertions(+), 537 deletions(-)
> 


