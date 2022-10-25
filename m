Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266F660CE3C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 16:01:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onKRn-00039i-IJ; Tue, 25 Oct 2022 09:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1onKRl-00038X-DM
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:58:25 -0400
Received: from sin.source.kernel.org ([145.40.73.55])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1onKRg-0007xP-G3
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:58:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id AADEFCE1D44;
 Tue, 25 Oct 2022 13:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47FFBC433C1;
 Tue, 25 Oct 2022 13:58:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="C6acdLOW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666706291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YBZmwcdfqQzbRMDHWfQfp7W+QClyD0ZUr9XaAipbOcc=;
 b=C6acdLOWZ5zK5/PaPcYheTrhWgFdWJAbQENgv/r45j/p672T+WmiLWci3L8atMvJmQaWeP
 ozpuO/1PKAvZnW0P8LCrhDJlwzqn5uf1U9XNIeAUgSW4/A5gomaBz+1DtIe3Q6067stgSc
 bd4rQCLVcpW0iS7VP2VwIvlvT84Lnls=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 886a5ed5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 25 Oct 2022 13:58:10 +0000 (UTC)
Date: Tue, 25 Oct 2022 15:58:06 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, richard.henderson@linaro.org
Subject: Re: [PATCH v4 01/11] reset: allow registering handlers that aren't
 called by snapshot loading
Message-ID: <Y1frbuhhcvSVd1qO@zx2c4.com>
References: <20221025004327.568476-1-Jason@zx2c4.com>
 <20221025004327.568476-2-Jason@zx2c4.com>
 <874jvs5t5k.fsf@pond.sub.org> <Y1fR/bMo/HcDvo7A@zx2c4.com>
 <CAFEAcA-cqzoEyWiCd0RCGezqijvWfnXso1kH9zDb9fYdYpa_6w@mail.gmail.com>
 <CAHmME9owB8eay2DJrYiEaZKRoJA6RA_EmCPSV0_XgU2aHYx_wg@mail.gmail.com>
 <CAFEAcA_vLqKQnXuYs6nQqbqw5KYUq4ye5O1s2CRPrdEkxOAVcw@mail.gmail.com>
 <CAHmME9rhXu6MuDPAYK0te8NBEHeJE17oNV6e-v6O+4U1-0s_Ew@mail.gmail.com>
 <CAHmME9qyURRp-U_HsFxOmQNEqLY7t2qHOvuQCNgt1kOou3RvNA@mail.gmail.com>
 <CAFEAcA-32AunhmukH1PK5F0uBsOtVUVF0vx+__LxCv-MBp+uhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-32AunhmukH1PK5F0uBsOtVUVF0vx+__LxCv-MBp+uhg@mail.gmail.com>
Received-SPF: pass client-ip=145.40.73.55;
 envelope-from=SRS0=a4uw=22=zx2c4.com=Jason@kernel.org;
 helo=sin.source.kernel.org
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

On Tue, Oct 25, 2022 at 02:54:01PM +0100, Peter Maydell wrote:
> On Tue, 25 Oct 2022 at 13:50, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > On Tue, Oct 25, 2022 at 2:42 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > >
> > > On Tue, Oct 25, 2022 at 2:34 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > > > No, I was just running "make check-avocado" locally.
> > >
> > > Oh, okay. I'll try out a full `make check` locally then just to be sure.
> 
> "make check" doesn't run the "make check-avocado" tests (because
> they take a lot longer than most developers want for a simple
> smoke test, and do things like downloading guest images for tests.)

Ah, okay, running.

Jason

