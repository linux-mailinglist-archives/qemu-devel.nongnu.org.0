Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6144CAA21
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:28:08 +0100 (CET)
Received: from localhost ([::1]:58758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPRpf-00070M-9j
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:28:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPRmm-000441-R7; Wed, 02 Mar 2022 11:25:08 -0500
Received: from [2a01:111:f400:fe1f::70e] (port=25703
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPRml-0007jt-4Q; Wed, 02 Mar 2022 11:25:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAha+Idx0GAcrAELnKtChBtT7vcJr2+EtVj29hPN2shUZxB9aiJQSa8C4PJ/Bj+p+s9/OBjrIzKiEgZccWwcuzb2WXwYVEvUHk3f1NHFnzcEcdfZj5VRQMZZE2mIvbw8D7qRfEhPxSs9lnDMrnc/GUwB5ZPSnZTdGo88lanutqSayGNdazb5QOuhCNlEmjCE9BKvv3ywu2YIuA/woL9mqsVC/RwwwLINP4SXP4hqi9nkkAPCwHBzXMZnsnI0UigmkmYexe9VuqIpBxDUSdwxFeBC0chWvtrK2ia4fkrWDUYoXxzSuuk7qrVKfX2wzLm2npafdQrzqrE7aF0Pr5xzfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19nDqOrw0zuJumRVJ5By97zO/vTNvmNYgAZxeCgbji0=;
 b=UjJtceUYIyen200O+Ug/mexqJ0/K/hmtbdNB8boQcmKm0RthLPDDqocBp6zYoSBnV+wvRdAxjSq9Pxg6avUN/HQ9jhAf917NYaogWrKnHM7ibqL4v3wDauoKn01ERLckIZ6tMkEslc91rAMPrfEsQK2eVl6NPwNwfCyQAPZadJW/C9fmDRSAC6d4d4biP218MHsZytOFH0AG9QNevaP3XbyZYql7T7qgTueIaeiE0hRhPgFN+gBpn7aGl207zvii7JDSm39Qlj1an0YWaGp2WAve0FoyrmynKN6elc0KOObesaa+3vI1/RWyVrnMb4jWzbVK0495g9F3Bvg29DMtEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19nDqOrw0zuJumRVJ5By97zO/vTNvmNYgAZxeCgbji0=;
 b=TFKSu3aqkx3lZWi3GLEGYmASxT/I2i1FNvx7DovE2UggGXz+6oghPQIHFqBO7cnc9Nw3lY/3i12mf9DleoVhRNTMIHr0vpeKk01rvtf0s1GbmwkWrhPU/eVJsaG6SYvtM53dT+4HNU9cKiUUwAFBPDCe3pgvMMThX4FlcU/wLC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM6PR08MB3768.eurprd08.prod.outlook.com (2603:10a6:20b:90::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 16:25:02 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 16:25:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 stefanha@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH 4/4] iotests: copy-before-write: add cases for cbw-timeout
 option
Date: Wed,  2 Mar 2022 17:24:42 +0100
Message-Id: <20220302162442.2052461-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220302162442.2052461-1-vsementsov@virtuozzo.com>
References: <20220302162442.2052461-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0064.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::15) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e54f94dc-9138-470d-f61b-08d9fc69336c
X-MS-TrafficTypeDiagnostic: AM6PR08MB3768:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB3768A5A41B4E002D53FFC063C1039@AM6PR08MB3768.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jnPXm9melTrFZTwJ2wK/kG1Hza4vFzgy6YQuy+aZJjGct5Z5tEEAjR5HsA4y45bPQVxPI8uaiCN03ohgnI71MTs9iMinz4Eu9n5Njmr+oupcAMPpzBsv1y17UwK7E3TRRbmj90z6pj8FFiSXaYzjtFtT9BEBFvrI+ujv1fNfbe7TyXCpV5Mzm1Ye+JJd5VXQcDnxYd2/Ktz4+QvL2S6Fdw00tydHK+UTMOrycheq8StMFzlld71YXQvZzqH330pMSOTDFA68PLE7TZJLkbmgEt5qpNgB9qf/ZcV71bErCsMqijJYojOBne0+Aww+3igaDR8WSLYsqJhr3NVfsmPXHp5HVJwhzxOo0bW23QzXmCStpwe3P92Hl1h/WhOvWfsuOKao89WpWjqw9g6AstuRswS8Ro+pCID9fTvz/mNTR3AseKSfs6WnxwvR1Lhf6ngK3qj9DUs7uJMBSHw5vv+83mCWO2jF6jzi9DmzHkm8mGOjHSFIdFM3YCWcq31Z9XNt4loKcU87HbbGxV3iJXdn/dZsmk1q2ObZm9Q9EH2lKcAjX+1KxyG0lXDDbSnuOYhva5wJP1smKF7l+5PXzTz3tY9GfMVsnuDhroXRXOUKFGDlngAaQl18sOOn72WoW+Z+MK8NVDxTkmuiI/vGMhjA5nSfsGEWX6FrFMuKK3/P9mW4BLeFA4DvRr7isyEt7C1dgeadpYrkTqHYfxUuUP/VF8/8jEt7fCLsDT5lXNujTYc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(2616005)(36756003)(8936002)(6512007)(38350700002)(1076003)(316002)(6666004)(6506007)(66556008)(8676002)(5660300002)(66946007)(2906002)(66476007)(52116002)(4326008)(38100700002)(508600001)(86362001)(6486002)(83380400001)(6916009)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DvssyQcz1EuP/wregORelu4EcqnTOEaZaIQGHQ45aGkRunr/X2I8GqTBUQ6N?=
 =?us-ascii?Q?9XW77JASg+VN1vpNCczs+Fmofhu6TnEGk6LKWDp0YcEgmoXe433sUemh2WP8?=
 =?us-ascii?Q?efFfAX+CjiAE6fTz5ex6UX5WdmWmI6+548lntlLbD9DMPH/68ldah92dZz/m?=
 =?us-ascii?Q?lxM7023/BGzIftHM2iECwn37O4wPuniqC0LJ+PbCI0xTopknt5q4aJmMa5wh?=
 =?us-ascii?Q?hbbSHpHqATDIaUSNsuuTef89lAhH1fRIqQxBjNo93bnP/OU+X9OjX36IOtVY?=
 =?us-ascii?Q?htLPTi2EkGhiFIOzp8fDIUeke+o1q9AOY+VcAZSa5weUtASC/Rzd4Xcacper?=
 =?us-ascii?Q?3kGTo4VnWAbESs+/0r0f4pPCgkYY8ZWcoZNONlKzop6hcKNFxOKSrTQcXsy9?=
 =?us-ascii?Q?qJZUssIp0z6A8RbmRLz7Lsx/6jPfgRNNFHk5Y5JMXPDE5QZubdHF7FZIpKOv?=
 =?us-ascii?Q?Fgf8JmcndC8JroGX+D736N121KmD4YvSdhv76e9L5d0oV4MsyyFqqzGHI8by?=
 =?us-ascii?Q?8Jus6zTr6Yqime4SrVVm9j7j8dDChLFodaNiUwjX2EOTLw9xFqEG2tAKAM0v?=
 =?us-ascii?Q?MEe8Xy7HWLxJY2cmaBrMRVu0EBVG5ancEiVFJc25uth0FiV4Z4rVdikkPl1H?=
 =?us-ascii?Q?X3xbVWn6SY2je5raUnWP6dkr6hIoOgkOx2yIJLPOB23jurHv31BODajgySha?=
 =?us-ascii?Q?ejPzlL1VTbrqMfcokHCPuQ1zq/epIOnmlVa/6Jl3+mGo+5j7q51gJQ1tY2aA?=
 =?us-ascii?Q?mPr/M0zrMkkzi+NimcQQpWjE9fvdeuQljtVlGFauKrLiCtLnD5B9TWU8B8Ka?=
 =?us-ascii?Q?uSPga2Zmd9EO/ZXNKfOyLSHniFuxaX4hpzZwI33ZayO15TXayVHsItuk7f+L?=
 =?us-ascii?Q?me2qV9VoMQ0Y+STqe8Jhs0S81mROOxup9gSVuTtcBBRQIhtcSJ+3P3y3zMm1?=
 =?us-ascii?Q?0Q1/gOKrc9bj4o+7UG1MJZRmgG/2KuVoe3Tzy8Z8dW8lTrre88Y/U6wbZcZ/?=
 =?us-ascii?Q?/T/AUPdK7lO3MBkv2JjuFuxWe3B/gjsLDwQBLqOgu/faSOO2Dq00Cge7diz9?=
 =?us-ascii?Q?KxwqQJ0gb5+8ZhB3CueUbbpjequoQvsfXO3abfpX4hjyQogBvZQMxzLCpW/3?=
 =?us-ascii?Q?pwGB5NN+Xnm/4KzNuLEvdPc+EX3KX1c+OmPcv15Mv20McQKW0Nmlxh51ZXH4?=
 =?us-ascii?Q?C2nGSrtdi4ysnQ8oiz/sfpDx9xcCRniiw4kVmOdJkKpRhrQU72GtuA1w964p?=
 =?us-ascii?Q?CitW0K85wp5clijkd+Qj+KraGQhwtA6OOhx1Uyc2utxR8dWx2K1OMsHDmbVt?=
 =?us-ascii?Q?OkpqHysnH6A5QSh+4NqqBQda18NkpEj7oa3UFwjYUQNqIPwvOpm+Fw8/eJIA?=
 =?us-ascii?Q?wjXwmopnWtDevY+wEOeNJ4TKTm1ZqMcgZe9A3UJPja2tlfLbBpGK3c5SxXxO?=
 =?us-ascii?Q?O4BIre/diCDDsWyZNw+x03vBuuO1o6OTmnveTQX5TXp/GatADfdv2F5y2bc5?=
 =?us-ascii?Q?AG+4Os4AisgjpuoL9Vle1oflXCpP0JKc8z7aYJUXTkN/7p2Io0ITlFdnEi6T?=
 =?us-ascii?Q?74hk/zNQ1+t9Y5wZAS8jeIdMYayR2peCjUv17mZP6O6URQkj+w9mcwcXEFGH?=
 =?us-ascii?Q?0xZOoW+4s7Gh+9eMxswnE3KjAzSDc27Hg74TYNXpkYFXoJFLjqAScZlwNLAt?=
 =?us-ascii?Q?YtUWUg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e54f94dc-9138-470d-f61b-08d9fc69336c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 16:25:01.9179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2519bDBR2wQWLg1pkGvtP0/yL6H7PRLXcmcmRUUcFnKu0llDvlFGwuhgygSEjKDyubf7vdo+mGuzivzlrIdce2+MRh+c3umH6P+8iUjKfNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3768
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe1f::70e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe1f::70e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

Add two simple test-cases: timeout failure with
break-snapshot-on-cbw-error behavior and similar with
break-guest-write-on-cbw-error behavior.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/copy-before-write    | 78 +++++++++++++++++++
 .../qemu-iotests/tests/copy-before-write.out  |  4 +-
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotests/tests/copy-before-write
index a32608f597..265299957c 100755
--- a/tests/qemu-iotests/tests/copy-before-write
+++ b/tests/qemu-iotests/tests/copy-before-write
@@ -122,6 +122,84 @@ read 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 """)
 
+    def do_cbw_timeout(self, on_cbw_error):
+        result = self.vm.qmp('object-add', {
+            'qom-type': 'throttle-group',
+            'id': 'group0',
+            'limits': {'bps-write': 1}
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('blockdev-add', {
+            'node-name': 'cbw',
+            'driver': 'copy-before-write',
+            'on-cbw-error': on_cbw_error,
+            'cbw-timeout': 1,
+            'file': {
+                'driver': iotests.imgfmt,
+                'file': {
+                    'driver': 'file',
+                    'filename': source_img,
+                }
+            },
+            'target': {
+                'driver': 'throttle',
+                'throttle-group': 'group0',
+                'file': {
+                    'driver': 'qcow2',
+                    'file': {
+                        'driver': 'file',
+                        'filename': temp_img
+                    }
+                }
+            }
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('blockdev-add', {
+            'node-name': 'access',
+            'driver': 'snapshot-access',
+            'file': 'cbw'
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.hmp_qemu_io('cbw', 'write 0 512K')
+        self.assert_qmp(result, 'return', '')
+
+        # We need second write to trigger throttling
+        result = self.vm.hmp_qemu_io('cbw', 'write 512K 512K')
+        self.assert_qmp(result, 'return', '')
+
+        result = self.vm.hmp_qemu_io('access', 'read 0 1M')
+        self.assert_qmp(result, 'return', '')
+
+        self.vm.shutdown()
+        log = self.vm.get_log()
+        log = re.sub(r'^\[I \d+\.\d+\] OPENED\n', '', log)
+        log = re.sub(r'\[I \+\d+\.\d+\] CLOSED\n?$', '', log)
+        log = iotests.filter_qemu_io(log)
+        return log
+
+    def test_timeout_break_guest(self):
+        log = self.do_cbw_timeout('break-guest-write')
+        self.assertEqual(log, """\
+wrote 524288/524288 bytes at offset 0
+512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+write failed: Connection timed out
+read 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+""")
+
+    def test_timeout_break_snapshot(self):
+        log = self.do_cbw_timeout('break-snapshot')
+        self.assertEqual(log, """\
+wrote 524288/524288 bytes at offset 0
+512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 524288/524288 bytes at offset 524288
+512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read failed: Permission denied
+""")
+
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
diff --git a/tests/qemu-iotests/tests/copy-before-write.out b/tests/qemu-iotests/tests/copy-before-write.out
index fbc63e62f8..89968f35d7 100644
--- a/tests/qemu-iotests/tests/copy-before-write.out
+++ b/tests/qemu-iotests/tests/copy-before-write.out
@@ -1,5 +1,5 @@
-..
+....
 ----------------------------------------------------------------------
-Ran 2 tests
+Ran 4 tests
 
 OK
-- 
2.31.1


