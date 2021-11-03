Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66DB4444AF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:33:42 +0100 (CET)
Received: from localhost ([::1]:42678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIGj-0003Nk-PC
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHpS-0003eH-Rl
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:32 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:46680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHpO-00011b-1U
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:30 -0400
Received: by mail-lf1-x135.google.com with SMTP id o18so5709720lfu.13
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SxMMNDBEz7b0O+6ZdEnpdkz/xFDuHSYn2SqbysRD8oQ=;
 b=K8ABofkM+a3hU8s2ZCCn85YzKwISZhcYCIjWsz/fc8tzXMAQAEtMbirdeIfux/sojU
 HYob///r9LOO3eVd+ZMMxo0XiJqVoOCPJkcjINJG3Py3d/f4fEJNL2GRxQQ54S2UKb3r
 apdUldBSil/w16w4/fygJ+vvLH8Rr8fMonfrqbVrnC66mMbzppOStGy7WhMzgDUqZYXK
 OdCqxsgFTHqhwAVh57yfjzJTNhRwt4iKZWdPJryHgPXxkZ5Uc+VIZPxjXVfydhSUZnNt
 a57yLPrespMxZCUv27Vc8BUxN2CBOYWeOa2wLfa3ZZho1PP2Sr1f8NWYVLTae4Rc8R/+
 3sSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SxMMNDBEz7b0O+6ZdEnpdkz/xFDuHSYn2SqbysRD8oQ=;
 b=DCsklMSUsHLZJ+bPDH7ZlMX9etWKDzwR1mgayzJrhvpyTbAasc73SRjlh8CsQDnK+0
 ypARd1++XpQ1X0QsmW2bqK9V8HFlADvf5V88KpbLi+eeMsOZ6Qv1axgXyDQAQkhKsbfA
 gPoOhqW9N91q/HzCv37DXdZ5ES5FHertuGTzOcm3yq7fYSMKhQsG2XADgSG+35UMcEYr
 AMVpI86mjhNrQ9UM4zHogEPQuru/yYnub0R7ARoMIRSgmcvCJySH8reFPwNaxlApVyNs
 rwbwq5qP5mzSE9E5/fCusUz0ozzCYrvcvoF2n6z4V+y0ARX2+pgUuRozmTi9Kx5b71i3
 5TqA==
X-Gm-Message-State: AOAM530VTvg0ted59Y9NCBgI5ZMzVZWGtEs3UumdQL91L9Ej6cDezksL
 hmIgX60iMbkftiXnZMTDr8h/sPYEwNc=
X-Google-Smtp-Source: ABdhPJwcmEujQm5jHEy5Zkf1utdVFp/wieKdPPsG8ZtIh0YzFjK8afNeWF08jvo3KonSylvqwCFfjw==
X-Received: by 2002:a5d:584e:: with SMTP id i14mr17971557wrf.386.1635951906731; 
 Wed, 03 Nov 2021 08:05:06 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:05:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/27] qtest/am53c974-test: add test for cancelling in-flight
 requests
Date: Wed,  3 Nov 2021 16:04:35 +0100
Message-Id: <20211103150442.387121-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Based upon the qtest reproducer posted to Gitlab issue #663 at
https://gitlab.com/qemu-project/qemu/-/issues/663.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20211101183516.8455-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/am53c974-test.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/qtest/am53c974-test.c b/tests/qtest/am53c974-test.c
index d996866cd4..9b1e4211bd 100644
--- a/tests/qtest/am53c974-test.c
+++ b/tests/qtest/am53c974-test.c
@@ -189,6 +189,40 @@ static void test_cancelled_request_ok(void)
     qtest_quit(s);
 }
 
+static void test_inflight_cancel_ok(void)
+{
+    QTestState *s = qtest_init(
+        "-device am53c974,id=scsi "
+        "-device scsi-hd,drive=disk0 -drive "
+        "id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001000);
+    qtest_inw(s, 0xcfc);
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xffffffff);
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_inl(s, 0xcfc);
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc001);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_inw(s, 0xcfc);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x7);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_inw(s, 0xcfc);
+    qtest_inb(s, 0xc000);
+    qtest_outb(s, 0xc008, 0x8);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outb(s, 0xc009, 0x0);
+    qtest_outb(s, 0xc009, 0x0);
+    qtest_outw(s, 0xc00b, 0xc212);
+    qtest_outl(s, 0xc042, 0x2c2c5a88);
+    qtest_outw(s, 0xc00b, 0xc212);
+    qtest_outw(s, 0xc00b, 0x415a);
+    qtest_outl(s, 0xc03f, 0x3060303);
+    qtest_outl(s, 0xc00b, 0x5afa9054);
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -212,6 +246,8 @@ int main(int argc, char **argv)
                        test_fifo_underflow_on_write_ok);
         qtest_add_func("am53c974/test_cancelled_request_ok",
                        test_cancelled_request_ok);
+        qtest_add_func("am53c974/test_inflight_cancel_ok",
+                       test_inflight_cancel_ok);
     }
 
     return g_test_run();
-- 
2.31.1



