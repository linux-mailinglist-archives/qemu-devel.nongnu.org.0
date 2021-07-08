Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C22B3C1A30
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:54:39 +0200 (CEST)
Received: from localhost ([::1]:54846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1a6Y-0007Ss-GF
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWZ-0002W0-C2
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:27 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWX-0007Wl-8T
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:27 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so4311886wmi.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cMVwh6QFPhcW20oytqkL/ZaRLLYb/mCB+qE4FLLNhgM=;
 b=NpcCQtBbL7yvJQ/H3z+Q5LUT9xrifFKZ01sg5i6kxaEoBQCKOmUITZs6zLExiTvg2H
 pgOouVgUvoZurX7MFHYZVLNUVznLSR4nxeUySIqGhoPbgyDoFEgbauTiEr8fitP3vpcg
 dg32Je6/7gUJRLyvGmw/Im7U7i3c+KA6cOGUDDAYEsrdrDtXJdsSoPUu+PhHhP4wc38D
 ecn4UV+DzYlUEQlGXPAA2YyvpdprQ+Qz7otwBzKWMDpcc04/sWWRUnWKGtPVmPL3Kltw
 WdTFE2U1VDTBzC1aopGZvBaj6Xph5kHZQYzWso93jK14x1IMvv9rIQ+9qNoLv1R52hM3
 FeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cMVwh6QFPhcW20oytqkL/ZaRLLYb/mCB+qE4FLLNhgM=;
 b=W1vAZAlSg0Gy2QobMY4Dq+ovFwjX2GtEt2OcQNin4OFkk3plyVwP33pmZOf8hrqEwN
 mS1y3ZXkYkUIVhEg68/yfqrkL3gblOzGI1Yn+ZzQnU+aU3pYyz4sPVHjs6NQ9hVVHzDp
 ojU2gVQQ/jd5y9MS0oMOZCVkdxHGmePD67btEQZP0XckHUPfPAJ3Yon9k92ruXac0SSx
 DmesVp8Zn5kV3jPoacsmZVDlUOUNTGCwgobxEDX8EQcerp+SrSI0MHYKhmcGi6fwHwKI
 n7kbewz2sHmjuiiNYwndXweGduUGFOY0TWL0y4omh2Fn1XCx1rbht0ScNMR7nn4/VOIs
 1zFA==
X-Gm-Message-State: AOAM531y1DG7WcRM+oKgAzVhmkbtHNzQtdGjGu44hqsq1iS4eAL/k8ek
 GFP6wdnvvedkcf10WqkjG4Bmtw==
X-Google-Smtp-Source: ABdhPJxmOoa2DV/dnLyB4LHRhHpGWG9xw51IdirDUbEh4p190+ffMcJJoMplUpm/ZTl5UR1RnbDFZg==
X-Received: by 2002:a1c:1bc3:: with SMTP id b186mr7151954wmb.27.1625771843885; 
 Thu, 08 Jul 2021 12:17:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a6sm2450007wmj.29.2021.07.08.12.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:17:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 007721FFBE;
 Thu,  8 Jul 2021 20:09:46 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 38/39] docs/devel: Added cache plugin to the plugins docs
Date: Thu,  8 Jul 2021 20:09:40 +0100
Message-Id: <20210708190941.16980-39-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Message-Id: <20210628053808.17422-1-ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/tcg-plugins.rst | 59 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 179867e9c1..7e54f12837 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -344,3 +344,62 @@ which will output an execution trace following this structure::
   0, 0xd32, 0xf9893014, "adds r0, #0x14"
   0, 0xd34, 0xf9c8f000, "bl #0x10c8"
   0, 0x10c8, 0xfff96c43, "ldr r3, [r0, #0x44]", load, 0x200000e4, RAM
+
+- contrib/plugins/cache
+
+Cache modelling plugin that measures the performance of a given cache
+configuration when a given working set is run::
+
+    qemu-x86_64 -plugin ./contrib/plugins/libcache.so \
+      -d plugin -D cache.log ./tests/tcg/x86_64-linux-user/float_convs
+
+will report the following::
+
+    Data accesses: 996479, Misses: 507
+    Miss rate: 0.050879%
+
+    Instruction accesses: 2641737, Misses: 18617
+    Miss rate: 0.704726%
+
+    address, data misses, instruction
+    0x424f1e (_int_malloc), 109, movq %rax, 8(%rcx)
+    0x41f395 (_IO_default_xsputn), 49, movb %dl, (%rdi, %rax)
+    0x42584d (ptmalloc_init.part.0), 33, movaps %xmm0, (%rax)
+    0x454d48 (__tunables_init), 20, cmpb $0, (%r8)
+    ...
+
+    address, fetch misses, instruction
+    0x4160a0 (__vfprintf_internal), 744, movl $1, %ebx
+    0x41f0a0 (_IO_setb), 744, endbr64
+    0x415882 (__vfprintf_internal), 744, movq %r12, %rdi
+    0x4268a0 (__malloc), 696, andq $0xfffffffffffffff0, %rax
+    ...
+
+The plugin has a number of arguments, all of them are optional:
+
+  * arg="limit=N"
+
+  Print top N icache and dcache thrashing instructions along with their
+  address, number of misses, and its disassembly. (default: 32)
+
+  * arg="icachesize=N"
+  * arg="iblksize=B"
+  * arg="iassoc=A"
+
+  Instruction cache configuration arguments. They specify the cache size, block
+  size, and associativity of the instruction cache, respectively.
+  (default: N = 16384, B = 64, A = 8)
+
+  * arg="dcachesize=N"
+  * arg="dblksize=B"
+  * arg="dassoc=A"
+
+  Data cache configuration arguments. They specify the cache size, block size,
+  and associativity of the data cache, respectively.
+  (default: N = 16384, B = 64, A = 8)
+
+  * arg="evict=POLICY"
+
+  Sets the eviction policy to POLICY. Available policies are: :code:`lru`,
+  :code:`fifo`, and :code:`rand`. The plugin will use the specified policy for
+  both instruction and data caches. (default: POLICY = :code:`lru`)
-- 
2.20.1


