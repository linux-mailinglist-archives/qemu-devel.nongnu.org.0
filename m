Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AB234AF70
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 20:43:17 +0100 (CET)
Received: from localhost ([::1]:57524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPsMW-00032i-RQ
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 15:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsGk-0005xe-Sc
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:45288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsGi-0000qC-MZ
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:37:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6ECA6AC3C;
 Fri, 26 Mar 2021 19:37:15 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v12 09/65] target/arm: only build psci for TCG
Date: Fri, 26 Mar 2021 20:36:05 +0100
Message-Id: <20210326193701.5981-10-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326193701.5981-1-cfontana@suse.de>
References: <20210326193701.5981-1-cfontana@suse.de>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not move psci.c to tcg/ because we expect other
hypervisors to use it (waiting for HVF enablement).

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Alexander Graf <agraf@csgraf.de>
---
 target/arm/meson.build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 0172937b40..a9fdada0cc 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -19,8 +19,12 @@ arm_softmmu_ss.add(files(
   'arm-powerctl.c',
   'machine.c',
   'monitor.c',
+))
+
+arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
   'psci.c',
 ))
+
 arm_user_ss = ss.source_set()
 
 subdir('tcg')
-- 
2.26.2


