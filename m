Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B569A32739A
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 18:18:28 +0100 (CET)
Received: from localhost ([::1]:40424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGPi2-0002mP-A5
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 12:18:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lGPay-0006fb-5E; Sun, 28 Feb 2021 12:11:04 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:40911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lGPaD-0004Ie-CI; Sun, 28 Feb 2021 12:11:03 -0500
Received: by mail-pf1-x430.google.com with SMTP id d12so7340127pfo.7;
 Sun, 28 Feb 2021 09:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x3cDzbIStRMW6V0agMrYTRj5IZRspBrCAm0sfp6Vbl4=;
 b=PL9HTz54tIVNvLifWh9flQ6lalEdw4ZwVFybuP5g1lV+IQmzb4urvATnJi09yRXghN
 IK/+FUy8QXp48z8mLkICuY4CloTjYT6qXlmTczY3tge3XrapvBpueI3uZRtyf4ujWp+n
 CsFEeahj3pkf3Wvhx8lvWQZqRz2F2u+0WYwLmnB2nHBxHZ6d+IhdYhxfP0isej1nSfXj
 BhKsSVLU+iviQYmMY3IEh+NsWAYX1W5kv4e0vWxxNxewXgE1JuWg0zNQPNr78pVH+OOp
 My3dKL20BCJYjnT/CQavKVskjRivj0ndo9vip++2MI9BEtDM5YPE/hmNvlhosMzSor4O
 Jkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x3cDzbIStRMW6V0agMrYTRj5IZRspBrCAm0sfp6Vbl4=;
 b=nsFMtzipn7mTAhXWSVt8dpWjhPJVmxbBPZaftrdam6PIphuMQ/ISG7Jodm0wZGRvKt
 9iM/UTBGK/7kIY9cAC3HudAFSYC9vvRxy/zNuCVjJPuJ/pn8B6+RRA+NiSORLL30mo9R
 nalewBqVUrAzeKyijCUlfyu1BdUtNCZJvA3b2aBepbjeOcrQkWqZswdkEBHyP8uzi+W1
 9Hp6F7yWDJmZXoJkaza5PcNKUuy2qL7fg8cu5kONBiqa05ag50f/gohNV+L2SRNYVeGz
 yCzpRtpxf+oJ22THOmhd2chj+LRj5pEGmyG7G7IwjNNadAfz5m3tJPjYbmB+0NxgccDH
 zFBQ==
X-Gm-Message-State: AOAM533J4TqwKucFq7kjUVPOuCkJvabkLHbEsyBzHY9rSW0tkcodsBuR
 G465ubpb/ZUw+vYCDWC+GseIASBow5ONZA==
X-Google-Smtp-Source: ABdhPJyIfyu2SWAzK2y+dymIf7igmZColDvi048mxh/Wcy93a2hyHejnkPiYoaFS+uM+ridIkfXEYw==
X-Received: by 2002:a17:902:c1c5:b029:e3:eec2:98e6 with SMTP id
 c5-20020a170902c1c5b02900e3eec298e6mr11347204plc.22.1614528667811; 
 Sun, 28 Feb 2021 08:11:07 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x11sm14389781pja.46.2021.02.28.08.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 08:11:07 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V3 0/8] hw/block/nvme: support namespace attachment
Date: Mon,  1 Mar 2021 01:10:52 +0900
Message-Id: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x430.google.com
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
the third version of series with fixing command events and asynchronous
events based on Keith's review.

Since command effects for the namespace attachment command is added in
this version, we no longer need to rescan controller after namespace
attachment command.  Kernel will rescan the controller namespaces after
the command successfully done through passthru.

Please review.

Thanks,

Since V2:
  - Added command effects (namespace inventory changed) for namespace
    attach command.  (Keith)
  - Added [7/8] patch to support asynchronus event when namespace
    inventory is updated.  (Keith)
  - Added review and tested tag from Klaus to all the patches, but [6/8]
    and [7/8].

Since V1:
  - Fix to take 'ctrl' which is given from the command rather than 'n'.
    (Klaus)
  - Add a [7/7] patch to support CNS 12h Identify command (Namespace
    Attached Controller list).

Minwoo Im (8):
  hw/block/nvme: support namespace detach
  hw/block/nvme: fix namespaces array to 1-based
  hw/block/nvme: fix allocated namespace list to 256
  hw/block/nvme: support allocated namespace type
  hw/block/nvme: refactor nvme_select_ns_iocs
  hw/block/nvme: support namespace attachment command
  hw/block/nvme: support changed namespace asyncrohous event
  hw/block/nvme: support Identify NS Attached Controller List

 hw/block/nvme-ns.c     |   1 +
 hw/block/nvme-ns.h     |   1 +
 hw/block/nvme-subsys.h |  28 +++-
 hw/block/nvme.c        | 287 ++++++++++++++++++++++++++++++++++++-----
 hw/block/nvme.h        |  40 ++++++
 hw/block/trace-events  |   3 +
 include/block/nvme.h   |  14 ++
 7 files changed, 338 insertions(+), 36 deletions(-)

-- 
2.25.1


