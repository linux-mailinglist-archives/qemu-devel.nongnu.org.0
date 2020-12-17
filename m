Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6338D2DCE20
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:15:47 +0100 (CET)
Received: from localhost ([::1]:45568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kppNx-0007bX-T0
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:15:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppMO-00073z-EB
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:14:08 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppMM-0006ew-PC
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:14:08 -0500
Received: by mail-ej1-x62e.google.com with SMTP id lt17so36817127ejb.3
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LfsOLhAWMVJ2deCuay3ook5aFVWeXApOj+vJo+lp9yU=;
 b=RVeWqM+sSa/0ckyCm4aqpCfGURUDlJSm5UNmK31t6IVy6urfWYqWDqUFKvAkhg0VfD
 YOSj6C4jVixKY1nK+KPE3bnxA7vg/eBu112ZYCundEmn6jPhGKaepd5ZD/zX6K67IJ8R
 RAQAK8YQhkjVWfFwFCRpU4D2FuzK01AFx7aqjaIM6UYX6hzdUmgsBUUIgi3Y+em1Thst
 ugHFcigFNdHQ+JihGIWskR+wf4lX8ucu+2OGQ6t7ZT1bjEMBxiTBuJlPr+EvfCn8EAu0
 tbi2cVIxaM1lodevrjQD3ywl3LAAH43Cf9IHa9k0e9S/u1TaBc77Hf0uK1xLdTJVUkLD
 O3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=LfsOLhAWMVJ2deCuay3ook5aFVWeXApOj+vJo+lp9yU=;
 b=R9ChzKy4ABUTUIFF1Pg0nG42Hfsd1Mo8xA3iYzEgDv76Tedi3ZVBXt+PiPqA6XQj5u
 f42o7xdiD5Ua3NsphlL1dnh3dersE/GSb4Sxohox7w0l9SBjLab+tVHHhvmXYkxUmcPE
 weTkXkA43k70+dA5rv/DQgZIViow4veATc8mIDYKSmwAzilUbqi62vPto7xQP+N2pCh3
 nISydw2ypJuE5ovR3ZMcfuOS5hzlImkRu9DGgcscKtkDNDwMSc0+KTWs6M4FBqDCUIrw
 aHI51Hpvwry+R4SiU/Msyd+SP0IGuHx9TQ/gSe1I3UOJJ4BkIAewD6rCFAtYJNGiryho
 YFwA==
X-Gm-Message-State: AOAM533BnxR97AIr9TZVoM1EDfa7bXiMjU2i3USJ8UVdMfdmh9wsfXrW
 ZMXJbXvnok2xaDkdAGfo5Y6JwGCJWAs=
X-Google-Smtp-Source: ABdhPJxk8XvHAtXsP1JXPHkA3kka3m4XzGODp2LcDn2So1QbFsSeyVkvDcGoQsIjbXIPo/pG+Keoqg==
X-Received: by 2002:a17:906:56ca:: with SMTP id
 an10mr34126777ejc.498.1608196445214; 
 Thu, 17 Dec 2020 01:14:05 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e21sm22746778edv.96.2020.12.17.01.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:14:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vl: initialize displays _after_ exiting preconfiguration
Date: Thu, 17 Dec 2020 10:14:03 +0100
Message-Id: <20201217091403.36195-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Due to the renumbering of text consoles when graphical consoles are
created, init_displaystate must be called after all QemuConsoles are
created, i.e. after devices are created.

vl.c calls it from qemu_init_displays, while qmp_x_exit_preconfig is
where devices are created.  If qemu_init_displays is called before it,
the VGA graphical console does not come up.

Reported-by: Howard Spoelstra <hsp.cat7@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 0ed5c5ba93..7ddf405d76 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3529,10 +3529,10 @@ void qemu_init(int argc, char **argv, char **envp)
         exit(0);
     }
 
-    qemu_init_displays();
     if (!preconfig_requested) {
         qmp_x_exit_preconfig(&error_fatal);
     }
+    qemu_init_displays();
     accel_setup_post(current_machine);
     os_setup_post();
     resume_mux_open();
-- 
2.29.2


