Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6BC240CB0
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 20:10:01 +0200 (CEST)
Received: from localhost ([::1]:35726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5CFE-0005Hj-V8
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 14:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BLk-00030M-70
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:12:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42779
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BLd-0003Jo-QF
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597079551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Fsag6NNlvrRMOXzEODrkAFhBspEazhjN9jO0uivwZE=;
 b=gNv1Cc3XrM2y47YF3UJQTIIIn/U7/DrJmjUI04+yizvTqzqbqgj5ZxIHZ/bQEBpjPg6fJY
 HC7oE02I/zE6XxlsPrwNnB9hQJVTPoxtTv1qa6zeb1m6Z+EmBF5KlRf64yCAFVAw4rZti4
 h7YnAyEcq7vcIufY6+dTjLQ3kHEgP4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-vbDUshxANtST-6N4koWs2g-1; Mon, 10 Aug 2020 13:12:29 -0400
X-MC-Unique: vbDUshxANtST-6N4koWs2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D790100CCC0
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:12:28 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A11F5F1E9;
 Mon, 10 Aug 2020 17:12:27 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 120/147] meson: convert hw/audio
Date: Mon, 10 Aug 2020 19:08:38 +0200
Message-Id: <1597079345-42801-121-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 11:00:11
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/Makefile.objs       |  1 -
 hw/audio/Makefile.objs | 18 ------------------
 hw/audio/meson.build   | 14 ++++++++++++++
 hw/meson.build         |  1 +
 4 files changed, 15 insertions(+), 19 deletions(-)
 delete mode 100644 hw/audio/Makefile.objs
 create mode 100644 hw/audio/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 9068859..c0cbc0f 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -2,7 +2,6 @@ ifeq ($(CONFIG_SOFTMMU), y)
 devices-dirs-$(call lor,$(CONFIG_VIRTIO_9P),$(call land,$(CONFIG_VIRTFS),$(CONFIG_XEN))) += 9pfs/
 devices-dirs-y += acpi/
 devices-dirs-y += adc/
-devices-dirs-y += audio/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/audio/Makefile.objs b/hw/audio/Makefile.objs
deleted file mode 100644
index 63db383..0000000
--- a/hw/audio/Makefile.objs
+++ /dev/null
@@ -1,18 +0,0 @@
-# Sound
-common-obj-$(CONFIG_SB16) += sb16.o
-common-obj-$(CONFIG_ES1370) += es1370.o
-common-obj-$(CONFIG_AC97) += ac97.o
-common-obj-$(CONFIG_ADLIB) += fmopl.o adlib.o
-common-obj-$(CONFIG_GUS) += gus.o gusemu_hal.o gusemu_mixer.o
-common-obj-$(CONFIG_CS4231A) += cs4231a.o
-common-obj-$(CONFIG_HDA) += intel-hda.o hda-codec.o
-
-common-obj-$(CONFIG_PCSPK) += pcspk.o
-common-obj-$(CONFIG_WM8750) += wm8750.o
-common-obj-$(CONFIG_PL041) += pl041.o lm4549.o
-
-common-obj-$(CONFIG_CS4231) += cs4231.o
-common-obj-$(CONFIG_MARVELL_88W8618) += marvell_88w8618.o
-common-obj-$(CONFIG_MILKYMIST) += milkymist-ac97.o
-
-common-obj-y += soundhw.o
diff --git a/hw/audio/meson.build b/hw/audio/meson.build
new file mode 100644
index 0000000..549e9a0
--- /dev/null
+++ b/hw/audio/meson.build
@@ -0,0 +1,14 @@
+softmmu_ss.add(files('soundhw.c'))
+softmmu_ss.add(when: 'CONFIG_AC97', if_true: files('ac97.c'))
+softmmu_ss.add(when: 'CONFIG_ADLIB', if_true: files('fmopl.c', 'adlib.c'))
+softmmu_ss.add(when: 'CONFIG_CS4231', if_true: files('cs4231.c'))
+softmmu_ss.add(when: 'CONFIG_CS4231A', if_true: files('cs4231a.c'))
+softmmu_ss.add(when: 'CONFIG_ES1370', if_true: files('es1370.c'))
+softmmu_ss.add(when: 'CONFIG_GUS', if_true: files('gus.c', 'gusemu_hal.c', 'gusemu_mixer.c'))
+softmmu_ss.add(when: 'CONFIG_HDA', if_true: files('intel-hda.c', 'hda-codec.c'))
+softmmu_ss.add(when: 'CONFIG_MARVELL_88W8618', if_true: files('marvell_88w8618.c'))
+softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-ac97.c'))
+softmmu_ss.add(when: 'CONFIG_PCSPK', if_true: files('pcspk.c'))
+softmmu_ss.add(when: 'CONFIG_PL041', if_true: files('pl041.c', 'lm4549.c'))
+softmmu_ss.add(when: 'CONFIG_SB16', if_true: files('sb16.c'))
+softmmu_ss.add(when: 'CONFIG_WM8750', if_true: files('wm8750.c'))
diff --git a/hw/meson.build b/hw/meson.build
index f968aa8..624335b 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,3 +1,4 @@
+subdir('audio')
 subdir('block')
 subdir('char')
 subdir('core')
-- 
1.8.3.1



