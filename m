Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F41E505459
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 15:03:16 +0200 (CEST)
Received: from localhost ([::1]:60014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngR2B-0000m7-7B
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 09:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <natalia.kuzmina@openvz.org>)
 id 1ngPBx-00074J-V1
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 07:05:13 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:35420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <natalia.kuzmina@openvz.org>)
 id 1ngPBu-0004vi-PA
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 07:05:13 -0400
Received: by mail-lj1-x22f.google.com with SMTP id h11so16414113ljb.2
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 04:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yN0C5DjENBQP8/WnOoNfpmiWO9+MWIWlnkjtbbk1Z/4=;
 b=NDHGON6+PR5dJvcnXrSx0SrzhD+t+t0YPRuk231p5GOKLPzY1zK1Cbf8aUSgp0bpoT
 K4Fh5q804b94b64qHn8fLA+2BgEyrak3s0nlNEXO/Tg+W7pYMBtz9hkVEiYT8psaW9BS
 Ztf5CSlCZFardCiVJHqZfWe6T8cU/W4dduz6LfTxuHumfYnSeRNWtCFki+LPsFpg5mN3
 pahqI4QOKg7RBKcKb06Tzn+dBFT0jefQD2jSm83HoHCKOLR5xQb2G+68hUVN5nJr3h8x
 YVnKO7Il86n/bbCI7ZQWEFgStNsUTc3WsnXuMkM/+1U4H2ewrRFSNfHgOlpZbgL/3dKA
 FFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yN0C5DjENBQP8/WnOoNfpmiWO9+MWIWlnkjtbbk1Z/4=;
 b=lHdKoYVTXwxIOqm1j+oKjnFvxVBy96PARSaz1Qft1+2qAIbNcOZpXD3JVT1gH5aQ+h
 MEgmu3rhJe1wuJnSRETt1riqB1eMQXgz931V/wxK3bDnQZi9RwXJyhWNhQAAGy2i364f
 C77yO68aCCfaBiMDSfy0Iu0GhKLp3g9/372KZCV7acYiisXpGaVNPhlafNKRldMeRXhj
 OJBlAIdhBDtZZogw4LBuKres0fLlV02dUUTPwNiBlAGEg2InapS6+JAk9SlORxMByFlS
 dyxuvPi9JPQ7TY0WaDBoXgJ50E9gZa8kzGCZ1k4AeT5js3LriOaRg6Uw+i/G2jhzGKKa
 FGzQ==
X-Gm-Message-State: AOAM531gUtisNWGXO81e70vvPwy7c9K3D4Qun1ELSA0gDWC3dCaylrSZ
 JznLRYVzWYhjDqnr25yfKyaYsGpAaKre
X-Google-Smtp-Source: ABdhPJw2O7PITxRXmeCHYH238p9W5JgKEQjG9rN5G14Kv36Tv/6+VXdzmGUD2s2jEBUipoUomyL8YA==
X-Received: by 2002:a2e:a585:0:b0:24b:70d2:249b with SMTP id
 m5-20020a2ea585000000b0024b70d2249bmr7163894ljp.78.1650279903784; 
 Mon, 18 Apr 2022 04:05:03 -0700 (PDT)
Received: from localhost.localdomain ([93.175.7.89])
 by smtp.gmail.com with ESMTPSA id
 q21-20020a194315000000b00471083815c8sm580041lfa.168.2022.04.18.04.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 04:05:03 -0700 (PDT)
From: Natalia Kuzmina <natalia.kuzmina@openvz.org>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH 0/3] Repair duplicated clusters in parallels image
Date: Mon, 18 Apr 2022 14:04:27 +0300
Message-Id: <20220418110430.319911-1-natalia.kuzmina@openvz.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=natalia.kuzmina@openvz.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 Apr 2022 09:01:08 -0400
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru,
 Natalia Kuzmina <natalia.kuzmina@openvz.org>, hreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Parallels image file can be corrupted this way: two guest memory areas
refer to the same host memory area (duplicated offsets in BAT). 
qemu-img check copies data from duplicated cluster to the new cluster and
writes new corresponding offset to BAT instead of duplicated one.

Test 314 uses sample corrupted image parallels-2-duplicated-cluster.bz2. 
Reading from duplicated offset and from original offset returns the same
data. After repairing changing either of these blocks of data
does not affect another one.

Natalia Kuzmina (3):
  qemu-img check: fixing duplicated clusters for parallels format
  iotests: 314 test on duplicated clusters (parallels format)
  docs: parallels image format supports consistency checks

 block/parallels.c                             |  66 ++++++++++++-
 docs/tools/qemu-img.rst                       |   2 +-
 tests/qemu-iotests/314                        |  88 ++++++++++++++++++
 tests/qemu-iotests/314.out                    |  36 +++++++
 .../parallels-2-duplicated-cluster.bz2        | Bin 0 -> 148 bytes
 5 files changed, 189 insertions(+), 3 deletions(-)
 create mode 100755 tests/qemu-iotests/314
 create mode 100644 tests/qemu-iotests/314.out
 create mode 100644 tests/qemu-iotests/sample_images/parallels-2-duplicated-cluster.bz2

-- 
2.25.1


