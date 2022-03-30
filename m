Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57484EC4E3
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 14:47:35 +0200 (CEST)
Received: from localhost ([::1]:48164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZXja-0000Pd-Ib
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 08:47:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nZXZT-0006Xf-3a
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:37:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nZXZP-0003Mb-Sx
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:37:05 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UBEiFf007792; 
 Wed, 30 Mar 2022 12:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=5HRoftA22pfXuq1qN4ZTU6lH6aOnSQm7eS+l9NxWfF8=;
 b=SNDYGL5mi4SNX4ZtHwnCOFkbK4ptbOxhXVQsaDd/kHByFjPf+0agymiHD5H0KFXvBd0/
 XFlU9uKxUCO43LvRfIitORK3RXz0274kqG8JqTRyFi6eFhAeuH9ujmPTdGygqJ0NGWFe
 /LvfTIwTPYHl4Bp1pIZJh3yl3ivrZKJD/+wVE3Qoz7FBYJ3MmMR5jNX4aL5iUqO5z4CY
 f480jOp7Z3SRXIfaJS/p677PDldUQJy5zvoP/CgNdeY6xUAlGn6XGTKvY6SvpPexTPSe
 X5s4oYhYzdxj4C2/7xK994fZsBLW21Csyja6GgMDeX73RwvPKP0vF1T4GBRi7SKAMHXL CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f3yy565bs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:00 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22UCTPlY018406;
 Wed, 30 Mar 2022 12:37:00 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f3yy565b2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:37:00 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22UCMLAX030939;
 Wed, 30 Mar 2022 12:36:58 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3f1tf90js2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:36:58 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22UCauMI40304968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 12:36:56 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17ED952069;
 Wed, 30 Mar 2022 12:36:56 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 98EEC52052;
 Wed, 30 Mar 2022 12:36:55 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/9] dump: Cleanup and consolidation
Date: Wed, 30 Mar 2022 12:35:54 +0000
Message-Id: <20220330123603.107120-1-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rGTQuw7f-9rydds1vk93jasaP9Zz6mHu
X-Proofpoint-ORIG-GUID: hyo51jN_5iTbdbipLqx3WAOVIo4Ndcep
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_03,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=628
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203300063
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: marcandre.lureau@redhat.com, richard.henderson@linaro.org,
 pbonzini@redhat.com
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

v3:
	* Rebased
	* Moved 64 bit tests to positive checks
	* Removed unneeded code
	* Added review-bys

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

 dump/dump.c           | 362 ++++++++++++++++++------------------------
 include/sysemu/dump.h |   9 +-
 2 files changed, 162 insertions(+), 209 deletions(-)

-- 
2.32.0


