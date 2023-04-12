Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3156DFE04
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 20:52:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmfYy-0000lD-W0; Wed, 12 Apr 2023 14:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+dd6f636cd48703d0a954+7171+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pmfYv-0000ks-JB
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 14:51:21 -0400
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+dd6f636cd48703d0a954+7171+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pmfYt-0003Bf-1N
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 14:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Xa7ooeKNSf+k8dNFDJzvKocJu/52pawuc5iQqeYJl9c=; b=nxQF+PYllY75sHqovcNk2BH4Gi
 RpVSWDgHzGp6LR/J9XHEZ/8NcMhK+wvi2yYuhn1/gaMykPZ42EuBEZDwbpl+7j+9ffR82KtYbpKHp
 jDMpMfdHfLyMA6cWiFQ9a+98ywwxU3E4Ks45R78pIEPXpoIkT8fg91nyZVcDyzekRslNMu+N3+Dmi
 vWtqtkYz9VGIPOJ6qJHf/pF+xK8y0jdGcEwCDtzTR1tSBnHGNjIVmY6iljd5SJMmR7UXzcXXwRDsC
 ZEJtD3rZKBTKNS1GAyETt1GMxjt9mnIJoRAy5zmBRb9118HdiHPaxBwJA1NYFEIvolFPS+Z3L+hAX
 p3eq+52w==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pmfYf-00E0VL-3D; Wed, 12 Apr 2023 18:51:06 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pmfYe-001r1H-1y; Wed, 12 Apr 2023 19:51:04 +0100
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
Subject: [PATCH 2/5] hw/xen: Fix memory leak in libxenstore_open() for Xen
Date: Wed, 12 Apr 2023 19:50:59 +0100
Message-Id: <20230412185102.441523-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412185102.441523-1-dwmw2@infradead.org>
References: <20230412185102.441523-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+dd6f636cd48703d0a954+7171+infradead.org+dwmw2@desiato.srs.infradead.org;
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

From: David Woodhouse <dwmw@amazon.co.uk>

There was a superfluous allocation of the XS handle, leading to it
being leaked on both the error path and the success path (where it gets
allocated again).

Spotted by Coverity (CID 1508098).

Fixes: ba2a92db1ff6 ("hw/xen: Add xenstore operations to allow redirection to internal emulation")
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/xen/xen-operations.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xen/xen-operations.c b/hw/xen/xen-operations.c
index 4b78fbf4bd..3d213d28df 100644
--- a/hw/xen/xen-operations.c
+++ b/hw/xen/xen-operations.c
@@ -287,7 +287,7 @@ static void watch_event(void *opaque)
 static struct qemu_xs_handle *libxenstore_open(void)
 {
     struct xs_handle *xsh = xs_open(0);
-    struct qemu_xs_handle *h = g_new0(struct qemu_xs_handle, 1);
+    struct qemu_xs_handle *h;
 
     if (!xsh) {
         return NULL;
-- 
2.39.2


