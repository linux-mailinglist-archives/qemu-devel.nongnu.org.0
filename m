Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BC36E89E2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:54:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNAp-0001A4-HE; Thu, 20 Apr 2023 01:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAX-00010I-Bt
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:21 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAV-0001RC-7e
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:20 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-517c840f181so360214a12.3
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969758; x=1684561758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rBFig1hzkHXQ3n+UcaXDa5HvtCT8+DbEwCzGzLBsJs8=;
 b=dFrR7STUWwTcAPHDABLqRHslXowSmoD28087dFsgNcT5KCfYLeBYX6a0jFolohDAwI
 +fIeKM2rmnkPVn64z7n7M3kCqHQfP80G//nU12iUA89+giiw04XWmOBa0KFnPkGLMTlm
 wrg3nP34GMWObXItbvNWGghfgCsrXRfX+8HE+GCMdcC2ALFK6/K9nWuYxPU8zpZSPEl+
 ODcTw3xQiN0BT2hppIkmA9vW56yXh+LyBAatnlV+A8JWXkZlcmluMzKE1w0RajjxuM4l
 TbRh4iMq7Bc2xmeLOy3XK82kq5ZC+u5q1ixv/W9TTsAVKJI9KSXFhXvP7a1IbZvnSKLM
 95RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969758; x=1684561758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rBFig1hzkHXQ3n+UcaXDa5HvtCT8+DbEwCzGzLBsJs8=;
 b=KkulqPL720LT2CYA09fVBc3/TTgmoJhW96eL+NKKsxAjQv9XArKs7mzRUvhFaLwL3P
 Gt6AbwkLMRlxQaHVoSrANFOjS4W1EMVENzpgcSwpzuaTMrTjwVFxxKa84nRULBEU7CLg
 0JEcP3ZFpxpwVi7IC9E1CR5+Mcjxz1uwWm+TjDZnhAY381i3WsX62y8vNIypelTAzJcG
 aDH+W9QJ+1MmecMuVEHlHCLrLRJcth/PiZ8monmmFs6RZkmWXZHXMdTDKyDJkrB/RJrs
 F6p2O/kT1u7YH7S7aBmRnAqFKEOQu4CZDLIB8W7JRVG2foFTy+IHf4r7ES65ukAvdsLj
 XfcA==
X-Gm-Message-State: AAQBX9ca3K1ZNXAYkj3C+XmhdPMMmDH8cJNjiQLlKJwawnbUtIEEeO8J
 BD8IymApVp5unJsdaRFLl/MYXw==
X-Google-Smtp-Source: AKy350YRThRWr+5/kParTB72ft8Pk+C2zUeVX+2hikDCagEh3Huk9bWaomzq7ZomqnROedVPWiOiug==
X-Received: by 2002:a17:90a:fb4d:b0:246:9a43:39e5 with SMTP id
 iq13-20020a17090afb4d00b002469a4339e5mr532023pjb.23.1681969758106; 
 Wed, 19 Apr 2023 22:49:18 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:49:17 -0700 (PDT)
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
Subject: [PATCH v2 29/41] tests/qtest/libqos/igb: Set GPIE.Multiple_MSIX
Date: Thu, 20 Apr 2023 14:46:45 +0900
Message-Id: <20230420054657.50367-30-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52c.google.com
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

GPIE.Multiple_MSIX is not set by default, and needs to be set to get
interrupts from multiple MSI-X vectors.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/qtest/libqos/igb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/libqos/igb.c b/tests/qtest/libqos/igb.c
index 12fb531bf0..a603468beb 100644
--- a/tests/qtest/libqos/igb.c
+++ b/tests/qtest/libqos/igb.c
@@ -114,6 +114,7 @@ static void igb_pci_start_hw(QOSGraphObject *obj)
     e1000e_macreg_write(&d->e1000e, E1000_RCTL, E1000_RCTL_EN);
 
     /* Enable all interrupts */
+    e1000e_macreg_write(&d->e1000e, E1000_GPIE,  E1000_GPIE_MSIX_MODE);
     e1000e_macreg_write(&d->e1000e, E1000_IMS,  0xFFFFFFFF);
     e1000e_macreg_write(&d->e1000e, E1000_EIMS, 0xFFFFFFFF);
 
-- 
2.40.0


