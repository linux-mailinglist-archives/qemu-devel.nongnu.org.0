Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDD14C8DCC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:32:53 +0100 (CET)
Received: from localhost ([::1]:38972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3Ya-0000Qz-Ei
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:32:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nP3OZ-0002ia-3O
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:22:32 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10320
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nP3OX-0007H5-Ca
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:22:30 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221DhB5w007998
 for <qemu-devel@nongnu.org>; Tue, 1 Mar 2022 14:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=JQqW8uaYW4lIPNKfqbp5W5STiI2QNl/9uE69xi/qM6Y=;
 b=GQ4lXxfJL64B3m85RubQrbxUHdaYz84SAgV9PxntBVDW5+vTbc7iLHnup294yLGuK9Bo
 zzgFJbj2NHBnwPlC7K1apDZA3salqYvWyAnYtrw9xryLJLAjZ2WCNe6K9hYVfqW1fVjz
 7Agmepy6LN2H6YOHFsRi6ikVpon4mJvAg8nS+U2/Svq/OpD0pNZcBPPLsXtoRfvu1JBy
 DZ6qIAJNPVw1LyCtL4ULGwR8dl1nYkFp5DeqYkX/K1pmyw09877BwWccL8X3hH18YQ/8
 cou8pBXFrnPKEr1xuHOf3RNjx8iAg2P4DSsh3Nu9sJAmmsdhwqG+bI+A2KXGoc2hH3lB yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehmmbh06q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:22:26 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221DhVSU008496
 for <qemu-devel@nongnu.org>; Tue, 1 Mar 2022 14:22:26 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehmmbh060-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 14:22:25 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221EJYPJ011252;
 Tue, 1 Mar 2022 14:22:24 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3egbj171f7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 14:22:24 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221EMLTZ48431456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 14:22:21 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6BB311C050;
 Tue,  1 Mar 2022 14:22:21 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D18F711C052;
 Tue,  1 Mar 2022 14:22:20 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 14:22:20 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] dump: Cleanup and consolidation
Date: Tue,  1 Mar 2022 14:22:06 +0000
Message-Id: <20220301142213.28568-1-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lLvZiVE9neDMW_s_JbudQLtUZEWBBvQy
X-Proofpoint-ORIG-GUID: 2Gd7XQEPE2I2reGnb__kJBpEm9VYciaX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 mlxlogscore=428
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010077
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
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
I'd be happy if someone looks at the error handling.

It's taken me quite a while to understand how the code works and I
expect that this patch might improve that but it won't fix every
issue. Going forward it might make sense to split kdump and elf dump
code into separate files and also cleanup the kdump code.

Janosch Frank (7):
  dump: Introduce shdr_num to decrease complexity
  dump: Remove the sh_info variable
  dump: Add more offset variables
  dump: Introduce dump_is_64bit() helper function
  dump: Consolidate phdr note writes
  dump: Cleanup dump_begin write functions
  dump: Consolidate elf note function

 dump/dump.c           | 256 +++++++++++++++++++-----------------------
 include/sysemu/dump.h |  15 ++-
 2 files changed, 125 insertions(+), 146 deletions(-)

-- 
2.32.0


