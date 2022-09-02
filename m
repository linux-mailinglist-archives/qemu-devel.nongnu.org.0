Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBE65AB1D2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 15:42:09 +0200 (CEST)
Received: from localhost ([::1]:49846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU6vv-0003xq-Lh
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 09:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1oU6t5-0000bG-Lx
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:39:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1oU6t2-0001IV-Ey
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 09:39:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662125944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qzZO0WLa0J2LtrErrcClV706t+0XD8dT618a9/exaWU=;
 b=CJYByjPQ9CzFBHOA9vnfGyFk0eCPTOn9JVfQQG4P1K9TmZnKTOSU5wOddPyRSyJJBEcj1G
 P868TMRGZnSDwTaTt/tRchrOyazE/+eo/72hA6SZ/RQmqJC7txcCriPdfREXEVPWyforcK
 LW5U8CBtXxFUxo8CY+qxv6ZFgaTlCmM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-DFH84jm1NhOrv4ACWru4fw-1; Fri, 02 Sep 2022 09:39:01 -0400
X-MC-Unique: DFH84jm1NhOrv4ACWru4fw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CD1D2919EBB;
 Fri,  2 Sep 2022 13:39:01 +0000 (UTC)
Received: from f36-work.redhat.com (unknown [10.39.194.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 833331121314;
 Fri,  2 Sep 2022 13:39:00 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Cc: mcascell@redhat.com, pbonzini@redhat.com, bmeng.cn@gmail.com, alxndr@bu.edu
Subject: [PATCH] qtest/fuzz-lsi53c895a-test: set guest RAM to 2G
Date: Fri,  2 Sep 2022 15:38:53 +0200
Message-Id: <20220902133853.834065-1-mcascell@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

test_lsi_do_msgout_cancel_req does not run on machines with small size
memory. Reduce guest memory from 4G to 2G to alleviate the problem.

Reported-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
---
 tests/qtest/fuzz-lsi53c895a-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
index b23d3ecf45..434c16bf42 100644
--- a/tests/qtest/fuzz-lsi53c895a-test.c
+++ b/tests/qtest/fuzz-lsi53c895a-test.c
@@ -21,7 +21,7 @@ static void test_lsi_do_msgout_cancel_req(void)
         return;
     }
 
-    s = qtest_init("-M q35 -m 4G -display none -nodefaults "
+    s = qtest_init("-M q35 -m 2G -display none -nodefaults "
                    "-device lsi53c895a,id=scsi "
                    "-device scsi-hd,drive=disk0 "
                    "-drive file=null-co://,id=disk0,if=none,format=raw");
-- 
2.37.2


