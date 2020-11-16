Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3642B51FA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 21:09:00 +0100 (CET)
Received: from localhost ([::1]:37458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keko7-0003hI-V5
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 15:08:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1kekjj-0007Ux-L0
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 15:04:27 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1kekjh-00042w-Rd
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 15:04:27 -0500
Received: by mail-wm1-x342.google.com with SMTP id c9so495198wml.5
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 12:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xsag5METdBTQqAXmknMMlYVgiIrKBnd3jnkhKjDpOWE=;
 b=STjciWGQTlcFvwkoGcnHzp5gsR7ulFcO/rH0Qk9siqiwWb4A7wPB8d4trko6PvhbnK
 2C8kECMmsavOqXBusIWPRDM3gPVPjADHvCHUNlU9OAPB9mhEYUhIlyU2owtFEs9UIc1k
 2MDYr9ZMoRJKZK9E5lN6jzzbHvKxBf/pNlmJoJapDeOPl1ZbsnY0R2SmjtBov0H5/F7A
 w3rdu0WY/o8Gsybr8/8NkNOscsGfDLS8XxKhal8HEXpnRzhjM4F9NDQcO2Iugk5wRkiC
 JC5AraHE5jbvEn+fvTWsV7gs13ZDa0koo0v61WX9CGcHMyXmGR9e1QLqfD9mC9w2gMcx
 mnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xsag5METdBTQqAXmknMMlYVgiIrKBnd3jnkhKjDpOWE=;
 b=APQ9D+66OxDrzmBDeN/sx6ZOdWxJ5BNZbLxIpCpWT0ZfhUHTt3ZCQmDA444bO9dwat
 sEOahRFpjPtj7H2w0Lc6iYsCyDvvkBfpDr3PDbRYRwKfueSnStQMfFMTfBaXK1nj4/tQ
 h29PdVcYN6byVF+hybFgp8OFjvefz302OtAc6SC1qrB7fd9wMN2Jp1B0oftBjh5aCLRv
 EAg1zMb1MA4Td3dCoV7rK9kQ/+3pEgSLtTsn5cPrmAs/1EX9bmrOs/QEkl4m1GtLrmla
 XTW7gdAJkFXsH48xpeRbTLksioiGgvAh7dM5GUL3c9V/qCC/giRbYoLG3FVKhjMGzPwG
 BQYw==
X-Gm-Message-State: AOAM533eMKEnTKEh86LE0m+0mkYsGvdDWVCCRZK+3y8vpFFZ2zM+3MCD
 Idi+EKJ68SsY9xNFWtsuI0Q8KQ==
X-Google-Smtp-Source: ABdhPJz62hjDEDqipJZiiTYBQJ9MazWtEObEToWAlzUZeBb48Y4ZUvOJLzdyOZ4VStBA300+hT/+4g==
X-Received: by 2002:a05:600c:2202:: with SMTP id
 z2mr533520wml.115.1605557063916; 
 Mon, 16 Nov 2020 12:04:23 -0800 (PST)
Received: from Jessicas-MacBook.local (trinity-students-nat.trin.cam.ac.uk.
 [131.111.193.104])
 by smtp.gmail.com with ESMTPSA id k22sm414251wmi.34.2020.11.16.12.04.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Nov 2020 12:04:23 -0800 (PST)
Received: by Jessicas-MacBook.local (Postfix, from userid 501)
 id 0E42120985F0DC; Mon, 16 Nov 2020 20:04:23 +0000 (GMT)
From: Jessica Clarke <jrtc27@jrtc27.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hvf: Fix segment selector format
Date: Mon, 16 Nov 2020 20:04:14 +0000
Message-Id: <20201116200414.28286-1-jrtc27@jrtc27.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=jrtc27@jrtc27.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jessica Clarke <jrtc27@jrtc27.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Requested Privilege Level field is 2 bits, the Table Indicator field
is 1 bit and the Index field is the remaining 15 bits, with TI=0 meaning
GDT and TI=1 meaning LDT.

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
 target/i386/hvf/x86.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/i386/hvf/x86.h b/target/i386/hvf/x86.h
index bacade7b65..ea3e1b86b3 100644
--- a/target/i386/hvf/x86.h
+++ b/target/i386/hvf/x86.h
@@ -214,16 +214,16 @@ static inline uint32_t x86_call_gate_offset(x86_call_gate *gate)
     return (uint32_t)((gate->offset1 << 16) | gate->offset0);
 }
 
-#define LDT_SEL     0
-#define GDT_SEL     1
+#define GDT_SEL     0
+#define LDT_SEL     1
 
 typedef struct x68_segment_selector {
     union {
         uint16_t sel;
         struct {
-            uint16_t rpl:3;
+            uint16_t rpl:2;
             uint16_t ti:1;
-            uint16_t index:12;
+            uint16_t index:13;
         };
     };
 } __attribute__ ((__packed__)) x68_segment_selector;
-- 
2.28.0


