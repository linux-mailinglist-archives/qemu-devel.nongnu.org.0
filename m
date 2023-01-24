Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6893C6795B1
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 11:49:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKGqH-0004gQ-PN; Tue, 24 Jan 2023 05:47:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKGqE-0004f7-QE
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 05:47:50 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKGqD-0005qN-6q
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 05:47:50 -0500
Received: by mail-wr1-x435.google.com with SMTP id b7so13455326wrt.3
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 02:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pGmTi4T92hKKrDyCA2KHuQGxpktnT8jQr/Eo+QQgM00=;
 b=SaWwCVBsdDITHGjG8lFxO97iAcjQ1K70vVJ5t91GYmcvK3sOmLOeQ3WmNbm8mRwgcB
 Ifs9q8UnnJVJclc9G7vr36FXTF0FcpUuhUI6V8QaswYuJ1CDgnptJ40E+qfXNqTk/LHg
 kVnjiK+SGBRoCimuvzb8nsNKLyC9v7FeYg25NMXxfubWuMmnJ6sJducy5ilOSIreER2Y
 RrTwiwFVo9M9laBf49n+7FG1SrMPoHXCutAaF/w/Yoav9om6v1WSZPZadDRZz3AqM8Zk
 6Zhv0K03rODtzChX3id3Hpss84X3nASLElw0PawLmBf9SlpSBsJ7FmM/3j1i3XntksYe
 lhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pGmTi4T92hKKrDyCA2KHuQGxpktnT8jQr/Eo+QQgM00=;
 b=dIxOOGAUMPHOAmtA9QC/ujq6VwKngfsIqm4xN2wif1fk4A8SwiThqTM8TtdZ9BQYai
 +1TP+K9DGbfVz2yRXnTwhwFn1V0VCwi8+put5N6Jmk24DtVl7g7Xy2sBrv6d+vVBOsrb
 MvzWiD7+f4Wf/Z0QKWpP+/YMsM9MYlHWpIlt53emAqCmvuNCUexFY0tqIgAoWzvwHwOl
 C7SVApuUn0p2bcPADbZZM60fDwGSqlunUpDHkpmlPSgQ+mp7v6j+Xi+Xwk+qk2gQzUmN
 S9vq7lQD76X35Zvxfe+aoWv7y5hiH01Lbv72RqH235SPi7AbRtfLJwlpVKROA7gRJtg4
 iBbA==
X-Gm-Message-State: AFqh2kqYmoCVCvQgVg+qw7cgv8CfDrjQIJqbL1FbRLR8toaq5VLCixfJ
 inXDF6sDJmsqetuh6MBlPy3fDQ==
X-Google-Smtp-Source: AMrXdXtBHo2k/WsMZV3W+rlUTZ7kCjyIbFrguky9awMh/fLBwEvDF2wsow2iE6g0Qe4rud2Q/fOjKQ==
X-Received: by 2002:a5d:688a:0:b0:2be:51a2:c6e2 with SMTP id
 h10-20020a5d688a000000b002be51a2c6e2mr14977078wru.39.1674557267167; 
 Tue, 24 Jan 2023 02:47:47 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a5d650f000000b002bdda9856b5sm1570418wru.50.2023.01.24.02.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 02:47:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3B6F41FFB7;
 Tue, 24 Jan 2023 10:47:46 +0000 (GMT)
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
 <20230106194451.1213153-3-richard.henderson@linaro.org>
 <CAFEAcA9mh+eS8rHwqmyjOAmcnPDJ7K54QbJPd7itKZskQeox5g@mail.gmail.com>
 <3443cf40-4013-6ac6-895d-08f86c229809@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 2/2] target/arm: Look up ARMCPRegInfo at runtime
Date: Tue, 24 Jan 2023 10:39:31 +0000
In-reply-to: <3443cf40-4013-6ac6-895d-08f86c229809@linaro.org>
Message-ID: <87a628ryy5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

> On 1/23/23 02:53, Peter Maydell wrote:
>> On Fri, 6 Jan 2023 at 19:45, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> Do not encode the pointer as a constant in the opcode stream.
>>> This pointer is specific to the cpu that first generated the
>>> translation, which runs into problems with both hot-pluggable
>>> cpus and user-only threads, as cpus are removed.
>>>
>>> Perform the lookup in either helper_access_check_cp_reg,
>>> or a new helper_lookup_cp_reg.
>> As well as the use-after-free, this is also a correctness
>> bug, isn't it? If we hardwire in the cpregs pointer for
>> CPU 0 into the TB, and then CPU 1 with a slightly different
>> config executes the TB, it will get the cpregs of CPU 0,
>> not its own, so it might see a register it should not or
>> vice-versa.
>
> Existing assumption was that each cpu configuration would have its own
> cluster_index, which gets encoded into cpu->tcg_cflags, which is part
> of the comparison used when hashing TBs.

I understand the cluster_index is used for things like A/R and A/M
splits (and eventually heterogeneous). We also have language to cover
the increasingly weird set of big.LITTLE offspring like M1's
Performance/Efficiency split or the Tensor's X1/A76/A55 split.

 * If CPUs are not identical (for example, Cortex-A53 and Cortex-A57 CPUs i=
n an
 * Arm big.LITTLE system) they should be in different clusters. If the CPUs=
 do
 * not have the same view of memory (for example the main CPU and a managem=
ent
 * controller processor) they should be in different clusters.

> But including this patch allows relaxation of what constitutes a "cpu con=
figuration".
>
>
> r~


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

