Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811B932227F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 00:05:11 +0100 (CET)
Received: from localhost ([::1]:37798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEKGM-0005Pn-KY
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 18:05:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lEKCh-00030p-RE
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 18:01:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51042
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lEKCb-0006oV-Kl
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 18:01:23 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11MMYJ3o029274
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 18:01:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=nIw6kT5fqcpDOcA5FHUszC+TL+0iUHnZjBrlIX9b+JM=;
 b=mSY+S8pZZma4WZI5CaNKVzaP/i8jSMLeX6S19WrwV8Rpdfbva5siE9uBTknMADY0YBHs
 VkG9zMrNelQIE/EQ0nGKnFm0N8kEp4H7q3wwfftDFKULaAJIh86vyiTcw6a52dOkvxjV
 JHyuuTMmnThalro656PhfEyRFASDqG1ekf2EULw7Bn9pTHHLam7FRttJfyW7SJFhr8IB
 roSUYbH8W0LpPa/ikd+mKNe56sphcM1QnoxLAL5IVvengiCOBADMqYo8qXLj/i/gQDV5
 /tLH+qJWJp8rRE05e/1bVV++Zn+BqdXiPbIjwhtABOpkKAZUKpC9dwRcZC49vs54TcXc ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36vkn0m67x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 18:01:12 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11MMr0rH125664
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 18:01:11 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36vkn0m67d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 18:01:11 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11MMw3r5019030;
 Mon, 22 Feb 2021 23:01:11 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 36tt28tdvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 23:01:11 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11MN1ARX45482318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 23:01:10 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7103A6A047;
 Mon, 22 Feb 2021 23:01:10 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F118A6A051;
 Mon, 22 Feb 2021 23:01:09 +0000 (GMT)
Received: from Buonos-Thinkpad-X1.ibm.com (unknown [9.163.12.145])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 22 Feb 2021 23:01:09 +0000 (GMT)
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] gitlab-ci.yml: Add jobs to test CFI
Date: Mon, 22 Feb 2021 18:01:03 -0500
Message-Id: <20210222230106.7030-1-dbuono@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-22_07:2021-02-22,
 2021-02-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 mlxlogscore=765 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220194
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For a few months now QEMU has had options to enable compiler-based
control-flow integrity if built with clang.

While this feature has a low maintenance, It's probably still better to
add tests to the CI environment to check that an update doesn't break it.

As an added benefit, this also inherently tests LTO. The patch allow
gitlab testing of:
* --enable-cfi: forward-edge cfi (function pointers)
* --enable-safe-stack: backward-edge cfi (return pointers)

My original intention was to create a single chain of
build -> check -> acceptance, with all the targets compiled by default.
Unfortunately, the resulting artifact is too big and won't be uploaded.

So I split the test in two chains, that should cover all non-deprecated
targets as of today.

I also had to add a small patch to allow a custom selection for make
parallelism. This is because the gitlab runner nodes only have ~3.5GB of
ram, and with the default parallelism (2), in some cases two ld
instances will start working on two binaries and exaust the memory.
By only forcing one make job at a time, this is avoided.

Test runs of the full pipeline are here (cfi-ci branch):
https://gitlab.com/dbuono/qemu/-/pipelines/259931154

Daniele Buono (2):
  gitlab-ci.yml: Allow custom make parallelism
  gitlab-ci.yml: Add jobs to test CFI flags

 .gitlab-ci.yml | 94 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

-- 
2.30.0


