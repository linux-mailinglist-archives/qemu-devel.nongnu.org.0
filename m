Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9405D2FBD71
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:23:19 +0100 (CET)
Received: from localhost ([::1]:51156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uis-0002SC-KX
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1uOF-0007rg-T4; Tue, 19 Jan 2021 12:01:59 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:43586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1uOD-0003Dy-Qu; Tue, 19 Jan 2021 12:01:59 -0500
Received: by mail-pf1-x42a.google.com with SMTP id q131so2260879pfq.10;
 Tue, 19 Jan 2021 09:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=uo423cC/Ay08WeYtLfiOKPmLTER+XsVVhy6FqQurAys=;
 b=usfRrVaafCAs5RJWmtQACoRU461FYop+MrXF3grMm3d5DgdfhJBlDOhbeNtCaHeQAC
 93ZiyzT+3EHT+q4JGuTu71aatiToL/UArutRj2XhfQk8Fxc2jZ4NBQpBlzxUYNOf3/LG
 d8tWiZpao3CB6HKAmU9N7sKqkUN15xTNN1pkdI1mhzKMcIo6ICdmKt/Go/hA0xqQ4eFw
 cm7f49QLT+CWdnyctNw7YKuVLZuNJwOTMUNRN4b2zTp1VA5IL32PMJhRzRsS8mCLVq0M
 6gTlsY/4M5UaUbsl+snuXtUfj9nur6fzFgwr4YfjELf49yCFJsM9LwgQyPVWdhJFXy28
 7T3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uo423cC/Ay08WeYtLfiOKPmLTER+XsVVhy6FqQurAys=;
 b=s8KxcgdjmBVkYjU5n/z3BgH8nn8YVKbsc3Hxxy7nMV/jt+VLeqZq7koQ4FLuE3xsNR
 Hc813wkYwi4gfxjMCFa5lyluuCT3dzkF3Hg8REk4117chcViPHMJKq+iYiAOgHaERlRa
 4H9eYpRi2L0KEDDeDn2AYkIByPYUgcaPPWQ3VlheTCBUCej6a89CAehV3J5HaUw8tMFo
 8ytg+DrRw4mrQjVou7InF4Ajb3+aC4+Mqt4OMtGmgx59xMujwHkmHfOX7PVklWA0MGqZ
 s4W8OSuI4pi5SZ5s649sFB76tVLSXHRIFfFRkUhQFYh+cXPndGbZ5qbAYWGIcpeA1V1u
 jVhw==
X-Gm-Message-State: AOAM532snlRqJOdGYi1D7RFuVLtowXcT1JfhIIExyXw03rfkojfbH0kM
 XEUHayaX4VyNQHSynZ0/guAY0HI40sQjpA==
X-Google-Smtp-Source: ABdhPJzOj/JVor3Rsq4Uigpec/h25p8xb7nSvWYy0BsZD1fYGeQm6QTLlTKZgs9+0COW346d/sd3Ew==
X-Received: by 2002:aa7:8b05:0:b029:1aa:122b:4368 with SMTP id
 f5-20020aa78b050000b02901aa122b4368mr5095904pfd.25.1611075715433; 
 Tue, 19 Jan 2021 09:01:55 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id m4sm19396001pgv.16.2021.01.19.09.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:01:54 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH V3 0/8] hw/block/nvme: support multi-path for ctrl/ns
Date: Wed, 20 Jan 2021 02:01:39 +0900
Message-Id: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x42a.google.com
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

This patch series is third one to support multi-controller and namespace
sharing in multi-path.  This series introduced subsystem scheme to
manage controller(s) and namespace(s) in the subsystem.

This series has new patches from the V2:  'detached' parameter has been
added to the nvme-ns device.  This will decide whether to attach the
namespace to controller(s) in the current subsystem or not.  If it's
given with true, then it will be just allocated in the subsystem, but
not attaching to any controllers in the subsystem.  Otherwise, it will
automatically attach to all the controllers in the subsystem.  The other
t hing is that the last patch implemented Identify Active Namespace ID
List command handler apart from the Allocated Namespace ID List.

