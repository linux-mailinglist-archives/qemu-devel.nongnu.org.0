Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BE6702CCF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 14:36:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXPh-0006p6-TY; Mon, 15 May 2023 08:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXP1-0006TG-HF
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:34:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXOw-0003MX-J5
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:34:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684154042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aWmRjz4fwuIJDiq0s/t2IkjQIvfxRe7eKWP6VfkWff8=;
 b=WZbCq+j6ybiaBID7HcwM0l1p91JKIOuKeOcn89B16guISUYPLTpOZhVUTdLrzDLW6b4Cm7
 JGYu0UOk5Blf784W1/iYO3sxhqo/ce12qRQV2Ouxv0y9+67T/hDRS4mST63Y4vrlKklnyH
 HV1EEVhXLMpLKN4uMUL+LnhTsUDA7K4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-o5W7XfJMOtCLsoRRX7Bq_A-1; Mon, 15 May 2023 08:33:59 -0400
X-MC-Unique: o5W7XfJMOtCLsoRRX7Bq_A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E0C938123A5;
 Mon, 15 May 2023 12:33:59 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 504A963F3D;
 Mon, 15 May 2023 12:33:57 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 10/11] qemu-file: Make rate_limit_used an uint64_t
Date: Mon, 15 May 2023 14:33:33 +0200
Message-Id: <20230515123334.58995-11-quintela@redhat.com>
In-Reply-To: <20230515123334.58995-1-quintela@redhat.com>
References: <20230515123334.58995-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Change all the functions that use it.  It was already passed as
uint64_t.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20230508130909.65420-6-quintela@redhat.com>
---
 migration/qemu-file.h | 2 +-
 migration/qemu-file.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 13c7c78c0d..6905825f23 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -138,7 +138,7 @@ void qemu_file_reset_rate_limit(QEMUFile *f);
  * out of band from the main file object I/O methods, and
  * need to be applied to the rate limiting calcuations
  */
-void qemu_file_acct_rate_limit(QEMUFile *f, int64_t len);
+void qemu_file_acct_rate_limit(QEMUFile *f, uint64_t len);
 void qemu_file_set_rate_limit(QEMUFile *f, uint64_t new_rate);
 uint64_t qemu_file_get_rate_limit(QEMUFile *f);
 int qemu_file_get_error_obj(QEMUFile *f, Error **errp);
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 94d1069c8e..1b39d51dd4 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -49,7 +49,7 @@ struct QEMUFile {
      * Total amount of data in bytes queued for transfer
      * during this rate limiting time window
      */
-    int64_t rate_limit_used;
+    uint64_t rate_limit_used;
 
     /* The sum of bytes transferred on the wire */
     uint64_t total_transferred;
@@ -756,7 +756,7 @@ void qemu_file_reset_rate_limit(QEMUFile *f)
     f->rate_limit_used = 0;
 }
 
-void qemu_file_acct_rate_limit(QEMUFile *f, int64_t len)
+void qemu_file_acct_rate_limit(QEMUFile *f, uint64_t len)
 {
     f->rate_limit_used += len;
 }
-- 
2.40.1


