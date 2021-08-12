Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0063EAAA1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 21:06:57 +0200 (CEST)
Received: from localhost ([::1]:36058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEG2a-0000tn-Dh
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 15:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mEG0K-0007uW-1s
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 15:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mEG0H-0007ti-3d
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 15:04:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628795072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=smGUjkKx9T/iZn+P2rjBzPPvE7uC18plC0NwIPGsy54=;
 b=GZjJyEYHT4Bz+X+NHAU0P7MIJY9sj+1LxYMp2F2A56P3ndLx6LcrPOGY19UB706RPRKb4U
 lZRAm2DiucpkyqJam2LK7SqTAIkd7AUiLvRrUMOl6CsVMKujZ3NQl3YRHUzk0gx7vXVmzX
 03FQsh2+LTqYSgNR9tKGZoK1sDoVO9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-THcKj2yIMBem4n-SYHXGBQ-1; Thu, 12 Aug 2021 15:04:31 -0400
X-MC-Unique: THcKj2yIMBem4n-SYHXGBQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1053824F8C;
 Thu, 12 Aug 2021 19:04:29 +0000 (UTC)
Received: from localhost (unknown [10.22.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC17110013C1;
 Thu, 12 Aug 2021 19:04:29 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/1] hw/core: fix error checkig in smp_parse
Date: Thu, 12 Aug 2021 15:04:28 -0400
Message-Id: <20210812190428.1352870-2-ehabkost@redhat.com>
In-Reply-To: <20210812190428.1352870-1-ehabkost@redhat.com>
References: <20210812190428.1352870-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The machine_set_smp() mistakenly checks 'errp' not '*errp',
and so thinks there is an error every single time it runs.
This causes it to jump to the end of the method, skipping
the max CPUs checks. The caller meanwhile sees no error
and so carries on execution. The result of all this is:

 $ qemu-system-x86_64 -smp -1
 qemu-system-x86_64: GLib: ../glib/gmem.c:142: failed to allocate 481036337048 bytes

instead of

 $ qemu-system-x86_64 -smp -1
 qemu-system-x86_64: Invalid SMP CPUs -1. The max CPUs supported by machine 'pc-i440fx-6.1' is 255

This is a regression from

  commit fe68090e8fbd6e831aaf3fc3bb0459c5cccf14cf
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu May 13 09:03:48 2021 -0400

    machine: add smp compound property

Closes: https://gitlab.com/qemu-project/qemu/-/issues/524
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210812175353.4128471-1-berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 943974d411c..ab4fca6546a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -832,7 +832,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
     }
 
     mc->smp_parse(ms, config, errp);
-    if (errp) {
+    if (*errp) {
         goto out_free;
     }
 
-- 
2.31.1


