Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3148A36B3E9
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 15:15:13 +0200 (CEST)
Received: from localhost ([::1]:47514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb14y-0005j2-90
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 09:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgenfv@gmail.com>) id 1lau3p-0000JM-NR
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 01:45:34 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgenfv@gmail.com>) id 1lau3n-0006IC-WE
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 01:45:33 -0400
Received: by mail-wr1-x42c.google.com with SMTP id a4so54411054wrr.2
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 22:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KilglWAaPsdiXcjfzKmnwxnFdqjFFALhZp4O9A7RhRQ=;
 b=dM3XXbqcn+Om8q7lzLnZLfCMcUqA9QaYPEaXxW0dYookVoYhfl8YCe3QPd260d6aYt
 W2PmzrQsUHZJ4YINKo/Jw/AXSuIVC2R/+PxaoatJtQIXPsEAVOHvasya/0lRD586H66L
 KN/GJG7tDpoUltfwHzx+ryLDThaeuFI9a9lfspx3ob3LdB+xMOsydm1DOk3IEMpNLpZ6
 KDF5gce+LVERwcw9Y2uMj1uSGII6LcUBPPFR2sQVrWsYN+rAHlYnoPR+pq+DOaf9osgq
 U5g0CCnPeNBYtWazbMJqaEm38qf6MkodEO1ZuK544ovoFbon+vli3G2NYSlgidYYh0Ok
 G/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KilglWAaPsdiXcjfzKmnwxnFdqjFFALhZp4O9A7RhRQ=;
 b=o0/+mUeTDkPYwvalLEcn2B83/ZzODvPuZJ8aP5kzPSDphHEqmDTHKOOMY0J1qNmKtm
 JXvL7oChjT3FxgRvetpBet3tvqKkH64h5jE3B+WJZzzlFbjK9hBg3iR8dE4AlzcoP9Fi
 xra8jHjZTNeyPM9HB0cCmbUQxtlLCSs19BiqjiCZZ/bpIDBJq0iub9Trc1B2ZNi4QJwp
 IaTEZPYFJERXWR51rRm3WGUOZjo90MJhq1pcuMYfrfjbJmeHsktA92htRgOuyrFsc4Le
 KVVTqHvpEE/TVUvZ2pO19cRfhAV5hRlhiMeZSD7DkC8oX/AdeX5OT8cHGTIHPPTucs0j
 DuLQ==
X-Gm-Message-State: AOAM533qp3PI/mq+S+R3Vsm0i99UDiXwiTa+0HXaT8ReAYqWWEeqSFF5
 vvlad+1zqR3HFCfN9eai2jiwqOOoNjMqqVUe
X-Google-Smtp-Source: ABdhPJxxh2ULLfm9aI0stlqhEBK8JG/v6feNXXvbACGuwPTsdDs3ulj/WavJd+OEopcjGTySc6pLcQ==
X-Received: by 2002:adf:f308:: with SMTP id i8mr20649329wro.209.1619415930824; 
 Sun, 25 Apr 2021 22:45:30 -0700 (PDT)
Received: from ubuntu.localdomain (host-92-0-155-74.as13285.net. [92.0.155.74])
 by smtp.gmail.com with ESMTPSA id c5sm12100641wrs.73.2021.04.25.22.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 22:45:30 -0700 (PDT)
From: Edge NFV <edgenfv@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] make vfio and DAX cache work together by skipping virtio fs
 cache section during vfio memory region add
Date: Sun, 25 Apr 2021 22:45:13 -0700
Message-Id: <20210426054513.132980-2-edgenfv@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426054513.132980-1-edgenfv@gmail.com>
References: <20210426054513.132980-1-edgenfv@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=edgenfv@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Apr 2021 09:08:52 -0400
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
Cc: edgenfv@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Edge NFV <edgenfv@gmail.com>
---
 hw/vfio/common.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ae5654fcdb..83e15bf7a3 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -668,6 +668,15 @@ static void vfio_listener_region_add(MemoryListener *listener,
                 int128_get64(int128_sub(section->size, int128_one())));
         return;
     }
+    
+    /* Do not add virtio fs cache section */                  
+    if (!strcmp(memory_region_name(section->mr), "virtio-fs-cache")) {
+        trace_vfio_listener_region_add_skip(
+                section->offset_within_address_space,
+                section->offset_within_address_space +
+                int128_get64(int128_sub(section->size, int128_one())));
+        return;
+    }  
 
     if (unlikely((section->offset_within_address_space &
                   ~qemu_real_host_page_mask) !=
-- 
2.25.1


