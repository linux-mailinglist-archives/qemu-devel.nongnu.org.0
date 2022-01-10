Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C447C4899F7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:31:20 +0100 (CET)
Received: from localhost ([::1]:47194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6ulb-0004uX-Jg
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:31:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6uRD-0008BC-Mq
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:10:15 -0500
Received: from [2a00:1450:4864:20::32e] (port=39762
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6uRB-0008Ly-UP
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:10:15 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 d18-20020a05600c251200b0034974323cfaso804870wma.4
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 05:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oyq4zDE+6UEeLvk8aIlP6RN2H+fI0F9i12xnj4+kSn4=;
 b=UHsoOzl4axun4fXfBThPY7bVDxREESBkqgi7n2ad5h6oI7yXcB3bKJTl22YgS4C+79
 sjkKMYlyfZ35qA6e4LVEU+rASEhN2q6IZmy54Bz72+eLLoPXUWSPQQSzUcuxhsAa0m//
 b/1shjAZyjh40UjgqulZL9tBvWQLHS1IXk0tQQab2gp6v1wOFRqf0xBvF//EIHjIzk0H
 /GcQz/QTYh+xuOmjlyLS5OQxwMicSbjvsLArZt+800HPuTzemb0IT5IpTb8UkE9Jshog
 bknDqUD6PsePdeWNpouqMs8D54SD6ACbNtA7ncTx7FAi0UFbCdm1KN0qH9ltI9cNwtZX
 7W9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oyq4zDE+6UEeLvk8aIlP6RN2H+fI0F9i12xnj4+kSn4=;
 b=F5X6bOwF4+jpVaYukpvoxjzviXoHzr/yVgiLEeay4MpN/3UbKoK6dqp4geTMFZ+dNR
 esfT01q2knmShJf+5si/N+FSWeaPVKVR0jT4n2YotRIwAoASAoUzd19/WXbflpWwNXnk
 J8LAAy1Q9b3AQ23ETowT2TozeySwxl9AKOmE7kVlv57gGftPgwcZKINueDayeBDorkqd
 W1+IkmLSGqkjnEIz25J39tbvg26r+8mnP+Fz+o0Lf3D4RI9M1SQLGCUmKqD+im+iXWhm
 KQalIRfdWP7qSszYoifilwGuKck/K+1HQC0q9P+k42rg9Z4Mna25jniqbIF5M04ndJuk
 o2eg==
X-Gm-Message-State: AOAM533weSZYSKqYWubRzc9tNVUilrYryshKnuwbZg3DBfY2iQUjiBz3
 IpG0H+xM2O0Txa4v0yLtpseCI7fBBhIuaw==
X-Google-Smtp-Source: ABdhPJx6u3ejU5wvWrGdAwYSOzqrN0CprvfSELAAiKo26Pu+xnulDfoUW2/v/IQbHvctlE5n9BCPSw==
X-Received: by 2002:a05:600c:1d28:: with SMTP id
 l40mr12346768wms.174.1641820208688; 
 Mon, 10 Jan 2022 05:10:08 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id l4sm5153719wru.74.2022.01.10.05.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 05:10:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 1/7] configure: Allow passing extra Objective C
 compiler flags
Date: Mon, 10 Jan 2022 14:09:55 +0100
Message-Id: <20220110131001.614319-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110131001.614319-1-f4bug@amsat.org>
References: <20220110131001.614319-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index 0c57a063c66..adb42d8beb1 100755
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
@@ -1318,6 +1324,7 @@ Advanced options (experts only):
   --objcc=OBJCC            use Objective-C compiler OBJCC [$objcc]
   --extra-cflags=CFLAGS    append extra C compiler flags CFLAGS
   --extra-cxxflags=CXXFLAGS append extra C++ compiler flags CXXFLAGS
+  --extra-objcflags=OBJCFLAGS append extra Objective C compiler flags OBJCFLAGS
   --extra-ldflags=LDFLAGS  append extra linker flags LDFLAGS
   --cross-cc-ARCH=CC       use compiler when building ARCH guest test cases
   --cross-cc-flags-ARCH=   use compiler flags when building ARCH guest tests
@@ -3843,6 +3850,7 @@ if test "$skip_meson" = no; then
   echo "[built-in options]" >> $cross
   echo "c_args = [$(meson_quote $CFLAGS $EXTRA_CFLAGS)]" >> $cross
   echo "cpp_args = [$(meson_quote $CXXFLAGS $EXTRA_CXXFLAGS)]" >> $cross
+  test -n "$objcc" && echo "objc_args = [$(meson_quote $OBJCFLAGS $EXTRA_OBJCFLAGS)]" >> $cross
   echo "c_link_args = [$(meson_quote $CFLAGS $LDFLAGS $EXTRA_CFLAGS $EXTRA_LDFLAGS)]" >> $cross
   echo "cpp_link_args = [$(meson_quote $CXXFLAGS $LDFLAGS $EXTRA_CXXFLAGS $EXTRA_LDFLAGS)]" >> $cross
   echo "[binaries]" >> $cross
diff --git a/meson.build b/meson.build
index 0e52f54b100..a21305d62c1 100644
--- a/meson.build
+++ b/meson.build
@@ -3286,6 +3286,11 @@
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


