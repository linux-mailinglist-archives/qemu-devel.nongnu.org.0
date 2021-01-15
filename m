Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9872F7813
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 12:55:45 +0100 (CET)
Received: from localhost ([::1]:56752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Nhg-0001Mn-Ji
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 06:55:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0Ng4-0000bk-DQ; Fri, 15 Jan 2021 06:54:08 -0500
Received: from mail-eopbgr130123.outbound.protection.outlook.com
 ([40.107.13.123]:59230 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0Nfx-0006OH-9F; Fri, 15 Jan 2021 06:54:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAITi5MfedTtrJuhg0jBytpIKyb7sW1BSW34/dGrF/fhAf/QA9ILQayFh4ff/2AE9EATxsdkiFU87YLbb130xRSa+MSOqrEWGClN901urgTnzP4v8bnF6zrzb6U+lAF4r07p4PQUaN7VVpImDlqQJlMhYJdmuuOcaSd7VCM5tACyws5/p00UmezvjLyQl2C/vLeoipEpkMTBaq+lrVZ3C3CutPwQLPgyVXxuivLMOmQ+aSS+FWyKLR212H1FjLIgGJo0IVeceK+6Si+52hqkovpQATay807Sxr8VbNcRyQohn4kBxpffcK42IdZZwdrxjevBwWeggrXXsHcfaNyRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSA175Ue4X4Pyd+JjRo3xxI7MAscX1s3Mjvx8lMZygA=;
 b=FpciHTQb6P+tWrMAaOVDu/lmvhJ7VYtf2xGAqABuy4pZTwHIp9/dxcCk/gbtvcCrof20JzCDt7Nu5T4sp8MPvQZUlwbnbYtcHHBH4hyCdvEnUZu5u6/nfCtWTl6QAqmsm1abmqETEL8QUbPSZ6VbOZ8137k23qqOhzdex+9ZAjb42DcaRS3YlwV9NaB8anje7Y5N4/ewAyhiM0egflDiwoA7GuHzsAYfeaAGQoN4Gtz7sTs0rlnKQht6+xzuE5kE4NetZaGHjfFOBkj8dYXRefcj1FXcjq5gk0XznPt074wKQB/bo9asOtIwF5oQvwQOavitFAa5FvNvoOnxqG3eZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSA175Ue4X4Pyd+JjRo3xxI7MAscX1s3Mjvx8lMZygA=;
 b=qKAyKWJDpNIw3Iyosmipn8atYBEYu9zKm5vdsHT+f+D2bL5kPGG7WiAizu8bjpdTlTohlEiVUTfrL4ZxzDh46iZ7F9IJkujDzeouQJtqhdWBTXYbj0w0gbxStMwT2Q6MHvc2TalMmWfrZZIprKg+cd4Yeu+dKrW8Ce8O8tva+hQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4070.eurprd08.prod.outlook.com (2603:10a6:20b:a3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 11:53:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 11:53:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 11/10] iotests: add flake8 linter
Date: Fri, 15 Jan 2021 14:53:16 +0300
Message-Id: <20210115115316.24633-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114170304.87507-1-mreitz@redhat.com>
References: <20210114170304.87507-1-mreitz@redhat.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.75]
X-ClientProxiedBy: AM4PR07CA0026.eurprd07.prod.outlook.com
 (2603:10a6:205:1::39) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.75) by
 AM4PR07CA0026.eurprd07.prod.outlook.com (2603:10a6:205:1::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.6 via Frontend Transport; Fri, 15 Jan 2021 11:53:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f04a844-bdae-4801-2d32-08d8b94c38e7
X-MS-TrafficTypeDiagnostic: AM6PR08MB4070:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4070F5D8EBEDC539BC79E079C1A70@AM6PR08MB4070.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zXiNa0gSNXIebVgHNS8umdHAPhX3UGhnSj/xi3PUFzEdGZ6RfFJJr9+PopySZepWFslZY+WfBCXRsx7JkBQWVHWtCpxAvzfnSiMrAabbGcEMLhKbBIt2ob8h6OqE4KMrjELp6+6xuVjxdx9JKn5j3+S95tolCGdMbk4eQAg39v23vZQkON4A8qyZ+e7sB8mCWartCDP7N6J5sQG7+eYQ59FjgzlwKGDIUv3OpCsB20nd3GUtIdbJDbKQPffX7jHSpgkekXF75oX6Uu9Cf0lIMOzblSTC0ePEUir8fz+4Peskalp3C6f/Bf4KPVI0+E4qdcHbQnpcgESedlKF507YuvFVcOPVj5OPG9CZ0piussk26R9VAiSZvmM5naS6d7RMGnwz0gi05ImygIYLjs7QkWLcaK5RoQPNvvPtBxF+8MTune9TByfMS5PPzycbZcAJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(39840400004)(396003)(956004)(1076003)(6666004)(26005)(16526019)(186003)(6486002)(86362001)(6916009)(6506007)(83380400001)(52116002)(36756003)(8936002)(5660300002)(478600001)(66556008)(107886003)(30864003)(66476007)(4326008)(316002)(2616005)(2906002)(8676002)(66946007)(6512007)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HuZDfds1eERwQOELKChHqQSSDLMvfwwF76PSXA60sV3xAamcrFfTZ4Qa9Z1e?=
 =?us-ascii?Q?PoqZydXqMrq46/1p17FvqL5Y6XtVrSm4EWX+HHoV8R4cSkA1+P2SA07Rd/lM?=
 =?us-ascii?Q?vfGEIUHayuExgx0pMieQnZIXC9PAkIlT3sa54ba4n0ELx4xBeOkYCb1Cy56o?=
 =?us-ascii?Q?2LNbcPkkNtv2djXy1jHcGd2oUaBhO57tLDr7M5svzwKnUUwSsqUkCahMSv6Y?=
 =?us-ascii?Q?0UVKyc6AVIL3R2iOMfBiGqPp5aeZ3uJsuu8V1yLryVLjnCvB+Y4mjQ79FTbr?=
 =?us-ascii?Q?rBMa1f8Rp4mrBDI7raAvINOFL2YolIT/cEiItDWH/6W1+BHBXxvwVyCDLkk4?=
 =?us-ascii?Q?Gd2Xl6rv0PtkOhjnZygq4CfWGyCapKkipKJWOFcYjJBtPA6l5jh4kBC8J/Rf?=
 =?us-ascii?Q?ylpp33ouhwMGDvrs1JGqbZ/3E46rEPDN0o8KP++jsT1bX8x+9ZiB5B7C+ixb?=
 =?us-ascii?Q?qY36zI4G6WypAV7jZ+FHr6q+s7LpLML4Vuz2Ya0PmUOcBautdHR+HBKYnMLf?=
 =?us-ascii?Q?vTP14vWigIwv96on+acX4cDraY+r04mgPnu1m4XFT3EaY0gL4dccWNHSNwQh?=
 =?us-ascii?Q?XWHdQZ7qV8h0XnOBtONwdGTDnhQrN4quGQveGffwkH86JP+JkxqRfd/MtKUc?=
 =?us-ascii?Q?mM+7vQW6NV8Gd/sSb458AE+K5kKGXPEGn7dlwpDlYX/nQYBCKAlSvqBTigvZ?=
 =?us-ascii?Q?d9RJcXNIE6gQ/jaGKK7GsKhiT/yzYmg8CE2njUBHbUBOq7oRGdffPQVtdz1v?=
 =?us-ascii?Q?VDxePS4w9Iria02EmZefJa1st+hFoMJuV2EXBp0i6px1bs9018c/EJJo/vNM?=
 =?us-ascii?Q?BgP11z1I0vqreP1zlvmOn7VvnoFMlV/BjbRl34NmOlDfBOq0SgLVf7oU+1ua?=
 =?us-ascii?Q?7knGPzjwjdWkMd9b9TTWDuAZU6rcaiOgbhEsO8kZrbwQUzEzDD7c8aepCYo/?=
 =?us-ascii?Q?PKLEmL6U03u8jkv4lJfJxLRqmpy4960FHv8YrbDLl011dB8U1C2onQEC9Tdn?=
 =?us-ascii?Q?ePrB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f04a844-bdae-4801-2d32-08d8b94c38e7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 11:53:49.8970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6igB29rHGsYygwIC6benv0I6cBSE9Ik8hVMtTHlYfRUISp5OylyGatAKL9eIh0Ah6HoBUfa6lFID29PvArFlwOhgnSH4nDLrOGzM/fvzavM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4070
Received-SPF: pass client-ip=40.107.13.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pylint is good, but doesn't cover the PEP8. Let's add flake8, to be
sure that our code sutisfy PEP8. Add new linter and fix some code style
in checked files.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Hi!

Here is my small addition to Max's series, hope you like it!

Note, that this is not the first occurrence of 'flake8' in Qemu:

    # git grep flake8
    python/qemu/.flake8:[flake8]
    scripts/qapi/.flake8:[flake8]
    scripts/qapi/.flake8:extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's


 tests/qemu-iotests/129        |  6 ++-
 tests/qemu-iotests/254        |  2 +-
 tests/qemu-iotests/297        | 21 ++++++---
 tests/qemu-iotests/297.out    |  1 +
 tests/qemu-iotests/300        |  4 +-
 tests/qemu-iotests/iotests.py | 88 +++++++++++++++++++++++++++++++++--
 6 files changed, 106 insertions(+), 16 deletions(-)

diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index 201d9e0a0b..28e6666c1d 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -21,6 +21,7 @@
 import os
 import iotests
 
+
 class TestStopWithBlockJob(iotests.QMPTestCase):
     test_img = os.path.join(iotests.test_dir, 'test.img')
     target_img = os.path.join(iotests.test_dir, 'target.img')
@@ -39,8 +40,8 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
         source_drive = 'driver=throttle,' \
                        'node-name=source,' \
                        'throttle-group=tg0,' \
-                      f'file.driver={iotests.imgfmt},' \
-                      f'file.file.filename={self.test_img}'
+                       f'file.driver={iotests.imgfmt},' \
+                       f'file.file.filename={self.test_img}'
 
         self.vm.add_drive(None, source_drive)
         self.vm.launch()
@@ -97,6 +98,7 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
 
         self.do_test_stop('block-commit', device='drive0', top_node='source')
 
+
 if __name__ == '__main__':
     iotests.main(supported_fmts=["qcow2"],
                  supported_protocols=["file"])
diff --git a/tests/qemu-iotests/254 b/tests/qemu-iotests/254
index 150e58be8e..798f316e36 100755
--- a/tests/qemu-iotests/254
+++ b/tests/qemu-iotests/254
@@ -74,7 +74,7 @@ log("query-block: device = {}, node-name = {}, dirty-bitmaps:".format(
     result['device'], result['inserted']['node-name']))
 log(result['dirty-bitmaps'], indent=2)
 log("\nbitmaps in backing image:")
-log(result['inserted']['image']['backing-image']['format-specific'] \
+log(result['inserted']['image']['backing-image']['format-specific']
     ['data']['bitmaps'], indent=2)
 
 vm.shutdown()
diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 03d8604538..b79c341a3c 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -49,9 +49,10 @@ def is_python_file(filename):
         try:
             first_line = f.readline()
             return re.match('^#!.*python', first_line) is not None
-        except UnicodeDecodeError: # Ignore binary files
+        except UnicodeDecodeError:  # Ignore binary files
             return False
 
+
 def run_linters():
     files = [filename for filename in (set(os.listdir('.')) - set(SKIP_FILES))
              if is_python_file(filename)]
@@ -59,16 +60,22 @@ def run_linters():
     iotests.logger.debug('Files to be checked:')
     iotests.logger.debug(', '.join(sorted(files)))
 
-    print('=== pylint ===')
-    sys.stdout.flush()
-
-    # Todo notes are fine, but fixme's or xxx's should probably just be
-    # fixed (in tests, at least)
     env = os.environ
     try:
         env['PYTHONPATH'] += ':../../python/'
     except KeyError:
         env['PYTHONPATH'] = '../../python/'
+
+    print('=== flake8 ===')
+    sys.stdout.flush()
+
+    subprocess.run(('flake8', *files), env=env, check=False)
+
+    print('=== pylint ===')
+    sys.stdout.flush()
+
+    # Todo notes are fine, but fixme's or xxx's should probably just be
+    # fixed (in tests, at least)
     subprocess.run(('pylint-3', '--score=n', '--notes=FIXME,XXX', *files),
                    env=env, check=False)
 
@@ -102,7 +109,7 @@ def run_linters():
             print(p.stdout)
 
 
-for linter in ('pylint-3', 'mypy'):
+for linter in ('flake8', 'pylint-3', 'mypy'):
     if shutil.which(linter) is None:
         iotests.notrun(f'{linter} not found')
 
diff --git a/tests/qemu-iotests/297.out b/tests/qemu-iotests/297.out
index f2e1314d10..46bf3e665d 100644
--- a/tests/qemu-iotests/297.out
+++ b/tests/qemu-iotests/297.out
@@ -1,2 +1,3 @@
+=== flake8 ===
 === pylint ===
 === mypy ===
diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
index 64d388a8fa..bbd227ff73 100755
--- a/tests/qemu-iotests/300
+++ b/tests/qemu-iotests/300
@@ -116,7 +116,7 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
         self.vm_b.shutdown()
 
         log = self.vm_b.get_log()
-        assert log is not None # Loaded after shutdown
+        assert log is not None  # Loaded after shutdown
 
         if msg is None:
             self.assertNotIn('qemu-system-', log)
@@ -455,7 +455,7 @@ class TestBlockBitmapMappingErrors(TestDirtyBitmapMigration):
         self.vm_a.shutdown()
 
         log = self.vm_a.get_log()
-        assert log is not None # Loaded after shutdown
+        assert log is not None  # Loaded after shutdown
 
         self.assertIn(f"Cannot migrate bitmap '{name}' on node "
                       f"'{self.src_node_name}': Name is longer than 255 bytes",
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index a69b4cdc4e..e9cf8e6c28 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -37,8 +37,8 @@ from contextlib import contextmanager
 
 # pylint: disable=import-error, wrong-import-position
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu import qtest
-from qemu.qmp import QMPMessage
+from qemu import qtest  # noqa: E402
+from qemu.qmp import QMPMessage  # noqa: E402
 
 # Use this logger for logging messages directly from the iotests module
 logger = logging.getLogger('qemu.iotests')
@@ -114,6 +114,7 @@ def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
                             ' '.join(qemu_img_args + list(args))))
     return (output, subp.returncode)
 
+
 def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
     """
     Run qemu-img and return both its output and its exit code
@@ -121,10 +122,12 @@ def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
     full_args = qemu_img_args + list(args)
     return qemu_tool_pipe_and_status('qemu-img', full_args)
 
+
 def qemu_img(*args: str) -> int:
     '''Run qemu-img and return the exit code'''
     return qemu_img_pipe_and_status(*args)[1]
 
+
 def ordered_qmp(qmsg, conv_keys=True):
     # Dictionaries are not ordered prior to 3.6, therefore:
     if isinstance(qmsg, list):
@@ -138,6 +141,7 @@ def ordered_qmp(qmsg, conv_keys=True):
         return od
     return qmsg
 
+
 def qemu_img_create(*args):
     args = list(args)
 
@@ -157,12 +161,15 @@ def qemu_img_create(*args):
 
     return qemu_img(*args)
 
+
 def qemu_img_measure(*args):
     return json.loads(qemu_img_pipe("measure", "--output", "json", *args))
 
+
 def qemu_img_check(*args):
     return json.loads(qemu_img_pipe("check", "--output", "json", *args))
 
+
 def qemu_img_verbose(*args):
     '''Run qemu-img without suppressing its output and return the exit code'''
     exitcode = subprocess.call(qemu_img_args + list(args))
@@ -171,15 +178,18 @@ def qemu_img_verbose(*args):
                          % (-exitcode, ' '.join(qemu_img_args + list(args))))
     return exitcode
 
+
 def qemu_img_pipe(*args: str) -> str:
     '''Run qemu-img and return its output'''
     return qemu_img_pipe_and_status(*args)[0]
 
+
 def qemu_img_log(*args):
     result = qemu_img_pipe(*args)
     log(result, filters=[filter_testfiles])
     return result
 
+
 def img_info_log(filename, filter_path=None, imgopts=False, extra_args=()):
     args = ['info']
     if imgopts:
@@ -194,6 +204,7 @@ def img_info_log(filename, filter_path=None, imgopts=False, extra_args=()):
         filter_path = filename
     log(filter_img_info(output, filter_path))
 
+
 def qemu_io(*args):
     '''Run qemu-io and return the stdout data'''
     args = qemu_io_args + list(args)
@@ -206,11 +217,13 @@ def qemu_io(*args):
                          % (-subp.returncode, ' '.join(args)))
     return output
 
+
 def qemu_io_log(*args):
     result = qemu_io(*args)
     log(result, filters=[filter_testfiles, filter_qemu_io])
     return result
 
+
 def qemu_io_silent(*args):
     '''Run qemu-io and return the exit code, suppressing stdout'''
     if '-f' in args or '--image-opts' in args:
@@ -225,6 +238,7 @@ def qemu_io_silent(*args):
                          (-exitcode, ' '.join(args)))
     return exitcode
 
+
 def qemu_io_silent_check(*args):
     '''Run qemu-io and return the true if subprocess returned 0'''
     args = qemu_io_args + list(args)
@@ -232,11 +246,13 @@ def qemu_io_silent_check(*args):
                                stderr=subprocess.STDOUT)
     return exitcode == 0
 
+
 def get_virtio_scsi_device():
     if qemu_default_machine == 's390-ccw-virtio':
         return 'virtio-scsi-ccw'
     return 'virtio-scsi-pci'
 
+
 class QemuIoInteractive:
     def __init__(self, *args):
         self.args = qemu_io_args_no_fmt + list(args)
@@ -286,6 +302,7 @@ def qemu_nbd(*args):
     '''Run qemu-nbd in daemon mode and return the parent's exit code'''
     return subprocess.call(qemu_nbd_args + ['--fork'] + list(args))
 
+
 def qemu_nbd_early_pipe(*args: str) -> Tuple[int, str]:
     '''Run qemu-nbd in daemon mode and return both the parent's exit code
        and its output in case of an error'''
@@ -294,6 +311,7 @@ def qemu_nbd_early_pipe(*args: str) -> Tuple[int, str]:
                                                    connect_stderr=False)
     return returncode, output if returncode else ''
 
+
 def qemu_nbd_list_log(*args: str) -> str:
     '''Run qemu-nbd to list remote exports'''
     full_args = [qemu_nbd_prog, '-L'] + list(args)
@@ -301,6 +319,7 @@ def qemu_nbd_list_log(*args: str) -> str:
     log(output, filters=[filter_testfiles, filter_nbd_exports])
     return output
 
+
 @contextmanager
 def qemu_nbd_popen(*args):
     '''Context manager running qemu-nbd within the context'''
@@ -326,11 +345,13 @@ def qemu_nbd_popen(*args):
         p.kill()
         p.wait()
 
+
 def compare_images(img1, img2, fmt1=imgfmt, fmt2=imgfmt):
     '''Return True if two image files are identical'''
     return qemu_img('compare', '-f', fmt1,
                     '-F', fmt2, img1, img2) == 0
 
+
 def create_image(name, size):
     '''Create a fully-allocated raw image with sector markers'''
     file = open(name, 'wb')
@@ -341,34 +362,49 @@ def create_image(name, size):
         i = i + 512
     file.close()
 
+
 def image_size(img):
     '''Return image's virtual size'''
     r = qemu_img_pipe('info', '--output=json', '-f', imgfmt, img)
     return json.loads(r)['virtual-size']
 
+
 def is_str(val):
     return isinstance(val, str)
 
+
 test_dir_re = re.compile(r"%s" % test_dir)
+
+
 def filter_test_dir(msg):
     return test_dir_re.sub("TEST_DIR", msg)
 
+
 win32_re = re.compile(r"\r")
+
+
 def filter_win32(msg):
     return win32_re.sub("", msg)
 
+
 qemu_io_re = re.compile(r"[0-9]* ops; [0-9\/:. sec]* "
                         r"\([0-9\/.inf]* [EPTGMKiBbytes]*\/sec "
                         r"and [0-9\/.inf]* ops\/sec\)")
+
+
 def filter_qemu_io(msg):
     msg = filter_win32(msg)
     return qemu_io_re.sub("X ops; XX:XX:XX.X "
                           "(XXX YYY/sec and XXX ops/sec)", msg)
 
+
 chown_re = re.compile(r"chown [0-9]+:[0-9]+")
+
+
 def filter_chown(msg):
     return chown_re.sub("chown UID:GID", msg)
 
+
 def filter_qmp_event(event):
     '''Filter a QMP event dict'''
     event = dict(event)
@@ -377,6 +413,7 @@ def filter_qmp_event(event):
         event['timestamp']['microseconds'] = 'USECS'
     return event
 
+
 def filter_qmp(qmsg, filter_fn):
     '''Given a string filter, filter a QMP object's values.
     filter_fn takes a (key, value) pair.'''
@@ -393,11 +430,13 @@ def filter_qmp(qmsg, filter_fn):
             qmsg[k] = filter_fn(k, v)
     return qmsg
 
+
 def filter_testfiles(msg):
     pref1 = os.path.join(test_dir, "%s-" % (os.getpid()))
     pref2 = os.path.join(sock_dir, "%s-" % (os.getpid()))
     return msg.replace(pref1, 'TEST_DIR/PID-').replace(pref2, 'SOCK_DIR/PID-')
 
+
 def filter_qmp_testfiles(qmsg):
     def _filter(_key, value):
         if is_str(value):
@@ -405,9 +444,11 @@ def filter_qmp_testfiles(qmsg):
         return value
     return filter_qmp(qmsg, _filter)
 
+
 def filter_virtio_scsi(output: str) -> str:
     return re.sub(r'(virtio-scsi)-(ccw|pci)', r'\1', output)
 
+
 def filter_qmp_virtio_scsi(qmsg):
     def _filter(_key, value):
         if is_str(value):
@@ -415,9 +456,11 @@ def filter_qmp_virtio_scsi(qmsg):
         return value
     return filter_qmp(qmsg, _filter)
 
+
 def filter_generated_node_ids(msg):
     return re.sub("#block[0-9]+", "NODE_NAME", msg)
 
+
 def filter_img_info(output, filename):
     lines = []
     for line in output.split('\n'):
@@ -434,9 +477,11 @@ def filter_img_info(output, filename):
         lines.append(line)
     return '\n'.join(lines)
 
+
 def filter_imgfmt(msg):
     return msg.replace(imgfmt, 'IMGFMT')
 
+
 def filter_qmp_imgfmt(qmsg):
     def _filter(_key, value):
         if is_str(value):
@@ -444,12 +489,14 @@ def filter_qmp_imgfmt(qmsg):
         return value
     return filter_qmp(qmsg, _filter)
 
+
 def filter_nbd_exports(output: str) -> str:
     return re.sub(r'((min|opt|max) block): [0-9]+', r'\1: XXX', output)
 
 
 Msg = TypeVar('Msg', Dict[str, Any], List[Any], str)
 
+
 def log(msg: Msg,
         filters: Iterable[Callable[[Msg], Msg]] = (),
         indent: Optional[int] = None) -> None:
@@ -466,23 +513,29 @@ def log(msg: Msg,
     else:
         test_logger.info(msg)
 
+
 class Timeout:
     def __init__(self, seconds, errmsg="Timeout"):
         self.seconds = seconds
         self.errmsg = errmsg
+
     def __enter__(self):
         signal.signal(signal.SIGALRM, self.timeout)
         signal.setitimer(signal.ITIMER_REAL, self.seconds)
         return self
+
     def __exit__(self, exc_type, value, traceback):
         signal.setitimer(signal.ITIMER_REAL, 0)
         return False
+
     def timeout(self, signum, frame):
         raise Exception(self.errmsg)
 
+
 def file_pattern(name):
     return "{0}-{1}".format(os.getpid(), name)
 
+
 class FilePath:
     """
     Context manager generating multiple file names. The generated files are
@@ -529,6 +582,7 @@ def try_remove(img):
     except OSError:
         pass
 
+
 def file_path_remover():
     for path in reversed(file_path_remover.paths):
         try_remove(path)
@@ -556,6 +610,7 @@ def file_path(*names, base_dir=test_dir):
 
     return paths[0] if len(paths) == 1 else paths
 
+
 def remote_filename(path):
     if imgproto == 'file':
         return path
@@ -564,6 +619,7 @@ def remote_filename(path):
     else:
         raise Exception("Protocol %s not supported" % (imgproto))
 
+
 class VM(qtest.QEMUQtestMachine):
     '''A QEMU VM'''
 
@@ -664,7 +720,7 @@ class VM(qtest.QEMUQtestMachine):
             for key in obj:
                 self.flatten_qmp_object(obj[key], output, basestr + key + '.')
         else:
-            output[basestr[:-1]] = obj # Strip trailing '.'
+            output[basestr[:-1]] = obj  # Strip trailing '.'
         return output
 
     def qmp_to_opts(self, obj):
@@ -884,8 +940,10 @@ class VM(qtest.QEMUQtestMachine):
                    'Found node %s under %s (but expected %s)' % \
                    (node['name'], path, expected_node)
 
+
 index_re = re.compile(r'([^\[]+)\[([^\]]+)\]')
 
+
 class QMPTestCase(unittest.TestCase):
     '''Abstract base class for QMP test cases'''
 
@@ -992,7 +1050,6 @@ class QMPTestCase(unittest.TestCase):
                 elif event['event'] == 'JOB_STATUS_CHANGE':
                     self.assert_qmp(event, 'data/id', drive)
 
-
         self.assert_no_active_block_jobs()
         return result
 
@@ -1078,6 +1135,7 @@ def notrun(reason):
     logger.warning("%s not run: %s", seq, reason)
     sys.exit(0)
 
+
 def case_notrun(reason):
     '''Mark this test case as not having been run (without actually
     skipping it, that is left to the caller).  See
@@ -1090,6 +1148,7 @@ def case_notrun(reason):
     open('%s/%s.casenotrun' % (output_dir, seq), 'a').write(
         '    [case not run] ' + reason + '\n')
 
+
 def _verify_image_format(supported_fmts: Sequence[str] = (),
                          unsupported_fmts: Sequence[str] = ()) -> None:
     if 'generic' in supported_fmts and \
@@ -1106,6 +1165,7 @@ def _verify_image_format(supported_fmts: Sequence[str] = (),
     if imgfmt == 'luks':
         verify_working_luks()
 
+
 def _verify_protocol(supported: Sequence[str] = (),
                      unsupported: Sequence[str] = ()) -> None:
     assert not (supported and unsupported)
@@ -1117,6 +1177,7 @@ def _verify_protocol(supported: Sequence[str] = (),
     if not_sup or (imgproto in unsupported):
         notrun('not suitable for this protocol: %s' % imgproto)
 
+
 def _verify_platform(supported: Sequence[str] = (),
                      unsupported: Sequence[str] = ()) -> None:
     if any((sys.platform.startswith(x) for x in unsupported)):
@@ -1126,27 +1187,33 @@ def _verify_platform(supported: Sequence[str] = (),
         if not any((sys.platform.startswith(x) for x in supported)):
             notrun('not suitable for this OS: %s' % sys.platform)
 
+
 def _verify_cache_mode(supported_cache_modes: Sequence[str] = ()) -> None:
     if supported_cache_modes and (cachemode not in supported_cache_modes):
         notrun('not suitable for this cache mode: %s' % cachemode)
 
+
 def _verify_aio_mode(supported_aio_modes: Sequence[str] = ()) -> None:
     if supported_aio_modes and (aiomode not in supported_aio_modes):
         notrun('not suitable for this aio mode: %s' % aiomode)
 
+
 def _verify_formats(required_formats: Sequence[str] = ()) -> None:
     usf_list = list(set(required_formats) - set(supported_formats()))
     if usf_list:
         notrun(f'formats {usf_list} are not whitelisted')
 
+
 def supports_quorum():
     return 'quorum' in qemu_img_pipe('--help')
 
+
 def verify_quorum():
     '''Skip test suite if quorum support is not available'''
     if not supports_quorum():
         notrun('quorum support missing')
 
+
 def has_working_luks() -> Tuple[bool, str]:
     """
     Check whether our LUKS driver can actually create images
@@ -1178,6 +1245,7 @@ def has_working_luks() -> Tuple[bool, str]:
     else:
         return (True, '')
 
+
 def verify_working_luks():
     """
     Skip test suite if LUKS does not work
@@ -1186,6 +1254,7 @@ def verify_working_luks():
     if not working:
         notrun(reason)
 
+
 def qemu_pipe(*args: str) -> str:
     """
     Run qemu with an option to print something and exit (e.g. a help option).
@@ -1196,6 +1265,7 @@ def qemu_pipe(*args: str) -> str:
     output, _ = qemu_tool_pipe_and_status('qemu', full_args)
     return output
 
+
 def supported_formats(read_only=False):
     '''Set 'read_only' to True to check ro-whitelist
        Otherwise, rw-whitelist is checked'''
@@ -1211,6 +1281,7 @@ def supported_formats(read_only=False):
 
     return supported_formats.formats[read_only]
 
+
 def skip_if_unsupported(required_formats=(), read_only=False):
     '''Skip Test Decorator
        Runs the test if all the required formats are whitelisted'''
@@ -1231,6 +1302,7 @@ def skip_if_unsupported(required_formats=(), read_only=False):
         return func_wrapper
     return skip_test_decorator
 
+
 def skip_for_formats(formats: Sequence[str] = ()) \
     -> Callable[[Callable[[QMPTestCase, List[Any], Dict[str, Any]], None]],
                 Callable[[QMPTestCase, List[Any], Dict[str, Any]], None]]:
@@ -1247,6 +1319,7 @@ def skip_for_formats(formats: Sequence[str] = ()) \
         return func_wrapper
     return skip_test_decorator
 
+
 def skip_if_user_is_root(func):
     '''Skip Test Decorator
        Runs the test only without root permissions'''
@@ -1258,6 +1331,7 @@ def skip_if_user_is_root(func):
             return func(*args, **kwargs)
     return func_wrapper
 
+
 def execute_unittest(debug=False):
     """Executes unittests within the calling module."""
 
@@ -1290,6 +1364,7 @@ def execute_unittest(debug=False):
 
             sys.stderr.write(out)
 
+
 def execute_setup_common(supported_fmts: Sequence[str] = (),
                          supported_platforms: Sequence[str] = (),
                          supported_cache_modes: Sequence[str] = (),
@@ -1319,6 +1394,7 @@ def execute_setup_common(supported_fmts: Sequence[str] = (),
 
     return debug
 
+
 def execute_test(*args, test_function=None, **kwargs):
     """Run either unittest or script-style tests."""
 
@@ -1328,6 +1404,7 @@ def execute_test(*args, test_function=None, **kwargs):
     else:
         test_function()
 
+
 def activate_logging():
     """Activate iotests.log() output to stdout for script-style tests."""
     handler = logging.StreamHandler(stream=sys.stdout)
@@ -1337,18 +1414,21 @@ def activate_logging():
     test_logger.setLevel(logging.INFO)
     test_logger.propagate = False
 
+
 # This is called from script-style iotests without a single point of entry
 def script_initialize(*args, **kwargs):
     """Initialize script-style tests without running any tests."""
     activate_logging()
     execute_setup_common(*args, **kwargs)
 
+
 # This is called from script-style iotests with a single point of entry
 def script_main(test_function, *args, **kwargs):
     """Run script-style tests outside of the unittest framework"""
     activate_logging()
     execute_test(*args, test_function=test_function, **kwargs)
 
+
 # This is called from unittest style iotests
 def main(*args, **kwargs):
     """Run tests using the unittest framework"""
-- 
2.29.2


