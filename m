Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3F66EF251
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:42:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcXQ-0000Tu-TJ; Wed, 26 Apr 2023 06:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXG-000058-OX
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:07 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXF-0002yn-CF
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:06 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-63b64a32fd2so8911623b3a.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505484; x=1685097484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3xDGlD2yRV3C0PkIp3jpH6p4fU6/buA90WdM6GaBzNs=;
 b=lgqhn4iN03rUJkZwDFZkkGjNv26Fbtjs3m5FtWWodbuVS6NeGeb+j19y9XUuGQtLPc
 P7H0PlJf7f825VtzCBLtFPdCtvjp5ffG20OqOqcMBvOiKFlzJDU90D1YsEi/qsRq13Ji
 kyBoS+B8J+CkznBdNx7ScNw6CLM0s8RKCsyW2SoFNXSRevQ5B2ttXKVIWlcnvaVhXmMV
 B0YY72StsJsHVhoMBFlcU4Ag/JfJ1PcESn8ZixMdPx97xmDiDyRR/wmq+xT+sBsfRFpx
 J+a0WSJB/su2AibGJNA0fWAk0pZOcLOTXWz45rOT8z0M2QO99BtfsGPW+TTHuHYBx4e/
 ZNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505484; x=1685097484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3xDGlD2yRV3C0PkIp3jpH6p4fU6/buA90WdM6GaBzNs=;
 b=G11Fkh8711sZMJGbjVX6EIjiK1COev+l9Z28tGHTghTgkrSoJUQQ1oJd3uqcIkRBu4
 d7RnyRQBeDiDQPbyZrqlHRPXl/dOxUFRRn4bscOAzdvvLZQ3RONKHoJVVFlfx+Ny/EYc
 oVmzT8fvAD0XJ9087rhk6w1je0YZFqVRpnGVksn58aAu+SoRdosL5SsaASdnaXL2i3W2
 R2R4fEh2UvuHWCXNb7prQRSq7gkUwYhr1iizdXgwjirhAQlwuN095+BPH6Y2aEIQcAS8
 LXhmaMIOvsOYv0beJwoY0ZVPMh3QySSIEyszTaOWRoQjCblcSRqGMkI2TDCnx0Tx6L3S
 WNAA==
X-Gm-Message-State: AAQBX9cF5gmY6aXdl9LgiNJLGthsqz3i2FLJQagfxhP7WJwzcLHDelYn
 j3qQCVetS0kukLCYu3vebwLFeVi5gego8sB0lRE=
X-Google-Smtp-Source: AKy350Yt4urDFP8PwdFkhqEaEcWD0RdYG+XA/aHN7NJNCrlRKQ07JPzCw8Z5bxZL2ibiAtTuo05NkQ==
X-Received: by 2002:aa7:88c1:0:b0:63d:255f:36f4 with SMTP id
 k1-20020aa788c1000000b0063d255f36f4mr29145946pff.3.1682505484093; 
 Wed, 26 Apr 2023 03:38:04 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:38:03 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 11/48] tests/avocado: Remove unused imports
Date: Wed, 26 Apr 2023 19:36:39 +0900
Message-Id: <20230426103716.26279-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::436;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/avocado/netdev-ethtool.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/avocado/netdev-ethtool.py b/tests/avocado/netdev-ethtool.py
index f7e9464184..8de118e313 100644
--- a/tests/avocado/netdev-ethtool.py
+++ b/tests/avocado/netdev-ethtool.py
@@ -7,7 +7,6 @@
 
 from avocado import skip
 from avocado_qemu import QemuSystemTest
-from avocado_qemu import exec_command, exec_command_and_wait_for_pattern
 from avocado_qemu import wait_for_console_pattern
 
 class NetDevEthtool(QemuSystemTest):
-- 
2.40.0


