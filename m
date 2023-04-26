Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629696EF24B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:41:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcXl-00020X-3d; Wed, 26 Apr 2023 06:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXi-0001yJ-EI
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:34 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXh-0003CZ-22
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:34 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-63b4bf2d74aso5479004b3a.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505512; x=1685097512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CA6Nq82v8xkh13KZN69Qd2MmAy9Lo2TKxBNxM5FodsU=;
 b=D1w9FV9XaBlXQHPeSwcgG7yVQjdqtN6Juvqv5JCzzHUmlyL4Zv137OI5P6ASFYO60h
 35khmsqnQ3T5j8jj96yqeg1gqAx7/m+iJoh9olmvHsdPR9kwv2G2B7bUTdAWbs3Q+1Iz
 O6Dx/fLikf2ZmYvJRLyPpW+gU6lVfQlzlxdOmJFRH7FC3YWGcvox/9OWHF/zLc7EZdsm
 WLZI2yHvoKbeYp/05CfOED0XRDb4N9U6aRDMwd5vxbxin5ctH1mm9gOzr/GFV/YfrNfR
 u4rkF4PnimzUIWFYYHZZHYBvpD3awm8rq85lO+XW0Qz6/jRqnKoetntNJvnKKoGFRWW0
 ctbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505512; x=1685097512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CA6Nq82v8xkh13KZN69Qd2MmAy9Lo2TKxBNxM5FodsU=;
 b=hrpQdI8RynXQ1lOusN/46oiwqJn0Ip944z8n4cx6PsLzfsLZdwJ4VxIEuAbufcfQJ1
 aarCNRobp8aJH4Yh22sThU7nP3wWbmUoOuAJFpL9znbepC8w+XWgB7Y29SCtI3Pru5Nf
 7P5fwCFFrqROukeaAoKvFKlx9iIyuriMuZnXFMfY17ATjgq5Eez/TfD7escyLVDux8QZ
 c3V/pMpfgXccPfgTAGf5DCVSn3SYyVciRSuQOw9MIshQESxEr/W5srAzU4uC+YKRFpJC
 nv39RYYr/q8LrZMt5nItunLyU3pRSnsCEfXRDVwCfCyTmjkjZMPJsi3L6N2K6KkE4IPZ
 s8zQ==
X-Gm-Message-State: AAQBX9fpX3jDBk/tI9cvrZOVq5HcdApWhGakYbo4RYsAoHtrLceta/eN
 PBMqY9Ystad+CDvJxvMNrO1uBQ==
X-Google-Smtp-Source: AKy350aOQiD/AvRii9QUFcWQMeVEy2apwhdcedfioshoOpsm22V8spwzHaqjNfK9Asw9WWDIzXr/zw==
X-Received: by 2002:a05:6a20:3ca4:b0:f2:7da5:f276 with SMTP id
 b36-20020a056a203ca400b000f27da5f276mr21683559pzj.51.1682505511865; 
 Wed, 26 Apr 2023 03:38:31 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:38:31 -0700 (PDT)
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
Subject: [PATCH v4 19/48] igb: Always log status after building rx metadata
Date: Wed, 26 Apr 2023 19:36:47 +0900
Message-Id: <20230426103716.26279-20-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42b.google.com
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
 hw/net/igb_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 209fdad862..946b917f91 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1303,9 +1303,8 @@ igb_build_rx_metadata(IGBCore *core,
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


