Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95465BEA4D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 17:33:20 +0200 (CEST)
Received: from localhost ([::1]:51198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oafFO-00064r-2w
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 11:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oacen-0003IH-Gr
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 08:47:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:15752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1oaceg-0004p2-0K
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 08:47:17 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KATkDc029791;
 Tue, 20 Sep 2022 12:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=sohcgPwrKpNgQftV9f4LqiXZO6gBzPq9o8bXxVyVrck=;
 b=oijbiSZEvAOB5Is8f2YOAoL7prhKXCYcexsoqJfLBUYATjaMRgakXhH1uZ1Xzq7yUyVa
 jr3sOvAkzGsgBhi45h3gteq5cU2BTOV9FY5q4rsL8DBi1kfDFX/qdHbw9wd3v2LvzGkE
 ajo+uowod9KUNme+arvo3QHTk1I1p2W27XFhec6bKOHgGQU4RfjvkJFtwjpUasWw4PIo
 yum4WjHaFJB8QBW+hGWQZ+j0lI7N7YdOMdP+AUbHiErdz5JXNOssMmGnc88CrFC7OGhE
 sxp0pwweCUgvn4ncE9vECBF2nY5RCsnmQbp/pXld/hLARsIiZpxFbSS901/zGvd568gP /A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jpt21m738-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 12:47:08 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28KCl7jq019363; 
 Tue, 20 Sep 2022 12:47:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3jnqp915fr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 12:47:07 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28KCl7hk019194;
 Tue, 20 Sep 2022 12:47:07 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 28KCl6fS019046
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 12:47:07 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id D36A24DCE; Tue, 20 Sep 2022 09:47:06 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: bcain@quicinc.com, alex.bennee@linaro.org, f4bug@amsat.org,
 peter.maydell@linaro.org
Subject: [PATCH v3 0/3] gdbstub: avoid untimely stop-reply msgs
Date: Tue, 20 Sep 2022 09:47:00 -0300
Message-Id: <cover.1663677789.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Cp3HVRS1qaUEazY-NdiR2NTxGkPPZnRu
X-Proofpoint-GUID: Cp3HVRS1qaUEazY-NdiR2NTxGkPPZnRu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_04,2022-09-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 mlxlogscore=892
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200074
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series limits gdbstub to send stop-reply packets only as a reply to
commands that accept them, following the RSP specification.

Changes since v2[1]:

- Replaced char buffer with boolean at struct GDBState.
- Covered other functions that might send stop-reply packets.
- Added test.

Note: I was able to run the added test previously I make sure it passes
after the change, but after rebasing onto master, `make check-tcg` is
giving me the following error (this also happens at the tip of master in
my machine):

	qemu: could not load PC BIOS 'bios-256k.bin'

Perhaps I'm doing something wrong at compilation/testing?

[1]: https://lore.kernel.org/qemu-devel/ba99db564c3aeb1812bdfbc9116849092334482f.1661362557.git.quic_mathbern@quicinc.com/

Matheus Tavares Bernardino (3):
  configure: make sure tcg tests can see HAVE_GDB_BIN
  gdbstub: only send stop-reply packets when allowed to
  gdbstub: add test for untimely stop-reply packets

 configure                                     | 13 ++--
 gdbstub.c                                     | 64 ++++++++++++++-----
 meson.build                                   |  6 +-
 tests/guest-debug/run-test.py                 | 16 +++--
 .../multiarch/system/Makefile.softmmu-target  | 16 ++++-
 5 files changed, 83 insertions(+), 32 deletions(-)

-- 
2.37.2


