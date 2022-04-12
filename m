Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E845D4FE182
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 15:03:39 +0200 (CEST)
Received: from localhost ([::1]:40622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neGBH-0005VI-1i
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 09:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddtikhov@gmail.com>)
 id 1neCMm-00009l-2G; Tue, 12 Apr 2022 04:59:16 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:34752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ddtikhov@gmail.com>)
 id 1neCMj-0007TY-Nj; Tue, 12 Apr 2022 04:59:15 -0400
Received: by mail-lj1-x22b.google.com with SMTP id 17so23231296lji.1;
 Tue, 12 Apr 2022 01:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=AT6qRdGiHUFbs1H5b1gZ/1m3frqPb0qf6kZjmIuArLc=;
 b=F0evcSmdxWuJ7NheXD9xLl+NulxxYWOgM9beBspCWz6s09tp3PX6Ii6iI/XcXT8N8A
 QV2wIByRrfOKGxgntRLHbxsY3duHef07euilOKMRToBEP2CC6cY7XUk8pPxShcLOLhsc
 7ipv/5n6N9RdCvCDNB80cVecYOGTasZOweIxqx8edGv5gwul1kyupjGvivQYZKv5Mg5o
 iuwHvw+840uGK+yvXnEt9vBqb9jejhgqMVvWbi9RKkEPfgNPqwImj3MZB0KXi0WyliDf
 VcAftXG2MyEBimm60tQC/6DqoGecK6g7zqizUiel7rjQW2UWaJPKCWKU//yPc+x7rJOX
 6l7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=AT6qRdGiHUFbs1H5b1gZ/1m3frqPb0qf6kZjmIuArLc=;
 b=RYfv85K3sZ0H8rwsbsWyfHrYQs/TLesJqhLu9DxYXfeW3fKAqrGxjYbj5Nb+i++TBp
 QpLN/Bot31t0XPEsmIPSY5j/umD9oiZhy4y2p4JmPotPn3bDNRKkuh9h5zgMvlnzMx0H
 OQd2cUUYfZyZz4XDbzN4/zOOmMNBSoFQAfoLDyD6Sef+M2cNJxc4fwPn9ID7AbaA7RGM
 6DK/kmvPS0Y7TW3pNmPFVrClmBiFkvCrAde0yPtXWG6KnQoA4FZoXzCDz/H6qDise0qS
 HpSYfTxT7KinpQEOUrfOVAcMliat991OtOTLUFFAVBohzo7tv7TjtPr11Qux+oru6+yX
 LZgg==
X-Gm-Message-State: AOAM531lx9rA6jqr/D+Ij2fFSiqxzQ9azVHQLSfRzI9UdVqUy9UkcB2K
 Q4vAqia1qd6Qko6+I0o+IRFZQGwHS/xw8fEN2vY=
X-Google-Smtp-Source: ABdhPJxKRpG2GNXwZXiCmlHtX8h1DXietNm2lxMJl5i1Zt5XOR1SkSPaG4DIbgwFKYKpiTXuZXzsyw==
X-Received: by 2002:a2e:860e:0:b0:24b:68ff:6284 with SMTP id
 a14-20020a2e860e000000b0024b68ff6284mr3563097lji.198.1649753950512; 
 Tue, 12 Apr 2022 01:59:10 -0700 (PDT)
Received: from localhost.localdomain ([178.69.44.101])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a196e49000000b00464f0cd58ffsm1664690lfk.89.2022.04.12.01.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 01:59:10 -0700 (PDT)
Date: Tue, 12 Apr 2022 11:59:09 +0300
From: Dmitry Tikhov <ddtikhov@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/nvme: fix narrowing conversion
Message-ID: <20220412085909.nppz25ifaotottjn@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=ddtikhov@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 12 Apr 2022 08:59:15 -0400
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
Cc: kbusch@kernel.org, its@irrelevant.dk, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since nlbas is of type int, it does not work with large namespace size
values, e.g., 9 TB size of file backing namespace and 8 byte metadata
with 4096 bytes lbasz gives negative nlbas value, which is later
promoted to negative int64_t type value and results in negative
ns->moff which breaks namespace

Signed-off-by: Dmitry Tikhov <ddtikhov@gmail.com>
---
 hw/nvme/ns.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 324f53ea0c..af6504fad2 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -29,7 +29,8 @@ void nvme_ns_init_format(NvmeNamespace *ns)
 {
     NvmeIdNs *id_ns = &ns->id_ns;
     BlockDriverInfo bdi;
-    int npdg, nlbas, ret;
+    int npdg, ret;
+    int64_t nlbas;
 
     ns->lbaf = id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
     ns->lbasz = 1 << ns->lbaf.ds;
@@ -42,7 +43,7 @@ void nvme_ns_init_format(NvmeNamespace *ns)
     id_ns->ncap = id_ns->nsze;
     id_ns->nuse = id_ns->ncap;
 
-    ns->moff = (int64_t)nlbas << ns->lbaf.ds;
+    ns->moff = nlbas << ns->lbaf.ds;
 
     npdg = ns->blkconf.discard_granularity / ns->lbasz;
 
-- 
2.35.1


