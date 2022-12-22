Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBF565474F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 21:37:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8SJc-0004vp-RJ; Thu, 22 Dec 2022 15:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel@holtmann.org>)
 id 1p8SJa-0004v1-Ig
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:37:18 -0500
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel@holtmann.org>) id 1p8SJX-0002Lr-Vl
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:37:18 -0500
Received: from fedora.. (p4fefcc21.dip0.t-ipconnect.de [79.239.204.33])
 by mail.holtmann.org (Postfix) with ESMTPSA id 9AB04CED2D;
 Thu, 22 Dec 2022 21:36:59 +0100 (CET)
From: Marcel Holtmann <marcel@holtmann.org>
To: qemu-devel@nongnu.org, mst@redhat.com, xieyongji@bytedance.com,
 pbonzini@redhat.com
Cc: marcel@holtmann.org
Subject: [PATCH v4 11/12] libvhost-user: Add extra compiler warnings
Date: Thu, 22 Dec 2022 21:36:50 +0100
Message-Id: <737ebf2e697f8640558e6f73d96a692711f548f6.1671741278.git.marcel@holtmann.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671741278.git.marcel@holtmann.org>
References: <cover.1671741278.git.marcel@holtmann.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.227.132.17; envelope-from=marcel@holtmann.org;
 helo=mail.holtmann.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In case libvhost-user is used externally, that projects compiler
warnings might be more strict. Enforce an extra set of compiler warnings
to catch issues early on.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvhost-user/meson.build | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvhost-user/meson.build
index 39825d9404ae..a18014e7f26f 100644
--- a/subprojects/libvhost-user/meson.build
+++ b/subprojects/libvhost-user/meson.build
@@ -1,6 +1,12 @@
 project('libvhost-user', 'c',
         license: 'GPL-2.0-or-later',
-        default_options: ['c_std=gnu99'])
+        default_options: ['warning_level=1', 'c_std=gnu99'])
+
+cc = meson.get_compiler('c')
+add_project_arguments(cc.get_supported_arguments('-Wsign-compare',
+                                                 '-Wdeclaration-after-statement',
+                                                 '-Wstrict-aliasing'),
+                      native: false, language: 'c')
 
 threads = dependency('threads')
 glib = dependency('glib-2.0')
-- 
2.38.1


