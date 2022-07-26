Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30634581AB7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:09:12 +0200 (CEST)
Received: from localhost ([::1]:42080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQrf-0005OX-8D
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQG4-0006Zb-JX
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:30:20 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQG1-0003ar-MJ
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:30:19 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q18so11061097wrx.8
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xlxq1ZBU6AcDaP18E14EH8M6boLy3BklV7N6rZI3qJs=;
 b=jVEZ6Irk8Wh2gVvq9LX+XUkphMQElCWlmKsJ/HVQuPtCdhI928/IDc+OCg7HyHVMyX
 qDJxTHRud0QAUVd1rwl0QLicifrbP4bQ7I0J/AyyMIYUoi8L/brqsmT7GbkVeP8pD2vz
 zXWwkFMJFdAq+yq7zF09j9kx3rtXLB8FSRn4EkhLqE8UEKKJ7P1YNql1zc5hfq8Bxz+0
 DCg0M2wx6Exo6sxuzKLzavG/gQtoZI9Gj0wucxCuMHIXoLbFDugIvgjxxn1At3tuMOOz
 c+tqkOkbN49RIT/Zb1d9e3EP2sOoDDlIf+NBsMLMzoDFlH1rcbhLVILeMLrvvYMhZdfY
 Cpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xlxq1ZBU6AcDaP18E14EH8M6boLy3BklV7N6rZI3qJs=;
 b=mlMgkPkeBgoZ2XbGQUaH5yGUjMlS0HHF33YP/nO9QivjyKxAc/VGaGmAXHeErfkkSt
 qfLV7nsS8ioztzH6ZAdx/nFRynqSRcuk7O/GbGD0wTWk/6OVuX/mwr0qZnyWR14rGb6x
 MFuiX+dxdEW2+kIv1Jjjw0a9BkGtIc6BrD6jLPCqA7gRXhTEe7Z/m/1qcbTgyycSVXCu
 3R/5Tk3Q7oBkb0xSYcD9NbMOKlv60EIeC9tQ0IMmgLNI3jx5vdMHMTG4iCnLIzgku5iQ
 yUL5iUYGenv2PDCNQ8aXmnzA0E+sjrnyRM8VKHWPW5p2Qc8dgPh8rpR3xrDJT0RtDILZ
 PqJg==
X-Gm-Message-State: AJIora/HrwrrBAXR0M9dSj8b10J8tItAtxXzOqBs3Zqf7Xdoc+pACl8U
 +JsaCz8cC346Pk8WtE5jOPs9pg==
X-Google-Smtp-Source: AGRyM1se2F8HaTBrPJbsrgtfD6902+CAb1kjyZdUyKf/ZYMdxdYERV/TpF9o5fip4XqQsduMxl/F2g==
X-Received: by 2002:a05:6000:1541:b0:21d:b298:96be with SMTP id
 1-20020a056000154100b0021db29896bemr11546897wry.206.1658863816126; 
 Tue, 26 Jul 2022 12:30:16 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c17-20020adffb51000000b0021d7fa77710sm15240057wrs.92.2022.07.26.12.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:30:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A864C1FFC8;
 Tue, 26 Jul 2022 20:21:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v3 16/21] tests/qtest: catch unhandled vhost-user messages
Date: Tue, 26 Jul 2022 20:21:45 +0100
Message-Id: <20220726192150.2435175-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

We don't need to action every message but lets document the ones we
are expecting to consume so future tests don't get confused about
unhandled bits.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v1
  - drop g_test_fail() when we get unexpected result, that just hangs
---
 tests/qtest/vhost-user-test.c | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 968113d591..d0fa034601 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -358,12 +358,41 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
         }
         break;
 
+    case VHOST_USER_SET_OWNER:
+        /*
+         * We don't need to do anything here, the remote is just
+         * letting us know it is in charge. Just log it.
+         */
+        qos_printf("set_owner: start of session\n");
+        break;
+
     case VHOST_USER_GET_PROTOCOL_FEATURES:
         if (s->vu_ops->get_protocol_features) {
             s->vu_ops->get_protocol_features(s, chr, &msg);
         }
         break;
 
+    case VHOST_USER_SET_PROTOCOL_FEATURES:
+        /*
+         * We did set VHOST_USER_F_PROTOCOL_FEATURES so its valid for
+         * the remote end to send this. There is no handshake reply so
+         * just log the details for debugging.
+         */
+        qos_printf("set_protocol_features: 0x%"PRIx64 "\n", msg.payload.u64);
+        break;
+
+        /*
+         * A real vhost-user backend would actually set the size and
+         * address of the vrings but we can simply report them.
+         */
+    case VHOST_USER_SET_VRING_NUM:
+        qos_printf("set_vring_num: %d/%d\n",
+                   msg.payload.state.index, msg.payload.state.num);
+        break;
+    case VHOST_USER_SET_VRING_ADDR:
+        qos_printf("set_vring_addr:\n");
+        break;
+
     case VHOST_USER_GET_VRING_BASE:
         /* send back vring base to qemu */
         msg.flags |= VHOST_USER_REPLY_MASK;
@@ -428,7 +457,18 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
         qemu_chr_fe_write_all(chr, p, VHOST_USER_HDR_SIZE + msg.size);
         break;
 
+    case VHOST_USER_SET_VRING_ENABLE:
+        /*
+         * Another case we ignore as we don't need to respond. With a
+         * fully functioning vhost-user we would enable/disable the
+         * vring monitoring.
+         */
+        qos_printf("set_vring(%d)=%s\n", msg.payload.state.index,
+                   msg.payload.state.num ? "enabled" : "disabled");
+        break;
+
     default:
+        qos_printf("vhost-user: un-handled message: %d\n", msg.request);
         break;
     }
 
-- 
2.30.2


