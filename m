Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9372C511122
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 08:26:44 +0200 (CEST)
Received: from localhost ([::1]:56492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njb8N-0006pp-LD
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 02:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1njb3T-0004Vd-SU; Wed, 27 Apr 2022 02:21:39 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:41793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1njb3R-0004gy-5k; Wed, 27 Apr 2022 02:21:39 -0400
Received: by mail-qk1-x72e.google.com with SMTP id f186so639918qke.8;
 Tue, 26 Apr 2022 23:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gl13KHmMbwv5AjaMHlhZf1lATax5vveJNO27lYbPikM=;
 b=E8mcO8J3V4qKMC+oMoq/lxLZyAYBuX4ny7hBdMZkvf6QcIF6Z9bnvtTYlB9iRFtPFM
 b42e0DnaxQ499Sftgqk1ZAmo/L0LWsi5e+GHqz5/FsqQsvzvISAn6IUzstpotxCHmbTG
 yzRGNrPX/IwVAQNobaRiiTs1IiEJvi+6EM6oY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gl13KHmMbwv5AjaMHlhZf1lATax5vveJNO27lYbPikM=;
 b=QQyYKJN3l7/OlCuc5XJLdxF4/sIMfEUyxQLw7brs7cb8YAA2KTKzU/3rw0tsb/qfpV
 xJeY63k5J/Yuqf+W4ap79V+kr1J5q2HeKD4INUSSj4ngL3jeEp6EvQ9FLr+w0NMwiP7m
 7kLamYv1S0vUqYt6YZGqCYcDuTbOthkef9idqcv2aBRixibKrwjUvnczRSstWcZsyD+a
 cvoJGLIeXTEz8rW8RqYViUmo3hZVyM2eEXfRnXMWBTKTgslOkTVLSTmQDSdUFUlglLfi
 VQwJ8XQEUhr4H9ed4GTJDlI9YDEQ/mWGOAwEc4thQuxVlD5VOBIorlNICA8Cm7937+1h
 d0Hw==
X-Gm-Message-State: AOAM531NX3no/eWGuf1qrSkU5BrwGAkdZKn8Tl+ozUt6up11jRGRKRd1
 CVaHEIJXPoTtXsgfNJ4hzPhN/y5RAbmY+I26j5g=
X-Google-Smtp-Source: ABdhPJwVwnZNI8MrxEPoAVLEHdFQTRp5RQVFvepNGN3082lKEVVOjOzJU8VDvmfvoHxWci439sysoRAFWRXQYLtlHtw=
X-Received: by 2002:a05:620a:461f:b0:69f:6a78:f1fd with SMTP id
 br31-20020a05620a461f00b0069f6a78f1fdmr6304658qkb.53.1651040494763; Tue, 26
 Apr 2022 23:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
In-Reply-To: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Apr 2022 06:21:22 +0000
Message-ID: <CACPK8Xea8cE3bAPKqDDgQ671m+rxTo57OPYrDTBOEDrpLSD9tg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] VSX MMA Implementation
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 12:51, Lucas Mateus Castro(alqotel)
<lucas.araujo@eldorado.org.br> wrote:
>
> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
>
> This patch series is an RFC of the Matrix-Multiply Assist (MMA)
> instructions implementation from the PowerISA 3.1
>
> These and the VDIV/VMOD implementation are the last new PowerISA 3.1
> instructions left to be implemented.
>
> Thanks
> Lucas Mateus Castro (alqotel) (7):
>   target/ppc: Implement xxm[tf]acc and xxsetaccz
>   target/ppc: Implemented xvi*ger* instructions
>   target/ppc: Implemented pmxvi*ger* instructions
>   target/ppc: Implemented xvf*ger*
>   target/ppc: Implemented xvf16ger*
>   target/ppc: Implemented pmxvf*ger*
>   target/ppc: Implemented [pm]xvbf16ger2*

I have a small test case for the MMA instructions that Alistair wrote
a while back[1]. It passes when run with these patches applied
(previously it would sigill).

$ qemu-ppc64le -cpu power10  -L ~/ppc64le/ ./test -m
Smoke test MMA
MMA[0] = 1 (Correct)
MMA[1] = 2 (Correct)
MMA[2] = 3 (Correct)
MMA[3] = 4 (Correct)
MMA[4] = 2 (Correct)
MMA[5] = 4 (Correct)
MMA[6] = 6 (Correct)
MMA[7] = 8 (Correct)
MMA[8] = 3 (Correct)
MMA[9] = 6 (Correct)
MMA[10] = 9 (Correct)
MMA[11] = 12 (Correct)
MMA[12] = 4 (Correct)
MMA[13] = 8 (Correct)
MMA[14] = 12 (Correct)
MMA[15] = 16 (Correct)

[1] https://github.com/shenki/p10_tests


>
>  include/fpu/softfloat.h             |   9 ++
>  target/ppc/cpu.h                    |  15 +++
>  target/ppc/fpu_helper.c             | 130 ++++++++++++++++++
>  target/ppc/helper.h                 |   7 +
>  target/ppc/insn32.decode            |  49 +++++++
>  target/ppc/insn64.decode            |  80 +++++++++++
>  target/ppc/int_helper.c             |  85 ++++++++++++
>  target/ppc/internal.h               |  28 ++++
>  target/ppc/translate/vsx-impl.c.inc | 200 ++++++++++++++++++++++++++++
>  9 files changed, 603 insertions(+)
>
> --
> 2.31.1
>
>

