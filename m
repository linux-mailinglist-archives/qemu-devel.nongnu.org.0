Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D590D7015CD
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 11:33:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxlc1-000895-3k; Sat, 13 May 2023 05:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ttxinee@outlook.com>)
 id 1pxlby-00088K-OH
 for qemu-devel@nongnu.org; Sat, 13 May 2023 05:32:22 -0400
Received: from mail-he1eur01olkn2075.outbound.protection.outlook.com
 ([40.92.65.75] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ttxinee@outlook.com>)
 id 1pxlbx-0004Zs-3t
 for qemu-devel@nongnu.org; Sat, 13 May 2023 05:32:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/eMuY2rmgWma6REprUQj4cgKRvXsb94kCEJh9tEtTH9Z8tBbxNvyLUmjQMfq1BKNAycfkH4Z4YEZHTiNzziPg9gU8/Es2aY0Fm2Fv5OJTRu7MdSaKj8IvvqtgMLk14pAUxAoQIDzdivCfNw6KqxkHb7M4gwRYQICyJ9TPPi3uEHskSNgzB6l/iCn6Jl5+VNa4vs8/duxSoCbwGMXbmUcZg2ttVw6MjCyhFtqeZPelA6Q11DjwhqAJNIvqk4CtLliKH6zTXI7tQKHMeELLAtuIMAtDmXRr6Ev9/tizwriYFMLyNlLfdJ2a0eTxtTTpJjKzYlqf3J4D0XBB4JY0mlcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXoRtipdPHiLXFfu7vTgLQWoh3TcZnqZBxu/8mNjVYw=;
 b=GigsZ7EvtbdTPEGTexSUf4YMdaU4l9+sD7pWRngLuF6WPc1HhJo3y4JEsIZFMr8bH/jQ1Q9FEPvPUBLGqpcz2nnLXZnkmOz0sjn59YwEfzoLOoFOVhhC1jxMANnD1G34NHgMUmGjF9lbkJjP2n2hiZX1bVoDcqUEi4oxUYOuZpPaoKy3tyMksaoeO0YnpchA856zvMsIrz8nxVXh1aKtdAUEJ9iThW6TguUS5wilxdBmO+gVJrnNHHFM75bgzwH0zPd/BDzdmPyPY6OnfDD4xBff6KCRA+Uvz5v4QnraQ51/fJWJGqs9AiZUAzMpI/46aDmGCfSOALrfI168fSZ26g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXoRtipdPHiLXFfu7vTgLQWoh3TcZnqZBxu/8mNjVYw=;
 b=p4G6vXlOhKwQdm44km2RTwSiglkkeMSYllLc8C9FrlaHr77hHbTnqwtdk0wAsrwQdCjh8rxufaRYahs/Qmt3YVO+AWNslb7dUKhcKarbnXrES7tLuItpZcFfIbuMDUqRQOiHY4Qro9goaauKxD1+f8P/km9Y2VKJgCKqE6Y0B0kumBkDX+0+d77qRBdAGvjqQeGRW8bBRxQnz0DhGdJ5/St4yCjmtWr+14KSK7rfCGZ5Pb7HcF8s4hvzMWFYcEwhMn/rtJHCOIccwiN+kB3NWObWqGEsA3GDY4eb8JzIjqUl5SGFe7m84y0udoVMwkijps5FzJqjDjpUoQcp99TFPg==
Received: from HE1P193MB0058.EURP193.PROD.OUTLOOK.COM (2603:10a6:3:107::16) by
 PR3P193MB0716.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:37::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.11; Sat, 13 May 2023 09:27:15 +0000
Received: from HE1P193MB0058.EURP193.PROD.OUTLOOK.COM
 ([fe80::e47:6266:508:93f0]) by HE1P193MB0058.EURP193.PROD.OUTLOOK.COM
 ([fe80::e47:6266:508:93f0%11]) with mapi id 15.20.6411.011; Sat, 13 May 2023
 09:27:15 +0000
