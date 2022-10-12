Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695075FC01F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 07:28:39 +0200 (CEST)
Received: from localhost ([::1]:58792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiUII-0003yi-H9
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 01:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oiU97-0005rf-8q
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 01:19:09 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oiU94-0000yi-VF
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 01:19:08 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29C4ccj7012676;
 Wed, 12 Oct 2022 05:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=EKyQeOkdp/4F2HamHO1n5DLONS6fxvk/GdL3zmzm3XQ=;
 b=X9R5ozkHeyA647CWbb+Da2X7riUkX2/9lFjcnRdkNoXZl7mICrytvbTICSgX1O/G8VPG
 D2HKAJ0WOxMK4qL4ZKfXCsN8jLxRWYohh+FRT+RcxXthN6fqS0h8jce3+b1u/gbTO9q9
 FJd7ELJjKZFuBSHqD3b3kqzNyY8Il2OL5ykROubw42DJrpnd3mJnSBNIwfrNLlMEAVHB
 RAAIuwKFXEnCVzrpIVmFPlmKRXDlV7qSKLyIlZmiy8dOGTTLxFmMqwoDvw/QZnGZzWVv
 ouMo5ey5s5nsLan2e7Uwe8BUKCNrLnZDY6IuyBoIGSUUKCZY3RKZZckqe74UUaMCg/gw VA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k5j0a76ss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 05:19:01 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29C59dTb009422;
 Wed, 12 Oct 2022 05:19:01 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k5j0a76s0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 05:19:01 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29C5IRar001105;
 Wed, 12 Oct 2022 05:18:58 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3k30u9437w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 05:18:58 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29C5Itgx43385182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Oct 2022 05:18:55 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10EA9AE04D;
 Wed, 12 Oct 2022 05:18:55 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD63AAE045;
 Wed, 12 Oct 2022 05:18:54 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.39.72])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Oct 2022 05:18:54 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "Vanderson M . do Rosario" <vandersonmr2@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH RFC 0/1] tcg: add perfmap and jitdump
Date: Wed, 12 Oct 2022 07:18:45 +0200
Message-Id: <20221012051846.1432050-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rVoyWSP1AJ64KEjWK5vlq9f87rk36iu2
X-Proofpoint-ORIG-GUID: kEeSBxrsDv7ydx1tNUGytijMczL9f5iK
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_01,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120033
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is a rework of jitdump and perfmap patches from Vanderson and
Alex:

- jitdump: https://wiki.qemu.org/Features/TCGCodeQuality

  v1: https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg02676.html
  v2: https://lore.kernel.org/qemu-devel/20190830121903.17585-1-vandersonmr2@gmail.com/
  v9: https://www.mail-archive.com/qemu-devel@nongnu.org/msg650269.html

- perfmap

  rfc: https://lists.nongnu.org/archive/html/qemu-devel/2014-03/msg05386.html
  v2: https://lists.gnu.org/archive/html/qemu-devel/2014-07/msg02061.html
  v3: https://lists.gnu.org/archive/html/qemu-devel/2014-07/msg04289.html
  v4: https://lists.gnu.org/archive/html/qemu-devel/2015-08/msg00095.html

It addresses some of the feedback (among other things: symlink attacks,
Elf64_Ehdr on 32-bit hosts, flockfile, license headers, style) and adds
debuginfo support.

Best regards,
Ilya

Ilya Leoshkevich (1):
  tcg: add perfmap and jitdump

 accel/tcg/debuginfo.c     | 108 +++++++++++++
 accel/tcg/debuginfo.h     |  54 +++++++
 accel/tcg/meson.build     |   2 +
 accel/tcg/perf.c          | 333 ++++++++++++++++++++++++++++++++++++++
 accel/tcg/perf.h          |  28 ++++
 accel/tcg/translate-all.c |   3 +
 docs/devel/tcg.rst        |  20 +++
 linux-user/elfload.c      |   3 +
 linux-user/exit.c         |   2 +
 linux-user/main.c         |  15 ++
 linux-user/meson.build    |   1 +
 meson.build               |   8 +
 qemu-options.hx           |  20 +++
 softmmu/vl.c              |  11 ++
 tcg/tcg.c                 |   2 +
 15 files changed, 610 insertions(+)
 create mode 100644 accel/tcg/debuginfo.c
 create mode 100644 accel/tcg/debuginfo.h
 create mode 100644 accel/tcg/perf.c
 create mode 100644 accel/tcg/perf.h

-- 
2.37.2


