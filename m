Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8F44B2784
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 15:07:11 +0100 (CET)
Received: from localhost ([::1]:43404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIWZq-0004W6-G0
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 09:07:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIVtB-0000be-Ui; Fri, 11 Feb 2022 08:23:06 -0500
Received: from [2a01:111:f400:fe0c::726] (port=41871
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIVtA-0008I0-3k; Fri, 11 Feb 2022 08:23:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMUhUQfKbys6PDGkWh3YWv6UNdJevmm3TcVDR+eLtS6JM6PazlJXzJZ5Y7g1htVWSaQpnx+Qg/ZQn8G39mqEwvzH0ZG/qDY0n7bRVbNAcafYrK8G1hm6uc/6oalbVr7fX3kVQSpHIVjB+z+O0hwBvFh+pf+iPR2LExMm7IUrXt2uqK6+gfqE4ZNAJ5Ox4GFQekdKcwmH2zdaMLM6A7rxdsuMBmJnznp6i2bREkMCOaRDK3F69T59k8hHAOIKJT1Xe97gTEuHquhQCWwZnhwP1Rbj7touWh4yjIRj4PQx8yhCkg+JJdWzO8eVU3tA3krvg52LUCwEPTAZm+JeWRq83w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JX5z0MXH/QAuXwnb8Wtp6u4kvZbDevfxlyAen0yE390=;
 b=bm1GSHY61FREMwg71DGJFSqE+bjn6g0dUBMUt4qgbUnqFOsBgWAcPvBU/MCAmbfZ2lQDHaZiJ9Y92EG8tDMPQL5O0Yx1FgSkwd5rewg7ILU/rxI8iESJ3iCYuqnJSEdcMH4ToJAWztCoeCZiT8t4lF7ENIPqX2FpZuMlnIWs0hPlAXQYxEIJH6CBasdvbfJIYK4eB3nf6V6mtlOQ83//mR2CivS+V3H3ybfTUlJHGHE+ePehsx7EEitGvAlBk7dtlvxVwbax0ejm4OGvxspQPCgE4RHyDGZ8WzIN9fS70gEPQE1cXzPp4h/M/QY+huDCb3ad/aWZdI6c5MkOeyf+jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JX5z0MXH/QAuXwnb8Wtp6u4kvZbDevfxlyAen0yE390=;
 b=SzDJNSE11Yeqq26/YzrUmnAvhtJL2tf6wKnsarSuzigS9j3B+MBUorIIixxVPFZgmnZ534EQ2HH36OmoDTQAABUGYLdN7ByyJvwVL04jvCLCq0dbApIt+ckSxX6ihjpqXMzisnA6DD6D7eNn67Y2TfYC1Gt8EsKwTFOZXDex9EY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3865.eurprd08.prod.outlook.com (2603:10a6:10:74::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 11 Feb
 2022 13:22:52 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 13:22:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PULL v2 4/7] iotests.py: Add QemuStorageDaemon class
Date: Fri, 11 Feb 2022 14:22:37 +0100
Message-Id: <20220211132240.781958-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220211132240.781958-1-vsementsov@virtuozzo.com>
References: <20220211132240.781958-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0601CA0048.eurprd06.prod.outlook.com
 (2603:10a6:203:68::34) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 193d7bd2-4c90-4d8a-8ba0-08d9ed619b62
X-MS-TrafficTypeDiagnostic: DB7PR08MB3865:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB386583D9B4E161937BD43B14C1309@DB7PR08MB3865.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k21PwrrSoo5PxH7gycgnAWcb/912DoF8oYtHLt8IAP5uxDujaahbzRlIqLkfl5AYjotauteIjHH2Hg47Zl78oEWfB9G8F7ophGF5Lmk8wpQ7OdVnScDzLxtUMbP0xdO62hxFLjOA6E+eZtWj3YEQs1zhZhtxykBclJOMw3tA/8mkx14P88SceN+MtE107o24tMaaF3dxOlkpX6YMgqmbILpudlLBy3gbpQHvLeF6KaymJw86oTNiM1m1gEBoEjoNJckxd/PmVDINDrJLFQsF7H8ehIjF3zY+6X78LLc41viUoBR+jZqUj/I91IcLP5ef3CKWojrGXoAh5fEtA2XdhEd5xUSi+IqNijUL8qsC6RQbM9UpVYQj8o3+g5VndVRHEc4ifZc0mRSJjzD0UQOm0rm4Fkx+O7Pps7Ezl9LL/Bbqv8qA17NCUEf25hW2y77LOiEbO4OZ5f49AYPlmXHirwik9Gs+WMa6oaSgjH9IkD6pOEI0fk5HQr1FY+glY6U3Nz9LalfUvOA1e56LfHTNvPvOfh5zzPL1jNi4iuUepQdcNoH2EECRWb95TTwh3EHvW5H0IaLf8qnFKqXyGATWn/Q81XLCQfYGvrjIUl3okvA+JZ9hC2Ee57C2L6esXu7t0trdibtkJKmbEe4BZSqxa2m/Edf9DqMMkTUveelvaSWu1uFV5ahcUAQh6BQjWaxEd1J6EnCbOBtccGmc+m7wfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(6916009)(2906002)(38100700002)(86362001)(508600001)(38350700002)(6486002)(36756003)(52116002)(186003)(26005)(5660300002)(6666004)(1076003)(8936002)(4326008)(6506007)(8676002)(66946007)(66556008)(6512007)(2616005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?egPcsE/HkCgy3j96mEa5BYkt/OvRCM5ozZ1azg9/C2V/cK8+UR95IG+qhFvO?=
 =?us-ascii?Q?dIq1cEivQLo9OvDuCp4RDLW4OvKrwx9vWOunUPw+z6aMQbhgXjG7UadBBkHL?=
 =?us-ascii?Q?K4X703g4RQJ2RTHfoaEoLF2epOwcptXcQ8o91PL2Klf+H54y+D6O7BglJz2T?=
 =?us-ascii?Q?ii+JAJR1H7rlh74Ro3yTXqQx7Q6hSEdrrcxiIXji8JVYn9bIoVB1A7ildNWC?=
 =?us-ascii?Q?LRXfN/ESOrDgHhuUJUAEAKJGoapSR4rTW/ygBrMX4Lj5+fqk38Dvy5u+2TVk?=
 =?us-ascii?Q?OJfcbuH63tgHa9gw65Tfna1cgUYUops6VxGUquTrT1kVwlVSyt3DKsCOxr1f?=
 =?us-ascii?Q?9G8HchowHKiOjlujWbbq/1t8RGw1DrvDxnrBkTd4vMHxRcfe80S7qE/bm8Qn?=
 =?us-ascii?Q?foCxdlhpjGsIKKKdwo9r0c6F7hYBaljrgVEbLk+iqvNzpBhVo24bxRiLervV?=
 =?us-ascii?Q?nshc8pEUNSvKL/dl7BQj5tztipos09ZzwL/uKHqhAfDok+CAg0NMxJ/EB+Pp?=
 =?us-ascii?Q?xy1yQh/6P11FI8XZ0/PVzH2UhDquNrLlGTqdKXT7lscS68qFwR1xj5DQPjYX?=
 =?us-ascii?Q?HQpuHtyVw/ZuN+4vKr0/7hONZ1Mvj93Y+0qt0kSSlPhxhIKT2smO6AvVTUe8?=
 =?us-ascii?Q?4UzmNGI6y+brC0k8XXTDhmGrGPtSriGsTbTJtO7bnyMA7KCD4K/oZmu8QN0g?=
 =?us-ascii?Q?NBqcyyjHFQHUZr9PL0N4Ptp/OEHu5GM0Ydmm1CPt8Dl/eWeVT+N0p9GpcDh6?=
 =?us-ascii?Q?7XrNvtKz+VGQcUP6cPXP0CIZS2eBcyq2LqjIuzltOJgN+0OoSAzFDHOJoQEP?=
 =?us-ascii?Q?cnK6CsZ7sEYGft7iP33QayG5WRFY1m8AHMOY3F4bZ/98nSqIr9aA7fW4uz+7?=
 =?us-ascii?Q?JoKW/12kiEtcg4HHxVVsNNVZbe11vmlCY6TP26vBpmkv3zGKdD7hMTljwJnE?=
 =?us-ascii?Q?Iwv+zA8uhch+Kcpqcf2v7CrzKlU5zTXpWxnimsLkiU8z4OXB7CRMjBe21/Ue?=
 =?us-ascii?Q?+j8nUZucFp0aXKu467BDKtYWo5EnSE3uhiVFuagZ0hCi+fKQ+JuMXfwKLojy?=
 =?us-ascii?Q?t1H6PgweAayB1s3Kk7r4F2B9LRLr0cZTZ6hbw8meq7BFGumZzs9MUQ2iOt6A?=
 =?us-ascii?Q?lv1M9SAXrREBruDGMHHWZ51oEFR427F9nQuTeqBWQXh+D8dAzl6t2p3XCCic?=
 =?us-ascii?Q?yS1Bs4P40OeAPkOCyIq4VVnnGviOkCEPAe2K5sIstZlpjCGYnQDlM7APpKQd?=
 =?us-ascii?Q?2k6Msq/JZRGCc4gRJlsiUAbifM54+d40C4ks9LoyPwIn+Y7On1dRMutyo3pS?=
 =?us-ascii?Q?LW65X7DRPhWvYNCfNemD1ccm/ufvl+Va37UX5m7W4ZaJURjg5AEX92FE5URH?=
 =?us-ascii?Q?QJXs9W1gh+IB3wZBPPDUt3dkKyEZV2FzrCwOLc/ipX9q4lyN8rSH+y0R8/46?=
 =?us-ascii?Q?RdZH3loa2N4nKHokgEp3eYAE7MB2e1q5e/asNsIOa+XRcv96p1Yn18r2d2oT?=
 =?us-ascii?Q?bwlMvppB6AY9246HSZuwyQw9rQ1f7Vq5v7/88/DfYd6eKa4FMGtMQ/Krvofy?=
 =?us-ascii?Q?UziX6prunz0LxAqa+vt/JsB/uo/QizeU3RimVB2dl0rq5MocTAB/k7wn9rUd?=
 =?us-ascii?Q?a3ff7oS4icA/NlEvnKw8vObdyH4NAno895qx3cyZnTc5gw3lpCqQGr9ONViC?=
 =?us-ascii?Q?saJ59w=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 193d7bd2-4c90-4d8a-8ba0-08d9ed619b62
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 13:22:52.5110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjAAxoGn1TFal9RRwIGcaiUmcnFqxIxs3O3tlelo7drmLPqnooriPdY0VD0pxI2o2EW4qFQtQevWKEkCDVFXhYTs01+VtSLPVP6NeS1ds40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3865
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0c::726
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0c::726;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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


