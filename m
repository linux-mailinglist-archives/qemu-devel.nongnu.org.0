Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32E8573693
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 14:49:13 +0200 (CEST)
Received: from localhost ([::1]:59842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBbnk-0001KT-F9
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 08:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBbix-00066g-AZ
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 08:44:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBbin-0004qp-Nx
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 08:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657716241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DxGCthRluiv+YDaJS5S29J1/Da58hANkB65rXvlXjN4=;
 b=PvZe+K33EvcmkuxwNndTEcKN7yCiy+h/aBsMX3zyW1LdzDouPqhOg8M+I7Q3yS65mJmMqp
 J3/m0iSOnSV8wGUewAlTXQytVQqaq0UJ5six5BrS9FxHRmQ/oC+HNse4mefR5/6/XNgwpL
 vGbwrFPE70dvx5yjLWFP4czL9TTsZG0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-duXRFiFBMcijSiKYOQi2-Q-1; Wed, 13 Jul 2022 08:44:00 -0400
X-MC-Unique: duXRFiFBMcijSiKYOQi2-Q-1
Received: by mail-ej1-f69.google.com with SMTP id
 qw8-20020a1709066a0800b0072abb95c0caso3390567ejc.15
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 05:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DxGCthRluiv+YDaJS5S29J1/Da58hANkB65rXvlXjN4=;
 b=zfemS1f67e1nYPy1byPL0IWxvfodME/vHfPUfyqKg044skKEhdckObPUUZWYyhDtdJ
 AjS4409pHWTiIesA526XRis4tJwUaNCwiM1sYeQPdWe1nOQvqoWLIVKguK3MeyXvRL1S
 w3PYahRvpij0LNLCtM1d16WjDk3Y12ZFyhNgDacGMlc51y1A8nIETg8q7R2P76uGFRyU
 NvPJ27zs6BrnB9zfi+GwHFWTGBs5BT/KDCIhoIU5UR7hWIQgLr6C+fq/6v88cZcHPE9j
 4/Kqw//cOvHas4V+SHvLBpJ/bk0ug4F0RLG5O01q+ThSWBgm8vz9SP0IDE1sNZy19PBb
 c4uA==
X-Gm-Message-State: AJIora9DFiQaOJ2l96GJzJIdUXqH/4UXnCTXhs8LnmVCX9ZJ487QNKuw
 R48qGgoiwB8pF7srEHAtZY1I3t4tLGtl5eDRGIR8We665HGl7vf7TC7tluAF107d3kdT1CDuFAr
 Xbhui6lwXKVIdnX/xomOIFjpZ/6lJXJL/7aryWLLmFRZqlQkhTGEg20wODsF+RFAz/Ak=
X-Received: by 2002:a17:906:9be4:b0:72b:cf9:99d8 with SMTP id
 de36-20020a1709069be400b0072b0cf999d8mr3067453ejc.747.1657716239267; 
 Wed, 13 Jul 2022 05:43:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tNaXvNKybRqAno0ISKD7J+xxGb5c5dJIAoTaN0BrzGC83RWmuHVkU9WkGXQDO5P8d2poZlzA==
X-Received: by 2002:a17:906:9be4:b0:72b:cf9:99d8 with SMTP id
 de36-20020a1709069be400b0072b0cf999d8mr3067425ejc.747.1657716238920; 
 Wed, 13 Jul 2022 05:43:58 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 k5-20020a17090632c500b0072aa014e852sm4942324ejk.87.2022.07.13.05.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 05:43:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
Subject: [PATCH] scsi/lsi53c895a: really fix use-after-free in lsi_do_msgout
 (CVE-2022-0216)
Date: Wed, 13 Jul 2022 14:43:57 +0200
Message-Id: <20220713124357.247817-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Mauro Matteo Cascella <mcascell@redhat.com>

Set current_req to NULL, not current_req->req, to prevent reusing a free'd
buffer in case of repeated SCSI cancel requests.  Also apply the fix to
CLEAR QUEUE and BUS DEVICE RESET messages as well, since they also cancel
the request.

Thanks to Alexander Bulekov for providing a reproducer.

Fixes: CVE-2022-0216
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20220711123316.421279-1-mcascell@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
        Adjust the patch from v1 to v2 since the changes crossed
        with the pull request.

 hw/scsi/lsi53c895a.c               |  3 +-
 tests/qtest/fuzz-lsi53c895a-test.c | 71 ++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 99ea42d49b..ad5f5e5f39 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -1030,7 +1030,7 @@ static void lsi_do_msgout(LSIState *s)
             trace_lsi_do_msgout_abort(current_tag);
             if (current_req && current_req->req) {
                 scsi_req_cancel(current_req->req);
-                current_req->req = NULL;
+                current_req = NULL;
             }
             lsi_disconnect(s);
             break;
@@ -1056,6 +1056,7 @@ static void lsi_do_msgout(LSIState *s)
             /* clear the current I/O process */
             if (s->current) {
                 scsi_req_cancel(s->current->req);
+                current_req = NULL;
             }
 
             /* As the current implemented devices scsi_disk and scsi_generic
diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
index 2e8e67859e..6872c70d3a 100644
--- a/tests/qtest/fuzz-lsi53c895a-test.c
+++ b/tests/qtest/fuzz-lsi53c895a-test.c
@@ -8,6 +8,74 @@
 #include "qemu/osdep.h"
 #include "libqtest.h"
 
+/*
+ * This used to trigger a UAF in lsi_do_msgout()
+ * https://gitlab.com/qemu-project/qemu/-/issues/972
+ */
+static void test_lsi_do_msgout_cancel_req(void)
+{
+    QTestState *s;
+
+    s = qtest_init("-M q35 -m 4G -display none -nodefaults "
+                   "-device lsi53c895a,id=scsi "
+                   "-device scsi-hd,drive=disk0 "
+                   "-drive file=null-co://,id=disk0,if=none,format=raw");
+
+    qtest_outl(s, 0xcf8, 0x80000810);
+    qtest_outl(s, 0xcf8, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80000810);
+    qtest_outw(s, 0xcfc, 0x7);
+    qtest_outl(s, 0xcf8, 0x80000810);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80000804);
+    qtest_outw(s, 0xcfc, 0x05);
+    qtest_writeb(s, 0x69736c10, 0x08);
+    qtest_writeb(s, 0x69736c13, 0x58);
+    qtest_writeb(s, 0x69736c1a, 0x01);
+    qtest_writeb(s, 0x69736c1b, 0x06);
+    qtest_writeb(s, 0x69736c22, 0x01);
+    qtest_writeb(s, 0x69736c23, 0x07);
+    qtest_writeb(s, 0x69736c2b, 0x02);
+    qtest_writeb(s, 0x69736c48, 0x08);
+    qtest_writeb(s, 0x69736c4b, 0x58);
+    qtest_writeb(s, 0x69736c52, 0x04);
+    qtest_writeb(s, 0x69736c53, 0x06);
+    qtest_writeb(s, 0x69736c5b, 0x02);
+    qtest_outl(s, 0xc02d, 0x697300);
+    qtest_writeb(s, 0x5a554662, 0x01);
+    qtest_writeb(s, 0x5a554663, 0x07);
+    qtest_writeb(s, 0x5a55466a, 0x10);
+    qtest_writeb(s, 0x5a55466b, 0x22);
+    qtest_writeb(s, 0x5a55466c, 0x5a);
+    qtest_writeb(s, 0x5a55466d, 0x5a);
+    qtest_writeb(s, 0x5a55466e, 0x34);
+    qtest_writeb(s, 0x5a55466f, 0x5a);
+    qtest_writeb(s, 0x5a345a5a, 0x77);
+    qtest_writeb(s, 0x5a345a5b, 0x55);
+    qtest_writeb(s, 0x5a345a5c, 0x51);
+    qtest_writeb(s, 0x5a345a5d, 0x27);
+    qtest_writeb(s, 0x27515577, 0x41);
+    qtest_outl(s, 0xc02d, 0x5a5500);
+    qtest_writeb(s, 0x364001d0, 0x08);
+    qtest_writeb(s, 0x364001d3, 0x58);
+    qtest_writeb(s, 0x364001da, 0x01);
+    qtest_writeb(s, 0x364001db, 0x26);
+    qtest_writeb(s, 0x364001dc, 0x0d);
+    qtest_writeb(s, 0x364001dd, 0xae);
+    qtest_writeb(s, 0x364001de, 0x41);
+    qtest_writeb(s, 0x364001df, 0x5a);
+    qtest_writeb(s, 0x5a41ae0d, 0xf8);
+    qtest_writeb(s, 0x5a41ae0e, 0x36);
+    qtest_writeb(s, 0x5a41ae0f, 0xd7);
+    qtest_writeb(s, 0x5a41ae10, 0x36);
+    qtest_writeb(s, 0x36d736f8, 0x0c);
+    qtest_writeb(s, 0x36d736f9, 0x80);
+    qtest_writeb(s, 0x36d736fa, 0x0d);
+    qtest_outl(s, 0xc02d, 0x364000);
+
+    qtest_quit(s);
+}
+
 /*
  * This used to trigger the assert in lsi_do_dma()
  * https://bugs.launchpad.net/qemu/+bug/697510
@@ -44,5 +112,8 @@ int main(int argc, char **argv)
     qtest_add_func("fuzz/lsi53c895a/lsi_do_dma_empty_queue",
                    test_lsi_do_dma_empty_queue);
 
+    qtest_add_func("fuzz/lsi53c895a/lsi_do_msgout_cancel_req",
+                   test_lsi_do_msgout_cancel_req);
+
     return g_test_run();
 }
-- 
2.36.1


