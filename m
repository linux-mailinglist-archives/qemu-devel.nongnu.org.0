Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF6D4D4564
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:12:19 +0100 (CET)
Received: from localhost ([::1]:44334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGiQ-0001sw-ME
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:12:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfS-0007Dz-5V
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:14 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGfO-0004eB-Um
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:09:13 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AA93K4003304
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=D9UqT7h2PmiTjB9H7BtDpskOWyZEwqG/or/0gr3A6gU=;
 b=EEWQ2bvAaOxlJGyG/Wov8wEaSl/beaZkKfWhlpcNTdCvYIpdv0gnPqqxJVNw1g+5Sp6/
 tBkD4KK+SPuc72BJkrD3R/ng4Vv2fkB0zRbWlZFRNZCjWG0yq7aln1ChqDzIc2Yw8csC
 5iCTh+u+umvFAGw32K+C3vjqDsRh3Fxt6Uefc5srzzwLaTWXej1bHtIsH+PTcVZmQ/pt
 LCdzDAj0/Bzj3UYJOk75srKCk58kC8oncEvqr3MjvRRjgr9y+0XcdTTP8Pib2vRwhmoO
 uV7/RFsa025C3QA4bZ8DlkywxdJSpU3a7Z7YuM1y7rmjLRkEN17O4s8OFObFWPGDAVW5 eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eq9svqq23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:09 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AAgqoB018181
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:09:09 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eq9svqq1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:09 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22AB3uWD032436;
 Thu, 10 Mar 2022 11:09:07 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 3epysw9h38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:09:07 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22AB92P636569490
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 11:09:02 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5816F11C06E;
 Thu, 10 Mar 2022 11:09:02 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1D0F11C06C;
 Thu, 10 Mar 2022 11:09:01 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 11:09:01 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/9] dump: Cleanup and consolidation
Date: Thu, 10 Mar 2022 11:08:45 +0000
Message-Id: <20220310110854.2701-1-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wbRWmxOecgZ5aVA8YG5jR4xkZa6J8vDD
X-Proofpoint-GUID: fYue-lnwxW9JfLI8NM1C1tfcyDLPaj6w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1015 mlxlogscore=515
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The dump/dump.c file has lots of duplicated code for handling 64 and
32 bit elf files. Additionally there are many instances where code can
be improved by adding a variable to avoid having to specify the same
calculation or check over and over.

This series is the cleanup step onto which my series that adds custom
section support and finally the series that introduces PV dump support
are based on.

Personal comments:
It's taken me quite a while to understand how the code works and I
expect that this patch might improve that but it won't fix every
issue. Going forward it might make sense to split kdump and elf dump
code into separate files and also cleanup the kdump code.

v2:
	* Added the ERRP_GUARD() patch which converts dump.c to the
          new error handling methods
	* Switched patches #2 and #3 around
	* Added a patch that removes the section if/else
	* Moved dump_is_64bit() to dump.c


Janosch Frank (9):
  dump: Use ERRP_GUARD()
  dump: Remove the sh_info variable
  dump: Introduce shdr_num to decrease complexity
  dump: Remove the section if when calculating the memory offset
  dump: Add more offset variables
  dump: Introduce dump_is_64bit() helper function
  dump: Consolidate phdr note writes
  dump: Cleanup dump_begin write functions
  dump: Consolidate elf note function

 dump/dump.c           | 361 ++++++++++++++++++------------------------
 include/sysemu/dump.h |   9 +-
 2 files changed, 164 insertions(+), 206 deletions(-)

-- 
2.32.0


