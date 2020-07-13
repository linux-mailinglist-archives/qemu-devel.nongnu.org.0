Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A677F21E247
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 23:35:37 +0200 (CEST)
Received: from localhost ([::1]:52668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv66q-0001iW-PU
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 17:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jv658-0007zh-2x
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 17:33:50 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:43471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jv656-0004Wr-KX
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 17:33:49 -0400
Received: by mail-pl1-x644.google.com with SMTP id x8so6094540plm.10
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 14:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fkrsEVGzpPmXW0hscK/oXZbT5j1F7cd9XvYkd0Gcy7I=;
 b=Mfm+c2gQQQ6N4TLwLZKLDrPBgVWruO9BYlMO5gVTTbKj4r0xC/q/cWHK3gVEQK19y3
 3+G+3esbcmw5qyKQaUOvPPpT3j7NUOS/f50FMnxv+CI7KP2meIYO3VCRONcod6Wl4tRn
 v0IQPPRC1ubYVo10Yq0nmjm0efWqHZrdQLki9DsHWhYqCE5QUUGKqF5RsJV0UvQk6BW8
 XykHnoXYz/vPPKDAZ6g/x+v0ZKP+qs/X3etojeC4XL2NedykUrLqn+29VPxlVUi/zSWO
 7p3QFq13Krfsa7bNp42CpUmRgUEtcEGx2kkOZg9dkhC0Zy5qpIuCQIHhgMRZsF0ge2ZZ
 zkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fkrsEVGzpPmXW0hscK/oXZbT5j1F7cd9XvYkd0Gcy7I=;
 b=jYB22IjIH/X2VdK8mF9qVk2avBpxPzL7HcWLzEk+2ntIfrZnrNf4TC4DMRje/q2APD
 /mM36wgjw1LJqr3sfLdhk6Bfqs6fMRanFLyVdJiBclj/Q33WiTGAYnfDlBaO76X63anY
 RL5uDFVyoJeDN6sHJKucCKcJ0lDOoaXkNdrDzDZF0e6SHSzENRayYv6qq2IITCxPkNwJ
 5zXxv91nzO1G/cZJnpV4Jw0xe0CoA1dalAltyQ14oC2jnHVZzhcioZLgceMmxk7g8E8/
 Ut8Hjd6JSXWZ4QnfjAXYNK0WpfCRKBF8DSC/6Yd8ggZGUNu6zeeXEqKDkzMfFc+XWFKQ
 bTjg==
X-Gm-Message-State: AOAM530lASfkQp95pQxIJDqgQd4U0IIi4cHTu+b5dZmzL3T60qjY4LaP
 0AyE/WTLE+7ge6OmbWpnx05cJimDk94=
X-Google-Smtp-Source: ABdhPJy5nVF/6fqCrHUHUXqodvzAUI339By72SHphWYGsrDfvFRh0sx3e+VXgjnGACNjGMM17x0nLw==
X-Received: by 2002:a17:90b:f05:: with SMTP id
 br5mr1406274pjb.42.1594676026750; 
 Mon, 13 Jul 2020 14:33:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id l207sm3591565pfd.79.2020.07.13.14.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 14:33:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/arm/virt: Error for MTE enabled with KVM
Date: Mon, 13 Jul 2020 14:33:40 -0700
Message-Id: <20200713213341.590275-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713213341.590275-1-richard.henderson@linaro.org>
References: <20200713213341.590275-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we expect KVM to support MTE at some future point,
it certainly won't be ready in time for qemu 5.1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5866c4ce20..a7f3d442db 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1773,6 +1773,12 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
+    if (vms->mte && kvm_enabled()) {
+        error_report("mach-virt: KVM does not support providing "
+                     "MTE to the guest CPU");
+        exit(1);
+    }
+
     create_fdt(vms);
 
     possible_cpus = mc->possible_cpu_arch_ids(machine);
-- 
2.25.1


