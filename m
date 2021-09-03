Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58173FFF91
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 14:09:25 +0200 (CEST)
Received: from localhost ([::1]:36316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM80b-0003ip-0r
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 08:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM7sR-0000Gk-CN; Fri, 03 Sep 2021 08:01:01 -0400
Received: from mail-vi1eur05on2095.outbound.protection.outlook.com
 ([40.107.21.95]:36929 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM7sP-00040O-4O; Fri, 03 Sep 2021 08:00:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pen+Yn/Y5GIJ/5XoopQRFzcr9Nwp8z34KQ+H5Oa7e5dUCuoZFRK0JP/cBgdIOYHEIEyvsMQ8cokutgeW+GBMWRO98AsazBHJFb2Qu0Rz34vym96QbwQDhdKC0w6zpUJYt1tjAUO9pWcxde+269epPVqlkwbWbeI+66SI/OJPp4JiuAK6K5tDvEEubKaA4eNksB3JbFyXaZ7RvyATecD/ZF3/9vD52cTpG5VSTET2Pgve4SQZBHAXwDWEgYbVjAtd6zEZOuv98zRcUoMGv/KTKPW0aGEdXuJZBoyAvFOAxb+Kg05xsCt4i3SDnWanqEAP6qPk/N1FMcP/Gir3dpIOYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=0BfxkAX/kytGaq2zYIrJgyktaUVLrnyXMsxZZWSg6gU=;
 b=KaPrygO+hqhQvH2+KhWzA39XQ229VsnuvX/mXwpF8VjnMBYcbSzFtk0/u7DmfEeURyFR+Nyzf9JwW/wn4oqUS71jVCmuFeA6YRBQfh5nWt+t1FGV7TlHFSO7BZnkzS+7mJAiU4vbvNfvb4TOqJUxczwSYcMFaZeOlFjVXRuSiDL+QHCUTl/ap+JNSlaKqUoVsaWEb7vSYZQCPOvLhSauX2uNh7TU5plIWjnnfA9ZLFkNc5vedDlm9HjKYpYb6n6C98RDHvimzxtyefPBbhmBGEFweiBjW7Y+vkUioS7RNmul7yURvOiFqESb6L0NsEQvZdbl3cNL10SiEq7rHFIxlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BfxkAX/kytGaq2zYIrJgyktaUVLrnyXMsxZZWSg6gU=;
 b=qsryHWZcmMRjjfYLvhepHX935ko1Yo1CuC2ZtVTjFaxfzRhRUO+TYLG8sRjYZzPPC4bmsXC0XRC9bDBU6i+P9bPhuf/d3LOZWOSJJ2LijSxOJfB0Mu4OMAlvDQxlfW9A44y/HkMpSbCsDZdZmihYMPlYJVnrMjhxJmEkO40bEWY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1842.eurprd08.prod.outlook.com (2603:10a6:203:3c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Fri, 3 Sep
 2021 12:00:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 12:00:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 willianr@redhat.com, wainersm@redhat.com, thuth@redhat.com,
 f4bug@amsat.org, alex.bennee@linaro.org, pbonzini@redhat.com,
 eesposit@redhat.com, eblake@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2] iotests/check: move long options to double dash
Date: Fri,  3 Sep 2021 15:00:39 +0300
Message-Id: <20210903120039.41418-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR07CA0048.eurprd07.prod.outlook.com
 (2603:10a6:7:66::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR07CA0048.eurprd07.prod.outlook.com (2603:10a6:7:66::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.6 via Frontend Transport; Fri, 3 Sep 2021 12:00:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05a1eba5-8d84-460f-812c-08d96ed27aec
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1842:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1842511E17D86C054626E42FC1CF9@AM5PR0801MB1842.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vjz5FPptP2qxsPLzxz4eOiTALXXPhHF3Yr7ps5/cn/Y6aQG2J7XNohWg2PZvl+Mq4g9ImfwcRyDRDP2SA3npNOj+Jns43SFpnEbvQni/MhBu6Tx/l8esEYSicWOrWIZ8i0qLgYAbeZ05vtr+kCL5ezdNBwUI2ti2oxyoxDuJsybS8MwuHTpD1xpHucmzthzD+FoK/M9WCxj1PMJokOqYl2mhVcRElg0gM6V0SiVE95jinZt7KcRfAzXoGzFKHyXO3j8vNQI8f4/B8aamP06avfAAUriBTIXEOyqC1oUKTVOXkpScl9Ow1zChwyKNFXtteUQ8IR3xxIWMBTlCZv1+PKuQa1qxaS11BAFZtmADONqk09AufjcyJ1zq8CIFGQWehxqeN3Ztk5e1714dLuBDh08nI8AEPlhrBavX+sHDWzX5S4phDY49JuUTxxppXamhfes9zcRGJ6cHh9xkTrNkzt1ZrJS6BLGl2gDGLNJpN8LFmFHqm12EwQC3zpz2VC0Bl/znG1s+oJwSRnjrgDR3RVZxqj9GqUJnGbbqZivB9ohnWv507vpHWxVM5r63/Z5OzwMRJuBpoITR42I8GsFPxr54iE87vUf/wWMr02VvWnZBYFT867t+UQ4QR4d8j220vG3NiXwsDroExlkzbYX3Pkoe2LRPDYeEDSy59iUGfAiuz191c+XM9836koXt8eNl6RbXn7tW77Cwi5ie/E7/mg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(39840400004)(136003)(376002)(6512007)(6486002)(1076003)(2906002)(86362001)(4326008)(186003)(8676002)(956004)(83380400001)(38100700002)(38350700002)(6666004)(52116002)(316002)(36756003)(107886003)(5660300002)(2616005)(6916009)(8936002)(6506007)(478600001)(66946007)(66556008)(66476007)(7416002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IyMfYbbPS4yBRVs/B+o8d/MnLWLG1xIaorrVFw3V50NnCKlvrBpChANJKhU2?=
 =?us-ascii?Q?WwgWoNRgHz2OK/MHNu/rlmfrkej4+TBUCqjCQt/mogJdWxErDimZGZOFWNha?=
 =?us-ascii?Q?3786JPVbkVHtcaDD2oLwE34j6Qqieu84kQxgacK01HyrGNqp+cjve5IC7KSe?=
 =?us-ascii?Q?gkpf8j5XhKjaHCacUI8EN1eKUMDHTEVLq5JapnXvwySa+QRBXSfZJO9CYiz0?=
 =?us-ascii?Q?s7wMhDCNbOGmp2feLWcdq4j0UB3fV4THWz7U++k14kju9aJFlVtOv/fpcE7+?=
 =?us-ascii?Q?ZVsSqnVI75SqN/KNj8AKBWIycDO+20Amjq1HncNzXleKeORKZLKU4FrT8WQt?=
 =?us-ascii?Q?QruG92wahhygVVB5ojhiEJFAFdk8fewKK83MKE/SPHVMxntrMYXhb1OCpPtN?=
 =?us-ascii?Q?cPmYsFuQjHGAifYdFmTJskWiQcDAxfOkueRgqC7f9ExB+pwH+QPfjJI97J3L?=
 =?us-ascii?Q?QVoy5yczbaeHfSIqlEZPzZ+8ZAN/mX+r2983aEyhOtvB4WtXgHZW/lIlC0aY?=
 =?us-ascii?Q?zz/krWDmzTgQzldnLNisYiOoRRDH4Qe4Mb7BTcnkdNTT2C64XuFaUmYaOT4B?=
 =?us-ascii?Q?UzUVct7gzqj3ef8g5Iv+bARzdDNhrfoKznkRjb48pxHRuiPf0B5MSFWqkfcY?=
 =?us-ascii?Q?nKVYEdOJ3Gt5Ti8aYIcypQJYZ15Q9FxnBfrUqa4cx4/0kd8jA6i0CCYNeO4h?=
 =?us-ascii?Q?b7f3ku61Bzm+KUBvZmGSBVrW6qhhU6ylSyTLiUe4nJmoBbH7ejK7VKe+ETfY?=
 =?us-ascii?Q?6G5jDA0mDzUMLaBZmzD67y+tWLqGS4ewvUy/m5IC/mdD6Vaf/QiR4cbyQXCF?=
 =?us-ascii?Q?VejGPoNLPs53jOR0Mfak4+llj94FucPcz8L+ZFmXdB1ygjTm17pxrGqIugED?=
 =?us-ascii?Q?sANzBKwX3bj7ZXaeYPPl9lB46JfU8fwrSeBSVs9G7q+a1SCBhufY1IeEERvc?=
 =?us-ascii?Q?zv8JArTgH5ncyn+FaaqA0fGgfe2wK2MjeKQMLJ1pa1jmlJoEcTSV2ICa7S7z?=
 =?us-ascii?Q?XJHlNE6UDWXHvJWEWzFcBgd0M5G6TE+MyLWBjonC0yzna9PDiVWrpRxS60OK?=
 =?us-ascii?Q?risgIRBIJzROVr8PJn6lLbZc4IzH93zSb7gvI5PRmX73VSeC2Igq796w8HH7?=
 =?us-ascii?Q?0j5bN6DsDZtnhOvxgJhs1gVDase7moS9bn6z5pC//XG7KzMfqF1Qn/ENdjPJ?=
 =?us-ascii?Q?WvXDeG6xd/50kjd7KM6piAixY5RWkLB0Ia8c+yXMFyXVRY5E95G7pVs7RI8c?=
 =?us-ascii?Q?DNITxgmcnfYYJy3SXVjY7fhM5WgIknyDULwMt67HakiCR4C8PuSupK+eHknn?=
 =?us-ascii?Q?DXKlrgmeoFZ92IODgnmeoKTg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a1eba5-8d84-460f-812c-08d96ed27aec
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 12:00:53.5686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7n9kl4PTeVDJ+Hg74tWYRPMlAma0y9rgrMAeiePH0aDZBOW/+5rqTGGp04pOKSISmaZBAk8XQMb0viLballpgODY6avphFzRQeXJVPfHx/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1842
Received-SPF: pass client-ip=40.107.21.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

So, the change:

  -makecheck -> --makecheck
  -gdb       -> --gdb
  -valgrind  -> --valgrind
  -misalign  -> --misalign
  -nocache   -> --nocache
  -qcow2 (and other formats) -> --qcow2
  -file (and other protocols) -> --file

Motivation:

1. check scripts uses ArgumentParser to parse options, which supports
   combining of short options. So using one dash for long options is a
   bit ambiguous.

2. Several long options are already have double dash:
  --dry-run, --color, --groups, --exclude-groups, --start-from

3. -misalign is used to add --misalign option (two dashes) to qemu-io

4. qemu-io and qemu-nbd has --nocache option (two dashes)

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

v2: cover more things, update also format and protocol options

 docs/devel/testing.rst       | 12 ++++++------
 .gitlab-ci.d/buildtest.yml   |  4 ++--
 tests/check-block.sh         |  2 +-
 tests/qemu-iotests/README    |  7 ++++---
 tests/qemu-iotests/check     | 14 +++++++-------
 tests/qemu-iotests/common.rc |  4 ++--
 6 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 4a0abbf23d..907b18a600 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -153,16 +153,16 @@ with arguments:
 .. code::
 
   # test with qcow2 format
-  ./check -qcow2
+  ./check --qcow2
   # or test a different protocol
-  ./check -nbd
+  ./check --nbd
 
 It's also possible to list test numbers explicitly:
 
 .. code::
 
   # run selected cases with qcow2 format
-  ./check -qcow2 001 030 153
+  ./check --qcow2 001 030 153
 
 Cache mode can be selected with the "-c" option, which may help reveal bugs
 that are specific to certain cache mode.
@@ -229,7 +229,7 @@ Debugging a test case
 The following options to the ``check`` script can be useful when debugging
 a failing test:
 
-* ``-gdb`` wraps every QEMU invocation in a ``gdbserver``, which waits for a
+* ``--gdb`` wraps every QEMU invocation in a ``gdbserver``, which waits for a
   connection from a gdb client.  The options given to ``gdbserver`` (e.g. the
   address on which to listen for connections) are taken from the ``$GDB_OPTIONS``
   environment variable.  By default (if ``$GDB_OPTIONS`` is empty), it listens on
@@ -237,10 +237,10 @@ a failing test:
   It is possible to connect to it for example with
   ``gdb -iex "target remote $addr"``, where ``$addr`` is the address
   ``gdbserver`` listens on.
-  If the ``-gdb`` option is not used, ``$GDB_OPTIONS`` is ignored,
+  If the ``--gdb`` option is not used, ``$GDB_OPTIONS`` is ignored,
   regardless of whether it is set or not.
 
-* ``-valgrind`` attaches a valgrind instance to QEMU. If it detects
+* ``--valgrind`` attaches a valgrind instance to QEMU. If it detects
   warnings, it will print and save the log in
   ``$TEST_DIR/<valgrind_pid>.valgrind``.
   The final command line will be ``valgrind --log-file=$TEST_DIR/
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index e74998efb9..139c27554d 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -303,10 +303,10 @@ build-tcg-disabled:
     - make check-unit
     - make check-qapi-schema
     - cd tests/qemu-iotests/
-    - ./check -raw 001 002 003 004 005 008 009 010 011 012 021 025 032 033 048
+    - ./check --raw 001 002 003 004 005 008 009 010 011 012 021 025 032 033 048
             052 063 077 086 101 104 106 113 148 150 151 152 157 159 160 163
             170 171 183 184 192 194 208 221 226 227 236 253 277 image-fleecing
-    - ./check -qcow2 028 051 056 057 058 065 068 082 085 091 095 096 102 122
+    - ./check --qcow2 028 051 056 057 058 065 068 082 085 091 095 096 102 122
             124 132 139 142 144 145 151 152 155 157 165 194 196 200 202
             208 209 216 218 227 234 246 247 248 250 254 255 257 258
             260 261 262 263 264 270 272 273 277 279 image-fleecing
diff --git a/tests/check-block.sh b/tests/check-block.sh
index f86cb863de..cff1263c0b 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -77,7 +77,7 @@ export PYTHONUTF8=1
 
 ret=0
 for fmt in $format_list ; do
-    ${PYTHON} ./check -makecheck -$fmt $group || ret=1
+    ${PYTHON} ./check --makecheck --$fmt $group || ret=1
 done
 
 exit $ret
diff --git a/tests/qemu-iotests/README b/tests/qemu-iotests/README
index 6079b401ae..8e1f3e19c3 100644
--- a/tests/qemu-iotests/README
+++ b/tests/qemu-iotests/README
@@ -10,9 +10,10 @@ but no actual block drivers like ide, scsi or virtio.
 
 * Usage
 
-Just run ./check to run all tests for the raw image format, or ./check
--qcow2 to test the qcow2 image format.  The output of ./check -h explains
-additional options to test further image formats or I/O methods.
+Just run ./check to run all tests for the raw image format,
+or ./check --qcow2 to test the qcow2 image format.  The output of
+./check -h explains additional options to test further image formats
+or I/O methods.
 
 * Feedback and patches
 
diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index da1bfb839e..5ca9f31950 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -32,20 +32,20 @@ def make_argparser() -> argparse.ArgumentParser:
 
     p.add_argument('-n', '--dry-run', action='store_true',
                    help='show me, do not run tests')
-    p.add_argument('-makecheck', action='store_true',
+    p.add_argument('--makecheck', action='store_true',
                    help='pretty print output for make check')
 
     p.add_argument('-d', dest='debug', action='store_true', help='debug')
     p.add_argument('-p', dest='print', action='store_true',
                 help='redirects qemu\'s stdout and stderr to the test output')
-    p.add_argument('-gdb', action='store_true',
+    p.add_argument('--gdb', action='store_true',
                    help="start gdbserver with $GDB_OPTIONS options \
                         ('localhost:12345' if $GDB_OPTIONS is empty)")
-    p.add_argument('-valgrind', action='store_true',
+    p.add_argument('--valgrind', action='store_true',
                     help='use valgrind, sets VALGRIND_QEMU environment '
                     'variable')
 
-    p.add_argument('-misalign', action='store_true',
+    p.add_argument('--misalign', action='store_true',
                    help='misalign memory allocations')
     p.add_argument('--color', choices=['on', 'off', 'auto'],
                    default='auto', help="use terminal colors. The default "
@@ -55,7 +55,7 @@ def make_argparser() -> argparse.ArgumentParser:
     mg = g_env.add_mutually_exclusive_group()
     # We don't set default for cachemode, as we need to distinguish default
     # from user input later.
-    mg.add_argument('-nocache', dest='cachemode', action='store_const',
+    mg.add_argument('--nocache', dest='cachemode', action='store_const',
                     const='none', help='set cache mode "none" (O_DIRECT), '
                     'sets CACHEMODE environment variable')
     mg.add_argument('-c', dest='cachemode',
@@ -74,7 +74,7 @@ def make_argparser() -> argparse.ArgumentParser:
         'At most one choice is allowed, default is "raw"')
     mg = g_fmt.add_mutually_exclusive_group()
     for fmt in format_list:
-        mg.add_argument('-' + fmt, dest='imgfmt', action='store_const',
+        mg.add_argument('--' + fmt, dest='imgfmt', action='store_const',
                         const=fmt, help=f'test {fmt}')
 
     protocol_list = ['file', 'rbd', 'nbd', 'ssh', 'nfs', 'fuse']
@@ -84,7 +84,7 @@ def make_argparser() -> argparse.ArgumentParser:
         'At most one choice is allowed, default is "file"')
     mg = g_prt.add_mutually_exclusive_group()
     for prt in protocol_list:
-        mg.add_argument('-' + prt, dest='imgproto', action='store_const',
+        mg.add_argument('--' + prt, dest='imgproto', action='store_const',
                         const=prt, help=f'test {prt}')
 
     g_bash = p.add_argument_group('bash tests options',
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index d8582454de..0817756814 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -124,7 +124,7 @@ fi
 
 # Set the variables to the empty string to turn Valgrind off
 # for specific processes, e.g.
-# $ VALGRIND_QEMU_IO= ./check -qcow2 -valgrind 015
+# $ VALGRIND_QEMU_IO= ./check --qcow2 --valgrind 015
 
 : ${VALGRIND_QEMU_VM=$VALGRIND_QEMU}
 : ${VALGRIND_QEMU_IMG=$VALGRIND_QEMU}
@@ -134,7 +134,7 @@ fi
 
 # The Valgrind own parameters may be set with
 # its environment variable VALGRIND_OPTS, e.g.
-# $ VALGRIND_OPTS="--leak-check=yes" ./check -qcow2 -valgrind 015
+# $ VALGRIND_OPTS="--leak-check=yes" ./check --qcow2 --valgrind 015
 
 _qemu_proc_exec()
 {
-- 
2.29.2


