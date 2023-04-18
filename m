Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 275EC6E6FBD
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 00:59:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pouGz-0001L1-GZ; Tue, 18 Apr 2023 18:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pouGx-0001Kn-IA
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:58:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pouGt-0007D4-Oy
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681858678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgVm4ot3oncYZxZF5RHIGcFRboA9mEQIrrDpxafvVz0=;
 b=BVnvwSmtMovaD9Cnuvbsv2aQYPFHcRrefL8w3w3xddVHsfjtkHEjTl0F3IGqq3LrkpoBLG
 kDTCyjvTYF1aiNX6FAaauKjZmP+/4kdDxXCA2II20fgTjd7dbfLMftULFDYpTi6b1poSzL
 jMDGXCX8ELE19Ymz+T3uJppOl4MYITQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-R6gU-5kEOYimXzL2UihADQ-1; Tue, 18 Apr 2023 18:57:57 -0400
X-MC-Unique: R6gU-5kEOYimXzL2UihADQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-74d96c33de9so67622985a.1
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 15:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681858676; x=1684450676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fgVm4ot3oncYZxZF5RHIGcFRboA9mEQIrrDpxafvVz0=;
 b=JSnClTabpeJu8lFyrOESTq+xRm10kOVNctzsfXyXgvdgnupDTKBjR8P6laILHXAlqg
 YMm2+TKNGl3EUvP2JAVITEFEjxXLLgQ4cHgctflKHQzb3MNr/x/Et5UpFDqcWvKgUPkj
 RyTx79UEoV6FkWrmH7z6X37oopO1xl8+K1yLf9jF2WmJrCp2OIYulGd6ejgNPr0UNBcd
 E5vV6p4ges+FN8UCwJEw3Ggmz4me/zVAFzhz3IxOOWEqWas56ow8XjKZf85+QyhRiIQN
 oRNLx3MbYJMQXNuKmM5iTuQmGCVpowfDIZAnVusTfK/vMfY8rO2nHtwZHG5Z74b8Xvp1
 cckw==
X-Gm-Message-State: AAQBX9f9al/gyZkwP+PDaQI+1OSwFx1Ixd2ecRVhW1uZPDtr2M+ewmLX
 uOrkoGW5v2sLMs11ZyUWaZlvE7OLzzipF8lOYySkhJPFDmU3/5+Tp0XbJdkDrdzj/hPOrU4E8Dy
 Bvlh6unls7OxMXOYXLGH/76QAIp8t3XkQu7TaA3+vD6uTAWgXWpNl6APFDtu/+EWVm+XYd7My
X-Received: by 2002:ad4:5ba7:0:b0:5f1:31eb:1f0e with SMTP id
 7-20020ad45ba7000000b005f131eb1f0emr5582350qvq.4.1681858676399; 
 Tue, 18 Apr 2023 15:57:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350auUMFdrAi5+6gfwcvPdZGSD3TlaosH9IapNsxk2moQGdaRYGk5acR/OzdU/3PzZ/Yzyt4ysw==
X-Received: by 2002:ad4:5ba7:0:b0:5f1:31eb:1f0e with SMTP id
 7-20020ad45ba7000000b005f131eb1f0emr5582324qvq.4.1681858676139; 
 Tue, 18 Apr 2023 15:57:56 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca. [70.52.229.124])
 by smtp.gmail.com with ESMTPSA id
 i3-20020ad45383000000b005e3c45c5cbdsm2937330qvv.96.2023.04.18.15.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 15:57:53 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com
Subject: [PATCH 2/3] vl.c: Create late backends before migration object
Date: Tue, 18 Apr 2023 18:57:48 -0400
Message-Id: <20230418225749.1049185-3-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230418225749.1049185-1-peterx@redhat.com>
References: <20230418225749.1049185-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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


