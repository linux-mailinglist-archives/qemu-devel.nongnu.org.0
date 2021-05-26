Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6325D392363
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:50:46 +0200 (CEST)
Received: from localhost ([::1]:59710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3IS-0000AI-Pw
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FH-0005bF-LB
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:27 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3F9-0004S3-Lf
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:26 -0400
Received: by mail-pf1-x432.google.com with SMTP id p39so2206395pfw.8
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ctF8jI1PInVtqpUhepZanIEwZw+6zytZ0vAzr9xJPtk=;
 b=PFpX273T5S9DW9mYxZkh0PWBtKf4hHYjOEiTHmzfozmBZOy0tO8V/zzwx30xnDQOy8
 vXp3nfusgbFK/zxVd5rMgi7PHCDqTvxvMTXSkq0GqUKLoHpDBBLWbIMWWqCD3J0f/eXL
 NO91gYcL/lmJd53lx0a3l5VIFf1C5dgHz3u8tcjI6guPDRL3BAbo3rqhbP+Ava/LbzI1
 y5/C2DB+QjDgXZPYdlM9XxgQqklaaziW1a1Ag2BW2Gl1tipl1Zu5Fl1Y7hNVRgQ6w6BR
 ew6QPT4HM1VHOcGh0LAl7+nMu/9m54kWEjHUQ95AoURcL1bePVid9TjlUR0YSxYguox0
 WP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ctF8jI1PInVtqpUhepZanIEwZw+6zytZ0vAzr9xJPtk=;
 b=VIRiXNbvndBVbix5Cd68n7FERuVxcl6FQdu779nixrFThRphnlyXa2VfbuzkbOpQMn
 W5mWkx6jx4NVVlb6IKIJABtSqH1iaVNsAwUItsyxWq6g6Mz8ZvGSWEFHnqQ3js5ynNVD
 qiOIsGLp12RXWVNi3qtir83NSesFnGIyG99TeQI2sSvr6fUTehfyv4v8bxjPd+XziHYJ
 ksz/TgSDoVkHoyUQsXHRf0xMTgVrLTDs6OVYJ0XlnEM54pRU3Ksr6j1o2XvIJnVJUclV
 FTBTFs1qluQ8Z8uMD00SKlU1+08jcukX1GvUmlmX/EiSj6AoH/IyeeAEzdtKK05QsYuZ
 bCMA==
X-Gm-Message-State: AOAM533E1GfBrOFqHUGKyaLKrLS70pNKN3mI7e19Gr7H1kG07Kyn3gJg
 dm3CfFiC70WZYsZ1YLZdcvzIWpgcfm9wag==
X-Google-Smtp-Source: ABdhPJz7ugI3BrpN3ibn1+IyxDoD/S0vTw2VtClLI6zcuD/BJqkFYp8jNcwhZExCaX6CLu3iZH3cAQ==
X-Received: by 2002:a63:3e4d:: with SMTP id l74mr995274pga.257.1622072836405; 
 Wed, 26 May 2021 16:47:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/31] exec/memory_ldst_phys: Use correct type sizes
Date: Wed, 26 May 2021 16:46:43 -0700
Message-Id: <20210526234710.125396-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use uint8_t for (unsigned) byte, and uint16_t for (unsigned)
16-bit word.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210518183655.1711377-5-philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memory_ldst_phys.h.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/exec/memory_ldst_phys.h.inc b/include/exec/memory_ldst_phys.h.inc
index 4033795add..ecd678610d 100644
--- a/include/exec/memory_ldst_phys.h.inc
+++ b/include/exec/memory_ldst_phys.h.inc
@@ -20,7 +20,7 @@
  */
 
 #ifdef TARGET_ENDIANNESS
-static inline uint32_t glue(lduw_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
+static inline uint16_t glue(lduw_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
 {
     return glue(address_space_lduw, SUFFIX)(ARG1, addr,
                                             MEMTXATTRS_UNSPECIFIED, NULL);
@@ -38,7 +38,7 @@ static inline uint64_t glue(ldq_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
                                            MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
-static inline void glue(stw_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
+static inline void glue(stw_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint16_t val)
 {
     glue(address_space_stw, SUFFIX)(ARG1, addr, val,
                                     MEMTXATTRS_UNSPECIFIED, NULL);
@@ -56,19 +56,19 @@ static inline void glue(stq_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint64_t val)
                                     MEMTXATTRS_UNSPECIFIED, NULL);
 }
 #else
-static inline uint32_t glue(ldub_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
+static inline uint8_t glue(ldub_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
 {
     return glue(address_space_ldub, SUFFIX)(ARG1, addr,
                                             MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
-static inline uint32_t glue(lduw_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
+static inline uint16_t glue(lduw_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
 {
     return glue(address_space_lduw_le, SUFFIX)(ARG1, addr,
                                                MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
-static inline uint32_t glue(lduw_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
+static inline uint16_t glue(lduw_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
 {
     return glue(address_space_lduw_be, SUFFIX)(ARG1, addr,
                                                MEMTXATTRS_UNSPECIFIED, NULL);
@@ -98,19 +98,19 @@ static inline uint64_t glue(ldq_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
                                               MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
-static inline void glue(stb_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
+static inline void glue(stb_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint8_t val)
 {
     glue(address_space_stb, SUFFIX)(ARG1, addr, val,
                                     MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
-static inline void glue(stw_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
+static inline void glue(stw_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint16_t val)
 {
     glue(address_space_stw_le, SUFFIX)(ARG1, addr, val,
                                        MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
-static inline void glue(stw_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
+static inline void glue(stw_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint16_t val)
 {
     glue(address_space_stw_be, SUFFIX)(ARG1, addr, val,
                                        MEMTXATTRS_UNSPECIFIED, NULL);
-- 
2.25.1


