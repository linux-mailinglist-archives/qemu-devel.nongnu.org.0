Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD3268F6BC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 19:15:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPoyI-0002jO-20; Wed, 08 Feb 2023 13:15:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org>)
 id 1pPoyG-0002jG-Hs
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:15:04 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org>)
 id 1pPoyE-0006ps-20
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:15:04 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6DDC6B81F31
 for <qemu-devel@nongnu.org>; Wed,  8 Feb 2023 18:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACD1C433A1
 for <qemu-devel@nongnu.org>; Wed,  8 Feb 2023 18:14:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="NLSgivwX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675880093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fkmKNTawokdU8eWiUB7o9aeTXnCHogeHtcpJ1JEN3Go=;
 b=NLSgivwXPc0srG8OwJnxZNEiPjmoV/SfbdQs/RSGfSjoMmwLQvIrTOzsTrRe4N5haMZjIq
 hTIidqKgsm/jG1hy9XqYYHNrmkENKXXUh5eM5ZtaEFhCWO/h7McVEKx7KSzeUDMdI0KyyQ
 qu8JPrY5Xp6aa7kvvMjfQmTG71eBNqA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 148467a7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 8 Feb 2023 18:14:53 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id 23so16094502ybf.10
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 10:14:52 -0800 (PST)
X-Gm-Message-State: AO0yUKVoJu+S7A6K88RqDd+J/X6LXsY//Ysfe/w0Wo6kGJhyhVt6v1uj
 SgikCM21DcbeurZ3ybtJ/hrXAbC8UgDiY+xtkrw=
X-Google-Smtp-Source: AK7set+p1xHPDY2LtP8pmku3oIkKYu8rx2nZ2i2+ARbj+0BAlqDqUyAtghrIZa1ZPf04eV3dzU6bkuHQw8LEJEbKfnA=
X-Received: by 2002:a25:5089:0:b0:85c:9b84:1a09 with SMTP id
 e131-20020a255089000000b0085c9b841a09mr1137236ybb.351.1675880092196; Wed, 08
 Feb 2023 10:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20230208180835.234638-1-Jason@zx2c4.com>
 <20230208131125-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230208131125-mutt-send-email-mst@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 8 Feb 2023 15:14:38 -0300
X-Gmail-Original-Message-ID: <CAHmME9rMnbGDZ+Rq8ao=gZd10kBp5ni=73HcPpFC58ChoKZObA@mail.gmail.com>
Message-ID: <CAHmME9rMnbGDZ+Rq8ao=gZd10kBp5ni=73HcPpFC58ChoKZObA@mail.gmail.com>
Subject: Re: [PATCH] x86: temporarily remove all attempts to provide setup_data
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
 Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "H . Peter Anvin" <hpa@zytor.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On Wed, Feb 8, 2023 at 3:13 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Feb 08, 2023 at 03:08:35PM -0300, Jason A. Donenfeld wrote:
> > All attempts at providing setup_data have been made as an iteration on
> > whatever was there before, stretching back to the original
> > implementation used for DTBs that [mis]used the kernel image itself.
> > We've now had a dozen rounds of bugs and hacks, and the result is
> > turning into a pile of unmaintainable and increasingly brittle hacks.
> >
> > Let's just rip out all the madness and start over. We can re-architect
> > this based on having a separate standalone setup_data file, which is ho=
w
> > it should have been done in the first place. This is a larger project
> > with a few things to coordinate, but we can't really begin thinking
> > about that while trying to play whack-a-mole with the current buggy
> > implementation.
> >
> > So this commit removes the setup_data setting from x86_load_linux(),
> > while leaving intact the infrastructure we'll need in the future to try
> > again.
> >
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Dov Murik <dovmurik@linux.ibm.com>
> > Cc: Tom Lendacky <thomas.lendacky@amd.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Richard Henderson <richard.henderson@linaro.org>
> > Cc: H. Peter Anvin <hpa@zytor.com>
> > Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Eric Biggers <ebiggers@kernel.org>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>
> I think I'll be happier if this is just a revert of
> the relevant commits in reverse order to make life easier
> for backporters.
> Unless that's too much work as we made other changes around
> this code?

I think that's going to be messy. And it won't handle the dtb stuff
either straightforwardly.

