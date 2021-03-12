Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C796339712
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 20:06:30 +0100 (CET)
Received: from localhost ([::1]:52602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKn7F-00013T-3Q
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 14:06:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKmXM-0006E9-Gh; Fri, 12 Mar 2021 13:29:24 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:53120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKmXK-0005Bq-SA; Fri, 12 Mar 2021 13:29:24 -0500
Received: by mail-wm1-x32b.google.com with SMTP id d191so4349753wmd.2;
 Fri, 12 Mar 2021 10:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7eAW6nzndJ8SRLf0zYMWILankRA6VcV8J/YafiY9oXc=;
 b=FI6l6XSJzAjCcMe7tv4CLouB+9PJdZqR0BUgFK+y7dF/knVZRKZCVtWZCXlCSXAbLK
 nBqQYZ2PPNWvIydrKFVEJAhCHB2djN6EpsdKjYf69NTyXcipOhV58PFrUkVSJs2G/jZB
 Bfrto53rudP4ooShM7hIxSPxuQTsImq7Wq11YfRWhy5VIQNiMIotDDqzcJb8n2lxapPW
 rXMhgUPqqfbT03pCtc+TwfnETgT5s0ZZuRVcZn+hbewT8ryoXTudb3Lm4Ox9XMixMrd3
 f06eYAk+ylIAgv6M4Hmc3j/6cYLwlgYorL0Pw+nxxSacTV7CqdKgFeJRlL+gpJf7o6i/
 eF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7eAW6nzndJ8SRLf0zYMWILankRA6VcV8J/YafiY9oXc=;
 b=FHfCviMIpY1zzgRErtexU/Hs1GBM0G6/MBgUCj+mVnUPz1BhWj3dTKNGc+VUvPKXal
 6fkYwj/zr+jIFWiTcqg3dfNHeuGFLyYnOwTvl3F7CPPG5XnwZyTu/o/5Kiz3gE0NxlS9
 EMePv5WKofs8QXurBgVr55kqi9zXTUm0JkH+pnvri5P5wkIGXCdKXie4m1MTmTJHkfe6
 6aL1VGia+YgT+QgPYc/pfqxPz0rbWYcpO5EOrnnu98i6kWSt4STXFhfGhT09lBQCV7XN
 TVLB+6UsC0+0wsYK6+SfkBR0ofBYPgRV/XONIIy4oVt4ukFtUHT5ejhmWTWwgPBFvCjS
 j6+g==
X-Gm-Message-State: AOAM533QWHYHhlBtPnr/8xgelfCFuVp095ARppjdslIIbrXmsuJDZiOZ
 YBLDyBMs4AfIjQYjw7ZWqstOB8RjTak=
X-Google-Smtp-Source: ABdhPJxtD4Q5mbcqFrFpTUAWmhr5KZnz9Cjo4IvOjeui6TuYcoX2s5UfUcgNaP7LHMxtNG9ha6vrCg==
X-Received: by 2002:a1c:67d6:: with SMTP id
 b205mr14538656wmc.118.1615573760597; 
 Fri, 12 Mar 2021 10:29:20 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p14sm2968968wmc.30.2021.03.12.10.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 10:29:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] memory: Make sure root MR won't be added as subregion
Date: Fri, 12 Mar 2021 19:28:51 +0100
Message-Id: <20210312182851.1922972-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312182851.1922972-1-f4bug@amsat.org>
References: <20210312182851.1922972-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Greg Kurz <groug@kaod.org>, Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Add a bool for MR to mark whether this MR is a root MR of an AS.  We bail out
asap if this MR is added as a subregion of another MR.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/exec/memory.h | 1 +
 softmmu/memory.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 54ccf1a5f09..8137ad3a9f6 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -477,6 +477,7 @@ struct MemoryRegion {
     bool ram_device;
     bool enabled;
     bool warning_printed; /* For reservations */
+    bool is_root_mr;
     uint8_t vga_logging_count;
     MemoryRegion *alias;
     hwaddr alias_offset;
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 9db47b7db6b..ce322ff3d6e 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2442,6 +2442,7 @@ static void memory_region_add_subregion_common(MemoryRegion *mr,
                                                MemoryRegion *subregion)
 {
     assert(!subregion->container);
+    assert(!subregion->is_root_mr);
     subregion->container = mr;
     subregion->addr = offset;
     memory_region_update_container_subregions(subregion);
@@ -2819,6 +2820,7 @@ void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name)
 {
     memory_region_ref(root);
     as->root = root;
+    root->is_root_mr = true;
     as->current_map = NULL;
     as->ioeventfd_nb = 0;
     as->ioeventfds = NULL;
-- 
2.26.2


