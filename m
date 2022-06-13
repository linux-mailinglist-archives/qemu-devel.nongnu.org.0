Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46930548556
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 14:58:43 +0200 (CEST)
Received: from localhost ([::1]:39120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0jeU-0006uY-C2
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 08:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0jRR-0002zy-QA
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:45:14 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:46596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0jRJ-0005rK-Su
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:45:10 -0400
Received: by mail-pf1-x42b.google.com with SMTP id j6so5615468pfe.13
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 05:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6mySNvkddTmlsN4VbfGkDcF9wbGP2DIWCXu//uBTW9Q=;
 b=D97pr02NnRcejZTjFNnkkJVYNRSjpBIFGGSbYYCb1dLu1T6vSlqK+eMfwmaRejAEwZ
 S7gegxn1WvCHOMH9WTYrx3XAxFs7uUx6K1bf8UVW7AnWgKWYV8RPPE/Un6cL5ltcDYEJ
 yWHU637S/2UrOGv+7XeI+QEeVMOL0XAlFT7LG1Wj8LPAA3RodAFGVDyJg4kkHyXkjAuJ
 LmmXuCZuJZHNwWDP8xXQjBUyurSn0KC4LAPJv4wpiHHkmGoiefq7qJ4pErqgcU3iE+8I
 mzCxEX3D1vpWsH5kwpNPRf5FNMSwxRK3g1cqF4+lL7UBNi7SGOXMDbrN6BZL1nKpOorB
 BvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6mySNvkddTmlsN4VbfGkDcF9wbGP2DIWCXu//uBTW9Q=;
 b=kglVnupO8UiKRsV1ePiS8zB6QzU6XU9LEk7u1swbeg6DeggIUFiFE7bTyJeh9rBfoc
 vKAJ2sCfwNFBXTRr612GmMWzLWlb91y/2hgp9Y3kgP78j8/PbL4Or0thdr/HND+BWN+w
 e6DLvmvm8avjmM+fVJRyrwRGmekdRvySAeZonsPGUB8TTJ9m2v0atl637oxSpCrMdFgy
 9Ndgb8X1/ehi57XL6/rqNs3+7WMufb5t4t1b/V6oReNr27s+708YxuSNDfxGBkQFXW8R
 pn6p//q1l54jZdXI2SBunXlJMf1Ls5KNG8TB2Bm1DsOepZYP3bGYLkwXv7x0MbxPUpng
 LtbQ==
X-Gm-Message-State: AOAM5305rMcRf90UL5K6Z2dukTHdtFGgpHcC66Q4jeP6ur2RiTKMNAtO
 DYcqhlrbiUSTv6MC3bSEIFnS
X-Google-Smtp-Source: ABdhPJy9DeIiN0txTXJF4WCqriwm++NTfERtgNDuDTV+KiK/Ljuygw8kvKY9/BZTi4o0osZ7Yvzjxg==
X-Received: by 2002:a65:6d1a:0:b0:3fb:2109:7b87 with SMTP id
 bf26-20020a656d1a000000b003fb21097b87mr52265689pgb.127.1655124301950; 
 Mon, 13 Jun 2022 05:45:01 -0700 (PDT)
Received: from localhost ([139.177.225.252]) by smtp.gmail.com with ESMTPSA id
 k9-20020a056a00134900b0051bb0be7109sm5313442pfu.78.2022.06.13.05.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:45:00 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com,
	stefanha@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/5] Some fixes and improvements for vduse-blk
Date: Mon, 13 Jun 2022 20:44:58 +0800
Message-Id: <20220613124503.156-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=xieyongji@bytedance.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This series includes few fixes and improvements for the
vduse-blk export.

Patch 1 fixes resources leak when vduse fd is zero.

Patch 2, 3 fixes two bugs which could be triggered
by force deleting a vduse-blk export with high I/O loads.

Patch 4, 5 adds two new options for vduse-blk export.

Xie Yongji (5):
  libvduse: Fix resources leak in vduse_dev_destroy()
  vduse-blk: Don't unlink the reconnect file if device exists
  vduse-blk: Don't delete the export until all inflight I/Os completed
  vduse-blk: Add serial option
  vduse-blk: Add name option

 block/export/vduse-blk.c             | 53 ++++++++++++++++++++++------
 block/export/vhost-user-blk-server.c |  4 ++-
 block/export/virtio-blk-handler.h    |  2 +-
 docs/tools/qemu-storage-daemon.rst   |  5 +--
 qapi/block-export.json               | 11 +++---
 storage-daemon/qemu-storage-daemon.c |  9 ++---
 subprojects/libvduse/libvduse.c      |  4 +--
 7 files changed, 64 insertions(+), 24 deletions(-)

-- 
2.20.1


