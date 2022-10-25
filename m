Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C79160D06F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 17:23:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onLif-0002J7-H3; Tue, 25 Oct 2022 11:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1onLiF-00016B-A4
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:19:34 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1onLiC-0004S4-4U
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:19:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5EC0F619FC;
 Tue, 25 Oct 2022 15:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD25C433D7;
 Tue, 25 Oct 2022 15:19:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="JRfFbZKX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666711160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bAaRxXOAFA/glNE89QGNT16KuDVwiu5+WfxKzfaum58=;
 b=JRfFbZKXhbpgJiZskfQFwRtgr0MKj53CPFSZAe6TcndmhAPhcVT+k91uGgf3JBwIddVSJ6
 h1wI0VZcEC9T5cvUlBLWljYy0cZQB1uuG3IMC71KQyNEKAB2rgp07wicjijV9wSY7kxhkw
 k8hF2gMtm9GEGFTFbed5bf2bfDVlLjE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a6517366
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 25 Oct 2022 15:19:20 +0000 (UTC)
Date: Tue, 25 Oct 2022 17:19:15 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, richard.henderson@linaro.org
Subject: Re: [PATCH v4 01/11] reset: allow registering handlers that aren't
 called by snapshot loading
Message-ID: <Y1f+c4PPwPNKGJEN@zx2c4.com>
References: <20221025004327.568476-2-Jason@zx2c4.com>
 <874jvs5t5k.fsf@pond.sub.org> <Y1fR/bMo/HcDvo7A@zx2c4.com>
 <CAFEAcA-cqzoEyWiCd0RCGezqijvWfnXso1kH9zDb9fYdYpa_6w@mail.gmail.com>
 <CAHmME9owB8eay2DJrYiEaZKRoJA6RA_EmCPSV0_XgU2aHYx_wg@mail.gmail.com>
 <CAFEAcA_vLqKQnXuYs6nQqbqw5KYUq4ye5O1s2CRPrdEkxOAVcw@mail.gmail.com>
 <CAHmME9rhXu6MuDPAYK0te8NBEHeJE17oNV6e-v6O+4U1-0s_Ew@mail.gmail.com>
 <CAHmME9qyURRp-U_HsFxOmQNEqLY7t2qHOvuQCNgt1kOou3RvNA@mail.gmail.com>
 <CAFEAcA-32AunhmukH1PK5F0uBsOtVUVF0vx+__LxCv-MBp+uhg@mail.gmail.com>
 <Y1frbuhhcvSVd1qO@zx2c4.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="7Hd8l40smVTEAro5"
Content-Disposition: inline
In-Reply-To: <Y1frbuhhcvSVd1qO@zx2c4.com>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=a4uw=22=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--7Hd8l40smVTEAro5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Oct 25, 2022 at 03:58:06PM +0200, Jason A. Donenfeld wrote:
> On Tue, Oct 25, 2022 at 02:54:01PM +0100, Peter Maydell wrote:
> > On Tue, 25 Oct 2022 at 13:50, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > >
> > > On Tue, Oct 25, 2022 at 2:42 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > > >
> > > > On Tue, Oct 25, 2022 at 2:34 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > > > > No, I was just running "make check-avocado" locally.
> > > >
> > > > Oh, okay. I'll try out a full `make check` locally then just to be sure.
> > 
> > "make check" doesn't run the "make check-avocado" tests (because
> > they take a lot longer than most developers want for a simple
> > smoke test, and do things like downloading guest images for tests.)
> 
> Ah, okay, running.

Okay, I did it and got:

    "cancel": 4,
    "errors": 1,
    "failures": 0,
    "interrupt": 7,
    "pass": 10,
    "skip": 170,

Not sure what that one error is about -- it doesn't seem related though.
results.json attached here if you want to have a look.

Jason

--7Hd8l40smVTEAro5
Content-Type: application/zstd
Content-Disposition: attachment; filename="results.json.zst"
Content-Transfer-Encoding: base64

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

--7Hd8l40smVTEAro5--

