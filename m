Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123022DD8A7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 19:49:18 +0100 (CET)
Received: from localhost ([::1]:33938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpyKy-0007qd-Kh
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 13:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIM-0006HZ-02
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIJ-0001xR-Tr
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608230791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W/F3KVYWfcbzoXoKz2ytEMHII5eQGwfHiG5RXWvEG10=;
 b=ZZM1NHNJqwU7MlXYe4NcLbD/MZ8GFzC7X3abponTuj8zomvoNKP7mTQJrBPYhQT6uWC0RJ
 IUzgMzzxmQCZP+HY8sGiItD5t7TxcPu7Tc8wvpToxbh4BR8ATtPRrtGnae96wDudxEnBHF
 G9WHGU72E4Vu6MIjO1gjEbFif/0e49M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-kLeKRQsSMR6m4q7yFEtm_w-1; Thu, 17 Dec 2020 13:46:29 -0500
X-MC-Unique: kLeKRQsSMR6m4q7yFEtm_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D311C8145E0;
 Thu, 17 Dec 2020 18:46:27 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 996FF5D9CD;
 Thu, 17 Dec 2020 18:46:27 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 05/17] i386: move TCG accel files into tcg/
Date: Thu, 17 Dec 2020 13:46:08 -0500
Message-Id: <20201217184620.3945917-6-ehabkost@redhat.com>
In-Reply-To: <20201217184620.3945917-1-ehabkost@redhat.com>
References: <20201217184620.3945917-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

[claudio: moved cc_helper_template.h to tcg/ too]

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Message-Id: <20201212155530.23098-6-cfontana@suse.de>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/{ => tcg}/cc_helper_template.h |  0
 target/i386/meson.build                    | 14 +-------------
 target/i386/{ => tcg}/bpt_helper.c         |  0
 target/i386/{ => tcg}/cc_helper.c          |  0
 target/i386/{ => tcg}/excp_helper.c        |  0
 target/i386/{ => tcg}/fpu_helper.c         |  0
 target/i386/{ => tcg}/int_helper.c         |  0
 target/i386/{ => tcg}/mem_helper.c         |  0
 target/i386/tcg/meson.build                | 13 +++++++++++++
 target/i386/{ => tcg}/misc_helper.c        |  0
 target/i386/{ => tcg}/mpx_helper.c         |  0
 target/i386/{ => tcg}/seg_helper.c         |  0
 target/i386/{ => tcg}/smm_helper.c         |  0
 target/i386/{ => tcg}/svm_helper.c         |  0
 target/i386/{ => tcg}/tcg-stub.c           |  0
 target/i386/{ => tcg}/translate.c          |  0
 16 files changed, 14 insertions(+), 13 deletions(-)
 rename target/i386/{ => tcg}/cc_helper_template.h (100%)
 rename target/i386/{ => tcg}/bpt_helper.c (100%)
 rename target/i386/{ => tcg}/cc_helper.c (100%)
 rename target/i386/{ => tcg}/excp_helper.c (100%)
 rename target/i386/{ => tcg}/fpu_helper.c (100%)
 rename target/i386/{ => tcg}/int_helper.c (100%)
 rename target/i386/{ => tcg}/mem_helper.c (100%)
 create mode 100644 target/i386/tcg/meson.build
 rename target/i386/{ => tcg}/misc_helper.c (100%)
 rename target/i386/{ => tcg}/mpx_helper.c (100%)
 rename target/i386/{ => tcg}/seg_helper.c (100%)
 rename target/i386/{ => tcg}/smm_helper.c (100%)
 rename target/i386/{ => tcg}/svm_helper.c (100%)
 rename target/i386/{ => tcg}/tcg-stub.c (100%)
 rename target/i386/{ => tcg}/translate.c (100%)

diff --git a/target/i386/cc_helper_template.h b/target/i386/tcg/cc_helper_template.h
similarity index 100%
rename from target/i386/cc_helper_template.h
rename to target/i386/tcg/cc_helper_template.h
diff --git a/target/i386/meson.build b/target/i386/meson.build
index 284d52ab81..750471c9f3 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -5,19 +5,6 @@ i386_ss.add(files(
   'helper.c',
   'xsave_helper.c',
 ))
