Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F48B6A08DA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 13:47:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVAzh-0003lb-Jy; Thu, 23 Feb 2023 07:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+add43774a78fc16fb9e5+7123+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pVAzW-00033v-4P
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:46:30 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+add43774a78fc16fb9e5+7123+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pVAzT-0004hj-Ct
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=XhoV85/5S6n2uwptZVydUrXggYrio3Pcw9JF7uRx8L4=; b=v29ucDRePsUwN4Grj1Al9be0ji
 Y6kXcKMG+2P9cmtcQZBrqifQqdPkiQ/0k6xY/ZIJmiQEAHar08enm2A5RtliNgtqhSIFMLhejbkhg
 lEIIORQgtZbDoUGb46Oz72wKvHsGDl53bLx+bKKQi06YBdOk4PLtmjhq6+bTsCznGblF+rm1UZA03
 FjTIjOZ7h6aimCiM+FCm8eyjZRyLHSDRGIXcLwCgXeRhoDvUWZP8bj3CtZCoMd+9+jTqOz56I5QbS
 x80aXTnkwIr0SwWIwV0Z5JMJZx6xD5Oas/fg2f1XrNdZ2tABnSJrEQ66BHRhDLr00qCrG9rcxHSm7
 CaC+Z3Aw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pVAzK-00EMjP-9K; Thu, 23 Feb 2023 12:46:18 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pVAzK-00DYsX-0w; Thu, 23 Feb 2023 12:46:18 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
Subject: [PATCH v13 53/60] hw/xen: Automatically add xen-platform PCI device
 for emulated Xen guests
Date: Thu, 23 Feb 2023 12:46:06 +0000
Message-Id: <20230223124613.3231331-54-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230223124613.3231331-1-dwmw2@infradead.org>
References: <20230223124613.3231331-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+add43774a78fc16fb9e5+7123+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
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

From: David Woodhouse <dwmw@amazon.co.uk>

It isn't strictly mandatory but Linux guests at least will only map
their grant tables over the dummy BAR that it provides, and don't have
sufficient wit to map them in any other unused part of their guest
address space. So include it by default for minimal surprise factor.

As I come to document "how to run a Xen guest in QEMU", this means one
fewer thing to tell the user about, according to the mantra of "if it
needs documenting, fix it first, then document what remains".

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/pc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index a12a7a67e9..5ec3518b9e 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1313,6 +1313,9 @@ void pc_basic_device_init(struct PCMachineState *pcms,
 #ifdef CONFIG_XEN_EMU
     if (xen_mode == XEN_EMULATE) {
         xen_evtchn_connect_gsis(gsi);
+        if (pcms->bus) {
+            pci_create_simple(pcms->bus, -1, "xen-platform");
+        }
     }
 #endif
 
-- 
2.39.0


