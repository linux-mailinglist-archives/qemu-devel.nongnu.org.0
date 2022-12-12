Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A619064A4B7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 17:25:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4lbC-0007om-Lw; Mon, 12 Dec 2022 11:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p4lbA-0007oF-Ic
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:24:12 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p4lb8-0001se-Py
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:24:12 -0500
Received: by mail-pg1-x531.google.com with SMTP id f9so8525020pgf.7
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 08:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LvVfFVK3vKVzAik5xzIQabEKNIzAm0AWEGiR4m5NOEU=;
 b=RHCKVK+DGi7AFPByw6vSAgxf3yHWEC9+Le1THjSD/zkY9GBBLsC+s6eoUaKw9nZz57
 kirQtfs/zmWLz3L8HdyhFCX7ohsxBCeWEK6pQxf9utG3FJy+MLL3FewEbsHc9oj4SIn6
 HbktEcpVgPyThHsG1ZYLU7LBZI572bnAtCsHXxCkt2bB2nTdI9BNqfQAOLQ5s0+G2Gdp
 NX2B45xvTZPI6aScwuN3gYhNVkQ9la1clsTL+Fs8e0wJ7+ZO6I05X+ZICpmyjk3ac7IP
 ywkloPc5e3sfywQ5RtmEjCM1KJKbmLCxBJ9l6csQV+YaCR7svZArzy48GVtdQf0wIkMO
 pl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LvVfFVK3vKVzAik5xzIQabEKNIzAm0AWEGiR4m5NOEU=;
 b=54IYpe2RxILvvqbPJRksRz19OFZEQyoDo0AwbAGdKESSRFtaSzD8UWhclSefMQZd+/
 bSP3s4+WY9JL5CGsFfJJ9x0lfGC1P2Vl8G61Imz9xvBCFZ/oRuChI1WaGJZqfhNreE6D
 Eb4zOKKJAXS3dtiWBkBaMYGop6uRGr3aIBbLmeWetFRB2RZnWUnrLMIHYH5XdpJK9yJQ
 gv9ytGPOacWqgB80B4H0sqmEMlxzP+B0j554deaWYBbNSln8gh9BcJC9vIquK2JOZJVL
 46xsriGP0MlwlJf+MwWX9lwjU0TTSVzasoSLX5Lm+gPf6H6Ni3sAe+H4HX5oCI1ipDAt
 7rog==
X-Gm-Message-State: ANoB5pnAaptd1WK3S/XX4VGBv2Jq1NCUHWliG0IRNc5AFae0Azm0Db4s
 kG5dL0K07G72SygcUieTzpozEbZBzoFj5bBGm7LUlA==
X-Google-Smtp-Source: AA0mqf6uGxuXDYXJcQrUN0olgSKE/PDFKMuQNXtZZbTOf0e3DRtq08Im49Iq8PMGRvLkZLHfsi78QL6tBGTONMaLlc8=
X-Received: by 2002:a63:d20d:0:b0:479:18a:8359 with SMTP id
 a13-20020a63d20d000000b00479018a8359mr4932844pgg.105.1670862249363; Mon, 12
 Dec 2022 08:24:09 -0800 (PST)
MIME-Version: 1.0
References: <20221209110823.59495-1-philmd@linaro.org>
In-Reply-To: <20221209110823.59495-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Dec 2022 16:23:57 +0000
Message-ID: <CAFEAcA8sGbS0oJV1afSja13npZR3tFk4VNAKR2o5+0hCsGUN1w@mail.gmail.com>
Subject: Re: [PATCH-for-8.0] target/arm: Restrict arm_cpu_exec_interrupt() to
 TCG accelerator
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
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

On Fri, 9 Dec 2022 at 11:08, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> When building with --disable-tcg on Darwin we get:
>
>   target/arm/cpu.c:725:16: error: incomplete definition of type 'struct T=
CGCPUOps'
>     cc->tcg_ops->do_interrupt(cs);
>     ~~~~~~~~~~~^
>
> Commit 083afd18a9 ("target/arm: Restrict cpu_exec_interrupt()
> handler to sysemu") limited this block to system emulation,
> but neglected to also limit it to TCG.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Applied to target-arm-for-8.0, thanks.

-- PMM

