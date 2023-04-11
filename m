Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5D56DD62B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 11:05:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm9vb-0005oG-Jz; Tue, 11 Apr 2023 05:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pm9vU-0005nT-TG
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 05:04:35 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pm9vR-0005eY-8q
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 05:04:31 -0400
Received: by mail-pl1-x634.google.com with SMTP id q2so12101861pll.7
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 02:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1681203863; x=1683795863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YFDT4cPcspUfv4wKnlZ9EcHB1moeKc/kK0cMlD9Mep0=;
 b=ESodTsMGK2VczGOstPBRA3+1WF1VCRcYRCtI5QRHP1SQReASRVy4WF/m16xnXTJhWU
 3yiV8fp49BlVa3sbkJwNF3BTLseLW1HWmBCBPSBlhP/VZt7+QpOJwL3AM22WCa1YMc/T
 TRlPSPn+tmCsBfJOfVHxg+EMjbkIpXF0QoGMZOfXX8zjIzRWsjR2Qnax3qZPmt4wZyi6
 mli8H45GBBLKAI82eAYux3sFm2DKWxI7TEztv9gYnekPe+b0Jf+O5O/kUhygJ60wyXLL
 Z32X0vjICz7YKy6oaKMQeI55OpX5yAHVjwb4H9xA9C1b/a41gTPD3tfXOMFOAe6PhT8c
 lQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681203863; x=1683795863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YFDT4cPcspUfv4wKnlZ9EcHB1moeKc/kK0cMlD9Mep0=;
 b=VPtZsznz1tXxr44ywltD/AfWJiDkAIAPZBaM+rw+UTdem+eXmk9ePMA91Wc47KhcYe
 O6N0iWK0g83isiyeSE74hskiSFzuN1UTb0weVjrHvxmYTiT99WQTebqGHdmA00F5aHmS
 DQlQ7Wcokmk6IF3HZwbrOE088Y8sMw2vqsLvHFCvi4b+SwLPbgdz372XrxXzDiDiFS+q
 ZwL/O6Pdpg0ADcMmJ+KQI7jkhkxlHM/lxls1nV6T3GEGoiJluYKmPzwtyCSmCBZiovKw
 mM9ZhVY8qy46ET8ZpqNjJhdsVMjjOhAp6FllpN3LRbGnOM90PPh7xycFSVNnRzfd8Kvw
 46aw==
X-Gm-Message-State: AAQBX9cjrDNqQDIVfauIYtFTav44YXh3CkLnsd6Hpyj/CMXonIc+XCPh
 JHdob3Ob3eMP1Tpc9JE+fCqkRGC4FrZMU2s+8FN++Q==
X-Google-Smtp-Source: AKy350azvl88ofdgmpmwoJ1qPsnZOphQeTNoaPxOxM6oxE7uNUB3R3fhu0i4pR0BxAcxKc0JtpUg+A==
X-Received: by 2002:a05:6a20:3546:b0:d7:380b:660 with SMTP id
 f6-20020a056a20354600b000d7380b0660mr11901416pze.3.1681203863058; 
 Tue, 11 Apr 2023 02:04:23 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x23-20020aa793b7000000b00638b13ee6a7sm2927700pff.25.2023.04.11.02.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 02:04:22 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] pcie: Release references of virtual functions
Date: Tue, 11 Apr 2023 18:04:08 +0900
Message-Id: <20230411090408.48366-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

pci_new() automatically retains a reference to a virtual function when
registering it so we need to release the reference when unregistering.

Fixes: 7c0fa8dff8 ("pcie: Add support for Single Root I/O Virtualization (SR/IOV)")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/pcie_sriov.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
index aa5a757b11..76a3b6917e 100644
--- a/hw/pci/pcie_sriov.c
+++ b/hw/pci/pcie_sriov.c
@@ -211,6 +211,7 @@ static void unregister_vfs(PCIDevice *dev)
             error_free(local_err);
         }
         object_unparent(OBJECT(vf));
+        object_unref(OBJECT(vf));
     }
     g_free(dev->exp.sriov_pf.vf);
     dev->exp.sriov_pf.vf = NULL;
-- 
2.40.0


