Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173136A86E3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:39:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlvw-0006Xc-Vz; Thu, 02 Mar 2023 11:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pXlvs-0006Lm-Lg; Thu, 02 Mar 2023 11:37:28 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pXlvr-0000g3-2O; Thu, 02 Mar 2023 11:37:28 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322GVLlh001114; Thu, 2 Mar 2023 16:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=rr/NJoNr2QN9YEEAR99VQvWyJ3MK7ofKLsgMC2uf/ZM=;
 b=F+s+KSdz4vMnOerbqmelCdVdFd7CSTLegyELOt22h9CQ8zOUGjsE0xF4Fl2xa5uutqqx
 KCXrpdrLwLMmuQqQN2owvOYJl1hMQjSgY+4EMhWPLbtqN2I+JBc+UDqiPvtrW6XWWhJB
 KSjcHnxL8RmEMhdo2ilJdTRWQ4RgCsrIX2U0FNO+t4g9xGW7MKV4WWb02WZJkGi19+vx
 uWJ02Zf6erwpYham+ZDaGG0vnIxzOmXavOpp/VS9JacUSjm+GZhcBhhiQxsWcFc7Pwu0
 PVB5uYhBWYq/8OHmhEPule9vo+0aLGBEmXrgnNKpG+dQLzRjA0NZKn7KaTz2FY3mKI2L iA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2y6rrn22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 16:37:21 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 322GWL8h010978;
 Thu, 2 Mar 2023 16:37:21 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2y6rrmyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 16:37:21 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 322FUNVH031941;
 Thu, 2 Mar 2023 16:37:18 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3nybe2mf9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 16:37:18 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 322GbGdH1704660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Mar 2023 16:37:16 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C5EF20043;
 Thu,  2 Mar 2023 16:37:16 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E3E220040;
 Thu,  2 Mar 2023 16:37:15 +0000 (GMT)
Received: from borneo.ibmuc.com (unknown [9.171.65.81])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  2 Mar 2023 16:37:15 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 0/4] user-created PHB cleanup
Date: Thu,  2 Mar 2023 17:37:11 +0100
Message-Id: <20230302163715.129635-1-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ILQgtCJuRLo5zJG1zDi-ThxxS6rqIeV_
X-Proofpoint-ORIG-GUID: hn7Uf9JeDeVaQ7C87Qa1rU2ThJM77yeS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_09,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=758 impostorscore=0 clxscore=1011 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303020144
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

A short series with some cleanup around user-created PHB. The main
point is to remove errors seen from the firmware (skiboot) when using
user-created PHBs, as we were always showing all the default PHBs in
the device tree, so skiboot tried to probe non-existing devices. The
first 2 patches allow to only export the user-created PHBs in the
device tree when 'nodefaults' is used.
The last 2 are more cosmetic and moving code around where it makes
more sense.


Frederic Barrat (4):
  pnv_phb4_pec: Keep track of instantiated PHBs
  pnv_phb4_pec: Only export existing PHBs to the device tree
  pnv_phb4_pec: Move pnv_phb4_get_pec() to rightful file
  pnv_phb4_pec: Simplify/align code to parent user-created PHBs

 hw/pci-host/pnv_phb.c          | 11 +++++-
 hw/pci-host/pnv_phb4_pec.c     | 61 +++++++++++++++++++++++++----
 hw/ppc/pnv.c                   | 70 ++++------------------------------
 include/hw/pci-host/pnv_phb4.h |  3 ++
 include/hw/ppc/pnv.h           |  2 +-
 5 files changed, 76 insertions(+), 71 deletions(-)

-- 
2.39.2


