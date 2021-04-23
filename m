Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D326736929B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:01:21 +0200 (CEST)
Received: from localhost ([::1]:46088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvQu-0005Ap-Tf
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZvP3-00047q-Bn; Fri, 23 Apr 2021 08:59:25 -0400
Received: from mail-eopbgr80100.outbound.protection.outlook.com
 ([40.107.8.100]:25941 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZvP0-0007TK-Ax; Fri, 23 Apr 2021 08:59:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBCDdj32I7jdMGvg6BkazqVN4Wx6XgU32y/KvuQ7MYE7hstxJLBDomKgBZKvPbAldclj2jMHnYiZ1nSOwu4iF/+JeZyPYLuGXM9tc7KQPFT6zv3hx0u88NrkR4/yc62X0DjrKSkMkldvqTC0lzUsVvlGpHRD193Fs2VzRRb++urvWTGNdgjN3KKwyfFowFXo3Dv+o43G15wpPShkSrcOnMRdNNloJqprMoxF+zBf0/PWb+bhxTW/a9PYMFObA5kjA7bifA4+KwOzW8qzhW88iUt5ISM7MYjflbNesYclrWllNT4muCrvPgd+ky4KGXl9FPxbF82FVABysF6C08AC3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPGL6SuatA9MnkuslK/9gcH2pO5YcAttXe7Ki7RZamg=;
 b=ce5jskaQ4mzQ3LCT23FFOU8X9/CyWHeiLZGk3u/soresQT23M/xrb/72VV83KVYNH86o4rFAxUgRJt6Tt2oe+m5YTUBAsvji6YTG62ysElSTB4EEQudWIapKZQRpO7mOfr2TkVY7zXHXvCyC4qQGfbH4/F2JCAOFv4LChu/MP3Nuk5Cnxo5bugeyQRXl7enI3V+hMG74C2tAkPLCvCn3hZ4ZqHY0tK5a9idinIgwpUy6+LEhhsiSqC8+h0IOFHrnqxUcDTUK2S6Zyrsun28OWuTmZBmSUTzQM2rTVBksSiRkriuXoTlozB5fsiAh76t63x5B0JHY5h6KffaG6hl2Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPGL6SuatA9MnkuslK/9gcH2pO5YcAttXe7Ki7RZamg=;
 b=Wp6MDp+ib56Q8ranJ2Nauv0F6XO8seAI/n13TBQVZ7ClyiTEJI37gx3ks4GfysEjKYqY0dUPrd35qEksat8QnDExFFQHh5yLhqD1EPmL0KBRMC5Ab8C7wPE0zOCz8ZiO7cfz2J1YrS8E9rllqkEMMfzIOEZPDs1gRH/01OpszXY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4723.eurprd08.prod.outlook.com (2603:10a6:20b:c8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 12:59:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 12:59:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, mreitz@redhat.com,
 kwolf@redhat.com, pkrempa@redhat.com, nshirokovskiy@virtuozzo.com,
 den@openvz.org, libvir-list@redhat.com
Subject: [PATCH] qapi: deprecate drive-backup
Date: Fri, 23 Apr 2021 15:59:00 +0300
Message-Id: <20210423125900.3640-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1P190CA0006.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::16)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1P190CA0006.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 12:59:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4fbfa03-371b-4988-6c99-08d906579b3b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4723:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB472363607C695C6B4453ADC5C1459@AM6PR08MB4723.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qm7TA0o6oMmmjlBBlONmcyyIKT19UAZV2l9WkdKlwHitHIvoA+CMybRx9jh0cQOAZrlRXDyY4vqeH4AdDsX6/wecECsxHO/1gPY8uA2ruIAcAyeKWHu/Odch4gPQnR8IGNQoHt0FTFKqBoKKLbyBxNiF3XshAKUBVRtX3N+X1vwDHBnOQy+/YsUSi3pMKyrM2VzTrWq2pzmswAkHnDSgS4qz46uwenRpEJOewdiGcpeMdl4VmQR6k2HWlIxl4aQIDO8Y7a3nB1twNYbgk4Xf7eqIbZG3HpgxRfNbAQ88iWy752D2sTMTXBPR1LOXGRdKJaT/w2PfTFRIIEYi0DOPCWVrnyqAWdJL8wAcz/uM0xVAZwRVn2U0I18m+K9RPmqL/quTwAVSjaUOb4laOd3zIBz+Ai02nwA8pLgY9JhG7daYYQUy5Q1tIuIMp5qa1sgFM684silYqGmExryS2YT0jB2JWCxm2MpY3uScZnKALsO6+9348w7E1xVRYA13OS32fEmPDDWy/mJ0O4u4jcv1Dk66as2RXgESPTPlZQZxy7KkCjda5Www3m5vOkUCPgAGb8MHWYumRllM26o7rnW8fqYeHq5hg/LTZ/O3+rBylOAJ6VJERZjSE+elM/pVPrifUPPAkGK3zhE6jk9Ds4Pk98C9N0Cmt5xNZlWtKPhzeqEwETNvab3R5QpkF2UXjFmY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(39830400003)(396003)(38350700002)(186003)(6916009)(1076003)(52116002)(4326008)(6506007)(36756003)(8936002)(38100700002)(16526019)(83380400001)(6512007)(26005)(66946007)(8676002)(6486002)(66476007)(66556008)(86362001)(5660300002)(2616005)(956004)(6666004)(2906002)(316002)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FK4GL05oTFwp7I8hCXl0mmhk1o2gQ+XzvAuN0OiL0FzmUEIYVq54Ysk6b4q1?=
 =?us-ascii?Q?k2qSvETlL8sxpnpk+pZcwGQyYETmrwoDmv5nOMhfwLTZofLIAD8UOBSk6A1W?=
 =?us-ascii?Q?bIxqfr/1S+LKimwwdnD65BFTAcVh/+ApL2r/IbTVoVw/G0VXaotiLOsmf0YL?=
 =?us-ascii?Q?363rnZWJ3zSBmPRmulfI5ZbY8AUYJdEt9oU2lvbJNJzMflg5uvcP4L0uj6HZ?=
 =?us-ascii?Q?cjYE8Jf5hJPQHmUKJm+Y+hVoWgC8cy+wxCP+mq79ZH1nZ5xL9KOYWxlJPUZc?=
 =?us-ascii?Q?SmOzvvkpmZsrXLHYfJaznLThBhOSuakxsSrx8aJdiFfBMx1zovUUoVMRksrH?=
 =?us-ascii?Q?bQD12HY50lSxf3k9GbTMt0MrAVjXUumdXv0xObFep3G1TADLPpJjxkN0irCx?=
 =?us-ascii?Q?fl9OvG/EIEW53K5YXOTiUwAUWrLxLp48XDXie5RzIWF54nNf1LZ6CuH5O3aW?=
 =?us-ascii?Q?3VSJUzbNs+CTg8SZWwFKbkZnGyloiwOpWIPi/7IZNfbnaDqzy22ufwIboWYo?=
 =?us-ascii?Q?Rgtn2fUjYcO775QXiPNvyQIk0/eKcKRLT2bbZtgFvrjGKPN/CICYRHXR9sCS?=
 =?us-ascii?Q?6TgbcnfbzGriAAYxcu2oXh/QBbB4C0tVBX/H4msP/s6FMbXKASuA8e/4P8t0?=
 =?us-ascii?Q?hTUdKAiI/Ynp7Pe1PgGMSO2zKOZ9HwWwHeS/WEUj44ZKRa7u/IGu+T05blg0?=
 =?us-ascii?Q?cO+sRR+j8C6STQ3NIep1fksKIgQkzP08nFV497shjY8cTC7DHzQXFgh5yKv/?=
 =?us-ascii?Q?H4A6xxDGbJXqZmNnnLnANi2WVhdcAH4dzh/Wgy4+MdbX+fEw2yBZAOFASQbY?=
 =?us-ascii?Q?11fxh5s27GQ6f5xiY+TDDqo5huo360kjqSORoTJ2eWE0ftlJ+zmoD4MDfejY?=
 =?us-ascii?Q?rKjCsybxa464I59ccQwv9FpzYH4aVk8WIOVXWxCQouQqhEwU+sw/lj+ff7ec?=
 =?us-ascii?Q?5I+FXb5sIDRgKdHCHUOrMQyjuwykayycy+Q4219YOsUfVHuD579L2xXjU0jz?=
 =?us-ascii?Q?TR5TqIeDsMNcmBsIeXD9EADOxPMUbWbHO7ru927EC/0Ig6lHF/YMcpRphNfk?=
 =?us-ascii?Q?rnS8oi3iJb5BwXf4QnQqV5o+B8A8YZcAd6bdiLFxlIkopWfcao9UcxvNUk/p?=
 =?us-ascii?Q?5GFqjhMVZI2BKBparVCfUJEGgzy4XtV7Rhsae9XNUOIzCp0/LYblzdQ4UNtJ?=
 =?us-ascii?Q?OFCQK8MBON7hWQN5G2ziDhIsE6vJkou4IT0Qws59emRptjwqGV8RFxnK04U5?=
 =?us-ascii?Q?MmLTfmbsiU4NzkSkHB7yYLdTzldeLg2Vd7Q2PYkqwqWDZ7Jqa4E2lt0Im5OB?=
 =?us-ascii?Q?GZ0AEkFhmEHAljmC86asEXXR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fbfa03-371b-4988-6c99-08d906579b3b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 12:59:18.7901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9y/Kc/593pk1xAThY9zEIKb7X8sUrTcNRbA6fzE0m/FumJ2Q83qaHdC/iFWhBWzxGbimop+A5d5Qg+hbQUrQJhPrFQsHnt8l5vTciOr3Ts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4723
Received-SPF: pass client-ip=40.107.8.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Modern way is using blockdev-add + blockdev-backup, which provides a
lot more control on how target is opened.

As example of drive-backup problems consider the following:

User of drive-backup expects that target will be opened in the same
cache and aio mode as source. Corresponding logic is in
drive_backup_prepare(), where we take bs->open_flags of source.

It works rather bad if source was added by blockdev-add. Assume source
is qcow2 image. On blockdev-add we should specify aio and cache options
for file child of qcow2 node. What happens next:

drive_backup_prepare() looks at bs->open_flags of qcow2 source node.
But there no BDRV_O_NOCAHE neither BDRV_O_NATIVE_AIO: BDRV_O_NOCAHE is
places in bs->file->bs->open_flags, and BDRV_O_NATIVE_AIO is nowhere,
as file-posix parse options and simply set s->use_linux_aio.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Hi all! I remember, I suggested to deprecate drive-backup some time ago,
and nobody complain.. But that old patch was inside the series with
other more questionable deprecations and it did not landed.

Let's finally deprecate what should be deprecated long ago.

We now faced a problem in our downstream, described in commit message.
In downstream I've fixed it by simply enabling O_DIRECT and linux_aio
unconditionally for drive_backup target. But actually this just shows
that using drive-backup in blockdev era is a bad idea. So let's motivate
everyone (including Virtuozzo of course) to move to new interfaces and
avoid problems with all that outdated option inheritance.

 docs/system/deprecated.rst | 5 +++++
 qapi/block-core.json       | 5 ++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 80cae86252..b6f5766e17 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -186,6 +186,11 @@ Use the more generic commands ``block-export-add`` and ``block-export-del``
 instead.  As part of this deprecation, where ``nbd-server-add`` used a
 single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmaps``.
 
+``drive-backup`` (since 6.0)
+''''''''''''''''''''''''''''
+
+Use ``blockdev-backup`` in pair with ``blockdev-add`` instead.
+
 System accelerators
 -------------------
 
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 6d227924d0..8e2c6e1622 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1642,6 +1642,9 @@
 # The operation can be stopped before it has completed using the
 # block-job-cancel command.
 #
+# Features:
+# @deprecated: This command is deprecated. Use @blockdev-backup instead.
+#
 # Returns: - nothing on success
 #          - If @device is not a valid block device, GenericError
 #
@@ -1657,7 +1660,7 @@
 #
 ##
 { 'command': 'drive-backup', 'boxed': true,
-  'data': 'DriveBackup' }
+  'data': 'DriveBackup', 'features': ['deprecated'] }
 
 ##
 # @blockdev-backup:
-- 
2.29.2


