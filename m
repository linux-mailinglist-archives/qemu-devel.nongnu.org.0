Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F4B3BACC2
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 12:58:29 +0200 (CEST)
Received: from localhost ([::1]:40442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzzpU-0003K6-Ll
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 06:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lzzo2-000178-Ja
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 06:56:58 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:36656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lzzo1-0000aX-3N
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 06:56:58 -0400
Received: by mail-ej1-x62b.google.com with SMTP id nd37so24363839ejc.3
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x418SNrj2nMR0PLcR8ORPMYCWf0JT6CneiERD1LoT4s=;
 b=TJAMNryUcg75TW+cyBsp90xs7AQ1y911cPUquLUrqkiq9yHmbxYGwTZhkxej960SIx
 iLAKurPMvcFmqIwlcBwvP0zosKL9UI0Zg4JI18VBAuao+akgz73HIYwLK7lyqqZWp9S9
 gSM7f/ofVWtZykCY0wMyj3th9iZnfOhf3DC3q9RCxeQxni12hJOY5Ebstan3w0xEkilD
 wcm6TkvcSs0AqJoHyWNr0q78zUtsAaBnGyxxNkc2Ylhy3Om1ChrME5Eb04CWDehwWXOv
 9NpWy5DhuFHOvbM3+5lepL9O/3yit57IwCssQZyggJOLaV5TlJAG57eOF2Xztqrcln0/
 nG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x418SNrj2nMR0PLcR8ORPMYCWf0JT6CneiERD1LoT4s=;
 b=pXcH3+30SAe4/xdEIVnXzKQUfKKW9qxF/bd5CVZ+bpQ61i7+j06ktaYeiUQsYe2A9v
 rtVxO0YM+eVqukSV8hFhAdoHhxDOrVLEPEV0OzZzM97RvuVNiatvICKDI6UXg8xonZmk
 hyH/T7tGmmlU+uEVHLV0tQROJGi/D1m/sIWUANltl0C5ao9Y9KbKdBoCkeoNPT6gH9Sw
 G1pwLkN5sZKyryO1MkNdyYcTh8sstAbQ7qYW1sL/2j1RaTnval8sGWN7oS+SJxxXGx4z
 AXCuTN/8swLlw6gF75ShQ4jb75DyIiISJG1Bxt/dKyVotknNZdwQwpGiZf6Rh/eXeEgH
 tkcQ==
X-Gm-Message-State: AOAM5318+qPxwXYGkMvbqRfHfQrldgqdt+8lwNovKIeRRgGgiLIc0Q62
 Stp7HEVan2+EOqpFM0nfdqegkbMXr48=
X-Google-Smtp-Source: ABdhPJwkEoME+xQtWgRs9JJtbBFashBP5xToL1OZEur2HMFgxH1NDtIWe2610801oqD3vSk2Sj+cBA==
X-Received: by 2002:a17:906:25db:: with SMTP id
 n27mr8280308ejb.170.1625396215636; 
 Sun, 04 Jul 2021 03:56:55 -0700 (PDT)
Received: from localhost.localdomain ([5.29.30.165])
 by smtp.gmail.com with ESMTPSA id o21sm3795839eds.10.2021.07.04.03.56.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 04 Jul 2021 03:56:55 -0700 (PDT)
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 3/3] pvrdma: Fix the ring init error flow (CVE-2021-3608)
Date: Sun,  4 Jul 2021 13:56:46 +0300
Message-Id: <20210704105646.13524-4-marcel.apfelbaum@gmail.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20210704105646.13524-1-marcel.apfelbaum@gmail.com>
References: <20210704105646.13524-1-marcel.apfelbaum@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ej1-x62b.google.com
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

Do not unmap uninitialized dma addresses.

Fixes: CVE-2021-3608
Reviewed-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Tested-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
Message-Id: <20210630115246.2178219-1-marcel@redhat.com>
Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
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
2.17.2


