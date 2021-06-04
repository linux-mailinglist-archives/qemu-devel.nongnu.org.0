Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008D939BF95
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 20:27:25 +0200 (CEST)
Received: from localhost ([::1]:52206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpEXU-0005Mj-0V
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 14:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lpETi-0003Pw-3S
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:23:30 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:59153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lpETd-0000nu-AN
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=8sgYhNfYdBTjy8pUefMu9BJT6+D0M10LX8FPgMGYjOw=; b=C42Et3ekUHVS1Li0xkNs5eHEmQ
 IDWKmVjAmPmlXmNcYqzakbPRN+8z6ayFGEM07Q05PD/dqGouOmx6AUxfm/W1ayovFhCoy90wVaLG2
 y7R/eXlZGbgF44nmxF3O6eOzOGq2AYguYIUiVFVCWedu2X+RaU4pR3+EIz9zBeYqO2L0ffkKpwAGU
 8/1tzRCyyg9UJHzRSy604h7Ez7eNMRGjyeCN3bfwlVdmikF3hNcmQd98wDNlzkMimE6J+WfTAIAy+
 R0qALuZvztqLYy8YJobf6YhY8QrExKP6FWtQcHT1okXPykvbVh5SU4gZTairqPY6tEBVq9nYktsaL
 doR4xLyCYlDDExvh8qEjToHRPLmTUWKi+ERd0KeJ6A9jRqSK+FXK25G+p7VJKvGeeIgaRksqBvae/
 91KuWu9JqtM0zVXybxkaqnZxwg2+E5VJaBBad9a/F9RUF9oIazYHgq4bzVKfEztINpAkUPAbf7ry6
 rrCTWwvBFcmA5yq5Vab6JnqkHbo1UNJ9FD+Y1RfyIhfUV4NNABBihUsitDOfehPSykvxBYRhZPyBs
 I/Z+GZjL+CfwGlkVHp1hNwpqXatVZkdZ9lacGKna8AOSm8PqNUaGY67HMvZyXRWMncIgLSzghgM5n
 k+ExscsO+vK1WndjDqGoTeAPin9ClscauwSk8TCds=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 0/7] 9pfs: Twalk optimization
Date: Fri, 04 Jun 2021 20:23:21 +0200
Message-ID: <2022289.dxTFu3Ykd5@silver>
In-Reply-To: <20210604183128.23142868@bahia.lan>
References: <cover.1622821729.git.qemu_oss@crudebyte.com>
 <20210604183128.23142868@bahia.lan>
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

On Freitag, 4. Juni 2021 18:31:28 CEST Greg Kurz wrote:
> On Fri, 4 Jun 2021 17:48:49 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > This patch set reduces latency of Twalk handling by reducing the amount of
> > thread hops, similar to previous Treaddir optimization.
> > 
> > The performance gain of this patch set is not as spectacular as previously
> > with Treaddir, but there is definitely a measurable difference.
> > 
> > The actualy performance optimization is patch 7. With the benchmark of
> > patch 2, the runtime of the Twalk test was cut in half. In real world
> > tests
> > I measured a performance gain (i.e. running an entire guest OS, and hence
> > mixed with all other kinds of 9p requests) of about 2%, again measured in
> > a
> > mix, not concentrated on Twalk alone.
> > 
> > v1 -> v2:
> >   * Added a separate [NEW PATCH 1] for fixing not_same_qid() semantic.
> 
> Strangely, patch 1 appears between patch 3 and 4 in my email client.

My bad, I forgot to take care about the time stamps of the individual patches 
this time.

> >   * Code style: use sizeof(var-name) instead of sizeof(type-name)
> >   
> >     [PATCH 3].
> >   
> >   * Split out dropping fid_to_qid() into separate [PATCH 4].
> >   
> >   * Split out replacing not_same_qid() by same_stat_id() into separate
> >   
> >     [PATCH 5].
> >   
> >   * Split out dropping root_qid into separate [PATCH 6].
> 
> I could have a look at all the patches except the last one. LGTM.
> You can add my R-b for patches 1 and 3 to 6.
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>

Queued patches 1, 3..6 on 9p.next:

https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

> I'll try to find some time for patch 7 next week.
> 

Twalk can be tricky, so no hurry! It takes what it takes.

> > Christian Schoenebeck (7):
> >   9pfs: fix not_same_qid()
> >   9pfs: Twalk benchmark
> >   9pfs: capture root stat
> >   9pfs: drop fid_to_qid()
> >   9pfs: replace not_same_qid() by same_stat_id()
> >   9pfs: drop root_qid
> >   9pfs: reduce latency of Twalk
> >  
> >  hw/9pfs/9p.c                 | 128 +++++++++++++++++++++++------------
> >  hw/9pfs/9p.h                 |   2 +-
> >  tests/qtest/virtio-9p-test.c |  30 ++++++++
> >  3 files changed, 116 insertions(+), 44 deletions(-)

Best regards,
Christian Schoenebeck



