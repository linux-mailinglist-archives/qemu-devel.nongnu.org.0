Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A486303131
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 02:29:07 +0100 (CET)
Received: from localhost ([::1]:41628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4DAI-0007T4-1l
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 20:29:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6T-0005eh-FM
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 20:25:11 -0500
Received: from mail-pf1-f177.google.com ([209.85.210.177]:37582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6O-00069o-ST
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 20:25:06 -0500
Received: by mail-pf1-f177.google.com with SMTP id 11so9465937pfu.4
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 17:25:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eMRwurTuLuNX0gT374+MwlAcTFDPiYipqZcijLZJHhI=;
 b=dX6U0cuOZb/kuyYG2OKMgHrXo76h9L5pny+JeRE/KfrT6yBLz0kYoXzIgisIgmsUhM
 RZCqCt4iulOJSyEZMEYB+mKOJxCxPPgxzVllNmo4FCZL4YphO2KLomC/WMzZvExuap2O
 MlLTZWKYnEB0IbKzWDEFU6WlefKeq1tOqMHaGoWyBBFk4oGVc4BN9rTWN0AoF6ccCfyC
 ZO9An/g7jsbgjRdmjFDd9n55gdVJEeplVigWe55RypzqkK5+dbO9+I1Lyb3Aeg6Dm1fX
 WjFdSpKrs1qn7MeE1+j7nDoZgPpaeRo6wNDdUzVvNA+MD0kQnIfs6p+DUgepM3ZZmYpV
 2Vtg==
X-Gm-Message-State: AOAM533Dt5UUCe4NVpOeLWSLRKCmpAp8zeufBop/gDgmeTj965g7/je7
 +E7x07mUniZla0lRMjmtwX064GTmyCI=
X-Google-Smtp-Source: ABdhPJxBQYydGCtQPtB3meEjjVrhJNtkH0G4TWvH+ZttCrjLT9r+tG20GG/Bkd9tCYiT+p1f+Bhjag==
X-Received: by 2002:a62:7c86:0:b029:1b7:cf7b:7d79 with SMTP id
 x128-20020a627c860000b02901b7cf7b7d79mr2988559pfc.48.1611624301831; 
 Mon, 25 Jan 2021 17:25:01 -0800 (PST)
Received: from Yifans-Mac-Mini.hsd1.ca.comcast.net. ([98.35.5.7])
 by smtp.gmail.com with ESMTPSA id o14sm536921pjf.12.2021.01.25.17.25.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 17:25:01 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 02/11] configure: cross-compiling with empty cross_prefix
Date: Mon, 25 Jan 2021 17:24:48 -0800
Message-Id: <20210126012457.39046-3-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210126012457.39046-1-j@getutm.app>
References: <20210126012457.39046-1-j@getutm.app>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.177;
 envelope-from=osy86github@gmail.com; helo=mail-pf1-f177.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The iOS toolchain does not use the host prefix naming convention. So we
need to enable cross-compile options while allowing the PREFIX to be
blank.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 6f6a319c2f..8d8a4733d7 100755
--- a/configure
+++ b/configure
@@ -238,6 +238,7 @@ cpu=""
 iasl="iasl"
 interp_prefix="/usr/gnemul/qemu-%M"
 static="no"
+cross_compile="no"
 cross_prefix=""
 audio_drv_list=""
 block_drv_rw_whitelist=""
@@ -469,6 +470,7 @@ for opt do
   optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
   case "$opt" in
   --cross-prefix=*) cross_prefix="$optarg"
+                    cross_compile="yes"
   ;;
   --cc=*) CC="$optarg"
   ;;
@@ -1696,7 +1698,7 @@ $(echo Deprecated targets: $deprecated_targets_list | \
   --target-list-exclude=LIST exclude a set of targets from the default target-list
 
 Advanced options (experts only):
-  --cross-prefix=PREFIX    use PREFIX for compile tools [$cross_prefix]
+  --cross-prefix=PREFIX    use PREFIX for compile tools, PREFIX can be blank [$cross_prefix]
   --cc=CC                  use C compiler CC [$cc]
   --iasl=IASL              use ACPI compiler IASL [$iasl]
   --host-cc=CC             use C compiler CC [$host_cc] for code run at
@@ -6390,7 +6392,7 @@ if has $sdl2_config; then
 fi
 echo "strip = [$(meson_quote $strip)]" >> $cross
 echo "windres = [$(meson_quote $windres)]" >> $cross
-if test -n "$cross_prefix"; then
+if test "$cross_compile" = "yes"; then
     cross_arg="--cross-file config-meson.cross"
     echo "[host_machine]" >> $cross
     if test "$mingw32" = "yes" ; then
-- 
2.28.0


