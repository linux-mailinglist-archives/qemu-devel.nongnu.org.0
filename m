Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ED36DC5DB
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 12:47:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plp2I-0003s1-H5; Mon, 10 Apr 2023 06:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1plp2F-0003re-QY
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 06:46:07 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1plp2A-0000UL-KE
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 06:46:07 -0400
Received: by mail-wm1-x336.google.com with SMTP id gw13so2587527wmb.3
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 03:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681123559; x=1683715559;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0+trlWryIteaOHlK/9J9ItX5df1V3n9uhY9XsKsH2c4=;
 b=DLECfAzx2b9MXRb0tBQ64Wn3AGIzbcTdLy/M2h+GKiD+2bqtmbY0Osuni+TST9yaO+
 Jk7IEWkkzHPLZ4xieTIDsYXElmP3C8eapKHy/7ikz+Ae6irxER7SihgK1laMRlJ71O07
 qOPiEAZh3p6CezMEh2sgjnijFobd/R3z8NyDftkJQ2GUJeduQyILs18Yhsd7ofVE3P/m
 viO50Kf+2oYkTRM+8eNT4aA4dcSyLAl2dSrXkShx/WUzwIxAIk5UZ0rvKO7p7KIyUVyQ
 fHrQV4gAoSA2UeMQegqhYSdw2GK8pCJDwqF5DPRwNP2GNJM5mlkgYoAmvm/xbf0mDOr+
 CIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681123559; x=1683715559;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0+trlWryIteaOHlK/9J9ItX5df1V3n9uhY9XsKsH2c4=;
 b=q0F54t+qFX77GzlLDq4LW2uqVAidRyYl54HeySXI0G9+epsC4GPkO+WOIlUQowE0cR
 8cbyh/w6lb2P3C+DkvELzGsELzJNO/QJQ2JuLoEx9cCvm2UjdSeZwdIBSMBIuAUx6+XA
 uOOqu4iZatBU3eUaTC1cQ5/hvMsMgrTBsyUrYmytY4mGU0dW3fqeTlTh2YuG5CGY9tBd
 HV9bgGYL0gTPcbnm8H6XrT9RRRVdJnVS98Ihz/4hiQ5EDne7AKwBEfiUjv/WlWVjM5Qg
 sQS/FidPoS4R3pdiU0WSCd56LaKdbAGxYrq5nzXjvG59covqo0AAiWErx247a47u8Nvb
 6GiA==
X-Gm-Message-State: AAQBX9fpBNlxFaSVGk57vhrdiWe+CEfaSmYNYhi1407UTmO3HgOX+2H1
 iOIgRjf4t4IHWiMPxKkF98Vojg==
X-Google-Smtp-Source: AKy350Y+JCRzLae/+g0Dg7M59f5Xm9xTHiewNCuExjeEnlubT0GQ8BmRvdbY9VmS6f4vMbvJRBzcEg==
X-Received: by 2002:a1c:770d:0:b0:3ef:f26b:a187 with SMTP id
 t13-20020a1c770d000000b003eff26ba187mr6942199wmi.0.1681123558787; 
 Mon, 10 Apr 2023 03:45:58 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c1c9500b003ee1acdaf95sm17217991wms.36.2023.04.10.03.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 03:45:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 093E11FFB7;
 Mon, 10 Apr 2023 11:45:58 +0100 (BST)
References: <20230406022751.757980-1-fei2.wu@intel.com>
 <20230406022751.757980-2-fei2.wu@intel.com> <87v8i9jviv.fsf@linaro.org>
 <ce65c074-ff12-1f29-ee64-44fb7ff643c7@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Fei Wu <fei2.wu@intel.com>, pbonzini@redhat.com, erdnaxe@crans.org,
 ma.mandourr@gmail.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] accel/tcg/plugin: export host insn size
Date: Mon, 10 Apr 2023 11:36:40 +0100
In-reply-to: <ce65c074-ff12-1f29-ee64-44fb7ff643c7@linaro.org>
Message-ID: <87ttxoc8wq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/6/23 00:46, Alex Benn=C3=A9e wrote:
>> If your aim is to examine JIT efficiency what is wrong with the current
>> "info jit" that you can access via the HMP? Also I'm wondering if its
>> time to remove the #ifdefs from CONFIG_PROFILER because I doubt the
>> extra data it collects is that expensive.
>> Richard, what do you think?
>
> What is it that you want from CONFIG_PROFILER that you can't get from per=
f?
> I've been tempted to remove CONFIG_PROFILER entirely.

I think perf is pretty good at getting the hot paths in the translator
and pretty much all of the timer related stuff in CONFIG_PROFILER could
be dropped. However some of the additional information about TCG ops
usage and distribution is useful. That said last time I had a tilt at
this on the back of a GSoC project:

  Subject: [PATCH  v9 00/13] TCG code quality tracking and perf integration
  Date: Mon,  7 Oct 2019 16:28:26 +0100
  Message-Id: <20191007152839.30804-1-alex.bennee@linaro.org>

The series ended up moving all the useful bits of CONFIG_PROFILER into
tb stats which was dynamically controlled on a per TB basis. Now that
the perf integration stuff was merged maybe there is a simpler series to
be picked out of the remains?

Fei Wu,

Have you looked at the above series? Is that gathering the sort of
things you need? Is this all in service of examining the translation
quality of hot code?

>
>
> r~


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

