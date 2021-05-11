Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D306E37A481
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:23:55 +0200 (CEST)
Received: from localhost ([::1]:34562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPYQ-0002xq-Rd
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPUz-0008KY-Qg
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:20:25 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPUo-0006X1-Dq
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728408; x=1652264408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v9dngNOlYI6M8UvqCNI7Vz66vBQPm9MreWEGG7vUnp8=;
 b=Uf04chUWvkmjksBxB+nIHd4m6Z4y37FHi7eZfprdcCw0T+qEfBGB0dm/
 pTQN0HBMkkdiDIktp/cfi5LCvlBLL5jlMR8NGVB6L8xLvHRwVUe1yET1F
 cR9QQWCZVyPPTT26hRNeX1/DjRsoiZTTZEAx/xDnUnY/xzYacTNaySu38
 /kXUFSHZ5+cpqqFsw6/mS9JijXjHC8xvmC80urlAvMwhHG4L+PoGDVfpK
 woGgT7ts9XHh87S9AlSptwJNLp2a1FynHOR3lC7tMaSSzcngfgICbn6/u
 SkVl9GVKk/0At2356aTYYGexlN01zxKrkZ5NxUijuQg0VFiZDmc9pQyyc g==;
IronPort-SDR: 44DMAVm1h501+jIBjTGvqSJsFYH2GPMNzH9oXRjcZUaCRzh29WB86GuZVDdOTerHM79akcYhOR
 xdMIY0vQdmkz3juE+4xMax3cbJEwCTatlR9XCJXvZbka4gf4mPItsNGBo7ZP0PCF64OJHNmq1a
 qQEAfFqKFDo31Wlhg0wOcBgA+2BA8mGJzXYVYRvEkwR9btG3qnrTxJ5dcdoPzMw0UBfzCcBqhS
 z04/kH/8HmsR2grhDP74s/oveeXX/fOH2g9PXU6MdvyqUbebJClKy6Fv4mfUgCAaTBy9AZftrA
 raw=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735332"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:20:07 +0800
IronPort-SDR: L7SEp58l/EKQUw25i2DppGrZaJMYbejB860DekGayh6PhRy2C+ctAt1p/xmhHp90q82g9CP7DV
 MwM/ZYiVJwC7DZDT/FM1GXYN27S0BxhKra8q1lyalR4K/9H3wNoVtDl2CmVfNl84PNTsrTVcCf
 eifjzPLmqKuCeFf5xSN1qKFM6qIt67sHCPIEmeLy+BOdVrherP0n5tIVtbEN28+al4EomqWOXk
 GS/wkvsO7ti5g1kHfIHjUNQkoUWuqxGI3naygrP1I7vWFWLGHSqWX09q5yx//XTL0Bdj4yMTF2
 VgSGImLiqDR/1L/MjiQjEPp3
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:00:07 -0700
IronPort-SDR: ZevJqMrygcFvOLjI9TB2YNeKXhYImqbdhv3j1Qzl5l/T6+l6pK8rSIv5bv59xX8ZVU/Ik15Fhg
 BDqeZRmUIAYwlx+zh1JPLsqfHqc7BwGxYRguCMCM89Tp8UP0HwjAgSeOwV6RcdzlgYRwWi5Bea
 mlpXLe4MKH9UkhO1dGlWCKaNzaKEwEIKVsZBYbQPgYwIAhi7btBseA7AjAb1i1jbs5OKk2wrF6
 t/QRmwPs65FbE7MCpbphF9rsc0GCFZV6cmnoi0Xzdgh1k0GgDZxW4QJ0BbSU0jvs6B8DvfOmDJ
 g6M=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:20:06 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 02/42] docs/system/generic-loader.rst: Fix style
Date: Tue, 11 May 2021 20:19:11 +1000
Message-Id: <20210511101951.165287-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Axel Heider <axelheider@gmx.de>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Axel Heider <axelheider@gmx.de>

Fix style to have a proper description of the parameter 'force-raw'.

Signed-off-by: Axel Heider <axelheider@gmx.de>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: a7e50a64-1c7c-2d41-96d3-d8a417a659ac@gmx.de
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/generic-loader.rst | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/docs/system/generic-loader.rst b/docs/system/generic-loader.rst
index 6bf8a4eb48..531ddbc8e3 100644
--- a/docs/system/generic-loader.rst
+++ b/docs/system/generic-loader.rst
@@ -92,9 +92,12 @@ shown below:
   specified in the executable format header. This option should only
   be used for the boot image. This will also cause the image to be
   written to the specified CPU's address space. If not specified, the
-  default is CPU 0. <force-raw> - Setting force-raw=on forces the file
-  to be treated as a raw image. This can be used to load supported
-  executable formats as if they were raw.
+  default is CPU 0.
+
+``<force-raw>``
+  Setting 'force-raw=on' forces the file to be treated as a raw image.
+  This can be used to load supported executable formats as if they
+  were raw.
 
 All values are parsed using the standard QemuOpts parsing. This allows the user
 to specify any values in any format supported. By default the values
-- 
2.31.1


