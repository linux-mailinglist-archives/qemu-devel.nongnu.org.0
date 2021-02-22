Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681893210CE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 07:22:33 +0100 (CET)
Received: from localhost ([::1]:56258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE4c4-0001l0-FN
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 01:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4ak-0000Pt-7c
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:21:10 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:45739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4ai-0006zb-L9
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:21:09 -0500
Received: by mail-pg1-x533.google.com with SMTP id p21so9593564pgl.12
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 22:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nSmglpHbo/D4MGs+htu7TKpOXvv9DxKvzoz3J6Wt9UQ=;
 b=EMy6eEqIq56//GMUWDoDwXLJ9tKX4kgElzmoSkWQwA3+SO66YPJXePPDm77aSRWwRM
 nH+9/wI7sTK2OxLAwQDa2pA39BrcZkLx2WNM1Wi94GcrKaKy0JdrwHfh02thSISXZCxU
 EjVx0KJc/cuDgF+pmFuBiSPxG+dTrkgTTVOOUZ9Lz0h53+kdA7ngcv9Ql269ADPkJ1f2
 6QJL0bd3fmJDN7TkL09zm0SWGkvSLnK4lJOtwc2luMETLRkJzDKm9JX+ujE4iuMwjA8R
 3oU8QMFWnTYnnLH5vNaYajOaFrIcGlruYZWmLzT7NBaOK92Nh/jmGavMn2xesKlTgmQe
 baDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nSmglpHbo/D4MGs+htu7TKpOXvv9DxKvzoz3J6Wt9UQ=;
 b=fGnS0XmTkGAO1iXVyzG/m9ZCebWwvh+wOUIYybLdRofcKMK65R2H7wgemuNH4XJ49R
 4fpZKYhZA+cnhaZOi+yuBOXpZSU6iYuRFiBvlhcexIddOSYYPpK9xx4JrwFa7s5tYhV3
 Xj3VQvd+5YDOEB7bOfDemTljJqNPMyMzkwUND5ZylZL2NhG4M36Ka/AP4voHZXJEfGAZ
 wMNwyuKYMxn4Mnuc0wZwqPyv5Zc7q8YBEoThvefKqHDkY0BMsasRC6ifUKx66AjzZxyP
 oozasrx2DOp8tL+G3qSQVvcABqqTa4AkekwTtTrm8eAIXJUEp2GOtm/zlYqJkCOHrwKt
 yRaQ==
X-Gm-Message-State: AOAM532mDeyqKSq6sl8+0KPIW5HmpItAUwTVSRwMndE0/DN6IseJBWuz
 89bSF9aY/DOh5sP1K3K3PEZvCaGUMEIWjw==
X-Google-Smtp-Source: ABdhPJxmrxfsEF7qeD7+X/aGROvPY5zMzABN2r8HpnIrW7R9bNkCnNO9eHaSH59QuGoqeLOvSmjgsQ==
X-Received: by 2002:a63:1b1b:: with SMTP id b27mr18036014pgb.377.1613974867067; 
 Sun, 21 Feb 2021 22:21:07 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id y2sm16207082pjw.36.2021.02.21.22.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 22:21:06 -0800 (PST)
Subject: Re: [RFC v1 05/38] target/arm: wrap arm_cpu_exec_interrupt in
 CONFIG_TCG
To: Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-6-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <38cb9c63-1138-2081-933e-03f6997a50fe@linaro.org>
Date: Sun, 21 Feb 2021 22:21:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210221092449.7545-6-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 1:24 AM, Claudio Fontana wrote:
> +#ifdef CONFIG_TCG
>  bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
>      CPUClass *cc = CPU_GET_CLASS(cs);
> @@ -607,6 +608,7 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>      cc->tcg_ops->do_interrupt(cs);
>      return true;
>  }
> +#endif /* CONFIG_TCG */

I presume this function gets moved later?  What does this aid in the interim?


r~

