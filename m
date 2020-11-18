Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9B42B83D7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:30:39 +0100 (CET)
Received: from localhost ([::1]:46552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfSE2-0006Gh-4s
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:30:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRq0-0004y4-4Y; Wed, 18 Nov 2020 13:05:50 -0500
Received: from mail-eopbgr140135.outbound.protection.outlook.com
 ([40.107.14.135]:60229 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpk-0008Rp-Fl; Wed, 18 Nov 2020 13:05:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WklvXb1+7SGD1VR9gjfAlS242CS4MbsGjR8sE6ieVjr1g8XYJ3hSalQb/0mv8csp7epT4AhTRexISjj4KQc0Y0ivZKM+6ExOl0lWml2x43KA4T5ApVlnXwaSdKU3mm9PDy7PqQYRaj8EXUnABLuMiI9u0p6Aubg1i7ZZPpvzutRyu4CxDBSdiRI59Fb/rFFWBiovuUeZRuwICYoeRxYSqm2o57KT4D/9ek/hyPYcLvNACojpRZz2zFhOBfjfo34UGR+xvpIcHVBVotTEPYrtNTLT5E5SfL1sD/aiE2mp9JJapZ8W/qy57gZLoSDhwVnpbgP8TH/CBOuqXkntdP3IhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvpwijDJ+C74fBJrfaoHNmc1gwAo6woO4gl2y59QxV4=;
 b=dbA3VlY+ocIhwyUZb16h93pEqHKIBgAGhEMP6artRsU1pdjgOEpEXcbKK6V1rqnJn8f0P4O+p5mdVPjaKERuBTJHGFTCvMSOU53lxWHguaCR7lPGIXWRmNOKl8Ql4fAEFUbvI1j8I52nf4gadDOHAqKAdQDxFNGjRIetoTlEE2cEhXSFryB0Nu8JSTBEm4F6JR2A7d3hsUFYjqHetT3mpcfmP6TUXlyNDHJ8msIov+DZzeOLOWqCyasZIyaEiwbyFV/yNB7GokOgkwIcmezD00COFufgFiJ3rWXyPF92d0KhygMhiyDXghAAaolFBH4+X625p8lF7csxUf/PKfCCHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvpwijDJ+C74fBJrfaoHNmc1gwAo6woO4gl2y59QxV4=;
 b=jJQjqGGtoHQyqnfNM3lKEB3rZqq3TZl9WOo/TEU4iU8uPmIEiwemOOwddCMEn5LdDKO7kAesIHA7hlh3qLyReO1k7cWFSxdTtXuuEEa32B7Sz2fKVMlmHaghGNAhQAAmkALSNRvLvTIOB2U/VMYeKjtH8FL+N3PqXkfIVnvk9mE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 18:04:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 18:04:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 11/11] iotests/264: add backup-cancel test-case
Date: Wed, 18 Nov 2020 21:04:33 +0300
Message-Id: <20201118180433.11931-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201118180433.11931-1-vsementsov@virtuozzo.com>
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.112]
X-ClientProxiedBy: AM0PR04CA0123.eurprd04.prod.outlook.com
 (2603:10a6:208:55::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.112) by
 AM0PR04CA0123.eurprd04.prod.outlook.com (2603:10a6:208:55::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 18:04:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5aa79104-bcef-4045-bc25-08d88bec746e
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB591299CEB60F91A596C326D6C1E10@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jet8uA+u9tC+DbWyfo5+76zveHRixLZ0lO7kn7VXJbFc4Ne5cKKYuwI0RfNgnIj2Y6MPJtrHFHqcE7A0pS3B7fcIe0gROnDpo/aZOxPCO1dt8+y/ERC7AI5m7zJPSm6H3F1aoBysAdDrIAeX+T2Uvu1yafBaPosqkrnkTwGmtMKVnCEAqMVyY/6C2R7xNeCUc5cUCxyv0qF8WjabYmEhXltIikMiRIq46PDrjG3JwmlQPcZPsY/U8+8yiczYG95IfDIKnog/sjmWP3zhAm8QHe+bwMHr1RrSX6WW8uY730lOk0w7v3WmQwGaLZNVyQcVEgwYLtLdPbCnyBSJys+oKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39840400004)(1076003)(6512007)(26005)(36756003)(478600001)(6506007)(6486002)(83380400001)(16526019)(2906002)(186003)(66556008)(66476007)(66946007)(5660300002)(86362001)(316002)(2616005)(8676002)(956004)(6666004)(4326008)(52116002)(6916009)(8936002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: XYdofmd850KzJjbcLDkkOcCRCkOITuQnI8+WyUW/I8Gv9PMrvdXsOZ33WjqfZKNbnfFy5g6ZKKVWQCOkOnG1f6GFZvVXDGvEasL2R3Hc/VSK+b30lE/SgZUDNSuIcEpCBqhTLgxAh5A92oxoBVP8GBRZrUyprq4KHwfTmPWyWzvMHJrp+JyMX6wuqY02vsrWNXQzqOnDT0NZKX/lNZ0076SZLQjzMO+nVa6408ugNIygOqInvKnLBd3w6vqN6d+2LGT3yGKi+CS6smMcIkWtoroR9lh5YJcxP6RrB6iutHM2wvJOsgAgy2F4fG8fI7atLO9QRuYCJ/b164BLk17FnkUmFxdyCC5x0uk2N/n3/PraZYHGvtlZ+ez5+CL2m5E739vdBGPjMf/jmw8TzLap5/n4Ha3S6p43A68F51n3536EpCS+Whh+GiGhdXH0adesaWVOVV3VzDoA7DyEQm2utZEe1I9Q6X44iMIJ568uzqf4rKLqbKEU40bDQKLHXik9RA5LZ6tVNQ4Gc0SLfd013JCeohy0oifLii0XQFyJin7aW6GgwMUlcsXMlEQXQn3sngsVi29/cRS1rOo9Oqf3SqnTyubGx3cLYMVh0uz1v6k6eQuXrwLWqMyVodUNxikTilDsvQnUhNQYX+qe85UFVw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa79104-bcef-4045-bc25-08d88bec746e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 18:04:55.6186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hLhanpDHM/nioXAZ8DT7wdPa/7/hyTynlGHQd7QVZ/G6IJpfz2fuYXtr3HLUu57y8oAMJUHWZ+hl6Cepy7av65ah56ts1g10NcdiHNtCJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Received-SPF: pass client-ip=40.107.14.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 13:04:54
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Check that cancel doesn't wait for 10s of nbd reconnect timeout.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/264 | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index 3c6f29317f..b830078834 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -93,13 +93,7 @@ class TestNbdReconnect(iotests.QMPTestCase):
             result = self.vm.qmp('blockdev-del', node_name='backup0')
             self.assert_qmp(result, 'return', {})
 
-    def test_mirror_cancel(self):
-        # Mirror speed limit doesn't work well enough, it seems that mirror
-        # will run many parallel requests anyway. MAX_IN_FLIGHT is 16 and
-        # MAX_IO_BYTES is 1M in mirror.c, so let's use 20M disk.
-        self.init_vm(20 * 1024 * 1024)
-        self.start_job('blockdev-mirror')
-
+    def cancel_job(self):
         result = self.vm.qmp('block-job-cancel', device='drive0')
         self.assert_qmp(result, 'return', {})
 
@@ -108,6 +102,19 @@ class TestNbdReconnect(iotests.QMPTestCase):
         delta_t = time.time() - start_t
         self.assertTrue(delta_t < 2.0)
 
+    def test_mirror_cancel(self):
+        # Mirror speed limit doesn't work well enough, it seems that mirror
+        # will run many parallel requests anyway. MAX_IN_FLIGHT is 16 and
+        # MAX_IO_BYTES is 1M in mirror.c, so let's use 20M disk.
+        self.init_vm(20 * 1024 * 1024)
+        self.start_job('blockdev-mirror')
+        self.cancel_job()
+
+    def test_backup_cancel(self):
+        self.init_vm(5 * 1024 * 1024)
+        self.start_job('blockdev-backup')
+        self.cancel_job()
+
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'])
-- 
2.21.3


