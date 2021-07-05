Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3130C3BBA0C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:18:41 +0200 (CEST)
Received: from localhost ([::1]:36270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0KkS-000566-7l
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0Ki9-0002D2-UX; Mon, 05 Jul 2021 05:16:17 -0400
Received: from mail-eopbgr40109.outbound.protection.outlook.com
 ([40.107.4.109]:55110 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0Ki6-0007tK-Rv; Mon, 05 Jul 2021 05:16:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnmP5nwMixE+RIw3epBJGfqjeFPQznDkR/UmQRZHm7/XUnMZ6YiBhGuN7rf0CZneqQe6lp9vj4RYP+/MC6qbGdheAcPpJAf0NbLcFAvPjj5djZGF2s0iqlB0FxpN2WLizGyCBBY5EmmsbPc5JawnRgmbXFxDNw5/gWHB4+pLJohbO9gN5RDSiE/pWb5N35qry11g83hElesmri0GZbCUAJmi7G+IAzhssM42EduFb1XO96RAb23Mh7LrR5mmQwAHqzTCnJtMdRQLngrEw9ifAdHJ9toBWkeTI3nCoaPAJWF6K6RGQ9JldYEMp8sIpoOsN0JTvTRCa837TiPrMtUhqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vn/Q9EUjF8tZNjcbgk13L1zAUyXud+6boZ3K7XoMlcA=;
 b=kOlD6F6W+VPGKliFQ3Wlxg3Kx5Rp6IXRx/4XRW3vMITgoYJVKfEOg1eC+djYb4alMyBQWHOYyF1OTXCr4CXpLhPky8l8cl2+IwkzfI/FfEZFz2C3dHhDV3fNCtU7W/FvJQM4wortvEws+k08mx5NxJusTd85o4jv8LOD8Puion73RZhRwP7NiXBSDB1a2A22bTkYLvMa51oHP2N+qnsk77IUwcHss3vRmfkCHDk+tMUnA9kFh48w6YNm3mHKiv5noZy56sbHx+G05rr8IKtHDQRhcirPjTPANmCCCuNpP3augGiBwJVvxK2iTcljx1MJVUvN0+0fgywErzy8Ohm0mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vn/Q9EUjF8tZNjcbgk13L1zAUyXud+6boZ3K7XoMlcA=;
 b=wJMLyg8riDgxo9DGSa3Il5PFZBO6ewOWaYD9OEAXDzAleItbFF9mRrWVXxKd3xzvgOOD3bdouYZqQa4pJo1MlvZK6l+QkeUL9zdODIy/wpo3CoY2bYxWV0TbrlSrPVj8H1qdmdlqv2ijE4WO3hnllw60x7IxIcoa6JN0GE8+SJk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1714.eurprd08.prod.outlook.com (2603:10a6:203:3a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 09:16:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 09:16:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Subject: [PATCH 02/14] iotests.py: qemu_img*("create"): support
 IMGOPTS='compression_type=zstd'
Date: Mon,  5 Jul 2021 12:15:37 +0300
Message-Id: <20210705091549.178335-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210705091549.178335-1-vsementsov@virtuozzo.com>
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR05CA0235.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR05CA0235.eurprd05.prod.outlook.com (2603:10a6:3:fb::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:16:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 921a0f60-6301-4a02-1d72-08d93f95850b
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1714:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB171442C8307DD4F8914B1E2BC11C9@AM5PR0801MB1714.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WIXJRnsKaoDl+RisrX9z7g7w0CQxQeNkQr5tkzFEnPIDVV3voFNTeggx6XrhgbMP0jCYB8M/SJvPsBjkVagQGiZ5OpJmqQKH5AnI8t8FElo7NR+aYtvUrrhfBO4TjOfWqf5if+dxKycxiKMXkQeTjoorKZxVFjrS5pQKiRi8i4I3S/q7RrMQdDclbnboaWUs2aEcWCu9lvTujz2y94yu8azcaDPZTV5UzaDkhVKAPso/Ern3JzwNLmOltbj71psVzuYaTbt9ppj4msAmR5Nx7SA3CiroGhooYh/bH9SkINFAKW3YUDH8fH+QZbO61x/3K9ehVPIX2hMcIxYP8CHbRaG7R2uUI5UopZyPT+qQoUl5+5kC24aS7ILj3WjvOvxE0eHqJ5dtNQwsJ8yZD29sQqaTQd3KM0tjPf/xQy4arHDEmpDDZ4bi34d5oJQPzF+xIh6AbgkrzoEuEKpUsuFUPIBVM93aJyX07ScGF9YZfT3Ser5/H5/RNUAsd88Ki80Ae+EtY/9xbFhUg5q48lTKFIIsnLGpjmpnnQw4b9Nu3iFIf9XyU0sIwc1IdQ8eY0ADhOILyDbksu1GRNCiE/4iD4adqERtHwbahNaOAfo0Fjsj3phbc2qswcBKNFmcgK3pa+LqQouxQF4i38nzQrZ9Lj2O9mDL1LxZfkPcAU8thWtv+USs0IHCJRd+VviZRUppziaIhCSi6xqaTF06lrSHPmw/x8p6VRcnbOdluObTvKIdRCS4JQUBIi7CnXVvvjxJa3OnLsnNxNJVb36V0Jz3g9OOYGTb9tcxwg/Gsq0IsXlPDlRB/IOIaFTs4a/39PZ1RwNCYDYzWKO0Wz7jvwQl1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39830400003)(366004)(346002)(376002)(16526019)(186003)(8676002)(5660300002)(8936002)(1076003)(36756003)(956004)(2616005)(83380400001)(38100700002)(316002)(6486002)(52116002)(478600001)(66476007)(6916009)(26005)(66946007)(38350700002)(66556008)(4326008)(2906002)(86362001)(6512007)(6666004)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zq/SgJcXEsQqy7dfyUbOm9iJJRXAgk/JJmO1DE1+PpcA+llEsSPPfMsTcXKK?=
 =?us-ascii?Q?MS9XYIDlNRKOf0J6q6mGofvz7N68w8qtd8CHmdEIVoCsL55Ckaw1XGU1tTjo?=
 =?us-ascii?Q?OO7ai9FCCzYN4r7KM4rv7/4/o5zF7Xkq8DwR65ADjtioknQfTTfDziThRAHY?=
 =?us-ascii?Q?44l8KWemsYT227Wo7/n7qKMRu2l84fxTUGOryN/ooQybwpg0owuVVVgJxW5G?=
 =?us-ascii?Q?veQb+Qe/PdHBxVw5xCXXIWRsPXSQB5XP23mf7jcv/7pftpBKUlayUE21nNNP?=
 =?us-ascii?Q?UJ7RXP0ASAw+yn3pKQ03XoWR4UBSw4gVCc2UnKYv84pek7lzQAvhphR5dV4z?=
 =?us-ascii?Q?Zkl31qKPEa+PoSImYFR5fp0Rntqhq5DvUaEmu1FsqhTdOtX3FNQBW19MU/E0?=
 =?us-ascii?Q?9IlqBkDvwzC58X5zAea9ekn60vKcfRQr7GochwxZ4CB4sswa6U1jjZjZmBv4?=
 =?us-ascii?Q?pqCSHHmXtaYiAZLOlgJCXtR7mLERk1sZOCMikjUcgHGNAVdzdc92KI9x1tHu?=
 =?us-ascii?Q?ECd9gQO5sxExS4iR5YU/pJJWO2VYalT3OkUjdUo5RV1Y2p063/0KSORSrdio?=
 =?us-ascii?Q?kJXrNFQpLb5hN5N1cZGfcIdD1UNKXBFN831sFU0mtmIURhATn5aPcoIHssTi?=
 =?us-ascii?Q?q5giGroPF+qf9jcGM0/CXGbHW+8HXaqXuW73txJYJX+XZzIZyrOq5itNIjaB?=
 =?us-ascii?Q?qOtuoI8Ya5Rqyn6QYCo4THv5HO3B+VCQ+2zlkH9ekNMZmdNfxgSEJZmy9gmZ?=
 =?us-ascii?Q?ZeAOMIgfui0ccpQ644rwkdgFPKd4yTtDJoGRzIjDHs8bKBtJVsb/ahdAN7js?=
 =?us-ascii?Q?QUz8bBHZ8x1NS3l4mpdTMdQ/aYqW+e/cnU79Gae1LUWD19I8UEvz1RVveeMx?=
 =?us-ascii?Q?P/FhFt8Up+2vYv97h1M0yg9BQmXQTFA+imzZmHvPd3g0eHvePIC7VxrUm2eb?=
 =?us-ascii?Q?NAoEelB/DpmDOL1rFQz+PBC1bL6HlnwJ9/FYMDHmEpAjwLHgW5lwrraIqx1v?=
 =?us-ascii?Q?5FdpkMXFJK0XnTk6/1M2fsrU8Zv+dMFlQYh+PP0qSXrl9VG6lQzytpHaBh+E?=
 =?us-ascii?Q?iPmgfH9NwRvlsJjqtLrmCHKr75z9zNaufkt+rxIIElZmIUBeWfB0U7WkHRAm?=
 =?us-ascii?Q?5mR7GoDIoSPsuOR04smNCwkBM+4Mz7SmGXi3nyXN3ak46m3nqx613X/vEj+F?=
 =?us-ascii?Q?6rOO5vYvRFvx9tvS8yE38tniU2EbuYW9i5MfPIc+aDbtLFitFVdvGh7FeJOY?=
 =?us-ascii?Q?0uAXS2QashA3Yg/zRSt/p4tWphLrPEj90LDYWlH+5EXNX+5J9I8WP2GhB962?=
 =?us-ascii?Q?EGXrWw3pF1oJzmpd94cX68ui?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 921a0f60-6301-4a02-1d72-08d93f95850b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:16:06.5765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: akjhPrQMVhlci++4a/giw3SHk8oc/07xQTPWROQEEVu/zc1GK8rYd+sS3aRvgrX9tZ0nKHIgKQu+qpei0VBSICMk8C0+jtr+V679YylIQp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1714
Received-SPF: pass client-ip=40.107.4.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

Adding support of IMGOPTS (like in bash tests) allows user to pass a
lot of different options. Still, some may require additional logic.

Now we want compression_type option, so add some smart logic around it:
ignore compression_type=zstd in IMGOPTS, if test want qcow2 in
compatibility mode. As well, ignore compression_type for non-qcow2
formats.

Note that we may instead add support only to qemu_img_create(), but
that works bad:

1. We'll have to update a lot of tests to use qemu_img_create instead
   of qemu_img('create'). (still, we may want do it anyway, but no
   reason to create a dependancy between task of supporting IMGOPTS and
   updating a lot of tests)

2. Some tests use qemu_img_pipe('create', ..) - even more work on
   updating

3. Even if we update all tests to go through qemu_img_create, we'll
   need a way to avoid creating new tests using qemu_img*('create') -
   add assertions.. That doesn't seem good.

So, let's add support of IMGOPTS to most generic
qemu_img_pipe_and_status().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 48 ++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 0d99dd841f..80f0cb4f42 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -16,6 +16,7 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
+import argparse
 import atexit
 import bz2
 from collections import OrderedDict
@@ -41,6 +42,19 @@
 from qemu.machine import qtest
 from qemu.qmp import QMPMessage
 
+
+def optstr2dict(opts: str) -> Dict[str, str]:
+    if not opts:
+        return {}
+
+    return {arr[0]: arr[1] for arr in
+            (opt.split('=', 1) for opt in opts.strip().split(','))}
+
+
+def dict2optstr(opts: Dict[str, str]) -> str:
+    return ','.join(f'{k}={v}' for k, v in opts.items())
+
+
 # Use this logger for logging messages directly from the iotests module
 logger = logging.getLogger('qemu.iotests')
 logger.addHandler(logging.NullHandler())
@@ -57,6 +71,8 @@
 if os.environ.get('QEMU_IMG_OPTIONS'):
     qemu_img_args += os.environ['QEMU_IMG_OPTIONS'].strip().split(' ')
 
+imgopts = optstr2dict(os.environ.get('IMGOPTS', ''))
+
 qemu_io_args = [os.environ.get('QEMU_IO_PROG', 'qemu-io')]
 if os.environ.get('QEMU_IO_OPTIONS'):
     qemu_io_args += os.environ['QEMU_IO_OPTIONS'].strip().split(' ')
@@ -121,11 +137,41 @@ def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
                                {-subp.returncode}: {cmd}\n')
         return (output, subp.returncode)
 
+def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
+    if not args or args[0] != 'create':
+        return list(args)
+    args = args[1:]
+
+    p = argparse.ArgumentParser(allow_abbrev=False)
+    # -o option may be specified several times
+    p.add_argument('-o', action='append', default=[])
+    p.add_argument('-f')
+    parsed, remaining = p.parse_known_args(args)
+
+    opts = optstr2dict(','.join(parsed.o))
+
+    compat = 'compat' in opts and opts['compat'][0] == '0'
+    for k, v in imgopts.items():
+        if k in opts:
+            continue
+        if k == 'compression_type' and (compat or parsed.f != 'qcow2'):
+            continue
+        opts[k] = v
+
+    result = ['create']
+    if parsed.f is not None:
+        result += ['-f', parsed.f]
+    if opts:
+        result += ['-o', dict2optstr(opts)]
+    result += remaining
+
+    return result
+
 def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
     """
     Run qemu-img and return both its output and its exit code
     """
-    full_args = qemu_img_args + list(args)
+    full_args = qemu_img_args + qemu_img_create_prepare_args(list(args))
     return qemu_tool_pipe_and_status('qemu-img', full_args)
 
 def qemu_img(*args: str) -> int:
-- 
2.29.2


