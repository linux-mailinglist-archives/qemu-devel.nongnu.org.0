Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B082CB766
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:43:17 +0100 (CET)
Received: from localhost ([::1]:50076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNjI-0001pA-EA
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:43:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkND5-0003Tf-Gt
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCS-0003mI-Qf
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XaopSvQFOQg8qNe7dPekPUCjQOLZMQSxkW2ChW6RDSI=;
 b=b9Lf2rIi2CQVsNncJ6zkaQ8GPrgbPads/TL5U315aw3/TI3F86+XsOBXpwQMN8fv/BU75h
 h5OOMEYTFBugdaPwZJP7CQ0ScE1Kmq3BjvgeDtOlxiy98TgV3aiJFqabt77q2RN0bHypQw
 T+UTh1yuIGZsaioKW+IP2JDizVREXNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575--U7AI-WeN_KDIChTGMPfrQ-1; Wed, 02 Dec 2020 03:09:18 -0500
X-MC-Unique: -U7AI-WeN_KDIChTGMPfrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BA301006C82
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:17 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD50F5D9C6
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:16 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 072/113] vl: move -global check earlier
Date: Wed,  2 Dec 2020 03:08:08 -0500
Message-Id: <20201202080849.4125477-73-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The check has the same effect here, it only matters that it is performed
once all devices, both builtin and user-specified, have been created.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 6a2972938d..e65eb0c9f2 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3490,6 +3490,8 @@ static void qemu_machine_creation_done(void)
         net_check_clients();
     }
 
+    qdev_prop_check_globals();
+
     if (boot_once) {
         qemu_boot_set(boot_once, &error_fatal);
         qemu_register_reset(restore_boot_order, g_strdup(boot_order));
@@ -4547,7 +4549,6 @@ void qemu_init(int argc, char **argv, char **envp)
         replay_vmstate_init();
     }
 
-    qdev_prop_check_globals();
     if (vmstate_dump_file) {
         /* dump and exit */
         dump_vmstate_json_to_file(vmstate_dump_file);
-- 
2.26.2



