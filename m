Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10D361E697
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 22:31:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ornCa-0005No-A9; Sun, 06 Nov 2022 16:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ornCY-0005Ng-Kg
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:29:10 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ornCX-0004Gq-1u
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:29:10 -0500
Received: by mail-pg1-x530.google.com with SMTP id q71so8816324pgq.8
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 13:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nk8lCwSmvBcjlSVkJj4h966ydBsW/gSF/eHtEZq0kPc=;
 b=hMJEoVgbZgClGshFsdYRkhdBv1qcspafZHSCdvuewqM/rWLjaCuYIqdC+zK3CEncPr
 7WlHsFcpsbpkqQHTGaf8qJbGxbR9Uu7m4P4Zb8+Mehh3JZjoSNqtkk8cVQyN7N7lIB0s
 1A801UJtyrjnRyTxgfcvxCyutnasnVL7KY9XqgEHRm99FbhglyYl6qPv6/XOOtTu7APW
 wqMxCZHzBbVoluzAJLLiBpbzAuD9TZjF/8hwzpUHSSXym20IHQykh+Fsp4A1cNGyg8Y8
 WW9hyi5atXTE9l6IW2UbOgo46FWdrOgtp5/FWo2TyUWTHXrR94vTDgs8XALA2cRxyevN
 fPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nk8lCwSmvBcjlSVkJj4h966ydBsW/gSF/eHtEZq0kPc=;
 b=gZgGGZRbPR+NP4SH335wwb7CAegbT4pHh2VbNvtcbplmg+OprfzNWe0X5F80GQgZdG
 YU7ARxeQtRwiU1TLcK+B001f1hHyeD9FyPIBNS1L7TS0iPpWiMZksM5ePv5k+tnGU937
 O8UCi1/PtblWjgbRlPihkpuVyzg9IlldyrcI5g9zL7oELzMoroKAkGPOL37xAFOAXU5I
 q2fRZr5OjMPVSZgFiS6xVJxQhXCAkbvB92/8fHVEkKuHFd+f1+fth9bvJgO+soZ5vqpN
 grB06aiXNmmeam7qYBRvcN20cNf/Rxc4oupxJO22V9Y9pEYJV+24o8dbWAjkk0rTZX0D
 stTw==
X-Gm-Message-State: ACrzQf0nOd4RLW3ppOI/+Qr6FEAAe1keHkMXJ32fBmieoU5mvWSQq5E0
 +mg0oV7J48Qq5nB0k02QrIRw2hQq3AwYVoKm
X-Google-Smtp-Source: AMsMyM78MHMib8dpQMSbm5ZEvCsht6DnfZsP8UcQhMZz08zCak9kYyTLTcZZdX4EMhUoycVK8AXAZg==
X-Received: by 2002:a65:6a0f:0:b0:46e:f67c:bcee with SMTP id
 m15-20020a656a0f000000b0046ef67cbceemr40587576pgu.38.1667770147558; 
 Sun, 06 Nov 2022 13:29:07 -0800 (PST)
Received: from localhost.localdomain ([2001:8003:d918:7a00:f28:fa55:3b51:3624])
 by smtp.gmail.com with ESMTPSA id
 20-20020a621914000000b00563ce1905f4sm2998746pfz.5.2022.11.06.13.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 13:29:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: balaton@eik.bme.hu,
	philmd@linaro.org,
	sw@weilnetz.de
Subject: [PATCH v2 3/6] disas/nanomips: Split out read_u16
Date: Mon,  7 Nov 2022 08:28:49 +1100
Message-Id: <20221106212852.152384-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106212852.152384-1-richard.henderson@linaro.org>
References: <20221106212852.152384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Split out a helper function for reading a uint16_t
with the correct endianness.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/nanomips.c | 48 +++++++++++++++++++-----------------------------
 1 file changed, 19 insertions(+), 29 deletions(-)

diff --git a/disas/nanomips.c b/disas/nanomips.c
index 1645d6d7aa..717fafb739 100644
--- a/disas/nanomips.c
+++ b/disas/nanomips.c
@@ -21916,10 +21916,24 @@ static bool nanomips_dis(const uint16_t *data, char **buf, Dis_info *info)
     return Disassemble(data, buf, &type, MAJOR, ARRAY_SIZE(MAJOR), info) >= 0;
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
 
@@ -21937,48 +21951,24 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
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


