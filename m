Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C3D2F8551
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 20:23:02 +0100 (CET)
Received: from localhost ([::1]:42310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0UgX-0005LU-1O
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 14:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l0Ueq-0004pZ-Ap
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 14:21:16 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:43038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l0Uem-0001v6-IE
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 14:21:15 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FJE0Sg005523;
 Fri, 15 Jan 2021 19:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=qS1dtLxP8/z1INMxne5MoT9kMHjGaYuPS+kv0bO93pk=;
 b=o9oANPOKjGI5Yu6xWEumLafTEdbc0zbX9lx7SLe42WNsUresP1SwVaaw8GCT0duOBpMn
 nXm2VkHAyf8ObfBuxrVYBOoZzZrKFfvw+8Lhh96UnYya3kGWhk0W3exrk9wQO6wePUOl
 HT7xk70zGdh6xxwTDh6U+VCua/uLpH8qKUNrAU4WbHPFo07/HCzNxP5x0bZo8dO1YsJV
 2CCywOIBLWbPhXEEKKfmWQN2bK555VdR43uWmAkG52KoZ28zxOcZUd8r8xPYhJFaSh8e
 bcwq1n6nnISCFeJ1/XbfRPo/rY0BeljLbWXmbTfQNyvdzuM0s5aWVRfptyFtdk0MGVRv Vw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 360kd06dq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 19:21:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FJKsUd173101;
 Fri, 15 Jan 2021 19:21:06 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 360kfbf73w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 19:21:06 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10FJL5Jt005860;
 Fri, 15 Jan 2021 19:21:05 GMT
Received: from mihai.localdomain (/10.153.73.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 15 Jan 2021 11:21:04 -0800
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] Add support for pvpanic pci device
Date: Fri, 15 Jan 2021 20:34:02 +0200
Message-Id: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9865
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9865
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150116
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=mihai.carabas@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Mihai Carabas <mihai.carabas@oracle.com>, peter.maydell@linaro.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset adds support for pvpanic pci device.

v3 applied feedback:

- patch 1: made pvpanic isa device available only for PC, compile pvpanic-test
  only when isa device is present

- patch 2: fixed device id to 0x0011, used OBJECT_DECLARE_TYPE,
  PVPANIC_PCI_DEVICE, added VMSTATE_PCI_DEVICE, removed INTERFACE_PCIE_DEVICE

- patch 3: fixed documentation

- patch 4: add a qtest for pvpanic-pci

Mihai Carabas (4):
  hw/misc/pvpanic: split-out generic and bus dependent code
  hw/misc/pvpanic: add PCI interface support
  pvpanic : update pvpanic spec document
  tests/qtest: add a test case for pvpanic-pci

 docs/specs/pci-ids.txt         |  1 +
 docs/specs/pvpanic.txt         | 13 +++++-
 hw/i386/Kconfig                |  2 +-
 hw/misc/Kconfig                | 12 +++++-
 hw/misc/meson.build            |  4 +-
 hw/misc/pvpanic-isa.c          | 94 ++++++++++++++++++++++++++++++++++++++++++
 hw/misc/pvpanic-pci.c          | 94 ++++++++++++++++++++++++++++++++++++++++++
 hw/misc/pvpanic.c              | 85 +++-----------------------------------
 include/hw/misc/pvpanic.h      | 24 ++++++++++-
 include/hw/pci/pci.h           |  1 +
 tests/qtest/meson.build        |  3 +-
 tests/qtest/pvpanic-pci-test.c | 62 ++++++++++++++++++++++++++++
 12 files changed, 309 insertions(+), 86 deletions(-)
 create mode 100644 hw/misc/pvpanic-isa.c
 create mode 100644 hw/misc/pvpanic-pci.c
 create mode 100644 tests/qtest/pvpanic-pci-test.c

-- 
1.8.3.1