From: Maxim Kostin <ttxinee@outlook.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtio: Prepend "virtio" prefix in virtio_error
Date: Sat, 13 May 2023 12:26:55 +0300
Message-ID: <HE1P193MB00580265AE8BA41151B8E203A37A9@HE1P193MB0058.EURP193.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [tPPAiUGT428g+29m43aJg/gQy194cG4T]
X-ClientProxiedBy: FR2P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::7) To HE1P193MB0058.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:3:107::16)
X-Microsoft-Original-Message-ID: <20230513092655.7893-1-ttxinee@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1P193MB0058:EE_|PR3P193MB0716:EE_
X-MS-Office365-Filtering-Correlation-Id: 3028c7bb-109d-4a9a-695f-08db53943d3e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /N0IbD7P8BFIzHkA/NKxvkkEDhrHt82CTAJezb4G5xf8SeVABkbU1FjxxyrdJ2oQ+5KJgAhvqcNEi+06hbkyySD5yQL5u/04OOEAUhHi9gC4ZgLEqJMeUiBf9Y9YiAL+N70XaxQ/FHDmKW8tNxP8+UwKixO3yS72+wTZBuyR6JxK4kkSoGQOjOJGrPWeUAAD6GkvTbh/fMjnrtSHlv9YwbHKSLbTyKimvlN6KhGMzYnsGhG2khMLdVmgqtRI2Zc4GjEnS575hHwO8SI7hLf3WhE6YxALJsuPprJGXw5ss/0JxZz2zFeCfP/kKili6aaVMoS27gutGLFhPXp4oZb74LUY6XDf/TieYOORg2jZBjNTA7XfTd2EdX5vEzNLRVTVdyffQ3SB0yoEFWD3IrZxnibLWOSAbf9j65KmDfMJp5e9auiBkcMnXJytWuUpkEOOrg607phFr+Id8fY9zAy4avl2tcpgr2XK5r777sjqLdhqVJ9CIG7xFWKO1cHFUY4GuitIO7VGje8IuJXyznGF1HSaLk8QjpvVLzgt6/URZNlwOvkb0eCfUS3A8tmAjAXb
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nlxYoHw2SNzMWK8jcTkMakIiOUaEitdksCj8pVI17zumjSXOSLWpFiegvWhL?=
 =?us-ascii?Q?jVe8kTg7JWi3iVOHhBS3uZASw2AwAO9kCl459i/7LUQk472ucSr2TmkmMHcC?=
 =?us-ascii?Q?yN7RzXiqvjLfVHtdC1zwIf58BtfkE7Xt/d1sAeAwsVfDcj3cWwVz/w6Ll/8p?=
 =?us-ascii?Q?hgVqPVMybKVb5IyCMFHIdPFP+rT4qIgElk51Nq+3X48VXOFIocv9Cz6N8lkV?=
 =?us-ascii?Q?MzsGlYsvrg9OOLoWhTCpaO09nofLxtAIC+O2Tq3zP4nM+wOabHcnbel5SU6K?=
 =?us-ascii?Q?OYXjI1aC+tYtCpLZHicZHJjXmVv7QFcdaz6Tgm6fvDevPwnGdQrrqIUcJ6Yj?=
 =?us-ascii?Q?zKiIPRbJbL54VuGQyIXGKxtJa4kXnjKxoyJ3DsvEkbI+cqf1oiF4mux/PR9s?=
 =?us-ascii?Q?MM+9sLpdvyGu4JUMe7fv6wbZjeRvWvJIFENb3eFmQ0eRafTYrlf19mPq/T6H?=
 =?us-ascii?Q?nvdgqmtCq3e/xUtdqQ8rAoNZPguKkiZpNZMAVYLKNOJafjAHIRcxwCvORDCE?=
 =?us-ascii?Q?ODzHTfouSZ8vuDcCs3KzWNNyL36Pm+EhL6iwPK7ajUjKQ56reZK+YUhZ/Cd+?=
 =?us-ascii?Q?3xdaJSjB3tDUBjLLy1/pgh5jERmBxxyZXNg4lPbu3sBttLE97mqt5YjbM1GS?=
 =?us-ascii?Q?mBU9ruQ74nIRrxZjV25TEH5awlcpjwHpIPJSIR9iMJOyb088V+MuIcNsW1hV?=
 =?us-ascii?Q?4o+kekUMoB5lZRbtsoyxD85vYXbgGfIDZ7pJwXVfIXpqp37UYyzMgw60MM3B?=
 =?us-ascii?Q?OEp7AgKIIMV5oVwJeDSqR+zSNOwZpybg5lQ3voLW4mFOiXi37xSEPQXTTSKt?=
 =?us-ascii?Q?O9wxLcSv/JnCbHrG0FiWrEbh28kmhxR9rE5ubz3oA05xzYz7xlNxNaK/bX89?=
 =?us-ascii?Q?2a6keO9/4rRYm9DWrLfBsidx5X/kCe/MX5w6xCerv/bbgiixTIWHODZTn2+o?=
 =?us-ascii?Q?u9FBsL54T+VBbJJVwEIKfkLcgB2gNIw1l4OjowjZkiDlC4nRhnIjkH7pes69?=
 =?us-ascii?Q?zA7HV4dRKBZj3u7ZuFFs8g6uQ0QCxnmwQl4RafrtODgMe2cJln19HiR2UHkj?=
 =?us-ascii?Q?mDIYpCNsrIjd3udXEjrUNDkSWPrhaQxqDTlSo6t/fmtAf2Xu8dEPznR4qD3W?=
 =?us-ascii?Q?y73LzYzlo97xdkB+YKeylN3D+8YX035gf9IK+TlhbdXq67vko7oqJFF4kZvx?=
 =?us-ascii?Q?RxWulnMwovFz3J77vSm/oKYkV8E2OQ1CErjl1w=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3028c7bb-109d-4a9a-695f-08db53943d3e
