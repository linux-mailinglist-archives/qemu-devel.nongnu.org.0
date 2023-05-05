Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65A36F827D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:03:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puu7z-0006Pk-Iy; Fri, 05 May 2023 08:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1puu7n-0006Lz-3D
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:01:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1puu7j-0001ug-VS
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:01:22 -0400
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 345Br6Xh012118; Fri, 5 May 2023 12:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=CCMAE4tmFUWaFFdIHTM1hfEetD9Mgao3rruxg1NfP6Q=;
 b=qygb6rnYgf4CBVryS6TBDKTEiaeFI1A26HvH0oThHnJUcOmI59aiBTr14pTGEKvQm81Z
 ZNX0zP26tEr9N3rDSPGKaM1glCFyLhVYTl7DhUhQdvAmQ+Qd1xpVVE34x1zurWPC/iA3
 DJCaMx4oO9xuI/TQza0dttD0UfoDCIb+T2ZA0Td7gEgXGtKi1WPFhSUAJ2T93Pgg+i02
 RM9uA7jEA0MC3CWIyqlNYwty8sxDpGQNdsbBosJhU0WOAyd70unh0L2RTobeB2QN1Eub
 +1PbqQwktLmlUioyU6NTquXJbfuxBHlKe7U51aXYWs+hMnAlUxOOoDdbwcCMOpf9zNLa xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qd1aq87cf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 12:01:08 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 345BuGDV023222;
 Fri, 5 May 2023 12:01:07 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qd1aq876u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 12:01:07 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34515XOO021023;
 Fri, 5 May 2023 12:00:58 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3q8tgg3ex0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 12:00:58 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 345C0qdM40829416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 May 2023 12:00:52 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3ACF120043;
 Fri,  5 May 2023 12:00:52 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF46220040;
 Fri,  5 May 2023 12:00:51 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.152.224.56])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  5 May 2023 12:00:51 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, thuth@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, fiuczy@linux.ibm.com,
 pasic@linux.ibm.com, nsg@linux.ibm.com, berrange@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com
Subject: [PATCH v7 0/1] util/async-teardown: appear in
 query-command-line-options
Date: Fri,  5 May 2023 14:00:50 +0200
Message-Id: <20230505120051.36605-1-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: si8a-N7fYzaAbMzDKKucQxzPmsZVrcW_
X-Proofpoint-ORIG-GUID: zEyT_V0bD5EeKaUtpOkhLIliOJA_24JG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_19,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050095
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add new -run-with option with an async-teardown=on|off parameter. It
is visible in the output of query-command-line-options QMP command, so
it can be discovered and used by libvirt.

The option -async-teardown is now redundant, deprecate it.

v6->v7
* move variable declaration inside #ifdef to avoid compile time errors
  on *BSD due to unused variables. [thomas]

v5->v6
* deprecate the old -async-teardown option instead of removing it,
  since it has now appeared in 2 QEMU releases
* use -run-with as a grab bag commandline option for the async-teardown
  boolean parameter [paolo,markus,thomas]

v4->v5
* reword commit message [Markus]
* document the removal of the -async-teardown commandline option in
  docs/about/removed-features.rst [Markus]

v3->v4
* completely remove the useless -async-teardown option, since it was
  not wired up properly and it had no users [thomas]
* QEMU should be always uppercase in text and documentation [thomas]
* if the new -teardown option fails to parse, exit immediately instead
  of returning an error [thomas]

v2->v3
* add a new teardown option with an async parameter [Markus]
* reworded documentation of existing -async-teardown option so that it
  points to the new teardown option

v1->v2
* remove the unneeded .implied_opt_name initializer [Thomas]

Claudio Imbrenda (1):
  util/async-teardown: wire up query-command-line-options

 docs/about/deprecated.rst |  5 +++++
 os-posix.c                | 13 +++++++++++++
 qemu-options.hx           | 34 +++++++++++++++++++++++-----------
 util/async-teardown.c     | 21 +++++++++++++++++++++
 4 files changed, 62 insertions(+), 11 deletions(-)

-- 
2.40.1


