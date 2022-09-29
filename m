Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64625EF7B4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:35:10 +0200 (CEST)
Received: from localhost ([::1]:48150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odud3-0004Dn-NQ
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsD1-0007V8-MQ
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:07 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsCw-0004Qe-Va
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id bq9so1827548wrb.4
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 05:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=DHq1AQi9rI4q4IRUhBPRUGpA6QqNDihLOg2w93Jsa1M=;
 b=dO8Scfs3gyKI6/yrarry+x5ozfjeCSpMmMBfWkU3fulJ/IfH+mivqbXlavSpYddHBN
 4FU9FoUyKtrlra5Zp30rBHvxub98kRAeTAIbzV1dFAVEIN2SGp9ya20VT46D6eQIAZ0M
 pbBpci9fdrLV/dI/BHa8xYLnpbf+JeWw5cOITrvXdSu/2z506YuCaTaoy9Lf70RMiGpK
 BMaHaFrNN5P5XA2j10PIXkkUYGQx2yAWOrfsUPwCxJ0ARTcZb46ajzieh1EJHNh6SphE
 IX4vh+jyzbCstEIjXSnj5qGageTBJ0Wfdq6HdWuJChGA8RPQ0A3h7/w99lbVU2vFyHm6
 TI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DHq1AQi9rI4q4IRUhBPRUGpA6QqNDihLOg2w93Jsa1M=;
 b=uOIrd6YcWbNoO9LOlQ0E0hWS8W8+8GUNXuL2X9NAf0kiz7jKywl/AfiKG4jjbaEkJs
 tYiTVF+1fPG0VMh8shJtQRo4avyY/N8g+eG25ZRelEGVLydf0BkixBxlcMey+yFruHZm
 PZIZ8Dq3m3QRaOf/xdDgtYSRb92NhkojSAwwFPSul81rfOd9rewsXvmse6sCwv3xu55S
 3RGfxR/K/eVTfAUxa+UbwfXDlxlw0zCaXSfzD89w43LEllRqr8xeEFKhXrDZnN+7Bp+J
 qoalFiE8O3FsWkCa36J0jVtJJk3HPTd94liivYd9IOnTalN0eXqqK1t5VVuNUFcvV0Ad
 bbqw==
X-Gm-Message-State: ACrzQf07WP0+dCHD5uKVmBZx2bUkjEuIxO/WhiwBMVR+0b95i28hGaqa
 I+aXdE49pI9w8EiLwZfaWcxpLcurn9wjWw==
X-Google-Smtp-Source: AMsMyM6FL9GsOgNciKCWqVH1+Dws2VSIrh9VSL9Fr+Xm7hfIhqfGWaaK/6iBvEEovrq6zc/JFSfvlw==
X-Received: by 2002:a05:6000:689:b0:228:e2cf:d20e with SMTP id
 bo9-20020a056000068900b00228e2cfd20emr1894309wrb.147.1664452801164; 
 Thu, 29 Sep 2022 05:00:01 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c510900b003a5c244fc13sm4817516wms.2.2022.09.29.04.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:59:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C12E01FFDF;
 Thu, 29 Sep 2022 12:42:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org (open list:Overall KVM CPUs)
Subject: [PATCH v1 46/51] accel/kvm: move kvm_update_guest_debug to inline stub
Date: Thu, 29 Sep 2022 12:42:26 +0100
Message-Id: <20220929114231.583801-47-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220927141504.3886314-16-alex.bennee@linaro.org>
---
 include/sysemu/kvm.h   | 16 ++++++++++++++++
 accel/kvm/kvm-all.c    |  6 ------
 accel/stubs/kvm-stub.c |  5 -----
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 6e1bd01725..790d35ef78 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -247,7 +247,23 @@ int kvm_on_sigbus(int code, void *addr);
 
 void kvm_flush_coalesced_mmio_buffer(void);
 
+/**
+ * kvm_update_guest_debug(): ensure KVM debug structures updated
+ * @cs: the CPUState for this cpu
+ * @reinject_trap: KVM trap injection control
+ *
+ * There are usually per-arch specifics which will be handled by
+ * calling down to kvm_arch_update_guest_debug after the generic
+ * fields have been set.
+ */
+#ifdef KVM_CAP_SET_GUEST_DEBUG
 int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap);
+#else
+static inline int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
+{
+    return -EINVAL;
+}
+#endif
 
 /* internal API */
 
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 6ebff6e5a6..423fb1936f 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3395,12 +3395,6 @@ void kvm_remove_all_breakpoints(CPUState *cpu)
     }
 }
 
-#else /* !KVM_CAP_SET_GUEST_DEBUG */
-
-static int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
-{
-    return -EINVAL;
-}
 #endif /* !KVM_CAP_SET_GUEST_DEBUG */
 
 static int kvm_set_signal_mask(CPUState *cpu, const sigset_t *sigset)
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 2d79333143..5d2dd8f351 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -46,11 +46,6 @@ int kvm_has_many_ioeventfds(void)
     return 0;
 }
 
-int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
-{
-    return -ENOSYS;
-}
-
 int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr)
 {
     return 1;
-- 
2.34.1


