Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EDCBB783
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 17:07:37 +0200 (CEST)
Received: from localhost ([::1]:57848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCPw8-00042t-R9
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 11:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43782)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1iCPs8-0000M7-VF
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 11:03:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qemu_oss@crudebyte.com>) id 1iCPs7-0006lK-Qn
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 11:03:28 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:55323)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
 id 1iCPs7-0006kz-Cw
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 11:03:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=FQWR44NW54JKsB6BlIioC5kElJ3Zk2JnBCtoI0ElxaU=; b=s3rxZtAYCCFcUEXGOtaf9V7YZl
 9mCC11drn9cMuEltbwIJuutyCTlqLAMUcqgtplyLy9aOjcjvxJ39JD2EgFDw7uHiE4kCocEzNWzm2
 /VXISiXpbtoy4XBtxmQ7Jbod6op29S40vXUpX2CkqTcXA61++VUYKN6r9yu0KjsNUj4fBdZ6VXXkv
 hHwgLZO69df9pHhy5iVOiX07I6Q6bfd284KP2XbMpBMhnXoa25oVrODOq6bHYQbwtDgtw38S1W9mX
 vmDhGkO9JgvPGLapx6a5PfU8JQZec/+sJqLiBImGNaMfcZDN+AxmZWMINkrWGCwKvf9Gqx80kfOQy
 kIPpRXnWUwC5xkqN2OoDYaB95Alq3SgSeyn1nsnEdqJT95TwODU5v12BifkFPlo8Qqs+WgV1vCyS7
 +4r+tWpmyxXE/LBz0jL2XkvWnNtqW4r/kpTE5s/UKPQPPofiZKgeS3CHHR02eFz2oGaAgvOOCaflR
 Vwp4UuQNi6wIa1BZ5Vinw9VjiOxZKlsO/1xwM+jA9lrr4uRg9XTySs6sqqwWKRuL2Lkd10LqJ5hKI
 mlZrF3xoNC4/8dEYj3rCdChxGciEqwEcfNPpNY43Q2tXWZmoAzmi2lIe3ZTWav4KQl1+1Sxl5Hy7L
 HtOfqkAoS6DIDlDJpc14ZBide9XdjirdovFURJxW8=;
To: Greg Kurz <groug@kaod.org>
Subject: Re: [Qemu-devel] [PATCH v7 0/3] 9p: Fix file ID collisions
Date: Mon, 23 Sep 2019 17:03:23 +0200
Message-ID: <7439377.rdf1oF7g69@silver>
In-Reply-To: <20190923164653.5b79797a@bahia.lan>
References: <cover.1567680121.git.qemu_oss@crudebyte.com>
 <2537302.ZFCiNNprIf@silver> <20190923164653.5b79797a@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.189.157.229
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
Cc: Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Antonios Motakis <antonios.motakis@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Christian Schoenebeck <qemu_oss@crudebyte.com>
From: Christian Schoenebeck via <qemu-devel@nongnu.org>

On Montag, 23. September 2019 16:46:53 CEST Greg Kurz wrote:
> > > > > I'll do some
> > > > > more manual testing and issue a PR when I'm confident enough.
> > > > 
> > > > That would be highly appreciated! So far I am the only one ever having
> > > > tested this patch set at all!
> > > 
> > > Just to clarify, I won't thoroughly test it. My main concern is that it
> > > doesn't break things.
> > 
> > So in other words you are only going to test the default behaviour
> > --multidevs=warn?
> 
> This I've already done, along with multidevs=forbid.
> 
> Now I plan to run the PJD test suite from Tuxera with a simple
> cross-device setup and --multidevs=remap. And that's it.

Well, Ok then, however at least some simple, manual, final "ls -i" of the 
inode numbers on guest would not hurt though. ;-)

> > If yes, and since that would mean I was the only person ever having tested
> > the actual fix, shouldn't --multidevs=remap|forbid better be marked as
> > experimental (docs and runtime warning) for now? Maybe that would also
> > anticipate receiving feedback from people actually using it later on.
> Makes sense. I don't think it is worth having a runtime warning,
> but I'll turn remap to x-remap and amend the docs.

Mwa, I would like to veto against your "x-remap" plan though. Keep in mind I 
also have to send out a patch for libvirt for this fix. Even I would not have 
read "x" to stand for "experimental". So I would definitely favor a runtime 
warning instead of renaming that parameter.

I can send a patch on top for docs and warning if you want.



