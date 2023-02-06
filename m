Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D37E68BCE6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:33:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0g6-0003bS-4a; Mon, 06 Feb 2023 07:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pP0g3-0003Oy-I2
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:32:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pP0g1-0000Yw-Rj
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:32:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675686772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GGhmpNy9wo371fk28dv7nPyVq/kRJdTe6h2KcAc4Jh4=;
 b=ShfF2nhR0y120Vt3YSN9cJR27XL4l8GTAG9TvgO2aMOv/XHLVSLRhr/KgQCJPMQLOEzeVL
 ZQodJ+bnidCP6IDFxC7oLZfEp2GJ6walTFimFM1uaa08fRA61h1Y7C0waFMe4LsuZtzzmk
 PRw962EIUcAqIpqxtxyFwEKMCx8AggE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-o48yEjW_MMqSaH122CzcOw-1; Mon, 06 Feb 2023 07:32:51 -0500
X-MC-Unique: o48yEjW_MMqSaH122CzcOw-1
Received: by mail-ej1-f71.google.com with SMTP id
 m21-20020a1709060d9500b0088ca6c7af4cso8601083eji.21
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 04:32:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GGhmpNy9wo371fk28dv7nPyVq/kRJdTe6h2KcAc4Jh4=;
 b=AtVKLxhxn9td/g5Igl4LP4V/lnGi5GfftMbS0gcr/qo9w3fFcGkpbgoUC0jz2aB6+o
 C6xXtyfLatquuZ3E+dR4iCRM0UsR3eBsF0hUExFvv/HepdaHltChFkci9Cq/ug3x172Q
 qySo2TYrelD0auC6E2xPXOtY5f54TnJgaUPsavq/mKw6VPt5b9bQFkKpDElakpWLy4a6
 CXviqdJCJGCL1KkYEsp7KSptNCZqYIovSLVHSndHLChwdknislsYVd7DS++1OhrHl4Uk
 qBpfOpWiepHHH0CpbvFEcrsHphs37q8PIQaorJpTE4a4401Hqc/eNH3ksFhhW4UopLLk
 lxDg==
X-Gm-Message-State: AO0yUKUARnlIGfY6mElM5t6gX6MaggKH896d8O8VIzWAOwjQNl1Yu4Tb
 wqQyaQFbrSoYNwKmH5t3AGk6PM9+WKl8O9ZyRbjh0lMRleEe3Vk8kk3sLflEvO7iI7UpvbNsz5p
 f5EcStanXw8BafY1Ae7uAJhEcoBLaX+L9Y2zq9z3WOVBWDryoIQhDv10rofW3XmZ1eS8=
X-Received: by 2002:a17:907:97cd:b0:88d:ba89:1844 with SMTP id
 js13-20020a17090797cd00b0088dba891844mr15955418ejc.21.1675686769633; 
 Mon, 06 Feb 2023 04:32:49 -0800 (PST)
X-Google-Smtp-Source: AK7set9RgTsnM+FUtopS333qMvfjo2lnBvCD2DkRJx3fikOEypsosEKlqTM0VCdsTaCB8XtYfBX8Fg==
X-Received: by 2002:a17:907:97cd:b0:88d:ba89:1844 with SMTP id
 js13-20020a17090797cd00b0088dba891844mr15955400ejc.21.1675686769326; 
 Mon, 06 Feb 2023 04:32:49 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 f28-20020a50a6dc000000b004aaa6a948fcsm2337454edc.37.2023.02.06.04.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 04:32:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	f4bug@amsat.org
Subject: [PATCH] build: make meson-buildoptions.sh stable
Date: Mon,  6 Feb 2023 13:32:47 +0100
Message-Id: <20230206123247.16814-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The library directory can change depending on the multilib setup of the host.
It would be even better to detect it in configure with the same algorithm
that Meson uses, but the important thing to avoid confusing developers is
to have identical contents of scripts/meson-buildoptions.sh, independent
of the distro and architecture on which it was created.

So, for now just give a custom default value to libdir.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/meson-buildoptions.py | 7 +++++--
 scripts/meson-buildoptions.sh | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index 3e2b4785388f..a04dcc70a5b7 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -61,7 +61,10 @@
 
 # Convert the default value of an option to the string used in
 # the help message
-def value_to_help(value):
+def get_help(opt):
+    if opt["name"] == "libdir":
+        return 'system default'
+    value = opt["value"]
     if isinstance(value, list):
         return ",".join(value)
     if isinstance(value, bool):
@@ -88,7 +91,7 @@ def sh_print(line=""):
 def help_line(left, opt, indent, long):
     right = f'{opt["description"]}'
     if long:
-        value = value_to_help(opt["value"])
+        value = get_help(opt)
         if value != "auto" and value != "":
             right += f" [{value}]"
     if "choices" in opt and long:
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 0f71e92dcba6..d663c9cadfbe 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -49,7 +49,7 @@ meson_options_help() {
   printf "%s\n" '  --includedir=VALUE       Header file directory [include]'
   printf "%s\n" '  --interp-prefix=VALUE    where to find shared libraries etc., use %M for'
   printf "%s\n" '                           cpu name [/usr/gnemul/qemu-%M]'
-  printf "%s\n" '  --libdir=VALUE           Library directory [lib64]'
+  printf "%s\n" '  --libdir=VALUE           Library directory [system default]'
   printf "%s\n" '  --libexecdir=VALUE       Library executable directory [libexec]'
   printf "%s\n" '  --localedir=VALUE        Locale data directory [share/locale]'
   printf "%s\n" '  --localstatedir=VALUE    Localstate data directory [/var/local]'
-- 
2.38.1


