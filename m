Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B95702CD2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 14:36:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXPO-0006Z0-0f; Mon, 15 May 2023 08:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXOq-0006S5-BP
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:34:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXOk-0003Kn-Qf
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:33:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684154033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RGR799pEPaaflMBwWin8y5gwV1MT3AgFnGKYFTkrW/8=;
 b=BXKSWsY8DghR2VQLPhLtlszZhdPU9CBpaJvJgFkGR2Pt/DSyMOpRIKuptlr0nLKS/HqR7n
 pJIEAwtVJLkJPU8O6Hg4mOU7chLmGbvOTYmr/Bpw8XYpRSw0S9g8w1b9+j7W6hMOh8ueIt
 Vwkgowa+3Dcgz61KacoyllvHcrMso/8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-ClrQVqfrMS-7MGU5zfBOkg-1; Mon, 15 May 2023 08:33:48 -0400
X-MC-Unique: ClrQVqfrMS-7MGU5zfBOkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36E7B3C0F372;
 Mon, 15 May 2023 12:33:48 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5364163F5F;
 Mon, 15 May 2023 12:33:46 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 05/11] migration: Teach dirtyrate about qemu_target_page_bits()
Date: Mon, 15 May 2023 14:33:28 +0200
Message-Id: <20230515123334.58995-6-quintela@redhat.com>
In-Reply-To: <20230515123334.58995-1-quintela@redhat.com>
References: <20230515123334.58995-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, TVD_SPACE_RATIO=0.001,
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230511141208.17779-5-quintela@redhat.com>
---
 migration/dirtyrate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 9383e91cd6..f32a690a56 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -401,7 +401,7 @@ static void get_ramblock_dirty_info(RAMBlock *block,
                                 sample_pages_per_gigabytes) >> 30;
     /* Right shift TARGET_PAGE_BITS to calc page count */
     info->ramblock_pages = qemu_ram_get_used_length(block) >>
-                           TARGET_PAGE_BITS;
+                           qemu_target_page_bits();
     info->ramblock_addr = qemu_ram_get_host_addr(block);
     strcpy(info->idstr, qemu_ram_get_idstr(block));
 }
@@ -512,7 +512,7 @@ find_block_matched(RAMBlock *block, int count,
 
     if (infos[i].ramblock_addr != qemu_ram_get_host_addr(block) ||
         infos[i].ramblock_pages !=
-            (qemu_ram_get_used_length(block) >> TARGET_PAGE_BITS)) {
+            (qemu_ram_get_used_length(block) >> qemu_target_page_bits())) {
         trace_find_page_matched(block->idstr);
         return NULL;
     }
-- 
2.40.1


