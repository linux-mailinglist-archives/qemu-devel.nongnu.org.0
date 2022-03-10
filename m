Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C004D459B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:23:41 +0100 (CET)
Received: from localhost ([::1]:49610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGtR-0007xH-08
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:23:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGmc-0004DK-2Z
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:16:38 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGma-0005sq-4k
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:16:37 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AA52j9011865
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=yJ+sojS81kis11FB6/+UUapcr087Ou6PCbKsVSO1isU=;
 b=dygmCLElLLw06EZ0u9MWD1kSp7axtNFHo02YBALOralx4RIzkOcQXt8OoPGwpyXHM46u
 70r2ycsfGcR/htVlutKE3OKkYgYZnJSLF73XoSGHNshHcqrBdgI0qOwbnST8vugWwmW7
 K8LtE4VVypFasfQyh9ZWkeBkjZOSZ1LB5jwf5CSYqEqqyXg7Tts7aHALzSnlEiKzIlDH
 9klC0WgiKL4dha0Nl5xLN11vm7YDBlor+04iQEsUwgeoU0SifaPG5Zho8u3IKHsN806T
 6Nb17exSvml6x/HiHqAmNIQBo5b67w0nfcqKHGpN9TTDR2hlrMJIcpA1a8iP+nf789OS Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqctrcf8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:16:34 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AAfAqZ030576
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:16:33 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqctrcf82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:16:33 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22ABDKvA009150;
 Thu, 10 Mar 2022 11:16:31 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3eky4j4hc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:16:31 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22ABGTtf45154730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 11:16:29 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 168674C046;
 Thu, 10 Mar 2022 11:16:29 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D7594C044;
 Thu, 10 Mar 2022 11:16:28 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 11:16:28 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] dump: Add custom arch section support
Date: Thu, 10 Mar 2022 11:16:03 +0000
Message-Id: <20220310111608.3362-1-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MFaRESwou6X1-3t1hvSgFII9sVJ_NJ4n
X-Proofpoint-ORIG-GUID: ls6nIux8vSYaruGnNa8dkPMUiAIKWpd2
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=725 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100059
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marcandre.lureau@redhat.com, mhartmay@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Architectures already provide custom cpu data via elf notes but
there's currently no way for an architecture to add other custom data
to dumps.

s390x for instance needs to store special data in the dump when
dumping protected guests so the vm owner can decrypt the dump and
access the vm data.

Similar to the cpu notes which work by using hooks we introduce new
hooks to add custom sections. The ArchDumpInfo struct now contains
three new functions hooks that the architectures can set:

void (*arch_sections_add_fn)(void *opaque);
This function can be used to manipulate the number of sections and the
size of the cummulative section data.

uint64_t (*arch_sections_write_hdr_fn)(void *opaque, uint8_t *buff);
This function is used to write the elf headers for the custom sections
so architectures can control all values in the section headers.

void (*arch_sections_write_fn)(void *opaque, uint8_t *buff);
Lastly this function is used to write out the section data.


To make section identification easier we also introduce section string
table support.

Based on:
https://lore.kernel.org/qemu-devel/20220310110854.2701-1-frankja@linux.ibm.com/T/#t


Janosch Frank (5):
  dump: Allocate header
  dump: Split write of section headers and data and add a prepare step
  dump: Reorder struct DumpState
  dump/dump: Add section string table support
  dump/dump: Add arch section support

 dump/dump.c                | 338 +++++++++++++++++++++++++++----------
 include/sysemu/dump-arch.h |  27 +++
 include/sysemu/dump.h      |  24 ++-
 3 files changed, 294 insertions(+), 95 deletions(-)

-- 
2.32.0


