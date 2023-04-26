Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543E96EF399
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 13:45:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prdZb-0007Hk-7W; Wed, 26 Apr 2023 07:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mnissler@rivosinc.com>)
 id 1prbZ1-00039c-3Q
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 05:35:52 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mnissler@rivosinc.com>)
 id 1prbYl-0008Bm-52
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 05:35:37 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1a66b9bd7dfso72169035ad.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 02:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682501733; x=1685093733; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EnBNKPl5c9zSg2lI4GIRXwC8cVmuK2waM8zKNWabKqI=;
 b=Io4orK03TGQ+OuvybbrMK+ZvTbYZu3RmiHuyXaYuDqlE/iUySBOjzfw7fmN7X6fRih
 H3nQFSKcSAwzNUqD5y1tqyecF4wtdBgOFLozqhVus6SK88S9gLt8HDb2H/oz795oRUy4
 bHDG0G9EEXh7RQZCpE+zz30cg57B6MP6VMslF4JVUFuwXeWx0ZXZu/Yba1eonBBcn2DJ
 zCgRtjzBTT4QzUciWjcScAZqADzfJuVfw2HxA/fzLrenFNdQ+NZeOUhoGKFqPAjwDvXL
 3EHWQNi/c8j7ywQvUdKYbqohEKqI9mIYpoBI73FiTq7KvTAPmLkGNT93fzc6yruoHe7I
 t0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682501733; x=1685093733;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EnBNKPl5c9zSg2lI4GIRXwC8cVmuK2waM8zKNWabKqI=;
 b=MCct0YnBRMrh4TXeYazTPdZ61HeDFHdqatXOBY9WWd/+IQ8Ko1E2QOfLdTYcw76iDP
 Ta2IvB1/BIMsGnf5kwTBfKX76pzHLfhsJrINNkv5d2zsBzcYjLHnah2Y/XdmS8iWT8Vx
 3F2WMi7byEeS772s00CPERBXAHpqHNlDwZ/FjqdyEWciEaYNg3+v9FSG+rFda/uyGP1J
 6vgqfZyQM+Alt1ddLVFYLOswfMaWs5ch3N8oVuxywrO6XS/XB/mW2LgOaZH/RZOMravH
 xlTDwehIgUYvOCFMWNK6l3jhiOu61JID08SmcogtZV8KLfawfqT1hoztrUOeI1OpAH9r
 R9hQ==
X-Gm-Message-State: AAQBX9fTCkGVY0NlEpVpmw7yZXVyAniao912c9tOwWTUpx+kRx7yG3zp
 0I2KNcYg56ul4uOeSBH/xL7Usg==
X-Google-Smtp-Source: AKy350bW+hm9TYgoOHd34XXHQ3ylJB1/ULXA9pAzxSghX8e5nnjsGVo6jVL2YbXY5mVEzalwaHvdRg==
X-Received: by 2002:a17:902:cec9:b0:1a5:253f:ace7 with SMTP id
 d9-20020a170902cec900b001a5253face7mr25220858plg.29.1682501733005; 
 Wed, 26 Apr 2023 02:35:33 -0700 (PDT)
Received: from mnissler.ba.rivosinc.com (mnissler.eu.rivosinc.com.
 [162.19.61.220]) by smtp.gmail.com with ESMTPSA id
 n4-20020a1709026a8400b001a69b28f5c5sm9522741plk.222.2023.04.26.02.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 02:35:32 -0700 (PDT)
From: Mattias Nissler <mnissler@rivosinc.com>
To: Jagannathan Raman <jag.raman@oracle.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Mattias Nissler <mnissler@rivosinc.com>
Subject: [PATCH] hw/remote: Fix vfu_cfg trace offset format
Date: Wed, 26 Apr 2023 09:35:18 +0000
Message-Id: <20230426093518.966397-1-mnissler@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=mnissler@rivosinc.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 26 Apr 2023 07:44:31 -0400
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

The printed offset value is prefixed with 0x, but was actually printed
in decimal. To spare others the confusion, adjust the format specifier
to hexadecimal.

Signed-off-by: Mattias Nissler <mnissler@rivosinc.com>
---
 hw/remote/trace-events | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index c167b3c7a5..0d1b7d56a5 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -5,8 +5,8 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 
 # vfio-user-obj.c
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
-vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
-vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
+vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%x -> 0x%x"
+vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%x <- 0x%x"
 vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %zu bytes"
 vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
 vfu_bar_register(int i, uint64_t addr, uint64_t size) "vfu: BAR %d: addr 0x%"PRIx64" size 0x%"PRIx64""
-- 
2.25.1


