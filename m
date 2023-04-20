Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67E06E951B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:54:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTmS-00043s-8d; Thu, 20 Apr 2023 08:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1ppTmE-00042q-Jl
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:52:42 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1ppTm9-0002pe-3d
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:52:40 -0400
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33KClOCF021861; Thu, 20 Apr 2023 12:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=qMzI+u0OmaUNykRo3Trvq/CjS3QEmAFmINVTGJapWdo=;
 b=FRfkVSZjLWzrsLcQvpF2Yo9s4+GlFtxaZiyimJX0ecxWyer62Egn4RvCmO0X0+f63VCh
 Q5JTgt4Hs3bwDmDjgvQ0011flhazdB6ERrPNPpuGh77MI8jHhZutCitLbMnPdgCT7YcT
 2ty1+h4eLm/zJdOGAAaO9Utp7RBQwqvKOGSIRZMCp0V7HnYr1ypDj/S94GFfHhyoS29I
 OIqIaMloXDO6ChX6avvXlDWBtewaaTHTVAGFNyGYJtOVODhaSGaWQZsceQKp3vYZHrNk
 s0m3f8V4yXSie+YUK7XD+KS/Q/jjfyXfwXLe2jlJOUuMipTYH82XHt8Vp6xQUogmB0NJ HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q35q6g64p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:52:27 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33KCliF1022825;
 Thu, 20 Apr 2023 12:52:27 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q35q6g63p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:52:27 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33KAC6db008978;
 Thu, 20 Apr 2023 12:52:25 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3pykj6bdam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:52:25 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33KCqMPp46662368
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Apr 2023 12:52:22 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7369120043;
 Thu, 20 Apr 2023 12:52:22 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1628A20040;
 Thu, 20 Apr 2023 12:52:21 +0000 (GMT)
Received: from melvil.aus.stglabs.ibm.com (unknown [9.40.193.168])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 20 Apr 2023 12:52:20 +0000 (GMT)
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, Kautuk Consul <kconsul@linux.vnet.ibm.com>
Subject: [PATCH v3 0/2] Improve avocado code coverage for ppc64
Date: Thu, 20 Apr 2023 07:52:15 -0500
Message-Id: <20230420125217.620928-1-kconsul@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3X3is3muO-maxdYCu7_gev6NDgqlf6Fx
X-Proofpoint-GUID: -vJZGJxH1mJpiyU1mH-Bfa0qBQUze4uy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_08,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0
 mlxlogscore=864 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200102
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=kconsul@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the
boot_linux.py test-case due to which the code coverage for
powerpc decreased by 2%. This patchset aims to make up this
2% code coverage by modifying the tuxrun_baselines.py test-case.

Changes since v1 and v2:
- Modified the way and code that creates the temporary qcow2
  image that the tuxrun_baselines.py is now using.
- Factored out code in avocado_qemu/__init__.py to create
  the get_qemu_img() function that will now get called from
  tuxrun_baselines.py.

Kautuk Consul (2):
  avocado_qemu/__init__.py: factor out the qemu-img finding
  tests/avocado/tuxrun_baselines.py: improve code coverage for ppc64

 tests/avocado/avocado_qemu/__init__.py |  27 +++---
 tests/avocado/tuxrun_baselines.py      | 120 ++++++++++++++++++++++++-
 2 files changed, 132 insertions(+), 15 deletions(-)

-- 
2.25.1


