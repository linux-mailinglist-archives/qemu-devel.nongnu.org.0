Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78F4621A55
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 18:22:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osSHK-0007oJ-It; Tue, 08 Nov 2022 12:20:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raemaerne@gmail.com>)
 id 1osS3n-0004az-JR; Tue, 08 Nov 2022 12:06:51 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raemaerne@gmail.com>)
 id 1osS3l-0005Xn-T3; Tue, 08 Nov 2022 12:06:51 -0500
Received: by mail-ed1-x52c.google.com with SMTP id l11so23485921edb.4;
 Tue, 08 Nov 2022 09:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Flge8Ohy8DnSU0Ntq6y5DHZu7Z4/01KBZiB/uRQo8BM=;
 b=ZupMD/2Hv0/hKgaJyHNu2QZuMj0VC5w5aiacXiHH9DpcTLd14xrkbaIBJpouIHqdt+
 3CRWfcKyr7M8zuWTu7ttOxK9EJgw1RdoALTJJOiKABvrCxN8jwwXrSM10S7GXXaf3+82
 5r5ddMVxyxEx99G2VL8IUy3jXTSCBIC8govg2FkpMogrn4Ma+5ZzVWKMfgZlnHwyHe9C
 fXBNVBMOFQsPWezJF3OuJziyPYrq9DFJ/sNjYAKJPt08xdgxcVC0EYjtTZ2ebq8SiscS
 9FJ4QdzRXO0H85yz4yDV4B/JkesAQql6XhnjX5EIQZ9G71GHneENdjRoGMhCBR9cHILa
 NMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Flge8Ohy8DnSU0Ntq6y5DHZu7Z4/01KBZiB/uRQo8BM=;
 b=1FW/pQxRayINUxl9T3Ge1HH+ES1Xl+RC2p/eEzdEHgmy1PVSxJwLzXzUci6eXyAGgy
 NNqJnH4QjlAkmJNC05iWgtb5raXKQovTfzYiKUv/FlXBDbhhjPnHOGYjX5ctUxLLq1UE
 HqURj+olLsb5IGJZjwm6sNpE29m8iDltQlpjJ7dVz+I2DoyIEI8Ag6HCFmZUSQ5T8qFO
 vSuJRicTUsGNoX42g1WNEdR3To+fZfOu5PTQt0xtxQVPGltGamrTF0gXjuOyn7ZESR7H
 Yy3xHpJsbZPbdVpKJ0+0M9g3q7Cj/G+N3A/eniEkmfdyQ5UaK+068/xua9mY1rJ269LH
 8hng==
X-Gm-Message-State: ACrzQf0ztZoh/cIidXAA5sLm8oO8TqHwN2rpR4QcA94PIDzMJ4uhLusH
 ARJFsf7SO+aXA3+Et7M9XQzhs3A9m7uJgA==
X-Google-Smtp-Source: AMsMyM595dYpRRyFCCXwHso75qmE/BiNURZUupjd2ShQVf1/dVszgnaWZphLKMvLad0jrj4hDXvXxw==
X-Received: by 2002:a50:d602:0:b0:463:a83b:6f89 with SMTP id
 x2-20020a50d602000000b00463a83b6f89mr41781860edi.366.1667927206804; 
 Tue, 08 Nov 2022 09:06:46 -0800 (PST)
Received: from DESKTOP-4ALA2DN.localdomain ([178.197.192.135])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a05640213c100b004614c591366sm5718682edx.48.2022.11.08.09.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 09:06:46 -0800 (PST)
From: Ramon Aerne <raemaerne@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, alistair@alistair23.me, kwolf@redhat.com,
 hreitz@redhat.com
Subject: [PATCH] block: m25p80: fix dummy byte count read from spansion cfg
 register
Date: Tue,  8 Nov 2022 18:06:39 +0100
Message-Id: <20221108170639.714-1-raemaerne@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=raemaerne@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 08 Nov 2022 12:20:48 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Spansion nor-flash stores the dummy read count in bits in a config register.
This is currently read and used as the byte count which is wrong.

This patch fixes this bit to byte conversion without warning about
unsupported configurations (such as bits % 8 != 0)

Signed-off-by: Ramon Aerne <raemaerne@gmail.com>
---
 hw/block/m25p80.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 02adc87..cf10b11 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -981,7 +981,7 @@ static void decode_fast_read_cmd(Flash *s)
         s->needed_bytes += extract32(s->spansion_cr2v,
                                     SPANSION_DUMMY_CLK_POS,
                                     SPANSION_DUMMY_CLK_LEN
-                                    );
+                                    ) / 8;
         break;
     case MAN_ISSI:
         /*
@@ -1017,7 +1017,7 @@ static void decode_dio_read_cmd(Flash *s)
         s->needed_bytes += extract32(s->spansion_cr2v,
                                     SPANSION_DUMMY_CLK_POS,
                                     SPANSION_DUMMY_CLK_LEN
-                                    );
+                                    ) / 8;
         break;
     case MAN_NUMONYX:
         s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
@@ -1067,7 +1067,7 @@ static void decode_qio_read_cmd(Flash *s)
         s->needed_bytes += extract32(s->spansion_cr2v,
                                     SPANSION_DUMMY_CLK_POS,
                                     SPANSION_DUMMY_CLK_LEN
-                                    );
+                                    ) / 8;
         break;
     case MAN_NUMONYX:
         s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
-- 
2.25.1