Run with:
  -device nvme,serial=qux,id=nvme3
  -device nvme-ns,id=ns3,drive=drv12,nsid=3,bus=nvme3

  -device nvme-subsys,id=subsys0
  -device nvme,serial=foo,id=nvme0,subsys=subsys0
  -device nvme,serial=bar,id=nvme1,subsys=subsys0
  -device nvme,serial=baz,id=nvme2,subsys=subsys0
  -device nvme-ns,id=ns1,drive=drv10,nsid=1,subsys=subsys0,detached=true
  -device nvme-ns,id=ns2,drive=drv11,nsid=2,bus=nvme2

nvme-cli:
  root@vm:~/work# nvme list -v                                                                                                      
  NVM Express Subsystems                                                                                                 
                                                                                                                                     
  Subsystem        Subsystem-NQN                                                                                    Controllers
  ---------------- ------------------------------------------------------------------------------------------------ ----------------
  nvme-subsys0     nqn.2019-08.org.qemu:qux                                                                         nvme0
  nvme-subsys1     nqn.2019-08.org.qemu:subsys0                                                                     nvme1, nvme2, nvme3
                                                                                                                                   
  NVM Express Controllers                                                                                           
                                                                                                                  
  Device   SN                   MN                                       FR       TxPort Address        Subsystem    Namespaces
  -------- -------------------- ---------------------------------------- -------- ------ -------------- ------------ ----------------
  nvme0    qux                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:06.0   nvme-subsys0
  nvme1    foo                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:07.0   nvme-subsys1
  nvme2    bar                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:08.0   nvme-subsys1
  nvme3    baz                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:09.0   nvme-subsys1 nvme1n1
                                                                                  
  NVM Express Namespaces                                                 
                                                                       
  Device       NSID     Usage                      Format           Controllers
  ------------ -------- -------------------------- ---------------- ----------------
  nvme0n1      3        268.44  MB / 268.44  MB    512   B +  0 B   nvme0
  nvme1n1      2        268.44  MB / 268.44  MB    512   B +  0 B   nvme3

Now we have [allocated|not-allocated]/[attached/detached] scheme for
namespaces and controllers.  The next series is going to be to support
namespace management and attachment with few Identify command handlers.

Please review.

Thanks!

Since RFC V2:
  - Rebased on nvme-next branch with trivial patches from the previous
    version(V2) applied. (Klaus)
  - Fix enumeration type name convention with NvmeIdNs prefix. (Klaus)
  - Put 'cntlid' to NvmeCtrl instance in nvme_init_ctrl() which was
    missed in V2.
  - Added 'detached' parameter to nvme-ns device to decide whether to
    attach or not to controller(s) in the subsystem. (Klaus)
  - Implemented Identify Active Namespace ID List aprt from Identify
    Allocated Namespace ID List by removing fall-thru statement.

Since RFC V1:
  - Updated namespace sharing scheme to be based on nvme-subsys
    hierarchy.

Minwoo Im (8):
  hw/block/nvme: introduce nvme-subsys device
  hw/block/nvme: support to map controller to a subsystem
  hw/block/nvme: add CMIC enum value for Identify Controller
  hw/block/nvme: support for multi-controller in subsystem
  hw/block/nvme: add NMIC enum value for Identify Namespace
  hw/block/nvme: support for shared namespace in subsystem
  hw/block/nvme: add 'detached' param not to attach namespace
  hw/block/nvme: Add Identify Active Namespace ID List

 hw/block/meson.build   |   2 +-
 hw/block/nvme-ns.c     |  32 ++++++++--
 hw/block/nvme-ns.h     |  13 ++++
 hw/block/nvme-subsys.c | 111 +++++++++++++++++++++++++++++++++
 hw/block/nvme-subsys.h |  32 ++++++++++
 hw/block/nvme.c        | 137 ++++++++++++++++++++++++++++++++++++++---
 hw/block/nvme.h        |  19 ++++++
 include/block/nvme.h   |   8 +++
 8 files changed, 340 insertions(+), 14 deletions(-)
 create mode 100644 hw/block/nvme-subsys.c
 create mode 100644 hw/block/nvme-subsys.h

-- 
2.17.1


