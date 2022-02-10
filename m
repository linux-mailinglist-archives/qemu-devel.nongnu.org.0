Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB5B4B1402
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 18:20:02 +0100 (CET)
Received: from localhost ([::1]:50204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nID6u-0001E9-UD
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 12:20:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIATq-0005gZ-7t
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:31:30 -0500
Received: from [2a01:111:f400:fe0e::713] (port=59205
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIATl-0005YP-Uj
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:31:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3oqBuBhBosEQ8FhdmZWTk9FQsH/zIHi2MQZ674a5A5QBOdL5c04KMICJmbf8bFsYTOoMDUhL3najkAoW/qXwnPlGhlbGkO2CblEJAY2JFkBQsP/duCioTe68iUxi7UyJt5yRyrzpLBbAWWorNOi0VxH+kjTK+doKqk3GPdmTbX/6idDWWwzA7saDjYCd67xrMNfg3C6P8Z2t+QqHo8rHM3iyeh5C+O3/VgiviQ9UUSjKYoXKhUYauB3g3hiFeNKpF63jcue+93swrii6WgB2hz4g3QMB7e3z08KY7F33d22JB0i/2K73c9eGmvjNKo9ED8zchB9HnBkcTThOylAPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9MWv8VsixDzIlWBcFWId4t9t43WSQXY3R+K47DAjSQ=;
 b=I3WKf5sPBXGCGbIe3VwErp/F8fd6qSuUs8TlGKUu3Hc4/DtQYSqI+khpsx5Zawb3l+Zu4zbt/yOR/9tZttSzyN531YsfBgyHhhhBeeXBnoDTu+nWfzDtkgoQTCr6X9HMLn/LLadchmS0DN0Ci5mkEHh20YdPs+tZHNK1v8sIP8dfMQexBanYl+UDseUwYQisQ77yVF+S2C2W1GUjynPWIlmttmbPyczAZ8IKl+e/8TgIOqhM7miwKS0E2EVmfUQC8r19np87oVU3wFXX6tTQuHW1ycuRh7sM5wbVY/V+Q2/YXivsF6RWlRLgLliE4/2ESZ1YbKzmNH3J5i3zyvGKWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9MWv8VsixDzIlWBcFWId4t9t43WSQXY3R+K47DAjSQ=;
 b=EOAks1Zfl5nISzwpar5ea4xYKegDpA2E6rACCtgzwPvtr8/DxorASBnPXrM7tUPRX9h3RJ3W4O01Pmu/MV1pAAfccbLLp6F8zy/KZYkjAbbC2p6Li3b3It4ikGzcdLfJWK0VKvCXNCVR0gDy7yyEFZhijy/LY0EYVRTblzjnxHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM7PR08MB5413.eurprd08.prod.outlook.com (2603:10a6:20b:10a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 14:15:13 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 14:15:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: bleal@redhat.com, wainersm@redhat.com, f4bug@amsat.org, crosa@redhat.com,
 eblake@redhat.com, armbru@redhat.com, kraxel@redhat.com,
 vsementsov@virtuozzo.com, berrange@redhat.com, marcandre.lureau@redhat.com
Subject: [PATCH v4 3/3] avocado/vnc: add test_change_listen
Date: Thu, 10 Feb 2022 15:14:57 +0100
Message-Id: <20220210141457.539582-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210141457.539582-1-vsementsov@virtuozzo.com>
References: <20220210141457.539582-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR05CA0036.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::49) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c775fec1-323d-4a78-6458-08d9ec9fc093
X-MS-TrafficTypeDiagnostic: AM7PR08MB5413:EE_
X-Microsoft-Antispam-PRVS: <AM7PR08MB54135974C50AF51F03E5BCF6C12F9@AM7PR08MB5413.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8dQ1cdB/9sietSPMmiZmyFa41lV2HyjnplrJKWRYzv2yUgh3Ec6u1ZOgo6JqpdME3agYCTPjFfQlscPd5c/tNBxTpMbIAiIuTJqbLFqbRmTNoFI4o6p/99gAhCqoPmaWAvH+iPtcRXiOH/LIWkGz+jKHJclQGhg/1O1m/CrcwakSgH5OwPNLmKiwNCw5okQw1BU2kGJpGv2iXtd+yaVR8zKoCE4uJh7wv5feT/hXuk0pmSio2NRpC7dXNg9jlqGepnrVqsdU/tOSsBc9FyEXf7bFtMnu+OyrKX+epPWj0Bu/8MbB3BhVmkU0ali2isutrlGaMszzSsnGmRg76x2P4ucmTNfOEBFvVfh+PnQS/EgmtXxlhgzPgW6dLmiFekXB+xPxrUPXsWlOzuDzV23wJWVeppfduUjx7BfvsjWkIuUoBF6P8XXXGeXpBuHlTvUmKLCemRA4AdNTPKJEgCVN6ON0R18bXXWRzal+mdYs4mlP8/6ctJ9oW8+C7UBlvG03el7wwbVLwCYbuh72uj6eNRvMy7jsUHt2iscAvUDRc0DX4T1V62dM2LfCfEQK/PsY6vDz3vZ85k9aSGnNjNW0FUok024/G8WM+iIVvyObZfdAD1ToDzGSxwVggkz8YI3rwVT62V5fK8FmnX+xbfAPearwnIXSdrmYj4yDNV6y0e/FoieFKUHtVMF7trLHUGPDNUNR6oDMPDJ8Rpwc7dtlfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(52116002)(2616005)(2906002)(6506007)(38100700002)(316002)(86362001)(6916009)(38350700002)(66946007)(1076003)(66556008)(66476007)(4326008)(8676002)(5660300002)(8936002)(6486002)(6512007)(83380400001)(7416002)(6666004)(508600001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ARR2Sna7vkiBZYw9DaP18FQXN1w2SY17XijpezhuXBBFWDj4PBr2v122R6lZ?=
 =?us-ascii?Q?O7l5vU9nSIGg6EPJrqNR50Xpxoe8DVhYHT5+wpfv+yQ8ePTkpa+LzmTAQGPS?=
 =?us-ascii?Q?1glSQsC9kEG4zbzkWZBvM0KQw91e0N90OBNDKDHij/vAZLqDVJgKqxVnhq+1?=
 =?us-ascii?Q?4D+mNoFjzj05UB5n8HNFEdazkeNSGNdPtwqIB3/D5UtU/p51hHIdBCXNZ3Z3?=
 =?us-ascii?Q?13OsL84Q2I9Rb6HTQHRHzoHp0tAMjNFnIlvpg9nBBmDzjjzchKGNSVuHdDGM?=
 =?us-ascii?Q?FVQSnNEZcCo1MotlOpwvM2sh9lM8Set1V1rvEHod/acMOotJlz5xDB1N57MS?=
 =?us-ascii?Q?zTHFN4ZykDRej/9tAJTx+bjYO8yKKpevBq6kjJGbpJtuq2EyIwpqxyk1r2hb?=
 =?us-ascii?Q?B1hfzRdxh3iCcwFPUPyhkDz1pEFWSOQKgSks6wZgBgG1RUwDKv7eR3REOtGY?=
 =?us-ascii?Q?W6FA9BgS6cqy+eV5y1JoPIkaVg6FZTXokOp1nMyNjsS05X4SiM6oZts+P+fY?=
 =?us-ascii?Q?zlsCMvNjk8y74+KvYTq0z9gw34pUtyIrYxEV7Q3SiiHkd4IyLnI1ckb/Lufb?=
 =?us-ascii?Q?XCILrlERh+8LPNF2sFaybK+XfJrAnaWOplGGSSPRBAMFWh0FSMOeAy+vLmfy?=
 =?us-ascii?Q?ykh8+Toxm1Ry82+ZjGeUXoWXp4skfB2dNKLDekoKEs1GUtbHsxp5TX48HVRC?=
 =?us-ascii?Q?1oUEGOU1Gn3BIaZ6V1Ys9QUtRD1bwuX/L8F5dtPdfeACErrXO7pddigrgzjg?=
 =?us-ascii?Q?pEMEh6VxLBKmxYYXi7SVjIO6/LuBkkrIt8e8NPP+L/4h3SoIb/xT64IM32IZ?=
 =?us-ascii?Q?ZuJ+mYEErbW5MXTvug6vWEItxbuwBkhQzeQPdzZeni+SXSymvbuLKYTkw68O?=
 =?us-ascii?Q?x0wgo81lYu+sBBQ8z21goIgeOKMmmTC87bZurgBpqD7m9uzZSrA8BTl/rkBk?=
 =?us-ascii?Q?ybYC9OMlxtlThX3p5X5y4ktC5GsYYHgVi38QSbfqvBtGvYg7wcr7qg6FAmBi?=
 =?us-ascii?Q?EPR+JmRZmH+eI+IVCX4r6PLUCfQW9rjUpnGD+4RyXtSml1EE7hMzqU5u9z0l?=
 =?us-ascii?Q?6Uh5ZcVnoRVvrrjbWyRcWRtSWqME51SNzobkV05kK6K+SIKSqhwTSB7u6yZn?=
 =?us-ascii?Q?fs1Y6QwwxWn3fKK6e1XWzwGovsdSzUD/xqDF75s8AT8twRUOYcrj/l9iCx5E?=
 =?us-ascii?Q?FJHx4NwFmiEyqI0oZ2+7xVgjObMm6oVehSpLa72mNs3GWpzYOF6EVVAG9bMd?=
 =?us-ascii?Q?cmRchsxqvHdflZvPjHQZBQ4vV3QxSqF4cWKUlFOrEq60f8KKu0Uw+57eBui1?=
 =?us-ascii?Q?IvkQk9aF8HpJrEhn8Tu9jRuaXadMw32CFQ3O8cP5dz2VRiMhXHL25fA0Fhor?=
 =?us-ascii?Q?3J9Sb6ww+C28sJsQm5ND5tXLZksAEqJkI8vRbRFn59yC1CvwEDSxWEYLkDq2?=
 =?us-ascii?Q?16+8QSBnovDGTtrsNkx7Ayr3beTNQ9C4vtTIMDjxkeMScqh7L7CDSiil0j4k?=
 =?us-ascii?Q?h/Kp6W8ctjg5Wu2Vc6wCjTwNsJDTYLf0rhwhnSsJ5eLZ9g2/D88ccYYv4P6b?=
 =?us-ascii?Q?b+gTsQQ9V5jVqm/YoDay0ja8+6Z3W08LJMZX2LHCbwOwJHlhagTyZCZx8Hnp?=
 =?us-ascii?Q?VkFrhBFsapohG0Y7AgaeUrHXte+StdQWuaJZFeHeh7KlCBBh28RZpp/5gel5?=
 =?us-ascii?Q?FCdOTQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c775fec1-323d-4a78-6458-08d9ec9fc093
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 14:15:12.6987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 458QR2x125Yg/Sodh1NxVq5fIALY5uEUD60G4mJj5kc3aHRwwh77kn0Sy+jz0fj4Ihn+wXV1gd/wdmog0SHmUp7z+l8K2stZexyet9fB9yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5413
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::713
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::713;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Add simple test-case for new display-update qmp command.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/avocado/vnc.py | 63 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/tests/avocado/vnc.py b/tests/avocado/vnc.py
index 096432988f..187fd3febc 100644
--- a/tests/avocado/vnc.py
+++ b/tests/avocado/vnc.py
@@ -8,9 +8,48 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
+import socket
+from typing import List
+
 from avocado_qemu import QemuSystemTest
 
 
+VNC_ADDR = '127.0.0.1'
+VNC_PORT_START = 32768
+VNC_PORT_END = VNC_PORT_START + 1024
+
+
+def check_bind(port: int) -> bool:
+    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
+        try:
+            sock.bind((VNC_ADDR, port))
+        except OSError:
+            return False
+
+    return True
+
+
+def check_connect(port: int) -> bool:
+    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
+        try:
+            sock.connect((VNC_ADDR, port))
+        except ConnectionRefusedError:
+            return False
+
+    return True
+
+
+def find_free_ports(count: int) -> List[int]:
+    result = []
+    for port in range(VNC_PORT_START, VNC_PORT_END):
+        if check_bind(port):
+            result.append(port)
+            if len(result) >= count:
+                break
+    assert len(result) == count
+    return result
+
+
 class Vnc(QemuSystemTest):
     """
     :avocado: tags=vnc,quick
@@ -51,3 +90,27 @@ def test_change_password(self):
         set_password_response = self.vm.qmp('change-vnc-password',
                                             password='new_password')
         self.assertEqual(set_password_response['return'], {})
+
+    def test_change_listen(self):
+        a, b, c = find_free_ports(3)
+        self.assertFalse(check_connect(a))
+        self.assertFalse(check_connect(b))
+        self.assertFalse(check_connect(c))
+
+        self.vm.add_args('-nodefaults', '-S', '-vnc', f'{VNC_ADDR}:{a - 5900}')
+        self.vm.launch()
+        self.assertEqual(self.vm.qmp('query-vnc')['return']['service'], str(a))
+        self.assertTrue(check_connect(a))
+        self.assertFalse(check_connect(b))
+        self.assertFalse(check_connect(c))
+
+        res = self.vm.qmp('display-update', type='vnc',
+                          addresses=[{'type': 'inet', 'host': VNC_ADDR,
+                                      'port': str(b)},
+                                     {'type': 'inet', 'host': VNC_ADDR,
+                                      'port': str(c)}])
+        self.assertEqual(res['return'], {})
+        self.assertEqual(self.vm.qmp('query-vnc')['return']['service'], str(b))
+        self.assertFalse(check_connect(a))
+        self.assertTrue(check_connect(b))
+        self.assertTrue(check_connect(c))
-- 
2.31.1


