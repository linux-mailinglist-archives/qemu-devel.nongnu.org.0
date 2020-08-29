Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFBE256A13
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Aug 2020 22:24:10 +0200 (CEST)
Received: from localhost ([::1]:53522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kC7OT-0000XV-Dm
	for lists+qemu-devel@lfdr.de; Sat, 29 Aug 2020 16:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7N4-0007xd-89
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 16:22:42 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:36273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7N2-0007tb-5w
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 16:22:41 -0400
Received: by mail-pj1-x1029.google.com with SMTP id q1so1082431pjd.1
 for <qemu-devel@nongnu.org>; Sat, 29 Aug 2020 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cTCBFiJGE64/Bepjg/IelyhjWfEhq9WhnnrEDVwNVCg=;
 b=SyA7ea8CF+vlogRbeyEh8+xu06zJpoQZTFRVGXfkFqkrhr3XDte+Kry75ySijvzeW2
 sel9Ui5QQgeNWzQzXjSK/lEMIjbGtc6px7gEv5YrHB/hecOMNa2XHSba3v4WBfUfY6L/
 zEiKnZpKvUlIfrowLey7AOWihGkkIy9sddRv9bZ3pg7LnS2tR8M9yTfKTnj+0EOCU0+p
 PE76bmMTBI+TQfAN6GgjlEnf4WsfTWuLIl1bJkwnF33DzGc7LK1ZB51FxeeGVHS1qNxK
 zXMmTCT1qdiPtZX/lCyzGAv68Kig12AAEXPd4y/NAaBt0tzNppsge6svfcN9VDzLBjh2
 aoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cTCBFiJGE64/Bepjg/IelyhjWfEhq9WhnnrEDVwNVCg=;
 b=LpxmxCdhxemlOk8+qZUJLsfUMHhBHKPjb74zEC+y1y/Vr6pdgOjuQq3FV2uxQs/+qM
 y6t5lhxN+vUBPvB4WrtsEn/cFurY2qPID1g1EKqoaXDmKjBoSkQfXNNa4lIqJ4LoYP4z
 ysaYLDDLZvU/7dml5zG6efm2XzQ+nmQt//xScGlIAn7tyfJ09aOEPdYowD8NaMF6k5pn
 mY8S3x2RHgyQlNiQkfT5jXkUrdZlZUeOrjbEiIh4Q41ECPhS8i4a/jbyli4abm58/qf4
 m+Dl9Sspbv7SOGrYuaYWKRwtLTcxFL7YNoxt2vbqCwTtzgJd1tOjL1NgvOz9a18HMVUG
 /PTA==
X-Gm-Message-State: AOAM532fIKnpudolkLi7E2lp8GznzMJx4vLw9nnh+xDy2loTERy+CQlM
 1dj9BxcW57iVG7FMvPTyq6ZE9w==
X-Google-Smtp-Source: ABdhPJzKxU0UzmsRCcYNnmVF/25ESgMKQinGf8dpZje8zQ1/CO1yMj+/zwSZS0Zxl+tiX5Lr+sPGvw==
X-Received: by 2002:a17:902:788e:: with SMTP id
 q14mr3712810pll.140.1598732555528; 
 Sat, 29 Aug 2020 13:22:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id u22sm3067391pgi.85.2020.08.29.13.22.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 13:22:34 -0700 (PDT)
Subject: Re: [RFC v4 46/70] target/riscv: rvv-1.0: quad-widening integer
 multiply-add instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-47-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b6c3e083-dca6-9d33-78e6-bbb2f3b107af@linaro.org>
Date: Sat, 29 Aug 2020 13:22:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-47-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Add the following instructions:
> 
> * vqmaccu.vv
> * vqmaccu.vx
> * vqmacc.vv
> * vqmacc.vx
> * vqmaccsu.vv
> * vqmaccsu.vx
> * vqmaccus.vx
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/helper.h                   |  15 ++++
>  target/riscv/insn32.decode              |   7 ++
>  target/riscv/insn_trans/trans_rvv.inc.c | 109 ++++++++++++++++++++++++
>  target/riscv/vector_helper.c            |  40 +++++++++
>  4 files changed, 171 insertions(+)

As mentioned, let's table this one for now.


r~

