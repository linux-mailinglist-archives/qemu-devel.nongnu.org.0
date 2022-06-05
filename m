Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD92453DAD5
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 10:23:05 +0200 (CEST)
Received: from localhost ([::1]:40404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxlXM-0007j4-Dy
	for lists+qemu-devel@lfdr.de; Sun, 05 Jun 2022 04:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Mvkp=WM=zx2c4.com=Jason@kernel.org>)
 id 1nxlUQ-0006kq-T7
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 04:20:02 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:40958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Mvkp=WM=zx2c4.com=Jason@kernel.org>)
 id 1nxlUO-0007vK-RX
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 04:20:02 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2B3B7B80ADE;
 Sun,  5 Jun 2022 08:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510C6C385A5;
 Sun,  5 Jun 2022 08:19:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="obdTTv7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1654417187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o24HQC0IbzRM+d2f5G9/kKh3ZrByIzzeza7EDocM5ps=;
 b=obdTTv7zxjjhGe+bHzWnn8fouuH2K6Q/9mne/epkE68iRwWm1S+OJS3umy9ytYHJ0dSz3t
 dPLc6m3he+aBEDNvwUxH8Kz4H8HW4cGfUF+XhkcXWK/sc8uy1Pca1yDNb52npYL/HVHuam
 KrCyOBm9Ggyu/1R2XBWiqcLXUcds5yo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4fc6aae6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sun, 5 Jun 2022 08:19:46 +0000 (UTC)
Date: Sun, 5 Jun 2022 10:19:41 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Stafford Horne <shorne@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 QEMU Development <qemu-devel@nongnu.org>
Subject: Re: [RFC PATCH 3/3] hw/openrisc: Add the OpenRISC virtual machine
Message-ID: <YpxnHaaizsNpOjx8@zx2c4.com>
References: <20220527172731.1742837-1-shorne@gmail.com>
 <20220527172731.1742837-4-shorne@gmail.com>
 <CACPK8XexaTREY3Y-jp8urTAE+UmQWgygFx1MAss9KcJw5tGMtw@mail.gmail.com>
 <CAMuHMdWF_OwTMZZ=joRsnOAuB5UuKjACt3Ku4-o0--fR6xqQbQ@mail.gmail.com>
 <YpkWllpTFzb2HHY5@antec>
 <CAMuHMdXBtihLpdOYn7nj_fH2g08nDUiUd-_zCZ_EdEyvw1UxWA@mail.gmail.com>
 <YpwNtowUTxRbh2Uq@antec> <Ypxb/VDfYLFg3n2s@antec>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ypxb/VDfYLFg3n2s@antec>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=Mvkp=WM=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi folks,

On Sun, Jun 05, 2022 at 04:32:13PM +0900, Stafford Horne wrote:
> Why can't m68k switch to little-endian in qemu and the kernel?  The m68k virt
> platform is not that old, 1 year? Are there a lot of users that this would be a big
> problem?

I also share this perspective. AFAICT, m68k virt platform *just*
shipped. Fix this stuff instead of creating more compatibility bloat for
a platform with no new silicon. The risks of making life difficult for
15 minutes for all seven and a half users of that code that only now has
become operational is vastly dwarfed by the good sense to just fix the
mistake. Treat the endian thing as a *bug* rather than a sacred ABI.
Bugs only become sacred if you let them sit for years and large numbers
of people grow to rely on spacebar heating. Otherwise they're just bugs.
This can be fixed.

Jason

