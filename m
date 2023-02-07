Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD9868DE3F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 17:52:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRBo-0007Ii-QJ; Tue, 07 Feb 2023 11:51:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRBm-0007IU-Fe
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:51:26 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRBj-0002t5-7H
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:51:25 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso11969171wms.4
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 08:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bTDRw8pPH8I/N4/doxITMkRXq5b2552M6cX2Ua8rUU4=;
 b=tajfWfo+rKYAhsiZSlaM9bAfg+qo5HysoJ4yL2ctGg8+s/qVGCI/KNGSl+MHp88wTv
 JY6m5j3nJxr32SFbiPF4lzrCT9gI3HnkPieIe7eGoEZGgAiG5PFe64zpRS6KRasj5W8W
 tf1vceHV1Va+S5/k0FvXyZsRuO0R5XTPm8o3CFlEgLoT1uLIOfI9AgtlnX78o/sKcZ3C
 TdibLPD4haBGPB8U8pYHDmdVR2ADw1JLKr27y+1rj+81H6O3tPYf/t3Uggoi1PfKcR+c
 jhs0YyBLAmuj1tgZj5shOkeXDZh0cvBtFHD0PQl3hYkgYIyWFdjn17htB1ccgWoDe3Dp
 4moA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bTDRw8pPH8I/N4/doxITMkRXq5b2552M6cX2Ua8rUU4=;
 b=ug2F777B0nxXojT6C+gdYz0goBrLm4rTFDBqHIlRf71iWPVjZ3haFOsIjav+nyKrMQ
 fzZx0oXPGJ5HP933qdxm6cUOPw6984VTrEixpHRxHmx9yd4w8Guez0VllCPk77BR4In9
 8lCNGJr3eHt1vO+HKPQN8KbIJ7PdzXf0Ficb8KiU9VHK635fkeiXW8WVOZ+UFrXh5Vz9
 WQM2X39VEbGpQo2yd90jhHjQfzsHF5O9km7Sn1UIdcCpPt/Zoyerptg5FuCCW8t3AogR
 E2FWCaaDc/QuzQSBy5jWc0+yJho1vcVnRuBaqpio4wWExkoHF8XPKJ0A3/601D/6adm9
 qRDA==
X-Gm-Message-State: AO0yUKWqtiHjSleoyh7bk/aM8SPMOOVynxQ4e689fepqRjyu/ac4TvIg
 AJ5NT5HQSdwZukcOIaA6VOHHEonAY0TElau8
X-Google-Smtp-Source: AK7set8EjfOGpVWFJv8/Dnw0dE0mbNoQuNsS+77qoY2IF99UPHj31DLNZ5FE2uxRV9hrR2z8SDUHng==
X-Received: by 2002:a05:600c:1607:b0:3df:e21f:d705 with SMTP id
 m7-20020a05600c160700b003dfe21fd705mr4490378wmn.28.1675788681014; 
 Tue, 07 Feb 2023 08:51:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i6-20020adfdec6000000b002c3eaeb18cfsm4741657wrn.31.2023.02.07.08.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 08:51:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] tests/qtest/netdev-socket: Raise connection timeout to 60
 seconds
Date: Tue,  7 Feb 2023 16:51:19 +0000
Message-Id: <20230207165119.1479132-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The netdev-socket test intermittently fails on our s390x CI runner:

633/659 ERROR:../tests/qtest/netdev-socket.c:197:test_stream_unix:
assertion failed (resp == expect): ("st0: index=0,type=stream,connection error\r\n" == "st0: index=0,type=stream,unix:/tmp/netdev-socket.GZUG01/stream_unix\r\n")
ERROR
633/659 qemu:qtest+qtest-xtensa / qtest-xtensa/netdev-socket
ERROR           5.47s   killed by signal 6 SIGABRT

This may just be because when the machine is under heavy load
running the CI tests it hits the timeout before the QEMU
under test has started to the point of being able to respond
to HMP queries.

Bump the timeout to 60 seconds to see if the intermittent
goes away.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/netdev-socket.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
index 6ba256e1730..1d98dca821f 100644
--- a/tests/qtest/netdev-socket.c
+++ b/tests/qtest/netdev-socket.c
@@ -12,7 +12,7 @@
 #include "../unit/socket-helpers.h"
 #include "libqtest.h"
 
-#define CONNECTION_TIMEOUT    5
+#define CONNECTION_TIMEOUT    60
 
 #define EXPECT_STATE(q, e, t)                             \
 do {                                                      \
-- 
2.34.1


