Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37179311011
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:38:28 +0100 (CET)
Received: from localhost ([::1]:52664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85zu-0003Zg-W7
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:38:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84kl-0000sK-LB
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:18:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84kf-0003NV-8U
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:18:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612545515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tvkGAS1d8gMkXdxEKA7vhiRkEZi0iEfIHD2yWVNztu0=;
 b=Akvd0sArQwNGXfXrGbNgziWHafb345gKbFfGrwFKTznRqXKCgdQP7MwksgSkIFtWPTPFHb
 jJS7KDjPuPt/U0cZruTpBlFOJUXPQbPPJI9sJzbLzHnMvtgsRd8N/b6NSpJJJoRD52CfKy
 W9Ve4ljDpXhTHgZMhFipEQwcCXUFe2Y=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-70ZlGSSyN72hzwZRbdzeFQ-1; Fri, 05 Feb 2021 12:18:34 -0500
X-MC-Unique: 70ZlGSSyN72hzwZRbdzeFQ-1
Received: by mail-ed1-f71.google.com with SMTP id y6so7345132edc.17
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tvkGAS1d8gMkXdxEKA7vhiRkEZi0iEfIHD2yWVNztu0=;
 b=fUoDqGCkACD2/1PSVTIi7poI81M2DfP+hI3vgHu3NbBM9MhBCyW3sudqDYgunYB8pV
 LVKIsWBbOQ4pl6VGfVQv/ww4VYxXBV0CE/auF15GPTHFnMV1xNvvYeICBL7uZ8TmE+IJ
 X7aesEt7rSokOiJURGWx3+z3vF5esPtYxlfhvQQWRSv60MaXChTODzPae8PIobrUPNzN
 UYPA/8w34hOT3GDFD+6S2S49XpcergKy1xIZXlNX5G5NTptsz8Tvm0RXviWMh3v/5j/0
 tVdTIl8pUa43tUJ1zvXmGwYAHZx9URCH+KGj9tVvG+qk1t61mtoEFq4naDyVFSrUkBYr
 nH1Q==
X-Gm-Message-State: AOAM531YKs7hpDaWfXttuu/YJwl3nSAyTXJrfc5pwxLRDFTuKrlJAYyV
 u2+kdAc8LvVlonBNtwGK9U30BTO+9LJQVLiGfncAoBGhChvjDE1T4cmfa7EdkdL6k/B/bJFvSjl
 kqoMG8bs0hUbh161qsXmiDQ0HC7TNiltYfFhK9n7HPVaOpTf3L0MGOupwcnwP2OYa
X-Received: by 2002:a17:907:7815:: with SMTP id
 la21mr4782921ejc.12.1612545512743; 
 Fri, 05 Feb 2021 09:18:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwWRnt27K2PaM65RzYXPAJK+6DktdX6kWlNRCxmyUkeYg/7mBB3xs1gZyRore0Q1tyfkN+rA==
X-Received: by 2002:a17:907:7815:: with SMTP id
 la21mr4782893ejc.12.1612545512441; 
 Fri, 05 Feb 2021 09:18:32 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id jg33sm4024895ejc.103.2021.02.05.09.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:18:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] tools/virtiofsd: Replace the word 'whitelist'
Date: Fri,  5 Feb 2021 18:18:11 +0100
Message-Id: <20210205171817.2108907-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205171817.2108907-1-philmd@redhat.com>
References: <20210205171817.2108907-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the words "whitelist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c      |  6 +++---
 tools/virtiofsd/passthrough_seccomp.c | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 147b59338a1..5f3afe85579 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3204,7 +3204,7 @@ static void setup_mounts(const char *source)
 }
 
 /*
- * Only keep whitelisted capabilities that are needed for file system operation
+ * Only keep capabilities in allowlist that are needed for file system operation
  * The (possibly NULL) modcaps_in string passed in is free'd before exit.
  */
 static void setup_capabilities(char *modcaps_in)
@@ -3214,8 +3214,8 @@ static void setup_capabilities(char *modcaps_in)
     capng_restore_state(&cap.saved);
 
     /*
-     * Whitelist file system-related capabilities that are needed for a file
-     * server to act like root.  Drop everything else like networking and
+     * Add to allowlist file system-related capabilities that are needed for a
+     * file server to act like root.  Drop everything else like networking and
      * sysadmin capabilities.
      *
      * Exclusions:
diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
index ea852e2e33b..62441cfcdb9 100644
--- a/tools/virtiofsd/passthrough_seccomp.c
+++ b/tools/virtiofsd/passthrough_seccomp.c
@@ -21,7 +21,7 @@
 #endif
 #endif
 
-static const int syscall_whitelist[] = {
+static const int syscall_allowlist[] = {
     /* TODO ireg sem*() syscalls */
     SCMP_SYS(brk),
     SCMP_SYS(capget), /* For CAP_FSETID */
@@ -117,12 +117,12 @@ static const int syscall_whitelist[] = {
 };
 
 /* Syscalls used when --syslog is enabled */
-static const int syscall_whitelist_syslog[] = {
+static const int syscall_allowlist_syslog[] = {
     SCMP_SYS(send),
     SCMP_SYS(sendto),
 };
 
-static void add_whitelist(scmp_filter_ctx ctx, const int syscalls[], size_t len)
+static void add_allowlist(scmp_filter_ctx ctx, const int syscalls[], size_t len)
 {
     size_t i;
 
@@ -153,10 +153,10 @@ void setup_seccomp(bool enable_syslog)
         exit(1);
     }
 
-    add_whitelist(ctx, syscall_whitelist, G_N_ELEMENTS(syscall_whitelist));
+    add_allowlist(ctx, syscall_allowlist, G_N_ELEMENTS(syscall_allowlist));
     if (enable_syslog) {
-        add_whitelist(ctx, syscall_whitelist_syslog,
-                      G_N_ELEMENTS(syscall_whitelist_syslog));
+        add_allowlist(ctx, syscall_allowlist_syslog,
+                      G_N_ELEMENTS(syscall_allowlist_syslog));
     }
 
     /* libvhost-user calls this for post-copy migration, we don't need it */
-- 
2.26.2


