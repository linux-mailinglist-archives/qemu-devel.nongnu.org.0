Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EE45198A8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 09:49:28 +0200 (CEST)
Received: from localhost ([::1]:60978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm9lH-0006R0-4q
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 03:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nm9cu-0002bl-DH
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:40:50 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:45828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nm9cs-0006yC-7D
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:40:47 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so557181pjh.4
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 00:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1mmuW0WG9pZLriirR2lzZ1R1C9YhJbJYjicDLqi3XII=;
 b=ERVZdtf8yY5V6B8P18j/NDasAVmiopxlBfhiPxaNf1OpmiINSq2UcTPbvRLJyhFDYi
 mZ4ZIYHL2zzFG63tChkO45RkEwKSaja4Gc2m6wXHvnhBM5AIzj7deLPaXOTxBHx5LSJW
 lJ4hVYqaESEqFEZOb3pEZbIVJX7RcSW2Em/H0AGZTTsTCxoGCxEmziwlyykF+uEtFkV/
 ZA/HQbNQZaQRFGFyyPqXae7lX7Aw6uOT6HnAjvSg4TWezUnE5imS7OigLdIfde/6QHW0
 c/LsuBN+ArgAdTJRiJvyfBZswMXNp3oRSmz6ZKG2khnYTiPl4pCcXSfIT1ovedzgCHpT
 ZKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1mmuW0WG9pZLriirR2lzZ1R1C9YhJbJYjicDLqi3XII=;
 b=xVPZrs//wXsXHAtDa3HiuSaA4aBkVzzUj+g7/uZc53wbzG2Bhckmp/RB+CASlT1d2b
 QFYmWxhqzWaI+l0kMVxLFpi1kICE1ZDf5W04FBwtkzpm/3XMfApf+P1/HFcRnquuGwp8
 zyxGFagG6B+r90KivX4V9QL6x6FWfTY3JS6KKZ7ggu0qmN+Xg4b7DEtB2pz7OrTPrlgr
 vNXqKB3Ao4y21jqB/3uocCPCQtI7EfYOmE4T7awBSa3/tGBcKwfi0S8EZJytoIYNDK3Z
 Ic8WQEbX93XeU177E4uCzAvzafzBKnHvRTAfgCq+OpmGGHY3Fjlfc9pnkMycfaOW6A75
 S1Iw==
X-Gm-Message-State: AOAM532YknhrpTDD7qlujmIeioWqtiGCGNx+T9bf/lel0PFrDI6ox2mS
 OUgohsACLrr52qPFky7+q7+I
X-Google-Smtp-Source: ABdhPJzHpsGgC/pyZy/EitP2/C+VFRIGnaJ07CaSKrHkz1H+4s95gYOdLPMe3w7E9TWihksdxqsAPQ==
X-Received: by 2002:a17:90b:314e:b0:1dc:767d:a7ce with SMTP id
 ip14-20020a17090b314e00b001dc767da7cemr9020420pjb.0.1651650044645; 
 Wed, 04 May 2022 00:40:44 -0700 (PDT)
Received: from localhost ([139.177.225.233]) by smtp.gmail.com with ESMTPSA id
 g7-20020a170902d5c700b0015e8d4eb234sm7541000plh.126.2022.05.04.00.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 00:40:44 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com, eblake@redhat.com,
 Coiby.Xu@gmail.com, hreitz@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 2/8] block-backend: Introduce blk_get_guest_block_size()
Date: Wed,  4 May 2022 15:40:45 +0800
Message-Id: <20220504074051.90-3-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504074051.90-1-xieyongji@bytedance.com>
References: <20220504074051.90-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=xieyongji@bytedance.com; helo=mail-pj1-x102a.google.com
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

Support getting the guest block size for the block backend.
It's needed for the following commit.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 block/block-backend.c             | 6 ++++++
 include/sysemu/block-backend-io.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index 35457a6a1d..1582ff81c9 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2106,6 +2106,12 @@ void blk_set_guest_block_size(BlockBackend *blk, int align)
     blk->guest_block_size = align;
 }
 
+int blk_get_guest_block_size(BlockBackend *blk)
+{
+    IO_CODE();
+    return blk->guest_block_size;
+}
+
 void *blk_try_blockalign(BlockBackend *blk, size_t size)
 {
     IO_CODE();
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 6517c39295..7600822196 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -73,6 +73,7 @@ void blk_iostatus_set_err(BlockBackend *blk, int error);
 int blk_get_max_iov(BlockBackend *blk);
 int blk_get_max_hw_iov(BlockBackend *blk);
 void blk_set_guest_block_size(BlockBackend *blk, int align);
+int blk_get_guest_block_size(BlockBackend *blk);
 
 void blk_io_plug(BlockBackend *blk);
 void blk_io_unplug(BlockBackend *blk);
-- 
2.20.1