X-MS-Exchange-CrossTenant-AuthSource: HE1P193MB0058.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2023 09:27:15.4647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P193MB0716
Received-SPF: pass client-ip=40.92.65.75; envelope-from=ttxinee@outlook.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Rename virtio_error function to virtio_error_impl and wrap it with
virtio_error macro, it adds the "virtio" prefix to the error message.

Remove redundant "virtio" prefixes in virtio_error calls.

Signed-off-by: Maxim Kostin <ttxinee@outlook.com>
---
 hw/virtio/virtio.c         | 10 +++++-----
 include/hw/virtio/virtio.h |  6 +++++-
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 272d930721..efdc425063 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1375,15 +1375,14 @@ static bool virtqueue_map_desc(VirtIODevice *vdev, unsigned int *p_num_sg,
     assert(num_sg <= max_num_sg);
 
     if (!sz) {
-        virtio_error(vdev, "virtio: zero sized buffers are not allowed");
+        virtio_error(vdev, "zero sized buffers are not allowed");
         goto out;
     }
 
     while (sz) {
         hwaddr len = sz;
-
         if (num_sg == max_num_sg) {
-            virtio_error(vdev, "virtio: too many write descriptors in "
+            virtio_error(vdev, "too many write descriptors in "
                                "indirect table");
             goto out;
         }
@@ -1394,7 +1393,7 @@ static bool virtqueue_map_desc(VirtIODevice *vdev, unsigned int *p_num_sg,
                                               DMA_DIRECTION_TO_DEVICE,
                                               MEMTXATTRS_UNSPECIFIED);
         if (!iov[num_sg].iov_base) {
-            virtio_error(vdev, "virtio: bogus descriptor or out of resources");
+            virtio_error(vdev, "bogus descriptor or out of resources");
             goto out;
         }
 
@@ -3563,7 +3562,8 @@ void virtio_device_set_child_bus_name(VirtIODevice *vdev, char *bus_name)
     vdev->bus_name = g_strdup(bus_name);
 }
 
-void G_GNUC_PRINTF(2, 3) virtio_error(VirtIODevice *vdev, const char *fmt, ...)
+G_GNUC_PRINTF(2, 3)
+void virtio_error_impl(VirtIODevice *vdev, const char *fmt, ...)
 {
     va_list ap;
 
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index f6b38f7e9c..7022b67c72 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -221,7 +221,11 @@ void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size);
 
 void virtio_cleanup(VirtIODevice *vdev);
 
-void virtio_error(VirtIODevice *vdev, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
+#define virtio_error(vdev, fmt, ...) \
+    virtio_error_impl(vdev, "%s: " fmt, "virtio", ## __VA_ARGS__)
+
+void virtio_error_impl(VirtIODevice *vdev, const char *fmt, ...)
+    G_GNUC_PRINTF(2, 3);
 
 /* Set the child bus name. */
 void virtio_device_set_child_bus_name(VirtIODevice *vdev, char *bus_name);
-- 
2.25.1


