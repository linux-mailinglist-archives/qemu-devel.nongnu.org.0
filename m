Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE3A50A1E2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:13:47 +0200 (CEST)
Received: from localhost ([::1]:46232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXZ4-0005Hi-T4
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXEn-0007Su-BT
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:52:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXEl-0006TQ-NL
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p1TtJ3WkmbG6S6v17d2qM4obFqkei7UhVT5UKCJaTN0=;
 b=b88TbsJInYgjDmGeBrK9xfG/dvFsAUQdKJFiIzCGCnkUMZDjCiSByuuDswniXYOC0CFqgI
 atGzLvqI/mwVzfGjjy3YHzYD24XAGQaSbBlgLX02MwyTRdayLqU7rqZHVSaEdT2AZx9Y3v
 5e5nAYR9oN1RPNo/N80PLhAEh/jHW08=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-eQY50SLzNCeaNS5gNe6HWQ-1; Thu, 21 Apr 2022 09:52:44 -0400
X-MC-Unique: eQY50SLzNCeaNS5gNe6HWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CFED86B8A1;
 Thu, 21 Apr 2022 13:52:43 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2F84404728A;
 Thu, 21 Apr 2022 13:52:42 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 29/30] tests/fuzz: fix warning
Date: Thu, 21 Apr 2022 17:49:39 +0400
Message-Id: <20220421134940.2887768-30-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, richard.henderson@linaro.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

../tests/qtest/fuzz/generic_fuzz.c:746:17: warning: variable 'name' set but not used [-Wunused-but-set-variable]

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220420132624.2439741-42-marcandre.lureau@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index dd7e25851cb6..bce83604825e 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -743,14 +743,12 @@ static void usage(void)
 
 static int locate_fuzz_memory_regions(Object *child, void *opaque)
 {
-    const char *name;
     MemoryRegion *mr;
     if (object_dynamic_cast(child, TYPE_MEMORY_REGION)) {
         mr = MEMORY_REGION(child);
         if ((memory_region_is_ram(mr) ||
             memory_region_is_ram_device(mr) ||
             memory_region_is_rom(mr)) == false) {
-            name = object_get_canonical_path_component(child);
             /*
              * We don't want duplicate pointers to the same MemoryRegion, so
              * try to remove copies of the pointer, before adding it.
-- 
2.36.0


