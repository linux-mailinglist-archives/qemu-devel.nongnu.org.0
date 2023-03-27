Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365EE6CAA55
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 18:17:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgpXG-00079n-MO; Mon, 27 Mar 2023 12:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pgpX4-0006jG-QK
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:17:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pgpX2-0007bO-If
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679933808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LKFrWIvprR3mlbTP85VjNbnKbE1B8eKojoGStrnuWY8=;
 b=LJVlYtZJLWQgUlYCgARlqsIYrvlkXZHLTU4mB08tPC3jh3X/5fQYfuf2Aw5CQpZ6xVFEOy
 mWmP0c8kQ+01MHrrrs/hT4FH4TAETCk9WUH6xVCyv15JFnnapHhTFITxU6tmH1npVachlX
 UTKYfN3OaOhhgJd26vlyOd9r87a3Mhk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-yL0kKylaMYqxqsLGPdV1uw-1; Mon, 27 Mar 2023 12:15:39 -0400
X-MC-Unique: yL0kKylaMYqxqsLGPdV1uw-1
Received: by mail-qt1-f199.google.com with SMTP id
 c11-20020ac85a8b000000b003bfdd43ac76so6287824qtc.5
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 09:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679933739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LKFrWIvprR3mlbTP85VjNbnKbE1B8eKojoGStrnuWY8=;
 b=rtIXvuPW3T+159HAYxTz6lqWgBdSFqmYL1nZgjoVfZIfMXatKoEmm8R7EfqBze/JCN
 9TwdZrLJlhWyKOP+/NOfjgcVCTH5TXhJSggnDxzLNvQPBwd+z2I5qcMcXABpuGw80ttR
 36mN1+46XcAXX3bMqzp8Iq3qqL3yvIfFTMmnJqp5CNg+L0g1EXL3boXJUBksbVJg+BY4
 aIpiVtdYcmSmcaI2HRdjueiwQtmKu6VyVOrzqL+t9UBByMpwhcyvSQR24HXVjUpkutKq
 RxvCMlcyGRzPctsEgel2WA0gmIYfFNHpxzNwBOtMNyl7M3p38yQN4XbksO9smkY6HVQq
 eMTA==
X-Gm-Message-State: AAQBX9f7rDzK4NFz+zaNkXMS9E+jKHa5BkBKtLXLpdi/WwPwvZNa2UWg
 q/IaCOUwDan7vK9qdDqSQvLSjdmhVmmsJ4HWyxiV43ZobL+b4IWQmDyApXSIY8tGyi43+dKvP5r
 gEtaS41nI/VT4uRk=
X-Received: by 2002:a05:6214:1cc2:b0:5c8:403a:22f8 with SMTP id
 g2-20020a0562141cc200b005c8403a22f8mr16504039qvd.5.1679933738857; 
 Mon, 27 Mar 2023 09:15:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350aCNa5IBtWDYO9O9QYvNsZhVymefGGWt3EnQd4727nu+wy/nFXxjzyctnD3T6qkTYW32NpHXA==
X-Received: by 2002:a05:6214:1cc2:b0:5c8:403a:22f8 with SMTP id
 g2-20020a0562141cc200b005c8403a22f8mr16503998qvd.5.1679933738438; 
 Mon, 27 Mar 2023 09:15:38 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:1b3:a801:eb52:32f:85d:2548:c8cf])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a056214115000b005dd8b93458asm3040570qvt.34.2023.03.27.09.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 09:15:37 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v1 1/1] migration: Disable postcopy + multifd migration
Date: Mon, 27 Mar 2023 13:15:18 -0300
Message-Id: <20230327161518.2385074-1-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since the introduction of multifd, it's possible to perform a multifd
migration and finish it using postcopy.

A bug introduced by yank (fixed on cfc3bcf373) was previously preventing
a successful use of this migration scenario, and now it should be
working on most cases.

But since there is not enough testing/support nor any reported users for
this scenario, we should disable this combination before it may cause any
problems for users.

Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/migration.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index ae2025d9d8..c601964b0e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1356,6 +1356,11 @@ static bool migrate_caps_check(bool *cap_list,
             error_setg(errp, "Postcopy is not compatible with ignore-shared");
             return false;
         }
+
+        if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
+            error_setg(errp, "Postcopy is not yet compatible with multifd");
+            return false;
+        }
     }
 
     if (cap_list[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
-- 
2.40.0


