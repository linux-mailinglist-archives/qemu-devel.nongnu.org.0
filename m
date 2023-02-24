Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4789B6A1E69
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:22:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZsV-00054A-OL; Fri, 24 Feb 2023 10:20:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVZsS-00052X-1S
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:20:52 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVZsI-0003yW-Ug
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:20:44 -0500
Received: by mail-wr1-x430.google.com with SMTP id bt28so7614539wrb.8
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 07:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i4p/OO7m8PEwCQexXoELK2yEsmpqGT0HT9etJY9dehs=;
 b=LzYbcm92LTkYcM6R+3UEahG8ym9H86dWlrhUe6HEkSyqo6C2BeYloBIP+mPensGFks
 /J9FmCmEOKZA1YZQdX6HvUKsi4A7VKuKFemAxHnPvLleXBzPbCa4senMqihRvDWaQQDE
 vyhHawjHATVvluwTLY+efs6svuSzfsZl8KOWOv392KNW9kkha7zP6TRlCmcKpEis6cI7
 9IaNMcef0N5xJ6WFhkjFl+wI9V38JBEkP7OdCrvkA4AVKPnCsOnqpjvO2h2zQzBya18u
 Udau5+eBngq95FmjP6YWDkgATmTDFQpxV1coDigWI6zOMx16UN+Tpdp49Uhph/JCdFQq
 h55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i4p/OO7m8PEwCQexXoELK2yEsmpqGT0HT9etJY9dehs=;
 b=gqUy/sH/AksJOhnSMG5LuCpK5a8KcYmD7O2Az34PR7dCGBqK2H1J5o3VwSJpzMoLu6
 Set7Cj/hR4m5XGG7WnMNjLQ/XlJCg1hgGuUPKu52fdIs4qzkQYoVUhDmPYu2SlNca5nO
 kOMdI3GqVqfiXdPU07XRLWPpiLQsd2BDb6P1BpluxBDshqTpyHmQnOL3pC7FN3w27qdj
 gb5VNX6hJp8Pf8YHvp0xcY5UVZkV1zufOLaVBEgcNfcCdwi+nSiWq0ZfEecorZ+NrmFA
 zRZotQzI1ihygHvlD9Yz1LDra6B+WhAPcR34Ku7AP/r6qFBCHPDwMq8CMHSLN91e+2ig
 ujzA==
X-Gm-Message-State: AO0yUKX90H4KFG/UgD5q6GkBdQo7qm5L0T+ZDXORVzgO/8PCQ2BK9Hi+
 8emnx9J/A4hJC8U0JGgOTriQPbj2XZ33B+/Y
X-Google-Smtp-Source: AK7set+sQcuwg3jBQbWW04o4pAQPK8tKus3CsTJxDidK+rS/aKZ/6bkKK74Tdum8be/DjkBoh2bs9A==
X-Received: by 2002:adf:e9c7:0:b0:2c5:7c26:c2cc with SMTP id
 l7-20020adfe9c7000000b002c57c26c2ccmr13828952wrn.29.1677252032159; 
 Fri, 24 Feb 2023 07:20:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a5d5709000000b002be099f78c0sm13755254wrv.69.2023.02.24.07.20.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Feb 2023 07:20:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/2] block/qcow2: QAPI'fy Qcow2DiscardType
Date: Fri, 24 Feb 2023 16:20:19 +0100
Message-Id: <20230224152019.19278-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230224152019.19278-1-philmd@linaro.org>
References: <20230224152019.19278-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Let QAPI maintain the Qcow2DiscardType enum values.

