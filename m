Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42909213D22
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 18:00:20 +0200 (CEST)
Received: from localhost ([::1]:44162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrO6t-0004qy-7S
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 12:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jrO5O-0002U9-Jf; Fri, 03 Jul 2020 11:58:46 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:41479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jrO5K-0007Q9-Ht; Fri, 03 Jul 2020 11:58:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=FLnW2yKPd876mhIBSmNOIZZESH7oUMAItbps7FGNKa4=; 
 b=rC4ldcGdwA/FNIPQReDsc2Q9Hwcn/u0Ij7wPTT8xS1X4tSMX6RcVIuSrT+R3bVvYBBkuTejlb/doDdNDEH0X1nyShfHFB52S1YaYNq3nzzRlJGLeYge64ALgacJH6SsrQqOjvWczN82E+eEXqHMC6TsR8xq8VCsD8THXNa1E3WP3dLu+piSW8myiQkYNREpKjiR1hbpQjZ5jdGfKFW18Kj7vGkxRRgFl3x9oYANhImx52KDUuaXn/lFtU8fGWqC1vEoLe9lBRNTB6VuCBF2U6hBEoINS9h5+5gedDH8d+mJctGug4+BIFHt37cl9+TA0fHAhzn89/PxKbYSFUIdrZg==;
Received: from [81.0.49.0] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jrO5G-0001QH-Dv; Fri, 03 Jul 2020 17:58:38 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jrO51-0007PW-P1; Fri, 03 Jul 2020 17:58:23 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 08/34] qcow2: Add dummy has_subclusters() function
Date: Fri,  3 Jul 2020 17:57:54 +0200
Message-Id: <2b565be71b51861555f7593d736c42c557671af9.1593791819.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1593791819.git.berto@igalia.com>
References: <cover.1593791819.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 11:21:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Derek Su <dereksu@qnap.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function will be used by the qcow2 code to check if an image has
subclusters or not.

At the moment this simply returns false. Once all patches needed for
subcluster support are ready then QEMU will be able to create and
read images with subclusters and this function will return the actual
value.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block/qcow2.h b/block/qcow2.h
index eecbadc4cb..2064dd3d85 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -510,6 +510,12 @@ typedef enum QCow2MetadataOverlap {
 
 #define INV_OFFSET (-1ULL)
 
+static inline bool has_subclusters(BDRVQcow2State *s)
+{
+    /* FIXME: Return false until this feature is complete */
+    return false;
+}
+
 static inline uint64_t get_l2_entry(BDRVQcow2State *s, uint64_t *l2_slice,
                                     int idx)
 {
-- 
2.20.1


