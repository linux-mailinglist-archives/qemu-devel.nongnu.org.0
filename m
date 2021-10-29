Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2994405AA
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:07:05 +0200 (CEST)
Received: from localhost ([::1]:34544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgaxk-0004dt-U1
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgat2-0005iQ-Nq
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:02:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgat0-0006vS-NT
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635548530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fr5VMOOKt0GVUz4qiC1RIeVWBlnPu1If/ZrGlw1UN7k=;
 b=FTn//fCrcFP+cOMAgkptdzfz8w51wtrnADx5bA2N/pnN6UOejJLcj+tFtLwWOtQKJ/fVSP
 XMLJ+amm7zELwbvpfFp4YyylO2pS1Y0LrXsJ7XZYDFgM6mDJEnNOCcy8awA/1wW/wF/F9w
 7viSCahMVdyk4DUvn0Ln3fTVyqEtxB4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-BbGmNmqdMYCXIe0vAUbNzQ-1; Fri, 29 Oct 2021 19:02:09 -0400
X-MC-Unique: BbGmNmqdMYCXIe0vAUbNzQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 r12-20020adfdc8c000000b0017d703c07c0so876546wrj.0
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 16:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fr5VMOOKt0GVUz4qiC1RIeVWBlnPu1If/ZrGlw1UN7k=;
 b=CZolA9Opuu7uKCI02JhSDLtyuQHK8abh8jCL2bUG/knCWPbTNRkpNwYGQeeHXoT3yW
 I1HS+O3AXxeYZjiernIV9GPrp/jGfmEu35DgFLT4NdGxqADHkjhyK1ckRqD3f1F3FgeP
 t20E55yrZc5eY+JAqVOBQ7NdwwB2eQrwV96l24Dm4NaHPHf0w/Cdn8z26KU+1aj/THJ2
 Md+xH8YsNU8uPf+RoYMvzIIiAMePloJt1OoVG9j6WJ56qbvtR1SR4hK3sl2md3BB/NqF
 RBNvjVhaXSpq5Bn1mdQDzSV+itzwvhKKJ2HZDP4XBNFQKzkXl/0/xYJhJodk33UqcZRN
 0q5g==
X-Gm-Message-State: AOAM530b0RMCguTSEhx1xsh0aJe/8n9LmvWiVEx0D2WAaCQJcAlA+hzV
 /SychRcGeq2YHRl2fh/EhQCIgCV5IhN095TnrgvzB7Tpcl+7ym576H1MP413VWBQD3ni9eTbmuA
 HFYU4wX1A2i21XHGLKsVoT7ew/x8eRxv73UdqAK7KJzYcnR3/08L9czZr8MQfJJov
X-Received: by 2002:a05:600c:a42:: with SMTP id
 c2mr22554147wmq.154.1635548527647; 
 Fri, 29 Oct 2021 16:02:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrpGWrJ5Q0pokQ5CxmKPkdczx/jh1JX9VeyM4eidl/CsZRs06Mr2UwFWc0wU0GO0poqdcoCw==
X-Received: by 2002:a05:600c:a42:: with SMTP id
 c2mr22554117wmq.154.1635548527432; 
 Fri, 29 Oct 2021 16:02:07 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t15sm5909999wmi.24.2021.10.29.16.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 16:02:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] hw/core: Remove uses of QERR_PROPERTY_VALUE_BAD
Date: Sat, 30 Oct 2021 01:01:46 +0200
Message-Id: <20211029230147.2465055-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029230147.2465055-1-philmd@redhat.com>
References: <20211029230147.2465055-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QERR_PROPERTY_VALUE_BAD definition is obsolete since 2015 (commit
4629ed1e989, "qerror: Finally unused, clean up"). Replace the two
uses and drop the definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qapi/qmp/qerror.h | 3 ---
 hw/core/qdev-properties.c | 2 +-
 target/i386/cpu.c         | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index f49ae01cdb0..a3f44fc4a1e 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -50,9 +50,6 @@
 #define QERR_PERMISSION_DENIED \
     "Insufficient permission to perform this operation"
 
-#define QERR_PROPERTY_VALUE_BAD \
-    "Property '%s.%s' doesn't take value '%s'"
-
 #define QERR_PROPERTY_VALUE_OUT_OF_RANGE \
     "Property %s.%s doesn't take value %" PRId64 " (minimum: %" PRId64 ", maximum: %" PRId64 ")"
 
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index c34aac6ebc9..dbea4cf8e5e 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -663,7 +663,7 @@ void error_set_from_qdev_prop_error(Error **errp, int ret, Object *obj,
         break;
     default:
     case -EINVAL:
-        error_setg(errp, QERR_PROPERTY_VALUE_BAD,
+        error_setg(errp, "Property '%s.%s' doesn't take value '%s'",
                    object_get_typename(obj), name, value);
         break;
     case -ENOENT:
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index fc3ed80ef1e..bc63b80e5bd 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4469,7 +4469,7 @@ static void x86_cpuid_set_vendor(Object *obj, const char *value,
     int i;
 
     if (strlen(value) != CPUID_VENDOR_SZ) {
-        error_setg(errp, QERR_PROPERTY_VALUE_BAD, "", "vendor", value);
+        error_setg(errp, "Property '.vendor' doesn't take value '%s'", value);
         return;
     }
 
-- 
2.31.1


