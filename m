Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06406457CC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 11:27:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2rdc-0004nl-PG; Wed, 07 Dec 2022 05:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1p2rda-0004nT-I5
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 05:26:50 -0500
Received: from mail-bn8nam11on20601.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::601]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1p2rdO-0000bT-1Z
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 05:26:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOMR5koiwocpXqaeiXIp/hr7HtZs718N/GkPL2BUk+bNtd7y9giGF76gXIwKhm5amPZQhwkzzkP0yvUq8GgHNv4K4LyMWMFsr1kkC1YLCdu0CQlN8+jwzAGk8t7kKod3Ym1SWOibn7mTUwOX7lhD5H3VGOtvbPu1e63UvFifoKz4gjRUSpkg3KflShvysM/k/bgLdxhFnxGk0RsZJSfR7e69yJqjZVMPTc/xmF4gb1y3I3XHxtVidkviS7qVoPnd3Z4O8dyo2U2i96/MgW5j7KHD2TrSNc4USO6kdv0wFSuh2kPMFV5P0u6ESPoooXLZc0lQk58Xn55BOT06HFhoww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcmSR/Y7CvAWmhA3LC+SrMuD0FzCVX4OSjfrbluDEfs=;
 b=PRa30jQPKL0jAfJsn7nn8N8mmm3XtLSk5pkmkulIgaKL/jChsH4IhMlPznB9/hf0OBQ7h8BGahBZ9j/qCtBLes3Bw9bZ8ljbgHjy2YkfARV2QdfTB/e9BJjbj1K35lf0D8aLdZR688+Dmj+9F2Rklkv/wsf/fwz9mrqIXGBCFHV4VgBOvZOWObb8wZ06TL7RLPINMSe0xrfnPB81X6Ecw6V1RZSOnx9EH9NswZIMGXxuGv2N38vgaYyeYelQa0VR2hFicCswCw3tjZUwcRyRvDqimvOyL0tUzC3WDTfnh412NjGNCGLzPypbj8gZgxO97F5UZxl3c49tckrMvjWPPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcmSR/Y7CvAWmhA3LC+SrMuD0FzCVX4OSjfrbluDEfs=;
 b=mOP0OwmtBlNv4s54M2847IKzNHzO2dL2a0rDg+e9ZdSOUxDA8lCK5WpryevSqNYXiKHzk1nE9Fam5f2t6SHwkL4qJuuR/acfo1CP3fP2S9N6FpOW2WpbfX7MgC6PyVVBIM9/Q4dUJ/7cJ07OBGXNbGQ7rV0YGJhf0pRBWX4z0sVX+PnYudhBSWttnNgpPh8Al5aFeCSmZhl36EXOGpUGLVkzzfneNToHdqVzw2Wd8NB4u/A72N+rsPmEcOpvWeJLgtZtTsi4WgPbQv6v8Xl42z5yr2ATzbHjpV/cP9Ia7FpMzHpKYbgCkvUGTz1k7GZr8x8sRmWpotgGQcJ+xiVAVA==
