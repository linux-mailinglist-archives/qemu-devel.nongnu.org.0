Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DCA2A796
	for <lists+qemu-devel@lfdr.de>; Sun, 26 May 2019 03:30:24 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUhzT-0004lZ-A5
	for lists+qemu-devel@lfdr.de; Sat, 25 May 2019 21:30:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxA-0003Hg-9D
	for qemu-devel@nongnu.org; Sat, 25 May 2019 21:28:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhgS-0006Wj-JD
	for qemu-devel@nongnu.org; Sat, 25 May 2019 21:10:46 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37165)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhgQ-0006Vi-MZ
	for qemu-devel@nongnu.org; Sat, 25 May 2019 21:10:44 -0400
Received: by mail-pf1-f194.google.com with SMTP id a23so7511777pff.4
	for <qemu-devel@nongnu.org>; Sat, 25 May 2019 18:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=Agfb1SlQX+MWgq+cbXEGuNIXzEdqOpc8hLIv6mAYUKI=;
	b=i9I5LZgFfz9DU7MG/KoZmyGkCqxS+NhFAVuH8HxtIyMH41oVpAoEbcdBinIdFAtnfd
	2UuYg4MrzAlDWLnTEgk+NLsU3EAaYwVhAbbxAlx7rFlgh8bTYcYDe/uPhYFok750QUiO
	bHDrSGcUIrfNvBzvjU855xmgbnnCUkryH50p+WO2I/LsfaaEGxvZZ4TlkxW0EuW58guE
	gvPuLxDeZAbvv9IyfLdMaFGrO4JPxNWjf6F63IFw+DZf8oHuIe06eYXmqmrtgtV4kfy5
	+CshRWf5mSjwe8kN9SvLqoaw7qqNxgpper98SLnE+dtEpvhYskll0HAbIVTBAWzlihaN
	QiqQ==
X-Gm-Message-State: APjAAAX04iXlra0F8bG06dN5mr2jBvOO4VxKy/qmMJxixto39ppwYmpr
	hcK7dNrokTYYWIwdLn8eHwawjw==
X-Google-Smtp-Source: APXvYqxYoHRXva8OWtznNd2GUVtwg9iQihnLoAeecut6/jgWLYhdlybpZx0Z8NV8xKIgzDl9YUUAHg==
X-Received: by 2002:a63:c5b:: with SMTP id 27mr65314208pgm.70.1558833041202;
	Sat, 25 May 2019 18:10:41 -0700 (PDT)
Received: from localhost ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id z7sm7916145pfr.23.2019.05.25.18.10.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:40 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:48 -0700
Message-Id: <20190526010948.3923-30-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190526010948.3923-1-palmer@sifive.com>
References: <20190526010948.3923-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.210.194
Subject: [Qemu-devel] [PULL 29/29] target/riscv: Only flush TLB if SATP.ASID
 changes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jonathan Behrens <jonathan@fintelia.io>,
	Alistair Francis <alistair.francis@wdc.com>,
	Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Behrens <jonathan@fintelia.io>

There is an analogous change for ARM here:
https://patchwork.kernel.org/patch/10649857

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/csr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0f51c7eae241..f9e2910643f8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -723,7 +723,9 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
         if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
             return -1;
         } else {
-            tlb_flush(CPU(riscv_env_get_cpu(env)));
+            if((val ^ env->satp) & SATP_ASID) {
+                tlb_flush(CPU(riscv_env_get_cpu(env)));
+            }
             env->satp = val;
         }
     }
-- 
2.21.0


