Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9309436403E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 13:09:49 +0200 (CEST)
Received: from localhost ([::1]:50806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYRmm-0002nF-Md
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 07:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lYRfu-0005w5-HH
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 07:02:42 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:27480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lYRfl-0007Yc-Q0
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 07:02:42 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210419110224epoutp04e517d7dfca15b61ba1d021a1666db83c~3PXBlw0Xz0706507065epoutp04E
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 11:02:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210419110224epoutp04e517d7dfca15b61ba1d021a1666db83c~3PXBlw0Xz0706507065epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1618830144;
 bh=9McB9IA90yO+6BHAHj6BbrvP3KxgJKJQRStI/KbSFg4=;
 h=From:To:Cc:Subject:Date:References:From;
 b=D3VGG/bvgmR2A+vf88hHslIjwcCa8/jWEAOG2C3mJ4sF81RxzFlIJZzLeZ/A9EFEJ
 gV33fx43D+DBuLJMQeOWq0ZnXnI3rxbGqjUx+6R4ouj0MZKtyFg5SOXvljyud+eTcG
 3FDLrO6BHxOa2UVjs285NFg0thzn4SOtnxvABSW8=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20210419110223epcas5p4b746be2641318383b0c3e9b2bd78aeef~3PXBESUaZ2799927999epcas5p4N;
 Mon, 19 Apr 2021 11:02:23 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B3.52.09606.F336D706; Mon, 19 Apr 2021 20:02:23 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210419105126epcas5p4b8c4ed2a308b2cee570570485b7b5c89~3PNdQXycK1524815248epcas5p4L;
 Mon, 19 Apr 2021 10:51:26 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210419105126epsmtrp29334303f8580d55f330febfbe0d23b0a~3PNdPVlBN0660206602epsmtrp2T;
 Mon, 19 Apr 2021 10:51:26 +0000 (GMT)
X-AuditID: b6c32a49-bf1ff70000002586-99-607d633f94fa
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 B9.BB.08163.EA06D706; Mon, 19 Apr 2021 19:51:26 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.99.42.33]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210419105125epsmtip1851c4e8a7dd2c9d4661045a78ae4d3c8~3PNb3Yu040783407834epsmtip1h;
 Mon, 19 Apr 2021 10:51:24 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: fix io-command set profile feature
