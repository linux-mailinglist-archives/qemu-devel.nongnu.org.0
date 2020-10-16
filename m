Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F379B28FFAA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 10:03:51 +0200 (CEST)
Received: from localhost ([::1]:45294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTKiN-00017T-2u
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 04:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kTKfI-0007yB-Jg
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 04:00:40 -0400
Received: from mx2.suse.de ([195.135.220.15]:49384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kTKfC-0008ML-TG
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 04:00:40 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A07CEAE35;
 Fri, 16 Oct 2020 08:00:33 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] hax: unbreak accelerator cpu code after cpus.c split
Date: Fri, 16 Oct 2020 10:00:32 +0200
Message-Id: <20201016080032.13914-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 22:26:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
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
Cc: Richard Henderson <richard.henderson@linaro.org>, haxm-team@intel.com,
 Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

during my split of cpus.c, code line
"current_cpu = cpu"
was removed by mistake, causing hax to break.

This commit fixes the situation restoring it.

Reported-by: Volker Rümelin <vr_qemu@t-online.de>
Fixes: e92558e4bf8059ce4f0b310afe218802b72766bc
Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/i386/hax-cpus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/hax-cpus.c b/target/i386/hax-cpus.c
index 99770e590c..f72c85bd49 100644
--- a/target/i386/hax-cpus.c
+++ b/target/i386/hax-cpus.c
@@ -38,6 +38,7 @@ static void *hax_cpu_thread_fn(void *arg)
     qemu_thread_get_self(cpu->thread);
 
     cpu->thread_id = qemu_get_thread_id();
+    current_cpu = cpu;
     hax_init_vcpu(cpu);
     cpu_thread_signal_created(cpu);
     qemu_guest_random_seed_thread_part2(cpu->random_seed);
-- 
2.26.2


