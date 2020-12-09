Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57DF2D47DA
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:27:08 +0100 (CET)
Received: from localhost ([::1]:46130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3F5-0005wQ-JQ
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1kn3C4-0004Qa-KK
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:24:00 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1kn3Bz-0000rH-0L
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:24:00 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B9H2MpL191539; Wed, 9 Dec 2020 12:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=qJ32wwBfkdVmfDSbJsBqzNSCePrk0Vf+Gw8vKQ6a6XU=;
 b=ptQna4VY0rJF6FHPxLeXXdbZbrPF65ZKrOi9SIMiAcuqq1oHmZWvrDKN4zJNsHgHQuwl
 rQ4It4vKpFMPFGJIdcEmbhCThPrrb6Y8Nr8b50/C5HOA3xedjapxzAVClJ8dwETS93zc
 5Ev51wj03XEYmtPqwP7TJ/8Ij6vU252E9K/TXEMDudE7cic1W6l1bB4UUuqs0RHHtos+
 wav2Y8nuOoH3J+Z0d18wLybcTW/zNRzuCYFHL8SY+XJ4SstdMP1sNQEIeTYbNKv0Lzv9
 e96Qz6BAuSRhsIRU21hMVfa36vc7HO6zDNR9+bZkln2z0LH0Rm2eorqt0iINFKuF0/9P ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35ay1jgn3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 12:23:49 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B9H4kDI008529;
 Wed, 9 Dec 2020 12:23:49 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35ay1jgn3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 12:23:49 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B9HJVDw015302;
 Wed, 9 Dec 2020 17:23:48 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 3581u9h7g2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 17:23:48 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B9HNkQa33685966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 17:23:46 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 739C328059;
 Wed,  9 Dec 2020 17:23:46 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B25BB2805A;
 Wed,  9 Dec 2020 17:23:44 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.85.183.17])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 17:23:44 +0000 (GMT)
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] sev: enable seret injection to a self described area in
 OVMF
Date: Wed,  9 Dec 2020 09:23:31 -0800
Message-Id: <20201209172334.14100-1-jejb@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_14:2020-12-09,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1011 mlxlogscore=649
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090116
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, brijesh.singh@amd.com,
 david.kaplan@amd.com, jejb@linux.ibm.com, jon.grimm@amd.com, tobin@ibm.com,
 frankeh@us.ibm.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 dovmurik@linux.vnet.ibm.com, Dov.Murik1@il.ibm.com, pbonzini@redhat.com,
 berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series includes one from Tobin that has already been posted
and reviewed:

https://lore.kernel.org/qemu-devel/20201027170303.47550-1-tobin@linux.ibm.com/

I'm adding it here because it's a required precursor, but it can be
dropped from this series if it's already being upstreamed elsewhere.

The remaining two patches introduce a parser for the optional OVMF
description table which is placed just below the reset vector (the
format of the table is described in the patch itself) and also adds a
hook to pull out the description of the SEV secret area location and
use it in place of the sev-inject-launch-secret gpa.

James

---

James Bottomley (2):
  pc: add parser for OVMF reset block
  sev: update sev-inject-launch-secret to make gpa optional

Tobin Feldman-Fitzthum (1):
  sev: add sev-inject-launch-secret

 hw/i386/pc_sysfw.c        | 95 +++++++++++++++++++++++++++++++++++++++
 include/hw/i386/pc.h      |  4 ++
 include/monitor/monitor.h |  3 ++
 include/sysemu/sev.h      |  2 +
 monitor/misc.c            | 17 +++++--
 qapi/misc-target.json     | 18 ++++++++
 target/i386/monitor.c     | 27 +++++++++++
 target/i386/sev-stub.c    |  5 +++
 target/i386/sev.c         | 65 +++++++++++++++++++++++++++
 target/i386/trace-events  |  1 +
 10 files changed, 233 insertions(+), 4 deletions(-)

-- 
2.26.2


