Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06EC628DF3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:07:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouikl-000582-Vp; Mon, 14 Nov 2022 18:20:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ouiey-0001hU-RT
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:42 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ouc5T-0000VA-Sh
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 11:13:33 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id
 2AEFwofu021542; Mon, 14 Nov 2022 16:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=00o8Hsr6yCx6+sYq4yzD9X/W7OV+OpnXCvhHvzwXpLk=;
 b=SDLHvEIFuYpAnWQbPx7RufA1LFKVgLzL6lkcSIaIVYUm923SdIpxLR+dA+99NJzbXr6K
 blzhNogBSJ54ASkTsrFbUFwdso5+qycJdc3S+9nvJp4TvFfsBnCJ6cciNyXxP6sX6Tl6
 o2D2soQmSHkATvkwIEZgRFYfMAFsR9N1EZYwJTci30/yd2v5S1s2XgYQ3ktn5uTlU2nN
 fwHlovUsLbEBqu5mB+9tWwMHGAHG9yNXZREagS2sZfRyoVJldkk7Tc4Kgd1PS+dDeZZ3
 CT1ZsNcXWcC/+H1WBq45q1Tk6O8W3j2a6HLNAibCY96rpTlnbC35WXOlhu+dziKOumDJ Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kursrrfag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 16:13:29 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AEG0XTI029191;
 Mon, 14 Nov 2022 16:13:29 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kursrrf9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 16:13:29 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AEG6mIu021812;
 Mon, 14 Nov 2022 16:13:27 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3kt348tuat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 16:13:27 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AEGDOYa62521790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Nov 2022 16:13:24 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7077011C052;
 Mon, 14 Nov 2022 16:13:24 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16F9911C04C;
 Mon, 14 Nov 2022 16:13:24 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.39.72])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Nov 2022 16:13:24 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: "Vanderson M . do Rosario" <vandersonmr2@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 0/1] tcg: add perfmap and jitdump
Date: Mon, 14 Nov 2022 17:13:20 +0100
Message-Id: <20221114161321.3364875-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: usB9s2E15K6YuZ3xu017YRLXXGWsHg77
X-Proofpoint-ORIG-GUID: dFf30_oIOU7sKrgzBYdArItRVbQZaWxI
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_12,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211140114
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v1:
https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg01824.html
https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg01073.html

v1 -> v2:
* Use QEMU_LOCK_GUARD (Alex).
* Handle TARGET_TB_PCREL (Alex).
* Support ELF -kernels, add a note about this (Alex). Tested with
  qemu-system-x86_64 and Linux kernel - it's not fast, but it works.
* Minor const correctness and style improvements.

Ilya Leoshkevich (1):
  tcg: add perfmap and jitdump

 accel/tcg/debuginfo.c     |  99 +++++++++++
 accel/tcg/debuginfo.h     |  52 ++++++
 accel/tcg/meson.build     |   2 +
 accel/tcg/perf.c          | 334 ++++++++++++++++++++++++++++++++++++++
 accel/tcg/perf.h          |  28 ++++
 accel/tcg/translate-all.c |   8 +
 docs/devel/tcg.rst        |  23 +++
 hw/core/loader.c          |   5 +
 include/tcg/tcg.h         |   4 +-
 linux-user/elfload.c      |   3 +
 linux-user/exit.c         |   2 +
 linux-user/main.c         |  15 ++
 linux-user/meson.build    |   1 +
 meson.build               |   8 +
 qemu-options.hx           |  20 +++
 softmmu/vl.c              |  11 ++
 tcg/region.c              |   2 +-
 tcg/tcg.c                 |   2 +
 18 files changed, 616 insertions(+), 3 deletions(-)
 create mode 100644 accel/tcg/debuginfo.c
 create mode 100644 accel/tcg/debuginfo.h
 create mode 100644 accel/tcg/perf.c
 create mode 100644 accel/tcg/perf.h

-- 
2.37.2


