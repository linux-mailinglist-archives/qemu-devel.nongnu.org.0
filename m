Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06799201F0F
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jun 2020 02:17:45 +0200 (CEST)
Received: from localhost ([::1]:35500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmRCa-0003k3-2r
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 20:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmRBA-0002pK-LN
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 20:16:16 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:34287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmRB9-00078C-6g
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 20:16:16 -0400
Received: by mail-pl1-x644.google.com with SMTP id n9so4627729plk.1
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 17:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=icN0QAPcX4TIqm/OWWpGa13ALt6C2bZFJ8ggwwRjPUw=;
 b=PDbBzzkU28Rk9waQkw5Rb5YJzrmWCetBBAZt/i27GrlgFh2dAInyaPXVjSQULC8//E
 DGEwR32F0ZEM32BZG8nKnB7NdqYQ494jNtRuSIaAs0dtNGTqY0i1i7o+5igpOQG7lS05
 HDZz3hf09mnPp71qbr5oWk9g4ALcPhkGM48hu3SVUScWngte3OP+NnqDtt6lTee3JzPT
 B8wLapnWiErSqrwersCjGRUEXVbT1I96Mgj2MPjGuCUqmTRzaM1sAv7WoV5g3RAJaDLn
 JuYNWoBFtKeF2QOE7riTx0aR8DiQpCm5joE8AOAB+8N1Ce70EyF3p0ZOM+zfuoCQE4G2
 5EGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=icN0QAPcX4TIqm/OWWpGa13ALt6C2bZFJ8ggwwRjPUw=;
 b=klK7A4nudmyDTnyh7+OJP0KaTOiXW0/r5Zh4v4LtDggzRHZQLFQzx3lgbJSijVrjSw
 HAjtHhwC9NhqrX0cKhfF1ahTTmUu2p9gBIwhfhColxnfA7jODApo3nOjCuhtIWEy+PNf
 lVwApwJY+58WL19uJ99eimfFDjeMFuXYIkiMolVW3PdNPC5lQ0qwgBK7yQwG7BZ3n6sJ
 oS27fv0HiWQZifYdc681RqwUfepoaOLftVjMCr34bcoTlM724h8jcY0FndglBhg3qnq1
 L8GkOH2y/CICgoC7l+CVaRrpwLDKEJ13fC2VnOPuiBc2ff0tcKy0/yHbzAuuiia8I5qG
 Ba8g==
X-Gm-Message-State: AOAM531SzFnnDout4JMEnm9/MufsWGx8arhWkhdMn3gOWHRe+lKj7X3g
 Mkn8bOkrhQzAiE4REQCu5fzl/d7+1Og=
X-Google-Smtp-Source: ABdhPJy4XdaMnHiHyHzL79Cof6y9WNWUpBHzy9LkyF9t7WhOfxu93GDaMrwIdGX+SS6wZqA+gXXi8Q==
X-Received: by 2002:a17:902:ee12:: with SMTP id
 z18mr10037526plb.308.1592612173468; 
 Fri, 19 Jun 2020 17:16:13 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id s13sm7119043pfc.136.2020.06.19.17.16.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 17:16:12 -0700 (PDT)
Subject: Re: [PATCH 19/21] target/arm: Convert Neon VSWP to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <48899968-19dd-22a4-544e-5934517c3148@linaro.org>
Date: Fri, 19 Jun 2020 17:16:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the Neon VSWP insn to decodetree. Since the new implementation
> doesn't have to share a pass-loop with the other 2-reg-misc operations
> we can implement the swap with 64-bit accesses rather than 32-bits
> (which brings us into line with the pseudocode and is more efficient).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  2 ++
>  target/arm/translate-neon.inc.c | 41 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          |  5 +---
>  3 files changed, 44 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


