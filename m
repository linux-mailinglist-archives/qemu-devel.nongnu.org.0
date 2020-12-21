Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70962DFD0A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 15:51:44 +0100 (CET)
Received: from localhost ([::1]:54986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMXH-0002zm-NL
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 09:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQp-0004lz-5E
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:04 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQn-0007gZ-Bx
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:02 -0500
Received: by mail-wr1-x433.google.com with SMTP id m5so11278395wrx.9
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LfsOLhAWMVJ2deCuay3ook5aFVWeXApOj+vJo+lp9yU=;
 b=CbWPl941A2AOf73zAtC4RGdcaEXbNbJj+u3XJ1UXwy4M5q+Dj/kvxFQjRuiPR4UUgN
 Rv0FlvFPFLjiv7XIMVTHi1C1AA78nJGFviDgeRNWZOw6mrTiBxm3gBKUe2CPe2uLKYHA
 VoblwjKqmDkWwO63Ez/qvhhbbQRnMCbnTzm9EN0wloaOXA50//7C0d5Aoija4gP7nRI4
 PNescjBgAZIMxlFeH6BiHmSLh0XoonUUa2gI6uFHEDk1bUDY8ZSgNXGKRemDYuMMJ+yV
 rY/1Yyf1tBtq0lOolYIyfWBe8r4wkQnRVvXc43mqCGx8K0VDQDsrF0gj9nYor5vAjJz4
 e/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LfsOLhAWMVJ2deCuay3ook5aFVWeXApOj+vJo+lp9yU=;
 b=C5wBJY9v6OFnziwggeqUAR7HxOmOpZ1G4k2viMCTdgejgl+HdmhDsPbWWbGHC3k73o
 /3bGILgBBM6Is8xxDThuOE7X6hGu4eOlP7Zttn27MRhW51SRi/Bo7HdKJTwU/KUvUNRZ
 EOdx4obtzPPRM6YZiNQ/E9xe381WmtVjr0dPHF64PIfraQIS1EUlMcdwMek0KCGsGVYK
 FkW1JDNxg0SvWntwqbWty1g7qsB9Z86+tODe8uIc8OQRwsv79J0L5ZzOECxZQAJvPmB/
 1NBPbjeOb6l977NMOvZ/nb+fjYcumcEQiix6AeI2FNVB7uYc2qX+7F5VNJb48HRRaeVD
 Pwcw==
X-Gm-Message-State: AOAM533EPCgDjDMVGQvGkL1dmXMvGyGV4+XU/n480bfA1RRNRlBUrSOj
 sHLikMZT6Kt5jd1Y5ZOMxaWthVgN9EM=
X-Google-Smtp-Source: ABdhPJzCkQKCGnEQsj1WKQlxKO7fKI3UCmUKgpmbPy5gl5kpAJyodS5jww+Hol189F9x4qdtKtbJuw==
X-Received: by 2002:adf:8290:: with SMTP id 16mr18482341wrc.27.1608561900183; 
 Mon, 21 Dec 2020 06:45:00 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:44:59 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/55] vl: initialize displays _after_ exiting preconfiguration
Date: Mon, 21 Dec 2020 15:44:04 +0100
Message-Id: <20201221144447.26161-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
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



