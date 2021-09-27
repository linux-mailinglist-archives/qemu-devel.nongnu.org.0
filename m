Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EC14198AD
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:13:58 +0200 (CEST)
Received: from localhost ([::1]:51200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtGP-0003c1-Bi
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b84eb324d2ebdcc6f9c442c97b5b4d01eecb4f43@lizzy.crudebyte.com>)
 id 1mUtDb-00028x-05
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:11:03 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:36719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b84eb324d2ebdcc6f9c442c97b5b4d01eecb4f43@lizzy.crudebyte.com>)
 id 1mUtDZ-0001SN-Ky
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:11:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:References:In-Reply-To:Message-Id:Content-ID:
 Content-Description; bh=KjW0FdByYiNjWRRemmOXkRC6wmk7QwbmkjtN0R9DSeE=; b=jX6GY
 NmBUcvL4HyGSrIXL44htjvh1GSVBL75YSya4tU/sBJfDC0R+DLV+6yJ144tXkm9mFV2txeufPhQM+
 Acw1QmPUfUHZh5nNcgNb+XkuMPR4HLY2IZlB6PWBV93D5BY8sueRPAK7d1TqSbolWBCcdVfHiUmEa
 Z+tBe2p5vx/uZPicLv6sfq0LkQB/QU0zBXMJG2Oobnzi3SmsPdOIMoHIpAwAPTyhR+h8k8AHd5H+E
 Bz0Gq9hnDAEWoa0sGHrGewzGB0R3fUbeIBJL+z6YcQJZ57vmKC6BOo8KvQGXUNGi4YrG7fUw48iCu
 YZVEQ9uiqkc9K9HQtEc7c6vJAYGog==;
Message-Id: <b84eb324d2ebdcc6f9c442c97b5b4d01eecb4f43.1632758315.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1632758315.git.qemu_oss@crudebyte.com>
References: <cover.1632758315.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 27 Sep 2021 17:50:36 +0200
Subject: [PATCH 2/2] 9pfs: simplify blksize_to_iounit()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
    Philippe Mathieu-Daudé <philmd@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=b84eb324d2ebdcc6f9c442c97b5b4d01eecb4f43@lizzy.crudebyte.com;
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

Use QEMU_ALIGN_DOWN() macro to reduce code and to make it
more human readable.

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index c65584173a..29cc19c90a 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1280,8 +1280,7 @@ static int32_t blksize_to_iounit(const V9fsPDU *pdu, int32_t blksize)
      * as well as less than (client msize - P9_IOHDRSZ)
      */
     if (blksize) {
-        iounit = blksize;
-        iounit *= (s->msize - P9_IOHDRSZ) / blksize;
+        iounit = QEMU_ALIGN_DOWN(s->msize - P9_IOHDRSZ, blksize);
     }
     if (!iounit) {
         iounit = s->msize - P9_IOHDRSZ;
-- 
2.20.1


