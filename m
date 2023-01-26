Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0D267C930
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 11:53:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKzou-0006CM-4P; Thu, 26 Jan 2023 05:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKzo9-0004eV-73
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:48:44 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKzo7-0005j5-RP
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:48:40 -0500
Received: by mail-pl1-x630.google.com with SMTP id g23so1453486plq.12
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 02:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SBsK/c3rMvwOviHJJji/eMgBMQr4MTIxW1VogVy8xOM=;
 b=6c0W8Jzl9Ik6QX2YT6UjiWIzQZ7jag+AORTT7vWGyDtlX6yF8XywwkgOM7fOK4jQGo
 aoGWlrXn/83zDqkCQlYQaGzfil8VZcqInzJhZ1cb5kkXy9OE8gHI8xUS+zE6qGLoHB0F
 IyW+vCbNX6TCNx6RVsihUi63kzrsvtzGUqwDNpVpXi92ALYUPZT8+iaNGPgDfXHIr8Kk
 FNEcgg2HdH8Y54/ja2kGsScR/a1scjCfQunmqiRXVXikz9jg5JUJ5p1D3fmPptQCP/Zk
 ev8zpfWsn7GdY8KhJ0fukOy3XwkxjctwN/jzdXTZIwMpNf1FkeBSUD0OJQq0HEIYnrwQ
 Eg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SBsK/c3rMvwOviHJJji/eMgBMQr4MTIxW1VogVy8xOM=;
 b=yHIiHov2PhvRNu1SbENFeBzAuHSHvCytiduztJpdObTbArPjwTtaoBFMNl3Uu294k/
 FCLoEtwOnMipypAW/nch/VIvcn/xWi467BLFLhASbCKSLIueeU8FKlj1uMuSPLJm2nwI
 67Bkme0LbROEw74Z4e6ITSi1At04/K+SRLeWYqbbotPG/xD0gXz0Yd7VNJ06zwboU1cL
 DxyIY2z1R4laPIJkaVC6YRCtqeHbndc3Fp0lk3McCSVEUI5RuHGWhQHojGGshOuBwiUE
 TPoMeqVD/guOjYHwVcMwWCEm/0GAQ0YGHIJpYQqNx/ibGO57Km9Vdh3WpvDzPMfvzwM5
 SAJw==
X-Gm-Message-State: AFqh2kp59OJEicXTRY9pOEjJ4Wydff+bGOeFKgaNjYVrukTCkpuHAbXW
 h2dWns4dKOfvQ7r5H3CPdMJahQ==
X-Google-Smtp-Source: AMrXdXuhLNefjYWKdKh8XOLhL4YxAX0c9hQ4vaQn3lq0hkz9NZP7IYQFKR0IJYmW0WauVJ24eVt5TQ==
X-Received: by 2002:a17:90a:5b0c:b0:229:2458:4b2d with SMTP id
 o12-20020a17090a5b0c00b0022924584b2dmr37191634pji.12.1674730118295; 
 Thu, 26 Jan 2023 02:48:38 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a63af48000000b0046b1dabf9a8sm496789pgo.70.2023.01.26.02.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 02:48:37 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 26/26] MAINTAINERS: Add e1000e test files
Date: Thu, 26 Jan 2023 19:47:05 +0900
Message-Id: <20230126104705.35023-27-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126104705.35023-1-akihiko.odaki@daynix.com>
References: <20230126104705.35023-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x630.google.com
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 958915f227..e920d0061e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2218,6 +2218,8 @@ R: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
 F: hw/net/e1000e*
 F: tests/qtest/fuzz-e1000e-test.c
+F: tests/qtest/e1000e-test.c
+F: tests/qtest/libqos/e1000e.*
 
 eepro100
 M: Stefan Weil <sw@weilnetz.de>
-- 
2.39.0


