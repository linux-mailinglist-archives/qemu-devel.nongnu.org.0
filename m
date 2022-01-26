Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0EC49D007
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:51:26 +0100 (CET)
Received: from localhost ([::1]:37106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClW1-0004eK-3O
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:51:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nClNZ-0004vK-NI; Wed, 26 Jan 2022 11:42:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nClNV-00059X-PI; Wed, 26 Jan 2022 11:42:40 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QGa9JH010579; 
 Wed, 26 Jan 2022 16:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=YrvffYeBgzjpr4BP2CQUtWoMTLDGwnWftjt6IGfV6JA=;
 b=MZ3X0bSK8q3uZhyxszNyY7RcYuWdbB9dDyBosKfrWRkxlw4S5z2kjo3mP21m7t+xgkaA
 08GXSRbTXzMM5OthBgy/yaP2vFyapg3UEL8QaK7yIfSoDROY2gMrBqBXgw4sImNinc3C
 WDwn2bEfC8oop/6sWHy6ApRlAzF2YjKWk1eFr3Y/Jnum8nMtAy4goaDQ/eEKYie4dlUG
 NQr/BgCjc7JgfTV22qjrG1cQJGVUm5UDMurvUlRWt8cZ9qPqvf6JR/qNhZJKdbsCAiuJ
 62HYcfoRXQebR9NQvPcZDeD/VjCof6Lc+vU2sEwdGQZGZ9UHOAxQWo7VvL6CpwxqOtP+ Xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3du9j60ndt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 16:42:11 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20QGcLFV020198;
 Wed, 26 Jan 2022 16:42:10 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3du9j60ndc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 16:42:10 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20QGX6Sf004862;
 Wed, 26 Jan 2022 16:42:09 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02dal.us.ibm.com with ESMTP id 3dt1xab064-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 16:42:09 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20QGg8xm26608068
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:42:08 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51F9478064;
 Wed, 26 Jan 2022 16:42:08 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EEF07805F;
 Wed, 26 Jan 2022 16:42:06 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.99.130])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 26 Jan 2022 16:42:06 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] target/ppc: powerpc_excp improvements [74xx] (5/n)
Date: Wed, 26 Jan 2022 13:41:52 -0300
Message-Id: <20220126164200.1048677-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZXIAVeZSOgbhnuDKi-dRd6xBCaejhhoq
X-Proofpoint-ORIG-GUID: CHcYjencpCIAxDk6aADzvFEGvonL5_ut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_06,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=538
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201260101
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This handles the exception code for the 74xx family, i.e. 7400, 7410,
7440, 7445, 7450, 7455, 7457.

This is another family that is quite well known, so it should be
straight-forward as well.

Based on legoater/ppc-7.0

Fabiano Rosas (8):
  target/ppc: Introduce powerpc_excp_74xx
  target/ppc: Simplify powerpc_excp_74xx
  target/ppc: 74xx: Machine Check exception cleanup
  target/ppc: 74xx: External interrupt cleanup
  target/ppc: 74xx: Program exception cleanup
  target/ppc: 74xx: System Call exception cleanup
  target/ppc: 74xx: System Reset interrupt cleanup
  target/ppc: 74xx: Set SRRs directly in exception code

 target/ppc/excp_helper.c | 175 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 175 insertions(+)

-- 
2.34.1


