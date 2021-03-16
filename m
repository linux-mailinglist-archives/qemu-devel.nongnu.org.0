Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234B833DCF2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 19:55:25 +0100 (CET)
Received: from localhost ([::1]:36724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMEqi-0001mK-3w
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 14:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMEZ8-0001RQ-L2
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:37:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:35380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMEZ1-0007dB-BB
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:37:14 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4689AED0;
 Tue, 16 Mar 2021 18:37:05 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v8 04/44] target/arm: tcg: add sysemu and user subsirs
Date: Tue, 16 Mar 2021 19:36:22 +0100
Message-Id: <20210316183702.10216-5-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210316183702.10216-1-cfontana@suse.de>
References: <20210316183702.10216-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/tcg/meson.build        | 3 +++
 target/arm/tcg/sysemu/meson.build | 3 +++
 target/arm/tcg/user/meson.build   | 3 +++
 3 files changed, 9 insertions(+)
 create mode 100644 target/arm/tcg/sysemu/meson.build
 create mode 100644 target/arm/tcg/user/meson.build

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 3b4146d079..abc9d27b63 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -36,3 +36,6 @@ arm_ss.add(when: ['TARGET_AARCH64','CONFIG_TCG'], if_true: files(
   'pauth_helper.c',
   'sve_helper.c',
 ))
+
+subdir('user')
+subdir('sysemu')
diff --git a/target/arm/tcg/sysemu/meson.build b/target/arm/tcg/sysemu/meson.build
new file mode 100644
index 0000000000..bc11678a0a
--- /dev/null
+++ b/target/arm/tcg/sysemu/meson.build
@@ -0,0 +1,3 @@
+
+arm_softmmu_ss.add(when: ['CONFIG_TCG','CONFIG_SOFTMMU'], if_true: files(
+))
diff --git a/target/arm/tcg/user/meson.build b/target/arm/tcg/user/meson.build
new file mode 100644
index 0000000000..d70a51ea9a
--- /dev/null
+++ b/target/arm/tcg/user/meson.build
@@ -0,0 +1,3 @@
+
+arm_user_ss.add(when: ['CONFIG_TCG','CONFIG_USER_ONLY'], if_true: files(
+))
-- 
2.26.2


