Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F1D3A82D9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:29:25 +0200 (CEST)
Received: from localhost ([::1]:59808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltA4B-0007PY-TE
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lt9wp-0004eH-Rn
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:21:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lt9wm-00028E-DI
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:21:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623766903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3hIM4nZ+edtMSEGqYdtBltxWEdrhiKauaGSD/ANl7HE=;
 b=iR7q52YRZsRPHr9IaNSfLDlD/ImXqlS3GnS0/UMmD6+3J09Dl2nHjax58jl8KOSKbiHXzq
 MXnB3pCAQP3/eBQjh/TwEZJ/638NrYNtLHxE/QeV9n/6GEJ5ddljDqY/7+Kc4QBr9cvjbw
 M6OztAdyljdVWAhFpy4XHjwNy/itiog=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-_U9iI0d8Pc6mx_CRdxaGfw-1; Tue, 15 Jun 2021 10:21:42 -0400
X-MC-Unique: _U9iI0d8Pc6mx_CRdxaGfw-1
Received: by mail-wr1-f70.google.com with SMTP id
 x9-20020adfffc90000b02901178add5f60so8730756wrs.5
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 07:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3hIM4nZ+edtMSEGqYdtBltxWEdrhiKauaGSD/ANl7HE=;
 b=NhPQ100wKzWKQhH8sgKvdQYMS7fnirVeb7bLhXj3vdmWpPn/MTlXYDhv+7yT/LPh+C
 Vukkiv/CwMsh7u6OvZpu9+ZACKJ8zx9o8qA8dkqvXmpW7CcyEpfCgKW4YwVEf/ZSUKSU
 ggPJBQIKFW9uxc8oYJ2b9SwWDqAMZXZmb3eaDNlysUihvzCoTteulOuf3n6BCWtbsxNn
 hvQ3gOYiUq1Y/i8pjZu/+32fsH/SeG7MGfwAboRoLxdUSImECn+tNdIc6+TKzmeCBjp+
 ZGg4qTtLFOlKB1zEUKbuGm5KiJfrgwDfloACmSS1PkxSYf4XNNB3qZLP2+EKtT3UwYu1
 0s2w==
X-Gm-Message-State: AOAM531L0agBL8VhfWGVNPBZtpltHXf6yUBnR4ru1pNM/l4ovOsDi2RF
 d6QCyjKfPR7/lZ6JqhBAirjHcKmwbHZ2BggY2Bnoku46Zng8UIBGLjKsDSfPWEYMkB7sZVV++Du
 MAhDX4uv8h9vT74J2s0LdF3PSEiTJ18RqskQFzBLHir95baWuBCl9FamxdQOr1VW7
X-Received: by 2002:a05:600c:4e8e:: with SMTP id
 f14mr5473881wmq.172.1623766901567; 
 Tue, 15 Jun 2021 07:21:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2ac6UxeiY2dO0jq/DtQflEHm9UTpF6R/VHeyAVvmD2jdUs//SV3xreYd+mdAfdlwDOz90Hg==
X-Received: by 2002:a05:600c:4e8e:: with SMTP id
 f14mr5473863wmq.172.1623766901357; 
 Tue, 15 Jun 2021 07:21:41 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id t1sm18620831wrx.28.2021.06.15.07.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 07:21:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/5] sysemu: Make TPM structures inaccessible if CONFIG_TPM
 is not defined
Date: Tue, 15 Jun 2021 16:21:20 +0200
Message-Id: <20210615142121.2127692-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615142121.2127692-1-philmd@redhat.com>
References: <20210615142121.2127692-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Berger <stefanb@linux.ibm.com>

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210614191335.1968807-5-stefanb@linux.ibm.com>
[PMD: Remove tpm_init() / tpm_cleanup() stubs]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/tpm.h         |  9 +++++++++
 include/sysemu/tpm_backend.h |  6 +++++-
 stubs/tpm.c                  | 10 ----------
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
index 1a85564e479..68b2206463c 100644
--- a/include/sysemu/tpm.h
+++ b/include/sysemu/tpm.h
@@ -15,6 +15,8 @@
 #include "qapi/qapi-types-tpm.h"
 #include "qom/object.h"
 
+#ifdef CONFIG_TPM
+
 int tpm_config_parse(QemuOptsList *opts_list, const char *optarg);
 int tpm_init(void);
 void tpm_cleanup(void);
@@ -73,4 +75,11 @@ static inline TPMVersion tpm_get_version(TPMIf *ti)
     return TPM_IF_GET_CLASS(ti)->get_version(ti);
 }
 
+#else /* CONFIG_TPM */
+
+#define tpm_init()  (0)
+#define tpm_cleanup()
+
+#endif /* CONFIG_TPM */
+
 #endif /* QEMU_TPM_H */
diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
index 6f078f5f482..8fd3269c117 100644
--- a/include/sysemu/tpm_backend.h
+++ b/include/sysemu/tpm_backend.h
@@ -18,6 +18,8 @@
 #include "sysemu/tpm.h"
 #include "qapi/error.h"
 
+#ifdef CONFIG_TPM
+
 #define TYPE_TPM_BACKEND "tpm-backend"
 OBJECT_DECLARE_TYPE(TPMBackend, TPMBackendClass,
                     TPM_BACKEND)
@@ -209,4 +211,6 @@ TPMInfo *tpm_backend_query_tpm(TPMBackend *s);
 
 TPMBackend *qemu_find_tpm_be(const char *id);
 
-#endif
+#endif /* CONFIG_TPM */
+
+#endif /* TPM_BACKEND_H */
diff --git a/stubs/tpm.c b/stubs/tpm.c
index 22014595a06..e79bd2a6c2d 100644
--- a/stubs/tpm.c
+++ b/stubs/tpm.c
@@ -7,18 +7,8 @@
 
 #include "qemu/osdep.h"
 #include "qapi/qapi-commands-tpm.h"
-#include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
 
-int tpm_init(void)
-{
-    return 0;
-}
-
-void tpm_cleanup(void)
-{
-}
-
 TPMInfoList *qmp_query_tpm(Error **errp)
 {
     return NULL;
-- 
2.31.1


