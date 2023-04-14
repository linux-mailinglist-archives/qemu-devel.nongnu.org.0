Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE97D6E2266
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:39:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHle-0000f9-LV; Fri, 14 Apr 2023 07:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHlU-0000H5-02
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:38:52 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHlR-0001Mk-Tv
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:38:51 -0400
Received: by mail-pl1-x631.google.com with SMTP id n17so2053414pln.8
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472328; x=1684064328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3xDGlD2yRV3C0PkIp3jpH6p4fU6/buA90WdM6GaBzNs=;
 b=MofIErUkDoexnlKNy5643ygMpbEw+Fguxxkxow0AgD9pEJrMyB4s+JR0JJw0S+4SO5
 wRQJ9aZpaAZdkUSrkCqOtUV1cWSV3dLPSXadcuZKG35XwU+zVJ/uGvLTuwhek4U+wdta
 9HNOvciVfMBih66r922gUTaxi4fp+3UD89I/K7nLuyWXq1P+NJl740DugOWMSY8nDFAu
 +I7RWjyA92tnmD3CPA2VYc4aTgymJiL+8X9n/00kOYL2/eCt4FTqmJf5766oStcyJ6yY
 KM6aXfXoRlSzge2Zhvhy+iTDAO9+K7zIuS2ZrbFlPZa1HU2ngPlfOJIRXQFImXRcIhuZ
 Lieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472328; x=1684064328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3xDGlD2yRV3C0PkIp3jpH6p4fU6/buA90WdM6GaBzNs=;
 b=YhSgCFZmqd+tv40EnsIWU6qcbhNaYODEpxLuOiu+Grurgn/LimsAgrDKTCy5eCc8mh
 wAJxYe7F2otQktyAOEFogfAJj7FCDmyJ1prhJvVz1yWlbwZM38UaadQ68j9/1NCPmNie
 vRo4HoAmarE1Vwq4lKzpwiNxFvfcV0LU1I3HiN7BM8wZyODS0zmxQL1waJfcjL9v6i/G
 SIA0/fav65i6UTKynquBbbuIYyczZi2aO9Tw8iZgIshsrQvcYXFesq1ndM7VCAFOaTZD
 gp4YFslJSUhbM8ssjB0Yg+NKynLvDKsvzLN1XomAipqMXkLBojzMxmI4Bm/ytBT/PAm4
 6YKQ==
X-Gm-Message-State: AAQBX9ce1JTc5hSx3hLuR0qdDFajBpgc83kmj6mb0BluhnwWN85Gj1q2
 APh156ZjOgGUuPvlrMXCqhCMuA==
X-Google-Smtp-Source: AKy350ZfuPJ8YZqTb9bFzNz4S8sovBW2JA9Ma9fYEEzmFJH9hRRWlfV7QoPWWYxJQDBXf6n9jw8Xbg==
X-Received: by 2002:a17:903:1107:b0:1a2:58f1:5e1d with SMTP id
 n7-20020a170903110700b001a258f15e1dmr2789519plh.36.1681472328616; 
 Fri, 14 Apr 2023 04:38:48 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:38:48 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 10/40] tests/avocado: Remove unused imports
Date: Fri, 14 Apr 2023 20:37:07 +0900
Message-Id: <20230414113737.62803-11-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
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


