Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F37441EFB4
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 16:39:02 +0200 (CEST)
Received: from localhost ([::1]:35104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWJgi-0007zs-TS
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 10:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <90c65d1c1ca11c1b434bb981b1fc7966f7711c8f@lizzy.crudebyte.com>)
 id 1mWJdm-0005Wa-4t
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 10:36:03 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:57649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <90c65d1c1ca11c1b434bb981b1fc7966f7711c8f@lizzy.crudebyte.com>)
 id 1mWJdj-0008K8-PG
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 10:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=AbEr1cMeepv5cYbB/4Yli0IlGUCW7Xs3QmQHmc7g77E=; b=AnOvJ
 DSaNCkm78HeZ7ticWR4At9xAcJ8F+d0WghS1aQcKEiHoadeQ7Ab9dy7c4UdLxetc58bEdmuwJKOjP
 gLlkkrkmhTNCt8Grn8A3Y2IYvolXoMkkYDEvWnUMfVWsPynb6lk11qNMGyhvLot4Gjk8t28DNOJ8r
 olC7a5xfHTWKB5U6q/F2oMOK8ZpsjshYbILWUsA+YHT1KcR3ZG56kN/b37Hjj4uTr7sd0ag+uEV2y
 crCr4A6Rs8mnuRBC/qeZvlyCGfzLzGIeIAksVdnQsxmwiNXdEOZxMNvcOPUCVWJdMTD4U7KOys7eN
 SE0KBNuK669+lS8ZucN66V2TtgZ/w==;
Message-Id: <cover.1633097129.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 1 Oct 2021 16:25:22 +0200
Subject: [PATCH 0/5] 9pfs: introduce P9Array
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=90c65d1c1ca11c1b434bb981b1fc7966f7711c8f@lizzy.crudebyte.com;
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

This is simply a refactored follow-up of the following previous series
("introduce QArray"):
https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg04530.html

There was no consensus about a project wide "QArray" shared utility code,
nor does there seem to be a need for a project wide code, so let's just
refactor QArray -> P9Array and make it a 9P local type for now:
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg07743.html

Changes QArray v3 -> P9Array v1:

  * Moved header file, i.e. include/qemu/qarray.h -> fsdev/p9array.h

  * Refactored *QArray* -> *P9Array*

  * Refactored P9ARRAY_CREATE -> P9ARRAY_NEW and
    p9array_create_* -> p9array_new_* accordingly

  * Refactored DECLARE_P9ARRAY_TYPE -> P9ARRAY_DECLARE_TYPE

  * Refactored DEFINE_P9ARRAY_TYPE -> P9ARRAY_DEFINE_TYPE

  [No behaviour changes whatsoever]

Christian Schoenebeck (5):
  9pfs: introduce P9Array
  fsdev/p9array.h: check scalar type in P9ARRAY_NEW()
  9pfs: make V9fsString usable via P9Array API
  9pfs: make V9fsPath usable via P9Array API
  9pfs: use P9Array in v9fs_walk()

 fsdev/9p-marshal.c |   2 +
 fsdev/9p-marshal.h |   3 +
 fsdev/file-op-9p.h |   2 +
 fsdev/p9array.h    | 160 +++++++++++++++++++++++++++++++++++++++++++++
 hw/9pfs/9p.c       |  19 ++----
 5 files changed, 174 insertions(+), 12 deletions(-)
 create mode 100644 fsdev/p9array.h

-- 
2.20.1


