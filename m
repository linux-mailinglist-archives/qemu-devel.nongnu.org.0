Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD224DDAB3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:40:06 +0100 (CET)
Received: from localhost ([::1]:33106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCpq-0000Ut-2G
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:40:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZn-00070A-GK
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:31 -0400
Received: from [2a00:1450:4864:20::42e] (port=44827
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZl-0002DZ-Jf
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:31 -0400
Received: by mail-wr1-x42e.google.com with SMTP id b19so11707093wrh.11
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=n35AFs9v+Ihl4A7Mb9rzofI88nppswgEUkv1KZhYPHc=;
 b=MF0qHKz6LZjiTfC6dZiKNhrdfrgYHVsQWEPeTP56KL9TgZZR7CvLyOZ9kyZKH8m1p/
 ThfcQ0AMMnw1TDV9fPOeSqUcXlqSyqkEhPCXohORxJKhycdsroyoQgNovPz1Lsdc5KAJ
 l2LXcA0IwJELwuJruhczv01RdFBzVasylMhs3J5sAza/9S37T4pzL7QzNMJCrFk4z4HU
 pfB8gnwkdk9wXTRbGb3mJN3wicmZuZXJSNI1bzih5cxMKgkGo1KNIc58NgTe1398T90J
 IoDjjnTnuZOytl8nxeUGXlFNuWUs+bXW2LzFIpnKcDMBZf6mFG5lQQaiUJz+zKkrIK/b
 uzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n35AFs9v+Ihl4A7Mb9rzofI88nppswgEUkv1KZhYPHc=;
 b=fg7yWC4qFi+Vw6cCfIUdGsHoSnlSJXUfZD+cRTdwb46BApsxoLVJGB/Vlbul0hh1cF
 ss5XDxOMrViXK3Ci9Acj828zC6lk2dweb3p3Q90GMOnM/k0rh5zHUXp0MGqJlM3e49QF
 1WoAGiCHpPpPj06nYu3cG/+A2aKhLVpt0rvXXpBtZMMBLFz1qeHenaWtgxSkutlPMcVX
 WSbNP3MBV+Yf6LmPnHKj40720BqtXCFaKkTn2HJrTQf5E+1YdIdT3T5N/HgUqb6zveQM
 nD0SvbFBtl06uRcpzfXlFIjMQEiEbV3cIdJEIh6SQ00qWWuMLLHooF4tNLtxqVEqtL+S
 E7DQ==
X-Gm-Message-State: AOAM530KFB/2h14oxMaKHYhyJviJt33/O/j6pKCJ33tVamd6WKp0JLJV
 FCwFITs/adnFY/0OZRVNswzFQ0OuYqG/fw==
X-Google-Smtp-Source: ABdhPJxk2KvPmiaoac7CHWND2ZBtN21e6UL3u4F9ycdODrmjpXKboKWRBxZuGiAwy6ejW7GPaEP/4g==
X-Received: by 2002:adf:9d8f:0:b0:1f1:e72e:72c with SMTP id
 p15-20020adf9d8f000000b001f1e72e072cmr7869784wre.561.1647609808264; 
 Fri, 18 Mar 2022 06:23:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/21] util/osdep: Avoid madvise proto on modern Solaris
Date: Fri, 18 Mar 2022 13:23:04 +0000
Message-Id: <20220318132306.3254960-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

From: Andrew Deason <adeason@sinenomine.net>

On older Solaris releases (before Solaris 11), we didn't get a
prototype for madvise, and so util/osdep.c provides its own prototype.
Some time between the public Solaris 11.4 release and Solaris 11.4.42
CBE, we started getting an madvise prototype that looks like this:

    extern int madvise(void *, size_t, int);

which conflicts with the prototype in util/osdeps.c. Instead of always
declaring this prototype, check if we're missing the madvise()
prototype, and only declare it ourselves if the prototype is missing.
Move the prototype to include/qemu/osdep.h, the normal place to handle
platform-specific header quirks.

The 'missing_madvise_proto' meson check contains an obviously wrong
prototype for madvise. So if that code compiles and links, we must be
missing the actual prototype for madvise.

Signed-off-by: Andrew Deason <adeason@sinenomine.net>
Message-id: 20220316035227.3702-2-adeason@sinenomine.net
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 meson.build          | 23 +++++++++++++++++++++--
 include/qemu/osdep.h |  8 ++++++++
 util/osdep.c         |  3 ---
 3 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index bae62efc9c3..282e7c46505 100644
--- a/meson.build
+++ b/meson.build
@@ -1715,11 +1715,30 @@ config_host_data.set('CONFIG_FDATASYNC', cc.links(gnu_source_prefix + '''
   #error Not supported
   #endif
   }'''))
-config_host_data.set('CONFIG_MADVISE', cc.links(gnu_source_prefix + '''
+
+has_madvise = cc.links(gnu_source_prefix + '''
   #include <sys/types.h>
   #include <sys/mman.h>
   #include <stddef.h>
-  int main(void) { return madvise(NULL, 0, MADV_DONTNEED); }'''))
+  int main(void) { return madvise(NULL, 0, MADV_DONTNEED); }''')
+missing_madvise_proto = false
+if has_madvise
+  # Some platforms (illumos and Solaris before Solaris 11) provide madvise()
+  # but forget to prototype it. In this case, has_madvise will be true (the
+  # test program links despite a compile warning). To detect the
+  # missing-prototype case, we try again with a definitely-bogus prototype.
+  # This will only compile if the system headers don't provide the prototype;
+  # otherwise the conflicting prototypes will cause a compiler error.
+  missing_madvise_proto = cc.links(gnu_source_prefix + '''
+    #include <sys/types.h>
+    #include <sys/mman.h>
+    #include <stddef.h>
+    extern int madvise(int);
+    int main(void) { return madvise(0); }''')
+endif
+config_host_data.set('CONFIG_MADVISE', has_madvise)
+config_host_data.set('HAVE_MADVISE_WITHOUT_PROTOTYPE', missing_madvise_proto)
+
 config_host_data.set('CONFIG_MEMFD', cc.links(gnu_source_prefix + '''
   #include <sys/mman.h>
   int main(void) { return memfd_create("foo", MFD_ALLOW_SEALING); }'''))
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 322103aadbd..f2274b24cbf 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -400,6 +400,14 @@ void qemu_anon_ram_free(void *ptr, size_t size);
 #define SIGIO SIGPOLL
 #endif
 
+#ifdef HAVE_MADVISE_WITHOUT_PROTOTYPE
+/*
+ * See MySQL bug #7156 (http://bugs.mysql.com/bug.php?id=7156) for discussion
+ * about Solaris missing the madvise() prototype.
+ */
+extern int madvise(char *, size_t, int);
+#endif
+
 #if defined(CONFIG_LINUX)
 #ifndef BUS_MCEERR_AR
 #define BUS_MCEERR_AR 4
diff --git a/util/osdep.c b/util/osdep.c
index 7c4deda6feb..1825399bcf5 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -28,9 +28,6 @@
 
 #ifdef CONFIG_SOLARIS
 #include <sys/statvfs.h>
-/* See MySQL bug #7156 (http://bugs.mysql.com/bug.php?id=7156) for
-   discussion about Solaris header problems */
-extern int madvise(char *, size_t, int);
 #endif
 
 #include "qemu-common.h"
-- 
2.25.1


