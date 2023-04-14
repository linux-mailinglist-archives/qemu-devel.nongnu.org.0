Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAF56E1EFD
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 11:06:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnFMa-0004YU-3g; Fri, 14 Apr 2023 05:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnFMX-0004TV-ST
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 05:04:58 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnFMR-0001VG-6h
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 05:04:57 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6343fe70a2aso1531525b3a.0
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 02:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681463089; x=1684055089;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JUqFIhPEWvAitlRXZn2F40L9xCZoebzuGuWNo2ecOmg=;
 b=zEv1wJc4PiEjUxSDt3bTujCrwgTGF0F/njcNBuktuVsGp8IAqZcGG6eO158klEqqw5
 2+S7ZZ7P2DoJSvSTJcA9BYh1NxZJzVEzH4F/uMV3cixyZRDpmygy8zkPHsehU8oM4in1
 61CpgAMHyad77w1hNGBanvDlh+BGLn0ZFb/8Ha7P2HyeJybQqQao8R2h9yCU+hE3umls
 iuFYWvOGzrLmYzo6/sZAXZTWF57M2V4/FRpPFVZeYtevk3fxwxFTcHSLKSvGr0g6MTsB
 Fjop0nqaMEbSCa5ZwvZ0qz8BmVD6bU7/pWRiXgx5DRWIJGSKjKXGjtdi3wwLZZlh7faa
 +wsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681463089; x=1684055089;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JUqFIhPEWvAitlRXZn2F40L9xCZoebzuGuWNo2ecOmg=;
 b=UMaZeQNnEZeyTaKmrW/g8tFzBPqb7ESk5CcQwHqf2kQ4uoc9nWij3X6EBmjrpxHmOj
 iwiw/FcSx+/MBlU9nFR/NnPmh/MRJW+22vN26bb2yL0EuMRO8GfgKpFtuwHBHMvCphHR
 MAhKE5STYIMF50KNuGc4x0J9zulVmYkjdL3quiqGvssYNj+Wo6fIQZAWsRydN9SfsxOi
 JxS5FxanfXCZyszcMEGajdNNVbgq8XTJ5jV6Qze2RFUZvrYw0ke0d6pLKhSYoWifLeVS
 PGa4L8mDWQuM7nxD8HayfgOlI4OXiJs0HMHW/u1FqfoofFpYZN4Gj3JzE0FYjfsjdkyi
 WKpw==
X-Gm-Message-State: AAQBX9fPa3Dy59TX8Qv+auLqGrA5nW04maVen44YZpzPUZNN1dqFaGWh
 DUWhk9pymWs4n7qBFIVCsyo9dsBz9eEzwHuJpnU=
X-Google-Smtp-Source: AKy350be6raah/ycZVDDQ/T13Yefufg9nW24MxKbHVGxuWVT4MV3J3Rdq80A/ZJp/Ez1cwkXJurOfQ==
X-Received: by 2002:a05:6a00:c94:b0:63b:5609:3bb5 with SMTP id
 a20-20020a056a000c9400b0063b56093bb5mr6608106pfv.18.1681463089318; 
 Fri, 14 Apr 2023 02:04:49 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 e6-20020aa78246000000b0062e024b5584sm2634017pfn.34.2023.04.14.02.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 02:04:48 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] docs: Remove obsolete descriptions of SR-IOV support
Date: Fri, 14 Apr 2023 18:04:41 +0900
Message-Id: <20230414090441.23156-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::431;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

The documentation used to say there is no device implemented with
SR-IOV, but igb and nvme support SR-IOV today.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 docs/pcie_sriov.txt | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/docs/pcie_sriov.txt b/docs/pcie_sriov.txt
index 11158dbf88..7eff7f2703 100644
--- a/docs/pcie_sriov.txt
+++ b/docs/pcie_sriov.txt
@@ -9,10 +9,7 @@ virtual functions (VFs) for the main purpose of eliminating software
 overhead in I/O from virtual machines.
 
 QEMU now implements the basic common functionality to enable an emulated device
-to support SR/IOV. Yet no fully implemented devices exists in QEMU, but a
-proof-of-concept hack of the Intel igb can be found here:
-
-git://github.com/knuto/qemu.git sriov_patches_v5
+to support SR/IOV.
 
 Implementation
 ==============
-- 
2.40.0


