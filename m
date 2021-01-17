Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8687A2F94F1
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 20:37:17 +0100 (CET)
Received: from localhost ([::1]:40556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1DrQ-0001Uz-K4
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 14:37:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1DhB-0000KT-RQ; Sun, 17 Jan 2021 14:26:42 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:55547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1DhA-0005cM-Fc; Sun, 17 Jan 2021 14:26:41 -0500
Received: by mail-wm1-x32b.google.com with SMTP id c124so11719241wma.5;
 Sun, 17 Jan 2021 11:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D/vhGf9tYrzI/+Qv47CWtkJxcBt3ZEhYVSaLznm82dE=;
 b=dDIS/7Ww+gYmBQD8IMElHJNn7JWSXIxRghqGgbo8cMyxwhw8p/6ubLO11lw+vm1ZQ2
 UqqHLYgUegb0abI5GEcwCObm3ghvemj1qkIY9BWUUpsuc3nBY1fIR/5egA46QCzJpq35
 YJQclTTYuUqdvZXRJdbSN3tn56EW9NfesLJaMLMXDaPPkk39A5cak7kHtnv/DJmGiEIe
 BCYLb69WO7aLof7gZKSu2Dgs5ZiWtWGYEGSU7MrLm1rf16ioj+u7Ckxh8gVoPGHA3trD
 tVed2SiZPpXpVTRpAdMFFkMSRsdt48VTaXD9guI/2L+4SqYbTEd8DbKlwJwfL6cijqzk
 wmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=D/vhGf9tYrzI/+Qv47CWtkJxcBt3ZEhYVSaLznm82dE=;
 b=LhSVJ5HiIoV5l9Srbs5EPezIrD9Z31JYO+BaXj/NMMD+sErx2eCq4ARbuR5jykyG18
 aHHKSyV4AULcULswq4COUcU8B6RXWzpyJbEeUyD+u+dcMzYcoauDM7TQgLO1MSddtNOm
 4Y6YAY0837/a5iEl/agriIHXDzqe7PeZTCDgY9P3Zk/NFrcDdEoX1yVS85otYsY8FNop
 G3AFgSZiihD6jQ2Ia44NXkZLIdzW/+lz/VHeNpGkiuCv7pS1GFItSFSuY4/ROiCxjMPd
 D8+3wBgOwnRP9Fv8QW2Rr4fAziRPa1qS2f6Gg+IpFG5NDBI3lrNOSUKOekrPdFapOsbB
 eQew==
X-Gm-Message-State: AOAM532Ven8f5L4zXl2b7k0x8S+cpOSBIGlFaGsq8CJhROb2BIqeeiG3
 8VFDFHlehOgPi9kcru0V5Kc=
X-Google-Smtp-Source: ABdhPJzIcaeD79hTA/Hun2LIAf5jPVodgZiUbtt9nKaY6Exb5IX56l+RDcFbxAto+c8yERamWN+R+w==
X-Received: by 2002:a05:600c:255:: with SMTP id
 21mr17520686wmj.69.1610911599053; 
 Sun, 17 Jan 2021 11:26:39 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id j7sm21720217wmb.40.2021.01.17.11.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:26:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 20/20] migration/vmstate: Simplify vmstate for
 user-mode CPU
Date: Sun, 17 Jan 2021 20:24:46 +0100
Message-Id: <20210117192446.23753-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

User-mode wants an empty vmstate for the CPUs. We can
use the generic vmstate_no_state_to_migrate object which
is the same.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h       | 2 +-
 include/migration/vmstate.h | 3 ---
 stubs/vmstate.c             | 9 ---------
 3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c79a58db9b9..01e75cc7403 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1132,7 +1132,7 @@ bool target_words_bigendian(void);
 #ifdef CONFIG_SOFTMMU
 extern const VMStateDescription vmstate_cpu_common;
 #else
-#define vmstate_cpu_common vmstate_user_mode_cpu_dummy
+#define vmstate_cpu_common vmstate_no_state_to_migrate
 #endif
 
 #define VMSTATE_CPU() {                                                     \
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 50559598eac..dfe20b5caa1 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -194,9 +194,6 @@ struct VMStateDescription {
     const VMStateDescription **subsections;
 };
 
-#if defined(CONFIG_USER_ONLY)
-extern const VMStateDescription vmstate_user_mode_cpu_dummy;
-#endif
 extern const VMStateDescription vmstate_no_state_to_migrate;
 
 extern const VMStateInfo vmstate_info_bool;
diff --git a/stubs/vmstate.c b/stubs/vmstate.c
index 1d0e03e233b..c360a929f60 100644
--- a/stubs/vmstate.c
+++ b/stubs/vmstate.c
@@ -1,15 +1,6 @@
 #include "qemu/osdep.h"
 #include "migration/vmstate.h"
 
-#if defined(CONFIG_USER_ONLY)
-const VMStateDescription vmstate_user_mode_cpu_dummy = {
-    .name = "cpu_common_user",
-    .fields = (VMStateField[]) {
-        VMSTATE_END_OF_LIST()
-    },
-};
-#endif
-
 const VMStateDescription vmstate_no_state_to_migrate = {
     .name = "empty-state",
     .fields = (VMStateField[]) {
-- 
2.26.2


