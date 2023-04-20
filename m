Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAE76E89E7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:54:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppN9v-0007Sq-8S; Thu, 20 Apr 2023 01:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9r-0007FR-Jf
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:39 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9q-0001Il-1e
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:39 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-52160f75920so440721a12.2
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969717; x=1684561717;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NKrjZcc5spW3PcfEcfPF1xgA9c/5G8C/80+pcYNs6X0=;
 b=L2fVtS0zUOeazrYTqMoYyr3BXMRAUAOn/CanYTqzJY0BP797ijcIL9SVArZ9Ilz+5o
 rehloz3PyDU65O1A/otdpy117AZ+r2QT6cxlHS6NFjsD5tQ/BV+CvNHlYUUg8cfTXk6Z
 s38EMdNiJ0HgaYTr5SZhkect+OG/+CP1AVCzZcd/97T1lDJog8eB90WlV4+v06v4KjQs
 36q7x+U1hHiTMTtknwqxZFkSEQy357p0AzmBs2t8/aRAObq+nQJobpT9U8ZmKhlFSNnU
 BFPCJShquKuw2+hRRrQZHrfL8Y1CgxojxAMCxYcGzvIqCO9knhAqjTdBTczixRAS6X2r
 N6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969717; x=1684561717;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NKrjZcc5spW3PcfEcfPF1xgA9c/5G8C/80+pcYNs6X0=;
 b=h2i3YnLy7A5VypVpCTnAItMzK2MKPokSr8AfxGe36V7Az2fs7XTE2XUlJS+QEMOMou
 HKZSFmKSTNL19PhidlmJGC/QpDVJ3p8eT/CqhVkGpZVHLto6b64wFmWSA1T1hX0SIlRq
 C/Cx1CMahvlYfbivcjpXBooZxzxK4tkiBAvAdwp75Khw3L9e/qCiNzanW6UPg8uzSkPR
 9pYnIn6kZoqXSYogEDrkZiMVJmc31ljGlKSA/J9YPjs7P8xXbS90BXj3DDtMoiBx1dSf
 z+dzKRsitum9oivH5nLyxl12JvkMArTxa1hH2xbcadvcH3HsEcC9R/6O3mIwX45pm7d8
 KQOg==
X-Gm-Message-State: AAQBX9e1PrUaTEzWMeA8jo/bThe4tdlfU2AObSslomnaXX++Ey1xDceu
 X/gw8czYDsoIElUdNbPT8tjeWw==
X-Google-Smtp-Source: AKy350at1Ov41HTiRigYkkSEHikHZI9He9JK5R0eyyVdGPuUMGAS5j+GhHKt02aLvdEnvNJzwPAc1w==
X-Received: by 2002:a17:90b:38c4:b0:23f:6830:568e with SMTP id
 nn4-20020a17090b38c400b0023f6830568emr623996pjb.8.1681969716966; 
 Wed, 19 Apr 2023 22:48:36 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:48:36 -0700 (PDT)
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
Subject: [PATCH v2 17/41] e1000e: Always log status after building rx metadata
Date: Thu, 20 Apr 2023 14:46:33 +0900
Message-Id: <20230420054657.50367-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::530;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x530.google.com
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

Without this change, the status flags may not be traced e.g. if checksum
offloading is disabled.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/e1000e_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 481db41931..d4a9984fe4 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1244,9 +1244,8 @@ e1000e_build_rx_metadata(E1000ECore *core,
         trace_e1000e_rx_metadata_l4_cso_disabled();
     }
 
-    trace_e1000e_rx_metadata_status_flags(*status_flags);
-
 func_exit:
+    trace_e1000e_rx_metadata_status_flags(*status_flags);
     *status_flags = cpu_to_le32(*status_flags);
 }
 
-- 
2.40.0


