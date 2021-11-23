Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEFF45AA29
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:39:52 +0100 (CET)
Received: from localhost ([::1]:60648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpZln-0006Uo-L6
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:39:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZk9-0003xt-7g
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:09 -0500
Received: from [2a00:1450:4864:20::42a] (port=35652
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZk7-0004zO-TT
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:08 -0500
Received: by mail-wr1-x42a.google.com with SMTP id i5so40358502wrb.2
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=npTV63kmQYBDZvVZZRKo6vQ+WQa403g9CWt7bYXbgz0=;
 b=hmcqVU1tcSwG9ThiJHTiOs3CT/fGG3XjrzF1q4l73h0KxxMtGSkDWnJkcipsFkhSC6
 WyZpw0tbkypu3Y4MD3qkCeYyBx1icJpAlkwpgI1CKwqmyaiqtH+jir1EVxLSEvhIFhja
 L0e/dFkEnyhRXpv5UUDubCTd/njNAOKIuaHfbaHwKv3gOIaEMoDthRegtzUsOqJQCIKV
 2GqQbPQwq+pYFfiCJElLHCOdJ+VUiPo7p2As6jYFRYlSdMY2aqEXGazFp0J4pqlQkkyM
 Rzf3b9Z8oBczoKLFKlaxTvv6/0lkXPLeySpBygg5ghkkCpzM220zRw/k2usjATec4DYz
 oKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=npTV63kmQYBDZvVZZRKo6vQ+WQa403g9CWt7bYXbgz0=;
 b=GPAF+IKVkOkB/fbSFu+brvnwZ2V1zv2DKw4JdWwd37kahA1m/1+9B4olcsZEL9WDSn
 zohxCK/VytMn6b6DwX9WJoIUs34kFUCKyjPbGDtsk8tNrfJsjPGxY8GklHv5tAZRt1wv
 DGk1UmpmOfctnG0mAPtx7fno6JDFvLCVsC3zvhxQ7fuuK4O9X8yZgMVDrvLvdo6jS7sn
 B5vH8SUwoOlDIxAPBG5xbHNCW878c/pAaVmjJKQCrvnHrQfDL5y5ZPOCLh3RV6hTypak
 +/2izlbcjEGcLK+YR/3vvX7FILgCB5g5IRVvePTJkET4N3lQMjAleIwSnk3u/ZK5pi/d
 /Qug==
X-Gm-Message-State: AOAM5330/KJnzwqiLkGMIwBqFKCac2kw+NXN5ovNAvfTGj0Fpo/IfXkc
 zlBV+twzbFU2bnyyuEZhAexu3HONY9wumxFSbTw=
X-Google-Smtp-Source: ABdhPJzg4N8rHybRJhu/HVzrPCo4mdN8iHePM5qpn6hRhUbRtOzQAeBsy4wvKwACFvTIS3EGtxr2sA==
X-Received: by 2002:a05:6000:168e:: with SMTP id
 y14mr8102087wrd.331.1637689086593; 
 Tue, 23 Nov 2021 09:38:06 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id n13sm13054883wrt.44.2021.11.23.09.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:38:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/16] linux-user/host/ppc64: Use r11 for signal_pending
 address
Date: Tue, 23 Nov 2021 18:37:45 +0100
Message-Id: <20211123173759.1383510-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123173759.1383510-1-richard.henderson@linaro.org>
References: <20211123173759.1383510-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need a register that can live across the syscall;
we only need a register that can live until the syscall.
Use call-clobbered r11 instead of call-saved r14.
Eliminate the save and restore of r14 from the stack frame.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/ppc64/safe-syscall.inc.S | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/linux-user/host/ppc64/safe-syscall.inc.S b/linux-user/host/ppc64/safe-syscall.inc.S
index 4b57440585..5f19cd193c 100644
--- a/linux-user/host/ppc64/safe-syscall.inc.S
+++ b/linux-user/host/ppc64/safe-syscall.inc.S
@@ -49,9 +49,7 @@ safe_syscall_base:
          *               and returns the result in r3
          * Shuffle everything around appropriately.
          */
-        std     14, 16(1) /* Preserve r14 in SP+16 */
-        .cfi_offset 14, 16
-        mr      14, 3   /* signal_pending */
+        mr      11, 3   /* signal_pending */
         mr      0, 4    /* syscall number */
         mr      3, 5    /* syscall arguments */
         mr      4, 6
@@ -69,13 +67,12 @@ safe_syscall_base:
          */
 safe_syscall_start:
         /* if signal_pending is non-zero, don't do the call */
-        lwz     12, 0(14)
+        lwz     12, 0(11)
         cmpwi   0, 12, 0
         bne-    0f
         sc
 safe_syscall_end:
         /* code path when we did execute the syscall */
-        ld 14, 16(1) /* restore r14 to its original value */
         bnslr+
 
         /* syscall failed; return negative errno */
@@ -84,7 +81,6 @@ safe_syscall_end:
 
         /* code path when we didn't execute the syscall */
 0:      addi    3, 0, -TARGET_ERESTARTSYS
-        ld 14, 16(1) /* restore r14 to its original value */
         blr
         .cfi_endproc
 
-- 
2.25.1


