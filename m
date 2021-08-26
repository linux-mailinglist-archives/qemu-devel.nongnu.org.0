Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8223F886A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:11:49 +0200 (CEST)
Received: from localhost ([::1]:40292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFAZ-0004s4-Im
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <62f08c3c6e1e4f669b034af831dd898aed9a902c@lizzy.crudebyte.com>)
 id 1mJF7Y-0003O0-FH
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:08:40 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:54677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <62f08c3c6e1e4f669b034af831dd898aed9a902c@lizzy.crudebyte.com>)
 id 1mJF7R-0006Vt-WE
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:08:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=0E+jOWv0uKjvZG2iAtApUvcFkdUHOYDQbj6eBDsr/S4=; b=bkBAp
 dPuULEgsTSDBpzc/wtfrI2NB+tdWaaNbGuRwZD0c4Jq28iPTsGSVosW6Cb07dGELQwgVMKFuuK9+P
 DLDMqa04UoHSHRN9vd0go0coBZIxlzIIJWxbby+isdXLxae7jnAbmW7tWsliyJ9QmGmGx1AnHBmfa
 DjiFOR4NrfEgEgYhvVwgevmr3Il6IYhb3dFKsUzM4cgs3FWgKQ17k6oCjyuitGDjofo4rwKv7aT5C
 13oXA1fNR95lgSl6p4np1rGfS+BPIuCv7O1AyET8TLI1I7v5BuB5Y1KWnMk5fid+gyAMXIfOYmlDi
 9N6RjdQqYXpOQul8aWBgDMwtFf4Ng==;
Message-Id: <cover.1629982046.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 26 Aug 2021 14:47:26 +0200
Subject: [PATCH v3 0/5] introduce QArray
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=62f08c3c6e1e4f669b034af831dd898aed9a902c@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Patches 1 and 2 introduce include/qemu/qarray.h which implements a deep auto
free mechanism for arrays. See commit log of patch 1 for a detailed
explanation and motivation for introducing QArray.

Patches 3..5 are provided (e.g. as example) for 9p being the first user of
this new QArray API. These particular patches 3..5 are rebased on my
current 9p queue: https://github.com/cschoenebeck/qemu/commits/9p.next
which are basically just the following two queued patches:

https://github.com/cschoenebeck/qemu/commit/7772715d43908235940f5b7dec68d0458b1ccdf4
https://github.com/cschoenebeck/qemu/commit/838b55e392ea7d52e714fdba1db777f658aee2cc

v2 -> v3:

    * Refactor QArrayRef() -> QARRAY_REF() [patch 1], [patch 5].

    * Commit log: Add more thorough explanation for the motivation of QArray,
      along with example for advantage over GArray [patch 1].

    * Commit log: Add reason for using MIT license for qarray.h instead of
      the standard QEMU license GPLv2+ [patch 1].

    * API doc comments: use 'size_t' type consistently in API doc example
      code [patch 1].

v1 -> v2:

    * Minor API comment changes [patch 1].

    * Perform strong type check by using __builtin_types_compatible_p()
      instead of a weak check using sizeof() [patch 2].

Christian Schoenebeck (5):
  qemu/qarray.h: introduce QArray
  qemu/qarray.h: check scalar type in QARRAY_CREATE()
  9pfs: make V9fsString usable via QArray API
  9pfs: make V9fsPath usable via QArray API
  9pfs: use QArray in v9fs_walk()

 fsdev/9p-marshal.c    |   2 +
 fsdev/9p-marshal.h    |   3 +
 fsdev/file-op-9p.h    |   2 +
 hw/9pfs/9p.c          |  19 ++---
 include/qemu/qarray.h | 160 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 174 insertions(+), 12 deletions(-)
 create mode 100644 include/qemu/qarray.h

-- 
2.20.1


