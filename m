Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8140591214
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 16:22:35 +0200 (CEST)
Received: from localhost ([::1]:60356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMVYZ-0003fx-2Y
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 10:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMVUl-0007yE-KO
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 10:18:44 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:38706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMVUj-0004ab-Lw
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 10:18:39 -0400
Received: by mail-yb1-xb35.google.com with SMTP id i62so1702742yba.5
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 07:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=aZuoj+N1RHsoVrh3/zFHoD3KQhFxD2ezVPsDRIU9ByQ=;
 b=ft6t93PQFxTWd8OJbiCy9NxmdDvx3t2fVK6wPBEbLnO34t1ZKufKv8o5slSvxQw4n8
 1tHBUGDO7fVAR41bypg9Yh2uJ2COXfxsF+kebLVfFfVB5xsNml13WfX9pQ8KErXXkGg9
 Jgln2T8KeyZXhhRcfvyMn1mzfYGtyHhKpiZBKLkH72qs61EaSQpZ17SBwxk68qANUyil
 nA2VPRFF3087KnVlSYAh7+OawpmmiNMGvCmF1aj0rdJtpbhh+vUh0w3vGJOrUJ+PMkx8
 tk++ZXgtgJtCgt+JJhfTEqmQH373W+x4ipbrbaBQSGidpL99tj/g5dBQffPHiWLBIGNw
 972w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=aZuoj+N1RHsoVrh3/zFHoD3KQhFxD2ezVPsDRIU9ByQ=;
 b=q2yNjh8+i/YPA8i801d7yA+gSG6CHIosUjlXpgTlKBKoXoWLxjpalRJskaw6qjVbrH
 Dwj9CF4pf+5jUPrjRvbz5BL2SS2+cfDM/SkZt3VbesAHh2IIUl4/UqoP6CWoGbefuSjw
 gS7ep/Y1jPLqPBi10m7dY/LW8JY2mqLSfzMafN2czRw/M5WTrdxj7ceOkkN014aIicw4
 HjmLX3NY6bBWL0YexCDxGCSXUVZPb8lN/f/LWGUkJviUNlZ733IYtn9AR8lhH+mzYanq
 0dLyiN6g5C4MSQiOjNEOkygxFtKLd6jhSlKCYSO3DxdZppxrOtU/Lp8v65+PrsE/cjow
 TS/A==
X-Gm-Message-State: ACgBeo340kiFsdr3TLAYXbolHEqFGHdELYzaXc4X0SkpKxCrWMIfiUnG
 InbzAI1EO4uMqrCKhcf/V0GMw37cDQURimd3/QbOFA==
X-Google-Smtp-Source: AA6agR6VSVyYnHQ2zjkeg/sg4J3yf+Zljs69wQRuQruS603C7Smd7eAavoBwau0ueinVrX79/sQ7JZ0vnigZ29R4idw=
X-Received: by 2002:a25:9a06:0:b0:676:4585:3df7 with SMTP id
 x6-20020a259a06000000b0067645853df7mr3796081ybn.193.1660313916623; Fri, 12
 Aug 2022 07:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220812131304.1674484-1-philipp.tomsich@vrull.eu>
 <20220812140103.3lbh45oidiw2fhsf@kamzik>
 <CAAeLtUDbVwvQzr9u+D2KH6qBoiu4ikEbf3aVahbmK_i=6gEM7A@mail.gmail.com>
In-Reply-To: <CAAeLtUDbVwvQzr9u+D2KH6qBoiu4ikEbf3aVahbmK_i=6gEM7A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 15:18:25 +0100
Message-ID: <CAFEAcA9Br-7mxsN-y7FciW8k=jtG2vhrf4tiO80bVcFBrCdUuA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: fence.i: update decode pattern
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: Andrew Jones <ajones@ventanamicro.com>, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Aug 2022 at 15:11, Philipp Tomsich <philipp.tomsich@vrull.eu> wr=
ote:
>
> On Fri, 12 Aug 2022 at 16:01, Andrew Jones <ajones@ventanamicro.com> wrot=
e:
> >
> > > Update the decode pattern to reflect the specification.
> >
> > I got hung-up on this for a bit since there isn't any "must-be-0" field=
s,
>
> Please refer to '=E2=80=9CZifencei=E2=80=9D Instruction-Fetch Fence, Vers=
ion 2.0' in
> the specification.
> The encoding diagram clearly states 0 for imm[11:0], 0 for rs1 and 0 for =
rd.
>
> However, there is an explanatory paragraph below (unfortunately, it is
> not clear whether this is normative or informative):

> > The unused fields in the FENCE.I instruction, imm[11:0], rs1, and rd, a=
re reserved for finer-grain fences in future extensions. For forward compat=
ibility, base implementations shall ignore these fields, and standard softw=
are shall zero these fields.

That's pretty clear that this patch is wrong, then -- QEMU
is an implementation, and so we must ignore these fields.
Otherwise when a future version of the spec defines a finer-grain
fence instruction in this part of the encoding space, older
QEMU will incorrectly make software that uses it crash.

If you think the spec is insufficiently clear about whether that
is normative then that would be something to raise with the
spec authors, preferably before anybody builds hardware that
enforces must-be-zeroes on these fields...

thanks
-- PMM

