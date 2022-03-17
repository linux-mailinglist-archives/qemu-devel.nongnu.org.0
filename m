Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B53B4DBE00
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:13:28 +0100 (CET)
Received: from localhost ([::1]:55768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUiRz-0000p6-3J
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:13:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKi-0000q5-Vv
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:57 -0400
Received: from [2607:f8b0:4864:20::52f] (port=34784
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKg-0002Eh-CB
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:56 -0400
Received: by mail-pg1-x52f.google.com with SMTP id t187so1804819pgb.1
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gt6Df7YFZj3yIOaHOAXNxeneFRB5t2HH9HYYGKeZPd8=;
 b=AoMDWL3RNV8QZvhwtI2r31hnQFnzdBwZXh3sQMQSWeRPUUM64NXQtZC5IOfcAtFWqs
 airz4nRvPBkNf87lk9hrvKsK7BRAO0t4N7ghBtoizbeqWBgKVsJO8jTe/I3Taad6Jsur
 rGQk39/OF8Pdi6eFoURmxpaQaIF8sF8VIJ+XoQK3jwEcTYo5PHroNgb43Y3mi/c/LnhX
 itzL5EIYzrxDd2cW7JRGp35ZrrMt42vb+ae+U8jGZp7bfFZzVPxvCUpexWyoYPjRwfBC
 HWnjOFzu3RcVSD3OnGGKMctkSYWXuMuxj5WSjWdOXwdmxs7ZkrwMrQqDTLA+MUCoJoGu
 awnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gt6Df7YFZj3yIOaHOAXNxeneFRB5t2HH9HYYGKeZPd8=;
 b=wu7y2zZat8mEcrTv59AuCvKTDyiLSYMCOacYiX1vgyiN36xdUJGSPe2Ih6+ezzy7+m
 WEv62/uIR4ABCuj7dS2oJ9kXR20t9+JMmD6b58e1oLGTDAxTR8CEKzfZpBN7tdTADxjC
 PQN1SNRJ+EKYqAqFeuOTSQHLAvXNBFt1IGZYqtr26iXgpZmqoy6jnasM5e0eJbyDm9Kj
 Y6LDBqUiWOJksx0cYSK51mqFTstNWVuFLZj6jrcI7t1lA9nJgelSnprb3Iiu0RCysQk6
 UkUufh/OgH7ehdy40qphg0P9tAUgWnWW4O9zJ3Mya6OQH5Fb5c8OtL+CafEKvCX7m+az
 dC3g==
X-Gm-Message-State: AOAM530F0QwEcIPT9UFw32glzJekqllMOsLlx/S5uA6aeTQW8aC6ejYc
 r5z1F+Zu8+UZ1wMk1geW3B+iZKpb58Sd0g==
X-Google-Smtp-Source: ABdhPJzyihoS1Tcyrrq2gw7etvYBnTtHJkYcQlYXUDn7xzyq8diMGxwBBizk4hs974D7fDXtsdaA3w==
X-Received: by 2002:a63:944:0:b0:374:5324:eea1 with SMTP id
 65-20020a630944000000b003745324eea1mr2307731pgj.366.1647493553084; 
 Wed, 16 Mar 2022 22:05:53 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:05:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 13/51] target/nios2: Use hw/registerfields.h for
 CR_STATUS fields
Date: Wed, 16 Mar 2022 22:05:00 -0700
Message-Id: <20220317050538.924111-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add all fields; retain the helper macros for single bit fields.
So far there are no uses of the multi-bit status fields.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 1bcbc9ed63..ecf8cc929f 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -23,6 +23,7 @@
 
 #include "exec/cpu-defs.h"
 #include "hw/core/cpu.h"
+#include "hw/registerfields.h"
 #include "qom/object.h"
 
 typedef struct CPUArchState CPUNios2State;
@@ -79,15 +80,24 @@ struct Nios2CPUClass {
 
 /* Control register aliases */
 #define CR_STATUS        0
-#define   CR_STATUS_PIE  (1 << 0)
-#define   CR_STATUS_U    (1 << 1)
-#define   CR_STATUS_EH   (1 << 2)
-#define   CR_STATUS_IH   (1 << 3)
-#define   CR_STATUS_IL   (63 << 4)
-#define   CR_STATUS_CRS  (63 << 10)
-#define   CR_STATUS_PRS  (63 << 16)
-#define   CR_STATUS_NMI  (1 << 22)
-#define   CR_STATUS_RSIE (1 << 23)
+
+FIELD(CR_STATUS, PIE, 0, 1)
+FIELD(CR_STATUS, U, 1, 1)
+FIELD(CR_STATUS, EH, 2, 1)
+FIELD(CR_STATUS, IH, 3, 1)
+FIELD(CR_STATUS, IL, 4, 6)
+FIELD(CR_STATUS, CRS, 10, 6)
+FIELD(CR_STATUS, PRS, 16, 6)
+FIELD(CR_STATUS, NMI, 22, 1)
+FIELD(CR_STATUS, RSIE, 23, 1)
+
+#define CR_STATUS_PIE    R_CR_STATUS_PIE_MASK
+#define CR_STATUS_U      R_CR_STATUS_U_MASK
+#define CR_STATUS_EH     R_CR_STATUS_EH_MASK
+#define CR_STATUS_IH     R_CR_STATUS_IH_MASK
+#define CR_STATUS_NMI    R_CR_STATUS_NMI_MASK
+#define CR_STATUS_RSIE   R_CR_STATUS_RSIE_MASK
+
 #define CR_ESTATUS       1
 #define CR_BSTATUS       2
 #define CR_IENABLE       3
-- 
2.25.1


