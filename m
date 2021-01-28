Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27950307917
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:09:26 +0100 (CET)
Received: from localhost ([::1]:54328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58vF-0004Of-8e
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:09:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1l58tw-00039T-Ix; Thu, 28 Jan 2021 10:08:04 -0500
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:28446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1l58tu-0008Mw-AE; Thu, 28 Jan 2021 10:08:04 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id D744446132;
 Thu, 28 Jan 2021 15:58:23 +0100 (CET)
From: Stefan Reiter <s.reiter@proxmox.com>
To: qemu-trivial@nongnu.org
Subject: [PATCH] docs: don't install corresponding man page if guest agent is
 disabled
Date: Thu, 28 Jan 2021 15:58:01 +0100
Message-Id: <20210128145801.14384-1-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=s.reiter@proxmox.com; helo=proxmox-new.maurer-it.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No sense outputting the qemu-ga and qemu-ga-ref man pages when the guest
agent binary itself is disabled. This mirrors behaviour from before the
meson switch.

Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---
 docs/meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/meson.build b/docs/meson.build
index bb14eaebd3..f84306ba7e 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -46,9 +46,11 @@ if build_docs
                           meson.source_root() / 'docs/sphinx/qmp_lexer.py',
                           qapi_gen_depends ]
 
+  have_ga = have_tools and config_host.has_key('CONFIG_GUEST_AGENT')
+
   man_pages = {
-        'qemu-ga.8': (have_tools ? 'man8' : ''),
-        'qemu-ga-ref.7': 'man7',
+        'qemu-ga.8': (have_ga ? 'man8' : ''),
+        'qemu-ga-ref.7': (have_ga ? 'man7' : ''),
         'qemu-qmp-ref.7': 'man7',
         'qemu-storage-daemon-qmp-ref.7': (have_tools ? 'man7' : ''),
         'qemu-img.1': (have_tools ? 'man1' : ''),
-- 
2.20.1



