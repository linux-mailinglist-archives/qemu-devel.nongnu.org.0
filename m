Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EB561F817
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 16:59:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os4Wj-0000JG-KD; Mon, 07 Nov 2022 10:59:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os4Wf-0000Ij-SV
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 10:59:06 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os4We-0006Vf-CJ
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 10:59:05 -0500
Received: by mail-wm1-x32a.google.com with SMTP id v7so7184521wmn.0
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 07:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N+UDkAPExbXd5ZFegj5smpVx3+X0GiUOp/7Gy2Ay+q0=;
 b=fzMYNI6pd/vRotwibx0zUp4a0DyoQCRBCzFQehlt0v9qfYB9+LMtkxxbym+TYF9YdA
 qcbC9YgisolDHj26eR2vntCYQHrtXJ8W4ExLfi8CHRaknVKX3c1MLCBpku+RsYcpLkQU
 rvzMg/7uFpEpbP33Hew4vYS736+e166VVeavpen0j0dwscsdBymlEcAebnRcQDdqeeqw
 I88x78k1JbUfKu/YNPEheJQDrheCHzimg5GfQMymYkMBntGFq1Nh54lnpgYcUFC/UQSv
 XJSlOXj3X6Ufc9hd1ITpZ3V8kcLTRiVh1QkhmkamNQu7Y668b/gAD1VBPtmExhq9ycKz
 cD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=N+UDkAPExbXd5ZFegj5smpVx3+X0GiUOp/7Gy2Ay+q0=;
 b=jPlsSC7wnQtE0NG5P5ikEsNulAuN7Jxy4Bn3mT9yXPacuhZrY39oX3KlIdQtGVrDm2
 NCdUiJrwsjPefV0SWsvMSSlajL+anCGP1dKpa1HVARP13JBbzliEjuEHmplqmU18dSEm
 o9j3MgYJeFY+woIfAYTSzN+M+DmMCYu8WTXYUJYkj3Eqh1E+c9ERJ7yQ4WSvNJm+31jf
 GwCtPaHRkNc7HEM8qoxt4EM0yKmRoT0fUBG/4HJfM0/hSjkqFRTwyQ3ASy6tKhjy/zqf
 XIfOiGzM0d9VBwYWPEm5m+r9ham5PBb445iU9MRkDK/CansPLDr7XGL9VztyOVjwe/um
 hTAA==
X-Gm-Message-State: ACrzQf182Cgw54fx6RUqbiMgaWsQWQ8y2M50mzoLpKaVIFdPwagU0Yk0
 s0MdHNoVh3UX35sOmt4fGJaxfQ==
X-Google-Smtp-Source: AMsMyM41DYnLVxnMKBiRZ2Cgsf3XXKMA3oLONjG+Smc+Y+Tny6XByS7J4CWFXMR+amCMBR7DfcHSRw==
X-Received: by 2002:a05:600c:5248:b0:3cf:88df:d341 with SMTP id
 fc8-20020a05600c524800b003cf88dfd341mr18393747wmb.14.1667836742637; 
 Mon, 07 Nov 2022 07:59:02 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a7bce11000000b003b49bd61b19sm12289174wmc.15.2022.11.07.07.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 07:59:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 84F921FFB7;
 Mon,  7 Nov 2022 15:59:01 +0000 (GMT)
References: <20221013062946.7530-1-zhiwei_liu@linux.alibaba.com>
 <20221013062946.7530-2-zhiwei_liu@linux.alibaba.com>
 <CAKmqyKNTyCvjjYOrgAttW36ygGBibTHjA_f1b5AAWp+pF-xAiA@mail.gmail.com>
 <ebdbec47-9dbe-e1a2-5033-9421710debb6@linux.alibaba.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Alistair Francis <alistair23@gmail.com>, qemu-riscv@nongnu.org,
 Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 sergey.matyukevich@syntacore.com, vladimir.isaev@syntacore.com,
 anatoly.parshintsev@syntacore.com, philipp.tomsich@vrull.eu,
 zhiwei_liu@c-sky.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/4] target/riscv: Add itrigger support when icount
 is not enabled
Date: Mon, 07 Nov 2022 15:58:26 +0000
In-reply-to: <ebdbec47-9dbe-e1a2-5033-9421710debb6@linux.alibaba.com>
Message-ID: <87wn86g3i2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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


LIU Zhiwei <zhiwei_liu@linux.alibaba.com> writes:

> On 2022/11/7 9:37, Alistair Francis wrote:
>> On Thu, Oct 13, 2022 at 4:32 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com=
> wrote:
>>> When icount is not enabled, there is no API in QEMU that can get the
>>> guest instruction number.
>>>
>>> Translate the guest code in a way that each TB only has one instruction.
>> I don't think this is a great idea.
>>
>> Why can't we just require icount be enabled if a user wants this? Or sin=
glestep?
>
> This feature will only be used by users who want to=C2=A0 run the native
> gdb on Linux. If we run QEMU as a service,=C2=A0 after booting the kernel,
> we can't predicate whether the users will use native gdb.
>
> Besides, icount can't be enabled on MTTCG currently (I am working on
> this problem)

I'm curious as to what your approach is going to be to solve this one?

--=20
Alex Benn=C3=A9e