Mechanical renaming to Qcow2DiscardType doing:

  $ sed -i -e 's/enum qcow2_discard_type/Qcow2DiscardType/g' \
        $(git grep -l qcow2_discard_type)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 block/qcow2-cluster.c  |  4 ++--
 block/qcow2-refcount.c | 10 +++++-----
 block/qcow2.h          | 17 ++++-------------
 qapi/block-core.json   | 10 ++++++++++
 4 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index a525afc7c3..8e25eec98a 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1898,7 +1898,7 @@ again:
  */
 static int discard_in_l2_slice(BlockDriverState *bs, uint64_t offset,
                                uint64_t nb_clusters,
-                               enum qcow2_discard_type type, bool full_discard)
+                               Qcow2DiscardType type, bool full_discard)
 {
     BDRVQcow2State *s = bs->opaque;
     uint64_t *l2_slice;
@@ -1967,7 +1967,7 @@ static int discard_in_l2_slice(BlockDriverState *bs, uint64_t offset,
 }
 
 int qcow2_cluster_discard(BlockDriverState *bs, uint64_t offset,
-                          uint64_t bytes, enum qcow2_discard_type type,
+                          uint64_t bytes, Qcow2DiscardType type,
                           bool full_discard)
 {
     BDRVQcow2State *s = bs->opaque;
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 94f7bf9a57..cb72c7e213 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -38,7 +38,7 @@ static int64_t alloc_clusters_noref(BlockDriverState *bs, uint64_t size,
 G_GNUC_WARN_UNUSED_RESULT
 static int update_refcount(BlockDriverState *bs,
                            int64_t offset, int64_t length, uint64_t addend,
-                           bool decrease, enum qcow2_discard_type type);
+                           bool decrease, Qcow2DiscardType type);
 
 static uint64_t get_refcount_ro0(const void *refcount_array, uint64_t index);
 static uint64_t get_refcount_ro1(const void *refcount_array, uint64_t index);
@@ -811,7 +811,7 @@ static int update_refcount(BlockDriverState *bs,
                            int64_t length,
                            uint64_t addend,
                            bool decrease,
-                           enum qcow2_discard_type type)
+                           Qcow2DiscardType type)
 {
     BDRVQcow2State *s = bs->opaque;
     int64_t start, last, cluster_offset;
@@ -945,7 +945,7 @@ fail:
 int qcow2_update_cluster_refcount(BlockDriverState *bs,
                                   int64_t cluster_index,
                                   uint64_t addend, bool decrease,
-                                  enum qcow2_discard_type type)
+                                  Qcow2DiscardType type)
 {
     BDRVQcow2State *s = bs->opaque;
     int ret;
@@ -1145,7 +1145,7 @@ int64_t qcow2_alloc_bytes(BlockDriverState *bs, int size)
 
 void qcow2_free_clusters(BlockDriverState *bs,
                           int64_t offset, int64_t size,
-                          enum qcow2_discard_type type)
+                          Qcow2DiscardType type)
 {
     int ret;
 
@@ -1162,7 +1162,7 @@ void qcow2_free_clusters(BlockDriverState *bs,
  * normal cluster, compressed cluster, etc.)
  */
 void qcow2_free_any_cluster(BlockDriverState *bs, uint64_t l2_entry,
-                            enum qcow2_discard_type type)
+                            Qcow2DiscardType type)
 {
     BDRVQcow2State *s = bs->opaque;
     QCow2ClusterType ctype = qcow2_get_cluster_type(bs, l2_entry);
diff --git a/block/qcow2.h b/block/qcow2.h
index d6ce7fce32..280485ed12 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -287,15 +287,6 @@ enum {
                                         | QCOW2_AUTOCLEAR_DATA_FILE_RAW,
 };
 
-enum qcow2_discard_type {
-    QCOW2_DISCARD_TYPE_NEVER = 0,
-    QCOW2_DISCARD_TYPE_ALWAYS,
-    QCOW2_DISCARD_TYPE_REQUEST,
-    QCOW2_DISCARD_TYPE_SNAPSHOT,
-    QCOW2_DISCARD_TYPE_OTHER,
-    QCOW2_DISCARD_TYPE__MAX
-};
-
 typedef struct Qcow2Feature {
     uint8_t type;
     uint8_t bit;
@@ -854,7 +845,7 @@ int qcow2_get_refcount(BlockDriverState *bs, int64_t cluster_index,
 
 int qcow2_update_cluster_refcount(BlockDriverState *bs, int64_t cluster_index,
                                   uint64_t addend, bool decrease,
-                                  enum qcow2_discard_type type);
+                                  Qcow2DiscardType type);
 
 int64_t qcow2_refcount_area(BlockDriverState *bs, uint64_t offset,
                             uint64_t additional_clusters, bool exact_size,
@@ -867,9 +858,9 @@ int64_t qcow2_alloc_clusters_at(BlockDriverState *bs, uint64_t offset,
 int64_t qcow2_alloc_bytes(BlockDriverState *bs, int size);
 void qcow2_free_clusters(BlockDriverState *bs,
                           int64_t offset, int64_t size,
-                          enum qcow2_discard_type type);
+                          Qcow2DiscardType type);
 void qcow2_free_any_cluster(BlockDriverState *bs, uint64_t l2_entry,
-                            enum qcow2_discard_type type);
+                            Qcow2DiscardType type);
 
 int qcow2_update_snapshot_refcount(BlockDriverState *bs,
     int64_t l1_table_offset, int l1_size, int addend);
@@ -922,7 +913,7 @@ int coroutine_fn qcow2_alloc_cluster_link_l2(BlockDriverState *bs,
                                              QCowL2Meta *m);
 void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m);
 int qcow2_cluster_discard(BlockDriverState *bs, uint64_t offset,
-                          uint64_t bytes, enum qcow2_discard_type type,
+                          uint64_t bytes, Qcow2DiscardType type,
                           bool full_discard);
 int coroutine_fn qcow2_subcluster_zeroize(BlockDriverState *bs, uint64_t offset,
                                           uint64_t bytes, int flags);
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 7f331eb8ea..8d80e989b5 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4811,6 +4811,16 @@
 { 'enum': 'Qcow2CompressionType',
   'data': [ 'zlib', { 'name': 'zstd', 'if': 'CONFIG_ZSTD' } ] }
 
+##
+# @Qcow2DiscardType:
+#
+# Determines type of discard request
+#
+# Since: 8.0
+##
+{ 'enum': 'Qcow2DiscardType',
+  'data': [ 'never', 'always', 'request', 'snapshot', 'other' ] }
+
 ##
 # @BlockdevCreateOptionsQcow2:
 #
-- 
2.38.1


