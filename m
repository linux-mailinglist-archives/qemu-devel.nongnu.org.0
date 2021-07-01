Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AE83B8D67
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 07:29:01 +0200 (CEST)
Received: from localhost ([::1]:53920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lypG0-0003Jd-3X
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 01:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lypEy-0001yr-Py
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 01:27:56 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16624
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lypEx-00021b-4Z
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 01:27:56 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16152i5w067874; Thu, 1 Jul 2021 01:27:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=0EkIqQyvWfA4n8PA1q5s4lSaIZD+PAHg/eA2Ms9ZqWE=;
 b=fHp1sg9D3nhAVeXRDQiNAfT0W9RWN3UxEaNawhlxTikgLgMn9zUdGgotVNsHQHf42nYp
 DF/EhoDZkWxOKnA1MeD1EsLs206JUr8QwB0CJo/dD0hXmQx2tqnr43mwc2ibd6XTZU4n
 L7QG54qjTnMHEIA19MUL7QmN90taNSPpsO+UlcivBABZBHF6PbGizE0b0a8AaLfWPze4
 VOuSuxNwuwngr8d6I3v623c1i/ZiqJAl0WIXJjPFJS1j+6tRgjB+7UmtxzAu8P88c1My
 U93z46tfaMWFbJxSnaDqOSQrmrum12GSHD3ilrGsB9mMk6ycbsSo/pe8OYcPPYJ9IMhR 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39gv6s8vm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 01:27:52 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 161537Nj069714;
 Thu, 1 Jul 2021 01:27:51 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39gv6s8vkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 01:27:51 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1615MnJV010143;
 Thu, 1 Jul 2021 05:27:50 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 39h1y5qd5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 05:27:50 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1615RoAt37421468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 05:27:50 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09128AE013;
 Thu,  1 Jul 2021 05:27:50 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8690AE011;
 Thu,  1 Jul 2021 05:27:49 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.2.130.16])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  1 Jul 2021 05:27:49 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] hw/i386/pc: Clarify pc_system_ovmf_table_find usage
Date: Thu,  1 Jul 2021 05:27:47 +0000
Message-Id: <20210701052749.934744-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gJx0c2NDLLez9SxmwKSH1j-2dzabwyLh
X-Proofpoint-ORIG-GUID: FvW93-zBBICzIvi6pyMAy6GsKNkrm6_5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=814 adultscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107010034
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add assertion to verify that the flash was parsed (looking for the OVMF table),
and add documentation for pc_system_ovmf_table_find.

v3:
 - [style] remove static initalization to 'false'

v2:
 - add assertion (insert patch 1/2)

Dov Murik (2):
  hw/i386/pc: pc_system_ovmf_table_find: Assert that flash was parsed
  hw/i386/pc: Document pc_system_ovmf_table_find

 hw/i386/pc_sysfw.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

-- 
2.25.1


