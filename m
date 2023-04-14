Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70616E2273
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:41:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHlt-0001V4-Of; Fri, 14 Apr 2023 07:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHlo-0001Pe-Vt
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:13 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHln-0001R7-BT
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:12 -0400
Received: by mail-pl1-x631.google.com with SMTP id l21so73596pla.5
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472350; x=1684064350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k3mdXXZyQXRfXSMLDl79itWqXU0m4NOTVFTvkifQBvo=;
 b=Huhm/DVr9qIP6tl4RdTAMluHqkScFBlDJchsUwtLcPUouqWZQc8FiDkABSBI7UGc6x
 etd9Mxpox7W7Mcx2cJWvoP7EnBjnFbaFbi2yP99qqWgGfRZkyAPVSdzxZemt29VXCrG8
 T690xJsz/Z96jW7mLs8adwdazH6Xz2Za4/+UGvA5VOmLuHCQHlIqBhAk6PMAKFMsXQtx
 WenXUZE5yCW5cNtTkfDju/J7mvr6mbS1jsSJTk7hMxQszSGMne8zUM8K4mW3ods02llS
 OV2O5ew4OIP3nhQ/A+MqdQTO6vL7SyWweAJa57iYbKJ+oWLKUzFMIvvkjhdHHMc5kJPB
 LIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472350; x=1684064350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k3mdXXZyQXRfXSMLDl79itWqXU0m4NOTVFTvkifQBvo=;
 b=WDvp2Ids5rl0fB5C5CqlRZmVTU/PRLdnqrdxk5SXAEdtdojKkSkDIYvv1prP7ML9q6
 HQOboZO4LWJlHTRM29nPg2pmxiWwW9mMptIVv1yUYVHtZ+6rv9sXggc2ANIRmsDwcIqt
 1dOs6MDE/zHoLO5/3uyvgOADbhLU8NQXCt6xzXi9FmL4knVmYVVld6OoUBg+Ji/fI/AW
 5kNj1WNY0ITrIsvFBzvI5/SR8BMQa/h2m/fu/oHQfyTEIWxCBzouDHptGW0fU+lZQPL8
 j6gOLScws/9TR6EsG87Uh4HtmN+MeR7OlXEcDF3hfDrbXBkF2JyqObXctR98T62M61ts
 pMVw==
X-Gm-Message-State: AAQBX9cykQtIRQwasBx4A/5MjY+E1CbrMEXI9QdoaVShwfPW5pVDHrae
 LSnRX5DhlRL1OSIBQlQl/34aLA==
X-Google-Smtp-Source: AKy350ZG/451U0wpY0Cqj0tcFMJJwknNy0YmCqB1aPW/Dnd8XkzsRZBsrbjrDMvjtSSZciU64WXQFQ==
X-Received: by 2002:a17:902:f684:b0:19f:1871:3dcd with SMTP id
 l4-20020a170902f68400b0019f18713dcdmr2825190plg.5.1681472349785; 
 Fri, 14 Apr 2023 04:39:09 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:39:09 -0700 (PDT)
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
Subject: [PATCH 16/40] e1000e: Always log status after building rx metadata
Date: Fri, 14 Apr 2023 20:37:13 +0900
Message-Id: <20230414113737.62803-17-akihiko.odaki@daynix.com>
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

Without this change, the status flags may not be traced e.g. if checksum
offloading is disabled.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 743b36ddfb..dfa896adef 100644
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


