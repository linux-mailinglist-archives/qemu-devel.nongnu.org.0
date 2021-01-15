Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7072F7850
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 13:09:10 +0100 (CET)
Received: from localhost ([::1]:46040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Nuf-00012p-ER
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 07:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0Nrw-0007xk-Os; Fri, 15 Jan 2021 07:06:23 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:33701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0Nru-0003Uj-HF; Fri, 15 Jan 2021 07:06:20 -0500
Received: by mail-pg1-x52a.google.com with SMTP id n25so5892756pgb.0;
 Fri, 15 Jan 2021 04:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=pBIqptvFlrfxRxyZOawwD1xdHCCaWfed+a164+JeQ4M=;
 b=MtZg7/ybkuT60Hmklp+yiVO2odC8fDBQs5w0lkbdFLH3H+E7M+t8UdZ88m6c/GjzMQ
 xJrrvPqkrDMOx9HtPCvRD/GZLZ8smsbAKbbI7qAJpT0+pORqa6eqx2pPHuuZYXkb7bQi
 tgn7ekoxOk/uh24hXKg1Lr4OX7ugFlYzSzZXNo2TVzwqYL1C1nRXNRp72iaqdSa8YmBo
 HKgI07ib4NhGVwZD3YhSI9/mtmlZuELXcgHc2Jehi2s1eBHgeuL3/C4PF2fGZBpCkVsS
 NZGKGXi85ZMpsSGeYVQ2UTdaMe05gKZ4aN9aK1JGZPPYfuhtIluYkXZCkgw2P5K2BTfJ
 +C6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pBIqptvFlrfxRxyZOawwD1xdHCCaWfed+a164+JeQ4M=;
 b=fTdRUcpI2FTjMtDWiy8ylUglLy9hrTY0aSX0DuDWeXgd2U5v1MKikfaXYWUWXhuVJw
 x76MCHDX0W92J2UwfYIRJHKxBwWpUtvpHyGayyl1YBY88/l6zriH6Rs8QwDB7D1p0VxF
 cKhdeu64m6cjgKnzaXKryFmaOqE+kMScWt9PUQghRZFTsYZFj1+5Ovjkh3votz+TjzVM
 P3W/ID4QupOpuWHov1P8A+VqPIsZHx8S8DY0rFZHH2lwolU1wCS6L9/fSyFAuC8bpaNt
 asM9O7A49zCsLLIkryWGgwhe7+/g4Ce40NXDl4EZjXiwdSfEFLW66aayaAvxHY+F4LT4
 egfQ==
X-Gm-Message-State: AOAM530lnK+Rt2pkUPXBtISsHz4VKI/va9bYWzKZHtgn8hQKIevjNU2o
 p5TD713E8PEpd2dXfqGiv9Wu4qVEgG9bHg==
X-Google-Smtp-Source: ABdhPJyjFDsmCHzJCeT7R8BCG5c3r0GH5vHwaKmLA+cdd8k+ebK43szEo5N70jKhxrFsndzoCgQbIA==
X-Received: by 2002:a63:3246:: with SMTP id y67mr12258544pgy.438.1610712374991; 
 Fri, 15 Jan 2021 04:06:14 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id a4sm8338161pgn.40.2021.01.15.04.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 04:06:14 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH 0/5] hw/block/nvme: support multi-path for ctrl/ns
Date: Fri, 15 Jan 2021 21:05:53 +0900
Message-Id: <20210115120558.29313-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x52a.google.com
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

This series added support for multi-path I/O with multi-controllers and
namespace sharing.  By supporting these features, we can test Linux
kernel mpath(multi-path) code with this NVMe device.

Patches from the first to third added multi-controller support in a NVM
subsystem by adding a mpath.ctrl parameter to nvme device.  The rest of
the patches added namespace sharing support in a NVM subsystem with two
or more controllers by adding mpath.ns parameter to nvme-ns device.

Multi-path enabled in kernel with this series for two controllers with a
namespace:

  root@vm:~/work# nvme list -v
  NVM Express Subsystems

  Subsystem        Subsystem-NQN                                                                                    Controllers
  ---------------- ------------------------------------------------------------------------------------------------ ----------------
  nvme-subsys0     nqn.2019-08.org.qemu:serial                                                                      nvme0, nvme1

  NVM Express Controllers

  Device   SN                   MN                                       FR       TxPort Address        Subsystem    Namespaces
  -------- -------------------- ---------------------------------------- -------- ------ -------------- ------------ ----------------
  nvme0    serial               QEMU NVMe Ctrl                           1.0      pcie   0000:01:00.0   nvme-subsys0 nvme0n1
  nvme1    serial               QEMU NVMe Ctrl                           1.0      pcie   0000:02:00.0   nvme-subsys0 nvme0n1

  NVM Express Namespaces

  Device       NSID     Usage                      Format           Controllers
  ------------ -------- -------------------------- ---------------- ----------------
  nvme0n1      1        268.44  MB / 268.44  MB    512   B +  0 B   nvme0, nvme1

The reason why I put 'RFC' tag to this series is mostly about the last
patch "hw/block/nvme: add namespace sharing param for mpath".  It seems
like QEMU block backing device does not support to be shared among two
or more -device(s).  It means that we just can't give same drive=
property to multiple nvme-ns devices.  This patch has just let -device
maps to -drive one-to-one(1:1), but if namespae sharing is detected and
setup by the host kernel, then a single block device will be selected
for the NVM subsystem.  I'm not sure this is a good start for this
feature, so I put the RFC tag here.

Please kindly review!

Thanks,

Minwoo Im (5):
  hw/block/nvme: add controller id parameter
  nvme: add CMIC enum value for Identify Controller
  hw/block/nvme: add multi-controller param for mpath
  nvme: add NMIC enum value for Identify Namespace
  hw/block/nvme: add namespace sharing param for mpath

 hw/block/nvme-ns.c   | 14 ++++++++++++--
 hw/block/nvme-ns.h   |  2 ++
 hw/block/nvme.c      | 26 ++++++++++++++++++++++++++
 hw/block/nvme.h      |  2 ++
 include/block/nvme.h |  8 ++++++++
 5 files changed, 50 insertions(+), 2 deletions(-)

-- 
2.17.1


