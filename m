Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6034F39A5A6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:21:35 +0200 (CEST)
Received: from localhost ([::1]:58908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loq6A-0005qO-8L
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkw-0001BO-Qy
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:38 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopku-0007BH-O2
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:38 -0400
Received: by mail-wr1-x42b.google.com with SMTP id h8so6355759wrz.8
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1mYBCex9meGBr2ctnrZlReVhFiOSt3U/7dRPAFjy6z0=;
 b=Y3bAmTtR99BbEWm7edmZ1w12xeUfhZcRkk2iM4jX4k1JyR9f27/ZHe1dqRDGLAFSVV
 te+zsfLEEdcSzzuSzBjLsXQ3Mo7NQm9ZxpVMfcEufsNg2yVaKp5KOQA59tWX+6FIXYki
 gpxhMzhcc40qHU105gFVqjkoLMJHhSVxY+BLHmE/kct3pf/bkIIgp+m3U9DtBXkwhM9G
 8aT7uxvL/vmQnVm92fiV0if86if3UeRYwPNfrBc5LIs07Tu4Kz24Zkq3efxjEo3QkqVn
 tomrJ9g3Mu+Qkfe0q5aDTPz8ztCwcPh27BttDvHJuA70BhR3nUUJa2xErMTnQBcfJBey
 5/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1mYBCex9meGBr2ctnrZlReVhFiOSt3U/7dRPAFjy6z0=;
 b=KKTIhmTWJnNxPDpvx0RIxYNkIyhz+nKfWKrStK3c6KkBpv+0V3m9oh1uv4prUzQU4L
 paosZNRruCdcFHhntsq6hLvcBvLYhLN/FdeD6+xIY0p2NvfDz2DAg2Rymc/DymtU4nsg
 HTMiJCmVAqeNAv74SJMVOlh/vqIWSGY856tdbOp3oNz3oKtc/0M6qALMM6MgwI6rH240
 ho42M/97u1TtAc61z56B6o/WnOPw1YvALJuxOPkmTlHfnqNdskLU9Yi4Xgor5kRZzyf4
 JPK9fnI+0x/vVhCASR0WWRIMavy4G/S480qu2sRxfUZT4bUNuD9nDqyzgQYkYCOLBb5f
 x5Fg==
X-Gm-Message-State: AOAM530JWt5e4qkylznsyGXlt9rQ3hDJzAzSljtColTn1+sUl+hBp1Gr
 /Bn9MYR7yJErT6YEFphPMVaOqTiyOPAw/Q1J
X-Google-Smtp-Source: ABdhPJypdHImMRvVefV3MX1EI5aGn2VNBNmfV95bgBxmA22rRoB+2imdVg2/b36UFOzsJle92XsElQ==
X-Received: by 2002:a5d:4b87:: with SMTP id b7mr615342wrt.129.1622735975426;
 Thu, 03 Jun 2021 08:59:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/45] hvf: Move vcpu thread functions into common directory
Date: Thu,  3 Jun 2021 16:58:48 +0100
Message-Id: <20210603155904.26021-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

Until now, Hypervisor.framework has only been available on x86_64 systems.
With Apple Silicon shipping now, it extends its reach to aarch64. To
prepare for support for multiple architectures, let's start moving common
code out into its own accel directory.

This patch moves the vCPU thread loop over.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-id: 20210519202253.76782-3-agraf@csgraf.de
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 {target/i386 => accel}/hvf/hvf-accel-ops.h | 0
 {target/i386 => accel}/hvf/hvf-accel-ops.c | 0
 target/i386/hvf/x86hvf.c                   | 2 +-
 accel/hvf/meson.build                      | 1 +
 target/i386/hvf/meson.build                | 1 -
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename {target/i386 => accel}/hvf/hvf-accel-ops.h (100%)
 rename {target/i386 => accel}/hvf/hvf-accel-ops.c (100%)

diff --git a/target/i386/hvf/hvf-accel-ops.h b/accel/hvf/hvf-accel-ops.h
similarity index 100%
rename from target/i386/hvf/hvf-accel-ops.h
rename to accel/hvf/hvf-accel-ops.h
diff --git a/target/i386/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
similarity index 100%
rename from target/i386/hvf/hvf-accel-ops.c
rename to accel/hvf/hvf-accel-ops.c
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 0d7533742eb..2b99f3eaa2d 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -32,7 +32,7 @@
 #include <Hypervisor/hv.h>
 #include <Hypervisor/hv_vmx.h>
 
-#include "hvf-accel-ops.h"
+#include "accel/hvf/hvf-accel-ops.h"
 
 void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
                      SegmentCache *qseg, bool is_tr)
diff --git a/accel/hvf/meson.build b/accel/hvf/meson.build
index 227b11cd717..fc52cb78433 100644
--- a/accel/hvf/meson.build
+++ b/accel/hvf/meson.build
@@ -1,6 +1,7 @@
 hvf_ss = ss.source_set()
 hvf_ss.add(files(
   'hvf-all.c',
+  'hvf-accel-ops.c',
 ))
 
 specific_ss.add_all(when: 'CONFIG_HVF', if_true: hvf_ss)
diff --git a/target/i386/hvf/meson.build b/target/i386/hvf/meson.build
index d253d5fd102..f6d4c394d3e 100644
--- a/target/i386/hvf/meson.build
+++ b/target/i386/hvf/meson.build
@@ -1,6 +1,5 @@
 i386_softmmu_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
   'hvf.c',
-  'hvf-accel-ops.c',
   'x86.c',
   'x86_cpuid.c',
   'x86_decode.c',
-- 
2.20.1


