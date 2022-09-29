Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A625EFED7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 22:46:53 +0200 (CEST)
Received: from localhost ([::1]:53532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe0Qm-0006NL-Cx
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 16:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=1271248072=kbusch@meta.com>)
 id 1odzmu-0002mK-4n
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 16:05:42 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:55514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=1271248072=kbusch@meta.com>)
 id 1odzmr-0005Rk-5V
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 16:05:39 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28TJIfUl006138
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 13:05:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=s2048-2021-q4;
 bh=C+nkGoYtEXf9lLeKFSRNNzYPHusMQmtBZGd0L3SuEhM=;
 b=LiZ7ONxv7uB9uicfDJq2dGxG5viEUa1LfzXbp/IDOetn7dJtiYb3prEebgYCja0uyIFl
 Vg9iABBw0pMZrE+9s/fLGgLbsGfVbrYWEAijTH73Rvmhm3nsbpB6OI8xgEh8TVFBFYjq
 HoTc5T8CUf/AX00DNJLWa9MA1f+BdD/OKYlV41FGGyp0otnNDl9KWbDh5qIJWWaLX6tT
 4qYIQABYc2U4hmdpXeAejCcZhwOfkwRLY5lVjeGjswqN9xnun+Jp73P/uGUx1nqhjuRl
 SbU90xS2CEw/rD5m9TmuAeI2LEtIj4RGMxRM8OW2OOt7pGiU0pT/4xl0EttJfacbjdXy eg== 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3jwdp12krt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 13:05:33 -0700
Received: from twshared25017.14.frc2.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:11d::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 13:05:32 -0700
Received: by devbig007.nao1.facebook.com (Postfix, from userid 544533)
 id 3A86F9305008; Thu, 29 Sep 2022 13:05:24 -0700 (PDT)
From: Keith Busch <kbusch@meta.com>
To: <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, Maxim Levitsky
 <mlevitsk@redhat.com>, <kvm@vger.kernel.org>,
 Keith Busch <kbusch@kernel.org>
Subject: [PATCHv3 0/2] qemu direct io alignment fix
Date: Thu, 29 Sep 2022 13:05:21 -0700
Message-ID: <20220929200523.3218710-1-kbusch@meta.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 1rdX07IeBccuN-w_iPvjtCVzmixW_mwV
X-Proofpoint-GUID: 1rdX07IeBccuN-w_iPvjtCVzmixW_mwV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_11,2022-09-29_03,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=1271248072=kbusch@meta.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 29 Sep 2022 16:42:15 -0400
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

From: Keith Busch <kbusch@kernel.org>

Changes from v2:

  Split the patch so that the function move is separate from the
  functional change. This makes it immediately obvious what criteria is
  changing. (Kevin Wolf)

  Added received Tested-by tag in the changelog.=20

Keith Busch (2):
  block: move bdrv_qiov_is_aligned to file-posix
  block: use the request length for iov alignment

 block/file-posix.c       | 22 ++++++++++++++++++++++
 block/io.c               | 21 ---------------------
 include/block/block-io.h |  1 -
 3 files changed, 22 insertions(+), 22 deletions(-)

--=20
2.30.2


