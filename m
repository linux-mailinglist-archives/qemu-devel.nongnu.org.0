Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36414CEBAA
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:14:59 +0100 (CET)
Received: from localhost ([::1]:35304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqiw-0004YX-RT
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:14:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqW6-0001Ob-1h
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:42 -0500
Received: from [2a00:1450:4864:20::430] (port=36638
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqW4-00044f-Ao
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:41 -0500
Received: by mail-wr1-x430.google.com with SMTP id r10so19339620wrp.3
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ts4YmLK8kGBvQFnNbWDOwfqmzK4vYB4IrYwQhSsjG/8=;
 b=aU5/3hK3RQ2Z8/2PIwBt8GBViKi32t+G2QWTX7TsavnCQPhgy6ann7vMl3i9p0EhoZ
 y2hgNi6eCtIAeDQPKDP93W5rh32fBGZG0TsGGKsZckv3aYJEue9LAPcT45QaAkL0KsNt
 +Qvz2ko5jQepz2u16VRPRSJdnNqW7PgIeFXezqoCVmbdzM/Kwpaso/VnagiPJb84R6PA
 YKNZ9EnGCCuMSTubI5hHe9gzDIjossNCDr0GV52c6p2vop8lhSotQVsuUcS4gQI+KvLC
 Ba8x3mnUecDw9H1rRdiNp2SM7WvRSyG7ksfMWkMEs8VFrYctVjhN03rf7HhUEFOOczU5
 kggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ts4YmLK8kGBvQFnNbWDOwfqmzK4vYB4IrYwQhSsjG/8=;
 b=wT82Cy+GO6gs3BEiQpnxzzyCQIqvx815qGBoTAdB/cmx+izs4XZj+7BA48TrU1Su2s
 1aAYn+VkT+5X7iBfaxC6dzSXC5x76PjkXdfSnb2JxOqtRaDd+nzyv7q5Wh8akFZfn3AP
 J/TyRIrAtuicNPoW86EDbeIMeSyf85RSRtc4t2aE4SNtM4SAPoh92ArtH8uhKU6WXiB+
 70y0wPzc6DcQ2ohHrXScKyJNiE+PjdhwpHqZNeWH+NJ5ILO5VPBbar7eItDPODmnGZjw
 K7yV7mkWeRvYw8bWAA4MtThzK6m/ftrSqD2R44aGI124TnVf9eJjArmFLbWffA2lclrD
 RsSw==
X-Gm-Message-State: AOAM533OgzG8O+335wJY1dc8gF18cshZsMXP1G2Rbt1y3jWyBgRt0fvo
 xv2cWwP9hpYm+qEHZiEvGrmpP2WrtQc=
X-Google-Smtp-Source: ABdhPJzJ4GdLoL9YldDUuZWIEibQfgkPZDWOr/yKCBGEpZklwp0Rpw44fACMtS+K5jeTfCx1R5334g==
X-Received: by 2002:a05:6000:2cf:b0:1f0:47a0:a482 with SMTP id
 o15-20020a05600002cf00b001f047a0a482mr5228936wry.192.1646571698488; 
 Sun, 06 Mar 2022 05:01:38 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 p2-20020a1c7402000000b0038159076d30sm16971269wmc.22.2022.03.06.05.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:01:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/33] exec/cpu: Make address_space_init/reloading_memory_map
 target agnostic
Date: Sun,  6 Mar 2022 13:59:45 +0100
Message-Id: <20220306130000.8104-19-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

cpu_address_space_init() and cpu_reloading_memory_map() are
target-agnostic, but are declared in "exec/exec-all.h" which
contains target-specific declarations. Any target-agnostic
source including "exec/exec-all.h" becomes target-specific and
we have to compile it N times for the N targets built.  In order
to avoid that, move the declarations to "exec/cpu-common.h" which
only contains target-agnostic declarations.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-20-f4bug@amsat.org>
---
 include/exec/cpu-common.h | 23 +++++++++++++++++++++++
 include/exec/exec-all.h   | 25 -------------------------
 2 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 8031ebc680c..7f7b5943c7b 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -90,6 +90,28 @@ void qemu_ram_unset_migratable(RAMBlock *rb);
 size_t qemu_ram_pagesize(RAMBlock *block);
 size_t qemu_ram_pagesize_largest(void);
 
+/**
+ * cpu_address_space_init:
+ * @cpu: CPU to add this address space to
+ * @asidx: integer index of this address space
+ * @prefix: prefix to be used as name of address space
+ * @mr: the root memory region of address space
+ *
+ * Add the specified address space to the CPU's cpu_ases list.
+ * The address space added with @asidx 0 is the one used for the
+ * convenience pointer cpu->as.
+ * The target-specific code which registers ASes is responsible
+ * for defining what semantics address space 0, 1, 2, etc have.
+ *
+ * Before the first call to this function, the caller must set
+ * cpu->num_ases to the total number of address spaces it needs
+ * to support.
+ *
+ * Note that with KVM only one address space is supported.
+ */
+void cpu_address_space_init(CPUState *cpu, int asidx,
+                            const char *prefix, MemoryRegion *mr);
+
 void cpu_physical_memory_rw(hwaddr addr, void *buf,
                             hwaddr len, bool is_write);
 static inline void cpu_physical_memory_read(hwaddr addr,
@@ -102,6 +124,7 @@ static inline void cpu_physical_memory_write(hwaddr addr,
 {
     cpu_physical_memory_rw(addr, (void *)buf, len, true);
 }
+void cpu_reloading_memory_map(void);
 void *cpu_physical_memory_map(hwaddr addr,
                               hwaddr *plen,
                               bool is_write);
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index edc8e5fa1ec..d2cb0981f40 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -80,31 +80,6 @@ static inline bool cpu_loop_exit_requested(CPUState *cpu)
     return (int32_t)qatomic_read(&cpu_neg(cpu)->icount_decr.u32) < 0;
 }
 
-#if !defined(CONFIG_USER_ONLY)
-void cpu_reloading_memory_map(void);
-/**
- * cpu_address_space_init:
- * @cpu: CPU to add this address space to
- * @asidx: integer index of this address space
- * @prefix: prefix to be used as name of address space
- * @mr: the root memory region of address space
- *
- * Add the specified address space to the CPU's cpu_ases list.
- * The address space added with @asidx 0 is the one used for the
- * convenience pointer cpu->as.
- * The target-specific code which registers ASes is responsible
- * for defining what semantics address space 0, 1, 2, etc have.
- *
- * Before the first call to this function, the caller must set
- * cpu->num_ases to the total number of address spaces it needs
- * to support.
- *
- * Note that with KVM only one address space is supported.
- */
-void cpu_address_space_init(CPUState *cpu, int asidx,
-                            const char *prefix, MemoryRegion *mr);
-#endif
-
 #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 /* cputlb.c */
 /**
-- 
2.35.1


