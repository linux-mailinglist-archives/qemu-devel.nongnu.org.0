Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3F76E7F70
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:19:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAVK-0004uj-GF; Wed, 19 Apr 2023 12:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ppAVD-0004u4-W4
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:17:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ppAVC-00050P-IB
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:17:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681921069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgVm4ot3oncYZxZF5RHIGcFRboA9mEQIrrDpxafvVz0=;
 b=YNs3LO4I2P82MRoa0ey8wCEqfFk/i4/M9e1Zd7IdkyLGwK45C+zpYD9UhZmU1xSsM5vG/y
 bHMkM6BpRpEpIU102pJmwvdZVGY8Tm2s3yFDFU1ncQpeVU4Cg80yobYDMdT9+eoQ+vGFmR
 yYN0npiFDEaxRI9wf8YoS9IWAHcCEQ4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-0NKied3bNOO7gQ644S0X-g-1; Wed, 19 Apr 2023 12:17:48 -0400
X-MC-Unique: 0NKied3bNOO7gQ644S0X-g-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-3ecc0c4b867so13083411cf.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 09:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681921067; x=1684513067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fgVm4ot3oncYZxZF5RHIGcFRboA9mEQIrrDpxafvVz0=;
 b=iSYh0L6DsWVIGw59T/YKftwhO0JxsTaUf3kOHVoGbm/0dVBMRAw+KmWIwjgiU3dbiy
 hrxLkdQR8dDal+Jmf0vDaRYAiq2rXIhWQ0LBLsHjNprc7dXGA0kcrRw/hr9E0wKZy2He
 6Xlnv6pNG7cVdMqE17/kxUi9+Eo1uSKvEWHJJZQwKzqhLBsl8TKtbrNS8+AwUgZjvsGb
 ghOsFQ4/POK85A1Dgnw4aao0VlGudaDTciJHsdEDAeT43deipuYGKdA8ucooBolFC/ei
 pYyGVmvLk8kZ1Y6KmHRvTKLCfLY39OKRZTdcS8xFcvfnoyzvfc8oKwpVF5a0oO6YdW6G
 v2og==
X-Gm-Message-State: AAQBX9fuLzw2V+mc1vurNP7f38DbSNiabIrSQ6ceT5XTuWygbY0tVQh/
 ZEWHkGbAB3x0d38n/SJQgJoYLnjduNyypnxCLkw+EUSoac5WPVw/RcoCjwzmMYzRWdKZgpCBIhw
 3STcX3Sz577QwvsrrsfFCGhxuOW+/Kdr2qgtsGKBwx3c6ttWQjcEDCCGFMo8JuqD9qDQuWgVT
X-Received: by 2002:a05:622a:1894:b0:3ef:4614:d0e9 with SMTP id
 v20-20020a05622a189400b003ef4614d0e9mr4029508qtc.5.1681921066917; 
 Wed, 19 Apr 2023 09:17:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350a+TZVnHgbhimiZDOFJhqzl+aKj+73n86RSKn7fITD7YUu07Y1/dPrZhI7NizeCjO1p7TLVCw==
X-Received: by 2002:a05:622a:1894:b0:3ef:4614:d0e9 with SMTP id
 v20-20020a05622a189400b003ef4614d0e9mr4029471qtc.5.1681921066666; 
 Wed, 19 Apr 2023 09:17:46 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca. [70.52.229.124])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a05620a0b0c00b007468b183a65sm351481qkg.30.2023.04.19.09.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 09:17:46 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, peterx@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 2/4] vl.c: Create late backends before migration object
Date: Wed, 19 Apr 2023 12:17:37 -0400
Message-Id: <20230419161739.1129988-3-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230419161739.1129988-1-peterx@redhat.com>
References: <20230419161739.1129988-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The migration object may want to check against different types of memory
when initialized.  Delay the creation to be after late backends.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/vl.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index ea20b23e4c..ad394b402f 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3583,14 +3583,19 @@ void qemu_init(int argc, char **argv)
                      machine_class->name, machine_class->deprecation_reason);
     }
 
+    /*
+     * Create backends before creating migration objects, so that it can
+     * check against compatibilities on the backend memories (e.g. postcopy
+     * over memory-backend-file objects).
+     */
+    qemu_create_late_backends();
+
     /*
      * Note: creates a QOM object, must run only after global and
      * compat properties have been set up.
      */
     migration_object_init();
 
-    qemu_create_late_backends();
-
     /* parse features once if machine provides default cpu_type */
     current_machine->cpu_type = machine_class->default_cpu_type;
     if (cpu_option) {
-- 
2.39.1


