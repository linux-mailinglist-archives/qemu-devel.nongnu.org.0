Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB446B7BFE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 16:31:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbk8M-0007Lv-7h; Mon, 13 Mar 2023 11:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbk8J-0007La-Gk
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:30:43 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbk8H-0003dD-SP
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:30:43 -0400
Received: by mail-wr1-x434.google.com with SMTP id g3so11713876wri.6
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 08:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678721440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tgvktAzfesfxD8WUyraQcM3eJl8p+SmOjICI4meUlWI=;
 b=kzaM8CL3Bv2JzTtRkdBQSzfk0m7eOfAWONTMMHd2HCls6qKe8BiCmi+pQb6G2iiczO
 Jd/4ZnrCZtUkAt+Z1OBiLNu3kGUCGhieVRMMPCQlNK4akr3uKNpnqj3yzTDRJEUrd/yb
 jOQiYxWal1QNR+KkVIrz/F+40i+BKDOpnNjRAR9RcAllx8bTHf3YDQUfAw2TVbfMghJz
 crJgB0UsQnDJW6Qpqki0uiaFStlwnQzTWpgeQBtL+fL057mNn4IKpOrXj/XQtMgA5NPz
 LX87GasE3ilXzHm68vJKBgS+mtREOixZVRw7UkHqN018eaxGhFu4idW3UCTS5UvLBlSS
 xlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678721440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tgvktAzfesfxD8WUyraQcM3eJl8p+SmOjICI4meUlWI=;
 b=4LtynaJlWgd7gfM8tF81EfCPcc7Gb/e/5Eh3eyeXYo5yVxy1QetDkXMMaepBa9dOtc
 nTZpDWUTLgtDaONF1Bn3kRSCqK6CcMsIK5JdqbGwfNtr3k84URWBSYoMnHSkkt2VCJiS
 Hb2om7Iet9Em2o1p+CHqSjUyzeucJDYdFh8gXWwcyttC33V1gz8hH39pq7sg+H7lOZOo
 7P4s6t/HbWpkCFutpT1gvFXZzbm81mZaNYf3DT6toxF/2QDMjYvycFYogNyCbw7mc1Vp
 O8s/glTTcbi8n67+GjeO6EapfPOrb/CXvG+G/Du/eUOMWE/trnug7WzPnqHnpS2I8I0W
 eRIA==
X-Gm-Message-State: AO0yUKWHrvU0fR+vHgTeRNXqImwzLqkzNrpr3DLVl57miKF+CJwXdRJh
 9ihoueo4B+i/OaB8alANXs0Z2Q==
X-Google-Smtp-Source: AK7set8gfd9PPU4XvUUhgXt+Drxu1nsHISoUzyX7ENFSeZBF6s8WdFTdjw29C4eIOCJaz9BOhoi0/Q==
X-Received: by 2002:adf:f3c5:0:b0:2cf:e6de:c6ab with SMTP id
 g5-20020adff3c5000000b002cfe6dec6abmr922642wrp.11.1678721440130; 
 Mon, 13 Mar 2023 08:30:40 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d4ecb000000b002c70851fdd8sm8155117wrv.75.2023.03.13.08.30.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Mar 2023 08:30:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Wei Huang <wei.huang2@amd.com>,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Roman Kapl <rka@sysgo.com>, Brijesh Singh <brijesh.singh@amd.com>,
 David Kiarie <davidkiarie4@gmail.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 1/6] MAINTAINERS: Mark AMD-Vi emulation as orphan
Date: Mon, 13 Mar 2023 16:30:26 +0100
Message-Id: <20230313153031.86107-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230313153031.86107-1-philmd@linaro.org>
References: <20230313153031.86107-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

hw/i386/amd_iommu.c seems unmaintained:
After commit 1c7955c450 ("x86-iommu: introduce parent class",
2016-07-14), almost no feature added, 2 bug fixes, other changes
are generic tree-wide API cleanups.

Cc: Roman Kapl <rka@sysgo.com>
Cc: Wei Huang <wei.huang2@amd.com>
Cc: Brijesh Singh <brijesh.singh@amd.com>
Cc: David Kiarie <davidkiarie4@gmail.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Following
https://lore.kernel.org/qemu-devel/CACGkMEtjmpX8G9HYZ0r3n5ErhAENKhQ81f4ocfCYrh=XoF=5hw@mail.gmail.com/
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 95c957d587..8badbb01d3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3356,6 +3356,10 @@ F: hw/i386/intel_iommu.c
 F: hw/i386/intel_iommu_internal.h
 F: include/hw/i386/intel_iommu.h
 
+AMD-Vi Emulation
+S: Orphan
+F: hw/i386/amd_iommu.?
+
 OpenSBI Firmware
 M: Bin Meng <bmeng.cn@gmail.com>
 S: Supported
-- 
2.38.1


