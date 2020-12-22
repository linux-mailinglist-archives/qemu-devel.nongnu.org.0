Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AF72E036F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 01:32:45 +0100 (CET)
Received: from localhost ([::1]:35124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krVbY-0005K8-Rm
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 19:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krVZZ-0004nN-3c
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 19:30:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:34148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krVZV-00011I-UR
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 19:30:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EBD022AED
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 00:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608597036;
 bh=RuMniXqBe9We0VCGtN3RL2oGrSGf3geXi4Ypxan8R6c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=F7WaPrxSDmpqJxAc5hf8xrn8GKbagHVzw8QhN93CuMZti/j26wYmVW3NLl5VfB0eF
 +KRNi9mvDXG8hJT3bN3EYyx/7TTPoCoYZrot49WNnl4EztaNb/niIZg3NlxDSw7GeC
 GsWEkYcRLAzRSrA4G3opZqIJ+fMPHylR/4f8rZMW5dZQIRbEKCqbLYbAgny++S//rD
 09wFAzSB4+v5sfWdSwDwDFM3kw6zLMXAKoqUMmUQK8GIIiiKGEfGvgyV/LTwHoV/XY
 5gcNONhN9Mo0Z18jPP0oseMkLgE8OEGuT/YbOscN3ZdpX7VtUsG8GSPcnFEvn2AiYh
 Yy5A/c5ByUbAA==
Received: by mail-il1-f170.google.com with SMTP id v3so10525935ilo.5
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 16:30:36 -0800 (PST)
X-Gm-Message-State: AOAM531A1yhYWt8wZj+gAEn3iGmhRObg1DcX/E3BgwPL1Vnq8HMEBG/s
 KwfyxBGZsgHzqm3yn5e4+xlDkecDtSQeFbQSvlw=
X-Google-Smtp-Source: ABdhPJxJe1U9rWbVulA2Vx95pyYWNk+Ary9x8RsExyXGJWeJmBXct0fvFGx679FKh1rc34I0vogPBiPU5Tp37rCpL0w=
X-Received: by 2002:a92:870b:: with SMTP id m11mr17952694ild.134.1608597035876; 
 Mon, 21 Dec 2020 16:30:35 -0800 (PST)
MIME-Version: 1.0
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <20201219071235.35040-3-jiaxun.yang@flygoat.com>
 <835addc0-6973-9e17-2ac5-79a159fb72d2@amsat.org>
In-Reply-To: <835addc0-6973-9e17-2ac5-79a159fb72d2@amsat.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 22 Dec 2020 08:30:23 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4wYw6Zfv+fg8m-jF9mdp4=VO3yiS2244_hczCLoP+RsA@mail.gmail.com>
Message-ID: <CAAhV-H4wYw6Zfv+fg8m-jF9mdp4=VO3yiS2244_hczCLoP+RsA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] hw/mips/fuloong2e: Relpace fault links
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Sun, Dec 20, 2020 at 1:52 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 12/19/20 8:12 AM, Jiaxun Yang wrote:
> > Websites are downing, but GitHub may last forever.
> > Loongson even doesn't recogonize 2E as their products nowadays..
> >
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> >  hw/mips/fuloong2e.c | 13 +++----------
> >  1 file changed, 3 insertions(+), 10 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

