Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E162266B109
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 13:41:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH2J1-000388-H4; Sun, 15 Jan 2023 07:40:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1pH2In-000320-Nk; Sun, 15 Jan 2023 07:39:58 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1pH2Ik-0006nw-O2; Sun, 15 Jan 2023 07:39:57 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30F7COS1007022; Sun, 15 Jan 2023 12:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=KN4WagFYUXe4clFB/fn6UHggGyqfjfE/JIYEvPPTbsU=;
 b=lvU5kfVb20JH0ThYCGVA1je+Z8pzsEn7neyUqBqZcQwAdLB7zQ8j+XAFfk2diKHs8Bhw
 SGgLTRfILEeff6IGkD1WcPx/Yf8Bh8IRPbBsP/UbSy/QZ1BYxZ6I6YrIDLh3pNw93uTL
 8dTMQn/mC9vC/rodWSvSJUr7bfXldPfrzUUBrgDxtsYYJJD1beV4rgI8rdfIiA9T1wIx
 4uTI9C28xQCpoG5dxwkP6OyXFecYUCsaPsLJbQuY3SilfZWRr+BQsAh3Bbcvg15jyRQN
 IfhanpAE36UKeREfkFFQ/QLNA2JtbRYsObqyJ77Br0OoLypg9XMd/ZhOyjjjmwbjK6AX +Q== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n4cvw3xp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Jan 2023 12:39:50 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30FC24KE025467;
 Sun, 15 Jan 2023 12:39:49 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3n3m172qs3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Jan 2023 12:39:49 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30FCdjPJ4063964
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 15 Jan 2023 12:39:46 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D013E5805E;
 Sun, 15 Jan 2023 12:39:45 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AACC58059;
 Sun, 15 Jan 2023 12:39:45 +0000 (GMT)
Received: from oro.sl.cloud9.ibm.com (unknown [9.59.192.176])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Sun, 15 Jan 2023 12:39:45 +0000 (GMT)
From: Or Ozeri <oro@il.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, oro@il.ibm.com
Subject: [PATCH v5 0/3] block/rbd: Add support for layered encryption
Date: Sun, 15 Jan 2023 06:39:29 -0600
Message-Id: <20230115123932.2564966-1-oro@il.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rIFLzWJKpVYVjkWu6aMO1rqTNSmfP2H4
X-Proofpoint-GUID: rIFLzWJKpVYVjkWu6aMO1rqTNSmfP2H4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-15_07,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=745 phishscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301150096
Received-SPF: pass client-ip=148.163.156.1; envelope-from=oro@il.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v5: nit fixes
v4: split to multiple commits
    add support for more than just luks-any in layered encryption
    nit fixes
v3: further nit fixes suggested by @idryomov
v2: nit fixes suggested by @idryomov

Or Ozeri (3):
  block/rbd: Remove redundant stack variable passphrase_len
  block/rbd: Add luks-any encryption opening option
  block/rbd: Add support for layered encryption

 block/rbd.c          | 189 ++++++++++++++++++++++++++++++++++++++++---
 qapi/block-core.json |  31 ++++++-
 2 files changed, 206 insertions(+), 14 deletions(-)

-- 
2.25.1


