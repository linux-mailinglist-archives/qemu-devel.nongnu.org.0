Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD9654A8A7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 07:21:50 +0200 (CEST)
Received: from localhost ([::1]:35778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0yzt-0006rS-Mm
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 01:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0yvF-0000h7-OS
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:17:01 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:41511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0yvA-0000zC-QN
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:16:58 -0400
Received: by mail-pf1-x42e.google.com with SMTP id i64so7618764pfc.8
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 22:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4KGR369QU1+tLcugq19QCBCNZU/suug/t00sj2c0vDA=;
 b=x8+Ha8ZdDkvHZPs4/YpI0dkjPrhlnzm8JmFyWAfviaZJG8TMm4CPgplFDYehF2LDpK
 UI5EemnsZiwWYbloFt2aX+V1JPH+t6LEoKEMcR07bBS9JUAPxA7N89hf5gxPTi2Y1Aom
 t2CddBRd9xkfygLAbRQWbOPO6AwnvVD91FoM+n2KsfUagxyR1El0KZSLaOcWAkbwH+R4
 MRRDzDTm7s5bzjSQoENF00AC3nBEte444U5IGse0T9KFk7KN8zW3GwfPFNPZYDB59Wha
 IEgpeWnbiLlgattDjmUFR6xRDdLrEZb5zUb6Z+YAaZ1mFNFNmeCqNc+rFdcqBAw0vPog
 WTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4KGR369QU1+tLcugq19QCBCNZU/suug/t00sj2c0vDA=;
 b=iFYVTWnHcY4Q53bye2QgoQni6xIY2hqiSCFdipGj6TRFTWtSxLsQ/7dVWkRxjNSoat
 iBkbjJXFq2I9UlbV8lA+Nbrm9NI4iH/ybbPaE3mK6EyT5afAsjRNbIqzMLx1rMgYZ1m0
 oqbp+4BhsQTf0YSryin1pr7dX8GJO/HTcvc/N3U58qYwFlfhKmqmkIdVJOdDk9nzdSDg
 xqU7KfOs/hcVr8o9jGiZznwOBSvh3rwP7LwdYtesWXzgmG77JxB+U+e+VRyZVTQSjw3H
 KBI74naGZvkgc5Hk0mW37myUSikZDZDgEfUfulw1UIzqXWRI45VISzMzHWbe6L7D2E7N
 vtzg==
X-Gm-Message-State: AOAM531P2zc4pOxCRD7J1EluPZC4iFydrZFJvzmeRryEPr44reQxGbAd
 PWIDVnjAj0+eM44e5ZrldpSc
X-Google-Smtp-Source: ABdhPJy6AUlNX93kZyltpJBqEBw1FJo9TKyJJHrNGToi+Wz7XFqgA/aBWCntt+GQbGR7ouhdmC/Jag==
X-Received: by 2002:a63:6cc8:0:b0:3fa:387b:3991 with SMTP id
 h191-20020a636cc8000000b003fa387b3991mr2897112pgc.19.1655183814897; 
 Mon, 13 Jun 2022 22:16:54 -0700 (PDT)
Received: from localhost ([139.177.225.237]) by smtp.gmail.com with ESMTPSA id
 19-20020a170902e9d300b001677841e9c2sm6111467plk.119.2022.06.13.22.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 22:16:54 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com,
	stefanha@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] Some fixes and improvements for vduse-blk
Date: Tue, 14 Jun 2022 13:15:26 +0800
Message-Id: <20220614051532.92-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=xieyongji@bytedance.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Patch 1 fixes some compile errors with clang in 32-bit machine.

Patch 2 fixes resources leak when vduse fd is zero.

Patch 3, 4 fixes two bugs which could be triggered
by force deleting a vduse-blk export with high I/O loads.

Patch 5, 6 adds two new options for vduse-blk export.

V1 to V2:
- Add a patch to fix some compile errors with clang

Xie Yongji (6):
  libvduse: Fix some compile errors with clang
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
 subprojects/libvduse/libvduse.c      | 27 +++-----------
 7 files changed, 67 insertions(+), 44 deletions(-)

-- 
2.20.1


