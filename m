Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D066C32BD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:23:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pebx0-00044N-VB; Tue, 21 Mar 2023 09:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1peUZr-0001s3-9o
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 01:30:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1peUZp-0008MH-8B
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 01:30:31 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32L3srMM016905; Tue, 21 Mar 2023 05:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=8EX4Q1YB/XAJThNELr3mUPw0jcickSee2bSEZfbWvFQ=;
 b=LNNtVJ6/IKF/bjfCTeScckp62ENF1C1u643wps0myzaHbwjmvhH2x8tOnJupZjtmvfO5
 K1yFsVTDWh2c3qNtfpnBtbqOomaNXUyltRfWleMJNucaPKLEqUb8VT/ReHatgsoOXhp3
 uADkYNftUT7ByIHp6iMKq+zfQQiGx1c+uGoYu+IpXj1kV6i6hF5GkaHX2bzxS3vLpOSZ
 cqBiyiWEl31IUioG34NGt4yiaBOY+bOGlgfWTKfsSQ9kRE2+heFM3exCie/KLCZVgVdl
 83FL1coqCUTOiA2TUp4u71Hk+f1ekd1WVGq/SZnvhMOurfyjcJnwDLkfzmOxXSQPItos 5A== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pf53csk9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Mar 2023 05:30:13 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32L2uY8K006394;
 Tue, 21 Mar 2023 05:30:12 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3pd4x74wmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Mar 2023 05:30:12 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32L5UAZW7864980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Mar 2023 05:30:11 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB1E85805F;
 Tue, 21 Mar 2023 05:30:10 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC18C58043;
 Tue, 21 Mar 2023 05:30:10 +0000 (GMT)
Received: from gfwa601.aus.stglabs.ibm.com (unknown [9.3.62.226])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Tue, 21 Mar 2023 05:30:10 +0000 (GMT)
Received: by gfwa601.aus.stglabs.ibm.com (Postfix, from userid 155676)
 id 3EA7B2E5674; Tue, 21 Mar 2023 00:30:10 -0500 (CDT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, joel@jms.id.au, andrew@aj.id.au,
 stefanb@linux.ibm.com, clg@kaod.org
Subject: [PATCH 0/3] Add support for TPM devices over I2C bus
Date: Tue, 21 Mar 2023 00:29:58 -0500
Message-Id: <20230321053001.3886666-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -0mPy0T-fsk8bI1ZhGg3bfCqe-HrEwq3
X-Proofpoint-ORIG-GUID: -0mPy0T-fsk8bI1ZhGg3bfCqe-HrEwq3
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_02,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1011 malwarescore=0 mlxscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=793 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303210036
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@us.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Mar 2023 09:22:51 -0400
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

This drop adds support for the TPM devices attached to the I2C bus. It
only supports the TPM2 protocol. You need to run it with the external
TPM emulator like swtpm. I have tested it with swtpm.

I have refered to the work done by zhdaniel@meta.com but at the core
level out implementation is different.
https://github.com/theopolis/qemu/commit/2e2e57cde9e419c36af8071bb85392ad1ed70966 

Based-on: $MESSAGE_ID

Ninad Palsule (3):
  Add support for TPM devices over I2C bus
  Add support for TPM devices over I2C bus
  Add support for TPM devices over I2C bus

 docs/specs/tpm.rst      |   5 +-
 hw/tpm/meson.build      |   1 +
 hw/tpm/tpm_tis.h        |   2 +
 hw/tpm/tpm_tis_common.c |  33 ++++
 hw/tpm/tpm_tis_i2c.c    | 342 ++++++++++++++++++++++++++++++++++++++++
 include/hw/acpi/tpm.h   |   2 +
 include/sysemu/tpm.h    |   3 +
 7 files changed, 387 insertions(+), 1 deletion(-)
 create mode 100644 hw/tpm/tpm_tis_i2c.c

-- 
2.37.2


