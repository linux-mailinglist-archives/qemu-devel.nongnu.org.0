Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A442420084
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:46:01 +0200 (CEST)
Received: from localhost ([::1]:55118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwC8-0006Bp-0H
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9C-00039N-TE
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:42:58 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:45946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9B-0000li-37
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:42:58 -0400
Received: by mail-ed1-x52f.google.com with SMTP id r18so51665155edv.12
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KqAXlvGMDEYnNdVIQ0K7jDAn8Tks9UOdxFcSEoaFxTg=;
 b=GkZ/sY15TQgCzaQACobSsmaWLbDZ3n5mjdIZtLlz8GiSlH+ZEFgDWiGQZs8IzH9C9G
 8I6Zxc8FfXknUo8iYipvIL68DYTqBBV0QoMQbgg7mPcoe/2GagM0qanTBiXhmMjFjvGt
 SDwF9dvB7clr9N6l/t3g0jBSnGcDyXsR/i4wzmbKQ5hkW2sRIn1AJjyVuvOGDHMacikx
 aRTUYDhQ5ohVSe1/OLvojh0qxg0gHeoUtdrNfZf72dGQzXbzMyYRZq/OrWx8Gcvc5fNy
 wW/oPux/5V9IVh4EPlFUtccyFllAk+R0SaKTvhf3NbMraSPY5SAQ0yQ7eyfb2RAu8swe
 zOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KqAXlvGMDEYnNdVIQ0K7jDAn8Tks9UOdxFcSEoaFxTg=;
 b=RkBeKQxUgeIRvbA1E6jfSDFdqs9GJib3UqEjH2f2dKdWpQv++rmJr8zKy3xv02rhfU
 hdmEPwfhi+3vC/hhLFSnKrwPcShE9YO253/U0M+RWp7OOQyyVI9bHR5cfV9+vyqA4eJf
 FzWW1rQAthmqzmuNkaJ7q+EvC6SYtujICnnfx89jklfyDA3hgatYjiUsQbYv2TDY6nP/
 CXNo1h6v2ncmiuEUPXib1X5SZL6PetA9MpSTIZ1v41PwXrLkpYb8ROhUJ1ABTB7r/+3m
 XtJe2hZlHIQnSWni6iR9SsaBE3RGwT6UKG34Zn3mzo0cvkGxnkTLJfCB1mk1c5B4WyY7
 juPA==
X-Gm-Message-State: AOAM530w4oIsa6PpLFuO33Mmovci9mDd9iz3ddS08vZLHrN3hXK66Crg
 kT8Zj5EaGpULJCrkI4k3Bu3bT0JslkU=
X-Google-Smtp-Source: ABdhPJyy5CXIk8x+1H9b8g5MVOsuAa/NQ+heyGlHPeCLyIlsIMD2q3pKbsCu66JUzEoPmKiOWMLIXg==
X-Received: by 2002:a05:6402:27cf:: with SMTP id
 c15mr9458736ede.131.1633246975600; 
 Sun, 03 Oct 2021 00:42:55 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:42:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/30] machine: Uniformly use maxcpus to calculate the omitted
 parameters
Date: Sun,  3 Oct 2021 09:42:24 +0200
Message-Id: <20211003074250.60869-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

We are currently using maxcpus to calculate the omitted sockets
but using cpus to calculate the omitted cores/threads. This makes
cmdlines like:
  -smp cpus=8,maxcpus=16
  -smp cpus=8,cores=4,maxcpus=16
  -smp cpus=8,threads=2,maxcpus=16
work fine but the ones like:
  -smp cpus=8,sockets=2,maxcpus=16
  -smp cpus=8,sockets=2,cores=4,maxcpus=16
  -smp cpus=8,sockets=2,threads=2,maxcpus=16
break the sanity check.

Since we require for a valid config that the product of "sockets * cores
* threads" should equal to the maxcpus, we should uniformly use maxcpus
to calculate their omitted values.

Also the if-branch of "cpus == 0 || sockets == 0" was split into two
branches of "cpus == 0" and "sockets == 0" so that we can clearly read
that we are parsing the configuration with a preference on cpus over
sockets over cores over threads.

