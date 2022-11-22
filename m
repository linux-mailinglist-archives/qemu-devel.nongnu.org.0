Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C62E63408F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 16:50:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxVXJ-0003YH-RG; Tue, 22 Nov 2022 10:50:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oxVXG-0003Wb-M2
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:50:10 -0500
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1oxVXE-0008P0-4R
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:50:10 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5A1C6CE1D9E
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 15:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA31C433B5
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 15:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669132201;
 bh=AQrOAc6GCT71ZRqqzoZvuYp5rPbrb3sGJA6wOfuhxe4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bmDEIYIP2n9tXVjiUlgXhNBPrH8r9pzg8Z+LaKNxRThfAlER5Gm92UiKG5CQTRoM+
 D5KUcM9+1Pskx4vweX9x74MXvzfY1bYaFjAUaXBwCCd7l4RCQXS8OBvs3xcZIHs/gM
 IcUOgsoAsiZGCTQgPkxrwrvyyDhTKH72UmRQRaqWxz76It2/SfZn9wJETbzQDE0hJ5
 gH3msSgxTlYdapladVnN3w6ollBEvDZcrQoFsDG9pY0bNUv4p3l6gKBmCglBSC0CPa
 xa7D38gBQzlv0Kuf9Lfnf3y9s9iUdmJePLfxerQj5wqejW2mc8Vt1e/katorelRJrG
 n/mQhkqnEqajg==
Received: by mail-lf1-f48.google.com with SMTP id j4so24216351lfk.0
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 07:50:01 -0800 (PST)
X-Gm-Message-State: ANoB5plmtKN4x7sdgUxG6/O40XwCwPHhrVVd+lYFHv2saggJvZKkcas6
 IawQxmyi8VcaaUcLX7ZVPhPeuM7dA3mOjqfU5Mc=
X-Google-Smtp-Source: AA0mqf4ZAoMRGSWNIRyHulnp8QTFltM5IFsCKttwCldqhk5396dNky/gqfg0aIsL8MdHRY0wec8W0hbU9v2skh+F/hE=
X-Received: by 2002:a05:6512:15a8:b0:4a6:3ed2:3717 with SMTP id
 bp40-20020a05651215a800b004a63ed23717mr2290829lfb.637.1669132199492; Tue, 22
 Nov 2022 07:49:59 -0800 (PST)
MIME-Version: 1.0
References: <20221121174326.68520-1-ardb@kernel.org>
 <CAFEAcA_Tz1an8cJO_6kDozMQ1kpqzu60gKq+c4Rj1veFz0REpg@mail.gmail.com>
 <CAMj1kXG_AcmtvEKBUCX8eAsSv7xasGc0HAvQDSnu7ByMie5W9Q@mail.gmail.com>
 <CAFEAcA-_D8JnCPEVt6pmAPGeB3cEro+n4Hk0hxoyVD0zToz+HA@mail.gmail.com>
In-Reply-To: <CAFEAcA-_D8JnCPEVt6pmAPGeB3cEro+n4Hk0hxoyVD0zToz+HA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 22 Nov 2022 16:49:48 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEwe48nwV3QkrWLx5=+_qgqwRqW8+otz890WteNvJQtSA@mail.gmail.com>
Message-ID: <CAMj1kXEwe48nwV3QkrWLx5=+_qgqwRqW8+otz890WteNvJQtSA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Use signed quantity to represent VMSAv8-64
 translation level
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:40e1:4800::1;
 envelope-from=ardb@kernel.org; helo=sin.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Tue, 22 Nov 2022 at 14:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 21 Nov 2022 at 19:02, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Mon, 21 Nov 2022 at 19:51, Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > On Mon, 21 Nov 2022 at 17:43, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > >
> > > > The LPA2 extension implements 52-bit virtual addressing for 4k and 16k
> > > > translation granules, and for the former, this means an additional level
> > > > of translation is needed. This means we start counting at -1 instead of
> > > > 0 when doing a walk, and so 'level' is now a signed quantity, and should
> > > > be typed as such. So turn it from uint32_t into int32_t.
> > > >
> > >
> > > Does this cause any visible wrong behaviour, or is it just
> > > a cleanup thing ?
> > >
> >
> > No, 5 level paging is completely broken because of this, given that
> > the 'level < 3' tests give the wrong result for (uint32_t)-1
>
> Right, thanks. This seems like a bug worth fixing for 7.2.
>

Indeed. And the other patch I sent is needed too if you want to run with LPA2

'target/arm: Limit LPA2 effective output address when TCR.DS == 0'

In case it is useful, I have a WIP kernel branch here which can be
built with 52-bit virtual addressing for 4k or 16k pages.

https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=arm64-4k-lpa2


> We should make 'uint32_t startlevel' also an int32_t
> for consistency, I think, given that it is also sometimes
> negative, though in that case it doesn't get used in any
> comparisons so it's not going to cause wrong behaviour.
>

Indeed. I'll send a v2 and fold that in.

