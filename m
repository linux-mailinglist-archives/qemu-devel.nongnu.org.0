Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E84698CCF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 07:27:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSXhw-0003HL-2D; Thu, 16 Feb 2023 01:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pSXhi-0003Bx-W4
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:25:16 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pSXhe-0006v5-13
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:25:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=qiPXSAyaTknD1PF0gLGe1zw/kOMER+7GpX7Lcl/a6Js=; b=WCVQCX4oEvN2sBxAGjfdJ9i1Nu
 mRd+GI8akegUFZ4ngd6oZjxfKMcxfipTwlZnNXf9htthy/NX3o8Jy69yGJyIzyQ6SzhWajsXKq2V2
 axByB5f/pkred6VbIvb0C+KqDbTZ+YKnTgYpgGLJc+7euJJUNMp/aJ45A0B8bxDDskMqbA0b6FDca
 5QboK2BYT+O39Ohn1RtmRivDnz6YLuavkngsgX6ma9tpTdlCYNsqK/cp2aAD5ZUMHr+/JXYNRCSMb
 Kv/sZ2zt6lhvOestpbZ41Wg5Vnsd5NDNW/8G31eENC+8A08OTMqM9JYYxRNarPZQThnipbTIEN6Fw
 AHgx+Eow==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pSXhG-0089xE-Up; Thu, 16 Feb 2023 06:24:47 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pSXhG-008w6m-31; Thu, 16 Feb 2023 06:24:46 +0000
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v11 14/59] xen: Permit --xen-domid argument when accel is KVM
Date: Thu, 16 Feb 2023 06:23:59 +0000
Message-Id: <20230216062444.2129371-15-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230216062444.2129371-1-dwmw2@infradead.org>
References: <20230216062444.2129371-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org;
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

From: Paul Durrant <pdurrant@amazon.com>

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Signed-off-by: David Wooodhouse <dwmw@amazon.co.uk>
---
 softmmu/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index b2ee3fee3f..2b071159c5 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3359,7 +3359,7 @@ void qemu_init(int argc, char **argv)
                 has_defaults = 0;
                 break;
             case QEMU_OPTION_xen_domid:
-                if (!(accel_find("xen"))) {
+                if (!(accel_find("xen")) && !(accel_find("kvm"))) {
                     error_report("Option not supported for this target");
                     exit(1);
                 }
-- 
2.39.0


