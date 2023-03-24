Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FB16C83A3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 18:47:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pflUq-0006xi-6D; Fri, 24 Mar 2023 13:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pflUm-0006wd-6N
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:46:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pflUk-0001nj-Eo
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:46:31 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32OFNA4L026901; Fri, 24 Mar 2023 17:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=qBo69PZLllXwyz0MSbHCCavqLwe6ySBbWWuk7HgXlCQ=;
 b=mDMRsfMqcfZ6R7BS79VAZkN2wutVaDmTWmYPAl3GEqLaaqizbkCNp7ids24LAPdHH53q
 oiRAn4DT/1e33XOTeKMixxtcp1aSpp6/GH0yweyb7y73LERd4A7aetySA9BYTO/xHsJe
 Xns9Bj1BjjxqXsp93I5Oc1WhVnm1DnTsHWdDYrn0r6DteCtq99939bYpf00/uAnDN0Wr
 mA7S3wM9ShY85PAbSI0snRIOv18QWvAGS2LPI79T1GK7NflgObFag45yMIWYKgYPIs9q
 oQfKQmf4NqHPrwEsx1f4jdQ4WnbRzNIGPBdIaPFB7dafYVzR0Sp01qhPp7YHEcqDEhbD 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pheexb9dm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 17:46:16 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32OFqriN001010;
 Fri, 24 Mar 2023 17:46:16 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pheexb9cx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 17:46:16 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32ODR2ll013783;
 Fri, 24 Mar 2023 17:46:13 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3pgy3s1380-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 17:46:13 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32OHkA1e47841612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Mar 2023 17:46:10 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 146C120040;
 Fri, 24 Mar 2023 17:46:10 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5732E20043;
 Fri, 24 Mar 2023 17:46:09 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.179.5.149])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 24 Mar 2023 17:46:09 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, thuth@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, fiuczy@linux.ibm.com,
 pasic@linux.ibm.com, nsg@linux.ibm.com, berrange@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com
Subject: [PATCH v3 0/1] util/async-teardown: wire up query-command-line-options
Date: Fri, 24 Mar 2023 18:45:58 +0100
Message-Id: <20230324174559.44933-1-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5rPVLotIfoj8T8oZWYUzHAhdSdghfSwN
X-Proofpoint-ORIG-GUID: t_QZDy9WZGZH2SHR1Hyvv_4z3T3AE2eq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240138
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The recently introduced -async-teardown commandline option was not
wired up properly and did not show up in the output of the QMP command
query-command-line-options. This means that libvirt will have no way to
discover whether the feature is supported.

This patch fixes the issue by adding a new -teardown commandline option
with an async=on|off parameter, correctly wired up so that it appears
in the output of query-command-line-options.

v2->v3
* add a new teardown option with an async parameter [Markus]
* reworded documentation of existing -async-teardown option so that it
  points to the new teardown option

v1->v2
* remove the unneeded .implied_opt_name initializer [Thomas]

Claudio Imbrenda (1):
  util/async-teardown: wire up query-command-line-options

 os-posix.c            | 14 ++++++++++++++
 qemu-options.hx       | 35 ++++++++++++++++++++++++-----------
 util/async-teardown.c | 21 +++++++++++++++++++++
 3 files changed, 59 insertions(+), 11 deletions(-)

-- 
2.39.2


