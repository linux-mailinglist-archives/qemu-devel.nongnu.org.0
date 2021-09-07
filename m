Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506B5402D82
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 19:11:24 +0200 (CEST)
Received: from localhost ([::1]:44292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNed1-0003CZ-DF
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 13:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNebO-000274-8v
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 13:09:42 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNebK-0005Ee-OY
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 13:09:40 -0400
Received: by mail-ed1-x535.google.com with SMTP id g22so14880810edy.12
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 10:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SzkysJK+GR86f1EL5B8irJzCjFC51VkxmA2Ea7NSG4g=;
 b=dLF8jFPaL/ORQ2J1wGfM8gGyR7OfWJiGfMt52fg6ZkmMEtvuGXVLS0LnXQgPU210fp
 bhKrbbs4R77MPgQiKFT8qst+YysRwSd44JOjgo3LZ+z2MG8kgfszUohApXV48Md8bgQN
 Z+VpHlSPoTRLI6JmgWgZRJ6GKOzV81p0hqmuJf/SPKm5qmV65ow46RgGvpeb4M1H15Jb
 OifcpwEEq4hv4B/AROBELcz1/V669C8PKs9slfIfLKfBW1Srl/rjDyjLbFWNIPuCz4VS
 DsMiLjtTuiFJobTJVDaCK1ATDnu1tCwxWIEd3T55I6qmJIffjT6rUZ6NdUvTD1zieRES
 l2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=SzkysJK+GR86f1EL5B8irJzCjFC51VkxmA2Ea7NSG4g=;
 b=gVf8Sda+aKydN1a0eDYhbFRMRA3NXTeSHkc8wvwVj8yj1XRtqF5H31aMnbAEBpKe1+
 SFTeS06K8cBFS5XYL5HHqXXErG8ILikJiz8eqxLyNfS3p6fipjCfMUEQiYn6S0NB7mmh
 l6yip3jnRZDruLGBmPMqsfT4T7zZ0zEFsqJ9BlAXK/7fX8qjly06ufnqPMzg0xY7k/qa
 hYMrim15YQK0nMJhXi4kOkW3x3ikJaPbdNIEv/2sXFES6tdnZxdx/94HjhIDW+YLtfmG
 0eD5iy5bfkdkpKYuzoqfU4n4yEviTQEvEdqW//07vGM+/gGBw4uPjJT1Jzx+9r4HgYL3
 Hc2A==
X-Gm-Message-State: AOAM531Nn+pelnGoAdZZ9CmJzaJ+uVDsXpSrUkUssXPzUWnl/jBPx0Ev
 +vNExLlnhbJJclHDxQNgW7ZDBC3NvK4=
X-Google-Smtp-Source: ABdhPJxJvqnTYHwPCmZ4S3Yomo41iWkH5y2lKVSKmnzxcGayHQDyp3/ex5Istp26N5rK3qS+YSZ+Ww==
X-Received: by 2002:aa7:c5cb:: with SMTP id h11mr493026eds.255.1631034576902; 
 Tue, 07 Sep 2021 10:09:36 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o19sm6822529edr.18.2021.09.07.10.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 10:09:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] fw_cfg: add etc/msr_feature_control
Date: Tue,  7 Sep 2021 19:09:35 +0200
Message-Id: <20210907170935.210428-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The file already existed, but nobody had noticed the warning until now.
Add it at the bottom, since that is where unknown files go in legacy mode.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/nvram/fw_cfg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 9b8dcca4ea..c06b30de11 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -878,6 +878,7 @@ static struct {
     { "etc/tpm/log", 150 },
     { "etc/acpi/rsdp", 160 },
     { "bootorder", 170 },
+    { "etc/msr_feature_control", 180 },
 
 #define FW_CFG_ORDER_OVERRIDE_LAST 200
 };
-- 
2.31.1


