Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 125886C130E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:18:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFNn-0002AR-HO; Mon, 20 Mar 2023 09:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1peFNl-00029a-3j
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:17:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1peFNj-0003Iu-7t
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:17:00 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32KCc0Qp026710; Mon, 20 Mar 2023 13:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=OSAI1djRISSw/HT5w2o36h5qPNNC+l2aQgOxdwENLi0=;
 b=hSCA22/sfjuAnsGJS2ZyCZOAGvGAsq3Vkq4z9kbnruxL25h3AoHywn0LlSPprvqzjTmu
 Vsf9SGENFNawDUXF8CtnWHPh55+/hV0yStxi9GUZLJ1WsfriLdZNoMJrCjLBDNX6Qnoz
 2Nyn4QySVzu73p76GcSEzv5JhE2fXtyPUAtfU8Q96xj0xCjundNCe76+29l4b34Tbgxc
 E883SuH8flhdjouCxqS3newUqeXEq4+CKokLtIrugOSS34pcqexqOc8jSci33ebxkIwG
 bCr6QjQYZ5G5WHOG4L5f58HvZx51J86YzZYbEqHt4vvc3c0jXJOLy33imalvy/BoUo2/ MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pdprjhxqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 13:16:56 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32KCdTQI030395;
 Mon, 20 Mar 2023 13:16:55 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pdprjhxp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 13:16:55 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32KBOcDs021620;
 Mon, 20 Mar 2023 13:16:53 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3pd4x6ar48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 13:16:53 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32KDGn3E49545578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Mar 2023 13:16:49 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FB6F20040;
 Mon, 20 Mar 2023 13:16:49 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA14C2004B;
 Mon, 20 Mar 2023 13:16:48 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.152.224.56])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 20 Mar 2023 13:16:48 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, thuth@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, fiuczy@linux.ibm.com,
 pasic@linux.ibm.com, berrange@redhat.com, alex.bennee@linaro.org,
 armbru@redhat.com
Subject: [PATCH v2 0/1] util/async-teardown: wire up query-command-line-options
Date: Mon, 20 Mar 2023 14:16:47 +0100
Message-Id: <20230320131648.61728-1-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IxJC7RYyJIOVcWQ05IOCRoqvLet1QWyn
X-Proofpoint-GUID: zhx2xYCECE5hKdgks_hvqqS9LVJ8p9VD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_08,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200110
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

This patch fixes the issue by correctly wiring up the commandline
option so that it appears in the output of query-command-line-options.

v1->v2
* remove the unneeded .implied_opt_name initializer [Thomas]

Claudio Imbrenda (1):
  util/async-teardown: wire up query-command-line-options

 util/async-teardown.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

-- 
2.39.2


