Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88EC3B817E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 13:54:08 +0200 (CEST)
Received: from localhost ([::1]:58312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyYn9-0001eZ-Oh
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 07:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lyYlz-0000S9-7B
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 07:52:55 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lyYlx-0006ut-Gl
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 07:52:54 -0400
Received: by mail-ej1-x62e.google.com with SMTP id nd37so3773512ejc.3
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 04:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qG4QrmjcmISVu1KxJAiU6zi+aVYxiFHXGZWUu9clFz8=;
 b=V+zoYvXqwXJZLQFuM2ezuIPtgTFYgXZp1yzY/Ayjl78YZO3G7Tmpv0dhews9gh1GGm
 vhc352/gAk5mz32kUq9DhaS30kgOole0Kd9PU4ucBszOHgOpuGkLsin/VHRQVh/j6eG6
 Aua2WnXAN8fIr6Sz6vWGkIw2YSSZ331hkhAqdaJhMyzNbudf8xhZQuUeVveQT2tpP5je
 elYBi0Vo3rmaVkFx3GAQg7K9Mfct5KXs0zfCEkEtiT46N3AHA7jRN5o5dRnWG+KD8O9d
 fMFOQAFXGmKAJKXcrEll4b3Sx/MO9znwd0WEzRTdSS2DcKd6qe2GD3j1+EhZYaKz69WI
 Lg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qG4QrmjcmISVu1KxJAiU6zi+aVYxiFHXGZWUu9clFz8=;
 b=Vp2+Chnf2Vrz15pqapA6VuAXRMXF2EvFNsw8cQOlt/2tDnxQ3kOc6JOAjHEkKUtArp
 zZdp1Focz2HUlshVlcGEgnkRmMl1BGGVvFcPd/SM3QUiQEADoEFUcbCQeMx09Hka3f2G
 NZc5mhvgOthRJAisLXjp1dWhdv6V0lEVMk0vOe4Bgsxbxh8jAtj+U9ZFQKs7Vq+d7rv/
 wNg0RyBld/2Kzen87o5OSlgMO1wtHVtTI5MjHVE7fENV2j7pRV1g/QmYpGSlpU5LZijk
 95XRs6+XBwh96qYudkKU/G+UUkjomPIATs3zywXTwngfXUEqXGW1W5ZW0kcKYSgVAXjn
 HH1w==
X-Gm-Message-State: AOAM532t8LUD8AGlnmBcyT2Osw2SLXE2QaDI5F0zEUjGx1bvMEdbSS5B
 XxQtNvDgc54x3klbi9RzN+IXPesDWS8=
X-Google-Smtp-Source: ABdhPJwDQ3Ehm8iS+M8IMmcZS/8UBvV5SxcOcVlWE7BUuRB54zmali9jVYmubN9iHoHnqVSculFH7w==
X-Received: by 2002:a17:906:15d5:: with SMTP id
 l21mr34432880ejd.429.1625053971528; 
 Wed, 30 Jun 2021 04:52:51 -0700 (PDT)
Received: from mapfelba.users.ipa.me ([5.29.30.165])
 by smtp.gmail.com with ESMTPSA id r23sm10983655edv.26.2021.06.30.04.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 04:52:51 -0700 (PDT)
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
X-Google-Original-From: Marcel Apfelbaum <marcel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] pvrdma: Fix the ring init error flow (CVE-2021-3608)
Date: Wed, 30 Jun 2021 14:52:46 +0300
Message-Id: <20210630115246.2178219-1-marcel@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ej1-x62e.google.com
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
Cc: marcel@redhat.com, vv474172261@gmail.com, mcascell@redhat.com,
 pj.pandit@yahoo.co.in, yuval.shaia.ml@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not unmap uninitialized dma addresses.

Fixes: CVE-2021-3608
Reviewed-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Tested-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
---
 hw/rdma/vmw/pvrdma_dev_ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring.c
index 074ac59b84..42130667a7 100644
--- a/hw/rdma/vmw/pvrdma_dev_ring.c
+++ b/hw/rdma/vmw/pvrdma_dev_ring.c
@@ -41,7 +41,7 @@ int pvrdma_ring_init(PvrdmaRing *ring, const char *name, PCIDevice *dev,
     qatomic_set(&ring->ring_state->cons_head, 0);
     */
     ring->npages = npages;
-    ring->pages = g_malloc(npages * sizeof(void *));
+    ring->pages = g_malloc0(npages * sizeof(void *));
 
     for (i = 0; i < npages; i++) {
         if (!tbl[i]) {
-- 
2.31.1


