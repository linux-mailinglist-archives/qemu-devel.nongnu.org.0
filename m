Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D911C5F0E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 19:41:36 +0200 (CEST)
Received: from localhost ([::1]:38908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jW1ZX-0000Jp-6x
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 13:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jW1XL-0006G3-HJ; Tue, 05 May 2020 13:39:19 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:38882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jW1XJ-00089l-7W; Tue, 05 May 2020 13:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=feJ5CefdIcoTetCGy9SxYuJA2zat3t1QrUrRsjHIdhY=; 
 b=ZvFzBl/PEdsaNfANTIuZI6tc6LkkJPb+znxnopP+vfGmOt70a3t6WJviI03ODdbt9bgi7w7v86b5nFvSBhFK9L13VmXzMXEQ7EgqqPHzRWCdab8Etecm25D8DTCy5VgOGBXKkZfcxUJpSv1uDVWMDJqcxY3n2CJUe49vj2dMkOaysk+Uc2HeDswvKKykE+sLLgxxV5BJfVhHTASjStZ1PqqjmHrR3zgC7ow0b9AYLegCS39jWtG9rJADIVk2UjAM/pY/HcB955Ml/pBZvfwKu0WMvDih062ZDPoU45E6GzzLEZjG/FX4KpflSZvJglxHED5x1MqH1EhVU1Jsetzxeg==;
Received: from static.160.43.0.81.ibercom.com ([81.0.43.160]
 helo=perseus.local) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jW1Ws-00025C-D0; Tue, 05 May 2020 19:38:50 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jW1Wc-00043n-ML; Tue, 05 May 2020 19:38:34 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/31] qcow2: Add dummy has_subclusters() function
Date: Tue,  5 May 2020 19:38:08 +0200
Message-Id: <47c3829a10028930a36d471ca5b4b9fd342df470.1588699789.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1588699789.git.berto@igalia.com>
References: <cover.1588699789.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 13:38:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Max Reitz <mreitz@redhat.com>
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
index 97fbaba574..5e8036c3dd 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -492,6 +492,12 @@ typedef enum QCow2MetadataOverlap {
 
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


