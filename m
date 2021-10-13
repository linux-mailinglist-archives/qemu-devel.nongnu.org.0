Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608D142BBCC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:39:37 +0200 (CEST)
Received: from localhost ([::1]:46882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maajY-0006wY-DL
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaF0-0002cZ-9l
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:08:06 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEv-0005zp-ID
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:08:01 -0400
Received: by mail-ed1-x532.google.com with SMTP id i20so7138765edj.10
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=armVoq3TN3IYSGrDgw8VqfJc8agou8DDdYHEuf07qwY=;
 b=GqZmrBLCTj55qaFEA+p1fP2RBWsvyUApTzoHb95M2oCuTaCnp/huHdud2Wj3UFW8Jb
 a70z168ALbdS1xCIeGu1Vcmd7pGblANZiYc4kZRRGzaQKRgwpOabkK9H3rO5XKtMzQ4x
 WXJ1IzBXi72enXAUas36mI6Iy8NkayX57r6t+2or3lVv5S/ggyOEV2UyClRLYf1Mbzgd
 WxMT/7Z6J9DbWJ+V+P8gqy8rNVPiyRixWhxEW4vZdmortWbaHhthuiOGUzhxFgvAbNQG
 LImfdmyvx9DrwQOEOh2kcudGbMqABm2tHiLR9gAsAb1jf7Rto5b16jzOj6MerVzFk6Ys
 0juA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=armVoq3TN3IYSGrDgw8VqfJc8agou8DDdYHEuf07qwY=;
 b=koMH2OURFN64DxRyCkagMDUAa+MKw2r9a+Ln96ID3mKoLY07Rko2B77dZ6FI3JJztW
 H4mitKJMc0OkKovcmbGs5Ktm+Dr0//J1DYOC8e7sFdNdGrtsJMvS3e+VH4Y8cVxotIn2
 VGWKgsPgbUMxlp+YxT1s1cAr5jxXxsZLAiXyYeBAYJb7buKCxDZKEHvsw6IBB5gWa27x
 +lsUCCrJGimw6lKgGE4FsuzxUHQrcUUqVytu9dOO9vxyz18SWWKtT2Wu2xARBT7xasT/
 VCubhvrVyCVNleSniHmIAYroGxUH+EWfT33zTrG2HgwE3YAw/kT4sguzZNPs4xmKK8GK
 i9oA==
X-Gm-Message-State: AOAM5316IESDRhu1w0LOQ3C3GqNUJKVi+Ub/CH+xyTJMuU9SrE5gw1pl
 7thLpkLsnJ6V5+Wt2/tRzFFmODaJGsE=
X-Google-Smtp-Source: ABdhPJyMdpUwoJ7/ueDferHasYEX0qA96qizybafZLGWLwZ6G9orc+fb1UNp6HkMSxonPAlE2f8sjg==
X-Received: by 2002:a17:907:629b:: with SMTP id
 nd27mr38775100ejc.24.1634116076010; 
 Wed, 13 Oct 2021 02:07:56 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 38/40] target/i386/sev: Use local variable for
 kvm_sev_launch_start
Date: Wed, 13 Oct 2021 11:07:26 +0200
Message-Id: <20211013090728.309365-39-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Dov Murik <dovmurik@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dov Murik <dovmurik@linux.ibm.com>

The struct kvm_sev_launch_start has a constant and small size, and
therefore we can use a regular local variable for it instead of
allocating and freeing heap memory for it.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20211011173026.2454294-2-dovmurik@linux.ibm.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/sev.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 4c64c68244..0062566c71 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -647,31 +647,29 @@ sev_launch_start(SevGuestState *sev)
     gsize sz;
     int ret = 1;
     int fw_error, rc;
-    struct kvm_sev_launch_start *start;
+    struct kvm_sev_launch_start start = {
+        .handle = sev->handle, .policy = sev->policy
+    };
     guchar *session = NULL, *dh_cert = NULL;
 
-    start = g_new0(struct kvm_sev_launch_start, 1);
-
-    start->handle = sev->handle;
-    start->policy = sev->policy;
     if (sev->session_file) {
         if (sev_read_file_base64(sev->session_file, &session, &sz) < 0) {
             goto out;
         }
-        start->session_uaddr = (unsigned long)session;
-        start->session_len = sz;
+        start.session_uaddr = (unsigned long)session;
+        start.session_len = sz;
     }
 
     if (sev->dh_cert_file) {
         if (sev_read_file_base64(sev->dh_cert_file, &dh_cert, &sz) < 0) {
             goto out;
         }
-        start->dh_uaddr = (unsigned long)dh_cert;
-        start->dh_len = sz;
+        start.dh_uaddr = (unsigned long)dh_cert;
+        start.dh_len = sz;
     }
 
-    trace_kvm_sev_launch_start(start->policy, session, dh_cert);
-    rc = sev_ioctl(sev->sev_fd, KVM_SEV_LAUNCH_START, start, &fw_error);
+    trace_kvm_sev_launch_start(start.policy, session, dh_cert);
+    rc = sev_ioctl(sev->sev_fd, KVM_SEV_LAUNCH_START, &start, &fw_error);
     if (rc < 0) {
         error_report("%s: LAUNCH_START ret=%d fw_error=%d '%s'",
                 __func__, ret, fw_error, fw_error_to_str(fw_error));
@@ -679,11 +677,10 @@ sev_launch_start(SevGuestState *sev)
     }
 
     sev_set_guest_state(sev, SEV_STATE_LAUNCH_UPDATE);
-    sev->handle = start->handle;
+    sev->handle = start.handle;
     ret = 0;
 
 out:
-    g_free(start);
     g_free(session);
     g_free(dh_cert);
     return ret;
-- 
2.31.1



