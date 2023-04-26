Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 865E76EF279
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:44:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcYb-0005q5-2X; Wed, 26 Apr 2023 06:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYX-0005Lv-7P
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:25 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYT-0003Kb-IB
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:23 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-63b5465fc13so5519657b3a.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505560; x=1685097560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gJTd+zlMFrMjrpg4tmDtHb6BwlxiXhf67UG5csq1fUM=;
 b=G3pG/u88nBRNI4Dfq4kMsOwAhO3VOJwDEaSvALvTrudt9+xPnGqP26R2QFSccU0R29
 KvHFuukxY1pLGjUxBHqNjWMU3qgmvjEzfkOJm7/ZI4DIcJeMinfTB893iAmz7byoSYZs
 wwjUqZw9A0qraYvZxthLdauW04A7ZNnvzdD9FjIQSULsXLFTD7OG8WikEm2iuNDPICrb
 uasw6HoZOCaq4lEPbrizigEnJOGv+9V4fkQ4MCeEvmN0l6j3sIzNtBR1JH2xTvldcSdi
 AICCL+dThh8teeytlSMZsljXN5ElN1+dRUoIwIXq8I1WyiiRKLE7yGvvBsQzQSas6Lfo
 q1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505560; x=1685097560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gJTd+zlMFrMjrpg4tmDtHb6BwlxiXhf67UG5csq1fUM=;
 b=b5/3w/ScbIKjleiBofnCCD9bLKPLcNbBKP5eJLMYsqzfZCmLFkCuFYn46mC8hYmqAY
 g/mSy0y0FvlMiOECQwm6opY5rRJdm3Qc3qW9NhDhxI1s601ql6mBjdPTf6bv4vkU9D5f
 VmV9kGpGHRwUVS0TrnlxML4oBSdgVF2tgx3WLMBg2BteO57TxIY4Kwx2RTwfexNm94tx
 ZzKEWma9cwn+7rTJkgu/f5de8XmWvcu2rGB9Cs6WYj1ZatnV1zDRl+t/vP1nyC+g7MUK
 LBh3oDaXxOOv/rC4xt6d4sgNrbxKXiJhM8j1nOUAl2mqEaHDMtV5VykV9y0xjrRwUS7B
 gWVg==
X-Gm-Message-State: AAQBX9e98EMmNuQiwjSOftTooy6iUcLwE+PBcKFyLj8Fy5ST558ywM9x
 gfb3cIr0ZbSZj0KgXkX+mUF+TQ==
X-Google-Smtp-Source: AKy350bEgAUnxtRaoAOnLLEOYu/WUAgo3MAsPWtjI+7x7PWsDsmsI1YvOcZ63T56OLKQPEfceEVMow==
X-Received: by 2002:a05:6a20:d906:b0:ef:bd:38 with SMTP id
 jd6-20020a056a20d90600b000ef00bd0038mr22643268pzb.55.1682505560381; 
 Wed, 26 Apr 2023 03:39:20 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:39:19 -0700 (PDT)
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
Subject: [PATCH v4 33/48] tests/qtest/libqos/igb: Set GPIE.Multiple_MSIX
Date: Wed, 26 Apr 2023 19:37:01 +0900
Message-Id: <20230426103716.26279-34-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::431;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x431.google.com
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
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
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


