Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EF06DFE07
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 20:52:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmfYv-0000kY-DZ; Wed, 12 Apr 2023 14:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9719990f4703cc1bc73b+7171+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pmfYn-0000jI-Pb
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 14:51:13 -0400
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9719990f4703cc1bc73b+7171+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pmfYk-0003BI-AL
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 14:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=pvefxXf1YhjL3JSf+V8JRgGjqQjxWW3E4QNSUXU8Vyk=; b=TjPE0dW5/ekjTjDaeeWQk5fUJV
 nNUgr4r4gwcl33okRN07A5zJwF7Q0B4b01PnDXOtfu3v7VarXGfsZZNSPBiwmIfLc2EdIZ2EGBo4o
 QTqoNs4SeLgJml9Y/6rUfD8FuNIh2wI+nWzJS/7XYaEwpMo+wj7PQJ9f5m1MKj8o0U6AFB1l5km3X
 rElR8Zf42jdPGjQ1hHcqk1DSpdw5yW/z9RBJwQGSUYukk2JFnGU7rFkK9jtVNSx3ySS6kedTvELwC
 pvVDHGxtrOnUPo8v7MBvIwMGNL0HzMnLXSZ8RfjifLwUOnrHdF05EhNKDHsy1O0kxGie2f4iVThoa
 QyhSoxew==;
Received: from [2001:8b0:10b:5::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pmfYf-0077lE-7x; Wed, 12 Apr 2023 18:51:06 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pmfYe-001r1R-2I; Wed, 12 Apr 2023 19:51:04 +0100
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
Subject: [PATCH 4/5] hw/xen: Fix double-free in xen_console store_con_info()
Date: Wed, 12 Apr 2023 19:51:01 +0100
Message-Id: <20230412185102.441523-5-dwmw2@infradead.org>
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

Coverity spotted a double-free (CID 1508254); we g_string_free(path) and
then for some reason immediately call free(path) too.

We should just use g_autoptr() for it anyway, which simplifies the code
a bit.

Fixes: 7a8a749da7d3 ("hw/xen: Move xenstore_store_pv_console_info to xen_console.c")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/char/xen_console.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index c7a19c0e7c..810dae3f44 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -178,8 +178,7 @@ static int store_con_info(struct XenConsole *con)
     Chardev *cs = qemu_chr_fe_get_driver(&con->chr);
     char *pts = NULL;
     char *dom_path;
-    GString *path;
-    int ret = -1;
+    g_autoptr(GString) path = NULL;
 
     /* Only continue if we're talking to a pty. */
     if (!CHARDEV_IS_PTY(cs)) {
@@ -204,15 +203,9 @@ static int store_con_info(struct XenConsole *con)
 
     if (xenstore_write_str(con->console, path->str, pts)) {
         fprintf(stderr, "xenstore_write_str for '%s' fail", path->str);
-        goto out;
+        return -1;
     }
-    ret = 0;
-
-out:
-    g_string_free(path, true);
-    free(path);
-
-    return ret;
+    return 0;
 }
 
 static int con_init(struct XenLegacyDevice *xendev)
-- 
2.39.2


