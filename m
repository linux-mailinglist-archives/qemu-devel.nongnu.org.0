Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDEF46D92C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 18:03:54 +0100 (CET)
Received: from localhost ([::1]:43622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv0MD-0001Ec-A5
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 12:03:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mv0Ij-0005oP-53; Wed, 08 Dec 2021 12:00:21 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:23796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mv0Ig-0001tc-VU; Wed, 08 Dec 2021 12:00:16 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B8GJ2OU008326; 
 Wed, 8 Dec 2021 17:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Xm5GM7oscccAPWamnvx8xx2eeqE3G392AEJJ8tqeVY8=;
 b=XEkyr8Cpv+wP0QoM+9UHwwEHR9CyoeRE0Ae6FH4zbWSgef2shsaHeSn/LAX6qkZLuy7v
 uPd+kF3peuOBZnDui2ecv8+UF15kLlLDnA48MpsP/aYO9k9wKHiQ6vyhuItAZaVztm3d
 sX64pqw7DX1j2oLJaJ+5io03CeqUAKlbG/aGpL8PaDJ7fds9KvFm9Of2a92UeM5OYP0A
 uZQSHlJi67XuaR0Di+XosHR3sXib9vXReE045Szf++H9brsU6gk0ZAD9gAyNmIpBx9Hx
 C28NVkSWH/6s3X+8uFOL3541tcFakIm/+S4yj3yN/8q9shjmdX/D/n+PJX82BtbKnbU3 Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cu0430ue9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 17:00:09 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B8GjnWW023994;
 Wed, 8 Dec 2021 17:00:09 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cu0430udn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 17:00:08 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B8GwtUZ029432;
 Wed, 8 Dec 2021 17:00:08 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 3cqyyb6ef1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 17:00:08 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B8H07mU50201080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Dec 2021 17:00:07 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0D0CC6098;
 Wed,  8 Dec 2021 17:00:06 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B740C6090;
 Wed,  8 Dec 2021 17:00:05 +0000 (GMT)
Received: from lagarcia.br.ibm.com.com (unknown [9.65.76.184])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Dec 2021 17:00:04 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-ppc@nongnu.org
Subject: [PATCH 2/3] docs: Rename ppc-spapr-hcalls.txt to ppc-spapr-hcalls.rst.
Date: Wed,  8 Dec 2021 13:59:17 -0300
Message-Id: <7f13e40e05ddb411697b0777b0e37757f76905e9.1638982486.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1638982480.git.lagarcia@br.ibm.com>
References: <cover.1638982480.git.lagarcia@br.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UP-jgJ5Cy4g1arfPB8EV5yd6omBK1vDX
X-Proofpoint-ORIG-GUID: 7OwROqHIo7qq8mqbq3oHEoZBoSa7BNVa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_06,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 mlxlogscore=735 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112080097
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, groug@kaod.org, qemu-devel@nongnu.org, clg@kaod.org,
 Leonardo Garcia <lagarcia@br.ibm.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
---
 docs/specs/{ppc-spapr-hcalls.txt => ppc-spapr-hcalls.rst} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename docs/specs/{ppc-spapr-hcalls.txt => ppc-spapr-hcalls.rst} (100%)

diff --git a/docs/specs/ppc-spapr-hcalls.txt b/docs/specs/ppc-spapr-hcalls.rst
similarity index 100%
rename from docs/specs/ppc-spapr-hcalls.txt
rename to docs/specs/ppc-spapr-hcalls.rst
-- 
2.33.1


