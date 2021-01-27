Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65836306278
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 18:47:46 +0100 (CET)
Received: from localhost ([::1]:56048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4ouv-00013A-AV
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 12:47:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l4otk-0000NH-48; Wed, 27 Jan 2021 12:46:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:58746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l4otg-0001G1-Kt; Wed, 27 Jan 2021 12:46:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3D5B64DA3;
 Wed, 27 Jan 2021 17:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611769586;
 bh=g8a+rUaoG7io61GfM1BwmCuE36ZYDhVXJHapUabhW/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BjYxv0X1VDuH9aN1aLgJFXfJba1VNQw9q6UQqCh68UiqRDX0DddtQ0on+YarN5hkI
 PhxSZ77Gu/yTKT2AZbg7SjxhWclH1oIXtR2AOj5Y7+HgxtXbQPDno3wVnE94Eu5wi0
 ywkN728v+EvNIM51cJpptOFmbD7te5OggSW+x8s/L1xi2Kx1W4ccC3Uiz48btG/Pwr
 7z/dPb+lwR/keDDdGjNMzPKXH0T83cQ78ZRDfN57o2bZNjHxIkiNIfyLXszFMEX71D
 3d2tx5GhvNXVI4rlt9j//5ioG4BMx4TkyX74JBilnEQmooTbuHH9cOT9sEC60Yyjih
 884JJbxw7tedA==
Date: Wed, 27 Jan 2021 09:46:23 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 0/3] Fix zone write validation
Message-ID: <20210127174623.GC1816249@dhcp-10-100-145-180.wdc.com>
References: <20210126050248.9077-1-dmitry.fomichev@wdc.com>
 <YA/RJhWQMV/6jqTS@apples.localdomain>
 <YA/VjPTKjl0Mhq9l@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YA/VjPTKjl0Mhq9l@apples.localdomain>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Niklas Cassel <niklas.cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 26, 2021 at 09:40:44AM +0100, Klaus Jensen wrote:
> On Jan 26 09:21, Klaus Jensen wrote:
> > On Jan 26 14:02, Dmitry Fomichev wrote:
> > > These patches solve a few problems that exist in zoned Write
> > > ans Zone Append validation code.
> > > 
> > > Dmitry Fomichev (3):
> > >   hw/block/nvme: Check for zone boundary during append
> > >   hw/block/nvme: Check zone state before checking boundaries
> > >   hw/block/nvme: Add trace events for zone boundary violations
> > > 
> > >  hw/block/nvme.c       | 35 ++++++++++++++++++++---------------
> > >  hw/block/trace-events |  3 +++
> > >  2 files changed, 23 insertions(+), 15 deletions(-)
> > > 
> > 
> > I don't think there are any obvious benefits to this series over my fix
> > and since you didn't identify any functional issues with it, I'm
> > thinking we go with that.
> > 
> > My fix additionally removes setting ALBA in the CQE for regular writes
> > and bundles the endianness fix by changing the related logic in
> > do_write.
> > 
> > I have a couple of series in queue that also includes zoned writes and
> > there is no reason they have to indirectly deal with append. It's just
> > cleaner to move this special case closer to where it's used.
> 
> Keith,
> 
> I think this calls for your +1 tiebreaking special ability.

Klaus,

Your series arrived very timely, and since it looks fine (unless there
are outstanding objections?), I think it's fair to apply your series.
Subsequent changes can rebase to that.

