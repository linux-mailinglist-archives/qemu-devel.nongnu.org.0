Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F15D365CAD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 17:53:47 +0200 (CEST)
Received: from localhost ([::1]:45510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYsh8-0006j5-9E
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 11:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lYsbK-0001k2-Dw
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:47:46 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lYsbD-0003Ok-Av
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:47:41 -0400
Received: by mail-wr1-x435.google.com with SMTP id s7so38049691wru.6
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6HbB1VAhhgUx/qaXvX023gMFsNxHJqdWOpClPBzOgFg=;
 b=eQOtb/mEx8ubV0mvrl3wHhNnKbKYIPl1kXziZp6hUQC4FzecXfX7YnBa4my8Mj65zp
 ENNXamkQW/GwpcQ3IeqXIIyr0+wLjNQZa0+YfCCKHm1AxYxc9OizMduGhLMDnON3vxVd
 RVezCWJpRZr4bkDvjxzoc2U6eH9yxkwr/UB0gIPDg3cRZtFXENJR83z6C7WG8wXPe+8u
 Ze3o7cH2E5qQwU/ZPurIuKw5lwttxKc46hcArOyW0bjU056PPkoM/FACmFB8xhMFIPLF
 6YJrA9HsQd+w+AUWdg79I2s5KnmQpWQRVKCd8gCnqUn76RdP518vdNUojpHatIBIleIm
 KAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6HbB1VAhhgUx/qaXvX023gMFsNxHJqdWOpClPBzOgFg=;
 b=WEBP+j0+mGwQ5g0bDRVMBTxSaaMjCKTQEzeNnHuddhUo+7U1y1npFdcfPUIhoWAs4f
 8MdOl8eo7baLOF65zqZ0yzEhaDL/Ibvu2+XTaH1i+Iklp71Nsdfcnf4fsdZgzEt7ia8G
 lD7gPzHoiKkyeiZl1pdyD9zg06VLzb6FPoUEgnb4d48nOTkV9lcQxo93hKNxKRUzdvE8
 y2HyR2Uu2Tp2h9puFiB649qXoenElVtNVHpqevQP+GFykz9DOzqG4NqB/PrhAugQbDeG
 uEnsw1teCMWYqU8MEICpgvlOllNu+5C4ybGsNyunq38i5usfKZHkZM7uMZr9yf+Q2zYU
 O4XQ==
X-Gm-Message-State: AOAM5314gEFKTrAqIVEJYAALFDYtQReArDp+GzuJq9IpUcoM7fAP8fae
 iUSWArtrlBngwK5/qcBXaf23Z1S9e6k=
X-Google-Smtp-Source: ABdhPJzmAh5/SjUWHWPu758/ev4dKPzxVGiVrJZ/BOwkNbfaSVHQ633ypLHe61p/sGi5rXdoZEkCew==
X-Received: by 2002:adf:cd82:: with SMTP id q2mr21606136wrj.255.1618933657846; 
 Tue, 20 Apr 2021 08:47:37 -0700 (PDT)
Received: from localhost.localdomain ([197.61.162.183])
 by smtp.googlemail.com with ESMTPSA id d5sm25025824wrx.15.2021.04.20.08.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 08:47:37 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] virtiofsd: Changed allocation of lo_map_elems to
 GLib's functions
Date: Tue, 20 Apr 2021 17:46:39 +0200
Message-Id: <20210420154643.58439-5-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420154643.58439-1-ma.mandourr@gmail.com>
References: <20210420154643.58439-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: "open list:virtiofs" <virtio-fs@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced (re)allocation of lo_map_elem structs from realloc() to
GLib's g_try_realloc_n() and replaced the respective free() call
with a g_free().

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 1553d2ef45..b9260c26d4 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -406,7 +406,7 @@ static void lo_map_init(struct lo_map *map)
 
 static void lo_map_destroy(struct lo_map *map)
 {
-    free(map->elems);
+    g_free(map->elems);
 }
 
 static int lo_map_grow(struct lo_map *map, size_t new_nelems)
@@ -418,7 +418,7 @@ static int lo_map_grow(struct lo_map *map, size_t new_nelems)
         return 1;
     }
 
-    new_elems = realloc(map->elems, sizeof(map->elems[0]) * new_nelems);
+    new_elems = g_try_realloc_n(map->elems, new_nelems, sizeof(map->elems[0]));
     if (!new_elems) {
         return 0;
     }
-- 
2.25.1


