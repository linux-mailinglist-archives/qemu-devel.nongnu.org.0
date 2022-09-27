Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6995EC3E9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:14:03 +0200 (CEST)
Received: from localhost ([::1]:35594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAPS-0006xT-Ag
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8SC-0003dz-JN
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:45 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:44718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8SA-0005Iv-HI
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:44 -0400
Received: by mail-pf1-x42b.google.com with SMTP id v186so9347067pfv.11
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=szrrAWQi57rwmVvkIAS0k/zzBtjmcZYK/YPRpaNr+UQ=;
 b=YQyXLzawnSLSYQILmjf5mHBwRWoSs8p40UrdsI+qzMeTMwOu3WfYNDF4ZyrRCoJBVi
 ri4thCv8VvUXhkRa3FmrIxKv+78CWB1MPSszqF18NLawvwDL2YJK4LFI0bL+rPDUQWy1
 aMqIJNmw0XSicEkPRggyw1BQqV1IHeznYd7tWBvc7YUraQy00mGqDNnM0ChkOBlMuv+V
 zTjQME2GYaa7cRh/w17vhzyquRzI2NFr3RQJpLLx6W2NTxuHBn9pP/AAp6+PJ8vaAn1X
 9NItBqAdnrZWfCMhlbzZaVq9gKiLMfATcBnmk5O5mHwfW/J9tJmJpRL9GDQ/ba4FA+nm
 kBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=szrrAWQi57rwmVvkIAS0k/zzBtjmcZYK/YPRpaNr+UQ=;
 b=AFMx1Q8ZiduV1jAM492bX4nkJa2/ZAGIUXYYANUH4StVnzLAlZnFsb9Gx4IM9EAYtn
 VBji2IpC2AMKs7ebQ6tEoDSdMLz9NEXi2wfY2XlcBLfIRZqd1W2To1GyGHvAg++VYal0
 eExii5crxnSmei9JWE20HyYcgDVVE9Z1kLgcmdCr495FHLPaPzEoHr3N3geIKLWV9wdO
 xF4EZyYHLClD1wdYP7dxQYtNsDnv3U+JHm5AuN3kZxuzSpsPVyW1XYeV4vYqJxz5Ngzx
 vxdV6wm9svUPjteXc7eG8StKNL5v0rYbDJigs9UOAV2XsNyq5IRbTsVimXXWaTfdDvCJ
 NyFw==
X-Gm-Message-State: ACrzQf1RXW8Mqok4JMxJLcHVUYc4jb9NLQCTA4Qz3M0exFqtalQxVMb/
 bQkZ2IX13hYYvVTDLEogGslv7xV3nPo=
X-Google-Smtp-Source: AMsMyM4IxIQjf5RziKhLX6WYKrhS0QCKCXzAWLvp6xePfq2thtnxkvep+eYYHl5EWPbj1t2E2iNF7w==
X-Received: by 2002:a05:6a02:43:b0:43c:dbdc:192d with SMTP id
 az3-20020a056a02004300b0043cdbdc192dmr5026287pgb.449.1664276920057; 
 Tue, 27 Sep 2022 04:08:40 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:39 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 44/54] tests/qtest: virtio-net-failover: Disable migration
 tests for win32
Date: Tue, 27 Sep 2022 19:06:22 +0800
Message-Id: <20220927110632.1973965-45-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

These tests use the exec migration protocol, which is unsupported
on Windows as of today. Disable these tests for now.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

 tests/qtest/virtio-net-failover.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index 443ee56de9..4a809590bf 100644
--- a/tests/qtest/virtio-net-failover.c
+++ b/tests/qtest/virtio-net-failover.c
@@ -588,6 +588,7 @@ static void test_hotplug_2_reverse(void)
     machine_stop(qts);
 }
 
+#ifndef _WIN32
 static QDict *migrate_status(QTestState *qts)
 {
     QDict *resp, *ret;
@@ -1827,6 +1828,7 @@ static void test_multi_in(gconstpointer opaque)
 
     machine_stop(qts);
 }
+#endif /* _WIN32 */
 
 int main(int argc, char **argv)
 {
@@ -1857,7 +1859,11 @@ int main(int argc, char **argv)
     qtest_add_func("failover-virtio-net/hotplug/2_reverse",
                    test_hotplug_2_reverse);
 
-    /* migration tests */
+#ifndef _WIN32
+    /*
+     * These migration tests cases use the exec migration protocol,
+     * which is unsupported on Windows.
+     */
     qtest_add_data_func("failover-virtio-net/migrate/on/out", tmpfile,
                         test_migrate_out);
     qtest_add_data_func("failover-virtio-net/migrate/on/in", tmpfile,
@@ -1886,6 +1892,7 @@ int main(int argc, char **argv)
                         tmpfile, test_multi_out);
     qtest_add_data_func("failover-virtio-net/migrate/multi/in",
                    tmpfile, test_multi_in);
+#endif /* _WIN32 */
 
     ret = g_test_run();
 
-- 
2.34.1


