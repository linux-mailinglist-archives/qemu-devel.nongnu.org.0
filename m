Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D994E515914
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 01:33:46 +0200 (CEST)
Received: from localhost ([::1]:48532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nka7N-0004Ri-Hi
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 19:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nka6V-0003Uy-Rl; Fri, 29 Apr 2022 19:32:51 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nka6U-0002vC-2R; Fri, 29 Apr 2022 19:32:51 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23TJKVcA015956;
 Fri, 29 Apr 2022 23:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=wZmar5TfmXiWUH1DJGr6hilNWWcSdzwBDycZPXr5yw4=;
 b=ClkSq+gfh2/xrEWVT9N9Ohal7Q6Ugbx3Q81Yl7yXVAG+kNYjfoTgaPvsd6HMqPB/UMQz
 dVP65AlYgEX8ofb2zjf7ENCNuQt3hI0ULD8pX1LJCOHf2U9Tn9Gshq2zyxW+8Kzu4+Qq
 tPY7fTGIFjDBvMoGa2PBJX6stx1vtQW21i7TXwRqFuA0oU4+wEKLOiQ7FWANOhnq4Epc
 yAjpIfb0L+3y8t4V64zeKkVvzxoHAVT4fbmAdyQhr+U2ECifqOZ6RRtMgar6J6qa8gAH
 gGKyG8QDOjuB4TcPyMaqKKOyKZim91dHQC0b1tvg36Liy41HU+OEKjCyWb/Gv7679QPe 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqtqw8r0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 23:32:38 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23TNWcFo014580;
 Fri, 29 Apr 2022 23:32:38 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqtqw8r0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 23:32:38 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23TNLt9w028158;
 Fri, 29 Apr 2022 23:32:37 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02dal.us.ibm.com with ESMTP id 3fm93aqv1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 23:32:37 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23TNWak436503848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Apr 2022 23:32:36 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14B75BE059;
 Fri, 29 Apr 2022 23:32:36 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CC91BE054;
 Fri, 29 Apr 2022 23:32:35 +0000 (GMT)
Received: from localhost (unknown [9.160.19.21])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 29 Apr 2022 23:32:35 +0000 (GMT)
From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] mos6522: fix linking error when CONFIG_MOS6522 is not set
Date: Fri, 29 Apr 2022 20:31:46 -0300
Message-Id: <20220429233146.29662-1-muriloo@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z8oH5p3eAJV7t92OvRynKC1Nhbbt2Uhq
X-Proofpoint-ORIG-GUID: eoVUsw_4TEhax9QbjxODtGYnD-sHN743
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-29_10,2022-04-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0 suspectscore=0
 mlxlogscore=856 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204290127
Received-SPF: pass client-ip=148.163.158.5; envelope-from=muriloo@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, mopsfelder@gmail.com,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When CONFIG_MOS6522 is not set, building ppc64-softmmu target fails:

    /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data+0x1158): undefined reference to `hmp_info_via'
    clang-13: error: linker command failed with exit code 1 (use -v to see invocation)

Add CONFIG_MOS6522 check for hmp_info_via in hmp-commands-info.hx to fix
such linking error.

Fixes: 409e9f7131e5 (mos6522: add "info via" HMP command for debugging)
Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Fabiano Rosas <farosas@linux.ibm.com>
---
 hmp-commands-info.hx | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index adfa085a9b..9ad784dd9f 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -881,6 +881,7 @@ SRST
 ERST
 
 #if defined(TARGET_M68K) || defined(TARGET_PPC)
+#if defined(CONFIG_MOS6522)
     {
         .name         = "via",
         .args_type    = "",
@@ -889,6 +890,7 @@ ERST
         .cmd          = hmp_info_via,
     },
 #endif
+#endif
 
 SRST
   ``info via``
-- 
2.35.1


