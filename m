Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B866CA60B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 15:36:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgn0y-0005XV-IC; Mon, 27 Mar 2023 09:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pgn0g-0005UG-PH
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:35:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pgn0c-00070s-84
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:35:41 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RD44a6011363; Mon, 27 Mar 2023 13:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=aQnq5+Ue+jypJ/itJsU0gGeEqp4CAfWMzPijTzf3Jnc=;
 b=TQZOn/5A/VfLX2eZs89jMVRH4w2p0l/q3clWIp2vF6PNfXPIWzoIZoaU0oZUgIHliuBJ
 Y8rWsp1iCq/XYicao5iaoev6f9DvV3jh436bFU9UFMMnMH0xlhFRPrDKu7TDPYmQ3T4c
 ILp+PtFyf0cOmImt17yZalwQXzrZS+5ByeWZLImNNuPgvTR21YrpleuxsIBxqDFDjDbr
 DahaowYBnCMK1EWZ1O2dC+xWJSU4hWLiCmP10uenLcueOufbmqRQNu6t6HStpOtuIplS
 2GkDlJpUF1UDRoYw169pN0OvI6sT5utSSmkIUV1cuoFYif6yOPWeCvynACtU30OSU0/M vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjasrh8eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 13:35:33 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32RDKdv5001963;
 Mon, 27 Mar 2023 13:35:32 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjasrh8db-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 13:35:32 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RAGk7Q030303;
 Mon, 27 Mar 2023 13:35:30 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3phr7fjud3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 13:35:30 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RDZQ7826477158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 13:35:26 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A6672004D;
 Mon, 27 Mar 2023 13:35:26 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4599220043;
 Mon, 27 Mar 2023 13:35:26 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.152.224.56])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 13:35:26 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, thuth@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, fiuczy@linux.ibm.com,
 pasic@linux.ibm.com, nsg@linux.ibm.com, berrange@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com
Subject: [PATCH v5 0/1] util/async-teardown: appear in
 query-command-line-options
Date: Mon, 27 Mar 2023 15:35:24 +0200
Message-Id: <20230327133525.50318-1-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _0OCfutQ2m5ZO9QmNMZqg4nbtPZoZS1L
X-Proofpoint-GUID: AQ4lH6v9wiEV4S895dkaFQrIhfRSwlHA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 mlxlogscore=976 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270107
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

Add new -teardown option with an async=on|off parameter. It is visible
in the output of query-command-line-options QMP command, so it can be
discovered and used by libvirt.

The option -async-teardown is now redundant. We'd normally deprecate it
and remove it after a grace period, but it was introduced only in the
previous version and it had no users, since it was not visible in the
query-command-line-options QMP command. Drop it.


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

 docs/about/removed-features.rst |  5 +++++
 os-posix.c                      | 15 +++++++++++++--
 qemu-options.hx                 | 33 +++++++++++++++++++--------------
 util/async-teardown.c           | 21 +++++++++++++++++++++
 4 files changed, 58 insertions(+), 16 deletions(-)

-- 
2.39.2


