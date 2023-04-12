Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE756DFE06
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 20:52:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmfYs-0000ja-RD; Wed, 12 Apr 2023 14:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9719990f4703cc1bc73b+7171+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pmfYm-0000iv-IH
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 14:51:13 -0400
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9719990f4703cc1bc73b+7171+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pmfYk-0003BG-9z
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 14:51:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=NIk/dSGE1S/XkSMWglE5vSkIy2Aotr95wrmjXgO3qTE=; b=jjZUxe9t2zm5dC09PCwBEOxg1z
 joZy6jDOxzr1nMq4pNbcp3WLngm4pYpiqE8AoYSdmmYEq9kGeF6bv9Z2a4WWxpA7YiY0Xtz7jkDNZ
 VMLSp2/tDON07Uv3Yd4BFcaGPn27lWka2nduaqL3piYJyOoFIM7uSZqKzax8Kh6VsHdHz0zYgSqqO
 ILzM43hX1ULSuqD1DrDrzjbRoUwQetje20sfAqhL/5s+GMRopH8X5yY3w5y/cRZoRoZGcwy+b3i9P
 WZYW1Tl6JlHkIlCYN93JjtiITKBL2dr6Oz/qojqVcvQj/3dU01ZHLF4uYLj6QxJIzAGsOfpqp4I7B
 a9J7iXrQ==;
Received: from [2001:8b0:10b:5::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pmfYf-0077lF-7n; Wed, 12 Apr 2023 18:51:05 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pmfYe-001r1V-2S; Wed, 12 Apr 2023 19:51:04 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: no Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 xen-devel@lists.xenproject.org
Subject: [PATCH 5/5] hw/xen: Fix broken check for invalid state in xs_be_open()
Date: Wed, 12 Apr 2023 19:51:02 +0100
Message-Id: <20230412185102.441523-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412185102.441523-1-dwmw2@infradead.org>
References: <20230412185102.441523-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+9719990f4703cc1bc73b+7171+infradead.org+dwmw2@casper.srs.infradead.org;
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

Coverity points out that if (!s && !s->impl) isn't really what we intended
to do here. CID 1508131.

Fixes: 032475127225 ("hw/xen: Add emulated implementation of XenStore operations")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_xenstore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 900679af8a..65f91e87d7 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -1688,7 +1688,7 @@ static struct qemu_xs_handle *xs_be_open(void)
     XenXenstoreState *s = xen_xenstore_singleton;
     struct qemu_xs_handle *h;
 
-    if (!s && !s->impl) {
+    if (!s || !s->impl) {
         errno = -ENOSYS;
         return NULL;
     }
-- 
2.39.2


