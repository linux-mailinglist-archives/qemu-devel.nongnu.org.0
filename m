Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD58F620469
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 01:03:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osC1P-0004ct-K4; Mon, 07 Nov 2022 18:59:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC1N-0004aT-Hb
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:59:17 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC1K-0003kJ-SC
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:59:17 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 t25-20020a1c7719000000b003cfa34ea516so66461wmi.1
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gXmxo1kjGmtXOhxUFDk8t3GYFlQJ+qLlWyywD7kVNkI=;
 b=VDZY4cVfy65VRjdtSRVUMNxzdJ6E3JgPhurIGo7OGr7cqLvTjRtQZgBZiJ3LNC27+8
 wlXbZM+AmflbhnkDAVHvrkjTWAV5Z272+C/pEAELIO3t59QxNBwsWzjzRnwiMblILD1n
 w7hFYgAOVMGSQL8BfFMP5ozzu2gC7O2gLdhO8N+8vOlDf1i/CqllGJg1be7KAZye4zd9
 B45H6r9fqWDJC1TFuRPtTpI59SbX803qgvSbGqUyJyYMMnIfF7CwSF4LVbU40gLQfIOF
 C4PnifJiaCQbO4wTtCpCohQyenmqqrqGsgLPPyrODZM6MQMbU0lL5pzdDRugg9IGt/X9
 FDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gXmxo1kjGmtXOhxUFDk8t3GYFlQJ+qLlWyywD7kVNkI=;
 b=krmGUI+wDQfnVNH8TQYPXrq63zGGMIaiRfLo7CxvPCbode5p6b35xaAExp575pIBRS
 UwPgForaSpRdEICi25Cy8CgPTh8yCtEkJ/pNaZbExn6sqxb6e2vDlxMGis5JlR9MEmWE
 RrYQ4VXhAtq8Fc6QYALH17i21RhTkG1YZingWHSPr4jPYozfJC8SEh0zUUb1lTe4ReSB
 NEqFaPjxOTqhhMKfBRTvKB4CJ10DOkJd77SodpdxNHoEYbnXrokHn5oaANL6FXv4ORXP
 yNKrqoAoKykJ0Zk5XB04jm2UOOB0wWNSYNusf+wOaKmnjdmD9Qnz9f0xb1lBtzjOxWiJ
 4JDQ==
X-Gm-Message-State: ACrzQf3xUgKkFcoFYu3eL83V51E2wZL1xOCGFJISdeIRjjDaXKZ6IgLL
 5eyXy6jdrKL/MpAAvpLYuSqSHZ6Zkedrpw==
X-Google-Smtp-Source: AMsMyM76SOpZ/FD/P915sU5vAuOR6qg6HOq03VAiwNB/hRtZqwXhvsk18/g3Kf4GKzUGi9oDHXY65g==
X-Received: by 2002:a05:600c:554b:b0:3cf:84ea:3097 with SMTP id
 iz11-20020a05600c554b00b003cf84ea3097mr21469001wmb.100.1667865553178; 
 Mon, 07 Nov 2022 15:59:13 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c468d00b003cf75213bb9sm14019558wmo.8.2022.11.07.15.59.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 15:59:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 10/14] disas/nanomips: Move setjmp into nanomips_dis
Date: Tue,  8 Nov 2022 00:58:18 +0100
Message-Id: <20221107235822.71458-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235822.71458-1-philmd@linaro.org>
References: <20221107235822.71458-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Richard Henderson <richard.henderson@linaro.org>

Reduce the number of local variables within the scope of the
setjmp by moving it to the existing helper.  The actual length
returned from Disassemble is not used, because we have already
determined the length while reading bytes.  Fixes:

nanomips.c: In function ‘print_insn_nanomips’:
nanomips.c:21925:14: error: variable ‘insn1’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
nanomips.c:21925:25: error: variable ‘insn2’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
nanomips.c:21925:36: error: variable ‘insn3’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
nanomips.c:21926:22: error: variable ‘buf’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221106212852.152384-2-richard.henderson@linaro.org>
---
 disas/nanomips.c | 42 +++++++++++++++++-------------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/disas/nanomips.c b/disas/nanomips.c
index 821d4f8832..83a39a878c 100644
--- a/disas/nanomips.c
+++ b/disas/nanomips.c
@@ -21907,22 +21907,24 @@ static const Pool MAJOR[2] = {
        0x0                 },        /* P16 */
 };
 
-static int nanomips_dis(char **buf,
-                 Dis_info *info,
-                 unsigned short one,
-                 unsigned short two,
-                 unsigned short three)
+static bool nanomips_dis(char **buf, Dis_info *info,
+                         unsigned short one,
+                         unsigned short two,
+                         unsigned short three)
 {
     uint16 bits[3] = {one, two, three};
-
     TABLE_ENTRY_TYPE type;
-    int size = Disassemble(bits, buf, &type, MAJOR, 2, info);
-    return size;
+
+    /* Handle runtime errors. */
+    if (unlikely(sigsetjmp(info->buf, 0) != 0)) {
+        return false;
+    }
+    return Disassemble(bits, buf, &type, MAJOR, ARRAY_SIZE(MAJOR), info) >= 0;
 }
 
 int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
 {
-    int status;
+    int status, length;
     bfd_byte buffer[2];
     uint16_t insn1 = 0, insn2 = 0, insn3 = 0;
     g_autofree char *buf = NULL;
@@ -21952,6 +21954,7 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
     } else {
         insn1 = bfd_getl16(buffer);
     }
+    length = 2;
     (*info->fprintf_func)(info->stream, "%04x ", insn1);
 
     /* Handle 32-bit opcodes.  */
@@ -21967,6 +21970,7 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
         } else {
             insn2 = bfd_getl16(buffer);
         }
+        length = 4;
         (*info->fprintf_func)(info->stream, "%04x ", insn2);
     } else {
         (*info->fprintf_func)(info->stream, "     ");
@@ -21984,27 +21988,15 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
         } else {
             insn3 = bfd_getl16(buffer);
         }
+        length = 6;
         (*info->fprintf_func)(info->stream, "%04x ", insn3);
     } else {
         (*info->fprintf_func)(info->stream, "     ");
     }
 
-    /* Handle runtime errors. */
-    if (sigsetjmp(disassm_info.buf, 0) != 0) {
-        info->insn_type = dis_noninsn;
-        return insn3 ? 6 : insn2 ? 4 : 2;
+    if (nanomips_dis(&buf, &disassm_info, insn1, insn2, insn3)) {
+        (*info->fprintf_func) (info->stream, "%s", buf);
     }
 
-    int length = nanomips_dis(&buf, &disassm_info, insn1, insn2, insn3);
-
-    /* FIXME: Should probably use a hash table on the major opcode here.  */
-
-    (*info->fprintf_func) (info->stream, "%s", buf);
-    if (length > 0) {
-        return length / 8;
-    }
-
-    info->insn_type = dis_noninsn;
-
-    return insn3 ? 6 : insn2 ? 4 : 2;
+    return length;
 }
-- 
2.38.1


