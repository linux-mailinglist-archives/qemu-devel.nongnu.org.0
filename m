Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA1B5BE573
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 14:15:15 +0200 (CEST)
Received: from localhost ([::1]:47788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oac9i-0000yJ-0A
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 08:15:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYX-0000en-JS
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:45 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:40870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYV-0004nA-U5
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:45 -0400
Received: by mail-pf1-x429.google.com with SMTP id b75so2323925pfb.7
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=f2VB4QizdnO1ty3hsujAoxHREmmGa+f2YtqepO1IVRc=;
 b=Ng9Uohh1Nv2V4DYxZ4NokJ9UQExzCzR+nZkmGtYeS0nrdTx5PxiRQKPKgGf/nT2Vhg
 wfMUaJ4VjF459X1TjtlOywWpDmw7tFVa+H9IzCr3WhF9VXb84AJ0GGHG9H80T59cic+A
 FTtHDAZQovh+dyN00YMBwCz8myyfETPrmFB/iNRmQHBS8ZFQgiPEYeoOUug/hEyMDaTs
 xRjTtMQs0qq8OXB6GEkf3OrpcscabCNXqKtjUtiOzpn7mBIcuw/w2fOtJYtuS0elecjI
 28TdClVSwbRkNr3cEZEZuy2JbFRbTvH5lXgU6oviQf5He7WIrG/6NPKHuKEXMickAnbF
 XZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=f2VB4QizdnO1ty3hsujAoxHREmmGa+f2YtqepO1IVRc=;
 b=XuIaWyBBjxqtmTmsoX561CfJP2Zjbvq0DfZ2RV4JPKQ7mYkTOQGz9FdtE0Ad3mDPqk
 yz7HS0auGvvsrgONzBiPqYlQ3TEj3+JoMdT5zwUDoR/9n+U6HLJzKJz8/EyxkmPbohi3
 ZgxUH3Z3aRgWC2hs5/iczRmPxMzj59UcEh2cQcP/ZPE1IB4b4DN+Oyx1ksYqOZlrJpIi
 WEsnaSyU1Q+WHu5ROuxACsccXrHp/ORTikyG+MLbIlTXVb4Y2l/KbMWPBhRT8eKOSApd
 YCvWYqRySer+OM4leFlx6FjgjneXrGriWKp/EkTaElGfutG7giLxblGXePv+voOWShsp
 KgHg==
X-Gm-Message-State: ACrzQf2B1imwlhGIXuFgTNI0aSBXlThawZzAxzdTs1pHsaZ0H5UWOuQm
 7ZCjbt2MYookkYfingLSwWjK55yzpzs=
X-Google-Smtp-Source: AMsMyM66QAW/4Larv0SGFfxs0M6Ya7wd9DkpjlCx8OHkWFl5CKjn/bfeIcegOHnH3hknIV+t+Cbv2g==
X-Received: by 2002:aa7:88d0:0:b0:542:d98d:bf1f with SMTP id
 k16-20020aa788d0000000b00542d98dbf1fmr22819961pff.78.1663669963104; 
 Tue, 20 Sep 2022 03:32:43 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:32:42 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 11/39] tests/qtest: Skip running virtio-net-test cases that
 require socketpair() for win32
Date: Tue, 20 Sep 2022 18:31:31 +0800
Message-Id: <20220920103159.1865256-12-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x429.google.com
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

From: Bin Meng <bin.meng@windriver.com>

Some of the virtio-net-test test cases require socketpair() to do the
test setup. Skip them for win32.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

Changes in v2:
- Change to skip only part of the virtio-net-test cases that require
  socketpair() intead of disabling all of them

 tests/qtest/virtio-net-test.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/virtio-net-test.c b/tests/qtest/virtio-net-test.c
index 6ded252901..dff43f0f60 100644
--- a/tests/qtest/virtio-net-test.c
+++ b/tests/qtest/virtio-net-test.c
@@ -165,8 +165,6 @@ static void stop_cont_test(void *obj, void *data, QGuestAllocator *t_alloc)
     rx_stop_cont_test(dev, t_alloc, rx, sv[0]);
 }
 
-#endif
-
 static void hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtioPCIDevice *dev = obj;
@@ -286,6 +284,8 @@ static void *virtio_net_test_setup(GString *cmd_line, void *arg)
     return sv;
 }
 
+#endif /* _WIN32 */
+
 static void large_tx(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtioNet *dev = obj;
@@ -319,16 +319,15 @@ static void *virtio_net_test_setup_nosocket(GString *cmd_line, void *arg)
 
 static void register_virtio_net_test(void)
 {
-    QOSGraphTestOptions opts = {
-        .before = virtio_net_test_setup,
-    };
+    QOSGraphTestOptions opts = { 0 };
 
-    qos_add_test("hotplug", "virtio-net-pci", hotplug, &opts);
 #ifndef _WIN32
+    opts.before = virtio_net_test_setup;
+    qos_add_test("hotplug", "virtio-net-pci", hotplug, &opts);
     qos_add_test("basic", "virtio-net", send_recv_test, &opts);
     qos_add_test("rx_stop_cont", "virtio-net", stop_cont_test, &opts);
-#endif
     qos_add_test("announce-self", "virtio-net", announce_self, &opts);
+#endif
 
     /* These tests do not need a loopback backend.  */
     opts.before = virtio_net_test_setup_nosocket;
-- 
2.34.1


