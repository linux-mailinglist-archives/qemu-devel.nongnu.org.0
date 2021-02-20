Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3472A32061E
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 17:20:59 +0100 (CET)
Received: from localhost ([::1]:35988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDV05-0001Xo-Np
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 11:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDUyj-0000qx-0G
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 11:19:35 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:43678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDUyZ-00045K-Rh
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 11:19:32 -0500
Received: by mail-pf1-x42a.google.com with SMTP id c11so3876501pfp.10
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 08:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UrW/Jaumk/6KvjG9ylnLtnA2dgOVtUMJyXzq5juuL9k=;
 b=OFCvwrtFsRDpR0Pl1msTiHUdKlO60nvtkKweuBXIoLJlgFh0t5Gmb3P1uhtFeymDnR
 bB5qERgMVe528M9Aols6wFffaz84FRNqcOV5sUxiWT34i94/WCOEzKXCitZx2Sxf93R0
 DmK3Nfdfp3UUJChBHyy6jdPbLCp6p1s8F2w6cVOW+iy6G+0x7rqj8Cmg+HIYKkK0aRIM
 TN0qxD3kMtXarC8SA/PO0dPV6BYSo85rfj/KK+UFWA7+VmvKQEFQ6TgXCdENcxDrZF+N
 IM/f6AuumbjGJvPuL+qD5aQQ5iLzygVdYaSx75ZE6+vA4bqY3CmFUnLdoBGEB+cvsrJ6
 8W7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UrW/Jaumk/6KvjG9ylnLtnA2dgOVtUMJyXzq5juuL9k=;
 b=XBudSuq1tMk74KQZwa3lDPJokcrA4kLi+Kt7gS6DJNeUfacTNXxPSJ7wMCd6g1Tfqe
 qiQRgMDUJ8a+X0w/mAeXqdvJ6BATO17ZpHxMl04MQrOpYvcIzgjRDEJfhycTz5B0ihz6
 mPRt7gg8I/q1Je1Rj7gYWlOaprU+D9MUmzU9ey+HJ59uQ23NzWsa2UgB3rl1w1xjrgQ/
 eAMeiNxH+F+EGaLjsf7cc0gj3KFg4k5V9bA5vaTVj8aXNVBPqxclR7ysygv7IbmRzM6d
 ow+C8XTokwTpYBaRy/6mA/oUXIldMDWIckz8WvPnG3xYgPBIrkJ6tdPkRLDt0HUbPrsj
 B2vw==
X-Gm-Message-State: AOAM532qEQs/qG8uOpFlxzzf8ZRrp981qdtlkPWctSTpkmVrTqz6e6r1
 Roz91XRDQhsjQsJzw5jZOhixCg==
X-Google-Smtp-Source: ABdhPJz5DUAjVLVwrZBE+M6UxzmehAlYLRpjlBIHqAp5jIFKE27XAsE9l9aiaJqWmoLTNp371fxx7w==
X-Received: by 2002:a62:2bd4:0:b029:1ed:6a87:e115 with SMTP id
 r203-20020a622bd40000b02901ed6a87e115mr2964122pfr.30.1613837960650; 
 Sat, 20 Feb 2021 08:19:20 -0800 (PST)
Received: from [192.168.7.36] (24-113-145-216.wavecable.com. [24.113.145.216])
 by smtp.gmail.com with ESMTPSA id
 lx1sm11683941pjb.8.2021.02.20.08.19.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Feb 2021 08:19:20 -0800 (PST)
Subject: Re: [PATCH] target/arm: Use TCF0 and TFSRE0 for unprivileged tag
 checks
To: Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210219201820.2672077-1-pcc@google.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7f891cc6-33ff-bd87-e1a5-98c874326be5@linaro.org>
Date: Sat, 20 Feb 2021 08:19:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210219201820.2672077-1-pcc@google.com>
Content-Type: text/plain; charset=utf-8
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
Cc: mitchp@google.com, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 qemu-devel@nongnu.org, eugenis@google.com, serbanc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 12:18 PM, Peter Collingbourne wrote:
> Section D6.7 of the ARM ARM states:
> 
> For the purpose of determining Tag Check Fault handling, unprivileged
> load and store instructions are treated as if executed at EL0 when
> executed at either:
> - EL1, when the Effective value of PSTATE.UAO is 0.
> - EL2, when both the Effective value of HCR_EL2.{E2H, TGE} is {1, 1}
>   and the Effective value of PSTATE.UAO is 0.
> 
> ARM has confirmed a defect in the pseudocode function
> AArch64.TagCheckFault that makes it inconsistent with the above
> wording. The remedy is to adjust references to PSTATE.EL in that
> function to instead refer to AArch64.AccessUsesEL(acctype), so
> that unprivileged instructions use SCTLR_EL1.TCF0 and TFSRE0_EL1.
> The exception type for synchronous tag check faults remains unchanged.
> 
> This patch implements the described change by partially reverting
> commits 50244cc76abc and cc97b0019bb5.
> 
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> ---
>  target/arm/helper.c     |  2 +-
>  target/arm/mte_helper.c | 13 +++++++++----
>  2 files changed, 10 insertions(+), 5 deletions(-)

Interesting.  When the the 50244cc bug was reported, I had wondered if this
were intentional.  The reversions, with the additional change to the el for the
syndrome, looks correct based on the described change to TagCheckFault.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

