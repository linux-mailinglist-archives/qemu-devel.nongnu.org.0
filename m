Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EFF6D7990
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:20:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0Ef-0008Vq-EC; Wed, 05 Apr 2023 06:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0Ed-0008UN-Al
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:19:23 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0Ea-0003Nk-Jm
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:19:23 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v1so35645599wrv.1
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680689959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EBsjiWXEyjNdcnK7CdgNfH2aIDA7wl6BmVcuMNTGlRg=;
 b=ZCeEmGx5C1tuByO7Gk8190umAFm3Jq4q/3LEy8V4HB/sgDGk01PdV0MXcQqltklyu3
 DW09L0fwCMzuVJZy82A0vSyQNKZSvZwE3Rakfj2hr1zvFY1eZeaEbcBCDOHIx7fy11jt
 /S2FM9gq9oJe4BBqhtdS5l+3uhXXNdnl7KuLkaG9eftfsUPFv3TGzexWOVF1sWTguVrY
 838K9xTGvVrgnK3wGNr49BTbICPTkdgaMh9RIPXj5OJjY/e393NR9LtEmB+cM2VmI3zz
 RQrk9WLPd1wzBdC0E7STdPo8yjxVpnfYhSiLQXfXjBKsSb4Cc8fPtp7Mrl4DfK8dO1FF
 g35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680689959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EBsjiWXEyjNdcnK7CdgNfH2aIDA7wl6BmVcuMNTGlRg=;
 b=tv03KwsR2lYzKQjOoG603JMDQgIqHc3IdU116vPI7hbPUCq0ir1yVptL8IK7dFMgn6
 MpHl38QoBe4u76bqw6sDx+5blN05vHW5nkI2rZD5NdKepq2KNf8WzPkl+mzpmE2n31gw
 y9xyAh9LuYGubY3Cuh+3lbRwJgOb6D7wSAGnzFWlzLoaPTk6OGiApJgvlZaoG4o5tnNg
 ecUhX9o1GSkCBZ6aZH6Oxw1ToLPUulwEi+yQdvBe/P8DQ/wy2bNpYGDmcvnqS41oP1gs
 SWDIhDqdSmNTT9tC3xh4ipluJR2DW+5irju3KvZyfIFf1RsLFumGt0j9q8y6o8Q1Km+z
 8xmg==
X-Gm-Message-State: AAQBX9f148neTtBtgvB2QvXejGAiX6ToY4phPkx0g/yKRap1Ol1DCZga
 s3xb5REmAnl7iIExl+9D7vgwkSkZlj00ze98siw=
X-Google-Smtp-Source: AKy350bqyCS4jO7cj3IxU6M9gEfWmwwxn91ShCFu07OvQwRL7AbHTBtXunKmonFyvH6AyOInd3xSpQ==
X-Received: by 2002:adf:f004:0:b0:2cf:f01f:ed89 with SMTP id
 j4-20020adff004000000b002cff01fed89mr4200753wro.24.1680689958696; 
 Wed, 05 Apr 2023 03:19:18 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm14040108wrr.100.2023.04.05.03.19.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:19:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH 09/14] accel: Allocate NVMM vCPU using g_try_FOO()
Date: Wed,  5 Apr 2023 12:18:06 +0200
Message-Id: <20230405101811.76663-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

g_malloc0() can not fail. Use g_try_malloc0() instead.

https://developer-old.gnome.org/glib/stable/glib-Memory-Allocation.html#glib-Memory-Allocation.description

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/nvmm/nvmm-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index 3c7bdd560f..45fd318d23 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -942,7 +942,7 @@ nvmm_init_vcpu(CPUState *cpu)
         }
     }
 
-    qcpu = g_malloc0(sizeof(*qcpu));
+    qcpu = g_try_malloc0(sizeof(*qcpu));
     if (qcpu == NULL) {
         error_report("NVMM: Failed to allocate VCPU context.");
         return -ENOMEM;
-- 
2.38.1


