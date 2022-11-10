Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741256241B3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 12:46:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot60S-00043r-Mp; Thu, 10 Nov 2022 06:46:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot60Q-00043Y-Si
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:46:02 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot60P-0000eG-6q
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:46:02 -0500
Received: by mail-pl1-x62f.google.com with SMTP id b21so1196044plc.9
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 03:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tq72i2Nbv4DVNs9FlePvOYYZf5aKHl0IE47tyW0Emp0=;
 b=Cag/58TobVI+8s9U95/F0pwd8M8VkoRIDmhtqVQyBSdTn2I8vdYZRBI2WOTTmWcAvj
 oH/qHcQIvkS6LyupuVJ1o7REHO5JC22tNUnhA1TOaq/iQ+OaCZpCVWTERGC7KA5yJ1Y0
 e9CuATVrrz0lr8UK7HlWil0VFrDVDexNDNKR9tVs+I800gpUHXEbdOrvWopgxNAFVpPK
 n0SmcEjI/H4zl8eE7YP2jZqrtevwkAJyJqepF28IlQfCOEnyKg/4y7jrDVJE0B9LbQBb
 XE313zC9EII3J+sKMgjFovlq+mHxl64PPlEmKQWTc+Ap5ayzauRQ15vrtWLfEP9PA/dU
 lqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tq72i2Nbv4DVNs9FlePvOYYZf5aKHl0IE47tyW0Emp0=;
 b=OD6d0gERqFVmWi8lTfjitKrxeOjClt5NTdHotvWC8zjiG/cNo3+dOAREDszkP+0X2P
 LPJEwxrU0oIAo+xjzvH6dbUuI9ChrBg26vmmcUwO3ZqSqeWRE0yT/AP/zQ8mOkGSyY0F
 nSKSSlzDXmJTVBAlwd9dT2HPecf3R9edqLAzGJwL0kv0gf6ZFm5B+cOwru5y4XxH4MbK
 8S/bl0vLfX8vwq84XqNZkaqc23PTC/XPanX9aXTCyUpOaUOe4Z5rt+ohhJTs4ccOyt6U
 1KMH876xFjGiJ2wP1OAJZ2uK13jt71hlih0nxUpzaD/s+ViYbv4xzLjCfOLwM9bqTcE9
 x56Q==
X-Gm-Message-State: ACrzQf12e17cXizptmpnep5GaDdAE+E5ETa0gZ/4XZOMiEridQ/1XBz3
 VDDTsTZonQcNzumcuDrL8WMMb+861ke+TE9N
X-Google-Smtp-Source: AMsMyM6a2EX84mIUcEnD0aBliqihmAEp9skKIBtoL8xtIq7Rft4dWzH+C4daBLY8x1j8bmc1zILogA==
X-Received: by 2002:a17:903:2283:b0:187:21f6:fde2 with SMTP id
 b3-20020a170903228300b0018721f6fde2mr54866048plh.49.1668080759446; 
 Thu, 10 Nov 2022 03:45:59 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a625e41000000b0056b88187374sm9947912pfb.85.2022.11.10.03.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 03:45:59 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] tests/qtest/libqos/e1000e: Correctly group register accesses
Date: Thu, 10 Nov 2022 20:45:49 +0900
Message-Id: <20221110114549.66081-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Add a newline after E1000_TCTL write and make it clear that E1000_TCTL
write is what enabling transmit.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/qtest/libqos/e1000e.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
index 80b3e3db90..0e5cceafe4 100644
--- a/tests/qtest/libqos/e1000e.c
+++ b/tests/qtest/libqos/e1000e.c
@@ -152,6 +152,7 @@ static void e1000e_pci_start_hw(QOSGraphObject *obj)
 
     /* Enable transmit */
     e1000e_macreg_write(&d->e1000e, E1000_TCTL, E1000_TCTL_EN);
+
     e1000e_macreg_write(&d->e1000e, E1000_RDBAL,
                            (uint32_t)d->e1000e.rx_ring);
     e1000e_macreg_write(&d->e1000e, E1000_RDBAH,
-- 
2.38.1


