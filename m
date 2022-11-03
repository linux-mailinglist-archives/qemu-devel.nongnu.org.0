Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C73618423
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:21:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcwR-0003Uq-Fn; Thu, 03 Nov 2022 12:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuU-0000pj-Kn; Thu, 03 Nov 2022 12:18:00 -0400
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuN-00084r-8K; Thu, 03 Nov 2022 12:17:42 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1McH1Q-1pSyve1K9M-00ckiY; Thu, 03
 Nov 2022 17:17:30 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Chuck Zmudzinski <brchuckz@aol.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 03/10] xen/pt: fix syntax error that causes FTBFS in some
 configurations
Date: Thu,  3 Nov 2022 17:17:20 +0100
Message-Id: <20221103161727.4116147-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103161727.4116147-1-laurent@vivier.eu>
References: <20221103161727.4116147-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+4xte6OzCu1rQ6F4WF0bkzIAf1P7wP99vVDnp2SD+eOXhegIoKr
 bMTu9SAFs4lhyD7SE1du2CYok5OjBHyvTukQPUtNAzRhDSHqaXOkwBe8f/AbHnpRm5QFoTp
 EQn5Wir6ou1zW0THZEfgBt7b1bk7mhx+azVwonyy77CNivgdO01mtay/z7KLSVHrOWz1qCt
 /zUe6RS5nmf3do3TkgW+A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kTPqXAazHY0=:NZEg4PweZXHghoeW0MfKfj
 G4u+nurAy4/nWxWyttKtW0vRe0a0CwPiuVohm3PusEZkST8gdU4hm6Hx6r6PhnRYsmqJpvteD
 fjWVkMXSv0hO6exb/fTtaBmhrl9YlVmP4HtluFxIvXkmT45imM7XmBNvpbzwCOvDMRHMMNCZT
 1Hz0ibEivvmCYxzBdwU4IWeZW9t+JSazU+DmY+J0lBExjeK/ZmfaAIhp/Gqe0NIbbqVSZa+zX
 oIbOXY7z+eGhInokR7XtuazvWFSC0oS3F8RzG4LCxXTbLMg+9vyp/7wVTPR3Tekkoe/V67d35
 X1PS4Ooke9JRxiZjsJcMked5Q37dsXw3gDtJ1qHhtOizo/wYm/FT5F9YwgAVtM01zQc259q7h
 U1NdfaX211GFsrEoIdkJV4QfXFbH285CqSyZXb4IvRouNJQARothI3cWJWYhO1RcMSzkS8Bb2
 xNk3UfNM+0gQVUVt49WHXl4DaiHIVRo6R3KytuYPnYiKvZVPsUYNnK3zoUxonG9TVDbC9/Jbp
 ApMIzHChUPf9HukfEnWzy/v8sYCtiCAdHS5Xe77jchdVJsia3OV7Rqm8RXEMYIGmRCml2NmmY
 OgSfKFscONdA2/P4hHr8giP+hPMFsTbFY1AuTaPWpom5KUe40UIjdUU0MpaDmxz/nVFjK10cc
 h9HUiYuaPS+mqxU8e8KwZ+0t6ucHo+bl3otj4Ph8oCfUhLvv9Ekz/o4EY93v2sNTrh+s0hOUN
 ZjIzVIuFL4dS2hm6m1V7RtVP8oYL4VFz28Y7dOuuTBSwQ3R2BR631J8y3w9NOvhie8tJfFF3y
 2gNRdQe
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Chuck Zmudzinski <brchuckz@aol.com>

When Qemu is built with --enable-xen and --disable-xen-pci-passthrough
and the target os is linux, the build fails with:

meson.build:3477:2: ERROR: File xen_pt_stub.c does not exist.

Fixes: 582ea95f5f93 ("meson: convert hw/xen")

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <5f1342a13c09af77b1a7b0aeaba5955bcea89731.1667242033.git.brchuckz@aol.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/xen/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index 08dc1f685738..ae0ace3046b8 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -18,7 +18,7 @@ if have_xen_pci_passthrough
     'xen_pt_msi.c',
   ))
 else
-  xen_specific_ss.add('xen_pt_stub.c')
+  xen_specific_ss.add(files('xen_pt_stub.c'))
 endif
 
 specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
-- 
2.37.3


