Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467EA50EAC6
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 22:43:31 +0200 (CEST)
Received: from localhost ([::1]:51844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj5YQ-0001si-0U
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 16:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1nj5Wp-0000E0-Ug
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 16:41:53 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1nj5Wo-00076T-0R
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 16:41:51 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23PJijrZ024296
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 20:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=xZmkAdgb1GZ9ZrhcVpIx+odN4Vsud+GlGBrDuRfslkY=;
 b=VDhouC/F5wmeZnPVg6ScZz4Hrknmc2xmF+c8RQOvOgEi2bLxvo5DPSbydKI2OyGQBgO+
 HImAtcX1MWa+X73L3+b/d2VtsQrSkCe8QTLT9kIownDOyQy+JiEbrqL0yrRVG+nBeTK6
 atwfG3Q07xJJEGFV1p7Zz1dOH5HL3NDW4B/czAiSqu0MB+fMYpc553PBz5CMyvLcpiDU
 UrLurCMaL9PCxDR2q8U/2dRHk54+9jEOnhyj/0K7/x5BRhPWW1NXwOp2aSHG8tCdd2jf
 oUjHwJMG3P0WqZ0DGx/wSxtpwCRB7BqoJR7tIRcMQHba7/PYRtqV4RvgDpdQora7TBU6 9w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fp22t0ysh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 20:41:46 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23PKS3nM017825
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 20:41:46 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fp22t0yry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Apr 2022 20:41:46 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23PKWeSo007766;
 Mon, 25 Apr 2022 20:41:44 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3fm938tc7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Apr 2022 20:41:43 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23PKSeF928705176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Apr 2022 20:28:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 924D74C044;
 Mon, 25 Apr 2022 20:41:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80D204C040;
 Mon, 25 Apr 2022 20:41:40 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 25 Apr 2022 20:41:40 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 36F2BE04DC; Mon, 25 Apr 2022 22:41:40 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] error-report: Fix GDateTime usage
Date: Mon, 25 Apr 2022 22:41:36 +0200
Message-Id: <20220425204136.2370585-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GOQzMHGwOAeTJacaaG16rK3z9g7qIfn6
X-Proofpoint-ORIG-GUID: pxUde1ch23zSC6qydH_tINyk7V5uYeVF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-25_10,2022-04-25_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204250092
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: Eric Farman <farman@linux.ibm.com>, qemu-devel@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the glib manual:

 - g_date_time_new_from_unix_utc() takes a parameter of the number of
   SECONDS since the unix epoch
 - g_get_real_time() returns the number of MICROSECONDS since the
   unix epoch

Rather than convert the latter with G_USECS_PER_SEC, use the convenient
g_date_time_new_now_utc() routine to create the GDateTime object.
This fixes a userspace fault seen when messages get sent to monitor,
such as when a guest is destroyed.

Fixes: 73dab893b569 ("error-report: replace deprecated g_get_current_time() with glib >= 2.62")
Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 util/error-report.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/error-report.c b/util/error-report.c
index dbadaf206d..5edb2e6040 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -173,7 +173,7 @@ static char *
 real_time_iso8601(void)
 {
 #if GLIB_CHECK_VERSION(2,62,0)
-    g_autoptr(GDateTime) dt = g_date_time_new_from_unix_utc(g_get_real_time());
+    g_autoptr(GDateTime) dt = g_date_time_new_now_utc();
     /* ignore deprecation warning, since GLIB_VERSION_MAX_ALLOWED is 2.56 */
 #pragma GCC diagnostic push
 #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
-- 
2.32.0


