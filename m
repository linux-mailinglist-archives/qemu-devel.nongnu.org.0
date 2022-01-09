Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2620E488ADC
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 18:15:34 +0100 (CET)
Received: from localhost ([::1]:37744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bn3-0000Mr-3j
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 12:15:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6beC-0005pZ-44; Sun, 09 Jan 2022 12:06:25 -0500
Received: from [2a00:1450:4864:20::434] (port=44720
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6be9-0005Ri-H0; Sun, 09 Jan 2022 12:06:22 -0500
Received: by mail-wr1-x434.google.com with SMTP id k18so22281296wrg.11;
 Sun, 09 Jan 2022 09:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QdGnzM/yYLdpxDRZQHhZ80EU/HYkDZavCSsJFqRZdoo=;
 b=j4f5zYCJYEV9AyPx03OclOeM6tqmshNotHiIKiqqkxo/DJ0Mlp5Om01l0lEivrchxg
 H3sWVLVfaf4/vp/agCPNQwi/eHaZFibnb5axadPTAPSbhziIIGpS9MrD8W0mqQZDfL08
 eRJcdrS3nFg4jHAEjdNBrYZcaJvkBXxQIntHzB+3k4+eWSPzoGP3kFjBCpvpL7dJOdYI
 V5dsrdROP4aWYujP1PrVcPi3HGTZzvtRMTMbunrTc7sl/Cp1mEx/KVl3r/1LFQjZg9Eb
 lEs8wi3DzZsfaEOrQeGYQr1njNHBgLxWScOGPI1AL+Z3L3r12Zy4zQUWPGjlnzYykNj9
 P4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QdGnzM/yYLdpxDRZQHhZ80EU/HYkDZavCSsJFqRZdoo=;
 b=RuFRZmdSaD0ToZlLlC9C8aI+DV0GYTabagG8aOYcz/66VG7femSlHHe1dgngj1L2cz
 NGZWhDHKeAabaRlAAXhuOBNMHLKN0w/wuvzxO0PZaXDStyRAF9E7U9opjR3MBFG7BUOX
 VGKpZOqTM29MJyMpVVSSz8pDpLW2Naefbd8wrjJbIDu87D3+3Y5+A7Z2A7BFOtV+sN1k
 ATjYePOJGZvKoV8Wm592bbNzt1uDNXkLpCC2L+v6Ndi4j+SaDYqqfuDj1PnQoBRQ0fQC
 sL4w0SCs3+/E/QpzTc1U5jMKzOKMvO0pNkzjUAsHbIkVJZTmNLygCz1diYKP297YxUTO
 yCVg==
X-Gm-Message-State: AOAM531yfLey/t596aozRBKz1hBrsnvlj1F9hgzJYXkQJGX1+SqVQS4H
 /Z5doyb9D+5Iartbh3Ckdur7NzDoEu0p2w==
X-Google-Smtp-Source: ABdhPJxcnE26PXRXu8M3nQYrTD+x/gb3P7fiH6S/Py7MBbK2xIuGKlImI5qVz2GbcBx3ZG0LVvjyQg==
X-Received: by 2002:adf:fac3:: with SMTP id a3mr2705837wrs.369.1641747979547; 
 Sun, 09 Jan 2022 09:06:19 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id p13sm4913192wrr.37.2022.01.09.09.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 09:06:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] configure: Allow passing extra Objective C compiler
 flags
Date: Sun,  9 Jan 2022 18:06:07 +0100
Message-Id: <20220109170612.574104-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109170612.574104-1-f4bug@amsat.org>
References: <20220109170612.574104-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can pass C/CPP/LD flags via CFLAGS/CXXFLAGS/LDFLAGS environment
variables, or via configure --extra-cflags / --extra-cxxflags /
--extra-ldflags options. Provide similar behavior for Objective C:
use existing flags from $OBJCFLAGS, or passed via --extra-objcflags.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>

 configure   | 8 ++++++++
 meson.build | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/configure b/configure
index 030728d11e9..4cdde1eeb4b 100755
--- a/configure
+++ b/configure
@@ -288,6 +288,7 @@ done
 
 EXTRA_CFLAGS=""
 EXTRA_CXXFLAGS=""
+EXTRA_OBJCFLAGS=""
 EXTRA_LDFLAGS=""
 
 xen_ctrl_version="$default_feature"
@@ -400,9 +401,12 @@ for opt do
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
@@ -781,6 +785,8 @@ for opt do
   ;;
   --extra-cxxflags=*)
   ;;
+  --extra-objcflags=*)
+  ;;
   --extra-ldflags=*)
   ;;
   --enable-debug-info)
@@ -1332,6 +1338,7 @@ Advanced options (experts only):
   --objcc=OBJCC            use Objective-C compiler OBJCC [$objcc]
   --extra-cflags=CFLAGS    append extra C compiler flags CFLAGS
   --extra-cxxflags=CXXFLAGS append extra C++ compiler flags CXXFLAGS
+  --extra-objcflags=OBJCFLAGS append extra Objective C compiler flags OBJCFLAGS
   --extra-ldflags=LDFLAGS  append extra linker flags LDFLAGS
   --cross-cc-ARCH=CC       use compiler when building ARCH guest test cases
   --cross-cc-flags-ARCH=   use compiler flags when building ARCH guest tests
@@ -3864,6 +3871,7 @@ if test "$skip_meson" = no; then
   echo "[built-in options]" >> $cross
   echo "c_args = [$(meson_quote $CFLAGS $EXTRA_CFLAGS)]" >> $cross
   echo "cpp_args = [$(meson_quote $CXXFLAGS $EXTRA_CXXFLAGS)]" >> $cross
+  test -n "$objcc" && echo "objc_args = [$(meson_quote $OBJCFLAGS $EXTRA_OBJCFLAGS)]" >> $cross
   echo "c_link_args = [$(meson_quote $CFLAGS $LDFLAGS $EXTRA_CFLAGS $EXTRA_LDFLAGS)]" >> $cross
   echo "cpp_link_args = [$(meson_quote $CXXFLAGS $LDFLAGS $EXTRA_CXXFLAGS $EXTRA_LDFLAGS)]" >> $cross
   echo "[binaries]" >> $cross
diff --git a/meson.build b/meson.build
index c1b1db1e28c..eb8b560b103 100644
--- a/meson.build
+++ b/meson.build
@@ -3285,6 +3285,11 @@
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
2.33.1


