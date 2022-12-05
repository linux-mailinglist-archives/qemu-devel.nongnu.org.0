Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060B6642ED9
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:33:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2FKr-000828-3z; Mon, 05 Dec 2022 12:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FKS-0007uw-Ip
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:32 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FJx-0007PM-O6
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=UDI32PIpy4B3/91WnvtYh2v+CWJw/POLLcOr0rtzi5A=; b=WBWNe0jNlp1kdOMhaDxeDYdrf0
 st6HxmJ8kHmcRHkD+Re7/u5UJtW0tvnXYDhmOMphIdLEJEcAuvgXhtbhTF+NErERcEfiWbSILXeWK
 z6cNqP5mvJmLKALWysW3qSD6+WIH+orMmZaQaDSV7digqo1uZvLcA1vXiXi3IU/CNL0mulVBkWV8P
 mUSTR1lI2inx4CTZMN3kalIvo0RD3OmljZbUK5oW1lMCfTaPD+6EA/JDjJ9taaPfzsZrSiuasQ1hZ
 6Y7Qg3whEjecZ4kIOcWldWo65xbY8gUPAyNNJWZLeRdnMRGvna9Hw7Nc5PQxz12ClVtr63AVycWQy
 Q8Jz4Ksg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p2FJo-007fzK-SG; Mon, 05 Dec 2022 17:31:52 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p2FJo-002YK8-JO; Mon, 05 Dec 2022 17:31:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
Subject: [RFC PATCH 09/21] pc_piix: allow xenfv machine with XEN_EMULATE
Date: Mon,  5 Dec 2022 17:31:25 +0000
Message-Id: <20221205173137.607044-10-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221205173137.607044-1-dwmw2@infradead.org>
References: <20221205173137.607044-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Joao Martins <joao.m.martins@oracle.com>

This allows -machine xenfv to work with Xen emulated guests.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/pc_piix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 3dcac2f4b6..d1127adde0 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -404,8 +404,8 @@ static void pc_xen_hvm_init(MachineState *machine)
 {
     PCMachineState *pcms = PC_MACHINE(machine);
 
-    if (!xen_enabled()) {
-        error_report("xenfv machine requires the xen accelerator");
+    if (!xen_enabled() && (xen_mode != XEN_EMULATE)) {
+        error_report("xenfv machine requires the xen or kvm accelerator");
         exit(1);
     }
 
-- 
2.35.3


