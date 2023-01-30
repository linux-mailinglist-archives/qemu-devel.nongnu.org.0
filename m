Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01847680F59
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:51:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUXX-0005d6-D2; Mon, 30 Jan 2023 08:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUWn-0004y3-4D
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:57 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUWk-0003wW-J1
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:56 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 w6-20020a17090ac98600b0022c58cc7a18so6665944pjt.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hJjgj3IIFVAqBly66Z6Xi8AkW/Nl2V0Vhn07Bk+a+M4=;
 b=iu9tOshaiLlVpnb92lRHZDKlKmOyagKE4mmyCGnKM8hVEepDZOYMoCr3wepdprb3zi
 ewarSxoRRA/F+JDfdUp2DjdnA9RlNebg7qw5as4M0Apr4BVtyWGouzBep3uDNhgj5jDf
 DwGE/4LYSYDnXgOWo2cNjfp+FABSNSLfzOdF1SBaEBm3VYpjN1iTQUNmQziLF33/wR0/
 uO6XD604bGVEAwuV0/9XHKvX3K5xGN0IiIlG3+R0iFJKHE/q9DvOu5QzDx1QuSQC4pCB
 48JLtjYezQRZDQ6pt7MVdMbI7qjXg8YH4uuThiZBrwU0aii687DJRJC2iZpUKerji5Az
 dt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hJjgj3IIFVAqBly66Z6Xi8AkW/Nl2V0Vhn07Bk+a+M4=;
 b=muHFLy8d3D9LWXNyBs39/sxpjUAc1kwLFOaXYH9Wk/thj/xWrB/Uuo4Yf012uIUdk8
 Z3h5ttc7lPJMdWPK+2hwqMnQJo200NjFY2x0g8YOlx6YOajoTUWxxn0Gb/zgeLEdhi3d
 Xn+xOjfuMH5bwBIwWfJ0gjxS3TnKluJEmUuBHvm+rIf79nSR8ViYGaT++TgpXQVGPmk9
 PvQUC3WP4UVMNWv8iDcwtto0kGgDaSnIkkg0r6/QH7IAxBsKOJG9scr9lHCbfk3neqW9
 7bP+KEhs14rCajcGYiHJk9GtxWPjinTV6ySyPHtQRst09jhu8k1ym05DivkAh0LYvJRx
 ZEFg==
X-Gm-Message-State: AO0yUKUGOyiHqiM+slUFGPAFKrqLuH2+1d6TS55MKuSxXJ1J33EsFhGi
 HfXAgXkETZVvk1qTMN7GgCgnDw==
X-Google-Smtp-Source: AK7set+7wlv/2Sa6WKLyK/OyB4I/InkY3Zdj2YKJNsAYTjFZdONX08TG29gNk6+IkqM98A0jgY+kFQ==
X-Received: by 2002:a05:6a20:66a7:b0:a3:7d0b:5dcb with SMTP id
 o39-20020a056a2066a700b000a37d0b5dcbmr7316435pzh.15.1675086533429; 
 Mon, 30 Jan 2023 05:48:53 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170902d34d00b0018bc4493005sm7815573plk.269.2023.01.30.05.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 05:48:53 -0800 (PST)
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
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 28/28] MAINTAINERS: Add e1000e test files
Date: Mon, 30 Jan 2023 22:47:15 +0900
Message-Id: <20230130134715.76604-29-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130134715.76604-1-akihiko.odaki@daynix.com>
References: <20230130134715.76604-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
2.39.1


