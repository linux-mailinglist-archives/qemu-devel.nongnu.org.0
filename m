Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25906915EA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 01:53:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQHeL-0003bN-MC; Thu, 09 Feb 2023 19:52:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pQHeJ-0003aU-3o
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 19:52:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pQHeH-00061a-4k
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 19:52:22 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31A0fw9I015524; Fri, 10 Feb 2023 00:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=USX81/a9Ds27Y6elROOmsWEYLuq0jCswa0Q/Q5Zy2j4=;
 b=iSpkPdFx+LdN+QrZg68eEXSosLfLHz79v553jteZR1/eLrEVZbPmeeAy3DGwISR9jgHo
 P3NBAZl6+VMe8rSvHaMRz4Va2dyh/HXzku31ISMT2r/fROuQLTkiGDsVIli2zO9+bbq7
 uR8Bu8MauHaB592Yp16e/84RBWDrjN3563rHk8HHk8P1yR6ugVg0baXnAZYwyyG9hnIK
 CuoC8WTi9cqIO7VAu1l2lVmbVZG91w6ZORkq7wuIoUZC8jspkDQYmXSjecHrWNLO4oIf
 A+32O6vUztmowquyUzcY0qdgRCUzKu9xfiD1PHBnKmSWBYSmT/b7WQ6Pu/UY0uV7/J53 NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnbm105k3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Feb 2023 00:52:18 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31A0qIGW015311;
 Fri, 10 Feb 2023 00:52:18 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnbm105jj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Feb 2023 00:52:17 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 319N2xpl024624;
 Fri, 10 Feb 2023 00:52:15 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3nhemfpun4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Feb 2023 00:52:15 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31A0qBjM31719768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Feb 2023 00:52:12 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D462620043;
 Fri, 10 Feb 2023 00:52:11 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57F1220040;
 Fri, 10 Feb 2023 00:52:11 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.74.186])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 10 Feb 2023 00:52:11 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org, 
 Ilya Leoshkevich <iii@linux.ibm.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH v2 2/2] meson: Disable libdw for static builds by default
Date: Fri, 10 Feb 2023 01:52:08 +0100
Message-Id: <20230210005208.438142-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210005208.438142-1-iii@linux.ibm.com>
References: <20230210005208.438142-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XKatuiB6ulgez76fOmA7SExfxidFIF0M
X-Proofpoint-ORIG-GUID: keN1Tg4puPnQqruq_WPamZ7abd1I7b5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_17,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302100002
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Static QEMU build fails on Debian Bullseye:

    /usr/bin/ld: /usr/lib/x86_64-linux-gnu/libdw.a(debuginfod-client.o): in function `__libdwfl_debuginfod_init':
    (.text.startup+0x17): undefined reference to `dlopen'

The reason is that pkg-config does not suggest -ldl for libdw, and
adding --extra-ldflags="-ldl" resolves the issue. However, static
linking with libdw is an unclear topic:

* Linux perf does it.
* Debian's libdw-dev description says:

      Only link to the static version for special cases and when you
      don't need anything from the ebl backends.

* As the error message above indicates, -ldl is also needed for
  debuginfod support.

The functionality provided by libdw is needed for analyzing performance
of JITed code, which is mostly useful to developers and researchers.
Therefore, in order to avoid unpleasant surprises for people who don't
need this, simply disable libdw for static builds by default. It can
still be enabled explicitly if needed.

Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 87bc720f912..9bd6278f268 100644
--- a/meson.build
+++ b/meson.build
@@ -1650,7 +1650,8 @@ endif
 
 # libdw
 libdw = not_found
-if not get_option('libdw').auto() or have_system or have_user
+if not get_option('libdw').auto() or \
+        (not enable_static and (have_system or have_user))
     libdw = dependency('libdw',
                        method: 'pkg-config',
                        kwargs: static_kwargs,
-- 
2.39.1


