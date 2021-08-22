Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5628F3F3F7F
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 15:33:01 +0200 (CEST)
Received: from localhost ([::1]:33604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHnat-0005gP-TL
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 09:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <18150291edc827161bf631e1d4618ebcdf259da2@lizzy.crudebyte.com>)
 id 1mHnYW-0003A4-4V
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 09:30:32 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:47201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <18150291edc827161bf631e1d4618ebcdf259da2@lizzy.crudebyte.com>)
 id 1mHnYU-00015t-3F
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 09:30:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=4Lh3XX06txFmLxcz0G8xApPQDzFI1zx8tkdrFccGpUA=; b=XIvuB
 hD0nJEoNz2n4wI/byZEXm3b+QQIDV/0K7E4W+o33wZ2e1/kiZsDGAZkQJNgX1oNVAlDnLNfxbUsyH
 9ezkTmdJs80gXFkMTCXnxihpyYtNRMMdTACGZI4YsygpYUfaFVTfxYBSev9OyWf2PWB8MxKsNA6st
 ZnOHp2Mobg70MteUwQaJfmOU8Fe2+himu+iUiaQGcTzuWGPwZ1PjsVXST8/EVKQNGvtP/+TWxhxTF
 Ng+wkCY1qDPwLYB0kq8yzbdakIHe2B0+V/MoyrU/nsa8QRN9ktw9qfIMOSwBARNd7fxNCwcsyCQbh
 J4RXhGgaC2y85TsHf1ULwTP7j68OQ==;
Message-Id: <cover.1629638507.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 22 Aug 2021 15:21:47 +0200
Subject: [PATCH v2 0/5] introduce QArray
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=18150291edc827161bf631e1d4618ebcdf259da2@lizzy.crudebyte.com;
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
free mechanism for arrays. Unlike GArray it does not require special macros,
function calls or member dereferencing to access the individual array
elements. So existing C-style array code can be retained with only very
little changes.

In this initial version QArray only supports the concept of unique pointers,
i.e. it does not support reference counting. The array (and all dynamically
allocated memory of individual array elements) is auto freed once execution
leaves the scope of the reference variable (unique pointer) associated with
the array.

Patches 3..5 are provided (e.g. as example) for 9p being the first user of
this new QArray API. These particular patches 3..5 are rebased on my
current 9p queue: https://github.com/cschoenebeck/qemu/commits/9p.next
which are basically just the following two queued patches:

https://github.com/cschoenebeck/qemu/commit/7772715d43908235940f5b7dec68d0458b1ccdf4
https://github.com/cschoenebeck/qemu/commit/838b55e392ea7d52e714fdba1db777f658aee2cc

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
 include/qemu/qarray.h | 156 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 170 insertions(+), 12 deletions(-)
 create mode 100644 include/qemu/qarray.h

-- 
2.20.1


