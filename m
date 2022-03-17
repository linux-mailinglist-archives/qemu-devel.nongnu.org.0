Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B364DCC50
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 18:23:03 +0100 (CET)
Received: from localhost ([::1]:58612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUtq3-0000k9-2X
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 13:23:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nUtoK-0006Zz-M9; Thu, 17 Mar 2022 13:21:16 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nUtoJ-0004d0-6w; Thu, 17 Mar 2022 13:21:16 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22HGA9nu026449; 
 Thu, 17 Mar 2022 17:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=8XH/Y8Bea0svG7Y8RDWQ4aFbABOu4aVPSDt6U2Tc1Z4=;
 b=CjuwHx5JrnoffDPgzZD+90fwRLPhMhVoQ8cKdEXq+Gwyodw/72yvJ7H7e9Tk+ccZqXn4
 A6VKjX8GrMgfT8h9syvIpWYva3eCbwTPdMU4ZFY84lPyWX9msFQJG9jAbZyaJOZR68uW
 S7vfb5nUHSwQL9Q4ezalazlMDSKm99wp9H6pI3BKBeKWypuwAufObNXguk0Z4EtJNdBK
 QS3LVXn3egFYSZXIUKjsd3TMn+kyIcpnI3YgKLySgBFOnNBe4iI6WINMkSHK/qG9OG1y
 IJIocj3HZQiGUC3jir5Yw1JEgu3LYxzdmHyKzSHp7GxnUf2XUG9Pf8q06bg1hz9CP2av yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev10j32u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 17:21:01 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22HGV3uv012879;
 Thu, 17 Mar 2022 17:21:01 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev10j32t8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 17:21:01 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22HHI4EP026278;
 Thu, 17 Mar 2022 17:21:00 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04wdc.us.ibm.com with ESMTP id 3erk5a4v40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 17:21:00 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22HHKwfk22413760
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Mar 2022 17:20:59 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD93AAC05F;
 Thu, 17 Mar 2022 17:20:58 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4276BAC05E;
 Thu, 17 Mar 2022 17:20:56 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.55.207])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Mar 2022 17:20:55 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] spapr: Nested TCG is TCG only
Date: Thu, 17 Mar 2022 14:20:46 -0300
Message-Id: <20220317172049.2681740-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ojQVrZSuQwcmBsyh33DOGTuok73J8dw2
X-Proofpoint-GUID: OrtEy4w3IzKicpNVlBR593yeUU5FIQN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-17_07,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=718 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203170093
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org, npiggin@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In a KVM-only scenario that does not support nested KVM, a well
written guest would never try to call nested KVM hypercalls. However,
if a buggy or malicious guest calls the nested KVM API even without
nested KVM support, the L0 would redirect the hypercalls into
QEMU. Previously this would have caused an H_FUNCTION return for every
call, but now that QEMU knows about the nested KVM API, it tries to
service the calls. This is incorrect because the spapr virtual
hypervisor implementation of the nested KVM API depends on the first
level guest to be emulated by TCG.

So add guards against that and move the whole code under CONFIG_TCG.

Fabiano Rosas (3):
  spapr: Ignore nested KVM hypercalls when not running TCG
  spapr: Move hypercall_register_softmmu
  spapr: Move nested KVM hypercalls under a TCG only config.

 hw/ppc/spapr_hcall.c | 76 ++++++++++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 31 deletions(-)

-- 
2.34.1


