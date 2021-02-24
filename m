Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2399B324444
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:02:57 +0100 (CET)
Received: from localhost ([::1]:40636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzR2-0003T1-37
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:02:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzLZ-0005y0-Ro
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:57:18 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzLY-0002YC-Aq
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:57:17 -0500
Received: by mail-wm1-x32f.google.com with SMTP id x16so2673505wmk.3
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SiKct+M+wtr4U71Ny6VAtldfVVYXkxlSi7jEmg06sMA=;
 b=TSr+JnTS5IDmJFsvX7XoigQtWD6I6E0PWO9DC0VAyOUMmGE1egdRl3PC9EWdeGOFcj
 6rlqdl3SE0aBOYmZ3OUdaoFgtelyLDgudhoj7PsU58LIFHagGLH9HXJQch7otyVyOnyL
 pCGO9mmWbh6OIMVOUcaHRIBqY8wcONI/gecjHaG5rYfPbxmsoeUR6yANR2Xcj417+IkA
 /r4nP68L/0XJaYtfF23LS4CxRRVZ3InlQeqtxkoL5kL5+D4y8K9h5JuL2YHtiLzNISiN
 hskCFSNYPDRKIexje4d7/4VZo4luai90qHG/zoGLOBDIrIHTGXRJs/QoBD7ydOEAG0XZ
 T8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SiKct+M+wtr4U71Ny6VAtldfVVYXkxlSi7jEmg06sMA=;
 b=cyBMS+1IsDFeHjpGDhRWc/GjEQeih4l3of22HbgAXJJlFgi6unJkcTUp3rjGrDx4VU
 bGHw5hp1Oy7otTaXlsGT+iX4QRlMCuD8CkmR5A5CAn3ncN3V47zXXUchSLHV8lV66KyC
 InySJn52KTxBhQZnw6PIfgEG89Uur6kF1mAC/7K3OjyeMW0dCX7+Byd3HYU5bARqnyQ8
 DN7kDfmiCme59AVA8P1zFDKQulWtRDiHOCNYEC5MSu/F5Xt3zvLQn0w609rRGuoBnpkY
 Cy2fcwXXTqoJUqJfpo2iK2jNsy+ttx5cejOT8a8iuvJGsgKFsrCVqdNkgEcyJtqL4jE6
 sfHQ==
X-Gm-Message-State: AOAM531HwBJULJ4LXqUuXVPTGFnPNJnKvwrp5fp0EQcPSbHyWWYRP0Cx
 UpXBvQAbEk0FcWMIyDegJH7xxso8W98=
X-Google-Smtp-Source: ABdhPJy24/OQu/PbYb2lXrT+I4mWh+u8D1UennuLyShFn+SxhsvzaAdPft482ED6mjiI5lyG4UxYoA==
X-Received: by 2002:a1c:8041:: with SMTP id b62mr5207219wmd.0.1614193034691;
 Wed, 24 Feb 2021 10:57:14 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d15sm5291160wrb.43.2021.02.24.10.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:57:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/12] target/mips/meson: Introduce mips_tcg source set
Date: Wed, 24 Feb 2021 19:56:55 +0100
Message-Id: <20210224185706.3293058-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224185706.3293058-1-f4bug@amsat.org>
References: <20210224185706.3293058-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the 'mips_tcg' source set to collect TCG specific files.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/meson.build | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/mips/meson.build b/target/mips/meson.build
index 9741545440c..75c16524606 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -6,12 +6,13 @@
 ]
 
 mips_ss = ss.source_set()
-mips_ss.add(gen)
 mips_ss.add(files(
   'cpu.c',
   'gdbstub.c',
 ))
-mips_ss.add(when: 'CONFIG_TCG', if_true: files(
+mips_tcg_ss = ss.source_set()
+mips_tcg_ss.add(gen)
+mips_tcg_ss.add(files(
   'dsp_helper.c',
   'fpu_helper.c',
   'lmmi_helper.c',
@@ -36,5 +37,7 @@
   'cp0_helper.c',
 ))
 
+mips_ss.add_all(when: 'CONFIG_TCG', if_true: [mips_tcg_ss])
+
 target_arch += {'mips': mips_ss}
 target_softmmu_arch += {'mips': mips_softmmu_ss}
-- 
2.26.2


