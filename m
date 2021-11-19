Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2534D45712C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:50:50 +0100 (CET)
Received: from localhost ([::1]:57772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo5Dx-0000a4-Fb
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:50:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mo59A-0002ho-BD
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:45:49 -0500
Received: from [2a00:1450:4864:20::52c] (port=37671
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mo598-0003cJ-6a
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:45:48 -0500
Received: by mail-ed1-x52c.google.com with SMTP id e3so43704014edu.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 06:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tCBRwkko7c4H4RuUuPZjIUNcUTtlkBLCm+3e4KSz5wM=;
 b=g+sZnoON6RcS/V4k1INU+e0DTqQdKlI/f4x26nMuEN4YWAfT1OHGtT5yvd11NnOmr+
 5aiKA8gbfBnIApgc3gSaix2jIYiKLuMV5dUag3eG63M5jBCPkNX19apgPKlaiHvBRBQk
 rx3IHQoff0vvSej8Hnep4iUmwTbFyomaqplSpoJWbotWPr0prkSXaXc04diNPoegY39P
 FP+cfPWqyNGkTgV2YnR6WdSX10VNiHQLGRmLLzPySSqS6g+l/nBFYPYHIXiPCzcWalYR
 eMpT0vXOMs3K8AuN79XzQVIuKY9aN/chRS9ojEFFuMcjRPQZ2wUqGkP6EKAFjmm4P2N8
 FrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tCBRwkko7c4H4RuUuPZjIUNcUTtlkBLCm+3e4KSz5wM=;
 b=2hLg7hzTJvi1FXqNh/dXtd66AHAet5QwZM8qiWPWinWaJvjz77B4iXWzyU7+fcZjTT
 kKK2XI8AXuThIydHSRAcfeD2WnRP/Tc7TC0piH2Crj+dIcHnr7HfcLftIVoFxXvWchfJ
 RdD8LoxgU1ecHmgepSKQH5ve2J/8zqx1gowzcMx4uhrxpFYzly/1RkGq1jykU+5EjFJQ
 MWN9aZTlaD0Mev3BzAvqXkH7HoE5lBhvwW46wFCd7IQD3OAdzn1V1Wfyb3VAUsRYMY94
 HoBrbH4pLRe29AbP3vJzjgkOAgqmj0CkI0Spdl/XFeneK3vxhuUNeWPguHhXVfUkOWNt
 Iw5w==
X-Gm-Message-State: AOAM530l9+R1+lLfFKqYJHCDE8sAuOE4el+ekY0wyfi2YrdTUVu/2jbc
 un6ekq8Zdr7kEBJkeCFlUP6t1xLAvDs=
X-Google-Smtp-Source: ABdhPJzcFjo7daccYDsFFr8HtuDgYVOLGPHLF0StlrLH9IYI6bq+UEon26gBvU6ZVaKY9d3cwOoI0Q==
X-Received: by 2002:a17:907:d14:: with SMTP id
 gn20mr8316614ejc.73.1637333144927; 
 Fri, 19 Nov 2021 06:45:44 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z25sm26934ejd.80.2021.11.19.06.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 06:45:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] meson.build: Support ncurses on MacOS and OpenBSD
Date: Fri, 19 Nov 2021 15:45:38 +0100
Message-Id: <20211119144539.285740-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119144539.285740-1-pbonzini@redhat.com>
References: <20211119144539.285740-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

MacOS provides header files for curses 5.7 with support
for wide characters, but requires _XOPEN_SOURCE_EXTENDED=1
to activate that.

By default those old header files are used even if there
is a newer Homebrew installation of ncurses 6.2 available.

Change also the old macro definition of NCURSES_WIDECHAR
and set it to 1 like it is done in newer versions of
curses.h when _XOPEN_SOURCE_EXTENDED=1 is defined.

OpenBSD has the same version of ncurses and needs the same fix.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Brad Smith <brad@comstyle.com>
Message-Id: <20211117205355.1392292-1-sw@weilnetz.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 5 ++++-
 ui/curses.c | 4 ++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 582f356209..fbdd415376 100644
--- a/meson.build
+++ b/meson.build
@@ -679,6 +679,9 @@ iconv = not_found
 curses = not_found
 if have_system and not get_option('curses').disabled()
   curses_test = '''
+    #if defined(__APPLE__) || defined(__OpenBSD__)
+    #define _XOPEN_SOURCE_EXTENDED 1
+    #endif
     #include <locale.h>
     #include <curses.h>
     #include <wchar.h>
@@ -702,7 +705,7 @@ if have_system and not get_option('curses').disabled()
     endif
   endforeach
   msg = get_option('curses').enabled() ? 'curses library not found' : ''
-  curses_compile_args = ['-DNCURSES_WIDECHAR']
+  curses_compile_args = ['-DNCURSES_WIDECHAR=1']
   if curses.found()
     if cc.links(curses_test, args: curses_compile_args, dependencies: [curses])
       curses = declare_dependency(compile_args: curses_compile_args, dependencies: [curses])
diff --git a/ui/curses.c b/ui/curses.c
index e4f9588c3e..861d63244c 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -38,6 +38,10 @@
 #include "ui/input.h"
 #include "sysemu/sysemu.h"
 
+#if defined(__APPLE__) || defined(__OpenBSD__)
+#define _XOPEN_SOURCE_EXTENDED 1
+#endif
+
 /* KEY_EVENT is defined in wincon.h and in curses.h. Avoid redefinition. */
 #undef KEY_EVENT
 #include <curses.h>
-- 
2.33.1



