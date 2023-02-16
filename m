Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B479699BC1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:02:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSiaW-0006Pf-Ov; Thu, 16 Feb 2023 13:02:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pSiaK-0006IR-M9; Thu, 16 Feb 2023 13:02:20 -0500
Received: from sin.source.kernel.org ([145.40.73.55])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pSiaI-0005YO-Kn; Thu, 16 Feb 2023 13:02:20 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BCDF1CE2D0C;
 Thu, 16 Feb 2023 18:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33433C433EF;
 Thu, 16 Feb 2023 18:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676570532;
 bh=UqbAlQrdQMxevQz0bcvyR17oDh1rKc74S6A79BPV98E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fgAqYExU5Erc8VWCXLgab2wFjA2t46enljBAyUfjlVvtyuUdtmdO16TCZksEdfMUj
 Ull7z9xozV1g0Ic+3cTh566u9mO9CE18OIOuwnGeoeIx17KwUO7XAJp+R+NB5ZXKHf
 NGNglyu89ZcdKD0izO5qNJvKd9iW7N/PzP7qBEVumOXaHZ+ME2gslZZiB4yuZUAXtR
 cl5fRzc4o78HUyyogRPhrsLl4Yzh3VOZirhE+6JyxaBTcIFVx5xokts1kG2kL0DDRH
 YVSEBc2bBFc8UB0/JejUUwMeKWN/g+niYTz+qNSEfdrRJjJS2t5KjkVKe/PNRGqBZv
 0IHZSy1xgbZxw==
Date: Thu, 16 Feb 2023 11:02:08 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Jesper Devantier <jwd@defmacro.it>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= via <qemu-block@nongnu.org>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH 4/5] hw/nvme: basic directives support
Message-ID: <Y+5voERIYfXkrCIx@kbusch-mbp>
References: <20230216164806.233533-1-jwd@defmacro.it>
 <20230216164806.233533-5-jwd@defmacro.it>
 <Y+5ml5+YGC+kpU86@kbusch-mbp>
 <f1c9dd4e-be82-415f-bd27-554962b97eb4@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1c9dd4e-be82-415f-bd27-554962b97eb4@app.fastmail.com>
Received-SPF: pass client-ip=145.40.73.55; envelope-from=kbusch@kernel.org;
 helo=sin.source.kernel.org
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

On Thu, Feb 16, 2023 at 06:35:27PM +0100, Klaus Jensen wrote:
> On Thu, Feb 16, 2023, at 18:23, Keith Busch wrote:
> > On Thu, Feb 16, 2023 at 05:48:05PM +0100, Jesper Devantier wrote:
> >> +enum NvmeDirective {
> >> +    NVME_DIRECTIVE_SUPPORTED = 0x0,
> >> +    NVME_DIRECTIVE_ENABLED   = 0x1,
> >> +};
> >
> > What's this?
> 
> That’s a left-over from my rebase. I’ll fix that one up.

Okay, other than that, this one looks good.

