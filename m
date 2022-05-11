Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89315523BF1
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 19:53:41 +0200 (CEST)
Received: from localhost ([::1]:53818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noqWq-0003QD-Du
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 13:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1noqUP-0001Aw-M9
 for qemu-devel@nongnu.org; Wed, 11 May 2022 13:51:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1noqUK-0004bD-KE
 for qemu-devel@nongnu.org; Wed, 11 May 2022 13:51:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652291461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BlEAodg4zF4sD8i9lvHVsT1B44n8s2aq0JCNm2QmXiY=;
 b=DOY/CHCG4kRpm+GyM/pIyyGl70jH4jdnM1lUVPu4D723OcM17v5SycDS2uYKqwIqX9sMkv
 fWd9VBKKxbH925NTH/vWyg4w3qtNNvLg+ZqZzYZJHpW48J0S8I4PGD9G+gsgSaymSCQcWm
 LEZwDVSGuy4bPLn55oeaBBo8O9pTwRo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-NdWT5yHON6Gm6-GWBJu7DQ-1; Wed, 11 May 2022 13:50:44 -0400
X-MC-Unique: NdWT5yHON6Gm6-GWBJu7DQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69794101AA42
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 17:50:44 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57069C28106
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 17:50:44 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qapi: make machine type deprecation a warning
Date: Wed, 11 May 2022 13:50:43 -0400
Message-Id: <20220511175043.27327-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index c2919579fd..fbef0f5c5f 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3723,7 +3723,7 @@ void qemu_init(int argc, char **argv, char **envp)
 
     machine_class = MACHINE_GET_CLASS(current_machine);
     if (!qtest_enabled() && machine_class->deprecation_reason) {
-        error_report("Machine type '%s' is deprecated: %s",
+        warn_report("Machine type '%s' is deprecated: %s",
                      machine_class->name, machine_class->deprecation_reason);
     }
 
-- 
2.31.1


