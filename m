Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019963C1615
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:35:43 +0200 (CEST)
Received: from localhost ([::1]:47272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1W3x-0002Hz-Vc
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn5-0000tA-1s
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:15 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn3-0008HP-8g
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:14 -0400
Received: by mail-ed1-x529.google.com with SMTP id eb14so9129097edb.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sVJGp21Z+QIPlUJGVP+8ocoZJmRoexscl21FIrVpfac=;
 b=BFHyju0z1D/YxB018FlA/l7e9jwBcQXcMmnTZiHAddGVu/7tocGuUxv+YsuKmruNl7
 FB4FPwbu8q+W+ZR/JmkNI6gUVpUXwApQ3oTXlPe0bXrSHaR7IOtubDov/AvcIlNadcdi
 5b2ZOW8bL+TVPSNw6QGAMFt1cDx71DGzRaq7rkrtPEZBwVrtnipOV1j/giBzAlrO6bZ8
 pgBKyiriHvL67xbknlOzqdCbdD25MG5JbEMg7TZakl76j+Neg03uqVd9eQRLot/eUhoV
 Mc4DdCO57Sv/SPxRRXI3hzSjVi9KpVzB6LEtM79X+w1Eqveb4ondunI+8PsnXiVQB1eQ
 xzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sVJGp21Z+QIPlUJGVP+8ocoZJmRoexscl21FIrVpfac=;
 b=fupU5ouUF770n3ChUZAnBa3iS4BT1hK6RcBCNjZIF28k/B03dtQqdipI+ZJBc4/jhj
 vqIgBqPISrAyyG5cXGSk4L3hW3bCU2DYo8VR/Gh1fqZIXtSIZSv5Y6q5a5kmcLLPq8Tl
 nbn/aUjKiDOcArxg0J8XWmYGSesB9W276HlXzFv/B8conI9PEHKxi/LhaIjMGWjsnj1M
 gf/Stf0+EuBGW4ygHy+Rj9HYYTKAT+/irPcK7ww91KyhtQwKPeNzDx5z1qRuDWFKK3IR
 52SKwlx8BtkQKqHOQOqOpfj4dZhWToByBdhBEM2LQrwcPiwr/S1Z3FhvkN0vCpWFdj3x
 E3SA==
X-Gm-Message-State: AOAM533NAgmDPSl8jr1M4CrMLY1FqGXG4OnRB4xcQeDWKB7pGmiep2Cx
 WhkR1dJUCcQfte1Ba89TEHzarvTluAw=
X-Google-Smtp-Source: ABdhPJx2Npho/+aftMRtDDdswRx5bEu7kKzTK0nVmrUy6yT1PIyDdociokpJRCFIcpEr5N0ra8ODfg==
X-Received: by 2002:a05:6402:22e1:: with SMTP id
 dn1mr3139724edb.8.1625757491858; 
 Thu, 08 Jul 2021 08:18:11 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/48] accel: build qtest modular
Date: Thu,  8 Jul 2021 17:17:31 +0200
Message-Id: <20210708151748.408754-32-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Allow building accelerators as module.
Start with qtest as first user.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-28-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/qtest/meson.build | 8 ++------
 meson.build             | 6 ++++++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/accel/qtest/meson.build b/accel/qtest/meson.build
index a2f3276459..4c65600293 100644
--- a/accel/qtest/meson.build
+++ b/accel/qtest/meson.build
@@ -1,6 +1,2 @@
-qtest_ss = ss.source_set()
-qtest_ss.add(files(
-  'qtest.c',
-))
-
-specific_ss.add_all(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true: qtest_ss)
+qtest_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'],
+                    if_true: files('qtest.c'))
diff --git a/meson.build b/meson.build
index 7babef4de4..c943e44975 100644
--- a/meson.build
+++ b/meson.build
@@ -2000,6 +2000,9 @@ trace_ss = ss.source_set()
 user_ss = ss.source_set()
 util_ss = ss.source_set()
 
+# accel modules
+qtest_module_ss = ss.source_set()
+
 modules = {}
 target_modules = {}
 hw_arch = {}
@@ -2238,6 +2241,9 @@ specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
 subdir('tests/qtest/libqos')
 subdir('tests/qtest/fuzz')
 
+# accel modules
+target_modules += { 'accel' : { 'qtest': qtest_module_ss }}
+
 ########################
 # Library dependencies #
 ########################
-- 
2.31.1



