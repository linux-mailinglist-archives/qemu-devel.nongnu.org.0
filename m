Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5983B86FF
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:23:49 +0200 (CEST)
Received: from localhost ([::1]:37964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyd08-0007e9-9x
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycg1-00031d-9K
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfa-00076d-Dn
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625068953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s5t17Z+QuCnaYytft9xZU/rY0g8YyrHZdTZNQW0vfhA=;
 b=KmchKM4kyAa3eWl00Q0STT/JMwG0wrxcI3zrc+d5IRmeUxNnJfS9dn4sw6w2KQODpohBzl
 Q0PfG/pCifpeYhUzZdJ1QlAZ0vUH6fnPFc/urGyFP3tO+C5AEvmb0Jg9oJD7RLbhwvgzTU
 hzS9l27/ThYfZUyZKa+yvbDafnQ3Ka0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-WAT4gDeeP6WsbzyZmBpLbA-1; Wed, 30 Jun 2021 12:02:31 -0400
X-MC-Unique: WAT4gDeeP6WsbzyZmBpLbA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D812100C663;
 Wed, 30 Jun 2021 16:02:30 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 288EC604CD;
 Wed, 30 Jun 2021 16:02:29 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 15/24] introduce QEMU_AUTO_VFREE
Date: Wed, 30 Jun 2021 18:01:57 +0200
Message-Id: <20210630160206.276439-16-kwolf@redhat.com>
In-Reply-To: <20210630160206.276439-1-kwolf@redhat.com>
References: <20210630160206.276439-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Introduce a convenient macro, that works for qemu_memalign() like
g_autofree works with g_malloc.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210628121133.193984-2-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/osdep.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index c3656b755a..c91a78b5e6 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -386,6 +386,21 @@ void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared,
 void qemu_vfree(void *ptr);
 void qemu_anon_ram_free(void *ptr, size_t size);
 
+/*
+ * It's an analog of GLIB's g_autoptr_cleanup_generic_gfree(), used to define
+ * g_autofree macro.
+ */
+static inline void qemu_cleanup_generic_vfree(void *p)
+{
+  void **pp = (void **)p;
+  qemu_vfree(*pp);
+}
+
+/*
+ * Analog of g_autofree, but qemu_vfree is called on cleanup instead of g_free.
+ */
+#define QEMU_AUTO_VFREE __attribute__((cleanup(qemu_cleanup_generic_vfree)))
+
 /*
  * Abstraction of PROT_ and MAP_ flags as passed to mmap(), for example,
  * consumed by qemu_ram_mmap().
-- 
2.31.1


