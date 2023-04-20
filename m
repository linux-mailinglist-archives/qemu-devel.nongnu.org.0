Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F356E89DB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:53:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNA1-0007pQ-Qb; Thu, 20 Apr 2023 01:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9y-0007mk-NO
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:46 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9x-0001KG-50
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:46 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-247122e9845so402356a91.0
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969724; x=1684561724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LNbtNm08oFX/Kr+hWh5WddPg3P8O9fRwIo9uMNbOz2E=;
 b=0ZZwrk/5N+cSCjmrvdsQqZvihfwcImyW5ITjCEXwx70Axn2jITox43ZUOy8F1kDKMp
 79DuctehS3PbshlZ0gJeJX5KswoNCbWuWIx5i2IRrAKhBSrMs5ry8aPkJEEVVtIpLLPG
 QzGGHfrtq/g4Iew6NZJOAaQfC+8tcTkycZ7HPEaq7lBOO350B3JjOZTWGOTU8D0ee7Jx
 cvnQQZc/pRDmP7jR/QLSbCp0/NlYTA+vt5sidm3CbsoYw4/B3cXITDRkcXWb+ww56aVl
 tap++Yw27FlvaCzH5ariPi5nkzF8vPBVchcC0TxRUDRCk3IGxoWrPHW9ZerskoHDuuoY
 byyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969724; x=1684561724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LNbtNm08oFX/Kr+hWh5WddPg3P8O9fRwIo9uMNbOz2E=;
 b=Asildha9v4JE48DTc/lbfS9KbKgSaW5apu6KqF42C+yPQoza4Dtl0oFan7K4vdgbNm
 wK4oeqq2hdZQ/SiQkqqWL8Mtb4Y5c4XJePoqhEfKT2SSkpj4PyMJPIQ4Yax1UlyOoWl7
 1fkpGWxbuNaVMKnXz/Qd2gZ40jeX5Ef5aYuv8xwgAk7+T19EbZIggPRiVHzs1i8j8LFR
 o0IIkDJiaEBU6x3CxMRIC+xJug0HhePw70BZCoy4RTILzp2Tq6lF2+Kz3OZTqe/NZIsA
 3z6+17twZyvsh/E24XI0sCFcwyOCUziU843vmpxZstjjwvoCp7kNpvX3HYn58YDxAQ1f
 /RyA==
X-Gm-Message-State: AAQBX9fLOvA5VRJW0BNETTeKKVcJ7GezxelCmG3rIkoXdaDmSrK87mpj
 U/FYKAn2Inn0c2bKpXjbgsE6gA==
X-Google-Smtp-Source: AKy350Y9aZoyaS4EJwTEUBI+UJ/1MYxc7dyGL2TZwB6McT1BJW5bhvsomnUzIiUoUbJ5aJPRsQOnpg==
X-Received: by 2002:a17:90a:72c5:b0:23f:e4b7:afb3 with SMTP id
 l5-20020a17090a72c500b0023fe4b7afb3mr611621pjk.9.1681969723859; 
 Wed, 19 Apr 2023 22:48:43 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:48:43 -0700 (PDT)
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
Subject: [PATCH v2 19/41] igb: Remove goto
Date: Thu, 20 Apr 2023 14:46:35 +0900
Message-Id: <20230420054657.50367-20-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1034.google.com
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
index dabf1a91d8..d966aa6bfa 100644
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


