Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF1A61DFFF
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 03:39:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orVXo-00008r-B5; Sat, 05 Nov 2022 22:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orVXm-00008Z-Ao
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 22:37:54 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orVXk-0003K7-Kx
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 22:37:54 -0400
Received: by mail-pf1-x434.google.com with SMTP id b29so7721286pfp.13
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 19:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fVCbfw0csIXiWDQ0FsOhbz/g5Esc2yTlzzD2ayr9qL0=;
 b=oyixP5DpzWiRo0ifM8QOISfUEqHQ/94x0fj6H2oaPLom420TGK+ytB8CDvbR0kcJ0J
 NkFMXJxDJiOkkMi/10vEvTCdvAqD3PnwI5VqF66fyTXyZ540c1YbqpbnoabvP/kvLqQD
 c758ZGBdJozt4y5wUqj0E7V+oct6QiyjcjrYnURkiV1pPkEqk7on7iTAHSYXbgWDFm/I
 xYySCH8siycmZljljuhxqRdWezqxA0ajlZjU3wUU2sBtN1DX01oDab2TDITQJ8RqtD81
 /yiV8ZjhIlbqN+fVkxL+huO6D1So3do9zN+66reu77dPI0tHMhRhNehxk5JDDouICR68
 lFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fVCbfw0csIXiWDQ0FsOhbz/g5Esc2yTlzzD2ayr9qL0=;
 b=Nx0nmxyz08TKG5b76yr5eLy4J+s8lg1ACTCxNUJe0bI4VrU1Mma3uoDL3gSSAGlVZf
 ZVw6HEvM7JGVt8ZGOKCAN1Rrne09k2KOWgjbezBm612AIws+C5rYho8KNYNJ9X5i/df0
 Kk9PLu32oxnTy4VW5x/UfYTAit7959tk2hIcNX5INtXg/CmzcGQXPLeMQycfxJ/Lorjf
 BawefaLvZ4qR5M/RzNgBv3Nl3vMmVbenkRuO7X0i9M8pQyH85KR1GrnvxVZ9/Kceyxsm
 CZMABwClkSJY1oTv2n0NSOBlGyu2/yVAWkQsCBI+JedPB6NPmnjnuzmumbxKTJvoSPbj
 /XKg==
X-Gm-Message-State: ACrzQf2ouPEK7nPyiFAVYByG4Rt6yUcK4j4QC1jwdlDoQ7D8H94icB3l
 ihrjzQ+w6AQB6rEkih4ScXFjzx8++xYZdJaJ
X-Google-Smtp-Source: AMsMyM7w8WO40xRK1Uk8jtRCYbmcjwvxkfWzIHPYTH6rs+QTgtsYv8JupXGWQgU/sMMwZhqaxz8lIg==
X-Received: by 2002:a05:6a00:cc6:b0:56d:3028:23ea with SMTP id
 b6-20020a056a000cc600b0056d302823eamr39449193pfv.19.1667702271075; 
 Sat, 05 Nov 2022 19:37:51 -0700 (PDT)
Received: from localhost.localdomain ([2001:8003:d918:7a00:e617:679e:af7:63d])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a170902d19500b0018862bb3976sm2259457plb.308.2022.11.05.19.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 19:37:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	sw@weilnetz.de
Subject: [RESEND PATCH 3/6] disas/nanomips: Split out read_u16
Date: Sun,  6 Nov 2022 13:37:32 +1100
Message-Id: <20221106023735.5277-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106023735.5277-1-richard.henderson@linaro.org>
References: <20221106023735.5277-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Split out a helper function for reading a uint16_t
with the correct endianness.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/nanomips.c | 48 +++++++++++++++++++-----------------------------
 1 file changed, 19 insertions(+), 29 deletions(-)

diff --git a/disas/nanomips.c b/disas/nanomips.c
index 5438def9af..52c7537379 100644
--- a/disas/nanomips.c
+++ b/disas/nanomips.c
@@ -21919,10 +21919,24 @@ static bool nanomips_dis(char **buf, Dis_info *info, uint16_t words[3])
     return ret >= 0;
 }
 
+static bool read_u16(uint16_t *ret, bfd_vma memaddr,
+                     struct disassemble_info *info)
+{
+    int status = (*info->read_memory_func)(memaddr, (bfd_byte *)ret, 2, info);
+    if (status != 0) {
+        (*info->memory_error_func)(status, memaddr, info);
+        return false;
+    }
+
+    if ((info->endian == BFD_ENDIAN_BIG) != HOST_BIG_ENDIAN) {
+        bswap16s(ret);
+    }
+    return true;
+}
+
 int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
 {
-    int status, length;
-    bfd_byte buffer[2];
+    int length;
     uint16_t words[3] = { };
     g_autofree char *buf = NULL;
 
@@ -21940,48 +21954,24 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
     disassm_info.fprintf_func = info->fprintf_func;
     disassm_info.stream = info->stream;
 
-    status = (*info->read_memory_func)(memaddr, buffer, 2, info);
-    if (status != 0) {
-        (*info->memory_error_func)(status, memaddr, info);
+    if (!read_u16(&words[0], memaddr, info)) {
         return -1;
     }
-
-    if (info->endian == BFD_ENDIAN_BIG) {
-        words[0] = bfd_getb16(buffer);
-    } else {
-        words[0] = bfd_getl16(buffer);
-    }
     length = 2;
 
     /* Handle 32-bit opcodes.  */
     if ((words[0] & 0x1000) == 0) {
-        status = (*info->read_memory_func)(memaddr + 2, buffer, 2, info);
-        if (status != 0) {
-            (*info->memory_error_func)(status, memaddr + 2, info);
+        if (!read_u16(&words[1], memaddr + 2, info)) {
             return -1;
         }
-
-        if (info->endian == BFD_ENDIAN_BIG) {
-            words[1] = bfd_getb16(buffer);
-        } else {
-            words[1] = bfd_getl16(buffer);
-        }
         length = 4;
     }
 
     /* Handle 48-bit opcodes.  */
     if ((words[0] >> 10) == 0x18) {
-        status = (*info->read_memory_func)(memaddr + 4, buffer, 2, info);
-        if (status != 0) {
-            (*info->memory_error_func)(status, memaddr + 4, info);
+        if (!read_u16(&words[1], memaddr + 4, info)) {
             return -1;
         }
-
-        if (info->endian == BFD_ENDIAN_BIG) {
-            words[2] = bfd_getb16(buffer);
-        } else {
-            words[2] = bfd_getl16(buffer);
-        }
         length = 6;
     }
 
-- 
2.34.1


