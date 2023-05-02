Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBE36F4652
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 16:48:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptrI5-0006VG-5X; Tue, 02 May 2023 10:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptrI3-0006Ur-6G
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:47:39 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptrI1-0002rA-7F
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:47:38 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bc0117683so5386787a12.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 07:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683038853; x=1685630853;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sJxJdU3FxhZrh4nkk4zvINrnlB/v2wIbAAdpLApMBO8=;
 b=YkKyD+dm0wc57B74ZOQ4fsTxnhN1MDXMLche91gbXS9h45LNbBi3n31tW82bGiqOyd
 SXOzNhyX1t5an4cFTwCsDJ05jruVMvcMZTc9Ny571+Zie10ZfX5NXEfIcMYdqgn6I6RX
 +nu/t27g97YVHrnLh0n/V3PHarGtl+rfrXV++kQBX4suSzwRYuErS0Eeb0tZ6IGQ3wjA
 ZeyaPCrZNA+a3z2WktnYiOhUKyEAHs2zpIovRMel0p/c1n3jyME0j1j7fD/KWyG9eotv
 KvTsLHtoR+blJQwClFutUj2yGwNEnLcWksqiQX7+KaOHze2vr/8ISYHL27VLKeGGNoP0
 Q9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683038853; x=1685630853;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sJxJdU3FxhZrh4nkk4zvINrnlB/v2wIbAAdpLApMBO8=;
 b=FTarEiLF0ywaeUzdbgTHsZK5LsIiingvZgnmny6AGg5oHM69MV3V2780zRT6duqlqK
 8cfFmOBMWbpZFnik9SYkXG0XhEXC4wN9dvcVHTcU5pIc6U2Ng1fRJrCBBBxUwxV7xUB1
 84uHAYJWmYReYb+aY4JfoCYcMfpMDMveRxv36MzO+HhM8EtgzDSYAO2DibJ+AUdBRShH
 iR67wMMDfLyW/U3E7uTixENd7qiHlGC+AUzu5s95EIscHo4Lp7A2itVJOFGfAyqQwjm4
 gujaBstBZ17dBhZ9rf4iZbPDQJcJeo3OOfGOLptcPxVxxyiEwm3nPFfZ32yATcoiQzNJ
 VG8g==
X-Gm-Message-State: AC+VfDyZ5f1ptDlLsHmrIS1YRgBKLsF0HN0t2FlcWD0wSMeXVl3H7AjV
 9blisA9cuL9fdjpc26ecjejVn++/iwnV62Q+EHGMAQ==
X-Google-Smtp-Source: ACHHUZ7IGlU3vmdLEq5rXye0bvh1PQbveuIOE9951KD+qu0/hWveV39CoH9dW3DDoZNgwOHCSmmCj/Ar/BQYUwTOB+A=
X-Received: by 2002:aa7:cd18:0:b0:50b:d5d1:7409 with SMTP id
 b24-20020aa7cd18000000b0050bd5d17409mr1292535edw.23.1683038853346; Tue, 02
 May 2023 07:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
 <df8ad122-f0e9-1912-9ef7-8e34c9a4dcb9@linaro.org>
In-Reply-To: <df8ad122-f0e9-1912-9ef7-8e34c9a4dcb9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 15:47:22 +0100
Message-ID: <CAFEAcA8sdtA25aL-pHOH5gjWwP4sbh+fCqFcVyuVAJpXL-VPGA@mail.gmail.com>
Subject: Re: [PULL 00/35] target-arm queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 2 May 2023 at 15:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/2/23 13:14, Peter Maydell wrote:
> > Hi; here's an arm pullreq. The big bits here are Fabiano's
> > CONFIG_TCG=n patches and my set that deprecate -singlestep;
> > other than that there's a collection of smaller bugfixes.
> >
> > thanks
> > -- PMM
> >
> > The following changes since commit 7c18f2d663521f1b31b821a13358ce38075eaf7d:
> >
> >    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-04-29 23:07:17 +0100)
> >
> > are available in the Git repository at:
> >
> >    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230502-1
> >
> > for you to fetch changes up to 0ab99e4252f21550f2c16f859cbcdd3cced9f8bf:
> >
> >    hw/net/allwinner-sun8i-emac: Correctly byteswap descriptor fields (2023-05-02 13:10:42 +0100)
> >
> > ----------------------------------------------------------------
> >   * Support building Arm targets with CONFIG_TCG=no (ie KVM only)
> >   * hw/net: npcm7xx_emc: set MAC in register space
> >   * hw/arm/bcm2835_property: Implement "get command line" message
> >   * Deprecate the '-singlestep' command line option in favour of
> >     '-one-insn-per-tb' and '-accel one-insn-per-tb=on'
> >   * Deprecate 'singlestep' member of QMP StatusInfo struct
> >   * docs/about/deprecated.rst: Add "since 7.1" tag to dtb-kaslr-seed deprecation
> >   * hw/net/msf2-emac: Don't modify descriptor in-place in emac_store_desc()
> >   * raspi, aspeed: Write bootloader code correctly on big-endian hosts
> >   * hw/intc/allwinner-a10-pic: Fix bug on big-endian hosts
> >   * Fix bug in A32 ERET on big-endian hosts that caused guest crash
> >   * hw/sd/allwinner-sdhost: Correctly byteswap descriptor fields
> >   * hw/net/allwinner-sun8i-emac: Correctly byteswap descriptor fields
>
> The new notcg test is failing:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/4212154869#L3556

Output: Could not access KVM kernel module: Permission denied
qemu-system-aarch64: failed to initialize kvm: Permission denied

Looks like the aarch64 runner doesn't have access to /dev/kvm.
Philippe, that patch was one of yours -- do you want to have
a look at it?
("gitlab-ci: Check building KVM-only aarch64 target")

In the meantime I'll respin the pullreq and drop that patch.

thanks
-- PMM

