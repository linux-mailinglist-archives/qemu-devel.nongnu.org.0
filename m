Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E945A316ACC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 17:12:29 +0100 (CET)
Received: from localhost ([::1]:34722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9s6O-0000vm-Uc
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 11:12:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9s3q-0007dt-JR; Wed, 10 Feb 2021 11:09:50 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:41752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9s3o-0000Ap-Qf; Wed, 10 Feb 2021 11:09:50 -0500
Received: by mail-pg1-x52f.google.com with SMTP id t11so1514397pgu.8;
 Wed, 10 Feb 2021 08:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=PNRArwPYGIO8NpJsY8cyou3J0Bjk1ZVE3WuTsMX6f58=;
 b=bRjXzGhLll+l/VD7dPK4AtMLugeGZaM//S+KtsHq02TR3bitzhnY59cSimifWDYBMa
 lybTyfjJNFcT3J0cEkkGTQVRUVomwjn+FI4ksOVtave+2xCxBMi0dyco//s0OXj42rNX
 yDUBy9c7Y252qCuiVTHeAr8h5uGuVMAEtwhv9Asd7Ta8PlJ+WUCeb0R/nem8qQiLy1w9
 MUK5JzgxeImWpQ1q6DDa2y/W8+/UiE/NdjfNgAK2s+sNeaxnZSX0LStgtyj/XB5z+YOF
 6EHq+AdpSyTRVU5nemHUmlZ/WRfPYxvr/HZ9i17hYMunQSW9N21qn2ufaB1YnD2BbZ+V
 S3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PNRArwPYGIO8NpJsY8cyou3J0Bjk1ZVE3WuTsMX6f58=;
 b=joNXREf6VwzTYImNJCwJda85neyn2W6dqv+xFQmEYKsGNmdEN4lSnl/rS5dzgyQPYs
 N/dqUMnh4BXA0JebPamtCddr3g+zul5yKhp3a0pM/NwiAOYw0DCB81x4R/RG3GWCb2dU
 9rrA4HXgKWu+gxrVeq3+jhsMEJQO3DkM7a6fC4C3nSrTs4GYj6twzA7atQrx8Le8izsc
 Gq3MvjS6RaRBhKKSwKriMrLg352bUl7F6XpiAFuvcl3X/2TY6xWvGzeRgRALZVEB2sxD
 TF6Mrj9tEhJono5BRt5kDe0eBm4Ag95rlz4NMI7NDaITczvtmJoG5d2AWmfoegtB+bIC
 NkhA==
X-Gm-Message-State: AOAM53315/A2XihXKye9FEmBAhHtlZn+kV0Hsd7lYmQ066GjuFHRKqNo
 ZlF4vvcDXFSGmFit1NsQHrWIRuZOn/D9bg==
X-Google-Smtp-Source: ABdhPJxHt82Q9XxlnY45tvmdctYYcpqlXq4WDK7RQjOopv3J8LsWq7QFpx9/qqbC+yR2QnZ8xOwIwQ==
X-Received: by 2002:a63:d506:: with SMTP id c6mr3716246pgg.77.1612973386665;
 Wed, 10 Feb 2021 08:09:46 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id 25sm2761195pfj.120.2021.02.10.08.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 08:09:45 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V2 0/6] hw/block/nvme: support namespace attachment
Date: Thu, 11 Feb 2021 01:09:30 +0900
Message-Id: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x52f.google.com
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

This series supports namespace attachment: attach and detach.  This is
the second version series with a fix a bug on choosing a controller to
attach for a namespace in the attach command handler.

Since V1:
  - Fix to take 'ctrl' which is given from the command rather than 'n'.
    (Klaus)
  - Add a [7/7] patch to support CNS 12h Identify command (Namespace
    Attached Controller list).

