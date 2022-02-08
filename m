Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7689E4ADD39
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:44:04 +0100 (CET)
Received: from localhost ([::1]:33076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHSex-0005Rt-Es
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:44:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHRjy-00048d-3q
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:45:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHRju-0001e2-1f
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644331505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7JuujSZ9WJvt/byWe9v0f0tYgfBEKts1xVNKYazMLY=;
 b=Jsx4q0/EbTq6NoFRUcAw46vrpmSSWU1ThdjCZSkyhbS6iXZsMcU217opGnIXCmaDravaI7
 H9ECVX+m/w+qX+naozIqxAAxRmy2wC1M35kUQjic5YENFtHKyFmIYnrRY8+Bn2Ot7ofBD1
 wIWyDnt0HxLRJJ5u6ilSU+q/LOs1UwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-bQzuuVkONeuoAWrQeK1uDg-1; Tue, 08 Feb 2022 09:45:02 -0500
X-MC-Unique: bQzuuVkONeuoAWrQeK1uDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D437F1091DAE;
 Tue,  8 Feb 2022 14:45:00 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46D2E7DE42;
 Tue,  8 Feb 2022 14:45:00 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/3] migration: allow calling migration_shutdown without a
 prior initialization
Date: Tue,  8 Feb 2022 09:44:56 -0500
Message-Id: <20220208144458.1079634-2-pbonzini@redhat.com>
In-Reply-To: <20220208144458.1079634-1-pbonzini@redhat.com>
References: <20220208144458.1079634-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: damien.hedde@greensocs.com, berrange@redhat.com, mark.burton@greensocs.com,
 armbru@redhat.com, f4bug@amsat.org, mirela.grujic@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This can happen with the qemu-qmp binaries.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 migration/migration.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index bcc385b94b..075b21d9b5 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -226,6 +226,10 @@ void migration_cancel(const Error *error)
 
 void migration_shutdown(void)
 {
+    if (!current_migration) {
+        return;
+    }
+
     /*
      * When the QEMU main thread exit, the COLO thread
      * may wait a semaphore. So, we should wakeup the
-- 
2.31.1



