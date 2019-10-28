Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B0FE7603
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 17:24:46 +0100 (CET)
Received: from localhost ([::1]:57812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP7oy-0002PD-Q2
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 12:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34458)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iP7PQ-0004yP-Bt
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:58:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iP7PP-0003i7-58
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:58:20 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:44014)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iP7PO-0003hr-WB
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:58:19 -0400
Received: by mail-pf1-x431.google.com with SMTP id 3so7142258pfb.10
 for <qemu-devel@nongnu.org>; Mon, 28 Oct 2019 08:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=82Sn/rUNpaBL69nnrf10mEtZ0FP8XTRyAcCtMChhF04=;
 b=DS658puGtOK1gm7nUVpoEeQqkx5tP6LrucwbcXZ0fe8FkaLNKvJyqFUo4xyTXlTjOI
 eHuW374OIu98yw4RbKlGP37ree7TQsZl1hWu1KKrUEJvmZt1xijwegjFj4yUZosrN313
 wmZphjgiFWdha85551b/WMI6YnGINgAegsyYnG/JUER1jpgtsOiFJefzFYaJWTOd1GYH
 6JA4Ct9/0dD6TEVBScP7Ip09aZxsNKDhcI34WKLei2hsWxFhpgtveWdBPtHP1CYYXRpi
 ZYFH47TSAd1S0QEWXh2Km7EhZ7BwM9IvSk5cwcg3WjuEp65AXwIzaeZGFgWfPJGyg/kH
 4s1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=82Sn/rUNpaBL69nnrf10mEtZ0FP8XTRyAcCtMChhF04=;
 b=GBHScEKprC/n8Xxq8hOgZ9ISVWQeDsUgx3yvzlTMW0iRyWgHlS+4dE73pTfEsEZmmw
 BT5SCRLx7X4CcdYqRJ506D+Ayq6i8hCFsR+iSD9BwFdJdAVgam4yb8/cqkHLWCqv0e7s
 aQHFWqcdjdtxQaqosmmwWTRgGRqXQOnP9O83N5YwmNWxFR30wK3OfKhxA/9eTp/OfHLL
 KFH/E608j4kY40utbZ17HD+m9+odQhueaY5s+ES8Kjd0nodN7D4FuPg6V4FHUoAFza5X
 U6oCAeWm4o9HRwatU6v12kGRM4+b9AecpvsyM7Qari+HNo+0GLnIh2Hu3YGXooIY8Bxd
 2VBw==
X-Gm-Message-State: APjAAAUJvajEuIlLD0F5FZpBBZHsGDTwqUQtihweTXD72h/emqIv1BVX
 6rhZFkHLFMfVxFZnZU30XQcucGbWS7kRCg==
X-Google-Smtp-Source: APXvYqxYKk+tJb3qDpAVHf+0eH4qtoKBrMgx6VE1Z5IjTN2gkfGOIOSdOXJhCBy9iaA4CpceEEhCbA==
X-Received: by 2002:a17:90a:cb8e:: with SMTP id
 a14mr902633pju.64.1572278297705; 
 Mon, 28 Oct 2019 08:58:17 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id l64sm12865766pga.88.2019.10.28.08.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 08:58:16 -0700 (PDT)
Subject: [PULL 01/18] riscv: Skip checking CSR privilege level in debugger mode
Date: Mon, 28 Oct 2019 08:48:45 -0700
Message-Id: <20191028154902.32491-2-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028154902.32491-1-palmer@sifive.com>
References: <20191028154902.32491-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::431
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
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@sifive.com>,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Zong Li <zong.li@sifive.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

If we are in debugger mode, skip the CSR privilege level checking
so that we can read/write all CSRs. Otherwise we get:

(gdb) p/x $mtvec
Could not fetch register "mtvec"; remote failure reply 'E14'

when the hart is currently in S-mode.

Reported-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/csr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f767ad24be..974c9c20b5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -801,7 +801,10 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
 #if !defined(CONFIG_USER_ONLY)
     int csr_priv = get_field(csrno, 0x300);
     int read_only = get_field(csrno, 0xC00) == 3;
-    if ((write_mask && read_only) || (env->priv < csr_priv)) {
+    if ((!env->debugger) && (env->priv < csr_priv)) {
+        return -1;
+    }
+    if (write_mask && read_only) {
         return -1;
     }
 #endif
-- 
2.21.0


