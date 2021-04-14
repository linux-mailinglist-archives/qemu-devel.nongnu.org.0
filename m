Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF2A35F50D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 15:43:48 +0200 (CEST)
Received: from localhost ([::1]:37984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWfo3-0005Ns-Ng
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 09:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lWflq-0003zv-Nr; Wed, 14 Apr 2021 09:41:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lWfll-0003B2-Hw; Wed, 14 Apr 2021 09:41:30 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13EDXFWX193973; Wed, 14 Apr 2021 09:41:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=4QGsmAKpLsPg+OyPty9+uc+o2xJHgqy74aPBXiXFCOM=;
 b=ee8zQFQ/NnGwZTLVq5wj0KSr09JTTiS+ltnrXMuaPBtCunjghrDg7KEjiV+oGu5O56tI
 9JH8lMVzRxJd1taUXUtuy7r8WMLjvCtz4kH4BoR8xBDR+Tv5qOI3P0fFgbizL3AgHATv
 cfGXWbVZQRqlTW7t5al/ZNs7VyX9k10Nf6TDQH/C9E9HNzhd7ryadlIaRLAo93CmN0eY
 5YFF11SmmypEHsZ9xeBb5Ay4LJutDU8NMKIXxsiv8yEewCol3TZpJ1VeEJ/X/umy/NWN
 LYBYstOVLG7wvpIJuwYrcOBxFyFabPKsYRBp8Lk8GTWj+bLz28ZhGylPQokcUmOMvgxJ xA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wwn1xtxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 09:41:19 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13EDXLMs194644;
 Wed, 14 Apr 2021 09:41:19 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wwn1xtwb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 09:41:19 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13EDbHa4028976;
 Wed, 14 Apr 2021 13:41:17 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 37u39hkbad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 13:41:16 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13EDepUg37814676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 13:40:52 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E27A7A4065;
 Wed, 14 Apr 2021 13:41:13 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5097FA405C;
 Wed, 14 Apr 2021 13:41:13 +0000 (GMT)
Received: from vm.lan (unknown [9.145.157.105])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Apr 2021 13:41:13 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 0/3] accel/tcg: Make sure that tb->size != 0 after
 translation
Date: Wed, 14 Apr 2021 15:41:09 +0200
Message-Id: <20210414134112.25620-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yq5QalstzI98-cPwIFyNzkGpZhFSjB96
X-Proofpoint-ORIG-GUID: D-G5lZedDSYzqM-Ai-h2dAzkf8ZSLYhS
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-14_07:2021-04-14,
 2021-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140093
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If arch-specific code generates a translation block of size 0,
tb_gen_code() may generate a spurious exception.

Fix s390x (patch 1) and ARM (patch 2) and add an assertion in order to
catch such situations early (patch 3).

v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02037.html
v1 -> v2: Fix target/s390x instead of trying to tolerate tb->size == 0
          in tb_gen_code().

v2: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02101.html
v2 -> v3: Split the common code change into a separate patch, add the
          ARM patch in order to fix
          https://gitlab.com/cohuck/qemu/-/jobs/1178409450

Ilya Leoshkevich (3):
  target/s390x: Fix translation exception on illegal instruction
  target/arm: Make sure that commpage's tb->size != 0
  accel/tcg: Assert that tb->size != 0 after translation

 accel/tcg/translate-all.c |  1 +
 target/arm/translate.c    |  1 +
 target/s390x/translate.c  | 16 +++++++++++-----
 3 files changed, 13 insertions(+), 5 deletions(-)

-- 
2.29.2


