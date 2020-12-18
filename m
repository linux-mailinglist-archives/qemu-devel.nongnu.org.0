Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9542DE3A9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 15:05:32 +0100 (CET)
Received: from localhost ([::1]:33160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqGNv-0003br-1F
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 09:05:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1kqFvs-0006OJ-Og
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:36:32 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:33846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1kqFvn-0005LE-Hh
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:36:32 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BIDTnra021761;
 Fri, 18 Dec 2020 13:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=KxhQ4cbMHs7L2BmzsdUN9AGJfyLRAsjpMXitlg3D/qM=;
 b=TStZlGbsf1S2c5/Fg7pzqR07AtcZlnpaCao2W8dQoKsaoJSHlagB60IT576+X9qHAV7H
 xRPkiFbgAErsz7fOvSrhjZPw2lqUwyw2qhnkHoIsmykzGmjsCRRyyp3D5idfqjkPysip
 1lLI9wn3pBK7gv9PoIO0zpgQWy9AZX3aiovkGD5LKm+sbD6U88FkSbSZAzfULKoBdmjT
 /qer4/mN7yyW+W0/0SRLSfUzpjedAOAQOAI7gtOzOF2yVBP3vSVkSH8mZyTl8WqFIgb/
 BVaUh2CuRqSxVeLfBBHe04QgbpHUXdNZ6rgkteNUUsjWyfSimDytWykPvo2AOIbQfSK6 7w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 35ckcbtgr2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Dec 2020 13:36:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BIDVM63041316;
 Fri, 18 Dec 2020 13:36:21 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 35d7esbq25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 13:36:21 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BIDaKIZ020324;
 Fri, 18 Dec 2020 13:36:20 GMT
Received: from mihai.localdomain (/10.153.73.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 18 Dec 2020 05:36:20 -0800
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] Add support for pvpanic pci device
Date: Fri, 18 Dec 2020 14:53:13 +0200
Message-Id: <1608295996-8464-1-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180095
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012180095
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=mihai.carabas@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

This patchset adds support for pvpanic pci device. This is the second revision,
re-written after Peter Maydell's feedback:
- split the code in common, isa and pci
- obtained 0x101 device id per documenation from Gerd Hoffmann
- fix-up minor documentation issue

How to test this:
/usr/bin/qemu-system-aarch64 \
        -machine virt,gic-version=3 -device pvpanic-pci

After that you need to run a Linux kernel as guest, but you have to also apply
the patches I have sent for adding pci support for the pvpanic driver [1].

[1] https://lkml.org/lkml/2020/10/29/645



Mihai Carabas (3):
  hw/misc/pvpanic: split-out generic and bus dependent code
  hw/misc/pvpanic: add PCI interface support
  pvpanic : update pvpanic spec document

 docs/specs/pci-ids.txt    |  2 +
 docs/specs/pvpanic.txt    | 13 ++++++-
 hw/i386/Kconfig           |  1 -
 hw/misc/Kconfig           | 13 ++++++-
 hw/misc/meson.build       |  4 +-
 hw/misc/pvpanic-isa.c     | 95 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/misc/pvpanic-pci.c     | 87 +++++++++++++++++++++++++++++++++++++++++++
 hw/misc/pvpanic.c         | 85 +++---------------------------------------
 include/hw/misc/pvpanic.h | 24 +++++++++++-
 include/hw/pci/pci.h      |  1 +
 tests/qtest/meson.build   |  2 +-
 11 files changed, 241 insertions(+), 86 deletions(-)
 create mode 100644 hw/misc/pvpanic-isa.c
 create mode 100644 hw/misc/pvpanic-pci.c

-- 
1.8.3.1


