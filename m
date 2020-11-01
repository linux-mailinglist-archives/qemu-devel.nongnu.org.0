Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E912A20F3
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Nov 2020 20:15:28 +0100 (CET)
Received: from localhost ([::1]:49014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZIp4-00063T-Jx
	for lists+qemu-devel@lfdr.de; Sun, 01 Nov 2020 14:15:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kZIo5-0005c8-56
 for qemu-devel@nongnu.org; Sun, 01 Nov 2020 14:14:25 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:59333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kZIo2-0000Vt-6t
 for qemu-devel@nongnu.org; Sun, 01 Nov 2020 14:14:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=jnAHarMVBqVRcOqaIvqYgjZCHBoNez8PZ68VwiAU8g4=; b=Texh6uxyYTlDgvT/U3zWsl42En
 LxtN5SgNN2R6EnaJR0mXPUAxU37Jcy03g0jNAvUkH1cr9OMdilUMBPYMDCBYRtB9jGnCxgWwlyH7/
 TOzk6RIFBaMw/W7f8415g5YvbHLAhIXiuz0uDthDlrhLLJVqWqf9W/S+/EDi3g3phYeCp9kLgISXo
 R4o9aVUsv92gvrmxThTYAC5l7Giu3TDVmUjt2WrtFfZJ8WUpGtSVccMgKHGZRZqJybFyP86Y7cakH
 prjmHm//P6h7Ra0dYslE1F9rUCUNdNXF2vjZE716xGJO1LwNHUiegRCUxwrRZRIBKZ3UnBHUqrR0b
 Tse6Es1Q==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v3 2/2] tests/9pfs: fix test dir for parallel tests
Date: Sun, 01 Nov 2020 20:14:16 +0100
Message-ID: <2531717.KjLcWJ8QnQ@silver>
In-Reply-To: <20201101184444.0da77d03@bahia.lan>
References: <cover.1604243521.git.qemu_oss@crudebyte.com>
 <7746f42d8f557593898d3d9d8e57c46e872dfb4f.1604243521.git.qemu_oss@crudebyte.com>
 <20201101184444.0da77d03@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/01 14:14:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sonntag, 1. November 2020 18:44:44 CET Greg Kurz wrote:
> On Sun, 1 Nov 2020 15:37:12 +0100
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > Use mkdtemp() to generate a unique directory for the 9p 'local' tests.
> > 
> > This fixes occasional 9p test failures when running 'make check -jN' if
> > QEMU was compiled for multiple target architectures, because the
> > individual
> > architecture's test suites would run in parallel and interfere with each
> > other's data as the test directory was previously hard coded and hence the
> > same directory was used by all of them simultaniously.
> > 
> > This also requires a change how the test directory is created and deleted:
> > As the test path is now randomized and virtio_9p_register_nodes() being
> > called in a somewhat undeterministic way, that's no longer an appropriate
> > place to create and remove the test directory. Use a constructor and
> > destructor function for creating and removing the test directory instead.
> > Unfortunately libqos currently does not support setup/teardown callbacks
> > to handle this more cleanly.
> > 
> > The constructor functions needs to be in virtio-9p-test.c, not in
> > virtio-9p.c, because in the latter location it would cause all apps that
> > link to libqos (i.e. entirely unrelated test suites) to create a 9pfs
> > test directory as well, which would even break other test suites.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks for the overtime, on a Sunday!

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

And this one with Peter Xu's patches on top, just for testing:
https://github.com/cschoenebeck/qemu/commits/9p.experimental.2

> I could run 'make check -j' with 4 archs (ppc64, x86_64, aarch64, s390x)
> on a POWER9 system with 128 cpus, for ~1 hour without seeing any failure.
> 
> Tested-by: Greg Kurz <groug@kaod.org>

OO Sounds like having advantages working for IBM. Respect. I start to get envy 
as these beasts are running towards PCIe 6, while we regular x86 users would 
already be glad having PCIe 4.

I give it some more spinning hours this time, just to be sure, before sending 
the PR tomorrow morning. But I think it's all right now.

Thanks!

Best regards,
Christian Schoenebeck



