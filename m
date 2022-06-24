Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF34A559CB1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:56:39 +0200 (CEST)
Received: from localhost ([::1]:57994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kjd-0001gq-8n
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4kiI-00009v-2B
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 10:55:14 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:46614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4kiG-0001E9-Fj
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 10:55:13 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so3034803pjj.5
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 07:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ePIzjc8p0GQK/b1H6PE2qm3C5W6QXFNwOreLMVSVTwg=;
 b=T7spTemvuPdGWyxQfHZgd9AS3Riqqecw5hLUeCST1JX/L0WL4IdLE6w8wpZkQm/1Pe
 V3qtng+3TQvYTUr/RR9MSNtOjOsbxsz0Whvd+NrUBLerDI7aFtKDTGxazj02kHUKoeJV
 2aqgNI2CgysxzPM/ggkFM3ayu7UCC5tuuocLOmKf4LGcop1dG+UzMHz3l4gDNSEmH80r
 mRadEAPBILi34enqTYdYfd0LyIjAEbGY+Fv2Fv+KzN4cNSp65aG+bGiGsHWQpGczRZvE
 kZBHA+uyb2uclITr85b7+5oCBxqXCVsGd5PQlKrr3TrP+qwCrskLLJ9BorSqzpwpql+j
 l6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ePIzjc8p0GQK/b1H6PE2qm3C5W6QXFNwOreLMVSVTwg=;
 b=DoZ8Id2DWNebZxUK/lfAGp3YbbU/M12L9WxYxfoKFY6MNDS3UN9ebL63+vgJVR4b0c
 ELqs3mKzJvGCtLPQ9i0NfOO2vOyVE6lNeU3flKhShvYPh4DiK/OTJi+AKJNl7IYuSaai
 u5Y39rGb6TI6MhOL+35qefIXicteJC3iW9jm7P9Glj32jccLvpKtW5vVeFJjUHBZCBBs
 bQj6TsTo74SjvVeoj+pvA6TlPnTEY4n052LCcdb2CgB0+6STSI814Y0wPNeEBaKoUtGK
 uzjqKdaKAQMceZ/1jZ7p1sDuDUfnjtWPgb+qIS+W3iB/Eh+4aWplZ8lwZ81odndAZhzN
 4fSw==
X-Gm-Message-State: AJIora8Uy9x7ZJMldcVb7y8daScz8yTquWqVhdCrnGviPYrrn5OV31UM
 BLn7+vDioQbgunbUsMUXYf0=
X-Google-Smtp-Source: AGRyM1sgmWuDu8ZYHTLEhnS2fhtlXLHYjlFxOWDkWRqL9Jrk8GJ86Eu+0iV8qQrJIAaDSGogWKT2+w==
X-Received: by 2002:a17:902:bd44:b0:16a:4522:aa16 with SMTP id
 b4-20020a170902bd4400b0016a4522aa16mr15012858plx.64.1656082511099; 
 Fri, 24 Jun 2022 07:55:11 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:80ba:2fd0:a1d1:c891])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a17090b011800b001d95c09f877sm1747144pjz.35.2022.06.24.07.55.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Jun 2022 07:55:10 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH] qga: Relocate a path emitted in the help text
Date: Fri, 24 Jun 2022 23:54:55 +0900
Message-Id: <20220624145455.50058-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 qga/main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qga/main.c b/qga/main.c
index c373fec3ee6..5f1efa23334 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -223,6 +223,10 @@ void reopen_fd_to_null(int fd)
 
 static void usage(const char *cmd)
 {
+#ifdef CONFIG_FSFREEZE
+    g_autofree char *fsfreeze_hook = get_relocated_path(QGA_FSFREEZE_HOOK_DEFAULT);
+#endif
+
     printf(
 "Usage: %s [-m <method> -p <path>] [<options>]\n"
 "QEMU Guest Agent " QEMU_FULL_VERSION "\n"
@@ -270,7 +274,7 @@ QEMU_HELP_BOTTOM "\n"
     , cmd, QGA_VIRTIO_PATH_DEFAULT, QGA_SERIAL_PATH_DEFAULT,
     dfl_pathnames.pidfile,
 #ifdef CONFIG_FSFREEZE
-    QGA_FSFREEZE_HOOK_DEFAULT,
+    fsfreeze_hook,
 #endif
     dfl_pathnames.state_dir);
 }
-- 
2.32.1 (Apple Git-133)


