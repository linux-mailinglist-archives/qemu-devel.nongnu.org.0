Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6BF58ACC3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 16:58:59 +0200 (CEST)
Received: from localhost ([::1]:54558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJymw-00005p-Pi
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 10:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oJykT-0005PY-9C
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 10:56:25 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:43974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oJykR-0003Vp-RE
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 10:56:25 -0400
Received: by mail-pl1-x635.google.com with SMTP id 17so2836718plj.10
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 07:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=7bCQ8cKqB7t3fSWKcCDxs4sfPXXEO07MKgBZafJIlOY=;
 b=K/+ibLDmsjan1uOI/ETWRsit/RQBuxX6e6iLHRO/LfwwfpaKJTSZlBdsTmKYTvZ8zj
 mtIyEunSsk9nR8jD6eBYPhU5dppW+JdkDgKC8nPpEMradWzY9Qfo/LCxXcMS3309dfLP
 kQmKjhLFcgtH7LgejottDIJZky0/k9t8bwsW8ePq61ALdaCu/3z6drPcrkaT2Yc3FMLq
 z5BDyeyT6UqrMIsGO0jp4S1YExtfCfGlmItB6OilP0c2/22PRkvQEgB2jIeUT0YvDpki
 BKytL4YCV8TpTfWZoRF84PKBLN2zxyyngoVnFFnZ6T8a5hRyEGiKvIZq49UYblP4JHW+
 a8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=7bCQ8cKqB7t3fSWKcCDxs4sfPXXEO07MKgBZafJIlOY=;
 b=hTAoLLp2xERR0mrxtCqOAC2omGNL+acwm5fD00cnzaXf15Igg+5xi/MyB3x/ZpFxAG
 emDvwaaaImpQXIHKo/wvfeDTqVEBDObeh1hruyCvDggwHSwEE0Pq4x9BhlzRhpkdKCNH
 LkLt3fxtUAcUqqVlikNd/eeA3EmG6EircbldgjdE7kPKUFFPmbtegAN52wYxF7xpk/LY
 1tX8663M+Dl3oiZ4XouK1y5Ac0VfCCKqwzbHx+uljMFFt8L0Sqb3/8KX60UF4ufeH+9T
 jbNBhYcB3WbhgvUF0b8FoemV1u7KdoTOXjkZKeAtuykwYYM5ldnEzrHe1uyzJB/muZmj
 wwIw==
X-Gm-Message-State: ACgBeo1OowodED7kjZVzCiiwXoMKSFUiD0nVFlWAclml5Iet+0Cwj6xk
 LqmFmrcuYISF0O3y1oQCZSuVzzDvdvY=
X-Google-Smtp-Source: AA6agR5iHlqj2IKA9utIKO/QJglkRD6NK6hztWWxBM7i4PUK89vVeRyI36ggXnGyOgW8UZJUQDWSPg==
X-Received: by 2002:a17:90b:1bc7:b0:1f5:37a6:e473 with SMTP id
 oa7-20020a17090b1bc700b001f537a6e473mr7808393pjb.87.1659711381774; 
 Fri, 05 Aug 2022 07:56:21 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a170902d49200b0016bfafffa0esm3166814plg.227.2022.08.05.07.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 07:56:21 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/2] util/main-loop: Fix maximum number of wait objects for
 win32
Date: Fri,  5 Aug 2022 22:56:16 +0800
Message-Id: <20220805145617.952881-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The maximum number of wait objects for win32 should be
MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 util/main-loop.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/util/main-loop.c b/util/main-loop.c
index f00a25451b..f15d8e7d12 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -363,10 +363,10 @@ void qemu_del_polling_cb(PollingFunc *func, void *opaque)
 /* Wait objects support */
 typedef struct WaitObjects {
     int num;
-    int revents[MAXIMUM_WAIT_OBJECTS + 1];
-    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
-    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS + 1];
-    void *opaque[MAXIMUM_WAIT_OBJECTS + 1];
+    int revents[MAXIMUM_WAIT_OBJECTS];
+    HANDLE events[MAXIMUM_WAIT_OBJECTS];
+    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS];
+    void *opaque[MAXIMUM_WAIT_OBJECTS];
 } WaitObjects;
 
 static WaitObjects wait_objects = {0};
-- 
2.34.1


