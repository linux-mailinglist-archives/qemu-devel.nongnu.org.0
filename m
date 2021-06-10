Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4C23A34C7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 22:22:52 +0200 (CEST)
Received: from localhost ([::1]:33966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrRCV-0000Vc-Db
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 16:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lrRA7-0007N8-Ur; Thu, 10 Jun 2021 16:20:24 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lrRA5-0001z4-Pp; Thu, 10 Jun 2021 16:20:23 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15AK3R16115536; Thu, 10 Jun 2021 16:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=BbLvHgLUcbgICTHquncmQkZcYA1qXlHcU7ClXm3LYZ8=;
 b=gGV8HZs/6TuwiqpjfgWLrlFpb1EY5tUgS8d64BrE9eQ/xWsMcKlEoiVdBE+zfabuGjJv
 wMAm/IdcwdqnPF3sLVtD0J6JMh4HBZls2WeUBGsVmgywMAYGbLenb5GF3116ejBMoA9+
 3cRu5h5k01GSFIq7de0pJJnxPtgxyzVhrnlo3XkBr04KAT2UjKlwTLGSVX0niLRPRUj6
 /ZJmy415C6+RsWqmsTyB2gh3X6JlNxvrgihw+DXbQtF+im6l7p5l7gEuDQyRwIagtKKG
 IiPJ+BZHdUvsYTvis0Ok8WhoydsJ6KiqexTjeGkTpttAW5nasMQTZYS48IiiRMkjUNFX sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 393r3ntj5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 16:20:18 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15AK3kVI116678;
 Thu, 10 Jun 2021 16:20:17 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 393r3ntj53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 16:20:17 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15AKEFlF000531;
 Thu, 10 Jun 2021 20:20:16 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3900w89pt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 20:20:15 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15AKKC4O35193190
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 20:20:12 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A36EF42042;
 Thu, 10 Jun 2021 20:20:12 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F95442041;
 Thu, 10 Jun 2021 20:20:12 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 10 Jun 2021 20:20:12 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 4E165E027A; Thu, 10 Jun 2021 22:20:12 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 0/1] vfio-ccw: Fix garbage sense data on I/O error
Date: Thu, 10 Jun 2021 22:20:10 +0200
Message-Id: <20210610202011.391029-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kXOB0exKCkGUtQHmaXlc7aL1uj894eFT
X-Proofpoint-ORIG-GUID: U6Gpzmmw595L5yLZf7jLCIDSKUHTCjBE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-10_13:2021-06-10,
 2021-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106100129
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Conny,

Per our offline discussion, here's a fix for the error when a guest
issues "dasdfmt -M quick". It basically reverts commit 334e76850bbb
("vfio/ccw: update sense data if a unit check is pending")
and modifies the check that builds sense data in the TSCH handler.

I opted to NOT disable PMCW.CSENSE, because doing so prevents
vfio-ccw devices from coming online at all (didn't pursue deep
enough to explain why). Turning it off in reaction to a unit
check (in this now-reverted codepath) works, but only because of
the corresponding PMCW.CSENSE check in the TSCH code.

I don't know if anything is needed for the (unaltered) ECW data
that commit b498484ed49a ("s390x/css: sense data endianness")
addressed for the copied sense_data bytes, but figure we can
use this as a starting point. Thoughts?

Eric Farman (1):
  vfio-ccw: Keep passthrough sense data intact

 hw/s390x/css.c | 3 ++-
 hw/vfio/ccw.c  | 6 ------
 2 files changed, 2 insertions(+), 7 deletions(-)

-- 
2.25.1


