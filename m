Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAFA425836
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:42:55 +0200 (CEST)
Received: from localhost ([::1]:44238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWTu-0005x3-GF
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6e-000634-7s
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6a-0005ac-3J
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eYG5GFyks0GfeQysE3VKr9sF8B7VadEExh3ZaL/jqtM=;
 b=HW2M9TbVl0woqCe6zFOpZTW0BXVGpdmlKFMXcKBrDIUUluebWA5aA0qmAftqh8HK8LM3qt
 UoIUMKehFcAGBcdVdVxDo1x4S3rxSmXq0JCwKZVVzRCyZSNU4SlObpktHfTpPcJyBmRlgK
 ySy+asmNmalQrRVKRWJiSF2rd0KlvWo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-GRL1Xd2MNS-XOogBfi74eA-1; Thu, 07 Oct 2021 12:18:46 -0400
X-MC-Unique: GRL1Xd2MNS-XOogBfi74eA-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so5120103wrb.14
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eYG5GFyks0GfeQysE3VKr9sF8B7VadEExh3ZaL/jqtM=;
 b=KEFgsYQ6N2IE+i+frfS819TMM43+8U+LMIadkPiEoy1sxWKjbzHx04/9eMcg1iofw0
 PvaFTXvezM3pDYfyIlnbnnoHuGvjgQtIZtcWnUr9yHfQZHjHTDddrS5pb7hOCWgnlB6s
 oS4uJCLJjr19zmQ229n4oveLwXcRkqaxBbg2kRTbkR7RraVQKso1wlrmooX3NHpx0BR9
 lWHWkV8oHqhhv4iMDeDfMBUAts8rvBkhb5l+iFj7g/heJS1Seu4f39CGyrlZcpEgue3t
 6Trta5H/gDwY2E4h/VkMAAWwVUlKjU37pfcQ5f7YQSXomLOo7eUi0QHhha5HU9FiN/44
 hU6w==
X-Gm-Message-State: AOAM53049YqtJJ+R4M1HlgstiN0JxWvzy6N/btADr3Hfj+xGeqrocCkK
 0EgkFTMX7ayzi9uM2mcvDW1WdPexvSzeg9pkCKToPG53OIqX9aeDVUhgReRNwrIWefVbqzr7hZM
 spJQH/Y/GmiqNden/2kzFjhRYbp+XLIx74j0iRBgurZYKsn20EWg1cSWE66rTzuz7
X-Received: by 2002:adf:aa92:: with SMTP id h18mr6442657wrc.372.1633623525197; 
 Thu, 07 Oct 2021 09:18:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHHZKQOjYRnT9+FmsxmDtac4YCe8C0X0vefev5KYvlUQXaIrRgt4AfzCSl6KGgaKbHDRYH0g==
X-Received: by 2002:adf:aa92:: with SMTP id h18mr6442625wrc.372.1633623524973; 
 Thu, 07 Oct 2021 09:18:44 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id f9sm85962wrt.11.2021.10.07.09.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:18:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/23] target/i386/sev: Move qmp_query_sev_capabilities()
 to sev.c
Date: Thu,  7 Oct 2021 18:17:12 +0200
Message-Id: <20211007161716.453984-20-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007161716.453984-1-philmd@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move qmp_query_sev_capabilities() from monitor.c to sev.c
and make sev_get_capabilities() static. We don't need the
stub anymore, remove it.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev.h             | 1 -
 target/i386/monitor.c         | 5 -----
 target/i386/sev-sysemu-stub.c | 2 +-
 target/i386/sev.c             | 8 ++++++--
 4 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/target/i386/sev.h b/target/i386/sev.h
index 2e90c05fc3f..b70b7b56cb8 100644
--- a/target/i386/sev.h
+++ b/target/i386/sev.h
@@ -51,7 +51,6 @@ extern SevInfo *sev_get_info(void);
 extern uint32_t sev_get_cbit_position(void);
 extern uint32_t sev_get_reduced_phys_bits(void);
 extern char *sev_get_launch_measurement(void);
-extern SevCapability *sev_get_capabilities(Error **errp);
 extern bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp);
 
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 22883ef2ebb..4c017b59b3a 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -727,11 +727,6 @@ SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
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
index 82c5ebb92fa..3e8cab4c144 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -27,7 +27,7 @@ char *sev_get_launch_measurement(void)
     return NULL;
 }
 
-SevCapability *sev_get_capabilities(Error **errp)
+SevCapability *qmp_query_sev_capabilities(Error **errp)
 {
     error_setg(errp, "SEV is not available in this QEMU");
     return NULL;
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 072bb6f0fd7..56e9e03accd 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -466,8 +466,7 @@ e_free:
     return 1;
 }
 
-SevCapability *
-sev_get_capabilities(Error **errp)
+static SevCapability *sev_get_capabilities(Error **errp)
 {
     SevCapability *cap = NULL;
     guchar *pdh_data = NULL;
@@ -517,6 +516,11 @@ out:
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


