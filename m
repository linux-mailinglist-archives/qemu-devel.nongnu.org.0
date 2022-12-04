Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA90C641F90
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 21:35:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1vgP-0002sy-9v; Sun, 04 Dec 2022 15:33:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1p1vgM-0002rT-Lc; Sun, 04 Dec 2022 15:33:50 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1p1vgK-0008PA-JY; Sun, 04 Dec 2022 15:33:50 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1969260E97;
 Sun,  4 Dec 2022 20:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCE8C433C1;
 Sun,  4 Dec 2022 20:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670186018;
 bh=H++EKkN+pHupQnfFYEMZzSUdj8ucbFe//4xmx+oL6eE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k+CB6FWxbrgEg7omPgFc630DpPYfa4cSiXapVmd6pCOonHMp066QOTB/Yo4GqIMIt
 H3xBeQu5a7FS9iBHRoQS3TcXzkFQL6PoPX4TQSTaoXFwMgqv+bqVyUEE+iUmdu6dxH
 MVwkLXU6UvwYq+WeCBU3Yd/UB+mydlDFFgEG98JYSKtzdnPvTSwfit6xto0HL2/6lq
 9/QNdG4OBdVBUP4BeInB6oI29a58wclqlWRHhon2C4zGi+T98jxNjkDbHJz3F3X/Am
 khc+jbzcW59ZG+1nM8zcbA89nTmkCZ5SzkS5ZB12n6bLnImwsziEI88GC6fXdafxFE
 BVjscyO6HqgxQ==
Date: Sun, 4 Dec 2022 20:33:33 +0000
From: Keith Busch <kbusch@kernel.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PULL for-7.2 0/5] hw/nvme fixes
Message-ID: <Y40EHSGQkqUzr3lP@kbusch-mbp>
References: <20221201165024.51018-1-its@irrelevant.dk>
 <CAJSP0QUev9iCGpqiN35d87RBGiQxK4weXGR5hGJT7W00E31=oA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QUev9iCGpqiN35d87RBGiQxK4weXGR5hGJT7W00E31=oA@mail.gmail.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=kbusch@kernel.org; helo=dfw.source.kernel.org
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

On Sun, Dec 04, 2022 at 11:06:13AM -0500, Stefan Hajnoczi wrote:
> On Thu, 1 Dec 2022 at 11:50, Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > From: Klaus Jensen <k.jensen@samsung.com>
> >
> > Hi,
> >
> > The following changes since commit c4ffd91aba1c3d878e99a3e7ba8aad4826728ece:
> >
> >   Update VERSION for v7.2.0-rc3 (2022-11-29 18:15:26 -0500)
> >
> > are available in the Git repository at:
> >
> >   git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request
> 
> Hi Klaus,
> Please send pull requests with an https:// URI in the future.

Is this a new requirement? Our public git server doesn't support https.

