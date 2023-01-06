Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 552A166092F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 23:00:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDul7-0005J2-Pr; Fri, 06 Jan 2023 17:00:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDukw-0005Hg-G1
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 17:00:06 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDuku-0006Mi-L9
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 17:00:06 -0500
Received: by mail-pg1-x529.google.com with SMTP id h192so2049829pgc.7
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 14:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v9uX2PcWkk4NdyFbpIyLTSi83EWwIxEbSr864u8yuB4=;
 b=J3JhRlFrLm+JzsKHDTJ0Z2rUDXoFjW5I1kgGcNicJDzD/2sMPnznNf+JLEFGpImSoL
 7WWOuiusW+TDl7KEqVtXTuGNQlPjKpBS+9gWKBjH+QL1JdSkXBe8rhwGpu/TGgO0nuwv
 Jma4qSPIJCEf5UFb5/KQxwAxqGTSC5+aAV8YA+iwoIwGx4J2H1vcGgEII6MW2uJRPDQv
 BpmY8wpqjl5PL2KkRjZeLMcNpTQz1k09oRyTQZN6+o2VRHQSyR7y7JRcRSekhbKJJBBk
 keGnDZ7wD1+2s0C1WF9p1iyGHUDoqt1UbHF/uaq+8Uf/x4RsjJecBfnWGV3fUSHt9HVW
 ZgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v9uX2PcWkk4NdyFbpIyLTSi83EWwIxEbSr864u8yuB4=;
 b=xFMokt1muHKEQaZhghbfksilY4cIYG8rYEwDiR4fMBxDGJ++5SsgZ7FqGKGWYzvHWH
 6Ku2jdyMgmOdTI0Hprp6fC4ZzfGhjh7WkRiW38XqNpQf8mxz8ZPFJVe4Kq7mtV9uYP1c
 NHVHLX2EmINB6uZix0wtlFyyZuOYC4nMz355++v9WJR9xUl8oQszbJPs9Q0fkV+CVSAa
 t1UFwqJFf2ZInPjILJqsONKOdLcwiey+G88D0yVunU6wZqNOqU0RuJusEBNBDvn9eETn
 vUraDDADZnU80C1B4eWy14bNayouAUU3WTuMhRa/eebojs+yf+hl/ki6Q9nhrTYmlTrK
 Hq9Q==
X-Gm-Message-State: AFqh2koo00jxfZvMUFJ4psniCRxI3M8OyJlN5d7bTH1WGJVtEkaQPXOl
 i1M30plXeHvMqpXB4o8B2tY6lIMsx3UXtRaPxo9Obg==
X-Google-Smtp-Source: AMrXdXsfmvAxeE3xgLsGIRyImRAlQK2v3CHULtzWflBmqOb6HLTmihctdakx6Bw5icOPlW8XMj4w06IV5wApi1xOpzs=
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr3625097pgh.105.1673042403206; Fri, 06
 Jan 2023 14:00:03 -0800 (PST)
MIME-Version: 1.0
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <CAFEAcA8K=1CNZfDG8i3bSXXSWT7D2oWg4jyupwYmw8oR7MJVsQ@mail.gmail.com>
 <9f9a6c22-315b-de1e-958e-89963c5e7e90@linaro.org>
In-Reply-To: <9f9a6c22-315b-de1e-958e-89963c5e7e90@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 21:59:51 +0000
Message-ID: <CAFEAcA8cxJFpB9V826DjSsFOy7VYh5TWXb4vRYDUeOMjQgk-eQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/40] Toward class init of cpu features
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, armbru@redhat.com, ajones@ventanamicro.com, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 6 Jan 2023 at 19:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/6/23 11:12, Peter Maydell wrote:
> > The trouble with this idea is that not all instances of the same
> > class are actually necessarily the same. For instance, if you
> > have a system with both (a) a Cortex-A53 with a PMU, and
> > (b) a Cortex-A53 without a PMU, then they're both instances of
> > the same class, but they shouldn't be sharing the coprocessor
> > register hashtable because they don't have an identical set of
> > system registers.
> >
> > This kind of same-CPU-type-heterogenous-configuration system is
> > not something we're currently using on A-profile, but we do have
> > it for M-profile (the sse200 has a dual-core setup where only one
> > of the CPUs has an FPU), so it's not totally outlandish.
>
> Yes, I know.  See patch 29 where I moved the vfp and dsp properties off of the m-profile
> cpus and created new cpu classes instead, specifically for the sse220.
>
> It's not scalable, I'll grant you, but it's hard to design for something we're not using.
> What we use now, apart from the sse200, are common properties set on the command-line.

We also set some properties in code -- eg aspeed_ast2600.c clears
the 'neon' property on its CPUs, lots of the boards clear
has_el3 and has_el2, etc. I hadn't got as far as patch 29, but
looking at it now that looks like a pretty strong indication
that this is the wrong way to go. It creates 3 extra
cortex-m33 CPU classes, and if we find another thing that
ought to be a CPU property then we'll be up to 8; and the
mess propagates up into the SSE-200 class, which is also
no longer able to be configured in the normal way by setting
properties on it, and it becomes visible in user-facing
command line stuff.

I think our object model pretty strongly wants "create object;
set properties on it that only affect this object you created;
realize it", and having one particular subset of objects that
doesn't work the same way is going to be very confusing.

thanks
-- PMM

