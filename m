Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E651581A68
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:42:32 +0200 (CEST)
Received: from localhost ([::1]:55228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQRr-0008Sl-8u
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ8H-0003Or-J5
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:18 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQ8F-0002PG-VR
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:22:17 -0400
Received: by mail-wr1-x429.google.com with SMTP id q18so11037760wrx.8
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hfKNVlrrL3u0vef+FWTAR3LbzLx2Gk+OTMM5YcoQN7Q=;
 b=CP7lN+TmZ3Pujh0mILQ2/noel6Xy+f6GVEdKkt7wPZTgcLy/3d+waBOSwnEauerGe6
 GTIb4KE6LeUH6OvLAHCy0fVRV7IpoaC9KaD+glw+HCFliTQxbMQg0jzOLRR9/95aZ3r0
 IxFp7nQuc0GqtVn3EuVklVS9wJtUhK6nmTvTbhPxhnDphkcrpFmDGE/CmOlvskhT7LAP
 HYt4hxlaYSVzFYeBux39dxQ5jz9MBSV7xv9HeGKEQKQvGN//IqlGthWESbN5kJVuvVgZ
 YbcQZaUAc97TozDJikyVxPRwbF3B2OWdkM8FjLFp7BsONr64zsCFSwxrbRDSq/0E/wmR
 LWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hfKNVlrrL3u0vef+FWTAR3LbzLx2Gk+OTMM5YcoQN7Q=;
 b=RZ0oEyPvpBlaAdlG+ddP9govW8pEHRFlmBhskcsU7tFdF6sP8eZcXLELkRCbsI5uA7
 01LIH7Lr2wbWhTW3qNscX6LoVfu1ETQNFsCKyQv7fRgayXhy3JMjXMUhI+hqx7rvxnk6
 0e+V4vSTS7xS5sYYZaPKNx7qVUE2WFrz8x8RExX/9NIhJ2J85XJ2MJxj/9+K9fnRxCwz
 8UMUBSwUacnNNdfTBJ8iDDrA4Jxujfxz3q6Rc7phVurDnVGjEqC+Q2RUYnC0oxH4X92Q
 EW8Tj135XEHJEo4OjahXOaeHSlerU1F/DzSP9t+QwSyg8ZMKUdxbeXNSatN38wCxYDOS
 tP4g==
X-Gm-Message-State: AJIora+bmsr5g90rxNmeK1LlPBJC+XZsYm0uawbDIgooECBOG2zTNlna
 hv6BQ17bXFL48Z4xWOR5nGZlCA==
X-Google-Smtp-Source: AGRyM1tK0EoYiSgvr3c6MnDpkS8VPb/mN7dezxP8RhaeszDkO5g6tbGO54aZ0dF/1N9gPF7cJEZXog==
X-Received: by 2002:a05:6000:1547:b0:21e:5be2:9ed3 with SMTP id
 7-20020a056000154700b0021e5be29ed3mr11929957wry.459.1658863334633; 
 Tue, 26 Jul 2022 12:22:14 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c1d9400b003a3561d4f3fsm9574115wms.43.2022.07.26.12.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:22:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E1F9F1FFCB;
 Tue, 26 Jul 2022 20:21:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 19/21] tests/qtest: implement stub for VHOST_USER_GET_CONFIG
Date: Tue, 26 Jul 2022 20:21:48 +0100
Message-Id: <20220726192150.2435175-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

We don't implement the full solution because frankly none of the tests
need to at the moment. We may end up re-implementing libvhostuser in
the end.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/vhost-user-test.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index db18e0b664..d546721f5d 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -79,6 +79,8 @@ typedef enum VhostUserRequest {
     VHOST_USER_SET_PROTOCOL_FEATURES = 16,
     VHOST_USER_GET_QUEUE_NUM = 17,
     VHOST_USER_SET_VRING_ENABLE = 18,
+    VHOST_USER_GET_CONFIG = 24,
+    VHOST_USER_SET_CONFIG = 25,
     VHOST_USER_MAX
 } VhostUserRequest;
 
@@ -372,6 +374,17 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
         }
         break;
 
+    case VHOST_USER_GET_CONFIG:
+        /*
+         * Treat GET_CONFIG as a NOP and just reply and let the guest
+         * consider we have updated its memory. Tests currently don't
+         * require working configs.
+         */
+        msg.flags |= VHOST_USER_REPLY_MASK;
+        p = (uint8_t *) &msg;
+        qemu_chr_fe_write_all(chr, p, VHOST_USER_HDR_SIZE + msg.size);
+        break;
+
     case VHOST_USER_SET_PROTOCOL_FEATURES:
         /*
          * We did set VHOST_USER_F_PROTOCOL_FEATURES so its valid for
-- 
2.30.2