-i386_ss.add(when: 'CONFIG_TCG', if_true: files(
-  'bpt_helper.c',
-  'cc_helper.c',
-  'excp_helper.c',
-  'fpu_helper.c',
-  'int_helper.c',
-  'mem_helper.c',
-  'misc_helper.c',
-  'mpx_helper.c',
-  'seg_helper.c',
-  'smm_helper.c',
-  'svm_helper.c',
-  'translate.c'), if_false: files('tcg-stub.c'))
 i386_ss.add(when: 'CONFIG_SEV', if_true: files('sev.c'), if_false: files('sev-stub.c'))
 
 i386_softmmu_ss = ss.source_set()
@@ -32,6 +19,7 @@ subdir('kvm')
 subdir('hax')
 subdir('whpx')
 subdir('hvf')
+subdir('tcg')
 
 target_arch += {'i386': i386_ss}
 target_softmmu_arch += {'i386': i386_softmmu_ss}
diff --git a/target/i386/bpt_helper.c b/target/i386/tcg/bpt_helper.c
similarity index 100%
rename from target/i386/bpt_helper.c
rename to target/i386/tcg/bpt_helper.c
diff --git a/target/i386/cc_helper.c b/target/i386/tcg/cc_helper.c
similarity index 100%
rename from target/i386/cc_helper.c
rename to target/i386/tcg/cc_helper.c
diff --git a/target/i386/excp_helper.c b/target/i386/tcg/excp_helper.c
similarity index 100%
rename from target/i386/excp_helper.c
rename to target/i386/tcg/excp_helper.c
diff --git a/target/i386/fpu_helper.c b/target/i386/tcg/fpu_helper.c
similarity index 100%
rename from target/i386/fpu_helper.c
rename to target/i386/tcg/fpu_helper.c
diff --git a/target/i386/int_helper.c b/target/i386/tcg/int_helper.c
similarity index 100%
rename from target/i386/int_helper.c
rename to target/i386/tcg/int_helper.c
diff --git a/target/i386/mem_helper.c b/target/i386/tcg/mem_helper.c
similarity index 100%
rename from target/i386/mem_helper.c
rename to target/i386/tcg/mem_helper.c
diff --git a/target/i386/tcg/meson.build b/target/i386/tcg/meson.build
new file mode 100644
index 0000000000..02794226c2
--- /dev/null
+++ b/target/i386/tcg/meson.build
@@ -0,0 +1,13 @@
+i386_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'bpt_helper.c',
+  'cc_helper.c',
+  'excp_helper.c',
+  'fpu_helper.c',
+  'int_helper.c',
+  'mem_helper.c',
+  'misc_helper.c',
+  'mpx_helper.c',
+  'seg_helper.c',
+  'smm_helper.c',
+  'svm_helper.c',
+  'translate.c'), if_false: files('tcg-stub.c'))
diff --git a/target/i386/misc_helper.c b/target/i386/tcg/misc_helper.c
similarity index 100%
rename from target/i386/misc_helper.c
rename to target/i386/tcg/misc_helper.c
diff --git a/target/i386/mpx_helper.c b/target/i386/tcg/mpx_helper.c
similarity index 100%
rename from target/i386/mpx_helper.c
rename to target/i386/tcg/mpx_helper.c
diff --git a/target/i386/seg_helper.c b/target/i386/tcg/seg_helper.c
similarity index 100%
rename from target/i386/seg_helper.c
rename to target/i386/tcg/seg_helper.c
diff --git a/target/i386/smm_helper.c b/target/i386/tcg/smm_helper.c
similarity index 100%
rename from target/i386/smm_helper.c
rename to target/i386/tcg/smm_helper.c
diff --git a/target/i386/svm_helper.c b/target/i386/tcg/svm_helper.c
similarity index 100%
rename from target/i386/svm_helper.c
rename to target/i386/tcg/svm_helper.c
diff --git a/target/i386/tcg-stub.c b/target/i386/tcg/tcg-stub.c
similarity index 100%
rename from target/i386/tcg-stub.c
rename to target/i386/tcg/tcg-stub.c
diff --git a/target/i386/translate.c b/target/i386/tcg/translate.c
similarity index 100%
rename from target/i386/translate.c
rename to target/i386/tcg/translate.c
-- 
2.28.0


