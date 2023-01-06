Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D80660A5B
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 00:45:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDwNy-0000rn-9z; Fri, 06 Jan 2023 18:44:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDwNv-0000rd-6g
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:44:27 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDwNt-0000oU-Bd
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:44:26 -0500
Received: by mail-wr1-x433.google.com with SMTP id r2so2676817wrv.7
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 15:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BN7zCfqNSq9ZkgFf+xyaT1ek7hHzkPtmXT85t4UQZ78=;
 b=YPOkkI0o1/BerStUT2f+3Fk7h2WCAia1C2zJlTjF4i/BWP0PbVx8MMyJIZjVz+oVi+
 Pvmb5jiJu9eXr5vlvezorRTZCHaIdOiitLAou+P+GXygI6QPn3/lPdmloJiW3ZKFkzHe
 qXMdabiEJJQ3H5We+FTyIKQL8sQnbHBY+x9T9kBaKtSm/j+OoLzD3K5PNAYbkR0FFuep
 4KJZRsx9vDlXnjO2rJSGTxO/IG8mIlDRuI2gIzsqCeReqbJWoaAtzGzqBQmx/RGk5yFP
 pRiIbTk3S8Ii9PXLsOpGNKRCqFCrDDybF5Kh/SQfWdjZwEkuD+JgCoX2swYBA7iLtxZm
 CZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BN7zCfqNSq9ZkgFf+xyaT1ek7hHzkPtmXT85t4UQZ78=;
 b=Wih9zSi3HUfie8bPti4kGgUeq5si/EIy1JtrEXpGb5QEGXi6FOfP7OvHjfgFwZ0GRk
 Bh1G3k06PgjTP/zkvm+JehETrsqR93eDzOr7BpReuy+1FakjkX0+w3o9iz5q4ohq3xVl
 0056VsNJGi/03H97ttaC/Jyj0ddsqY+7jI2LD/7zw5MP0uz0rYtFetU5sNMPdlfQ/lhF
 xo70DOPqSoIt5GDmLpZVNqTEEUw2LY2WUDRH/toKuS7uaFNn/BbXxiCQwRBox1SXnHQq
 WbbOYOXH8oDp9klqNv+P+VkBk068ivi+cBYmH3ndvUHcWWWY6MFiExSdokbZu7AYyiPl
 h9/A==
X-Gm-Message-State: AFqh2kr0lhoyJVnOMFIxYwhsasJz0pOEQFupNziLI0SIGz1Eem1zvkfc
 HnO3G2z6mdAwhG5sDD9/5iqTnQ==
X-Google-Smtp-Source: AMrXdXu2viJt18lhcVf2ZK94HuToYOE+Iiqm97OnUMJ+u7fguELLYlgjgdXfsQwmWe9TVVaTT/Zqgg==
X-Received: by 2002:adf:fd11:0:b0:28a:8b5d:6f47 with SMTP id
 e17-20020adffd11000000b0028a8b5d6f47mr20018057wrr.1.1673048663695; 
 Fri, 06 Jan 2023 15:44:23 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a0560001a5300b002362f6fcaf5sm2336371wry.48.2023.01.06.15.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 15:44:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8FFC51FFB7;
 Fri,  6 Jan 2023 23:44:22 +0000 (GMT)
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <CAFEAcA8K=1CNZfDG8i3bSXXSWT7D2oWg4jyupwYmw8oR7MJVsQ@mail.gmail.com>
 <9f9a6c22-315b-de1e-958e-89963c5e7e90@linaro.org>
 <CAFEAcA8cxJFpB9V826DjSsFOy7VYh5TWXb4vRYDUeOMjQgk-eQ@mail.gmail.com>
User-agent: mu4e 1.9.11; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com
Subject: Re: [RFC PATCH 00/40] Toward class init of cpu features
Date: Fri, 06 Jan 2023 23:43:24 +0000
In-reply-to: <CAFEAcA8cxJFpB9V826DjSsFOy7VYh5TWXb4vRYDUeOMjQgk-eQ@mail.gmail.com>
Message-ID: <874jt32ppl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 6 Jan 2023 at 19:29, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 1/6/23 11:12, Peter Maydell wrote:
>> > The trouble with this idea is that not all instances of the same
>> > class are actually necessarily the same. For instance, if you
>> > have a system with both (a) a Cortex-A53 with a PMU, and
>> > (b) a Cortex-A53 without a PMU, then they're both instances of
>> > the same class, but they shouldn't be sharing the coprocessor
>> > register hashtable because they don't have an identical set of
>> > system registers.
>> >
>> > This kind of same-CPU-type-heterogenous-configuration system is
>> > not something we're currently using on A-profile, but we do have
>> > it for M-profile (the sse200 has a dual-core setup where only one
>> > of the CPUs has an FPU), so it's not totally outlandish.
>>
>> Yes, I know.  See patch 29 where I moved the vfp and dsp properties off =
of the m-profile
>> cpus and created new cpu classes instead, specifically for the sse220.
>>
>> It's not scalable, I'll grant you, but it's hard to design for something=
 we're not using.
>> What we use now, apart from the sse200, are common properties set on the=
 command-line.
>
> We also set some properties in code -- eg aspeed_ast2600.c clears
> the 'neon' property on its CPUs, lots of the boards clear
> has_el3 and has_el2, etc. I hadn't got as far as patch 29, but
> looking at it now that looks like a pretty strong indication
> that this is the wrong way to go. It creates 3 extra
> cortex-m33 CPU classes, and if we find another thing that
> ought to be a CPU property then we'll be up to 8; and the
> mess propagates up into the SSE-200 class, which is also
> no longer able to be configured in the normal way by setting
> properties on it, and it becomes visible in user-facing
> command line stuff.
>
> I think our object model pretty strongly wants "create object;
> set properties on it that only affect this object you created;
> realize it", and having one particular subset of objects that
> doesn't work the same way is going to be very confusing.

What about cloning objects after they are realised? After all that is
what we do for the core CPUClass in user-mode.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

