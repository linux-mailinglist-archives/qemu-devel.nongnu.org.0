Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E57A11C840
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 09:32:10 +0100 (CET)
Received: from localhost ([::1]:56024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifJtJ-000243-4O
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 03:32:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57847)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty@apple.com>) id 1ifJrY-00018N-UD
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 03:30:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty@apple.com>) id 1ifJrW-0000mv-Ud
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 03:30:20 -0500
Received: from nwk-aaemail-lapp01.apple.com ([17.151.62.66]:51164)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dirty@apple.com>) id 1ifJrV-0000d6-2p
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 03:30:17 -0500
Received: from pps.filterd (nwk-aaemail-lapp01.apple.com [127.0.0.1])
 by nwk-aaemail-lapp01.apple.com (8.16.0.27/8.16.0.27) with SMTP id
 xBC8RmDW048568; Thu, 12 Dec 2019 00:30:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=sender : from : to :
 cc : subject : date : message-id : mime-version :
 content-transfer-encoding; s=20180706;
 bh=RImAv4dIlfNnpsZcUVxMpzhs47JBbS2k5NyXyLR6UyA=;
 b=FDyb0vs7xDyngXI5FmWotQvr35t74FzlgT+vUsNCjVhN2IcEZTpe1+NKaBQXsUK3yNSv
 XGwYMqq2NImKlwNmMWeoCUxhqVpwC15tpDLtBFfoqVZKepjOndeqVmE3AX+tosVNaUve
 L0WDSF3rMZmRI1hDFs8uF8NLuR9b1mDJpQeYX09r2oYZplOhSsdII16mzH+FDV0hxmjo
 X1jfqKTHQCrbODMr2iVvvQN1SGOgUilppCDEvx7OAwMtlzcku76WVA5fe2vV1AdMlTjX
 yxLXCFQwXZ2lRTGzxW57fhul2uPUDLcYGfTSyLMWc0bK2cHjCB/smnUFKi46EkKAsc6I GA== 
Received: from ma1-mtap-s01.corp.apple.com (ma1-mtap-s01.corp.apple.com
 [17.40.76.5])
 by nwk-aaemail-lapp01.apple.com with ESMTP id 2wrbw5t7mn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 12 Dec 2019 00:30:15 -0800
Received: from nwk-mmpp-sz12.apple.com
 (nwk-mmpp-sz12.apple.com [17.128.115.204]) by ma1-mtap-s01.corp.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPS id <0Q2E005DP4YDCC40@ma1-mtap-s01.corp.apple.com>; Thu,
 12 Dec 2019 00:30:14 -0800 (PST)
Received: from process_milters-daemon.nwk-mmpp-sz12.apple.com by
 nwk-mmpp-sz12.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) id <0Q2E00I004Y8MB00@nwk-mmpp-sz12.apple.com>; Thu,
 12 Dec 2019 00:30:13 -0800 (PST)
X-Va-A: 
X-Va-T-CD: 
X-Va-E-CD: 
X-Va-R-CD: 
X-Va-CD: 0
X-Va-ID: 7f5140d2-37ed-4599-82c8-9402661b1b58
X-V-A: 
X-V-T-CD: c56cc4374afe9162bf6a337f3d661529
X-V-E-CD: a9a9555d369c889eb8311b7d2484d06a
X-V-R-CD: b710243e692022190026cacdaa48994e
X-V-CD: 0
X-V-ID: e246f6c7-4dd1-4a97-9467-733dd47799e1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,,
 definitions=2019-12-12_01:,, signatures=0
Received: from pontoon.com (unknown [17.234.123.27]) by nwk-mmpp-sz12.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPSA id <0Q2E003IX4YA9MC0@nwk-mmpp-sz12.apple.com>; Thu,
 12 Dec 2019 00:30:11 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com
Subject: [PATCH v3 0/1] Fix bochs memory leak
Date: Thu, 12 Dec 2019 00:30:07 -0800
Message-id: <cover.1576139278.git.dirty@apple.com>
X-Mailer: git-send-email 2.24.0
MIME-version: 1.0
Content-transfer-encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-12-12_01:, , signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 17.151.62.66
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Cameron Esfahani <dirty@apple.com>
From: Cameron Esfahani via <qemu-devel@nongnu.org>

Fix a small memory leak in the Bochs display driver.

Each frame would leak about 304 bytes.

v2: Add missing signed-off-by line.
v3: Add reviewed-by and fixes lines.

Cameron Esfahani (1):
  display/bochs-display: fix memory leak

 hw/display/bochs-display.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.24.0