Received: from BN9PR03CA0718.namprd03.prod.outlook.com (2603:10b6:408:ef::33)
 by PH0PR12MB7080.namprd12.prod.outlook.com (2603:10b6:510:21d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 10:21:33 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::c) by BN9PR03CA0718.outlook.office365.com
 (2603:10b6:408:ef::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 10:21:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.8 via Frontend Transport; Wed, 7 Dec 2022 10:21:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 7 Dec 2022
 02:21:18 -0800
Received: from nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 7 Dec 2022
 02:21:17 -0800
From: Yajun Wu <yajunw@nvidia.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <yajunw@nvidia.com>
CC: Parav Pandit <parav@nvidia.com>
Subject: [PATCH] vhost-user-blk: Fix live migration crash during event handling
Date: Wed, 7 Dec 2022 18:20:59 +0800
Message-ID: <20221207102059.1378994-1-yajunw@nvidia.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT045:EE_|PH0PR12MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: f1eb8ce0-c517-4e06-cb5e-08dad83cd042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +9AqpBoSj0Xuy4k7+bvZppNyYfb+Ue3+H/pIWnBxP4ykZfEEL5tfbmpmn4+IXVyB9HZ7Zy79tOAS3Ds/KxS+I0TRb+7bGVaRmPrPOoupVTt81oApOxkcfgXW6XUY4V/zSV+1kS9TBRhRrXITgTNfyeyVuzttbNWEH1GNC5ELVuxkPNh0yyUO6ozVdDubmkmSpHrJVYpdMOl2V4kjr52zVoZMoTXenkpf+8ZI4sJ6xrFj5GUPAKqoDoflYYOICnbKI1YIBdwEMa7YaVbcRee+u96YgPqizXgTOHJudQTrAmM+rIBqOaWT8VSQz0jhvkwa84TeLm45/IIKs+9pgssefN0rs6mNn2bvpoyW7G+gBI6oW5miVP+RS6RvLFIScUK5kvCjEbHQ4nB6OQiTyr9boVRkXe1WUPRpsEWP+zuC6Xwc9UKxTVeNlK3G8tSQFzcxvHKoCwEsSKutAv9bvyraRwgFhE4hdLc5r9iACerKEPv+nBT30XxRnjEpVNFNP2q08YimwTmf8T3lPU/uogwiQIeZKIhAsVBixH5ORBhxxwmld5K2lQxN/PhfvUG8xXmUi6mNwQ1mk/8vdSQIqBwQxjyfKSw29Xj7ST4wOztPsJpiGlD1Z8p+DKKuw65O6+NWTj0pikR/VDU6/DD8sEPY/EAaEecNiSK92yiBdngXgHWjG7AjM+eHcc65nwN1vcWhE87zriISnAJ/yu9fT2UqUA==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199015)(36840700001)(40470700004)(46966006)(86362001)(40460700003)(70206006)(16526019)(36756003)(82310400005)(40480700001)(186003)(55016003)(1076003)(70586007)(41300700001)(336012)(6666004)(8936002)(8676002)(47076005)(5660300002)(2616005)(4326008)(7696005)(426003)(316002)(478600001)(107886003)(26005)(110136005)(6286002)(356005)(7636003)(82740400003)(7049001)(36860700001)(2906002)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 10:21:32.8147 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1eb8ce0-c517-4e06-cb5e-08dad83cd042
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7080
Received-SPF: softfail client-ip=2a01:111:f400:7eae::601;
 envelope-from=yajunw@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

