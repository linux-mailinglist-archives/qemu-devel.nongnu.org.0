Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4935B67FF7D
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 15:21:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM8XP-0000am-30; Sun, 29 Jan 2023 09:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@oro.sl.cloud9.ibm.com>)
 id 1pM6HT-0005To-QC; Sun, 29 Jan 2023 06:55:31 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@oro.sl.cloud9.ibm.com>)
 id 1pM6HR-0003AW-KV; Sun, 29 Jan 2023 06:55:31 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30T6hi5r028972; Sun, 29 Jan 2023 11:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=nTMLXfiN4EpK382HnvVNBIiZ+bPwoJnlYPok4NcjrKY=;
 b=mmlpFZWJgmK27F/O9L6LZwoFruvMpaY9ZL4dySB9DH9CbWkHIrWQrZed7EIwUzEHg+ib
 nGA5w5rbH6SMjXcYgFylX1KAgK6A0M+rm3mAgEQbFqJ7B5C9EbT770/hkbkdxqc0XiYe
 caWP3GQObpnKjQaaaiaXPcflDsdGXx1Vr5sNXQfN9xbSE0lsayh+OrkeeiwPGgEeRiwB
 sYQHNLN+uW2Kux+ssu0NgohNExtanbOW0TgHsyYP0/Ua2udkFeUaLVnWKqitT2tqovds
 SYRY15jdqW/rxHpU7ndkS8x+v22Y5kdI5Yb1h/1OXAOWOxwF8uOpwTu4WnGqubWt5mPF Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nddj5g7jn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 Jan 2023 11:31:29 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30TBVODa027470;
 Sun, 29 Jan 2023 11:31:29 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nddj5g7je-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 Jan 2023 11:31:29 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30TAN7dZ006508;
 Sun, 29 Jan 2023 11:31:28 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3ncvtky78d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 Jan 2023 11:31:28 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30TBVOwo51839284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 29 Jan 2023 11:31:24 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7F8258058;
 Sun, 29 Jan 2023 11:31:24 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B70FD58059;
 Sun, 29 Jan 2023 11:31:23 +0000 (GMT)
Received: from oro.sl.cloud9.ibm.com (unknown [9.59.192.176])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Sun, 29 Jan 2023 11:31:23 +0000 (GMT)
From: "ORO@il.ibm.com" <oro@oro.sl.cloud9.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, oro@il.ibm.com, idryomov@gmail.com,
 "ORO@il.ibm.com" <oro@oro.sl.cloud9.ibm.com>
Subject: [PATCH v6 0/3] block/rbd: Add support for layered encryption
Date: Sun, 29 Jan 2023 05:31:17 -0600
Message-Id: <20230129113120.722708-1-oro@oro.sl.cloud9.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jI4RM2KWWpgz5RaZuUnIMWdQSVJy-o0b
X-Proofpoint-ORIG-GUID: V_UdM-IvJByOWiQ1hLJ1TQhPUzJ4EHjj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-29_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=840 impostorscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1034 priorityscore=1501
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301290107
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=oro@oro.sl.cloud9.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 29 Jan 2023 09:19:58 -0500
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

v6: nit fixes
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

 block/rbd.c          | 188 ++++++++++++++++++++++++++++++++++++++++---
 qapi/block-core.json |  31 ++++++-
 2 files changed, 205 insertions(+), 14 deletions(-)

-- 
2.25.1


