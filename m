Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D4030CD88
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 22:02:48 +0100 (CET)
Received: from localhost ([::1]:34836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l72ox-0004Lc-VO
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 16:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72lX-0002El-D2
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:59:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72lV-00072c-LX
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:59:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612299553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zr5wlPqSBAErI1zYjHx4DGcwT+gbzmViuOOQn3eQ5nU=;
 b=bQNHIAY5g+SVomfceUj+60FKf2dUdL+P2HngmyTRjCadbQ01mJqBpeNPAQEqxVuLGSdYnO
 IfnBnt74+/76aOhtxf86AqDNDFCxau0L37nFBk7sUJMI+sdnJJy4Z8udBNTuOrFSeoBK5A
 9AhXoag6jYbs6ZuSf8fiq0JAb0hfi/E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-V3DfMWakPxixoopxD_yTpg-1; Tue, 02 Feb 2021 15:59:09 -0500
X-MC-Unique: V3DfMWakPxixoopxD_yTpg-1
Received: by mail-ej1-f71.google.com with SMTP id bx12so3321447ejc.15
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 12:59:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zr5wlPqSBAErI1zYjHx4DGcwT+gbzmViuOOQn3eQ5nU=;
 b=FLZvOz8JIQ0EasXr+hT1vrSvQknUQ0Y5Wsyaqy2gWFz6TlyeJZ5y20J7FBtjjx8NkQ
 ctXwsGQ1KLHvzi5vGxgEGtS/mqDjuU+pJWptoWRcdwhVh4s8pR9StnynEKpeyYwlI9+v
 PfqYrOtfuFt3FUgzIkNg/xnikU1MhDqcha0H5HlPDbUSDeeai4Nf212HmHdMNPO8Q76h
 03AP6Es0nsWB4SAnFsH52U7ThDhFIx5bwPUSKM+kX8PBZwHtgFnoqEKa68eMkR1tC5YA
 bs+TiPRxceIBHlD5qvsaLqGpnZgY9O8wAHm56zV/XI8GSeZqm/HO1UNPjUmms8ccg4nN
 5q1Q==
X-Gm-Message-State: AOAM532Ss940sDGckJxp3xnBdouGvJILBvzAvTHhvHPVI0kKBQVlrvG3
 IuBlUD8I+sWIlnxBuZaPpGinkEDWDNUC3NHbTuDgK06GiRVKsoStwCAefb1Ge3nxKm3D4Cy8ic1
 gJLiS4cJD/t+GRG4b/8Rm8B1kYk3j8+e7VFAjBo9FoKNFon+zVWGj8pb2qCRAkOds
X-Received: by 2002:a05:6402:26d3:: with SMTP id x19mr3435edd.0.1612299547762; 
 Tue, 02 Feb 2021 12:59:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzL+z53Vv/o3ibh8w3bBxjCI6htGchO9ok3XyqBAXpPxadZKvFGzM1UiGQcX6+0BX7J2BHqkg==
X-Received: by 2002:a05:6402:26d3:: with SMTP id x19mr3408edd.0.1612299547532; 
 Tue, 02 Feb 2021 12:59:07 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id b1sm12197eju.15.2021.02.02.12.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 12:59:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/12] tools/virtiofsd: Replace the word 'whitelist'
Date: Tue,  2 Feb 2021 21:58:17 +0100
Message-Id: <20210202205824.1085853-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210202205824.1085853-1-philmd@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the words "whitelist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c      |  6 +++---
 tools/virtiofsd/passthrough_seccomp.c | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 5fb36d94074..4bf86d44211 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3132,7 +3132,7 @@ static void setup_mounts(const char *source)
 }
 
 /*
- * Only keep whitelisted capabilities that are needed for file system operation
+ * Only keep capabilities in allowlist that are needed for file system operation
  * The (possibly NULL) modcaps_in string passed in is free'd before exit.
  */
 static void setup_capabilities(char *modcaps_in)
@@ -3142,8 +3142,8 @@ static void setup_capabilities(char *modcaps_in)
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
index a60d7da4b4e..c8b1ebbe830 100644
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
@@ -115,12 +115,12 @@ static const int syscall_whitelist[] = {
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
 
@@ -151,10 +151,10 @@ void setup_seccomp(bool enable_syslog)
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


