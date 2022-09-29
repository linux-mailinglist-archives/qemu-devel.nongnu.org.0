Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54265EFE6B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 22:09:12 +0200 (CEST)
Received: from localhost ([::1]:34246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odzqJ-0005P0-Be
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 16:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1odzlr-0002H7-H6; Thu, 29 Sep 2022 16:04:41 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:49716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1odzlo-0005CM-RH; Thu, 29 Sep 2022 16:04:35 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A56F9B82677;
 Thu, 29 Sep 2022 20:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4272FC433D7;
 Thu, 29 Sep 2022 20:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664481868;
 bh=/EfjNeSL41O8nsPYm2naA2pOEvaJtYD4w3QkdNtEHis=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K+GksO0UU7zqMSFFMdBuCIjGY562IKfBfEcXXkSegc366bjYa+SfZTnFXInbaIeiC
 7cGf8XBeufYneH84Rh2XSYzfHVIbreag6X9s6khZBswfznx+WK2Qyq/rucZBG3xxAh
 ehrA6qFnsPwei3xiEcAb8oYOBuVwUo0yDQRJ1rJF81aFpY28RSS4YWI77RhSScUnlO
 V3l4md0jxZyv/Y8lH+4XeQtD8til6aZ9BXfx1O9lLg6t6BxWV6EcZuRhQ8rVg18ZHB
 uRqnT5KcJ/KpIlQ5zDp5GpXom9q9ewIrQCGNslUKO6jWHZ39B1RAHsC66DtXPd+frq
 DT61F8PFMcHbw==
Date: Thu, 29 Sep 2022 14:04:24 -0600
From: Keith Busch <kbusch@kernel.org>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Keith Busch <kbusch@fb.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCHv2] block: use the request length for iov alignment
Message-ID: <YzX6SN8ZavPu/RZ7@kbusch-mbp.dhcp.thefacebook.com>
References: <20220923153451.3810456-1-kbusch@fb.com>
 <YzXDSlksuOucjZm3@kbusch-mbp.dhcp.thefacebook.com>
 <YzXdFhmMkDG5kS8y@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzXdFhmMkDG5kS8y@redhat.com>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=kbusch@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 29, 2022 at 07:59:50PM +0200, Kevin Wolf wrote:
> Am 29.09.2022 um 18:09 hat Keith Busch geschrieben:
> > On Fri, Sep 23, 2022 at 08:34:51AM -0700, Keith Busch wrote:
> > > 
> > > An iov length needs to be aligned to the logical block size, which may
> > > be larger than the memory alignment. And since this is only used with
> > > file-posix backing storage, move the alignment function to there, where
> > > the value of the request_alignment is known to be the file's logical
> > > block size.
> > 
> > Any objections to this version? This is fixing real bug reports that
> > may become more frequent without this patch.
> 
> I think it is okay. Splitting it in two patches would have been nicer
> (one for moving code, one for making the change), but it's small enough
> that I can ignore that. I'll probably merge it tomorrow.

I agree that splitting makes the functional change stand out, otherwise a
casual look may mistake the patch as a simple function move. I'll send you a
new version.

