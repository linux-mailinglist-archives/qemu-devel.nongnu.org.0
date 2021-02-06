Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB5C311A43
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 04:38:57 +0100 (CET)
Received: from localhost ([::1]:55506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8EQx-0007O6-NR
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 22:38:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l8EOo-0005kk-AY; Fri, 05 Feb 2021 22:36:42 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l8EOm-0003ft-NF; Fri, 05 Feb 2021 22:36:41 -0500
Received: by mail-pg1-x531.google.com with SMTP id c132so5907727pga.3;
 Fri, 05 Feb 2021 19:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=V/pD/0XYScVzvMTD3FqLPH2JIilE0tR0n8cTEpx1Qb8=;
 b=jaUF8wJ5Eh1TvGvtp+I+w9OV5W6KtccYGJdbv67LTtmn4ZD/qo4GaNMwX94/9fdeQJ
 0UvIiS7XqHVyg5oGZKly0L5sho1D2iNwH1MgsDKuxvvrSKTHUiaMC3ZH4VtMihvCw0ry
 Iy+5xK3pV8+9Q1yYEthHCsRD0XcKmpMRSUsWUfZcpmJH7zzpKYYgIUIDfbqvSe81YV2g
 /IVG6QfoOmL8pe7ZNOUukYI6gXuTgsyf9ob/OqQCyVC+GFyxUtE0tLAzpQORVXd/kuLU
 UEqx0gnJmRxw8LGVhn0/ZVbF3vN89BoGo+h3T1N2aToMsvkMrX1BVS6e4exhkPD7BLPF
 P2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=V/pD/0XYScVzvMTD3FqLPH2JIilE0tR0n8cTEpx1Qb8=;
 b=ETO+OQyHbbXjmbPZpWfXgQgmxq+8bKi0tu+d5trrusd6jwC+JSnqVgxg24ZsnvhuU4
 Or9PMOW9vnWIYdw1Wp86hQBebRtGRKHDsu2W+TIFtOJqUQkZNegQK7cNxHgax8eRshhW
 rcjOwLJ/G5+thFEM+3LrG0+YLUdU4WXch/il1oP+yrpKPotEA1cwHdTaC67wallWRoom
 GcdsGi4hOl9iz/+u9jeNEwPr1SXAAN0MKVzD3Z0sUbllrQSiNK9U6nux90BPMhmWpxfc
 m2obRsfFCO8O8b1YxV7t8PAvDDz/DHhE9n90aItndK0DwirkVIZqPYFvmlwiXyBlGYCV
 hs1g==
X-Gm-Message-State: AOAM530i3iKU+X8vGNCJLQLT+bJ9+vOe7aVXMqldQpPTYIGKevyq8+bV
 qllQ92zoUH3plnjwF4p3YdTHZ2CIV3IqfA==
X-Google-Smtp-Source: ABdhPJwSIvAq/CaqUNcIqk1ydY0BdpU8J3/rWybQ0ZrKlaBZ3IsK2h7oKsevQ/mcoczkexF2M1PQxQ==
X-Received: by 2002:a63:dc56:: with SMTP id f22mr7484554pgj.106.1612582598656; 
 Fri, 05 Feb 2021 19:36:38 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id j17sm10862375pfh.183.2021.02.05.19.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 19:36:38 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH 0/6] hw/block/nvme: support namespace attachment
Date: Sat,  6 Feb 2021 12:36:23 +0900
Message-Id: <20210206033629.4278-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This series supports namespace attachment: attach and detach.  It means
that this series also introduced a scheme for allocated namespace which
is detached, but allocated in a NVMe subsystem.  Given that now we have
nvme-subsys device to specify a NVMe subsystem, it can manage detached
namespaces from controllers in the subsystem itself.

Tested:

  -device nvme-subsys,id=subsys0 \                                                    
  -device nvme,serial=foo,id=nvme0,subsys=subsys0 \                                   
  -device nvme-ns,id=ns1,drive=drv0,nsid=1,subsys=subsys0,zoned=false \              
  -device nvme-ns,id=ns2,drive=drv1,nsid=2,subsys=subsys0,zoned=true \               
  -device nvme-ns,id=ns3,drive=drv2,nsid=3,subsys=subsys0,detached=true,zoned=false \
  -device nvme-ns,id=ns4,drive=drv3,nsid=4,subsys=subsys0,detached=true,zoned=true \ 

  root@vm:~# nvme list
  Node                  SN                   Model                                    Namespace Usage                      Format           FW Rev
  --------------------- -------------------- ---------------------------------------- --------- -------------------------- ---------------- --------
  /dev/nvme0n1          foo                  QEMU NVMe Ctrl                           1         268.44  MB / 268.44  MB    512   B +  0 B   1.0
  /dev/nvme0n2          foo                  QEMU NVMe Ctrl                           2         268.44  MB / 268.44  MB    512   B +  0 B   1.0

  root@vm:~# nvme attach-ns /dev/nvme0 --namespace-id=3 --controllers=0
  attach-ns: Success, nsid:3
  root@vm:~# nvme attach-ns /dev/nvme0 --namespace-id=4 --controllers=0
  attach-ns: Success, nsid:4
  root@vm:~# echo 1 > /sys/class/nvme/nvme0/rescan_controller

  root@vm:~# nvme list
  Node                  SN                   Model                                    Namespace Usage                      Format           FW Rev  
  --------------------- -------------------- ---------------------------------------- --------- -------------------------- ---------------- --------
  /dev/nvme0n1          foo                  QEMU NVMe Ctrl                           1         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme0n2          foo                  QEMU NVMe Ctrl                           2         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme0n3          foo                  QEMU NVMe Ctrl                           3         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme0n4          foo                  QEMU NVMe Ctrl                           4         268.44  MB / 268.44  MB    512   B +  0 B   1.0     

  root@vm:~# nvme detach-ns /dev/nvme0 --namespace-id=3 --controllers=0
  detach-ns: Success, nsid:3
  root@vm:~# nvme detach-ns /dev/nvme0 --namespace-id=4 --controllers=0
  detach-ns: Success, nsid:4
  root@vm:~# echo 1 > /sys/class/nvme/nvme0/rescan_controller

  root@vm:~# nvme list
  Node                  SN                   Model                                    Namespace Usage                      Format           FW Rev  
  --------------------- -------------------- ---------------------------------------- --------- -------------------------- ---------------- --------
  /dev/nvme0n1          foo                  QEMU NVMe Ctrl                           1         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme0n2          foo                  QEMU NVMe Ctrl                           2         268.44  MB / 268.44  MB    512   B +  0 B   1.0     

Thanks,

Minwoo Im (6):
  hw/block/nvme: support namespace detach
  hw/block/nvme: fix namespaces array to 1-based
  hw/block/nvme: fix allocated namespace list to 256
  hw/block/nvme: support allocated namespace type
  hw/block/nvme: refactor nvme_select_ns_iocs
  hw/block/nvme: support namespace attachment command

 hw/block/nvme-ns.c     |   1 +
 hw/block/nvme-ns.h     |   1 +
 hw/block/nvme-subsys.h |  28 +++++-
 hw/block/nvme.c        | 199 ++++++++++++++++++++++++++++++++++-------
 hw/block/nvme.h        |  33 +++++++
 hw/block/trace-events  |   2 +
 include/block/nvme.h   |   5 ++
 7 files changed, 234 insertions(+), 35 deletions(-)

-- 
2.17.1


