Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E566522E4
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:43:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dp5-0000ho-QM; Tue, 20 Dec 2022 09:42:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dp3-0000hZ-Dw
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:42:25 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dp1-000249-VG
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:42:25 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso8965646wmp.3
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3ltdDVNMRfQYOwGftFFOip83WToobkKVVxx5n2k55dM=;
 b=h+uSyxWRFaFKK+6jS6RJU5THt8xil2cGMXaqTdij5FytPQ/KhmGov1WuHY34lwdEs4
 ZIMEuEjuhoZJjqhPcEeNcrKjq8KerZSIqLK0Zu3rgWlqvCX73cL9p/+FKv+GwxvyuNU1
 9y1ew/iIWSjzPUPbk3Xun4MQQdOm7+ptGqL/KeKPVi0OLY2BFa2BVH4gqeOg0QSysGPF
 putPyF1+m3DuK70aur53EwF5kfQX8w9MqMuMjOnaFgXpn2eBkmVWwb489gxfRsy1f8J9
 c0gJ9ItPgKymSTomq3nL5rw8IREOqR6WdUs//UERn7tvW0qaHcModev7JHAI2dD6AxVL
 AUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3ltdDVNMRfQYOwGftFFOip83WToobkKVVxx5n2k55dM=;
 b=Xgzf5qrN+8MrcG1d+rkwxNzVgO+Kwk+FD/KiuDvb2HuUdVPPKo8BjZF+hfQpwK/seb
 E9T5ojVgmp+UVUsBiLVSj32WSPPzV/J35u5x36HbmewjonDRz+wDNCW8e0odtNKwdoeO
 PTXAR6NxCdkPpkrDNbw/fQr5/srP+i9ZJJM3VmrLCdpRrOEWPwBcRunXUrs+jhTaIX/K
 71at3GYDMIPhqmzHIiEV+EoXAeDHyiJrb2WYc3NTVtt/TiroIXoQdIDPK8bHGqe6AfPf
 RdIcss00ow+CI6zcn1NzqO6OGHjBErE4r4UfAiw5riwKjVHDJI2IKj8uWzMThFgPK6vW
 NNPg==
X-Gm-Message-State: AFqh2kpMcY9GlOOLJBHinjIE3oannKwybAVP+IAVTMnPUqMeJ0Ks9Edr
 BTE82EI48J0Q6MZU/70qnoDSNzSYm1B/A83JdbU=
X-Google-Smtp-Source: AMrXdXvYqofHKcbPGqlVOSpUI5rQBPtmKnOS9tYmkTpD9y+lpvS0B5/rUYZF9aFdVE51KB33MTujQQ==
X-Received: by 2002:a05:600c:1da7:b0:3d5:365b:7749 with SMTP id
 p39-20020a05600c1da700b003d5365b7749mr1903087wms.16.1671547342158; 
 Tue, 20 Dec 2022 06:42:22 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c1c0600b003b4ff30e566sm3482899wms.3.2022.12.20.06.42.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:42:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] linux-user: Fix a pair of -Wextra warnings
Date: Tue, 20 Dec 2022 15:42:17 +0100
Message-Id: <20221220144219.25254-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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



Philippe Mathieu-Daudé (2):
  linux-user/syscall: Silent -Wmissing-field-initializers warnings
  linux-user/signal: Silent -Winitializer-overrides warnings

 linux-user/signal-common.h |  2 +-
 linux-user/syscall.c       | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.38.1


