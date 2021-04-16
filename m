Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1DA361A92
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 09:36:02 +0200 (CEST)
Received: from localhost ([::1]:41894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJ1F-0006au-Ic
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 03:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lXIzB-0004Ww-Un
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:33:54 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:30284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lXIz9-0002Th-0Y
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:33:53 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210416073347epoutp01fbf7bd2c4874ae64c6743079ada58651~2RlBrSMyr0066900669epoutp01L
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 07:33:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210416073347epoutp01fbf7bd2c4874ae64c6743079ada58651~2RlBrSMyr0066900669epoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1618558427;
 bh=fgle++jXnhBBgKRaBnWx1615KwoBZKtI7BetuXJIEMM=;
 h=From:To:Cc:Subject:Date:References:From;
 b=DkUrktKcSqgmEmr0/S9M2a7FKlrVOVSW2SMvGqK4pGKdcEIPiFQ2jVCRqt5WsFPod
 +nvSX78IUl6Kt1LIMmwfk5q3GyCE3P6XqAMGLCqt2juRRjClBQ3aSOeNkR+V8yyaO4
 cNSRrwlbjPF9iRdO3mhBI9UbxMPviay+3FPcSTsU=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20210416073346epcas5p1899e16d955eda4938a04c26a42c5474c~2RlBX-0xM1007210072epcas5p1L;
 Fri, 16 Apr 2021 07:33:46 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F4.59.41008.ADD39706; Fri, 16 Apr 2021 16:33:46 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20210416072533epcas5p305e83206f2b3d947e9b5fef9fde1c969~2Rd1mEbIO0156801568epcas5p3e;
 Fri, 16 Apr 2021 07:25:33 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210416072533epsmtrp1c10a01552f42fa7d79cbd78c3f258f68~2Rd1lT-BT1222812228epsmtrp1K;
 Fri, 16 Apr 2021 07:25:33 +0000 (GMT)
X-AuditID: b6c32a4b-661ff7000001a030-0e-60793dda38c9
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 3C.FD.33967.DEB39706; Fri, 16 Apr 2021 16:25:33 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.99.42.33]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210416072531epsmtip20922a6e606e5162deb73cf9f968390fe~2Rd0IJ8Br0778907789epsmtip2I;
 Fri, 16 Apr 2021 07:25:31 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/block/nvme: consider metadata read aio return value
 in compare
