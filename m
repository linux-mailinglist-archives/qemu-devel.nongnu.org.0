Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369F9533FEA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 17:08:29 +0200 (CEST)
Received: from localhost ([::1]:50672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntsce-0007NE-AT
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 11:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1ntsSw-0002Dv-IA; Wed, 25 May 2022 10:58:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59160
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1ntsSu-00013b-Fd; Wed, 25 May 2022 10:58:26 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PEGXv7009541;
 Wed, 25 May 2022 14:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=YXbxow3wTkP+tBnTKb0yYsyQqyKsmdDVqFAHzsT1wT4=;
 b=N9g9TKHbyhhCU9TKBypTQRuKej0X0ZUGCXyS9FR8Tjlu5nuScYO3ednK0tr84d5TTEzu
 rqakq2ZNe6HocCABfkM5d1r5RtGOXy0faXQJHBK6QBkRUGfn47WFLz7yfWLPvpHoJsNc
 YZrfMlJ0LfA//+aY8akK0/5CGZ/foHYnDgGex3J4gMiyFqDIWAwS1pQeZr1B0IEW4vmY
 VxznKFhpBrSRPWgb2aivVz1jYEl7NTH/lYgXYMe4n9IxLhbue7uZgZBvxNb+B2Fry9O6
 jrmcWEDaQlxrCeuucnFG9kCF1dSOWjcndC5Ow2lMWmbbolvn/D46BVOkb2UI/EmCheGM vA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9hfnxxww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 14:58:21 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24PEBPpQ030565;
 Wed, 25 May 2022 14:58:21 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9hfnxxwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 14:58:21 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24PErLpM014853;
 Wed, 25 May 2022 14:58:19 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3g93v6hdmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 14:58:19 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24PEwGU855837090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 May 2022 14:58:16 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E516A404D;
 Wed, 25 May 2022 14:58:16 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C180A4040;
 Wed, 25 May 2022 14:58:16 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 25 May 2022 14:58:16 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id DF038E7919; Wed, 25 May 2022 16:58:15 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Eric Farman <farman@linux.ibm.com>
Subject: [PATCH] MAINTAINERS: Update s390 vhost entries
Date: Wed, 25 May 2022 16:58:14 +0200
Message-Id: <20220525145814.2750501-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iWL6Q3l34flgYh2dEyy_VQH-3kk4ETt3
X-Proofpoint-ORIG-GUID: dE8t9u297aWxfYQxqjnqVvSOyqpm5yML
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_04,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205250076
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Commit 7a523d96a0 ("virtio-ccw: move vhost_ccw_scsi to a separate file")
introduced a new file hw/s390x/vhost-scsi-ccw.c, which received a
couple comments [1][2] to update MAINTAINERS that were missed.

Fix that by making the vhost CCW entries a wildcard.

[1] https://lore.kernel.org/r/d8d2bbd5021076bdba444d31a6da74f507baede3.camel@linux.ibm.com/
[2] https://lore.kernel.org/r/87k0c4gb9f.fsf@redhat.com/

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index dff0200f70..77238c9338 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2012,8 +2012,7 @@ M: Halil Pasic <pasic@linux.ibm.com>
 M: Eric Farman <farman@linux.ibm.com>
 S: Supported
 F: hw/s390x/virtio-ccw*.[hc]
-F: hw/s390x/vhost-vsock-ccw.c
-F: hw/s390x/vhost-user-fs-ccw.c
+F: hw/s390x/vhost-*-ccw.c
 T: git https://gitlab.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
-- 
2.32.0


