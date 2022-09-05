Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90325ADA5C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 22:43:13 +0200 (CEST)
Received: from localhost ([::1]:40370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVIw4-0007d4-IA
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 16:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVIuG-00060f-TP
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 16:41:21 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVIuF-0007Ij-7b
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 16:41:20 -0400
Received: by mail-wr1-x433.google.com with SMTP id bp20so12196351wrb.9
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 13:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=1gXEqNp97BJqTtNSKLnfDY+sn5nP3z0fCG4nvT0whvw=;
 b=xstHJyrmgryigyAlhIeUxfp+IrwmnPKakbtgJefRx2u0D6v5KrmxoHGkmAPuCj93nj
 6bc82kEG1rbaM7EPzUjBeuMtRETzuKGiyBYaPcQmMXshGOIJ/p9+U3Zy94w/n5oEzL3C
 NXAfK0NDXXiGIuF9sy6YKEiOM5a/9P8QijEWECSCDtPWdJm/J1+KwZS48/muw9RP3Y3D
 GBfeW8pbjVsdIFqmmwxfP3BGreVLY5eO0ND+JzNKjjEWGchsB30I8+qgfibMYqygW2Xb
 kxkSqFdrH2OV8sMoYhoRycLd/DGlz2NNtEI8HvY9r2+zLFUlCs8m6YFcUmyT7/+i99Rt
 6I3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=1gXEqNp97BJqTtNSKLnfDY+sn5nP3z0fCG4nvT0whvw=;
 b=ZDUzMaAlGeYftBRxQIoMMT4PUscEp6rOU7wWnvktt5nPTPwmquLy8Zs6rjrJaqCnmt
 zrWFf59duK6u2yfF7LtddeyJtBNZ+nnmo/xYAvuOnysOB3wqPd+t/oAZgyhcpI6xzbkg
 QPq8Nhf9WdfcBxKtQHfHCNfE+t8g43dZlaKmRpq68WQeFG5ce6ZeQvyJpipFcQzER78d
 6JmFpK1LeyEpgkN58Z/CvHKESnUDsHgtmT5L0ABPPzLSO8qjNzuxmoOhbPNKQr2nPJZI
 MohTbkW2pcku8UD0je66ItSrdlakFuyl/9+gpa3J2AXDIg84LQ6B2G7gyiI8CWyD59qe
 8sNA==
X-Gm-Message-State: ACgBeo0q0ZOHopkcRv3w4oyesj5Vdnjl+pIeS5nSzpB4JfzG5A9v1Ejo
 CkKMoEO82usIyDUICb7rdsTlCsElqe9Bc1Nc
X-Google-Smtp-Source: AA6agR4OPRe6wyyFRwlCht5p8FZQE1nwQgyfOIrCMtLMAPlYWFoMr+ezueuZQTQ23IRYqz2MmAQOgA==
X-Received: by 2002:a5d:64ab:0:b0:226:d997:ad5c with SMTP id
 m11-20020a5d64ab000000b00226d997ad5cmr21754584wrp.602.1662410477261; 
 Mon, 05 Sep 2022 13:41:17 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003a31fd05e0fsm36667023wms.2.2022.09.05.13.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 13:41:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: xieyongji@bytedance.com,
	pbonzini@redhat.com,
	stefanha@redhat.com
Subject: [PATCH] build: Regenerate meson-buildoptions.sh
Date: Mon,  5 Sep 2022 21:41:14 +0100
Message-Id: <20220905204114.208969-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Regeneration was missed by the previous update.

Fixes: 2a2359b84407 ("vduse-blk: Implement vduse-blk export")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 scripts/meson-buildoptions.sh | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 359b04e0e6..300ba8b212 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -42,12 +42,13 @@ meson_options_help() {
   printf "%s\n" '  --enable-trace-backends=CHOICES'
   printf "%s\n" '                           Set available tracing backends [log] (choices:'
   printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
-  printf "%s\n" '  --firmwarepath=VALUES    search PATH for firmware files [share/qemu-firmware]'
+  printf "%s\n" '  --firmwarepath=VALUES    search PATH for firmware files [share/qemu-'
+  printf "%s\n" '                           firmware]'
   printf "%s\n" '  --iasl=VALUE             Path to ACPI disassembler'
   printf "%s\n" '  --includedir=VALUE       Header file directory [include]'
   printf "%s\n" '  --interp-prefix=VALUE    where to find shared libraries etc., use %M for'
   printf "%s\n" '                           cpu name [/usr/gnemul/qemu-%M]'
-  printf "%s\n" '  --libdir=VALUE           Library directory [lib64]'
+  printf "%s\n" '  --libdir=VALUE           Library directory [lib/x86_64-linux-gnu]'
   printf "%s\n" '  --libexecdir=VALUE       Library executable directory [libexec]'
   printf "%s\n" '  --localedir=VALUE        Locale data directory [share/locale]'
   printf "%s\n" '  --localstatedir=VALUE    Localstate data directory [/var/local]'
@@ -154,6 +155,8 @@ meson_options_help() {
   printf "%s\n" '  usb-redir       libusbredir support'
   printf "%s\n" '  vde             vde network backend support'
   printf "%s\n" '  vdi             vdi image format support'
+  printf "%s\n" '  vduse-blk-export'
+  printf "%s\n" '                  VDUSE block export support'
   printf "%s\n" '  vfio-user-server'
   printf "%s\n" '                  vfio-user server support'
   printf "%s\n" '  vhost-crypto    vhost-user crypto backend support'
@@ -162,8 +165,6 @@ meson_options_help() {
   printf "%s\n" '  vhost-user      vhost-user backend support'
   printf "%s\n" '  vhost-user-blk-server'
   printf "%s\n" '                  build vhost-user-blk server'
-  printf "%s\n" '  vduse-blk-export'
-  printf "%s\n" '                  VDUSE block export support'
   printf "%s\n" '  vhost-vdpa      vhost-vdpa kernel backend support'
   printf "%s\n" '  virglrenderer   virgl rendering support'
   printf "%s\n" '  virtfs          virtio-9p support'
@@ -422,6 +423,8 @@ _meson_option_parse() {
     --disable-vde) printf "%s" -Dvde=disabled ;;
     --enable-vdi) printf "%s" -Dvdi=enabled ;;
     --disable-vdi) printf "%s" -Dvdi=disabled ;;
+    --enable-vduse-blk-export) printf "%s" -Dvduse_blk_export=enabled ;;
+    --disable-vduse-blk-export) printf "%s" -Dvduse_blk_export=disabled ;;
     --enable-vfio-user-server) printf "%s" -Dvfio_user_server=enabled ;;
     --disable-vfio-user-server) printf "%s" -Dvfio_user_server=disabled ;;
     --enable-vhost-crypto) printf "%s" -Dvhost_crypto=enabled ;;
@@ -434,8 +437,6 @@ _meson_option_parse() {
     --disable-vhost-user) printf "%s" -Dvhost_user=disabled ;;
     --enable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=enabled ;;
     --disable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=disabled ;;
-    --enable-vduse-blk-export) printf "%s" -Dvduse_blk_export=enabled ;;
-    --disable-vduse-blk-export) printf "%s" -Dvduse_blk_export=disabled ;;
     --enable-vhost-vdpa) printf "%s" -Dvhost_vdpa=enabled ;;
     --disable-vhost-vdpa) printf "%s" -Dvhost_vdpa=disabled ;;
     --enable-virglrenderer) printf "%s" -Dvirglrenderer=enabled ;;
-- 
2.34.1


