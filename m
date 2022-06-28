Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EEC55C028
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:24:42 +0200 (CEST)
Received: from localhost ([::1]:33170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68Of-0005Q4-NU
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o68IE-0001om-Ux
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:18:02 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o68ID-00080Z-Cz
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:18:02 -0400
Received: by mail-pg1-x529.google.com with SMTP id v126so7584975pgv.11
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mHMyNrMsO1iP4VbXnd4aidt4qEDuWWfhMdOb3QrB/+M=;
 b=P2GkkGSTPyKWPCYP8ibB7inMLU03vDHIwt5wEOJ+rDqeO9DvYnZwWJ7w6SSYvQnLhu
 aakGsBbhzb0pB/hib+UM282ZJFH/6b6ZHxjtiYQY34JTOzqYT7zGpo9ukKcPSkHtMF4s
 ddxtcX1xYVstchivxM9L6uF9G0z8r2UL8u2U2XkOEKlWsnUCPkiaA1/EemyFC+W7RkIj
 +e4HSq2YmjtiSi21jhQVYql+dpQTavd0KAqmDgR1Xe5beKQ9GTeSxDjnhO4fxYGUXb7l
 8gJsIN5wUhvRJQi6k9uQLczuWaDsPp+nP1inE06KtFD6uPlh9O/1OeF5Vw7OAfhWEKB9
 1BrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mHMyNrMsO1iP4VbXnd4aidt4qEDuWWfhMdOb3QrB/+M=;
 b=EMEOo+0fS4H0h7Hwbbwbpr58/k0++u0AKS81x30iCM+krwzsWa56ejckWDrRl3h8Xo
 Tj3mTfxJJNFohm1NAAc8Az73ae2GeP+90zLvrwz5yMvU61w/1Q4RXOeLd6vb9Juz0TdB
 XH7+wdFDGImHL0lS3sZYk9Q0xqvIzSY8TEG/LPrja/RK6Rr8InXGOOu4fcY0YdjJzy4Z
 1pI0LoINjXUsJ+tKcKKIGTfDgXHwU12PYE1AFRn9j1LJGQtq9nNiE3tkeyIySqs7YIoC
 dct3t7sDXNW74rkpUQzyDNDYXMwZom/P/54UA+5uNv42UqVM2dEZrdpNu5fM34LAZB33
 Hocw==
X-Gm-Message-State: AJIora+NFJBgeTlw1cnTnWwFd22gZe/7944kLCajMvyVVSIBCWINE4Tt
 9Fr6lLguTjz1T/s3UFBqCp4fVA==
X-Google-Smtp-Source: AGRyM1tsMrkVDtWdcCS+TpnRousmkMYXbxuJ1wCu744IeN/i3x74h2kl97wo+rileJsFEaOU4hlqOA==
X-Received: by 2002:a05:6a00:170f:b0:525:467c:3516 with SMTP id
 h15-20020a056a00170f00b00525467c3516mr2885081pfc.22.1656411480024; 
 Tue, 28 Jun 2022 03:18:00 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([117.96.230.192])
 by smtp.gmail.com with ESMTPSA id
 bj28-20020a056a00319c00b0051bc36b7995sm8909621pfb.62.2022.06.28.03.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:17:59 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v8 2/4] target/riscv: Set minumum priv spec version for
 mcountinhibit
Date: Tue, 28 Jun 2022 15:47:35 +0530
Message-Id: <20220628101737.786681-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628101737.786681-1-apatel@ventanamicro.com>
References: <20220628101737.786681-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=apatel@ventanamicro.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The minimum priv spec versino for mcountinhibit to v1.11 so that it
is not available for v1.10 (or lower).

Fixes: eab4776b2bad ("target/riscv: Add support for hpmcounters/hpmevents")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d65318dcc6..f7bfd2eab5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3944,7 +3944,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                                                        write_mhpmcounter },
 
     [CSR_MCOUNTINHIBIT]  = { "mcountinhibit",  any, read_mcountinhibit,
-                                                    write_mcountinhibit },
+               write_mcountinhibit, .min_priv_ver = PRIV_VERSION_1_11_0  },
 
     [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_mhpmevent,
                                                        write_mhpmevent },
-- 
2.34.1


