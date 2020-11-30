Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA512C85CD
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:45:48 +0100 (CET)
Received: from localhost ([::1]:60966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjjUw-0002LF-Nv
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:45:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kjjQ8-0006sM-N4; Mon, 30 Nov 2020 08:40:49 -0500
Received: from mail-eopbgr60102.outbound.protection.outlook.com
 ([40.107.6.102]:37262 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kjjQ5-0000RG-Ua; Mon, 30 Nov 2020 08:40:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRrFXANd1hlWjgdBmQUiSGXZbmA+G8NiBeVqdHhm0qiwDg7WPdraR0F2xVrdCkK12ttYLlFdnYETkXREY/O41qv2FBVV30oCPcUxiqK9m5lDuz/ozq6YeVvuquZ2dM61QQDHVN3skaMB+KBWPBOF3wzggO2p+o+1VvnGZUgeUXUqUXlWoRYnfzVXTB6Al603XS46ON28O23Yka3c2oZyw6iH9/BLg+L/prLld3bUWrMvFyyCdaEnrGXAA6qPNPZvAUH4X0Buf+JjR0TuMo29Kiyk3+R8prevaB92QIwqAEt8LsHd/H6nOO/Ogo5IzouEHt/PrhrsdEyt7+CXxbeiJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukJYvo2dvyrX4xAEDQwpaCL4ydwy+Mw3E6JJjE1GQvw=;
 b=Co4vt/nHUrbs+/VaeQs6Ofxa+lWWJS8j3IZMe+RzPJ/OJvCfItM6HHDB3MIPsd/ZuR6uccYXxRhreexu0B7uR7bcR0Aj1+We/wtfayIxBt1ej0ZFCib2V0UeEbK3XFc/yqdEDORNttEcwwvYqAvhcz0VMc0JGjddpvHybfmBMVn100P5q6mQKuerL8iTHe0DW9GFMZS5u2g0kUKY7/FqVCYrtmmJD3MvmsbaZJQb8nv6iY6VMi8rCn5XuYO6oarP/URuKoTgCc1yYFM9Ve6VWLzlhunw2W/Lper2gbYA6OsjG0NIJ1E65c8yYmp66kqdDcsxeS178S2j6uljXxNqYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukJYvo2dvyrX4xAEDQwpaCL4ydwy+Mw3E6JJjE1GQvw=;
 b=gmcNxlQNX+nNFR8zZlCZI6yLkkK7WQcduWpvkmEZoSAHuoUWFCIEMXlVjBvSgimOhdCHxg7RlrwJ3B8bJQnTsevaS7D8vYmMM8MCmWzfb64EX00n3zQzE0SvYPb82Vclet6BtYjcJLoa9NdsWoDTdhi0rHdoJhPG+okRMdwB+cY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3447.eurprd08.prod.outlook.com (2603:10a6:20b:44::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Mon, 30 Nov
 2020 13:40:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 13:40:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v2 4/8] iotests.py: qemu_io(): reuse
 qemu_tool_pipe_and_status()
Date: Mon, 30 Nov 2020 16:40:20 +0300
Message-Id: <20201130134024.19212-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201130134024.19212-1-vsementsov@virtuozzo.com>
References: <20201130134024.19212-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR04CA0007.eurprd04.prod.outlook.com
 (2603:10a6:208:122::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM0PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:208:122::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23 via Frontend
 Transport; Mon, 30 Nov 2020 13:40:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 798735bc-e13c-42e1-7dc8-08d895358803
X-MS-TrafficTypeDiagnostic: AM6PR08MB3447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3447EAAFE558A71D09FE4E1BC1F50@AM6PR08MB3447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:597;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: faLUvUEqinJAlIi3/9BYFc1G8EzhspBY1e+o2VZwF7hI/rFbee+aD3BnpSG0D3Lcf9gf+dkhNzJsXGYJggV5kKUAAz+Cg/4hdoFR8BX6PGuAq4IzNJvbxfbpZyZJ7SwOIGlNiqN6C6UpltOWeu6XBSN4eDulcJJSw7U+04RfhCUSc5peaUvpJoHkk1ejE1vdAm+sijBi098oFHKQGS5gCt/coHd+/1OPOZtx2ttDfNk7nKW+l9WGy6WGo50jv/rsDm/c0menzsLrEe2wKBVeaiC2MIdriy/9TENm/eh6B7aWVHleeweWzKDgpLXRjKiWOhgCT4eZCWvvDhk4iPcKdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(396003)(136003)(39840400004)(52116002)(4326008)(2906002)(1076003)(86362001)(4744005)(6486002)(26005)(107886003)(8936002)(316002)(66946007)(6916009)(66476007)(478600001)(2616005)(16526019)(66556008)(186003)(6506007)(5660300002)(956004)(36756003)(8676002)(6512007)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xrJv6hkdyZ8tgaxU9yBvwIQ/3y7nJY6qVKAGinXptFv1JLQUCIcYVCpTbUU7?=
 =?us-ascii?Q?vaXSEAMWVOBiPe8DKOCMU6OMJga5FVRV7YJLgpHHY/uPjMUL3gI5pX+pc3ed?=
 =?us-ascii?Q?0wslh2rSYZAsxa0U6CQOo9gmIQZn+exGMHfWcoC4AoG90cqXNsfOBEVGLt0+?=
 =?us-ascii?Q?82DDqZMnyAO2PKv+Srip2J5jGzo27MbecDY+joaVSZ/NRUu5UxmFEH6eTb/j?=
 =?us-ascii?Q?+G0go7zGszXearjJLKEJJTsF7U/QYrAIiZIfjXGW7WiFVMIB4KPwmrGEbGRf?=
 =?us-ascii?Q?HsYeSQEescCn3LeSPhzZSbQxtVg4arVnYKcp/Y98u+cC3ZA4SxhZwKu9KRA2?=
 =?us-ascii?Q?xbB3lI4M6f94qK3Edi3Wd6P8H7dswvtsa54jkzUVBXOn+pxgvxK+RELhV7Gv?=
 =?us-ascii?Q?WorhJ/Y1nfZYQYVfyO7zVbNgivCrrRCRdtcjyIr0Ffnwys7j0/FNKYch1yxj?=
 =?us-ascii?Q?OG5hq5WQm2nxuKMa/8f1cjcesz9GUKrb9CYZVb3uZR8SW/QVivdf3sNPYikD?=
 =?us-ascii?Q?06UsPpjccnejhd0RcD/3lJpPdAtv2IUoOnZlxVk/pxbMxQNgDq8Yj+VoFkb+?=
 =?us-ascii?Q?/Toks4cph01o+OQSY5/erjj6Lcrl3O+SlhqJq/XUeWpl1ItoHBA1zdP4Ifsq?=
 =?us-ascii?Q?wPl1sZfkF/o0WJL7FT0Bj6MAWGjF6qItZyRdDsXtBnhMsp5IKgYdxqoSByuB?=
 =?us-ascii?Q?ijA5N/sj2iprEivpyIcTegwRs4v66HpZnblEy+v9k7lDeWKCgmI9koZKlzie?=
 =?us-ascii?Q?VnMP4Yig64+78mXyw/xqVJe3J9aw6mpCdZSvjYD/Zx2Sedl2NP3+4rfB2mpr?=
 =?us-ascii?Q?5MVnkAp3aWyrWX7qUBLWErKXjG4/BLGQbd+KnBN+H/mHjb3h60NkD0MkLkO7?=
 =?us-ascii?Q?oRv+/jIeR8aUTrUlHYyIj7MzxJqmXz4DwH7mQycDJU7Q56vpY+T/muZaGI+a?=
 =?us-ascii?Q?Hlv6NEaeJSELnwi4ERb25lATWmUprjfXB+l1U0jhhTMBcXHlJtZV1JHcu0Q6?=
 =?us-ascii?Q?IMwo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 798735bc-e13c-42e1-7dc8-08d895358803
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 13:40:42.3418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hSPU7KgoIvFXzE5TkrR4DXWOdt6/uvPCl9RdReKdS0GU4Hry5B7j+YLykWPtRu8byPIZ9FOFA4aECAvQh1nEX7d8ohAEVVmDlMXHEw/Vx60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3447
Received-SPF: pass client-ip=40.107.6.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Just drop code duplication.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 5ebe25e063..6c9bcf9042 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -188,14 +188,7 @@ def img_info_log(filename, filter_path=None, imgopts=False, extra_args=()):
 def qemu_io(*args):
     '''Run qemu-io and return the stdout data'''
     args = qemu_io_args + list(args)
-    subp = subprocess.Popen(args, stdout=subprocess.PIPE,
-                            stderr=subprocess.STDOUT,
-                            universal_newlines=True)
-    output = subp.communicate()[0]
-    if subp.returncode < 0:
-        sys.stderr.write('qemu-io received signal %i: %s\n'
-                         % (-subp.returncode, ' '.join(args)))
-    return output
+    return qemu_tool_pipe_and_status('qemu-io', args)[0]
 
 def qemu_io_log(*args):
     result = qemu_io(*args)
-- 
2.21.3


