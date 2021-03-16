Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C780F33E07F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:29:20 +0100 (CET)
Received: from localhost ([::1]:50270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHFf-0006MS-T8
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2h-0005bM-0z
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2Z-0003WD-VE
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615929346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsQmMQn5LFiLfMBjSa+rg3JtmLRKpZoqTR15fTvhYD4=;
 b=CGMz4T973ft6xxmyWx9iaLHDDwOoU7lmdpxoc86ozdTtZ/4thPwUK4Ko6IYnKB5+JPxLw5
 15nLHuAkYX2bAcfJL63tbeq6Za85btRv0/D8Na8YLAYWw7iqL+MIJG0bzGuUKoqeznUNSh
 rplSpuDIwUPp2RLj4bjO/KfZAL0jZoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-KjQCME-HOyig9B2dPDOxkg-1; Tue, 16 Mar 2021 17:15:42 -0400
X-MC-Unique: KjQCME-HOyig9B2dPDOxkg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53127100C618;
 Tue, 16 Mar 2021 21:15:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 030BD1378D;
 Tue, 16 Mar 2021 21:15:40 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/16] fuzz: add a am53c974 generic-fuzzer config
Date: Tue, 16 Mar 2021 17:15:23 -0400
Message-Id: <20210316211531.1649909-9-pbonzini@redhat.com>
In-Reply-To: <20210316211531.1649909-1-pbonzini@redhat.com>
References: <20210316211531.1649909-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 2454c627ff..8b8c7ac553 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -208,6 +208,12 @@ const generic_fuzz_config predefined_configs[] = {
         .args = "-machine q35 -nodefaults -device megasas -device scsi-cd,drive=null0 "
         "-blockdev driver=null-co,read-zeroes=on,node-name=null0",
         .objects = "megasas*",
+    },{
+        .name = "am53c974",
+        .args = "-device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+                 "-drive id=disk0,if=none,file=null-co://,format=raw "
+                 "-nodefaults",
+        .objects = "*esp* *scsi* *am53c974*",
     },{
         .name = "ac97",
         .args = "-machine q35 -nodefaults "
-- 
2.26.2



