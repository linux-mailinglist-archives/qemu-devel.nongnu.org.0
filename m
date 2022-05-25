Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EEA534559
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 22:52:16 +0200 (CEST)
Received: from localhost ([::1]:36090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntxzK-0001vb-U9
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 16:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6144085ad1=pdel@fb.com>)
 id 1ntxy5-0000j3-SO
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:50:57 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:47782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6144085ad1=pdel@fb.com>)
 id 1ntxy3-0007jh-CK
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:50:57 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PGtc9i017420
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 13:50:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=LUIgwt/FGossgc701QtgMM24o8V33Dm5JNSVq+D4S+I=;
 b=ZSKs6jqVGP96Nk2FBxg+V7ATqF3aAXTbUwdI+ItZ4A68UM5CCJxg5xQu6qsj5PMReviF
 OVITBK/7nFTJQrh3n6we8ghzqOJmonerLkSR/Bto6OyJ7PnTLo/7nSCF5vOmfqqnR76M
 8qqw5YzdlVRsHFFpmZ5XywfMkiZcB0f9avw= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g93vs8uqv-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 13:50:54 -0700
Received: from twshared6447.05.prn5.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 25 May 2022 13:50:49 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 368B56E3817F; Wed, 25 May 2022 13:50:40 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <zhdaniel@fb.com>, <troy_lee@aspeedtech.com>,
 <jamin_lin@aspeedtech.com>, <steven_lee@aspeedtech.com>,
 <k.jensen@samsung.com>
Subject: [RFC 0/1] i2c/aspeed: Add slave device handling in new register mode
Date: Wed, 25 May 2022 13:50:23 -0700
Message-ID: <20220525205024.1158075-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lXxJSvSQ4o3zUQdruvRQpsYAVQ7f3aln
X-Proofpoint-GUID: lXxJSvSQ4o3zUQdruvRQpsYAVQ7f3aln
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_06,2022-05-25_02,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=6144085ad1=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The AST2600/AST1030 new register mode patches[1] and the I2C slave device
patches[2] will be really useful, but we still need DMA slave device
handling in the new register mode too for the use-cases I'm thinking of
(OpenBIC Zephyr kernel using Aspeed SDK drivers[3]).

My test images are on Github[4]. They can be used with the ast1030-evb, or
the oby35-cl and oby35-bb machines in the fb qemu branch[5].

I'm submitting this as an RFC cause I just want to see how other people
expect these changes to be made based on the previously submitted "new
register mode" and "old register mode slave device" patches.

Thanks,
Peter

[1] https://patchwork.kernel.org/project/qemu-devel/list/?series=3D626028&a=
rchive=3Dboth
[2] https://patchwork.kernel.org/project/qemu-devel/list/?series=3D627914&a=
rchive=3Dboth
[3] https://github.com/AspeedTech-BMC/zephyr/blob/db3dbcc9c52e67a47180890ac=
938ed380b33f91c/drivers/i2c/i2c_aspeed.c#L1362-L1368
[4] https://github.com/peterdelevoryas/OpenBIC/releases/tag/oby35-cl-2022.1=
3.01
[5] https://github.com/facebook/openbmc-qemu

Peter Delevoryas (1):
  i2c/aspeed: Add slave device handling in new register mode

 hw/i2c/aspeed_i2c.c         | 118 ++++++++++++++++++++++++++++++++++--
 include/hw/i2c/aspeed_i2c.h |  14 +++--
 2 files changed, 124 insertions(+), 8 deletions(-)

--=20
2.30.2


