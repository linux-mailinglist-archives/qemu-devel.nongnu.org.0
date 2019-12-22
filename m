Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195A5128DBA
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Dec 2019 12:44:05 +0100 (CET)
Received: from localhost ([::1]:46677 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iizeV-0000jy-Nj
	for lists+qemu-devel@lfdr.de; Sun, 22 Dec 2019 06:44:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43680)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iizZ9-0003Le-0t
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iizZ7-0006nW-JO
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:30 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:34944)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iizZ7-0004Oq-73; Sun, 22 Dec 2019 06:38:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=v7Z/v/trFlU1y5ia2m4/ef6xOxYRQRjvg+MxQ8Ut/g0=; 
 b=H2f527j8iAryF6Yn3y3JAtt4IRw5+koAqlY7i59Z0b7Qu9fDrGplAgI9MSCQSgnJp1jzlarCbu53nOnZPqKJRv7rmYHnbtR9sL0ZFo+yhU5KegLLe6IgVTnnG2Xe9MHjPbrYxahcOnjow9ZPzqOgEo16hATlM15sD855mBn8GJk4zlms+1YPFdhKvv0iIoZf7r5wuY171tVkKHM5nyjYfKK7rOYniU8I8n29wjd1EZaNt25eMyE4p2UFsheh4OfqTty0t5qZxi6Trlv6UddmndEc3BbybISPL4g/TtgJ2vjWrtqql33xkVu0SgdluwD+PE98eI7tlZ5mCglio9zLZA==;
Received: from [80.30.182.172] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iizYU-0005dA-IL; Sun, 22 Dec 2019 12:37:50 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1iizXu-0001Vi-Et; Sun, 22 Dec 2019 12:37:14 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 08/27] qcow2: Add offset_to_sc_index()
Date: Sun, 22 Dec 2019 12:36:49 +0100
Message-Id: <e0747406459f85893c213381c165b4234c3cde96.1577014346.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1577014346.git.berto@igalia.com>
References: <cover.1577014346.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For a given offset, return the subcluster number within its cluster
(i.e. with 32 subclusters per cluster it returns a number between 0
and 31).

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/block/qcow2.h b/block/qcow2.h
index 941330cfc9..523bc489a5 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -566,6 +566,11 @@ static inline int offset_to_l2_slice_index(BDRVQcow2State *s, int64_t offset)
     return (offset >> s->cluster_bits) & (s->l2_slice_size - 1);
 }
 
+static inline int offset_to_sc_index(BDRVQcow2State *s, int64_t offset)
+{
+    return (offset >> s->subcluster_bits) & (s->subclusters_per_cluster - 1);
+}
+
 static inline int64_t qcow2_vm_state_offset(BDRVQcow2State *s)
 {
     return (int64_t)s->l1_vm_state_index << (s->cluster_bits + s->l2_bits);
-- 
2.20.1