This series has been tested with the following: (!CONFIG_NVME_MULTIPATH)

  -device nvme-subsys,id=subsys0 \
  -device nvme,serial=foo,id=nvme0,subsys=subsys0 \
  -device nvme,serial=bar,id=nvme1,subsys=subsys0 \
  -device nvme-ns,id=ns1,drive=drv0,nsid=1,subsys=subsys0,zoned=false \
  -device nvme-ns,id=ns2,drive=drv1,nsid=2,subsys=subsys0,zoned=true \
  -device nvme-ns,id=ns3,drive=drv2,nsid=3,subsys=subsys0,detached=true,zoned=false \
  -device nvme-ns,id=ns4,drive=drv3,nsid=4,subsys=subsys0,detached=true,zoned=true \

  root@vm:~/work# nvme list
  Node                  SN                   Model                                    Namespace Usage                      Format           FW Rev
  --------------------- -------------------- ---------------------------------------- --------- -------------------------- ---------------- --------
  /dev/nvme0n1          foo                  QEMU NVMe Ctrl                           1         268.44  MB / 268.44  MB    512   B +  0 B   1.0
  /dev/nvme0n2          foo                  QEMU NVMe Ctrl                           2         268.44  MB / 268.44  MB    512   B +  0 B   1.0
  /dev/nvme1n1          bar                  QEMU NVMe Ctrl                           1         268.44  MB / 268.44  MB    512   B +  0 B   1.0
  /dev/nvme1n2          bar                  QEMU NVMe Ctrl                           2         268.44  MB / 268.44  MB    512   B +  0 B   1.0
  root@vm:~/work# nvme attach-ns /dev/nvme0 --namespace-id=3 --controllers=0,1
  attach-ns: Success, nsid:3
  root@vm:~/work# echo 1 > /sys/class/nvme/nvme0/rescan_controller 
  root@vm:~/work# echo 1 > /sys/class/nvme/nvme1/rescan_controller 
  root@vm:~/work# nvme list
  Node                  SN                   Model                                    Namespace Usage                      Format           FW Rev  
  --------------------- -------------------- ---------------------------------------- --------- -------------------------- ---------------- --------
  /dev/nvme0n1          foo                  QEMU NVMe Ctrl                           1         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme0n2          foo                  QEMU NVMe Ctrl                           2         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme0n3          foo                  QEMU NVMe Ctrl                           3         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme1n1          bar                  QEMU NVMe Ctrl                           1         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme1n2          bar                  QEMU NVMe Ctrl                           2         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme1n3          bar                  QEMU NVMe Ctrl                           3         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  root@vm:~/work# nvme detach-ns /dev/nvme0 --namespace-id=3 --controllers=0
  detach-ns: Success, nsid:3
  root@vm:~/work# echo 1 > /sys/class/nvme/nvme0/rescan_controller 
  root@vm:~/work# nvme list
  Node                  SN                   Model                                    Namespace Usage                      Format           FW Rev  
  --------------------- -------------------- ---------------------------------------- --------- -------------------------- ---------------- --------
  /dev/nvme0n1          foo                  QEMU NVMe Ctrl                           1         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme0n2          foo                  QEMU NVMe Ctrl                           2         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme1n1          bar                  QEMU NVMe Ctrl                           1         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme1n2          bar                  QEMU NVMe Ctrl                           2         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme1n3          bar                  QEMU NVMe Ctrl                           3         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  root@vm:~/work# nvme detach-ns /dev/nvme0 --namespace-id=1 --controllers=1
  detach-ns: Success, nsid:1
  root@vm:~/work# echo 1 > /sys/class/nvme/nvme1/rescan_controller 
  root@vm:~/work# nvme list
  Node                  SN                   Model                                    Namespace Usage                      Format           FW Rev  
  --------------------- -------------------- ---------------------------------------- --------- -------------------------- ---------------- --------
  /dev/nvme0n1          foo                  QEMU NVMe Ctrl                           1         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme0n2          foo                  QEMU NVMe Ctrl                           2         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme1n2          bar                  QEMU NVMe Ctrl                           2         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme1n3          bar                  QEMU NVMe Ctrl                           3         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  root@vm:~/work# nvme attach-ns /dev/nvme0 --namespace-id=1 --controllers=1
  attach-ns: Success, nsid:1
  root@vm:~/work# echo 1 > /sys/class/nvme/nvme1/rescan_controller 
  root@vm:~/work# nvme list
  Node                  SN                   Model                                    Namespace Usage                      Format           FW Rev  
  --------------------- -------------------- ---------------------------------------- --------- -------------------------- ---------------- --------
  /dev/nvme0n1          foo                  QEMU NVMe Ctrl                           1         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme0n2          foo                  QEMU NVMe Ctrl                           2         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme1n1          bar                  QEMU NVMe Ctrl                           1         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme1n2          bar                  QEMU NVMe Ctrl                           2         268.44  MB / 268.44  MB    512   B +  0 B   1.0     
  /dev/nvme1n3          bar                  QEMU NVMe Ctrl                           3         268.44  MB / 268.44  MB    512   B +  0 B   1.0     

Minwoo Im (7):
  hw/block/nvme: support namespace detach
  hw/block/nvme: fix namespaces array to 1-based
  hw/block/nvme: fix allocated namespace list to 256
  hw/block/nvme: support allocated namespace type
  hw/block/nvme: refactor nvme_select_ns_iocs
  hw/block/nvme: support namespace attachment command
  hw/block/nvme: support Identify NS Attached Controller List

 hw/block/nvme-ns.c     |   1 +
 hw/block/nvme-ns.h     |   1 +
 hw/block/nvme-subsys.h |  28 ++++-
 hw/block/nvme.c        | 241 +++++++++++++++++++++++++++++++++++------
 hw/block/nvme.h        |  33 ++++++
 hw/block/trace-events  |   3 +
 include/block/nvme.h   |   6 +
 7 files changed, 278 insertions(+), 35 deletions(-)

-- 
2.17.1


