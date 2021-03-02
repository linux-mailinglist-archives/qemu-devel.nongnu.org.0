Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608B332964A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 06:51:44 +0100 (CET)
Received: from localhost ([::1]:44042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGxwc-0001vF-T7
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 00:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGxvD-0001Os-Ez
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:50:15 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:34185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGxv8-0006sY-Bb
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:50:13 -0500
Received: by mail-pf1-x42f.google.com with SMTP id m6so13137115pfk.1
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 21:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nw9UwE7Kr5hd1qsqDxvYTxw2lrsnohNjwyP40weQaus=;
 b=wsttqTcO/bkm0sAdxAMRZGhft47gaA4i0fEmz3luXtAAl3JlUuwL+Xl74J9/8vM9ZJ
 NIZHYgNnnU1suT5eKNleq17s83MuZbypgC9fTlI7RMTpL4F5+RZHbyMmFuiDDWWXCrz7
 SfzQeLbAvcfcm3iqlLoRBRjsfZBbGqvoQNz1jxj36SVN9BXr4b3715GyHPgECxpdLbOU
 G4EJ3+GOaVq8NZQ757H9GXg5WkaXBCWcgB7M2vUYGu4HmNRaCXQk20Kmd65uT+FMAi68
 w0ppjrejZztfDFoJ2AOkzqPXUilLbmIRL+IAOQZGpTK9gtA+GXmA1GH/LIBp+2oNeBWb
 Snow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nw9UwE7Kr5hd1qsqDxvYTxw2lrsnohNjwyP40weQaus=;
 b=QYMg6TeadN5hejrsNcsasmOsF2+3f4jSvWQDyI3Ut870BLofwBk+dU8ISJ2nBRuUnG
 lrbxAOnp0Z30MeF5dQaFMxHgXPaZHMZ1pGVerffhIBxe3Mdc67IiQGE3iT/0OY1CVq/D
 4+m7fnJrT8eeu92gbEPhMal5aZQjaqUMt1t7BvJZVdgK/iFPo/uUj3qvQKzyEi4YOzmP
 mm6UgpAvtmLYDcovE1KrzRPcsVx2mLiazHJ0dzDk8giLBkNv2BOSuMi4sdeTXlMLAG7I
 6J16eze/CiVVOIrwbOrZgxEzDnMZXNfFAVFQqZi4lj6uIJ1Y2/PT7MbPNro/Rh7v3y6L
 o30A==
X-Gm-Message-State: AOAM531gTZIh0yqa4tROLnkUe6ATt9gV8zlNYxh+q/o1xRc2GhMHJ6lY
 Ev2wTSvTBm//wXdrhIRoiRwdwPdo8/9xXA==
X-Google-Smtp-Source: ABdhPJzn2/Gb77EUHbir8hl6dl7L83N9J/agJGb0G3QQ/pj++lvoadBcCBykYpZinM0GGVNq4hZSwg==
X-Received: by 2002:a63:5a0c:: with SMTP id o12mr16689783pgb.76.1614664208531; 
 Mon, 01 Mar 2021 21:50:08 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id o129sm17999776pgo.27.2021.03.01.21.50.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 21:50:08 -0800 (PST)
Subject: Re: [RFC v2 05/24] target/arm: wrap arm_cpu_exec_interrupt in
 CONFIG_TCG
To: Claudio Fontana <cfontana@suse.de>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-6-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a0d82589-e36e-d5b6-4d39-5a6c543a2e04@linaro.org>
Date: Mon, 1 Mar 2021 21:50:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301164936.19446-6-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

On 3/1/21 8:49 AM, Claudio Fontana wrote:
> +#ifdef CONFIG_TCG
>   bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>   {
>       CPUClass *cc = CPU_GET_CLASS(cs);
> @@ -607,6 +608,7 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>       cc->tcg_ops->do_interrupt(cs);
>       return true;
>   }
> +#endif /* CONFIG_TCG */

Drop this and just wait for the move to tcg/tcg-cpu.c.


r~


