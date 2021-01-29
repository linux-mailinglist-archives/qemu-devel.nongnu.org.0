Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 485A0308892
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:51:37 +0100 (CET)
Received: from localhost ([::1]:46448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SJM-0002I9-CK
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnF-0004Js-0b
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:29 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:39504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnD-0005vJ-Gy
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:24 -0500
Received: by mail-ej1-x631.google.com with SMTP id g3so12439008ejb.6
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZmniK0yzO+id8G0haBxNriDaxYyBXhcth1WQMA0kwrs=;
 b=L70IC3itBdeg78iCfVEyKOk+9naGCK93NGFai9AZSqCVxGR8JZjgWf3CeIZYgAvQWB
 adjsI+TRZ1HE0Hq0P2XugKrJAnyvJmnLxvHKW9fzfLOymg4OnwYX60nuv7EqeA7F2xSD
 in3VL1z391qpXxN8GJbImHYKVPBw92QJC3kMrxPa/D+7VyKAJX2j7DR7FKUGhVwIKq1/
 hBuxkDEXBXLeDb2CQRw45XxXmFWl+o48zXt6tj7Cex4SVUZWZougNCR/th9CymAfYR/M
 5+OsTZm50qAt74E8Zoe3/EcSg0g0bh9Vw4DOIHeuKPoOb4wGveWTatkY35ybDqsc+iJe
 Jbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZmniK0yzO+id8G0haBxNriDaxYyBXhcth1WQMA0kwrs=;
 b=BljtyLkGgJU5lNCyY+jAEnNA8t5RhXdJkpCL+4X3x7uJul1YnnFmEWVWsi8RlpN5FK
 P9tZeUs6ch9w5gRICZEE43PNriHT5eKqsu5tr7pc1V0slQb29Z5P/RRtKYUAvtgNysMn
 mfjvJ2x1TauY1nQczr09MmCKZPW92hKRoU8xYcPhs0chhDqwJuvfXyAZmKpPpDEBQxvE
 vcEbdXR1hUU2uHZb6rG+LRWyCZnE6fyR2oT0fflETiMhyIgtdxUK+8YjwHaLId1GKLiX
 n6N6fRL0JxWrCynrt8edL77AehhZDppHFb/yLqtOqCGshbZqPDMC89WGIsGYNKvv07RL
 b/aQ==
X-Gm-Message-State: AOAM531oDrOS8wY5aUZoQ0WoTqRc0Y/AiqPwh5qhlqARUerTJu+su0tA
 BuwjSz12H5r/T9kNFLgy4XWPcmS6iIOm6w==
X-Google-Smtp-Source: ABdhPJzzizVAUb6H3Cup2ZAyMdokXccQKAbWqw/EQGkNV4eSb+8y0ISRBb8GheUAMlHJrnA/iacf+Q==
X-Received: by 2002:a17:906:d8c3:: with SMTP id
 re3mr4135785ejb.80.1611919102256; 
 Fri, 29 Jan 2021 03:18:22 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:21 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/36] fuzz: add virtio-9p configurations for fuzzing
Date: Fri, 29 Jan 2021 12:17:45 +0100
Message-Id: <20210129111814.566629-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

virtio-9p devices are often used to expose a virtual-filesystem to the
guest. There have been some bugs reported in this device, such as
CVE-2018-19364, and CVE-2021-20181. We should fuzz this device

This patch adds two virtio-9p configurations:
 * One with the widely used -fsdev local driver. This driver leaks some
   state in the form of files/directories created in the shared dir.
 * One with the synth driver. While it is not used in the real world, this
   driver won't leak leak state between fuzz inputs.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20210117230924.449676-4-alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 51e69c6e42..5d599765c4 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -19,6 +19,16 @@ typedef struct generic_fuzz_config {
     gchar* (*argfunc)(void); /* Result must be freeable by g_free() */
 } generic_fuzz_config;
 
+static inline gchar *generic_fuzzer_virtio_9p_args(void){
+    char tmpdir[] = "/tmp/qemu-fuzz.XXXXXX";
+    g_assert_nonnull(mkdtemp(tmpdir));
+
+    return g_strdup_printf("-machine q35 -nodefaults "
+    "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
+    "-fsdev local,id=hshare,path=%s,security_model=mapped-xattr,"
+    "writeout=immediate,fmode=0600,dmode=0700", tmpdir);
+}
+
 const generic_fuzz_config predefined_configs[] = {
     {
         .name = "virtio-net-pci-slirp",
@@ -60,6 +70,16 @@ const generic_fuzz_config predefined_configs[] = {
         .name = "virtio-mouse",
         .args = "-machine q35 -nodefaults -device virtio-mouse",
         .objects = "virtio*",
+    },{
+        .name = "virtio-9p",
+        .argfunc = generic_fuzzer_virtio_9p_args,
+        .objects = "virtio*",
+    },{
+        .name = "virtio-9p-synth",
+        .args = "-machine q35 -nodefaults "
+        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
+        "-fsdev synth,id=hshare",
+        .objects = "virtio*",
     },{
         .name = "e1000",
         .args = "-M q35 -nodefaults "
-- 
2.29.2