After live migration with virtio block device, qemu crash at:

	#0 0x00007fe051e54269 in g_source_destroy () at /lib/x86_64-linux-gnu/libglib-2.0.so.0
	#1 0x000055cebaa5f37d in qio_net_listener_set_client_func_full (listener=0x55cebceab340, func=0x55cebab4f5f2 <tcp_chr_accept>, data=0x55cebcdfcc00, notify=0x0, context=0x0) at ../io/net-listener.c:157
	#2 0x000055cebab4ea99 in tcp_chr_update_read_handler (chr=0x55cebcdfcc00) at ../chardev/char-socket.c:639
	#3 0x000055cebab529fa in qemu_chr_be_update_read_handlers (s=0x55cebcdfcc00, context=0x0) at ../chardev/char.c:226
	#4 0x000055cebab4a04e in qemu_chr_fe_set_handlers_full (b=0x55cebdf52120, fd_can_read=0x0, fd_read=0x0, fd_event=0x0, be_change=0x0, opaque=0x0, context=0x0, set_open=false, sync_state=true) at ../chardev/char-fe.c:279
	#5 0x000055cebab4a0f6 in qemu_chr_fe_set_handlers(b=0x55cebdf52120, fd_can_read=0x0, fd_read=0x0, fd_event=0x0, be_change=0x0, opaque=0x0, context=0x0, set_open=false) at ../chardev/char-fe.c:304
	#6 0x000055ceba8ec3c8 in vhost_user_blk_event (opaque=0x55cebdf51f40, event=CHR_EVENT_CLOSED) at ../hw/block/vhost-user-blk.c:412
	#7 0x000055cebab524a1 in chr_be_event (s=0x55cebcdfcc00, event=CHR_EVENT_CLOSED) at ../chardev/char.c:61
	#8 0x000055cebab52519 in qemu_chr_be_event (s=0x55cebcdfcc00, event=CHR_EVENT_CLOSED) at ../chardev/char.c:81
	#9 0x000055cebab4fce4 in char_socket_finalize (obj=0x55cebcdfcc00) at ../chardev/char-socket.c:1085
	#10 0x000055cebaa4cde5 in object_deinit (obj=0x55cebcdfcc00, type=0x55cebcc67160) at ../qom/object.c:675
	#11 0x000055cebaa4ce5b in object_finalize (data=0x55cebcdfcc00) at ../qom/object.c:689
	#12 0x000055cebaa4dcec in object_unref (objptr=0x55cebcdfcc00) at ../qom/object.c:1192
	#13 0x000055cebaa4f3ee in object_finalize_child_property (obj=0x55cebcc6df40, name=0x55cebcead490 "char0", opaque=0x55cebcdfcc00) at ../qom/object.c:1735
	#14 0x000055cebaa4cbe4 in object_property_del_all (obj=0x55cebcc6df40) at ../qom/object.c:627
	#15 0x000055cebaa4ce48 in object_finalize (data=0x55cebcc6df40) at ../qom/object.c:688
	#16 0x000055cebaa4dcec in object_unref (objptr=0x55cebcc6df40) at ../qom/object.c:1192
	#17 0x000055cebaa4f3ee in object_finalize_child_property (obj=0x55cebce96e00, name=0x55cebceab300 "chardevs", opaque=0x55cebcc6df40) at ../qom/object.c:1735
	#18 0x000055cebaa4ccd1 in object_property_del_child (obj=0x55cebce96e00, child=0x55cebcc6df40) at ../qom/object.c:649
	#19 0x000055cebaa4cdb0 in object_unparent (obj=0x55cebcc6df40) at ../qom/object.c:668
	#20 0x000055cebab55124 in qemu_chr_cleanup () at ../chardev/char.c:1222
	#21 0x000055ceba79a561 in qemu_cleanup () at ../softmmu/runstate.c:823
	#22 0x000055ceba53d65f in qemu_main (argc=78, argv=0x7ffc9440bd98, envp=0x0) at ../softmmu/main.c:37
	#23 0x000055ceba53d68f in main (argc=78, argv=0x7ffc9440bd98) at ../softmmu/main.c:45

Function qemu_chr_fe_set_handlers should not be called in qemu_chr_cleanup,
because chardev already freed. Quick fix is to handle RUN_STATE_POSTMIGRATE
same as RUN_STATE_SHUTDOWN.

Better solution is to add block device cleanup function like net_cleanup and
call it in qemu_cleanup.

Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Parav Pandit <parav@nvidia.com>
---
 hw/block/vhost-user-blk.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 0d5190accf..b323d5820b 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -110,7 +110,7 @@ static int vhost_user_blk_handle_config_change(struct vhost_dev *dev)
     }
 
     /* valid for resize only */
-    if (blkcfg.capacity != s->blkcfg.capacity) {
+    if (s && blkcfg.capacity != s->blkcfg.capacity) {
         s->blkcfg.capacity = blkcfg.capacity;
         memcpy(dev->vdev->config, &s->blkcfg, vdev->config_len);
         virtio_notify_config(dev->vdev);
@@ -398,7 +398,8 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
         }
         break;
     case CHR_EVENT_CLOSED:
-        if (!runstate_check(RUN_STATE_SHUTDOWN)) {
+        if (!runstate_check(RUN_STATE_SHUTDOWN) &&
+            !runstate_check(RUN_STATE_POSTMIGRATE)) {
             /*
              * A close event may happen during a read/write, but vhost
              * code assumes the vhost_dev remains setup, so delay the
-- 
2.27.0


