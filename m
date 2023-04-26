Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334AF6EF230
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:39:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcXo-0002Ke-P7; Wed, 26 Apr 2023 06:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXm-00029l-C9
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:38 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXk-0003D3-FK
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:37 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-63b62d2f729so5526806b3a.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505515; x=1685097515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gxmYdGyeyclr6nIITv2T0ZzAW4fVgPRCULVfg9/kFCc=;
 b=MPairb+DMLnLRuNk1P+3Dw4c8G0MZWQY87RcZTyeXGnz+9ze6dVomNTkIJN5GH0pvx
 5d6ERaSyogsuZms+wbSo6bjFupQHa/A90lPE8TpwE4TCIOL6CIhZzrG0WhZsUWTKCKqf
 Sm269HXSabTQu+LC/H/3cNU91QCZn7zFCyqmaI3FHaUoDaS7PN97mihKsJj/A/o2ky6y
 swh1qQHWg/enaYxOC1ah3VtEBneDgDKWcPKAMUYj/Kg9bt7GWvPL7LMX5DwSVzqq1pz5
 23a5c5TBCywdIhS4Rd212RD9ysuwg+pwVB3x/uySkkeeWR3eV1523g8E0azK6S6lsxeq
 hbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505515; x=1685097515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gxmYdGyeyclr6nIITv2T0ZzAW4fVgPRCULVfg9/kFCc=;
 b=lzcJwS/AbUbhw8vflh5L+JxU2Pdzy7+skgzanhuhkzPbRjwtK4PWQPlFxa6A7HH72+
 xOD7R5IjgqCTB4mBu5YtPQnZ97rEXQKLYyG9kYyYDvy+vjpkTVY88StijV3H2OZtZpHK
 ihtHF6if17m/GXxdkznLjYwcJchQEqGwn6Ib56W2qNVeNi/xeVq2TjLi54atsWuNKL1n
 L/phdE9GRnbURD2aB4pJQS/rAlmUQ0lBdRM905rswcsSbviq8mXnfvfBPya/WS1HqsIa
 /wHVHEOkRWvPYcgCpovgsoXgj+UV9sEbdHMRgb/jf9j1qYS6DA2EypSLL+IKrPjKvjX7
 4Mxg==
X-Gm-Message-State: AAQBX9dQnAFOJfHVN0OQTGfMLlXezv0yUyikGd+ZnDV8zXli6O+f1Xv5
 kDqk2N+OJ9mWC5Ewc2XJBHIWoQ==
X-Google-Smtp-Source: AKy350ZtKemE62+YEBZyON7cHzwdIuOBfLlFDejQbJq5q90XJIIdS/Pl6s2aXs7OzuVCfgEnfNmBDw==
X-Received: by 2002:a05:6a21:99a5:b0:f2:8c89:cd30 with SMTP id
 ve37-20020a056a2199a500b000f28c89cd30mr22697818pzb.13.1682505515250; 
 Wed, 26 Apr 2023 03:38:35 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:38:35 -0700 (PDT)
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
Subject: [PATCH v4 20/48] igb: Remove goto
Date: Wed, 26 Apr 2023 19:36:48 +0900
Message-Id: <20230426103716.26279-21-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
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

The goto is a bit confusing as it changes the control flow only if L4
protocol is not recognized. It is also different from e1000e, and
noisy when comparing e1000e and igb.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 946b917f91..bae51cbb63 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1297,7 +1297,7 @@ igb_build_rx_metadata(IGBCore *core,
             break;
 
         default:
-            goto func_exit;
+            break;
         }
     } else {
         trace_e1000e_rx_metadata_l4_cso_disabled();
-- 
2.40.0


