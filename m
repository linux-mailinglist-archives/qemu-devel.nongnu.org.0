Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2B449EC5F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 21:19:45 +0100 (CET)
Received: from localhost ([::1]:59152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDBF9-0002BN-IH
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 15:19:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDB82-0006mz-0u; Thu, 27 Jan 2022 15:12:22 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDB7h-00079a-26; Thu, 27 Jan 2022 15:12:20 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20RJt1qE032433; 
 Thu, 27 Jan 2022 20:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=YqFshHSAmr5JiY59KBmJbOR41Vz2dQ5SOsEtPNGLdJo=;
 b=ojS72mCoZrCkNNnrUBRX+GyOwUwQRzc5klKx0O6XdcMCvYu2pqknsHftEbt/XcE0uB/R
 S9mu/kV8QLd+rW3HXtjUa93ivMUqHAnIkbqr5hsC6k0sty+WP9Q5Jx6bTWZkSXx0UVZX
 N+AaBP5C+Xsx58i0iFPMB+61rONH+YutM0f3SkruAzZqIreNHZVQspBEmvFNw9guOhOM
 1G4737nUHZRFmlJ8JAsnV0oQOx3JuuJo4a7OmOsBfbMLDV3BI1ELERfSFWITwpndP9VJ
 zYuesKvz41D1PPT7wbs3u/WxvVLG6N/4D+TX/vrpbMVTheBOiE8wqpGqQyvRfrx27Spc cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3duxbyvu5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 20:11:29 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20RK51As032946;
 Thu, 27 Jan 2022 20:11:28 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3duxbyvu5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 20:11:28 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20RK8hiv011357;
 Thu, 27 Jan 2022 20:11:27 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 3dr9jcvpua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 20:11:27 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20RKBPdB20054448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 20:11:25 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAE55112069;
 Thu, 27 Jan 2022 20:11:25 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBE31112063;
 Thu, 27 Jan 2022 20:11:22 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.129.51])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 20:11:22 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] target/ppc: powerpc_excp improvements [74xx] (5/n)
Date: Thu, 27 Jan 2022 17:11:08 -0300
Message-Id: <20220127201116.1154733-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rwf3ODV0WloZkgd3P3m8H0g9OT3DQbKx
X-Proofpoint-GUID: b9aJcj1WlJMi3bc2_BaqiDEZ8gCJczIT
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_03,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=454 malwarescore=0 spamscore=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270116
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
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
Cc: danielhb413@gmail.com, mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes from v1:

- Restored the 'sc 1' support to avoid breaking the pegasos2 machine.

I tested this version in the G4 with the following OSes:

- Linux 5.15 (5.16 seems to be broken, even with master)
- FreeBSD 13
- Mac OS 9.2
- Mac OS Darwin 6.0
- Mac OS X 10.4
- MorphOS 3.15 (-M pegasos2 and -M mac99,via=pmu)

Based on legoater/ppc-7.0

v1:
https://lore.kernel.org/r/20220126164200.1048677-1-farosas@linux.ibm.com

Fabiano Rosas (8):
  target/ppc: Introduce powerpc_excp_74xx
  target/ppc: Simplify powerpc_excp_74xx
  target/ppc: 74xx: Machine Check exception cleanup
  target/ppc: 74xx: External interrupt cleanup
  target/ppc: 74xx: Program exception cleanup
  target/ppc: 74xx: System Call exception cleanup
  target/ppc: 74xx: System Reset interrupt cleanup
  target/ppc: 74xx: Set SRRs directly in exception code

 target/ppc/excp_helper.c | 197 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 197 insertions(+)

-- 
2.34.1


