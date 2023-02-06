Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC6F68C5DF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:35:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6KO-0005DO-HA; Mon, 06 Feb 2023 13:34:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pP6Je-00059J-SP
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:34:14 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pP6Jc-0002M6-JK
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:34:10 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 316IOFCr001679; Mon, 6 Feb 2023 18:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2022-7-12;
 bh=Z7iqKbW4cmYizsEqWMtWobWesYiIEWNymirMJ9vRJeA=;
 b=j9yiTvMyTSKFAP7wMk6CqJoA5b2HKALRDgX6tSkAAnXAR5O4dmoC6RcatNhN64QveJYk
 gdJfEsu8La9JmMPoi+d846LtdeE6C0w0OVJ5ZzPi8AjSjH3ccc66mCstN5k+bmRkqfOm
 YVTqL63nTToumFgKhwXLXwBSDct77f5IETKUAcJvb4wDW7WACXyxDWtbEzXUWAKgi270
 vZAn0zN6MN+l3QZAym+jFUhV5ye4IZCgqjRefJnfBKjA/MkLkqrBFutlDzcPH4WPx59w
 tr8DhRbWIOIlLeBAe4ZmQa3FsT6YZEYcKQ+VphjY02Cr/BObO35125pUxWo0qIgZyY62 Fg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhfwu3jch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Feb 2023 18:34:06 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 316Hu4Rv002362; Mon, 6 Feb 2023 18:34:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdtbfejq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Feb 2023 18:34:04 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 316IWqsv040325;
 Mon, 6 Feb 2023 18:34:04 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with
 ESMTP id 3nhdtbfehs-1; Mon, 06 Feb 2023 18:34:04 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Steve Sistare <steven.sistare@oracle.com>
Subject: [PATCH V2] meson: fix dependency on qemu-keymap
Date: Mon,  6 Feb 2023 10:34:02 -0800
Message-Id: <1675708442-74966-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=972
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302060161
X-Proofpoint-GUID: YBrA6nyBGa-dw1YD8lhXg-MRV7lj8Rrb
X-Proofpoint-ORIG-GUID: YBrA6nyBGa-dw1YD8lhXg-MRV7lj8Rrb
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

When qemu-keymap is not available on the host, and enable-xkbcommon
is specified, parallel make fails with:

  % make clean
  ...
  % make -j 32
  ...
  FAILED: pc-bios/keymaps/is
  ./qemu-keymap -f pc-bios/keymaps/is -l is
  /bin/sh: ./qemu-keymap: No such file or directory
  ... many similar messages ...

The code always runs find_program, rather than waiting to build
qemu-keymap, because it looks for CONFIG_XKBCOMMON in config_host
rather than config_host_data.  Making serially succeeds, by soft
linking files from pc-bios/keymaps, but that is not the desired
result for enable-xkbcommon.

Examining all occurrences of 'in config_host' for similar bugs shows one
instance in the docs, which is also fixed here.

Fixes: 4113f4cfee ("meson: move xkbcommon to meson")

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 docs/devel/kconfig.rst      | 2 +-
 pc-bios/keymaps/meson.build | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
index 69674d0..cc1a456 100644
--- a/docs/devel/kconfig.rst
+++ b/docs/devel/kconfig.rst
@@ -306,6 +306,6 @@ variable::
 
     host_kconfig = \
       (have_tpm ? ['CONFIG_TPM=y'] : []) + \
-      ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
+      ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
       (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
       ...
diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index 06c75e6..158a3b4 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -33,7 +33,7 @@ keymaps = {
   'tr': '-l tr',
 }
 
-if meson.is_cross_build() or 'CONFIG_XKBCOMMON' not in config_host
+if meson.is_cross_build() or not xkbcommon.found()
   native_qemu_keymap = find_program('qemu-keymap', required: false, disabler: true)
 else
   native_qemu_keymap = qemu_keymap
-- 
1.8.3.1


