Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A67498DA3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 20:36:58 +0100 (CET)
Received: from localhost ([::1]:56236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC597-0008Sz-8x
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 14:36:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nC4MK-0003Xm-QL; Mon, 24 Jan 2022 13:46:33 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nC4MI-0005Ib-JG; Mon, 24 Jan 2022 13:46:32 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OIZjTY027747; 
 Mon, 24 Jan 2022 18:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=CgKVpJ9K6BJcOoNVmD+dtLicio86DlQiu3+d18+3ACY=;
 b=GJlM3JNf7DjI99mnHqQ9wtsueFjAFmaFE1f/+miJtboHJzZdrijLkb0kI8tWMvtYuSu2
 wxjRTknBwnY/i+eE5m+Syqd2UCFdNFSj1DYp+mq/rfqvLhBjOiPaR+A3oI1c9rCT2UsE
 V/phbzq0ti3EmqJsK5YTNOaF+v6Jb8C8BvGPkzxw1oTGmAPLWy9K3WqKrJL0t0/CWQG9
 YjAbtsmC/6lUN82Oz/PMrVj+vczGp+tuCYqRYpgB2N0ezh5QM3jCL9ahFFj4+FDBrROK
 Fqqw7y8TxQYXvqQwTJsYQtGEQUklMAXYlwlOiLSgo68V2Td9mdLHe+j5zCnGcs8G6CnO qQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dt0tuh4ha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 18:46:15 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20OIbsr6004941;
 Mon, 24 Jan 2022 18:46:14 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dt0tuh4gm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 18:46:14 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OIbMR6005894;
 Mon, 24 Jan 2022 18:46:13 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 3dr9j9vnfq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 18:46:13 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20OIkC5925690604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 18:46:12 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B44BDAE063;
 Mon, 24 Jan 2022 18:46:12 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E48CDAE071;
 Mon, 24 Jan 2022 18:46:10 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.24.67])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 24 Jan 2022 18:46:10 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] target/ppc: powerpc_excp improvements [BookS] (4/n)
Date: Mon, 24 Jan 2022 15:46:00 -0300
Message-Id: <20220124184605.999353-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wCylYSElDSF8N_FDWn-wb0eaxiKPp-6f
X-Proofpoint-ORIG-GUID: 7UgtaRVZc7oxcq6a7NgMf0_125VI_Hn6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_09,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=506 impostorscore=0
 clxscore=1015 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201240121
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series splits the exception code for BookS CPUs: 970, POWER5+,
POWER7, POWER8, POWER9, POWER10. After dealing with the 405, let's go
back to something more familiar to give everyone a break.

No upfront fixes this time. The pseries code gets used a lot, so there
are no obvious issues and the older BookS CPUs get the benefits by
default since they are similar.

Based on legoater/ppc-7.0

Fabiano Rosas (5):
  target/ppc: Introduce powerpc_excp_books
  target/ppc: Simplify powerpc_excp_books
  target/ppc: books: Machine Check exception cleanup
  target/ppc: books: External interrupt cleanup
  target/ppc: books: Program exception cleanup

 target/ppc/excp_helper.c | 308 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 308 insertions(+)

-- 
2.34.1


