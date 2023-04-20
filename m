Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D40A6E89B4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:49:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppN9n-00075A-BN; Thu, 20 Apr 2023 01:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9T-0006uO-MM
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:15 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9R-00015i-4E
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:15 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-52019617020so543618a12.3
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969692; x=1684561692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3xDGlD2yRV3C0PkIp3jpH6p4fU6/buA90WdM6GaBzNs=;
 b=BJrPSjFPNZZt07NINnBLvWs8FLATXpp4APpaNxDHBZiiYFHxoY5HS5aa8R6an6LdCG
 jcxl2a+3ndy9EQNYUMTcS7iNi8NtYDlrx5NIpWR/bXmOyp6PGcJuX6AJ07UMiVBUaSIR
 mhSHbNE6y2LT/enxa62K6FvS8SL8KkWNhloJlsEZdW2xWzcffnaFhIaQyJUtTxlRyJ4X
 tsg+BoYIr09icqBK/PzV74JzYlhTNIEoCrXNQeuaE78cVoF7yBg7KHB48TDZ/RJxq83h
 hduHTgqZel08h3YuxgCOXKkXxpgI3gR3L4R4vfw/LgKO2qSxky7Q1jUa0NY55R4ZKLQY
 1nxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969692; x=1684561692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3xDGlD2yRV3C0PkIp3jpH6p4fU6/buA90WdM6GaBzNs=;
 b=LrumhkPKN2IK0hB4/JuV0+kOYIj85udIY+vNvqPA6VkcWJJlXS4bggRRB9M0k/QqNi
 oLpWvwHfsT16GddMaZ7jAVNB7Htl9I769mU0x8S2rS66LDp2KDcvTKMPfi44ej69ZrzQ
 WsyGdY+e+4586J+WwZ26N7XDR48d4g5OT5QW8xRsXd1zUGkjOmMue61GnYBb1sSE+hed
 IvL3F+bayvtddkOlagmoa93/WMEJHiW3G9isHpktgwoNZ/Kzdz9C+3qELObZBlFdnx5T
 Sd6vCW8FKcEjMyergJVfIPzLmKkmwdGO0+PsGn/jv//+lkDpGFv9IO8Zmu/riUcrRBl0
 k+HQ==
X-Gm-Message-State: AAQBX9d7vylgjL8zN6NnYTDHrF1fsxLM761G1wTVPD1th8/fyGXMsxPH
 vaZNwj6jfok5VWO94uaFWoXOdA==
X-Google-Smtp-Source: AKy350bb8Knz7CftPNh0DCM/s9FA5gkh/D6+p9vDQbKTp5HsKkQDcG1DOoeHUlHQVUM71Y4KTLltwA==
X-Received: by 2002:a17:902:d48d:b0:1a6:6c58:d36e with SMTP id
 c13-20020a170902d48d00b001a66c58d36emr388316plg.66.1681969692485; 
 Wed, 19 Apr 2023 22:48:12 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:48:12 -0700 (PDT)
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
Subject: [PATCH v2 10/41] tests/avocado: Remove unused imports
Date: Thu, 20 Apr 2023 14:46:26 +0900
Message-Id: <20230420054657.50367-11-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52b.google.com
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


