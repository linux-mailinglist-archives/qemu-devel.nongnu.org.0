Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA224AF477
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 15:54:15 +0100 (CET)
Received: from localhost ([::1]:40548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHoMI-0002aQ-LK
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 09:54:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHnZS-0001PD-4x; Wed, 09 Feb 2022 09:03:46 -0500
Received: from [2a01:111:f400:7d00::715] (port=53856
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHnZP-0000MG-5l; Wed, 09 Feb 2022 09:03:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahwrsSxxets9KFY77LCi28Po7JCu9s1fmyrJswBGv/DyLmphBBTPgBflHljcJpmp35/cDMYQ77EQkZWZXxWxShfft9MT85X6q5hCVx1bxrz69t7IINTPH8nMq8Ml4cHOiUh0DuS3EXKEgqelwaz5IGKRGhmI0pu/lwpfJo9TUSNUylshHyr26khx9o3C3t/2XZFXBk+CFwC98ffs5TUyNBm+J60CvHqErnoZhGfhh0TycWMQHTGRnbUh+ZKONthFSHCu0oLHZUe76HhhowPWzmXuDzcO4xVzdBAzqNF5dGAPJ5xex0A80QuOfT8RtkXkjN6PS5uhTkx8yBQGUwI1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WK9edGt1q6cyVin2k5QTSlORQ0xxXKO4xMJndvAfEqg=;
 b=ZCKvVxK4ieOvAONeTzJpX3ZlMaOxyixFQ+tvCNytfiI3/NQGSXuo84ZtrUzd6YBNf2REav1z7NjVPlnijvMP8xvqxiaZGeGvyCjsQ4SU5YIMKVTHaoQW7xp1nWhO60xbYpCGH0BhbNWASOzLZjtC45KkCBCecubPWC2+XtcmdBPd7QZczSHZYyM4aUjNDiGJia1X2+AwR/Av/rcUTy624KejI36zP8fnzxdVN75B52ft+M2VCa5rKn55gownsvOc9xUty9UB68v81QFu2dt01JoU/bZvlh9w7uF2rKWgU0p/FRzi79vba7oyBUMtgoA2UQ9Inq+OG+Jx3cg4YF9qvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WK9edGt1q6cyVin2k5QTSlORQ0xxXKO4xMJndvAfEqg=;
 b=mw9vp+5u/UaNsngL8v5d+sCODkbo5Wyptq9+Desdmi35mEyp5MjHqJFMvRAHtk3Vu+WSYJVbj0pT/yYhxBH6LI7H0BXiTgSy7CVIebESGCh/N/UN7eRHYzMQQMnSIuln653v5rlLGj8TcMEO9vAh520dAYR61s1/Wiaaslrrlpk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5698.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 14:03:12 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 14:03:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 4/7] iotests.py: Add QemuStorageDaemon class
Date: Wed,  9 Feb 2022 15:02:55 +0100
Message-Id: <20220209140258.364649-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220209140258.364649-1-vsementsov@virtuozzo.com>
References: <20220209140258.364649-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0192.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7291e80d-a2bc-4445-ab83-08d9ebd4e8fa
X-MS-TrafficTypeDiagnostic: AM8PR08MB5698:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB56986323D5C2342CE0730ACAC12E9@AM8PR08MB5698.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JjopW2FzSZXCgnDdUjX/zFXRVyeumZYrgu6jMYpq7Fc6NU+uesr4oI12NJB71CU8RKQQzzVrL33Np6gACHSMD+5MQKqkSRAMg8jcOt1GoOkCUHNl0UKCzErhQgVK2TiZwNtx8sPVksBNKtXZXLwqoqZWHb6bqrclSezooyZjm8IONAohOjfRKIN22fZs6Nf/4g1Zzsp9oIYXCuM4OYBNL51IVkxbAWEGJYKU267zXP29qwhJi/IektLjhO96nd1P86LRLbks/jjtHNUWUQjSyCJ228M3g71mZqJOhvEQmsgGRV9daXiw02xGLuZE5qSIBs/C2XOJ8caz060lvcZ/M1OcNN5SjRFrGSX4D50Qv1V7Q5pbioqhkQ3woUMomC2heFthFmk5IIjxpqD3M+c6L9g82vqs5LuJa0Nbzs20OFgGNJsLdOfaKLB9scYa/DmbELgskprnWqv8hRJCM1b5PdrJKjizv5K3rktYMBt9mtMCF/M+2sprbqUmzar20qAql+PtThgsJQlKwhluIXjSHg7xq9XSRBUEwGn885aIQyHRVfvL3CNscNRmYR1LO6coNnvNAL5Ychjg5xWFhKs4aGKrQ1fcCZ65FSlQ+XZ1A5UetySE0tKmrs2pU2ihHhoQp2UqeUH86WfII0qwGidzh8K+WU8ELCeHfsf2SSP0P6o/KfVJTi3sEO5wWRxijjvvuXk9Sie7lMTqxP31bzPciw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(36756003)(316002)(6512007)(2906002)(5660300002)(6666004)(8936002)(1076003)(38350700002)(66476007)(66556008)(6506007)(8676002)(86362001)(66946007)(38100700002)(4326008)(508600001)(6486002)(26005)(186003)(6916009)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ARQi1gTpQZByhvTm/v5fUjobjWmFGgTyzphpXVj2AT2CN8U1uEDi/MIulzOe?=
 =?us-ascii?Q?tw6MmaXWs9+OBgdxVhHTsc1lt43C9nvSZGPl6OmmBLm8OIWqDn/AluOqwupz?=
 =?us-ascii?Q?/baWVFnAIHDm8DN3QkMAQbujwPz/pqSqDDiB/f4GcINbw9PlaZrnklz0MfnN?=
 =?us-ascii?Q?L+8TpkaKRonCthO7dQXJcY6bqHP1RS+iJhdlS1xdWT5YOd+exfN5Zu+DVTlc?=
 =?us-ascii?Q?1WwGehThatqGIFP2fzw4UMUspu71FJBk53DXbAasu1kf/GbiGWYO6j7lOxfc?=
 =?us-ascii?Q?uDUJL/f0I95HOkHYDh7tRVFjWcT5GrT/DktkifpNKLShgDOr9ushpQ+WCeGE?=
 =?us-ascii?Q?bR8kFMrrcj16ad6J6PG7j4s6Hpfi4O2fWQuOzPFAAq/RTIiYYZzngNrTQYIb?=
 =?us-ascii?Q?4Ldm9nmGH7YARYRPYcQvKyw12ipZHMFljwP7YVIYrYInv5q0NCc18+myQiDn?=
 =?us-ascii?Q?7KMUsUw8E/J+aQzEn9W69anXp+cc1nhFP8/HGEDltLX+9ShJZY1EzLcPpncj?=
 =?us-ascii?Q?rDR9KBVQCVM8qZeDpplzX9nV+gQavY0NzLLSSaU/ophNIVaiJRpJOZGc7oWn?=
 =?us-ascii?Q?FWI19FlkQcKJAMqCSRu9HWk4t8W8hIyVHkfGV4+M1ccHTfVPW9h4/dLC6Z+z?=
 =?us-ascii?Q?0/wGEjjoULktdW+MrC7/nIIfmAOhcmaaj/L3YCR72ByTTz2005rfUKZP01CI?=
 =?us-ascii?Q?xXl10iLaaKlpLJlXpgHyqn8OWUYHd5sOwkHwaEFQxXq0onaoKCr+IApeiz0O?=
 =?us-ascii?Q?l4IKUMGgFGEMySwvdRvvRw+L/q5D3gWK4KRY8lV5vjwIVYpK5VxDdl8woGja?=
 =?us-ascii?Q?z4PQ44tWx3BOMsxW6sLXwA0vxWu+4PTvNoEeUOOuAMBPRJZ8ng+pjaozvp58?=
 =?us-ascii?Q?xlVHGQq80Z8n2MQS9X+eiJzowuzVEsLobVjodGCz3k6YATSncTBeeNqspLHT?=
 =?us-ascii?Q?XAd15oGfy+axyEnpuhDYwJMzyP4PgilY8Stubiyq0hH1plHe+1q2nYwyd6Qd?=
 =?us-ascii?Q?ldohLDbLlF0oe/VwHjBp6RqFVOpAAP6XaOrCLaAu79VxggeuQh0qFishTS3S?=
 =?us-ascii?Q?n1At7xd/NE5Xlija0Onm+7W6JzXAgq4rB9+AIaMfnPD04d7iIlK83TAunP9c?=
 =?us-ascii?Q?rlqJWLFnhUL+ZDbEOPXHX2TztxZB1/u7PzBaIsGaiI5Hn5c7ZRZCPD0yE834?=
 =?us-ascii?Q?ddkoM01AJPmP7DIcis5vsbOraYfgPEQn5s8USEkMq0eCf/DMlcrwIOgDcJlb?=
 =?us-ascii?Q?IXYJlwtcLk0IqaTPWUZLC+JGdv27e4M2jdcipugpO57lkdVBKnd/NDPUZLGy?=
 =?us-ascii?Q?3BN1vCtZV0E0/P1UHuVX/jHBdpAxZnwVqZnIUoGw0/UkNjF1qRb1LlPjrypG?=
 =?us-ascii?Q?yrjpJXg1ZYP2dLb0xbMFTdAKbHi715KHcWSGZihUM7u2hVffGwGUa/bR3vdQ?=
 =?us-ascii?Q?HxLTE5OPX7Qt2eGvhmL0qJNmgOAVD0zVI/q+74dCU+fvuuTlER/4pK03xZHF?=
 =?us-ascii?Q?5m/wwJekV3QE0kN3JYt0GhztnlBKGFOWj9sqJAb1fWHhCKDPzarxVNq3JRf3?=
 =?us-ascii?Q?49dEVkGoYI2XeemM/pd5x8gzWYUKI+nbd5KoK30vWkVwoOmfW/x2QaJ7841j?=
 =?us-ascii?Q?n/bm2icI9Ch9If2W6xoYuVaTI1TuBwbRkhK08yhm5dwxriVU+CAahB5feCeP?=
 =?us-ascii?Q?8h/F+A=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7291e80d-a2bc-4445-ab83-08d9ebd4e8fa
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 14:03:12.4753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9aqn5I18ybC/nVtBGw3+7FQxZuoQitihZ6Sw4475Mz/Sjx/8DjtLxqtOdUbDcbOCUc/rXX20Age7F2d4P/6E9HoATEeaG1vJpxJHvaGMaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5698
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::715
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::715;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

From: Hanna Reitz <hreitz@redhat.com>

This is a rather simple class that allows creating a QSD instance
running in the background and stopping it when no longer needed.

The __del__ handler is a safety net for when something goes so wrong in
a test that e.g. the tearDown() method is not called (e.g. setUp()
launches the QSD, but then launching a VM fails).  We do not want the
QSD to continue running after the test has failed, so __del__() will
take care to kill it.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 8cdb381f2a..6ba65eb1ff 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -73,6 +73,8 @@
 qemu_prog = os.environ.get('QEMU_PROG', 'qemu')
 qemu_opts = os.environ.get('QEMU_OPTIONS', '').strip().split(' ')
 
+qsd_prog = os.environ.get('QSD_PROG', 'qemu-storage-daemon')
+
 gdb_qemu_env = os.environ.get('GDB_OPTIONS')
 qemu_gdb = []
 if gdb_qemu_env:
@@ -345,6 +347,44 @@ def cmd(self, cmd):
         return self._read_output()
 
 
+class QemuStorageDaemon:
+    def __init__(self, *args: str, instance_id: str = 'a'):
+        assert '--pidfile' not in args
+        self.pidfile = os.path.join(test_dir, f'qsd-{instance_id}-pid')
+        all_args = [qsd_prog] + list(args) + ['--pidfile', self.pidfile]
+
+        # Cannot use with here, we want the subprocess to stay around
+        # pylint: disable=consider-using-with
+        self._p = subprocess.Popen(all_args)
+        while not os.path.exists(self.pidfile):
+            if self._p.poll() is not None:
+                cmd = ' '.join(all_args)
+                raise RuntimeError(
+                    'qemu-storage-daemon terminated with exit code ' +
+                    f'{self._p.returncode}: {cmd}')
+
+            time.sleep(0.01)
+
+        with open(self.pidfile, encoding='utf-8') as f:
+            self._pid = int(f.read().strip())
+
+        assert self._pid == self._p.pid
+
+    def stop(self, kill_signal=15):
+        self._p.send_signal(kill_signal)
+        self._p.wait()
+        self._p = None
+
+        try:
+            os.remove(self.pidfile)
+        except OSError:
+            pass
+
+    def __del__(self):
+        if self._p is not None:
+            self.stop(kill_signal=9)
+
+
 def qemu_nbd(*args):
     '''Run qemu-nbd in daemon mode and return the parent's exit code'''
     return subprocess.call(qemu_nbd_args + ['--fork'] + list(args))
-- 
2.31.1


