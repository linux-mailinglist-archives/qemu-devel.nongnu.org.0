Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82AF490A3E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 15:27:08 +0100 (CET)
Received: from localhost ([::1]:57774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9SyR-0000ne-V2
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 09:27:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9SCz-0006Wa-Tz
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:38:06 -0500
Received: from [2607:f8b0:4864:20::62d] (port=34487
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9SCx-0002V9-6v
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:38:04 -0500
Received: by mail-pl1-x62d.google.com with SMTP id a7so18507581plh.1
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 05:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qEJf89SevVQot2Hj3ZJkC4AKQIDCORDOul1GSl8azAo=;
 b=PBO41w1f7KyjSi3ltr5jfWLTf6tOq00KWOWkK47luy2WjglhssEACIYw6YNk0B94zL
 IAfagHzYwwfweAPFAemyCBISo+GcA2t21ZeL8sh6yiANh8ezA73LQEDmM69f5fDcOOMi
 Rdfa7hme3iqT/gf6YRi6rQIKGJWKfyZ3EfdzhUI0jExQXJT4Ma+7cBrFXJ8a0zgSjdsl
 rM8pKM9MoESYMxfj++bdvFfnHLQnXHViIqDFi+5urB6JZm1nZI1As8i6KxrCiJmQu7Mb
 6n1INj3RTzE0cgXyK0uBBM8dz2jSlMiIdkab5dJ1u7cMR8AU1Vr4yzbyy3oI19bsTdMK
 8C6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qEJf89SevVQot2Hj3ZJkC4AKQIDCORDOul1GSl8azAo=;
 b=XoFSdhPRV6aC/4OlIatGru4nXr0KQgHVb+A7LG7gkvvyOhswRwGNrHF0QrThp+JEMF
 pMiH5ln3jKBRc8ShW6QBkTPzASubpDOmSp/X2rypXgNzJ8wcFYDcQoAP/YMdNoTvXqHP
 G2SSHAuzv1Ymqk1L7y/inps26MNKYC9N7i8pTwe3LQx0BTJRNpgtPZ7pyZHPA9iiWRzF
 I8Dlvtsjd8vobYdYjr34TCtD5EucEk11nUU5R8mU0Du1U7USXBknfyVynQQXn9DZ4w+z
 rQIpmsEb+aeezolseKWxc7vrme302xQooB7S/jbfsfjIrPJUvrfpAMCtGLEtJJlp9Eml
 Wcbg==
X-Gm-Message-State: AOAM532vRRfam7Gu+u6dNogcrhAKhQNQNAtaOJtRTpKdu1Pq1EmokH6I
 0lj4Y0r5U4PgyzBaF2J1hNcuO3hTplUcrQ==
X-Google-Smtp-Source: ABdhPJypn6ZJztkfH4qe/Z+muk/uatFPLpF6ktH9QijxXhY/ImneVw27USSeUGrV1S73mSthVEmf2Q==
X-Received: by 2002:a17:903:11c5:b0:149:a8cf:37da with SMTP id
 q5-20020a17090311c500b00149a8cf37damr22626511plh.132.1642426244369; 
 Mon, 17 Jan 2022 05:30:44 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:30:43 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v7 22/23] docs/system: riscv: Document AIA options for virt
 machine
Date: Mon, 17 Jan 2022 18:58:25 +0530
Message-Id: <20220117132826.426418-23-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=anup@brainfault.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Anup Patel <anup@brainfault.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

We have two new machine options "aia" and "aia-guests" available
for the RISC-V virt machine so let's document these options.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 docs/system/riscv/virt.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index fa016584bf..373645513a 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -63,6 +63,22 @@ The following machine-specific options are supported:
   When this option is "on", ACLINT devices will be emulated instead of
   SiFive CLINT. When not specified, this option is assumed to be "off".
 
+- aia=[none|aplic|aplic-imsic]
+
+  This option allows selecting interrupt controller defined by the AIA
+  (advanced interrupt architecture) specification. The "aia=aplic" selects
+  APLIC (advanced platform level interrupt controller) to handle wired
+  interrupts whereas the "aia=aplic-imsic" selects APLIC and IMSIC (incoming
+  message signaled interrupt controller) to handle both wired interrupts and
+  MSIs. When not specified, this option is assumed to be "none" which selects
+  SiFive PLIC to handle wired interrupts.
+
+- aia-guests=nnn
+
+  The number of per-HART VS-level AIA IMSIC pages to be emulated for a guest
+  having AIA IMSIC (i.e. "aia=aplic-imsic" selected). When not specified,
+  the default number of per-HART VS-level AIA IMSIC pages is 0.
+
 Running Linux kernel
 --------------------
 
-- 
2.25.1


