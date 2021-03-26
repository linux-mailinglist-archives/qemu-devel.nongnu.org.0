Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7006734A922
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 14:56:26 +0100 (CET)
Received: from localhost ([::1]:43440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPmwr-0003I7-Be
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 09:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPmup-0002BI-Rx
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:54:19 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPmun-0007f9-HF
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:54:19 -0400
Received: by mail-ej1-x631.google.com with SMTP id r12so8538406ejr.5
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 06:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wWpNK6/JNPwrVkAGJaGRDopJcyyPFrrlkRr3adMhn3k=;
 b=sRouph0g0y8G2h7dEwWeUtx/It2ufM5ekPjBqN1sa5wuukxpsqvJNbzlYFptqjmkOg
 tBtIDq6Vu/nNVjFytDAmsddFjjk9v8ht/w0o+D5bybl7L60fe9dVoUHIC7zs+khgWwzF
 NKWWj2SRvII8nZ7xWoyDqst5HQJVFjVwgDWHawBtR+601lYUbIVETvRk3WJ+yXgUetgm
 usN852QzYTkUaxluwapJRdnka1++Stwzs8H9YofRqx39wVzb9bgkI8+lVS+StN88phP1
 1CTcGSxA/4mG4WjhWm5qlk0dejZkxJveOGvQVBJRpzhHfGQlacuACfeF9QpX8ly8SFK3
 2sYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wWpNK6/JNPwrVkAGJaGRDopJcyyPFrrlkRr3adMhn3k=;
 b=ZvVPld7bAiJ3e9tPPariU3Kbppv71jcOL/eK0pyKKfqFA6glp0xc+7Dx6EYuasu6Ko
 OdUZxeGXfUMEUZ1wrCx25ZdDdRtuUUZVzcKeOMfZrkjo4IyhTfJxkOA317Ffjp3OGJth
 55BbVT7M9Iv/QtIfpB6DwF8uzNJuwiFS/v9H7z6gfrV9ymGidOmcGaiJeTvl2r5tDe4t
 o0jLxUjrjcaUJyGsIGQu02oaw7wKaJYQ1oD3k2HQQaLFbBzs31OF3BEa1FYYDfU6407y
 qv98HBB26mXwSt9MzoInbfNoC0uLh8Tfn/X/qj5kxt0XGIeXQ49/cctDX0b0HuZDBiug
 AqvQ==
X-Gm-Message-State: AOAM530O+ez3X/AzFmspjueA7b4UCmJ+YhPNZMBNaDQZZPNpCjrf6rmk
 bGt6fqSe5yAPqpyq/B4/aHGny/BBdyegVHkTsGR41g==
X-Google-Smtp-Source: ABdhPJxvkxJZTfkQHABwyCx3AjrcM5XxuEeREtn0IRwmxznm35IYaBFx8vOq5ie8+G0KvDIpdIybH/4GWgUPpRwJLxQ=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr15694226ejg.482.1616766856081; 
 Fri, 26 Mar 2021 06:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210323182958.277654-1-f4bug@amsat.org>
In-Reply-To: <20210323182958.277654-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Mar 2021 13:53:47 +0000
Message-ID: <CAFEAcA8i5BxEpSUDnSwx7Vq5jgdfNA3JuZgzP8ERc8yk5jwaHA@mail.gmail.com>
Subject: Re: [PATCH] hw/display/xlnx_dp: Free FIFOs adding xlnx_dp_finalize()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Mar 2021 at 18:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> When building with --enable-sanitizers we get:
>
>   Direct leak of 16 byte(s) in 1 object(s) allocated from:
>       #0 0x5618479ec7cf in malloc (qemu-system-aarch64+0x233b7cf)
>       #1 0x7f675745f958 in g_malloc (/lib64/libglib-2.0.so.0+0x58958)
>       #2 0x561847c2dcc9 in xlnx_dp_init hw/display/xlnx_dp.c:1259:5
>       #3 0x56184a5bdab8 in object_init_with_type qom/object.c:375:9
>       #4 0x56184a5a2bda in object_initialize_with_type qom/object.c:517:5
>       #5 0x56184a5a24d5 in object_initialize qom/object.c:536:5
>       #6 0x56184a5a2f6c in object_initialize_child_with_propsv qom/object=
.c:566:5
>       #7 0x56184a5a2e60 in object_initialize_child_with_props qom/object.=
c:549:10
>       #8 0x56184a5a3a1e in object_initialize_child_internal qom/object.c:=
603:5
>       #9 0x5618495aa431 in xlnx_zynqmp_init hw/arm/xlnx-zynqmp.c:273:5
>
> The RX/TX FIFOs are created in xlnx_dp_init(), add xlnx_dp_finalize()
> to destroy them.
>
> Fixes: 58ac482a66d ("introduce xlnx-dp")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/display/xlnx_dp.c | 9 +++++++++
>  1 file changed, 9 insertions(+



Applied to target-arm.next, thanks.

-- PMM

