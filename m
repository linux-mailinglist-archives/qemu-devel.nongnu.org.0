Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9DE41FC14
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:09:48 +0200 (CEST)
Received: from localhost ([::1]:34790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWelv-0008Lh-RQ
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeXE-000237-3G
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeXC-0000wa-Ks
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h6tz1pzz/4VduuxUJcTVLKl1Lh7BOZFtJinbrllV/PI=;
 b=IlPgud7CN/KA9MvgNbY6QcMz5e2pN72c5L/kh8qcbWC453AzpXyMQz/YYpPKZ6WfGOb/sb
 jjwfXozqaZDqz7CJgL3IZwgxiJmjSBdnAf4nufTNFxrpRWCqo8gFYT+Wn3cjQ4UvIvagtt
 McFag+hot0WtQg8TJY1VKt8MefAgQLM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-luase3KiP4iE1V1nbSsBzw-1; Sat, 02 Oct 2021 08:54:33 -0400
X-MC-Unique: luase3KiP4iE1V1nbSsBzw-1
Received: by mail-wm1-f72.google.com with SMTP id
 x3-20020a05600c21c300b0030d2b0fb3b4so4597746wmj.5
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h6tz1pzz/4VduuxUJcTVLKl1Lh7BOZFtJinbrllV/PI=;
 b=TUd+/SZwrzzzkk4HC3U9+s/wCnbij1RtpXkQVBqSQIzR7LcgPB5350RfscYgUVrt7g
 n85nKtklzNiEt1wmJb7+itBfNXUTNI69m+C19CZVwJy+J/M13phApSaVvRscYVyMdP48
 KqShu+fbtrIrkHcsE6wqqhBNfTb4mQbbU6iM3A2MkAhi3ZIfR9yrKmVIgpLCc03i1Rif
 Ojj2Iu8j2qLNbGlNP0bCaPdsLSdyx7ilo3+iMn0rvriUoA0wsWxVhgy0kClOahEP4FlD
 ftLvJyGeNZa/Rul9vrbYHGIlPkkfg4SzzoW8SKWxBMLrUkMUnxUSEKPYZvMs3fmnamjr
 EzVQ==
X-Gm-Message-State: AOAM533MY0amDmZ7FhPM8WQMuW2+gHxIxZeEfEIq1FQ6026zXsr3tWul
 kCM1/zwxebay6kuKCr1neoJyhSTn/N0jyC+fClXUhVsEMJnfD1YzAWYsUL3Nj/L5Vkr51JB+clZ
 6E6DKH9oNEDk4QVNZWfSRzOE0cKwmhqjCzIjJI7YFu+6wh7/ZcZY8bux2FJoklXrH
X-Received: by 2002:adf:b311:: with SMTP id j17mr3202023wrd.340.1633179271744; 
 Sat, 02 Oct 2021 05:54:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyu9v9AoE33m8O4FuueDOzXS5cpHqzVSB1CjLXdyosJZ9VfYPRTPpP3kB+NiZ18zNjZf4Yvsw==
X-Received: by 2002:adf:b311:: with SMTP id j17mr3201997wrd.340.1633179271459; 
 Sat, 02 Oct 2021 05:54:31 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 l25sm8457300wmi.29.2021.10.02.05.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:54:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/22] target/i386/sev: Move qmp_query_sev_capabilities()
 to sev.c
Date: Sat,  2 Oct 2021 14:53:11 +0200
Message-Id: <20211002125317.3418648-17-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002125317.3418648-1-philmd@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move qmp_query_sev_capabilities() from monitor.c to sev.c
and make sev_get_capabilities() static. We don't need the
stub anymore, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev_i386.h        | 1 -
 target/i386/monitor.c         | 5 -----
 target/i386/sev-sysemu-stub.c | 4 ++--
 target/i386/sev.c             | 8 ++++++--
 4 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index 5f367f78eb7..8d9388d8c5c 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -26,7 +26,6 @@
 
 extern SevInfo *sev_get_info(void);
 extern char *sev_get_launch_measurement(void);
-extern SevCapability *sev_get_capabilities(Error **errp);
 
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
 int sev_inject_launch_secret(const char *hdr, const char *secret,
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 188203da6f2..da36522fa15 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -728,11 +728,6 @@ SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
     return info;
 }
 
-SevCapability *qmp_query_sev_capabilities(Error **errp)
-{
-    return sev_get_capabilities(errp);
-}
-
 SGXInfo *qmp_query_sgx(Error **errp)
 {
     return sgx_get_info(errp);
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index 66b69540aa5..cc486a1afbe 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -27,9 +27,9 @@ char *sev_get_launch_measurement(void)
     return NULL;
 }
 
-SevCapability *sev_get_capabilities(Error **errp)
+SevCapability *qmp_query_sev_capabilities(Error **errp)
 {
-    error_setg(errp, "SEV is not available in this QEMU");
+    error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
 
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 2198d550be2..fce007d6749 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -438,8 +438,7 @@ e_free:
     return 1;
 }
 
-SevCapability *
-sev_get_capabilities(Error **errp)
+static SevCapability *sev_get_capabilities(Error **errp)
 {
     SevCapability *cap = NULL;
     guchar *pdh_data = NULL;
@@ -489,6 +488,11 @@ out:
     return cap;
 }
 
+SevCapability *qmp_query_sev_capabilities(Error **errp)
+{
+    return sev_get_capabilities(errp);
+}
+
 static SevAttestationReport *sev_get_attestation_report(const char *mnonce,
                                                         Error **errp)
 {
-- 
2.31.1


