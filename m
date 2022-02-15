Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A8A4B653C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:09:16 +0100 (CET)
Received: from localhost ([::1]:56858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJstf-0004jN-TQ
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:09:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJso9-0001vb-LF
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:03:34 -0500
Received: from [2607:f8b0:4864:20::42d] (port=37858
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJso7-00029O-OK
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:03:33 -0500
Received: by mail-pf1-x42d.google.com with SMTP id y5so33598076pfe.4
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9AHl4PWSxPKlzGOmJiwTT/tCSVVYvFbKDzeLrCswrLU=;
 b=HOmcBDoyXXJ5aCtGwnPH7zvSP3029NYtwB2lom87Pm2a3TzRCqsiXCOPUl9qziL69d
 RX/wvRdi8UTPd2/ktcF58XdgNNclHPJHiUlf861AiA/AnE1Q1wlu6ZRXqWICTOQWInJF
 +L6E58BZuHaCR7yoeVILQzvH76eS7e6hJdEk7j1bskIeIBG0R2f5UXEexGc9igcMF5BE
 yqq+fQStr62OG1HDr30ud0R6FIg+4A+PjY4FVdZO3sCsNI/2boT96xa0UvFwh0bKP7XK
 EcFl4IuSkGCTZ+xPf2Q3KSxPhwGJFBeh1Pf1UI8rA1KCgnoB4dNvuojTkieQsflIWuW3
 zirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9AHl4PWSxPKlzGOmJiwTT/tCSVVYvFbKDzeLrCswrLU=;
 b=09mJ+Ogw324gpaaO2wl+LBIM0ddxTBrvXJAN8KgxnnHw+hRt7oTSIpWDc9whab9ZhR
 UfF2P/61Eb2hiDOc4YSQSu9X5fVLyAMsqjjmLjoh0Cr3O4ZVqvCYyvKhBVKQWaUKffJR
 pivGTsOYklYhBBgIx0wKJH90z3IDOfn10tm4LoVdR7yGZqttmOJQUVZqlOJeG45tSfho
 LBWZQkS3V/vg0L2j2oAvEjiki3h2ul6cR0yO1+hgY4pC1/OmMJ4RuzWiZZxJMEEJMgot
 ymoTD3VqCFWvM/K8exBcDzHrFHj9BL+l2TGwi43ZfWoERoZEA0m0H9Ek4F0Mj7cnol/q
 a52A==
X-Gm-Message-State: AOAM531cwBDBTk6UlFOPH6J8fZXoYn32GrHMZsmPNapkQB5CBBNjVcAu
 saI8y2Xepq1E6yxyXx8BTfjmeOYlLhQ=
X-Google-Smtp-Source: ABdhPJyzrZ6VsJvKoio8ZPNs5+qFzHUfDXc4dUV84eHaRLl9EI3q7IlrBICPi9ZTRkbic8xD5rl5TA==
X-Received: by 2002:a63:2bc8:: with SMTP id r191mr2488263pgr.347.1644912210243; 
 Tue, 15 Feb 2022 00:03:30 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id q11sm42256334pfk.149.2022.02.15.00.03.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 00:03:29 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 02/15] configure: Allow passing extra Objective C compiler
 flags
Date: Tue, 15 Feb 2022 09:02:54 +0100
Message-Id: <20220215080307.69550-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215080307.69550-1-f4bug@amsat.org>
References: <20220215080307.69550-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

We can pass C/CPP/LD flags via CFLAGS/CXXFLAGS/LDFLAGS environment
variables, or via configure --extra-cflags / --extra-cxxflags /
--extra-ldflags options. Provide similar behavior for Objective C:
use existing flags from $OBJCFLAGS, or passed via --extra-objcflags.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 configure   | 8 ++++++++
 meson.build | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/configure b/configure
index 3a29eff5cc..06c03cebd3 100755
--- a/configure
+++ b/configure
@@ -287,6 +287,7 @@ done
 
 EXTRA_CFLAGS=""
 EXTRA_CXXFLAGS=""
+EXTRA_OBJCFLAGS=""
 EXTRA_LDFLAGS=""
 
 xen_ctrl_version="$default_feature"
@@ -391,9 +392,12 @@ for opt do
   --extra-cflags=*)
     EXTRA_CFLAGS="$EXTRA_CFLAGS $optarg"
     EXTRA_CXXFLAGS="$EXTRA_CXXFLAGS $optarg"
+    EXTRA_OBJCFLAGS="$EXTRA_OBJCFLAGS $optarg"
     ;;
   --extra-cxxflags=*) EXTRA_CXXFLAGS="$EXTRA_CXXFLAGS $optarg"
   ;;
+  --extra-objcflags=*) EXTRA_OBJCFLAGS="$EXTRA_OBJCFLAGS $optarg"
+  ;;
   --extra-ldflags=*) EXTRA_LDFLAGS="$EXTRA_LDFLAGS $optarg"
   ;;
   --enable-debug-info) debug_info="yes"
@@ -774,6 +778,8 @@ for opt do
   ;;
   --extra-cxxflags=*)
   ;;
+  --extra-objcflags=*)
+  ;;
   --extra-ldflags=*)
   ;;
   --enable-debug-info)
@@ -1312,6 +1318,7 @@ Advanced options (experts only):
   --objcc=OBJCC            use Objective-C compiler OBJCC [$objcc]
   --extra-cflags=CFLAGS    append extra C compiler flags CFLAGS
   --extra-cxxflags=CXXFLAGS append extra C++ compiler flags CXXFLAGS
+  --extra-objcflags=OBJCFLAGS append extra Objective C compiler flags OBJCFLAGS
   --extra-ldflags=LDFLAGS  append extra linker flags LDFLAGS
   --cross-cc-ARCH=CC       use compiler when building ARCH guest test cases
   --cross-cc-cflags-ARCH=  use compiler flags when building ARCH guest tests
@@ -3724,6 +3731,7 @@ if test "$skip_meson" = no; then
   echo "[built-in options]" >> $cross
   echo "c_args = [$(meson_quote $CFLAGS $EXTRA_CFLAGS)]" >> $cross
   echo "cpp_args = [$(meson_quote $CXXFLAGS $EXTRA_CXXFLAGS)]" >> $cross
+  test -n "$objcc" && echo "objc_args = [$(meson_quote $OBJCFLAGS $EXTRA_OBJCFLAGS)]" >> $cross
   echo "c_link_args = [$(meson_quote $CFLAGS $LDFLAGS $EXTRA_CFLAGS $EXTRA_LDFLAGS)]" >> $cross
   echo "cpp_link_args = [$(meson_quote $CXXFLAGS $LDFLAGS $EXTRA_CXXFLAGS $EXTRA_LDFLAGS)]" >> $cross
   echo "[binaries]" >> $cross
diff --git a/meson.build b/meson.build
index ae5f7eec6e..df25e7a5e7 100644
--- a/meson.build
+++ b/meson.build
@@ -3292,6 +3292,11 @@ if link_language == 'cpp'
                                                + ['-O' + get_option('optimization')]
                                                + (get_option('debug') ? ['-g'] : []))}
 endif
+if targetos == 'darwin'
+  summary_info += {'OBJCFLAGS':       ' '.join(get_option('objc_args')
+                                               + ['-O' + get_option('optimization')]
+                                               + (get_option('debug') ? ['-g'] : []))}
+endif
 link_args = get_option(link_language + '_link_args')
 if link_args.length() > 0
   summary_info += {'LDFLAGS':         ' '.join(link_args)}
-- 
2.34.1


