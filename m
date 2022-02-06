Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899DB4AB1F9
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 21:15:15 +0100 (CET)
Received: from localhost ([::1]:39716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGnwE-0001BI-9y
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 15:15:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnpC-00013R-ED
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:55 -0500
Received: from [2607:f8b0:4864:20::730] (port=34661
 helo=mail-qk1-x730.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnpA-0001Rg-KQ
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:54 -0500
Received: by mail-qk1-x730.google.com with SMTP id bs32so9456426qkb.1
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 12:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8AYPOR8HAOhr1GFHfcmIMGeLF8f5x6f9nduyWsx8q3E=;
 b=HKnfEzlu0FKuwX2Zx3f+O5sswQl28M7Rx2D7NDiSgbrhaV9N8eYPmg3lw78aJphDjM
 yF7fv0nM3B7Q7azjtcHXWw1MMbw3vab9aZMRGMf7gRWgmh1uqgIzAdYqBSKhxBM3zkVA
 ga2Yvxvk7vPqqUFRvg7uw/WVoh1Fx49I1Yk2DknkNDL8m8a3U+BPx1B7Fb8vgdC5NStG
 HT09g5HuwCY8wknFCeh4LMFAbkMwUl1ejiUG+fBnD5xr/ZI62dcHpBocMpDGbhaJBNb3
 b66ZrcwLA9H8b+uWQVituzOa0nUb282nTMyb9ZdV56QxD85qrGeIWFbfz5RQux3zdKTP
 fPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8AYPOR8HAOhr1GFHfcmIMGeLF8f5x6f9nduyWsx8q3E=;
 b=t40VXUGdThRJgkYdwgsY7htp0v4cvjRkNqGqQJSZ/YLSL9H4iJUnjg+euXNTd5MiFK
 tJ4wu1kz8uxWHqr4KIrqrA2KsSadOyoxiABaFJ6KcHi5PsA3pi+5jl60Uvza3YIc+AXi
 c6XP29OFPW+PzmUc82aN1eDGHVSITmX7zZuN4Aq1156aEJWslkppcakdgoobz1SYw/Jf
 0uhuTjrTuE0B5mxL5pSRNf+o6BXhVGXXfEwETJHTPbcjKlX2eoQYX4cneYu+WPF+KN4h
 T+O7D+t9RGqJgRxqYbSGsBdnmgH+UasRAssyj0d+/WEnJn4/W2XlscyTMAnY65nZTD0M
 X7zg==
X-Gm-Message-State: AOAM533dolZomXCYFnSIbtGijW9th/wkJlLBIogF/bm5aX+y9fvjdD3t
 KFF+0kPXtmiKi6U1f8yWTUk7blEuK2CuJg==
X-Google-Smtp-Source: ABdhPJwzURNLff58grYFFbTrLEU6CCSXegroz8/sltONYnTSIX9XgC4DWWXRV7w1+czH2t2NuQFNIw==
X-Received: by 2002:a05:620a:4108:: with SMTP id
 j8mr4944051qko.131.1644178071383; 
 Sun, 06 Feb 2022 12:07:51 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id j11sm4625999qtj.74.2022.02.06.12.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 12:07:50 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/11] 9p: darwin: meson: Allow VirtFS on Darwin
Date: Sun,  6 Feb 2022 15:07:18 -0500
Message-Id: <20220206200719.74464-11-wwcohen@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220206200719.74464-1-wwcohen@gmail.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::730
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Rebase to master]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
[Will Cohen: - Add check for pthread_fchdir_np to virtfs]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 fsdev/meson.build |  1 +
 meson.build       | 14 ++++++++++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/fsdev/meson.build b/fsdev/meson.build
index adf57cc43e..b632b66348 100644
--- a/fsdev/meson.build
+++ b/fsdev/meson.build
@@ -7,6 +7,7 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
   'qemu-fsdev.c',
 ), if_false: files('qemu-fsdev-dummy.c'))
 softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
+softmmu_ss.add_all(when: 'CONFIG_DARWIN', if_true: fsdev_ss)
 
 if have_virtfs_proxy_helper
   executable('virtfs-proxy-helper',
diff --git a/meson.build b/meson.build
index 5f43355071..6b4adf7e15 100644
--- a/meson.build
+++ b/meson.build
@@ -1421,17 +1421,23 @@ if not get_option('dbus_display').disabled()
   endif
 endif
 
-have_virtfs = (targetos == 'linux' and
+if targetos == 'darwin' and cc.has_function('pthread_fchdir_np')
+  have_virtfs = have_system
+else
+  have_virtfs = (targetos == 'linux' and
     have_system and
     libattr.found() and
     libcap_ng.found())
+endif
 
-have_virtfs_proxy_helper = have_virtfs and have_tools
+have_virtfs_proxy_helper = targetos == 'linux' and have_virtfs and have_tools
 
 if get_option('virtfs').enabled()
   if not have_virtfs
-    if targetos != 'linux'
-      error('virtio-9p (virtfs) requires Linux')
+    if targetos != 'linux' and targetos != 'darwin'
+      error('virtio-9p (virtfs) requires Linux or Darwin')
+    elif targetos == 'darwin' and not cc.has_function('pthread_fchdir_np')
+      error('virtio-9p (virtfs) on Darwin requires the presence of pthread_fchdir_np')
     elif not libcap_ng.found() or not libattr.found()
       error('virtio-9p (virtfs) requires libcap-ng-devel and libattr-devel')
     elif not have_system
-- 
2.32.0 (Apple Git-132)


