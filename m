Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D826AD8E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 19:19:10 +0200 (CEST)
Received: from localhost ([::1]:51394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnR6b-0006qg-1T
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 13:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38900)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hnR6O-0006O6-Tv
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 13:18:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hnR6N-0005FR-Sc
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 13:18:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55974)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hnR6L-0005Cx-Ne; Tue, 16 Jul 2019 13:18:53 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4BC8C302246A;
 Tue, 16 Jul 2019 17:18:52 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-24.ams2.redhat.com [10.36.117.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 391885E7A5;
 Tue, 16 Jul 2019 17:18:51 +0000 (UTC)
Date: Tue, 16 Jul 2019 19:18:49 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20190716171849.GL7297@linux.fritz.box>
References: <20190703172813.6868-1-mreitz@redhat.com>
 <20190703172813.6868-6-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190703172813.6868-6-mreitz@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 16 Jul 2019 17:18:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 05/12] block: Reduce (un)drains when
 replacing a child
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.07.2019 um 19:28 hat Max Reitz geschrieben:
> Currently, bdrv_replace_child_noperm() undrains the parent until it is
> completely undrained, then re-drains it after attaching the new child
> node.
> 
> This is a problem with bdrv_drop_intermediate(): We want to keep the
> whole subtree drained, including parents, while the operation is
> under way.  bdrv_replace_child_noperm() breaks this by allowing every
> parent to become unquiesced briefly, and then redraining it.
> 
> In fact, there is no reason why the parent should become unquiesced and
> be allowed to submit requests to the new child node if that new node is
> supposed to be kept drained.  So if anything, we have to drain the
> parent before detaching the old child node.  Conversely, we have to
> undrain it only after attaching the new child node.
> 
> Thus, change the whole drain algorithm here: Calculate the number of
> times we have to drain/undrain the parent before replacing the child
> node then drain it (if necessary), replace the child node, and then
> undrain it.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>

I think this looks good (and fixes a bug that Denis Plotnikov reported
before while trying to fix IDE submitting requests in a drained
section), but I would be even more confident if we could add tests for
the various cases to tests/test-bdrv-drain.c.

Kevin

