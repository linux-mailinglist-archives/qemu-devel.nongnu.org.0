Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0246B33DDE9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 20:46:09 +0100 (CET)
Received: from localhost ([::1]:58670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMFdo-00080x-08
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 15:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMEZh-00025M-TB
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:37:51 -0400
Received: from mx2.suse.de ([195.135.220.15]:36116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMEZa-0007oI-Bm
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:37:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BFC0FAF0D;
 Tue, 16 Mar 2021 18:37:21 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v8 27/44] target/arm: remove kvm include file for PSCI and
 arm-powerctl
Date: Tue, 16 Mar 2021 19:36:45 +0100
Message-Id: <20210316183702.10216-28-cfontana@suse.de>
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

The QEMU PSCI implementation is not used for KVM,
we do not need the kvm constants header.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/arm-powerctl.h | 2 --
 target/arm/psci.c         | 1 -
 2 files changed, 3 deletions(-)

diff --git a/target/arm/arm-powerctl.h b/target/arm/arm-powerctl.h
index 37c8a04f0a..35e048ce14 100644
--- a/target/arm/arm-powerctl.h
+++ b/target/arm/arm-powerctl.h
@@ -11,8 +11,6 @@
 #ifndef QEMU_ARM_POWERCTL_H
 #define QEMU_ARM_POWERCTL_H
 
-#include "kvm-consts.h"
-
 #define QEMU_ARM_POWERCTL_RET_SUCCESS QEMU_PSCI_RET_SUCCESS
 #define QEMU_ARM_POWERCTL_INVALID_PARAM QEMU_PSCI_RET_INVALID_PARAMS
 #define QEMU_ARM_POWERCTL_ALREADY_ON QEMU_PSCI_RET_ALREADY_ON
diff --git a/target/arm/psci.c b/target/arm/psci.c
index 6709e28013..800c4a55d8 100644
--- a/target/arm/psci.c
+++ b/target/arm/psci.c
@@ -19,7 +19,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
-#include "kvm-consts.h"
 #include "qemu/main-loop.h"
 #include "sysemu/runstate.h"
 #include "internals.h"
-- 
2.26.2


