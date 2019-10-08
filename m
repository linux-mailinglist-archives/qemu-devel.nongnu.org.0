Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8A7CFC6A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 16:29:19 +0200 (CEST)
Received: from localhost ([::1]:56606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHqUI-0007qH-4I
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 10:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1iHqR5-00061j-Ob
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 10:26:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qemu_oss@crudebyte.com>) id 1iHqR4-0008I0-Bn
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 10:25:59 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:55729)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
 id 1iHqR2-0008Cj-VY
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 10:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=JjfHH10wMmWdQzIpyfW+Y+c5Zivig6jKcZR6vgyGqiM=; b=tF4Mv6r/Pgix7ExNHICCFqEp7G
 00JbrbQnkBhZXLdbHs2J6S6jAz3nH1ZZ/IB/74+dq1pscLJjDom4VBDZKYuY/Pv0yGihf9TSkJ5gJ
 +JdsUxXhfnehf7f7hzPB5G04TKV310IRywmuT+vV5hj7JSzFGiBn28xvzDUh8yb7CsmIAXXvd+0Vv
 TE6mkWZfy7BTuCR9VRpqQTSPAB1Nn9gsbYTmt/TzkPf/PfDUqtA0Fgj1+a2k0469QC+4Hakea4Ydg
 eGSnD2iVKZagMVeO+G5tQ9BVlCJfOB+/OgLYtzgONo//qiaxiyIUu/+EogBJrNFCTzxDeRIIhPHFx
 YRoP2EQEKv5ZeEmnSiHi3GkE0f3xfA0xK/0kOnGfGLyGBweXR80BL/EDOI3hJPUpclang8UljF3BE
 euPVo4e2VHpduPJAziRf/P+3s/urMQvu8lx2UnJyUq2cpxjIu1uFccZoQTR41h+kbz7J2hBUz2BGf
 f9ng5dJ1MG2Rq/br3oQk5GW14+u/6dNhZ7SDoraDN8mWjUONBkXyLLfJj9h7Bb7r6lo/vkfPQU/a1
 D62F/se9n4cd+GeztbUHER7J8ZUbK1Jz0I2jT7JmglR8Bizx1R9mHbwT3XpjOBIYDJgkfkK50HQ+4
 tsW5infJEVNc0XJyPopVsyW7d9iMzRnkSD1MUUOnQ=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Antonios Motakis <antonios.motakis@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v7 0/3] 9p: Fix file ID collisions
Date: Tue, 08 Oct 2019 16:25:48 +0200
Message-ID: <30797240.IXYi3n4lAo@silver>
In-Reply-To: <20191008154729.5b16ef26@bahia.lan>
References: <cover.1567680121.git.qemu_oss@crudebyte.com>
 <2456208.kOTvEbKLdM@silver> <20191008154729.5b16ef26@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 8. Oktober 2019 15:47:29 CEST Greg Kurz wrote:
> On Tue, 08 Oct 2019 14:05:28 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Dienstag, 8. Oktober 2019 11:14:59 CEST Greg Kurz wrote:
> > > > No, it is not a feature. It is still a fix. :) I cannot use 9p without
> > > > this
> > > > fix at all, so it is not some optional "feature" for me.
> > > 
> > > I understand your need but this is still arguable. The 9p device has
> > > a limitation with cross-device setups. The actual bug is to silently
> > > cause inode number collisions in the guest. This is partly fixed by the
> > > "9p: Treat multiple devices on one export as an error" patch. Thinking
> > > again, it would even make sense to move "remap" from "9p: Added virtfs
> > > option 'multidevs=remap|forbid|warn'" to its own patch. We could then
> > > consider that the bug is fully fixed with "multidevs=forbid|warn".
> > > 
> > > Then comes the "remap" feature which is expected to lift the limitation
> > > with cross-device setups, with a "not yet determined" performance cost
> > > and light reviewing of the code.
> > 
> > Are these patch transfer requests addressed at me to be done?
> 
> It would certainly be appreciated :) and if it happens to be done
> before 2019-10-29, it can even be shipped with QEMU 4.2.

Just to avoid any misapprehension, since today's comments of yours made me 
sceptical: that would be

a) PR for QEMU 4.2 for *all* QID patches up to and including remapping with 
variable suffix (e.g. as -multidevs=x-remap)?

or is your current plan rather 

b) to ship the discussed 9p patches for QEMU 4.2 only up to a certain patch 
like multidevs=warn|forbid and all subsequent patches "might" then be merged 
to master somewhere in distant future?

Best regards,
Christian Schoenebeck



