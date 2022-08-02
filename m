Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F42587AB1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:29:08 +0200 (CEST)
Received: from localhost ([::1]:59148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIp98-0000gx-O2
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIohM-00053O-CY
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:00:24 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIohF-0006DO-Sr
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:00:24 -0400
Received: by mail-wr1-x436.google.com with SMTP id m13so13247284wrq.6
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 03:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=g/o8m65biskhxapd/iISMtVnr5sb7Kumaq7aeEYhX/o=;
 b=FE2Ao+wjb6GPA5O7wRZp3M7kNFyPGOHF6bqGoRhTMopmkkbvxB0NLwpfUggyEzoC2D
 8b8T0fAjMHohk9l5a8NS3isgVN1n303Sim3crVbuukDMcQ19uI+1Hw5LZiwXwA+QHk82
 HeYKn+BtOQKTmrbYVhkoEuC9edXso69+cAeqbkK31YvSu8bTdX7tixAkDKfi6nIvx+IN
 +5cxmtqFnvQMzKFEdkXuwJ4vMzqeBSDfdQA8PK3MYTB0K/ohWj/OH1gDMoskStjKuXME
 roNu0oeZS/+/iAS9E8N4Qd0ql9fmGwps2hDRPm+oMRuCQ9o8ZSsuzpS4+MTOYIsf048Y
 Wpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=g/o8m65biskhxapd/iISMtVnr5sb7Kumaq7aeEYhX/o=;
 b=13oytQljbEZt4W3lSlvLwAgB5LMU+ZQON6alHEKR2eBtiJmIlepWxWvuyw0E8TNmqS
 0RM9dKFQo7xnK7QSDb25EVRipSDMrRwAthu+4VnbQxtnejCCnqAKoGjWjSeKtMq01uxa
 gudZfhD/dZRX2gYd9/+EAg8w+/O4Zg2+thPVru7QAjQcI/VXnlflFPta6JjZhveOLSRt
 Vy/pgFifmbq14PRDuK8m7xKvSiC42WSwe1HkMmkgnyPvzXX82Y5IEc1FWFdbbc/9IlCW
 ZXxx5NXzm/ptAVydNCxTjRJOnAXu8Zo0Fc0jlfGmlhWK2XivxRPqtUfXXVln+JQUBSO7
 1bjA==
X-Gm-Message-State: ACgBeo3fxs0TtAfdLivm4D47t/l3lh2UkLYMhaC1AUNLT0NHQ5GvBnIm
 V0AMAe59sn5qWHF2CxQ0FlsbSA==
X-Google-Smtp-Source: AA6agR6U1N2l/Q96zGtnuLL+cZeU/fJS4c9/QJL8dFuHjhh1ai18gGjyhWMbFaSZUFKUtxg3/QkwTQ==
X-Received: by 2002:a5d:634d:0:b0:220:5ff7:3969 with SMTP id
 b13-20020a5d634d000000b002205ff73969mr6642871wrw.709.1659434416540; 
 Tue, 02 Aug 2022 03:00:16 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c1d8800b003a2e655f2e6sm1290939wms.21.2022.08.02.03.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 03:00:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 650651FFCC;
 Tue,  2 Aug 2022 10:50:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 20/22] tests/qtest: implement stub for VHOST_USER_GET_CONFIG
Date: Tue,  2 Aug 2022 10:50:08 +0100
Message-Id: <20220802095010.3330793-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
index 4af031c971..61980bfc6a 100644
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


