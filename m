Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CBA11CF55
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 15:07:36 +0100 (CET)
Received: from localhost ([::1]:59912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifP7v-0002JV-4U
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 09:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43101)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifNzE-0004v0-DA
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:54:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifNzD-0008Mn-5T
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:54:32 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39597)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ifNzC-0008Lf-Ur
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:54:31 -0500
Received: by mail-wr1-x434.google.com with SMTP id y11so2616224wrt.6
 for <qemu-devel@nongnu.org>; Thu, 12 Dec 2019 04:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wHl5lU6t4e5jkqS3GA+ZrkV9FVQZHTyfosUh/T46DLc=;
 b=CIQd8OtoPD9tDSiev4cZ2V75Uy1hPZK/IerWKIvHkjeDfRDhjEQvdgYfdo28NsVSeH
 mr4AwVOVGyd9XwQPvlaMCQ1EGwT9JY8FxFZWbjGFAKWD/iHbjOSA4x00dCZzF6d+3PhH
 963FA/XMQJjMPnvnVKfugNyoE5K5jBJWIxWqXLiiRwafd7EkcluEmou96MsIlPszDjvP
 0lBl2Bbg7nOwvOr0e9MEFUBhF+Qb2eRX2Gbm8IKCEnnsa8BEgdXL7fvoMoBPgQyknzzG
 wHaxphjnmgCpmvz9KH+cABEgNOj90JFijoAJ7meDtioyGl2DiVHq8TuPTljdmR+FAbI7
 x8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wHl5lU6t4e5jkqS3GA+ZrkV9FVQZHTyfosUh/T46DLc=;
 b=Vp7YbfTNtEY0NJPh89ut8hqKBikeDeWrwrODbmKR9WTFOOE4yGeYjs+ExNlzmmQLvF
 fc9o9EGMCp3AgO2zo3yXj6kRp/rO+3seLExRsIVVMU9aWOLBr4S40UEZ2DBHDFFqFiGA
 bbi8AxHdieTD6w2QCUjcNhkRpVGnSqLKEAQ9eNKa16NHgNebPwwZ0nC++wGmJA7g8QUM
 WCi5+3jO+5BvVfnLa/BVCZkRCv7lr9cf8z1VrJS2NKcawEY2HlPAZmqGRqpuuiWYQ4BA
 KnZjqE/Tw6kRxJuolBxtjuSCApGmyYJbsUKbc1T/t+3CYlB7V+IMotJNXd626d5wpWRN
 Rvtg==
X-Gm-Message-State: APjAAAUX5wBCf/fhhyMzzEJXZgdAcZaUMLjn3QPD9BMK1lt/W9arAKyn
 ffjdONEeFpc1zN45Zykz2l8Q+s8z
X-Google-Smtp-Source: APXvYqxSLa358/VfY5IzoEoqTn0J1VFvcs/Ba0y5OcqHmuv1hkF/8eR9Bg++1+jPI0wkuQSLaJw+Cg==
X-Received: by 2002:adf:fc03:: with SMTP id i3mr6329547wrr.306.1576155269824; 
 Thu, 12 Dec 2019 04:54:29 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n189sm5193825wme.33.2019.12.12.04.54.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Dec 2019 04:54:28 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 092/132] meson: convert hw/hyperv
Date: Thu, 12 Dec 2019 13:52:16 +0100
Message-Id: <1576155176-2464-93-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
References: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/Makefile.objs        | 1 -
 hw/hyperv/Makefile.objs | 2 --
 hw/hyperv/meson.build   | 2 ++
 hw/meson.build          | 1 +
 4 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 hw/hyperv/Makefile.objs
 create mode 100644 hw/hyperv/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 0213b1b..2ca159e 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -10,7 +10,6 @@ devices-dirs-y += cpu/
 devices-dirs-y += display/
 devices-dirs-y += dma/
 devices-dirs-y += gpio/
-devices-dirs-$(CONFIG_HYPERV) += hyperv/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/hyperv/Makefile.objs b/hw/hyperv/Makefile.objs
deleted file mode 100644
index edaca2f..0000000
--- a/hw/hyperv/Makefile.objs
+++ /dev/null
@@ -1,2 +0,0 @@
-obj-y += hyperv.o
-obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
diff --git a/hw/hyperv/meson.build b/hw/hyperv/meson.build
new file mode 100644
index 0000000..98663ec
--- /dev/null
+++ b/hw/hyperv/meson.build
@@ -0,0 +1,2 @@
+specific_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'))
+specific_ss.add(when: 'CONFIG_HYPERV_TESTDEV', if_true: files('hyperv_testdev.c'))
diff --git a/hw/meson.build b/hw/meson.build
index e59ed44..bfd4d59 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,4 +1,5 @@
 subdir('core')
+subdir('hyperv')
 subdir('i2c')
 subdir('ide')
 subdir('input')
-- 
1.8.3.1



