Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7288F6F083C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:27:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3VX-0004Ff-7n; Thu, 27 Apr 2023 11:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3VK-0003oe-Cj
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:25:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3VH-0000ck-6S
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682609125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hr2oW3xiLx9AVMNY4v1XO33oNMRQgQz7qAfx2FKzjXw=;
 b=EhlEV2CJ1bmHKg8Cyn1KEBSx2zaWLhDnOu0UqXDrohpwafQUcUmcB6wNNpSeu00oodqiaf
 Qs9WReo8xHtl8H9WP38MTHnpCWb69AR41OCY+RvTLqLALOBkQ322fIzQ4tUioi5FhG/exU
 v7yg2A08umB1xRGcfQU10loDtsxNaJ0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-ytLdEjv6OBOWTc8NAer0iA-1; Thu, 27 Apr 2023 11:25:15 -0400
X-MC-Unique: ytLdEjv6OBOWTc8NAer0iA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D6A629DD992;
 Thu, 27 Apr 2023 15:23:27 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DB2A40C2064;
 Thu, 27 Apr 2023 15:23:22 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, John Snow <jsnow@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 16/18] stat64: Add stat64_set() operation
Date: Thu, 27 Apr 2023 17:22:32 +0200
Message-Id: <20230427152234.25400-17-quintela@redhat.com>
In-Reply-To: <20230427152234.25400-1-quintela@redhat.com>
References: <20230427152234.25400-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/qemu/stats64.h |  6 ++++++
 util/stats64.c         | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/qemu/stats64.h b/include/qemu/stats64.h
index 802402254b..99b5cb724a 100644
--- a/include/qemu/stats64.h
+++ b/include/qemu/stats64.h
@@ -40,6 +40,11 @@ static inline uint64_t stat64_get(const Stat64 *s)
     return qatomic_read__nocheck(&s->value);
 }
 
+static inline void stat64_set(Stat64 *s, uint64_t value)
+{
+    qatomic_set__nocheck(&s->value, value);
+}
+
 static inline void stat64_add(Stat64 *s, uint64_t value)
 {
     qatomic_add(&s->value, value);
@@ -62,6 +67,7 @@ static inline void stat64_max(Stat64 *s, uint64_t value)
 }
 #else
 uint64_t stat64_get(const Stat64 *s);
+void stat64_set(Stat64 *s, uint64_t value);
 bool stat64_min_slow(Stat64 *s, uint64_t value);
 bool stat64_max_slow(Stat64 *s, uint64_t value);
 bool stat64_add32_carry(Stat64 *s, uint32_t low, uint32_t high);
diff --git a/util/stats64.c b/util/stats64.c
index 897613c949..09736014ec 100644
--- a/util/stats64.c
+++ b/util/stats64.c
@@ -57,6 +57,17 @@ uint64_t stat64_get(const Stat64 *s)
     return ((uint64_t)high << 32) | low;
 }
 
+void stat64_set(Stat64 *s, uint64_t val)
+{
+    while (!stat64_wrtrylock(s)) {
+        cpu_relax();
+    }
+
+    qatomic_set(&s->high, val >> 32);
+    qatomic_set(&s->low, val);
+    stat64_wrunlock(s);
+}
+
 bool stat64_add32_carry(Stat64 *s, uint32_t low, uint32_t high)
 {
     uint32_t old;
-- 
2.40.0


