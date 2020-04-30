Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E941C027F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 18:30:01 +0200 (CEST)
Received: from localhost ([::1]:54336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUC4W-0002VX-7S
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 12:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48576)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jUC00-0004ty-H7
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 12:25:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jUBzR-0002Hx-4y
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 12:25:20 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:34226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jUBzQ-0002FN-P9; Thu, 30 Apr 2020 12:24:44 -0400
Received: by mail-lj1-x243.google.com with SMTP id f11so1731ljp.1;
 Thu, 30 Apr 2020 09:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PekKCSpiUoUGIqZnwvb0q3rYI9QTL52VA11BhLVFmeQ=;
 b=Jvr6VIlL5CM9yOnmxWWjF+dzYVIMQFVTeukNOfCXK0kN//fA/tIJD1uQtXanA2OLo4
 4uokSJ5aRVW+4QMaijEB5CL3dUawBEWqQBe6IHgoK3aOgsOAK2QfNma7gRYID563cDkU
 EnnZjgXxf9ow85PeRWL4hMdR4PiviseROgFQ97ZhDxhKMnGIkLrsTZn5rfH0U6x3eSQR
 97ySXU99h0j35YLxMCQD+UcXuJAHMm7xiUZ1XfVvIQu6PuyoH11ImOWIpAMtrMisAxdy
 2va2ffrxnkxRYXAEzGR2GWUl/dVule4JpAUmkmkDF+1lbwzMwyJNAkPT8PsyAofDnb2+
 vPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PekKCSpiUoUGIqZnwvb0q3rYI9QTL52VA11BhLVFmeQ=;
 b=s2r0bsYVj3L/v/xUxT3O5b6DQzd+NotfECCgrpNRijHwpbJBqgKgrvlLEMQ0PUBi/D
 XPDTTmfDjftj42HancgY+BdzMpzmPFktEHbUB/rgugpjh9/LED0sR+Das1YAe3knIo+5
 diEW/Wrao5wwmkH78O0g6hq4+bVY/rTObgBPYbu9cbJoZ7N1PlziOhae7BMqJ9EvB+cF
 4kcMa6GYRcEfxo6az3K7XUTcNfoErzzZeGRzW2LjnO20XrbZgRkidd3QjXMfWHYhI2KW
 SDqipPigivR//l9WQwzhIFFUdBZoCny/jRGMAiiBMAOKqgrPAavZuvgwWQtJdJ3gCltz
 LhOw==
X-Gm-Message-State: AGi0PuYSQkyL9scvTL/294rLYSzaJNuKaucJwZz2wAUtihtwYqRaX60+
 Azrvt/c/tUITDHiZe2mXHiGB5C6oGfs=
X-Google-Smtp-Source: APiQypL2No9nJpJPMuFte++W4VqSl/VTstAGaDkW+oRccaoHuzxT01JWU6gi50ze/eTne3EcNNuzjQ==
X-Received: by 2002:a2e:b0d4:: with SMTP id g20mr89388ljl.18.1588263882315;
 Thu, 30 Apr 2020 09:24:42 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id u6sm145020ljd.68.2020.04.30.09.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 09:24:41 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/9] hw/net/xilinx_axienet: Auto-clear PHY Autoneg
Date: Thu, 30 Apr 2020 18:24:31 +0200
Message-Id: <20200430162439.2659-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430162439.2659-1-edgar.iglesias@gmail.com>
References: <20200430162439.2659-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::243
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
Cc: damien.hedde@greensocs.com, peter.maydell@linaro.org,
 sstabellini@kernel.org, edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, jasowang@redhat.com, alistair@alistair23.me,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, philmd@redhat.com,
 luc.michel@greensocs.com, figlesia@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Auto-clear PHY CR Autoneg bits. This makes this model
work with recent Linux kernels.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/xilinx_axienet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 704788811a..0f97510d8a 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -149,8 +149,8 @@ tdk_write(struct PHY *phy, unsigned int req, unsigned int data)
             break;
     }
 
-    /* Unconditionally clear regs[BMCR][BMCR_RESET] */
-    phy->regs[0] &= ~0x8000;
+    /* Unconditionally clear regs[BMCR][BMCR_RESET] and auto-neg */
+    phy->regs[0] &= ~0x8200;
 }
 
 static void
-- 
2.20.1


