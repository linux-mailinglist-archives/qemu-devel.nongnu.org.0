Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D6C6EBCDB
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:21:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRCC-0001ua-9X; Sun, 23 Apr 2023 00:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRC7-0001uE-BI
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:24 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRC5-0000nx-TO
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:23 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1a69f686345so28309485ad.2
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223560; x=1684815560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3xDGlD2yRV3C0PkIp3jpH6p4fU6/buA90WdM6GaBzNs=;
 b=NerQFb+KpvyXoFBcY/rzahVogc7BydLxr3uQcltPH12miN52a0JO60oxMWy2gfkLYS
 EYd/pfbBwxAdw9RSOiKGPvcXkpnc8PnQ/V288juNEEGyZjVxD7Z+c4QpfHtIkW8DSG15
 vthAdaZgWNKj6bCQOLmVZY3/0T8B5ghD8qXDGflVYiKmAyAo2zHR87cLw6ZkY6qbwRP5
 Hg7cKeEssRbGiTdasYKBdxbGRx8SbiOyK0fNXm8sB1Jyvnk6Fp1C6NAIEtZH0CRCQNeZ
 AudutP/kHityZwjMO67SP0/IKsE7iZk+mbFKPbx/A3obLis1uTJ8iKrSQoSP20p9aipi
 Jb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223560; x=1684815560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3xDGlD2yRV3C0PkIp3jpH6p4fU6/buA90WdM6GaBzNs=;
 b=d+iAMPl2VzHVfp97c2Dep2rGc4fy3FjsGRp/jhKQWv8DeAIZDuQgWSWajheP2dZ9VK
 tcLPbnMLf+Uzj6gTC6iziP3vcVQkBqf2iIYaQ/+KqLlPzwh3qJTRyT8jfLfestmRIRmQ
 P24NYqH3Yq4x+7mT/TICncq/Ci3ILfVqdCSXoX2OfeFBfNMHBP4fWzAOwKRyijxKmVNh
 3DHILTyV+k/ITLuIRtar1KYn5lsxkzzljXTPw7HbhV1hCyZsCumjSFb0iXqS6S+eV467
 8qvzEFfXNuAyGSF5+sysho4uYb9gMotVSbN/pD9ieY1k5v924UnWBWMGGbWHiYjvcazY
 8yxQ==
X-Gm-Message-State: AAQBX9eHSi9a0eWgEbYyA0c1okxYamKjsMQZ+jWtAI+St9ZoSV2MWzbl
 WAQzmgUqRY7UpwCRnFy30HGOfA==
X-Google-Smtp-Source: AKy350Y3kkIcco5FPByHfblYWolCWlAFeIJG6SPHRXvPgbslyuqLip3lZuHxfgawWEGMq9R31VihQQ==
X-Received: by 2002:a17:902:ec81:b0:19d:20a:a219 with SMTP id
 x1-20020a170902ec8100b0019d020aa219mr12191007plg.66.1682223560524; 
 Sat, 22 Apr 2023 21:19:20 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:19:20 -0700 (PDT)
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
Subject: [PATCH v3 11/47] tests/avocado: Remove unused imports
Date: Sun, 23 Apr 2023 13:17:57 +0900
Message-Id: <20230423041833.5302-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62d.google.com
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