Date: Mon, 19 Apr 2021 16:18:32 +0530
Message-Id: <20210419104832.25455-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsWy7bCmpq59cm2Cwa4l4havdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8b0l7cZCzbxVBz//5+tgXEVZxcjJ4eE
 gInEzS3f2LsYuTiEBHYzSjS8XcIE4XxilJjx7wMbhPOZUWL1m7XMXYwcYC3r+/Mg4rsYJV7f
 +8AC4bQxSbS+bGcHmcsmYCQx++0bRhBbREBS4nfXaWYQmxlkx7e5OiC2sICTRMPmTSwgNouA
 qsTJk5fB6nkFbCUmz3vBCnGfvMTqDQeYQRZICBxjl5h57BMTRMJFYlnPPTYIW1ji1fEt7BC2
 lMTnd3uB4uxAdrXE4SKI1g5GiWOXN0CV20v8ezaNEeQZZgFNifW79CHCshJTT61jgjiTT6L3
 9xOoTbwSO+bB2GoSC259h9okIzHzz21WSJh4SDz9GwwSFhKIlTh3eBHbBEbZWQgLFjAyrmKU
 TC0ozk1PLTYtMMxLLdcrTswtLs1L10vOz93ECE4IWp47GO8++KB3iJGJg/EQowQHs5II7/3a
 mgQh3pTEyqrUovz4otKc1OJDjNIcLErivILO1QlCAumJJanZqakFqUUwWSYOTqkGpoAmN/m/
 h0ISW70rd8czSRqy6sqpHi+40rWau36fk5r2yg+b1t/59MFHquylqTnLOR+X0yJiG1/+XVCm
 b3ohubR3u2hLonPazLy5GV+r/6y5cLZr9sG5P3d4Z205PevB1s8Jejv+Gu06ZiSQUbB7t2LC
 /m09F3nvdHo98eX8PP+h/BXeyXL21kW3tPNyWeUW7jnuqFta39M1q90mdze/lmAzx3t2oY9v
 XxhMTHOX21mnfsynub4t4PVlLhbGC5OdXldcttQ3V4pr7jaUe9Bsl2e1utPFw9Krq2FCjdwG
 i1XMDL++z4vSeqE4u2t3//HT1ueVXxvfLKhc3LL+08/J3KmSPC32TvXZXTv/iuxQYinOSDTU
 Yi4qTgQAZPpD/ncDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphluLIzCtJLcpLzFFi42LZdlhJTnddQm2CwcNDkhavdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8b0l7cZCzbxVBz//5+tgXEVZxcjB4eE
 gInE+v68LkYuDiGBHYwSTT/XsXQxcgLFZSR+nZrKDGELS6z895wdxBYSaGGSmPA/EsRmEzCS
 mP32DSOILSIgKfG76zQzyCBmgaOMEpfbJ4MNEhZwkmjYvAnMZhFQlTh58jJYA6+ArcTkeS9Y
 IRbIS6zecIB5AiPPAkaGVYySqQXFuem5xYYFRnmp5XrFibnFpXnpesn5uZsYwQGmpbWDcc+q
 D3qHGJk4GA8xSnAwK4nw3q+tSRDiTUmsrEotyo8vKs1JLT7EKM3BoiTOe6HrZLyQQHpiSWp2
 ampBahFMlomDU6qBSWU9p9qG/B/zY5L4OiMZZ1dJVDRf/5BYZ6/xI3H/vEkC95MNw9y4PJuW
 b1Nv4F26Ly3bKUVuwq726q32759ZlovvcIvh2L/VfgJryl+X+y9ibUw05fJOhkWtiV3p9aDV
 xqHt0tM9u2ZK3d22UUNQ69L/riK+543zH2iJZf1Xsu+RfLepPOAkS+M5hsT/T/4/DFcr6L7/
 UDjob0iQh/Mzv8Yr36WkWwpXzN74cUNoese+RlsmjTeut0ttTVltv/rwi+5/YbdeXsvnsMws
 ierjfgv01jQcrORvPT+5TTKbbYX/i831uR659xSPlnG96VSaffzJWp6eyn+zVnYdZWhJ0jBm
 mT2Hx+G4mICJg6sSS3FGoqEWc1FxIgCVu6oEnwIAAA==
X-CMS-MailID: 20210419105126epcas5p4b8c4ed2a308b2cee570570485b7b5c89
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210419105126epcas5p4b8c4ed2a308b2cee570570485b7b5c89
References: <CGME20210419105126epcas5p4b8c4ed2a308b2cee570570485b7b5c89@epcas5p4.samsung.com>
Received-SPF: pass client-ip=203.254.224.34;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout4.samsung.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, mreitz@redhat.com,
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently IO Command Set Profile feaure is supported, but
feature support flag not set and this feature is changable
add support for that.

Remove filling default value of feature in CQE CDW0 with zero,
since it fallbacks to default case and it is zero initialized,
if feature default value not set explicitly.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/block/nvme.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 624a1431d0..b5d2c29fc4 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -185,6 +185,7 @@ static const bool nvme_feature_support[NVME_FID_MAX] = {
     [NVME_WRITE_ATOMICITY]          = true,
     [NVME_ASYNCHRONOUS_EVENT_CONF]  = true,
     [NVME_TIMESTAMP]                = true,
+    [NVME_COMMAND_SET_PROFILE]      = true,
 };
 
 static const uint32_t nvme_feature_cap[NVME_FID_MAX] = {
@@ -194,6 +195,7 @@ static const uint32_t nvme_feature_cap[NVME_FID_MAX] = {
     [NVME_NUMBER_OF_QUEUES]         = NVME_FEAT_CAP_CHANGE,
     [NVME_ASYNCHRONOUS_EVENT_CONF]  = NVME_FEAT_CAP_CHANGE,
     [NVME_TIMESTAMP]                = NVME_FEAT_CAP_CHANGE,
+    [NVME_COMMAND_SET_PROFILE]      = NVME_FEAT_CAP_CHANGE,
 };
 
 static const uint32_t nvme_cse_acs[256] = {
@@ -4707,9 +4709,6 @@ defaults:
             result |= NVME_INTVC_NOCOALESCING;
         }
         break;
-    case NVME_COMMAND_SET_PROFILE:
-        result = 0;
-        break;
     default:
         result = nvme_feature_default[fid];
         break;
-- 
2.17.1


