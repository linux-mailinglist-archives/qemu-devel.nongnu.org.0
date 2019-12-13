Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A9411E541
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Dec 2019 15:10:17 +0100 (CET)
Received: from localhost ([::1]:49672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifle3-00032T-V5
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 09:10:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42831)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iflcU-0001aU-DI
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 09:08:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iflcT-0002sT-9N
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 09:08:38 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46989)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iflcT-0002pv-0n
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 09:08:37 -0500
Received: by mail-wr1-x443.google.com with SMTP id z7so6736610wrl.13
 for <qemu-devel@nongnu.org>; Fri, 13 Dec 2019 06:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=iSvd7kR69HHZhRhQRzsPwBtBWFePaMT2xa1YRgm+R84=;
 b=LbwispCsQp5nFasH0RNzM0G4RWFwcQCHS7fQ9DaXqsfN6D1vs99tXra/ozFXEu3TsN
 e5JkInjRKYqfh/Ffk2tnKrlXgH/N4umbO3u7IaOLzIlmuzyyd7e6D/YpkYyaAl8+lbtr
 3doSM4vKimPbI7bT/3SZKJGeYWNnv7qaWwGAA2OKodhY1UHj/4Q/ULGIYXzbrfN4di3S
 PDVmEaFlig1bvhbXaMcqwICHzqZ27/ugVIfZQJLfDqPU2WuxpO3XvyfEQrZ1bhHcKy8K
 7LckHpEdr2lz0slIFAgl2XhxMb1TzeIhk3dRUtFfnSyZ4iwnrm6yT5FQWNIQTgnrIQDD
 wjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=iSvd7kR69HHZhRhQRzsPwBtBWFePaMT2xa1YRgm+R84=;
 b=dX1UdVVULfFQLZxigLHFtvGE7A4uRgU4pFXtjrdbyLSzhSYwlrylBTnYvXLx71wR3h
 G2LA0xnv58FLM7X01Z/wbJAvdgduom5o3oFctibMVU9yXnqp48tdPEYfFpSYfLWHXZlM
 40eoVPDRaFH8jD/k3PhdReX2+/pn2dM60Z6G31QZq18EbPhfr4A78Tyfq8XUUHPi25Z2
 cf6HKou6NemhpOJ5bYi7XDN0Eb5OK8VqqRHqdN5VS6YG4rtxiCIYNQt/+vyF9xzoY82x
 SSZRU8YyOySMb5DdUS5AQi28NtwPG3ECXqAwFV9PV+Xxm7Lh+ZyM4asffTJou1ectP0U
 NRhQ==
X-Gm-Message-State: APjAAAV4t7Es7QASiSt5KsbERhyTLO7OS3NyhRtATUCRgwA3EQBPxssf
 nISlkUkdnPtz9b7Az7Adr7umVDaq
X-Google-Smtp-Source: APXvYqyUMB172N78c7z8TQh3qlx1OlG72JTyCbbld6hf82ZwzARG0KngjIkdKxsQNoCMJvhC6WwKyQ==
X-Received: by 2002:a5d:4805:: with SMTP id l5mr12677481wrq.3.1576246115435;
 Fri, 13 Dec 2019 06:08:35 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id i8sm10268193wro.47.2019.12.13.06.08.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Dec 2019 06:08:34 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] colo: fix return without releasing RCU
Date: Fri, 13 Dec 2019 15:08:32 +0100
Message-Id: <1576246112-23406-2-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use WITH_RCU_READ_LOCK_GUARD to avoid exiting colo_init_ram_cache
without releasing RCU.

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 migration/ram.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 7dd7f81..8d7c015 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3891,26 +3891,27 @@ int colo_init_ram_cache(void)
 {
     RAMBlock *block;
 
-    rcu_read_lock();
-    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-        block->colo_cache = qemu_anon_ram_alloc(block->used_length,
-                                                NULL,
-                                                false);
-        if (!block->colo_cache) {
-            error_report("%s: Can't alloc memory for COLO cache of block %s,"
-                         "size 0x" RAM_ADDR_FMT, __func__, block->idstr,
-                         block->used_length);
-            RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-                if (block->colo_cache) {
-                    qemu_anon_ram_free(block->colo_cache, block->used_length);
-                    block->colo_cache = NULL;
+    WITH_RCU_READ_LOCK_GUARD() {
+        RAMBLOCK_FOREACH_NOT_IGNORED(block) {
+            block->colo_cache = qemu_anon_ram_alloc(block->used_length,
+                                                    NULL,
+                                                    false);
+            if (!block->colo_cache) {
+                error_report("%s: Can't alloc memory for COLO cache of block %s,"
+                             "size 0x" RAM_ADDR_FMT, __func__, block->idstr,
+                             block->used_length);
+                RAMBLOCK_FOREACH_NOT_IGNORED(block) {
+                    if (block->colo_cache) {
+                        qemu_anon_ram_free(block->colo_cache, block->used_length);
+                        block->colo_cache = NULL;
+                    }
                 }
+                return -errno;
             }
-            return -errno;
+            memcpy(block->colo_cache, block->host, block->used_length);
         }
-        memcpy(block->colo_cache, block->host, block->used_length);
     }
-    rcu_read_unlock();
+
     /*
     * Record the dirty pages that sent by PVM, we use this dirty bitmap together
     * with to decide which page in cache should be flushed into SVM's RAM. Here
-- 
1.8.3.1


