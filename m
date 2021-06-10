Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4768A3A361A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 23:39:26 +0200 (CEST)
Received: from localhost ([::1]:55228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrSOb-0003sc-Bv
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 17:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1lrPtB-0005D1-38; Thu, 10 Jun 2021 14:58:49 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1lrPt1-0007Q3-SU; Thu, 10 Jun 2021 14:58:48 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15AIWwNS120803; Thu, 10 Jun 2021 14:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=q3xb/ApuS8N+olQO6RYzTSLIu7uGaVxPTpp08EFp2Go=;
 b=ZYAhTZAly1WsFdkiyTdc8QydWgW/awLDW2vetTI3K7AC/pwzajvtc+wZw5Lzu9IY/tG/
 RW4ZKoqb2aDQRzpdA0XGwRrn+1Z0JFNVBQWCsMJPocAdH6/tZ3OZ4oR1R2YlqB9iNpSm
 0n0umnAVkf3sgkaaypovOEU9+Nrkc3rWk7H4PaXfqSgej3hwp998+ufz7/pExqj7rFwU
 Jttw+bYTaCAynRbRYvRPrrMZ55Npii0n1nX5os/mwlYj1h9P1VStwhd+03DWrd3S3NnF
 1b7o6kqj8Kd4Hpk0v5EsEmLPInnRp7CawAGeYiHfSlp4vbjelYbhgqohbO1D63+VHT93 3w== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 393pxuajk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 14:58:36 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15AIvZCf028638;
 Thu, 10 Jun 2021 18:58:35 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 3900waagqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 18:58:35 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15AIwYgJ29163880
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 18:58:34 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13878BE051;
 Thu, 10 Jun 2021 18:58:34 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CF66BE059;
 Thu, 10 Jun 2021 18:58:33 +0000 (GMT)
Received: from LAPTOP-K4LLPL5U.localdomain (unknown [9.65.250.107])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 10 Jun 2021 18:58:33 +0000 (GMT)
From: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 0/1] linux-user/s390x: save/restore condition code state
 during signal handling
Date: Thu, 10 Jun 2021 14:58:22 -0400
Message-Id: <20210610185823.14817-1-jonathan.albrecht@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SfewTBkPRFsg5r_qxxXOMkrIe9SpCycq
X-Proofpoint-ORIG-GUID: SfewTBkPRFsg5r_qxxXOMkrIe9SpCycq
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-10_11:2021-06-10,
 2021-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxlogscore=989 spamscore=0 mlxscore=0 impostorscore=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106100118
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=jonathan.albrecht@linux.vnet.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 10 Jun 2021 17:38:05 -0400
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
Cc: ruixin.bao@ibm.com, qemu-s390x@nongnu.org,
 Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, jonathan.albrecht@ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Bao <ruixin.bao@ibm.com> and I have been looking at some issues with
qemu user mode x86_64 host/s390x guest when running go1.14+ executables.
From the qemu cpu traces, it looks like the condition code is not restored
after a signal handler is run. This affects go1.14+ because it uses signals
heavily to implement the async preempt feature in the goroutine scheduler
that was added in go1.14.

This patch tries save and restore the condition code related fields when
handling a signal. We're submitting it as an RFC since we're new to qemu and
not sure if this is s390x specific. We have some C code (s390x specific)
that reproduces the issue and can try to add it as a unit test.

Jonathan Albrecht (1):
  linux-user/s390x: save/restore condition code state during signal
    handling

 linux-user/s390x/signal.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

-- 
2.31.1


