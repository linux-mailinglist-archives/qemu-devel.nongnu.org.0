Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8EF240C00
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 19:32:47 +0200 (CEST)
Received: from localhost ([::1]:57988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5BfC-0001gB-G8
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 13:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BKM-0000iN-Vo
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:11:14 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:20814
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BKJ-00037V-EX
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597079469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=+loNnJtS6lAMaHqmpwGBHg/SqQDyBtkDdFqYy6B+sOA=;
 b=OpHlxtGN8YovOHUx6MJeyzmb/I6tn+C7+Y3VaNJW4yiHmqXtPmp8RIKaRAK7D1/jbAnZXN
 p8C3NyoSLt02SWs3nEojY1GPDl5VPmUa7fVafF2/l4bYIZ2ruZqccQN8chSRHFyJzNSwBH
 3HcLMnkio8NFqbQSa+7EzYdpunGL+t0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-dwwRRPjyMpqRO1f2FWM0bQ-1; Mon, 10 Aug 2020 13:11:07 -0400
X-MC-Unique: dwwRRPjyMpqRO1f2FWM0bQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE48D91271
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:11:06 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 407D687D70
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:11:06 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 070/147] meson: convert most of softmmu/
Date: Mon, 10 Aug 2020 19:07:48 +0200
Message-Id: <1597079345-42801-71-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 04:13:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leave out main.c, it's special due to fuzzing.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build           |  2 ++
 softmmu/Makefile.objs | 14 +-------------
 softmmu/meson.build   | 10 ++++++++++
 3 files changed, 13 insertions(+), 13 deletions(-)
 create mode 100644 softmmu/meson.build

diff --git a/meson.build b/meson.build
index c923e89..3481c5b 100644
--- a/meson.build
+++ b/meson.build
@@ -633,6 +633,8 @@ softmmu_ss.add(when: ['CONFIG_FDT', fdt],  if_true: [files('device_tree.c')])
 
 common_ss.add(files('cpus-common.c'))
 
+subdir('softmmu')
+
 # needed for fuzzing binaries
 subdir('tests/qtest/libqos')
 
diff --git a/softmmu/Makefile.objs b/softmmu/Makefile.objs
index a414a74..ebcfd15 100644
--- a/softmmu/Makefile.objs
+++ b/softmmu/Makefile.objs
@@ -1,14 +1,2 @@
 softmmu-main-y = softmmu/main.o
-
-obj-y += arch_init.o
-obj-y += cpus.o
-obj-y += cpu-throttle.o
-obj-y += balloon.o
-obj-y += ioport.o
-obj-y += memory.o
-obj-y += memory_mapping.o
-
-obj-y += qtest.o
-
-obj-y += vl.o
-vl.o-cflags := $(GPROF_CFLAGS) $(SDL_CFLAGS)
+main.o-cflags := $(GPROF_CFLAGS) $(SDL_CFLAGS)
diff --git a/softmmu/meson.build b/softmmu/meson.build
new file mode 100644
index 0000000..95d38df
--- /dev/null
+++ b/softmmu/meson.build
@@ -0,0 +1,10 @@
+specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
+  'arch_init.c',
+  'balloon.c',
+  'cpus.c',
+  'cpu-throttle.c',
+  'ioport.c',
+  'memory.c',
+  'memory_mapping.c',
+  'qtest.c',
+  'vl.c'))
-- 
1.8.3.1



