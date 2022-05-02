Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A7C517010
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 15:12:52 +0200 (CEST)
Received: from localhost ([::1]:45118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlVr8-0004YQ-NY
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 09:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nlVpt-0003bv-5w
 for qemu-devel@nongnu.org; Mon, 02 May 2022 09:11:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nlVpm-0006AT-8n
 for qemu-devel@nongnu.org; Mon, 02 May 2022 09:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651497082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gKGXPT2uWRJBVN7OC2ACtwJmrOOwXGb0C3LHIPaVD30=;
 b=DiBKU8L1/zjBgyEGJckhuW0QWjczLUYo2XdRpksdC1c2J9iprqtMLlkU0RBsykOxEAjQ6n
 nH9U98OIxtBW44BOv+DJMlxGSPq7OqyA4t48lX1wKCc/4V0TDk4voyn50HK0sBmN0+GLQK
 VmnJAKeB52p4QyajIHyMrkIOSrrVvQM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-oIxj8sj9PN-q8I1FnSMLPA-1; Mon, 02 May 2022 09:11:21 -0400
X-MC-Unique: oIxj8sj9PN-q8I1FnSMLPA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0123F86B8B2
 for <qemu-devel@nongnu.org>; Mon,  2 May 2022 13:11:21 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B840463BAE;
 Mon,  2 May 2022 13:11:20 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Meson: Make mremap() detecting works correctly
Date: Mon,  2 May 2022 15:11:19 +0200
Message-Id: <20220502131119.2345-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without this (at least in Fedora 35) it don't detect mremap()
correctly.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 1fe7d257ff..f96da78741 100644
--- a/meson.build
+++ b/meson.build
@@ -2041,7 +2041,8 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
 
 have_pvrdma = get_option('pvrdma') \
   .require(rdma.found(), error_message: 'PVRDMA requires OpenFabrics libraries') \
-  .require(cc.compiles('''
+  .require(cc.compiles(gnu_source_prefix + '''
+    #include <sys/mman.h>
     int main(void)
     {
       char buf = 0;
-- 
2.35.1


