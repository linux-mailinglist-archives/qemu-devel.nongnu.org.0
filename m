Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EB33B5C72
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 12:22:33 +0200 (CEST)
Received: from localhost ([::1]:32846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxoPQ-0000nd-Sx
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 06:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lxoNM-0007tv-30
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 06:20:24 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:56197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lxoNI-0000z6-6Z
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 06:20:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=8037QNi9hBcNOkxITZZnOyVJdujnu9Cv6zaOsSawrKE=; b=AXE8PwJ/JBOzkD3dgbc9/Mi4Ws
 P0TKodE2XFnyvPvxaRSecRxr4V7RzK2I8Nd7+gIS6VRlRfXlRAoRUBYkiETK8a/+RXJI706zwjLI4
 x0JtV1V8eedNzvPCzR2j8+bkt4g7Xsahn8jIp8noDQGxt9H2K+4hY6uL9Lu37v8yE1f3d+iBeeRW/
 6rz5HJgAZ1gi4xECnX6p7i+uMAGeg2QBaS3ktpnRAXbdTs6eJpl/m0TUgX/Dx7wSdY/H7sKEjtZXm
 oAL/kSLPNJX2Dq6PdQ0s6TDfB0MKjlc/flZ2c1a9iXPCCJivxI0RSqst9w1h0z9I6N5tFKYe1kwCE
 C4d0VtW7u0y/WxuXAp2R96KYldWBbE+ROUp4FLzBUF1wKEJlDJ+M+xDiCGN0r4CmGuGtRs/Ia8oMS
 MJ96xU7VFUW7q2TuGjqx0syuxbmL9eJr8ObOWiue0Yaw3hk6vXjjRAM9QeamJmmE2uFsKmKrEBt33
 tzC1zuq88QmYJFIOPadcLatUKTL1O29Idu6zaGHxfOZ81E5+uBHuX28dEAB9Y2TKRDYvO2WC0Q4Ev
 Rl23mSvuo6sYpsbFNRw7SZQWyim1ZGxmj3eizKpxo7yqcS4DbNgSxXHYNF3a/XvaU5A+FenZwuNcG
 xZXtyXbRrdz8oRvFN0fIvsxKb2k7n1qMpZJoXFKN8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 0/7] 9pfs: Twalk optimization
Date: Mon, 28 Jun 2021 12:20:13 +0200
Message-ID: <1825400.NJsdj0r9HH@silver>
In-Reply-To: <2022289.dxTFu3Ykd5@silver>
References: <cover.1622821729.git.qemu_oss@crudebyte.com>
 <20210604183128.23142868@bahia.lan> <2022289.dxTFu3Ykd5@silver>
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

On Freitag, 4. Juni 2021 20:23:21 CEST Christian Schoenebeck wrote:
> On Freitag, 4. Juni 2021 18:31:28 CEST Greg Kurz wrote:
> > On Fri, 4 Jun 2021 17:48:49 +0200
> > 
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > This patch set reduces latency of Twalk handling by reducing the amount
> > > of
> > > thread hops, similar to previous Treaddir optimization.
> > > 
> > > The performance gain of this patch set is not as spectacular as
> > > previously
> > > with Treaddir, but there is definitely a measurable difference.
> > > 
> > > The actualy performance optimization is patch 7. With the benchmark of
> > > patch 2, the runtime of the Twalk test was cut in half. In real world
> > > tests
> > > I measured a performance gain (i.e. running an entire guest OS, and
> > > hence
> > > mixed with all other kinds of 9p requests) of about 2%, again measured
> > > in
> > > a
> > > mix, not concentrated on Twalk alone.
> > > 
> > > v1 -> v2:
> > >   * Added a separate [NEW PATCH 1] for fixing not_same_qid() semantic.
> > 
> > Strangely, patch 1 appears between patch 3 and 4 in my email client.
> 
> My bad, I forgot to take care about the time stamps of the individual
> patches this time.
> 
> > >   * Code style: use sizeof(var-name) instead of sizeof(type-name)
> > >   
> > >     [PATCH 3].
> > >   
> > >   * Split out dropping fid_to_qid() into separate [PATCH 4].
> > >   
> > >   * Split out replacing not_same_qid() by same_stat_id() into separate
> > >   
> > >     [PATCH 5].
> > >   
> > >   * Split out dropping root_qid into separate [PATCH 6].
> > 
> > I could have a look at all the patches except the last one. LGTM.
> > You can add my R-b for patches 1 and 3 to 6.
> > 
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> Queued patches 1, 3..6 on 9p.next:
> 
> https://github.com/cschoenebeck/qemu/commits/9p.next
> 
> Thanks!
> 
> > I'll try to find some time for patch 7 next week.
> 
> Twalk can be tricky, so no hurry! It takes what it takes.
> 
> > > Christian Schoenebeck (7):
> > >   9pfs: fix not_same_qid()
> > >   9pfs: Twalk benchmark
> > >   9pfs: capture root stat
> > >   9pfs: drop fid_to_qid()
> > >   9pfs: replace not_same_qid() by same_stat_id()
> > >   9pfs: drop root_qid
> > >   9pfs: reduce latency of Twalk
> > >  
> > >  hw/9pfs/9p.c                 | 128 +++++++++++++++++++++++------------
> > >  hw/9pfs/9p.h                 |   2 +-
> > >  tests/qtest/virtio-9p-test.c |  30 ++++++++
> > >  3 files changed, 116 insertions(+), 44 deletions(-)

Ping

How is your schedule Greg? Any chance for a time slice on this one?

Best regards,
Christian Schoenebeck



