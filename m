Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015456EF231
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:39:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcXg-0001xk-VU; Wed, 26 Apr 2023 06:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXf-0001uN-C1
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:31 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXd-0003AV-V8
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:31 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-63b5ce4f069so8502344b3a.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505508; x=1685097508;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v86U37XRvdRC1an+utHD5WjPRWfLTsBjzch5syyzVzw=;
 b=RTw3+nZwnxv+3a2dX6zmF32egtB9aWRrVxxWKjlyoAupMdRETiZsc3YUiYvTCFiHsa
 v1SgyCzzMmcmwt7UmG9mMw5cZaWZaDnUVZfpk5kYAYi4nnWiFhBCoen5LEzsqfLzK0ja
 aCa5lozJUuHFlAANogHMfWpu+23UHatBdYtGwNF0RiVAB5OIvOHYFZzHdeksDFG9IKDr
 mQRXbsE8sutmhLc9/0TDxIZ3adX7nHjVPR7Ow4CvRp+bJqupEJU1M9gsxwxWn0oB2iW+
 3mCMBrzf0C1Ji4C74ZXRZFPJ17QOoAbCnX+5sXoPCsfw552vXSEA4D546p+qFcaoFyxG
 oGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505508; x=1685097508;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v86U37XRvdRC1an+utHD5WjPRWfLTsBjzch5syyzVzw=;
 b=Xh0ebHV8CWlhhGXatiLW9U3zCFSul87F2WfTnys67zYgS49jrvRiPCVxS14QiJvXrD
 2JZipq07wXjVUficiDNqSL+wC1qnbUNhnyNOuCPhxOcJ8v5hQ2lc6qasWdytJ113d4B6
 5RKkiYvZrwYccFyIT1ezFIAWoTYt+nxsGkYMn20d5M0dP59Na5sEmr70EQyoACmI4XXA
 uchNS9r5ub7e3zfiv9kCdumheq5APqazbzq/GxUIDKAGj2ShmpxU5P1T5R6MfRhN/dE3
 h7v8jEx6Qi+VxRE9VbEuLGFxyiu83jFXZ/d1nfjh03WB5fVc9I0876+wvaTixG6e50lR
 d6Cw==
X-Gm-Message-State: AAQBX9e8+At9yMwVjE9wCKrb3eQZ+bS43Q9jQbmIFLox+1kko+WCD0Ax
 +Vswn4CwJ6w84ZEO2iVOYNKmAQ==
X-Google-Smtp-Source: AKy350ZKrJGFbMGJdmgRNC9wWaQrDYaJZtgGyY9fJGQ3tjZPHptuyjbzoff5CW/0yye7ZmaUvx/Ieg==
X-Received: by 2002:aa7:8890:0:b0:63b:8df5:f8d with SMTP id
 z16-20020aa78890000000b0063b8df50f8dmr27413900pfe.3.1682505508459; 
 Wed, 26 Apr 2023 03:38:28 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:38:28 -0700 (PDT)
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
Subject: [PATCH v4 18/48] e1000e: Always log status after building rx metadata
Date: Wed, 26 Apr 2023 19:36:46 +0900
Message-Id: <20230426103716.26279-19-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x432.google.com
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
index 38d465a203..6a213c0224 100644
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


