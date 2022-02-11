Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11B74B2A9D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:42:04 +0100 (CET)
Received: from localhost ([::1]:48628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYzi-0008Po-Cf
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:42:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYsz-0008Dt-Dr
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:35:07 -0500
Received: from [2607:f8b0:4864:20::42c] (port=45587
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYsx-0001z1-Dg
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:35:05 -0500
Received: by mail-pf1-x42c.google.com with SMTP id 9so14302710pfx.12
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9AHl4PWSxPKlzGOmJiwTT/tCSVVYvFbKDzeLrCswrLU=;
 b=R6iTRs0h4n5qWBdsfkpoM5OF95HV3ZANAX+Imnj1ZIpXaBdvjC3jDr+cJiOj8HPHNs
 kSK43l/n4acOOl8c3sI2wzWunXsbq4bXhHsuI8SETp6uNyftWJ9s9BfOPtRCyPAXS3l9
 0vsAXQnkF9zuqI9xCFus6xzXi4Nry4x6koPzVbD6sMekAtzxz2gtrf/D07v4BqI4Frit
 YPaDMqyGw3otiL8DNC1Eoh3eh62O5G0Tl7TKyN1HZKVPVnYYRlKjwF/a4nDQ/APWLCvJ
 mICrxwgidXh16eG/8XVx90C3cnilx9rZU21WlmZSHx/LPOFI7EM9eIdIiENM4Qs65lbV
 5nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9AHl4PWSxPKlzGOmJiwTT/tCSVVYvFbKDzeLrCswrLU=;
 b=TMb97kwDEJHnjYoxPWQiqCuCxzUvNw89Jad4Hk2fNZcEnPH9XvTL5Hxlz1Ra2W+dI1
 BGAsMcF32EyJK7aaHwOfS0EhF+PIjTJB6cNOX1fFch0FXC1AMfuOO/3SChmkFO37M0aX
 agE+ZPitv2MIv8Q5NH2Sxp8lDLKYCiVy1pwllUglVHLnWzVcGs3TaqzlpRs8IyDsup/N
 wTvqaomjCvSdPYqYFAmpHjWKecPHpF5FHNhosR7GFXTIOFOotTt+A889l9OGCz7X+A2F
 sSR1sDGDIptUHA7IGu12MZd74dBvmRNbzkHIAtS+ewuiy4ZtaMnfyw3tcrsDQ64Q6f5+
 2pkg==
X-Gm-Message-State: AOAM530/VR/El5AdVeBzDEaeO3/6ACYmljMbe4s+el/C66ximcJgujS+
 KtLwGPwiTy3GmuzDRFJJbpUIz/AWuuY=
X-Google-Smtp-Source: ABdhPJzYA12HYfw81GhBnudpAmanblJ0xRMNhC/FFShJsGgcu6Dxv+6g7UmN+CZMBN+Vx7KL7lKidQ==
X-Received: by 2002:a05:6a00:1d27:: with SMTP id
 a39mr2476048pfx.55.1644597302016; 
 Fri, 11 Feb 2022 08:35:02 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id 3sm5472427pjk.29.2022.02.11.08.34.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 11 Feb 2022 08:35:01 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 02/13] configure: Allow passing extra Objective C compiler
 flags
Date: Fri, 11 Feb 2022 17:34:23 +0100
Message-Id: <20220211163434.58423-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211163434.58423-1-f4bug@amsat.org>
References: <20220211163434.58423-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


