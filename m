Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620835EE381
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:52:35 +0200 (CEST)
Received: from localhost ([::1]:47946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odbEX-00013f-HD
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1odan4-0007ZW-D7; Wed, 28 Sep 2022 13:24:11 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:54675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1odan2-0008IR-A2; Wed, 28 Sep 2022 13:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=QpqBz0HoL5IHNOwO12U9HkU/sEd6AyVJIVpjVu/PkiA=; b=XreQwMzBNFiV1JRQsN14k9jmKD
 APDqzVD1OWS389ZTrMmbdKf+rtdjfBAP12DfJLBAT32iqBE+mS1OLkyzLShUu82968FWHBBii7Rtl
 RLmdaINixMPJPuxXGS2/QovexBer20JEYl2TdEUVqWnIJ/UDkCX6MsQizcTfivwO0AUJuS6BlcML3
 ji3cokS++Ko3fK9MTVmO8U8gmzhe0s9qheZknJ2X3Ys2DjXWsNGYnd5Vfc6omb4NrXfDSqyyISmtI
 8Q7sjaiBl/Ep+jYFOSmzGjnQimXvHwFB5/l+0fgDRAQUU/epjdy2M0mAlRfSPTxzauzztxat/eLIN
 vmf0l6V/8jxEiBvwo03C34c/NH9h8z+I4RgScfy87Jvgfl/B1svOrT4a/OauLi4fsPIFRBZUMuT7A
 hrA/HfK0cHmEvbURs5/hrU8FtcEiGHkRHt/njanCnoaZlSeI43GWWr5eZh7Kn/lOwRwgqWrr/wgNM
 5w8pDk+lxR48iQ8nHnl9uNJV1J2OuwQQEG/k85Fkw/yF12T2Ylx00UZ4KkvzHGF72u8V4rhaY60vI
 Epe5SiLQ60ZIWZh46+rtnYPl+/n2YzJqre3bE1svum+mfgbP/hU7qPUEq/ysMwWLCXrk2iNQlNa2y
 49baSLazYSxIFOixJvkupattntNDtqj+z597cUGys=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Qemu-block <qemu-block@nongnu.org>
Cc: Linus Heckemann <git@sphalerite.org>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 1/1] 9pfs: avoid iterator invalidation in
 v9fs_mark_fids_unreclaim
Date: Wed, 28 Sep 2022 19:24:03 +0200
Message-ID: <8042021.lWAJiCS524@silver>
In-Reply-To: <20220927214702.63ac8a7b@bahia>
References: <20220926124207.1325763-1-git@sphalerite.org>
 <3675458.bPJFzOz80O@silver> <20220927214702.63ac8a7b@bahia>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Dienstag, 27. September 2022 21:47:02 CEST Greg Kurz wrote:
> On Tue, 27 Sep 2022 19:14:33 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Dienstag, 27. September 2022 15:05:13 CEST Linus Heckemann wrote:
> > > One more thing has occurred to me. I think the reclaiming/reopening
> > > logic will misbehave in the following sequence of events:
> > > 
> > > 1. QEMU reclaims an open fid, losing the file handle
> > > 2. The file referred to by the fid is replaced with a different file
> > > 
> > >    (e.g. via rename or symlink) outside QEMU
> > > 
> > > 3. The file is accessed again by the guest, causing QEMU to reopen a
> > > 
> > >    _different file_ from before without the guest having performed any
> > >    operations that should cause this to happen.
> > > 
> > > This is neither introduced nor resolved by my changes. Am I overlooking
> > > something that avoids this (be it documentation that directories exposed
> > > via 9p should not be touched by the host), or is this a real issue? I'm
> > > thinking one could at least detect it by saving inode numbers in
> > > V9fsFidState and comparing them when reopening, but recovering from such
> > > a situation seems difficult.
> > 
> > Well, in that specific scenario when rename/move happens outside of QEMU
> > then yes, this might happen unfortunately. The point of this "reclaim
> > fid" stuff is to deal with the fact that there is an upper limit on
> > systems for the max. amount of open file descriptors a process might hold
> > at a time. And on some systems like macOS I think that limit is quite low
> > by default (like 100?).
> > 
> > There is also another issue pending that affects pure inner-guest
> > behaviour; the infamous use-after-unlink() use pattern:
> > https://wiki.qemu.org/Documentation/9p#Implementation_Plans
> > https://gitlab.com/qemu-project/qemu/-/issues/103
> > 
> > It would make sense to look how other file servers deal with the max.
> > amount of file descriptors limit before starting to just fight the
> > symptoms. This whole reclaim fid stuff in general is PITA.
> 
> Yes this reclaim code is just a best effort tentative to not
> starve file descriptors. But since its implementation is path
> based, it gets the per-design limitation that nothing should
> modify the backing fs outside of the current 9p session.

Sure.

> Note: just like the use-after-unlink() infamous pattern (I love
> the wording), you can get this with a "pure inner-guest behaviour"
> using two devices with overlapping backends (shoot in the foot
> setup) :-)

True.

> Recovering from lost state is impossible but the server should
> at least try to detect that and return EIO to the client, pretty
> much like any storage device is expected to do if possible.

Yeah, I agree.

Nevertheless, I just had a glimpse on how this is handled on Samba, and one 
important aspect they are doing is trying to increase (hard & soft) limits:

https://github.com/samba-team/samba/blob/master/source3/lib/util.c#L1320

Which makes sense, and now I remember commonly doing that on macOS as well due 
to Apple's very low default limit there.

Samba's anticipated default limit is a max. of 10k open files BTW, which is 
quite a good ground for not getting into these waters in the first place. 
Again, not that I would ignore that space.

Best regards,
Christian Schoenebeck