Note: change in this patch won't affect any existing working cmdlines
but improves consistency and allows more incomplete configs to be valid.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210929025816.21076-5-wangyanan55@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c | 30 +++++++++++++++---------------
 hw/i386/pc.c      | 30 +++++++++++++++---------------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 8e719e2932..596e758133 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -760,24 +760,26 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     }
 
     /* compute missing values, prefer sockets over cores over threads */
-    if (cpus == 0 || sockets == 0) {
+    maxcpus = maxcpus > 0 ? maxcpus : cpus;
+
+    if (cpus == 0) {
+        sockets = sockets > 0 ? sockets : 1;
         cores = cores > 0 ? cores : 1;
         threads = threads > 0 ? threads : 1;
-        if (cpus == 0) {
-            sockets = sockets > 0 ? sockets : 1;
-            cpus = cores * threads * sockets;
-        } else {
-            maxcpus = maxcpus > 0 ? maxcpus : cpus;
-            sockets = maxcpus / (cores * threads);
-        }
+        cpus = sockets * cores * threads;
+        maxcpus = maxcpus > 0 ? maxcpus : cpus;
+    } else if (sockets == 0) {
+        cores = cores > 0 ? cores : 1;
+        threads = threads > 0 ? threads : 1;
+        sockets = maxcpus / (cores * threads);
     } else if (cores == 0) {
         threads = threads > 0 ? threads : 1;
-        cores = cpus / (sockets * threads);
-        cores = cores > 0 ? cores : 1;
+        cores = maxcpus / (sockets * threads);
     } else if (threads == 0) {
-        threads = cpus / (cores * sockets);
-        threads = threads > 0 ? threads : 1;
-    } else if (sockets * cores * threads < cpus) {
+        threads = maxcpus / (sockets * cores);
+    }
+
+    if (sockets * cores * threads < cpus) {
         error_setg(errp, "cpu topology: "
                    "sockets (%u) * cores (%u) * threads (%u) < "
                    "smp_cpus (%u)",
@@ -785,8 +787,6 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
         return;
     }
 
-    maxcpus = maxcpus > 0 ? maxcpus : cpus;
-
     if (maxcpus < cpus) {
         error_setg(errp, "maxcpus must be equal to or greater than smp");
         return;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 92c78d9933..e37e84cc7b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -727,24 +727,26 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     dies = dies > 0 ? dies : 1;
 
     /* compute missing values, prefer sockets over cores over threads */
-    if (cpus == 0 || sockets == 0) {
+    maxcpus = maxcpus > 0 ? maxcpus : cpus;
+
+    if (cpus == 0) {
+        sockets = sockets > 0 ? sockets : 1;
         cores = cores > 0 ? cores : 1;
         threads = threads > 0 ? threads : 1;
-        if (cpus == 0) {
-            sockets = sockets > 0 ? sockets : 1;
-            cpus = cores * threads * dies * sockets;
-        } else {
-            maxcpus = maxcpus > 0 ? maxcpus : cpus;
-            sockets = maxcpus / (dies * cores * threads);
-        }
+        cpus = sockets * dies * cores * threads;
+        maxcpus = maxcpus > 0 ? maxcpus : cpus;
+    } else if (sockets == 0) {
+        cores = cores > 0 ? cores : 1;
+        threads = threads > 0 ? threads : 1;
+        sockets = maxcpus / (dies * cores * threads);
     } else if (cores == 0) {
         threads = threads > 0 ? threads : 1;
-        cores = cpus / (sockets * dies * threads);
-        cores = cores > 0 ? cores : 1;
+        cores = maxcpus / (sockets * dies * threads);
     } else if (threads == 0) {
-        threads = cpus / (cores * dies * sockets);
-        threads = threads > 0 ? threads : 1;
-    } else if (sockets * dies * cores * threads < cpus) {
+        threads = maxcpus / (sockets * dies * cores);
+    }
+
+    if (sockets * dies * cores * threads < cpus) {
         error_setg(errp, "cpu topology: "
                    "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
                    "smp_cpus (%u)",
@@ -752,8 +754,6 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
         return;
     }
 
-    maxcpus = maxcpus > 0 ? maxcpus : cpus;
-
     if (maxcpus < cpus) {
         error_setg(errp, "maxcpus must be equal to or greater than smp");
         return;
-- 
2.31.1



