Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB7C3BACC3
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 12:59:06 +0200 (CEST)
Received: from localhost ([::1]:42492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzzq5-0004g0-Fx
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 06:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lzzo0-000142-SN
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 06:56:56 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:36663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lzznz-0000Z5-FE
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 06:56:56 -0400
Received: by mail-ej1-x633.google.com with SMTP id nd37so24363789ejc.3
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 03:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zZbd2/5JTaA7VwZ3/LPsZBUu4gZupP7sm+gNHOgeMf0=;
 b=GpIAj2NSWJGLwzPiRzCKH3U8UMkvUpc5D7Xou4UHTQYWMPnynhiBlWVtBWtej9H5mW
 lAfflrVDMjDKTOqhlyydDqhTAOWrUD4JTAE2QxrqRMCfONCjRalugQRKLE9kVOH/Pgea
 2h/S5EQx2gD5awOURAKb/xMpXnKIXXYu8Xem2wj7+J0hVJMNLhZPf9IhzERPJ6WwAyTU
 mokZTsNj5gKxfDA6fLyHaJTw7X+7K2J3CtEsCawPUfhXUoIWX64JUotDbhTkBy1wm1jK
 Fj/xULE7srGkFL3aZ2LjmT2seseLcOfoY/aBYEF6cD4HQE/hIXx2aMm/5a67VhtMyQvQ
 udBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zZbd2/5JTaA7VwZ3/LPsZBUu4gZupP7sm+gNHOgeMf0=;
 b=sm0Q2YaqaSsaVTBSNJ/PXTk5bdH7nugub4JZp3OVizcdQDSOtMufhhTVo7rcRnmkwX
 J06SiTwQjjEU3oRrHISr1wBbhexXa44uv1qI13Kiqsmwhh3RJCLMG+gnlBtQmKtK8PhW
 VSfE58WjKohRknf3QjR++IkVy76w3u0l5v2lE6gyxPbTVC5TYsF88h3zA7mXoJLdY5qt
 fvi5Ki1IptC2xqthRDfLIZQckZEDcNyVANUf2KX905N+Frmg7em2EwKOjNhjugoWn588
 14wRrKJsU6hirp4TtrQwZyo/fH/bRcg4Z6mFcFEO2MxOBH1i1juxk6LrJFsfCLDI5maq
 kVCQ==
X-Gm-Message-State: AOAM533jnNunjq6EwM+hiwTIc3+bCEO0yn6Hlvrx9QD7IRsvFIq7xKXp
 Kryi+mSeKDyFdE8Z+fyfO/9BunQhpvg=
X-Google-Smtp-Source: ABdhPJwmb2aW3C/F9N345gxeU1CyhM4OCPifMK/Iy5HagCHp3ULzDPSn4WSo1ghTL44BdAIivUX4eA==
X-Received: by 2002:a17:906:f6c8:: with SMTP id
 jo8mr8399173ejb.177.1625396213883; 
 Sun, 04 Jul 2021 03:56:53 -0700 (PDT)
Received: from localhost.localdomain ([5.29.30.165])
 by smtp.gmail.com with ESMTPSA id o21sm3795839eds.10.2021.07.04.03.56.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 04 Jul 2021 03:56:53 -0700 (PDT)
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 2/3] pvrdma: Ensure correct input on ring init (CVE-2021-3607)
Date: Sun,  4 Jul 2021 13:56:45 +0300
Message-Id: <20210704105646.13524-3-marcel.apfelbaum@gmail.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20210704105646.13524-1-marcel.apfelbaum@gmail.com>
References: <20210704105646.13524-1-marcel.apfelbaum@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: mcascell@redhat.com, pjp@fedoraproject.org, yuval.shaia.ml@gmail.com,
 vv474172261@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Check the guest passed a non zero page count
for pvrdma device ring buffers.

Fixes: CVE-2021-3607
Reported-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Reviewed-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
Message-Id: <20210630114634.2168872-1-marcel@redhat.com>
Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
---
 hw/rdma/vmw/pvrdma_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
index 84ae8024fc..7c0c3551a8 100644
--- a/hw/rdma/vmw/pvrdma_main.c
+++ b/hw/rdma/vmw/pvrdma_main.c
@@ -92,6 +92,11 @@ static int init_dev_ring(PvrdmaRing *ring, PvrdmaRingState **ring_state,
     uint64_t *dir, *tbl;
     int rc = 0;
 
+    if (!num_pages) {
+        rdma_error_report("Ring pages count must be strictly positive");
+        return -EINVAL;
+    }
+
     dir = rdma_pci_dma_map(pci_dev, dir_addr, TARGET_PAGE_SIZE);
     if (!dir) {
         rdma_error_report("Failed to map to page directory (ring %s)", name);
-- 
2.17.2


