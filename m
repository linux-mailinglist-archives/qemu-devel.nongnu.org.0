Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE031F6E2B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 21:48:22 +0200 (CEST)
Received: from localhost ([::1]:51534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjTBV-0001Wp-Hc
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 15:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT8L-0007Gx-1F
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:45:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40749
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT8J-0000nE-4b
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:45:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591904702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UT6Y/EMhcVfat9Z0INd94k9cWEH2ylW9qZ3/PBUOBs0=;
 b=RVqeGfy25Gr/GuvmVXkOkk3td0xu/lrFdAP5R0FOusWgaaLj60oFJFqnQiMm5rWn0ztjLF
 5s895w89Nw+Cg4r/bP2UAq9KaHGcErfebz3Yq/IfbVH4SiK4/uA5iyNzwRkpaVBYlmYUCk
 2ZyybqXE9ux0HMl7hphhaT+dKjoTD8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-TNSKf_RrPmeHai9cqNh2dA-1; Thu, 11 Jun 2020 15:45:00 -0400
X-MC-Unique: TNSKf_RrPmeHai9cqNh2dA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23C0D107ACCA
 for <qemu-devel@nongnu.org>; Thu, 11 Jun 2020 19:44:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A96F860CC0;
 Thu, 11 Jun 2020 19:44:56 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 010/115] numa: prevent usage of -M memory-backend and -numa
 memdev at the same time
Date: Thu, 11 Jun 2020 15:43:04 -0400
Message-Id: <20200611194449.31468-11-pbonzini@redhat.com>
In-Reply-To: <20200611194449.31468-1-pbonzini@redhat.com>
References: <20200611194449.31468-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 08:37:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Options -M memory-backend and -numa memdev are mutually exclusive,
and if used together, it might lead to a crash in the worst case.
For example when the same backend is used with these options together:
  -m 4G \
  -object memory-backend-ram,id=mem0,size=4G \
  -M pc,memory-backend=mem0 \
  -numa node,memdev=mem0
QEMU will abort with:
   exec.c:2006: qemu_ram_set_idstr: Assertion `!new_block->idstr[0]' failed.

and following backtrace:
    abort ()
    qemu_ram_set_idstr ()
    vmstate_register_ram ()
    vmstate_register_ram_global ()
    machine_consume_memdev ()
    numa_init_memdev_container ()
    numa_complete_configuration ()
    machine_run_board_init ()

add a check to error out in case the user tries to use both options at
the same time.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20200511141103.43768-3-imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/numa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 316bc50d75..5f81900f88 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -757,6 +757,11 @@ void numa_complete_configuration(MachineState *ms)
         }
 
         if (!numa_uses_legacy_mem() && mc->default_ram_id) {
+            if (ms->ram_memdev_id) {
+                error_report("'-machine memory-backend' and '-numa memdev'"
+                             " properties are mutually exclusive");
+                exit(1);
+            }
             ms->ram = g_new(MemoryRegion, 1);
             memory_region_init(ms->ram, OBJECT(ms), mc->default_ram_id,
                                ram_size);
-- 
2.26.2



