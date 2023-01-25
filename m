Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46DD67B2E7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 14:02:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKfOs-0002cF-QU; Wed, 25 Jan 2023 08:01:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pKfOf-0002XZ-Nt; Wed, 25 Jan 2023 08:01:08 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pKfOW-0007TW-Rr; Wed, 25 Jan 2023 08:01:00 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso1156104wmc.4; 
 Wed, 25 Jan 2023 05:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t02FRM54QiiL1KMyr24MelBP+lEUcbY35sk426ekZB4=;
 b=bis3miJPU464uOeuau7Gx4RsHqD4qcjUDtUgG3eGz7aI5CkjgaeAYKk5V7lDAyqmXW
 JdH6I8BPP3WidDwACMXXrJmPyRHbY82xSUWn3BE8t1l+G6Yf+59KUSuFIJfMyXaEMqfk
 RM+wCfqf998fqmFUhB3LlEOQNp+3JCRce4adeWhiGPAJzKMwFKkHUeqRsqdVMZ+9Yjjx
 n3ArJbv04hkv9Dix0L5irSBIchIvok0vMv7zJoLMSDp8/T7M36qTRAwJpjE8m/g0zyAG
 IYTimsaZ42rx49W+DYpTqKdj+5x8cv61XoHci5mppJ0antZchQRQLjikK5ZmHv9rvfHf
 Uf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t02FRM54QiiL1KMyr24MelBP+lEUcbY35sk426ekZB4=;
 b=JGxOfCZ0g8zfjD2RJYeKLW5Bvf5fEsl/qxt7Gmi3aFfvUFJTXne+4sQMA0G4OBmanR
 M8TKajSW0jyK8YHADztcDwDMTZwedZqmKV/3VqPjvhLU1irdwMX2lB66pwxZdKS3h0dT
 CmOgSJy5ELcV/nuXkNbOWhy7xmQ1a3mb9TRNL/G5sL+0mTvFA4/4qAsyVHZGgRLDGuyE
 /gDhbh0s+EgVnafjeqtQiy47RySKSZl9lRo7BYVSDIeLBXAFqE+o3czx295pKrCnYYNQ
 ejyS/YvW0R3byeYJDpoHCR4M4+0sEgznozbdSC8DhQITDRsRjqgu/vp0LVpjdafpb+SB
 ORcA==
X-Gm-Message-State: AFqh2krWx+RAaUyt9wKUT5/nUO64ABxPSsrKgQ+sEfKYmBxUQPXSWjhW
 9482iC7XkJMjjt1t0fCyDx0fmoU3m0l24w==
X-Google-Smtp-Source: AMrXdXsJpiIyLvT0V50OcCg47F3Pqqorcx6AEZ8+RFeDc75W05h47yF/qTXiDh2iP1t/NTkWo4kx0A==
X-Received: by 2002:a05:600c:310e:b0:3db:eb0:6f6 with SMTP id
 g14-20020a05600c310e00b003db0eb006f6mr28361253wmo.13.1674651648787; 
 Wed, 25 Jan 2023 05:00:48 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a05600c384f00b003d9de0c39fasm2078828wmr.36.2023.01.25.05.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 05:00:48 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/4] hw/ppc: Set machine->fdt in e500 machines
Date: Wed, 25 Jan 2023 14:00:21 +0100
Message-Id: <20230125130024.158721-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125130024.158721-1-shentey@gmail.com>
References: <20230125130024.158721-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This enables support for the 'dumpdtb' QMP/HMP command for all
e500 machines.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/e500.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 9fa1f8e6cf..7239993acc 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -659,9 +659,14 @@ done:
     if (!dry_run) {
         qemu_fdt_dumpdtb(fdt, fdt_size);
         cpu_physical_memory_write(addr, fdt, fdt_size);
+
+        /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+        g_free(machine->fdt);
+        machine->fdt = fdt;
+    } else {
+        g_free(fdt);
     }
     ret = fdt_size;
-    g_free(fdt);
 
 out:
     g_free(pci_map);
-- 
2.39.1


