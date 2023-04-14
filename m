Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ECA6E227C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:43:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHo3-0004qc-H8; Fri, 14 Apr 2023 07:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmU-0003oI-L8
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:54 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmS-0001VX-2c
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:54 -0400
Received: by mail-pl1-x633.google.com with SMTP id y6so16935966plp.2
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472391; x=1684064391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rBFig1hzkHXQ3n+UcaXDa5HvtCT8+DbEwCzGzLBsJs8=;
 b=bsKv41evSaORikhIC5b21w9uHFwRvEG3YkOWq53FeOC41oNQJuB+xTxO8xd3si5tV2
 86VvQgqIzuzE8jbax6DZco9R8uhI12583WyBxyvcm8Ihz2h0Tmy3ga+sIF+9tx++7BoM
 SQsRlm2u03toGVfDeRjXBOgzKCY9nRf6Jfqg3/lO25RAxK+oDOW8LwwK5aU3IH6WoVix
 lw/8HnVYFtefdO8JgIReJKslyG0eQ5SCUjiFA2qYnIUyG4P8qTNHM+NyE994hrAqEjf2
 +MG8kzGr/KRTvOy/2kB1U4zCOO5o15u2inoH7JKqR0bRsmzZVmQajiIrhxJ+TxJb4Ee0
 HHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472391; x=1684064391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rBFig1hzkHXQ3n+UcaXDa5HvtCT8+DbEwCzGzLBsJs8=;
 b=IGENXYPyeyUTmFA0jLXIxTIktlIe+d3h5K83tCmHyXcbV9+wN4U0+Kz2H2DtyNydrj
 YD7uuosCLU3iLE+CdRcc/ybriSMRgCMvl3kum38zbcsCMfGMbr/I8PeYSSmODGwo7u6v
 atYGAxiQaEKC273fEOH2ZxH6LYH3TjHrXinS3OoEmQWhix2RgVYEztwBofiWgAvh7Vn3
 B7dSF/TeN50/t03aHGoQRxzL+drdYverDNOzv+X/a5GQutBt3iW5ctgMXb8EOd4kafBL
 20nivjxJZQfUUGs7bkKYMlvZ8t6tjPFsQp+34Wm6nSTu/bclxHhtv9+XomeWRBUJLSEy
 JPdQ==
X-Gm-Message-State: AAQBX9fepU4YfV4tQUxLYyY0zCOAbGcscSNhgWpczt3iEXD2o74YuKnT
 1XHgQVULAJm1+iRbJYL6/3Widw==
X-Google-Smtp-Source: AKy350aaRGKAePautJZB9Yml8Y7wGLiWyGgWscXuhzrDgxus28yDDEvszdRpoWzdcY1aLd2kgHlcFg==
X-Received: by 2002:a17:90a:6aca:b0:246:82ac:b6b2 with SMTP id
 b10-20020a17090a6aca00b0024682acb6b2mr5429021pjm.9.1681472391033; 
 Fri, 14 Apr 2023 04:39:51 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:39:50 -0700 (PDT)
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
Subject: [PATCH 28/40] tests/qtest/libqos/igb: Set GPIE.Multiple_MSIX
Date: Fri, 14 Apr 2023 20:37:25 +0900
Message-Id: <20230414113737.62803-29-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::633;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x633.google.com
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