Date: Fri, 16 Apr 2021 12:52:33 +0530
Message-Id: <20210416072234.25732-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7bCmhu4t28oEg297TSxe7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsEroz1r18wF2zjqni++RBrA+MUji5GDg4J
 AROJA4sluxi5OIQEdjNKfFu/lRXC+cQocfDQayjnG6PEvJ3NzF2MnGAdL27PhErsZZS4/fIz
 M4TTxiRx4WYrI0gVm4CRxOy3b8BsEQFJid9dp8G6mcGWzNUBsYUFIiTm793MBmKzCKhKNG67
 wQpi8wrYSnx4uZIdYpu8xOoNB8AWSAgcY5c4v2cBE0TCRWL1889sELawxKvjW6AapCRe9rcB
 2exAdrXE4SKI1g5GiWOXN0CV20v8ezaNEeR/ZgFNifW79CHCshJTT61jgjiTT6L39xOoTbwS
 O+bB2GoSC259h9okIzHzz21WCNtD4t2ff2AvCgnESuz+OZNlAqPsLIQNCxgZVzFKphYU56an
 FpsWGOellusVJ+YWl+al6yXn525iBKcELe8djI8efNA7xMjEwXiIUYKDWUmE17izIkGINyWx
 siq1KD++qDQntfgQozQHi5I47w6DB/FCAumJJanZqakFqUUwWSYOTqkGpu7jvxS4p2q87syZ
 kXx8c2l9zKpZwQrz1/nXr51Q76Xh4fdjhrvHFp2bgS/cv+1zNTG590v/lplW+PV+KUYTIwnz
 Sx4t/K0if9Y1ydcry65ZFGro+tJrR5WZY/Bk98xdZzxkd69fxZ260tp6aZ3AtqXbHViNTVPk
 98UZzv5x7EPlor+Ou1YfnRn/fT0ro4Ndg9KK5DtvI45ZeRa5KK/ivupsv0urhXfV299b00sz
 9npfbGDTvLzkkbz+nQqd2d0rFzsu/tt+RNKAUa0vjmGGW4+J1v0LiU1fpxtF9+/csPSw+vpb
 S1/2CD82XpmX9nT1RW9W3rf7OZratZrU5SYfYznBV3Kjw8Lo04Qfpo8klFiKMxINtZiLihMB
 FOBZUngDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplluLIzCtJLcpLzFFi42LZdlhJXvetdWWCwZyL3Bavdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8b61y+YC7ZxVTzffIi1gXEKRxcjJ4eE
 gInEi9szWbsYuTiEBHYzSnzrPcIMkZCR+HVqKpQtLLHy33N2iKIWJonDWzoZQRJsAkYSs9++
 AbNFBCQlfnedZgYpYhY4yihxuX0ySxcjB4ewQJjErz+6IDUsAqoSjdtusILYvAK2Eh9ermSH
 WCAvsXrDAeYJjDwLGBlWMUqmFhTnpucWGxYY5qWW6xUn5haX5qXrJefnbmIEh5iW5g7G7as+
 6B1iZOJgPMQowcGsJMJr3FmRIMSbklhZlVqUH19UmpNafIhRmoNFSZz3QtfJeCGB9MSS1OzU
 1ILUIpgsEwenVAOTL29Y7KYQFasbr9Kyr33ls6g2jXz39F86D3O3Rq/Zm7Kji/r6z9tHV828
 t/GdxsmFsQXTT3P/yp33Yu28J0enTfH9trpx/db+yv0WTdNCth9Y8Ch700aBwBs8HeFPQjf1
 vFKPPazXd7aY+75o6NWpm1nms96Kf672pprhs9+Uf0lNTInT+Ux2rnNr3nu8ZNkX4+gZ2x9d
 4pyTuJZjfeX68k9rI5pvOOltOJ6yvebYISPL5Pp11/e8Vcyp+/Nifo0McyG3Qtx1/eduE44s
 z+jRjZ844UvJQZPGZY93+1qp1JWopjdwskcsFvRQmFhreWHDdz0LRpYwsaW1hWsesBYWi8Sv
 FfpZM317SbT37uMTlViKMxINtZiLihMB8kgbgKACAAA=
X-CMS-MailID: 20210416072533epcas5p305e83206f2b3d947e9b5fef9fde1c969
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210416072533epcas5p305e83206f2b3d947e9b5fef9fde1c969
References: <CGME20210416072533epcas5p305e83206f2b3d947e9b5fef9fde1c969@epcas5p3.samsung.com>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, mreitz@redhat.com,
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently in compare command metadata aio read blk_aio_preadv return
value ignored, consider it and complete the block accounting.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/block/nvme.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 624a1431d0..c2727540f1 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2369,10 +2369,19 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
     uint32_t reftag = le32_to_cpu(rw->reftag);
     struct nvme_compare_ctx *ctx = req->opaque;
     g_autofree uint8_t *buf = NULL;
+    BlockBackend *blk = ns->blkconf.blk;
+    BlockAcctCookie *acct = &req->acct;
+    BlockAcctStats *stats = blk_get_stats(blk);
     uint16_t status = NVME_SUCCESS;
 
     trace_pci_nvme_compare_mdata_cb(nvme_cid(req));
 
+    if (ret) {
+        block_acct_failed(stats, acct);
+        nvme_aio_err(req, ret);
+        goto out;
+    }
+
     buf = g_malloc(ctx->mdata.iov.size);
 
     status = nvme_bounce_mdata(n, buf, ctx->mdata.iov.size,
@@ -2421,6 +2430,8 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
         goto out;
     }
 
+    block_acct_done(stats, acct);
+
 out:
     qemu_iovec_destroy(&ctx->data.iov);
     g_free(ctx->data.bounce);
-- 
2.17.1


