Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1369245712E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:51:08 +0100 (CET)
Received: from localhost ([::1]:57918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo5EJ-0000g7-1o
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:51:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mo59A-0002hi-8V
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:45:49 -0500
Received: from [2a00:1450:4864:20::52a] (port=39760
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mo597-0003aI-Bf
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:45:47 -0500
Received: by mail-ed1-x52a.google.com with SMTP id w1so43683096edc.6
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 06:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nTBeiSYtfqyKgwXrCNwHRY5u4tXc9JC5JK/7Z1LztnA=;
 b=H4jAPEjV3eRHVc8Ij5FgmqTqjjDNjH6ZJ+ypH1FCXYlcncGbrX63IiNx3v69d3CN2N
 L+hqRNoy2c44Bhn8fh6gU06eMGyQZUUqeM+KKSEOZC7LD5HKiqwyzEfDlJKVjxwtKICz
 BsAMFtLqEYql1TBmX9YmuDtXsTLTHakoUXJed9Jwq9RuOIBBCOKy3ffGj2s+/YUmZKFS
 z8qIEsbxiPdYPKgfNgOjkLb4yGejJo/hGYZruV3+zVHqGLDl7wSxxanb+ESTaqowGt4d
 87aznfwn94pV0jXXJCRdySjgvde4b57E6OGXuopxFfRu7FSGe7Lfi0HHTa9u7pDAfG+E
 p9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nTBeiSYtfqyKgwXrCNwHRY5u4tXc9JC5JK/7Z1LztnA=;
 b=ZuEnEJ6rDnhg94uZUfPpddQ+sqiKDuyAVRMMTeSUEfyrJjs6PmTc+udG+qusoR3bza
 D3V90n8+czuHEXLYhmxAiuU6CW/yMFXFOv213aV5kKkEgOxWDX+Vm9KOpQ4gMY89tVw9
 UNrD3L7ZkEWj9Nymf1URKZrYw9K7BYzUHrZ++CdKAxT2h5Kg7OlmWj/ZKyfrOq5E7Y4o
 KAGa6bZ2hYUNUTAwICz1kIb/l/uMYkOaFpkj+etbUdYRjvcST1jbzewGkmBuKI8WernS
 UNbVAFZDk1SSX7mh4IOoFDLHFnpDPJUBftSc8ZVI6DOCMZE5mph4d0PC0VAmDcCgvtWC
 01pg==
X-Gm-Message-State: AOAM5308zaHijntRCZ+Mq/QLLjcXtD9J63WgKo01Wv4REZEhAmu+N7kq
 F7E4TeAfRcymrnmflLf5btdb4aweSOY=
X-Google-Smtp-Source: ABdhPJwsom5Mzn6IMmeUwhBLyXxJ89rFG/DmemOKM2q2mX4djZ28Dhig7nUeySfE6ushY59zgQFjAg==
X-Received: by 2002:a17:906:4fc5:: with SMTP id
 i5mr8765415ejw.475.1637333143449; 
 Fri, 19 Nov 2021 06:45:43 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z25sm26934ejd.80.2021.11.19.06.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 06:45:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] qtest/am53c974-test: add test for reset before transfer
Date: Fri, 19 Nov 2021 15:45:36 +0100
Message-Id: <20211119144539.285740-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119144539.285740-1-pbonzini@redhat.com>
References: <20211119144539.285740-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Based upon the qtest reproducer posted to Gitlab issue #724 at
https://gitlab.com/qemu-project/qemu/-/issues/724.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211118100327.29061-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/am53c974-test.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/qtest/am53c974-test.c b/tests/qtest/am53c974-test.c
index 9b1e4211bd..d214a912b3 100644
--- a/tests/qtest/am53c974-test.c
+++ b/tests/qtest/am53c974-test.c
@@ -223,6 +223,34 @@ static void test_inflight_cancel_ok(void)
     qtest_quit(s);
 }
 
+static void test_reset_before_transfer_ok(void)
+{
+    QTestState *s = qtest_init(
+        "-device am53c974,id=scsi "
+        "-device scsi-hd,drive=disk0 -drive "
+        "id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outl(s, 0xc007, 0x2500);
+    qtest_outl(s, 0xc00a, 0x410000);
+    qtest_outl(s, 0xc00a, 0x410000);
+    qtest_outw(s, 0xc00b, 0x0200);
+    qtest_outw(s, 0xc040, 0x03);
+    qtest_outw(s, 0xc009, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc009, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc009, 0x00);
+    qtest_outw(s, 0xc003, 0x1000);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_outl(s, 0xc00b, 0x9000);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -248,6 +276,8 @@ int main(int argc, char **argv)
                        test_cancelled_request_ok);
         qtest_add_func("am53c974/test_inflight_cancel_ok",
                        test_inflight_cancel_ok);
+        qtest_add_func("am53c974/test_reset_before_transfer_ok",
+                       test_reset_before_transfer_ok);
     }
 
     return g_test_run();
-- 
2.33.1



