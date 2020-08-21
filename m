Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDAE24D3CA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:20:31 +0200 (CEST)
Received: from localhost ([::1]:55906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k955y-0005Tr-0y
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Ei-0003gl-4L
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45580
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94EU-0001uY-QF
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R4mcNZsDJxgsf4Moj1IYP4Nt+CBemc9nLyzTnLf1pqw=;
 b=htDpZdp25sfMA/YIE/krgPJWcPkM9hqrodr4gXcQODz/MDZhDOoZaUCd5JccYrQHwKFiZq
 4OZs3UgYvz1/HHjIrYB1seAOgfYW6+3l9qte+wX7x7mbJlwrx/94rNTEjtbEijUoK0muFp
 H9ikShk0G3p2zWyTcl3vC5SRA8bjUyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-JDlLAr4RMIyY7EwNKYJYLA-1; Fri, 21 Aug 2020 06:25:11 -0400
X-MC-Unique: JDlLAr4RMIyY7EwNKYJYLA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7973156B35
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:25:10 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 247F810098AE;
 Fri, 21 Aug 2020 10:25:10 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 121/152] meson: convert hw/cpu
Date: Fri, 21 Aug 2020 06:22:58 -0400
Message-Id: <20200821102329.29777-122-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:55:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/Makefile.objs     | 1 -
 hw/cpu/Makefile.objs | 5 -----
 hw/cpu/meson.build   | 6 ++++++
 hw/meson.build       | 1 +
 4 files changed, 7 insertions(+), 6 deletions(-)
 delete mode 100644 hw/cpu/Makefile.objs
 create mode 100644 hw/cpu/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 6fce6a1473..97ad30295e 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -5,7 +5,6 @@ devices-dirs-y += adc/
 devices-dirs-y += audio/
 devices-dirs-y += block/
 devices-dirs-y += char/
-devices-dirs-y += cpu/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/cpu/Makefile.objs b/hw/cpu/Makefile.objs
deleted file mode 100644
index 8db9e8a7b3..0000000000
--- a/hw/cpu/Makefile.objs
+++ /dev/null
@@ -1,5 +0,0 @@
-obj-$(CONFIG_ARM11MPCORE) += arm11mpcore.o
-obj-$(CONFIG_REALVIEW) += realview_mpcore.o
-obj-$(CONFIG_A9MPCORE) += a9mpcore.o
-obj-$(CONFIG_A15MPCORE) += a15mpcore.o
-common-obj-y += core.o cluster.o
diff --git a/hw/cpu/meson.build b/hw/cpu/meson.build
new file mode 100644
index 0000000000..9e52fee9e7
--- /dev/null
+++ b/hw/cpu/meson.build
@@ -0,0 +1,6 @@
+softmmu_ss.add(files('core.c', 'cluster.c'))
+
+specific_ss.add(when: 'CONFIG_ARM11MPCORE', if_true: files('arm11mpcore.c'))
+specific_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_mpcore.c'))
+specific_ss.add(when: 'CONFIG_A9MPCORE', if_true: files('a9mpcore.c'))
+specific_ss.add(when: 'CONFIG_A15MPCORE', if_true: files('a15mpcore.c'))
diff --git a/hw/meson.build b/hw/meson.build
index dacd26c561..103da4840b 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,4 +1,5 @@
 subdir('core')
+subdir('cpu')
 subdir('display')
 subdir('dma')
 subdir('gpio')
-- 
2.26.2



