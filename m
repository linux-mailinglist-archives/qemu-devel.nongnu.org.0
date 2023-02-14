Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBE969569E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 03:21:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRkw9-0002Hi-1A; Mon, 13 Feb 2023 21:20:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1pRkw6-0002Gv-O2
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 21:20:50 -0500
Received: from mail-dm6nam11on2055.outbound.protection.outlook.com
 ([40.107.223.55] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1pRkw4-0003nq-IN
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 21:20:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9bYlvvmVokHshzrSiC9KAMnnY0ZgRWuMsPHB3pTwyuqOSteNYYkhORLpE+gPJqqe1tX8r7ES4PsuNHltQRMj3d3xMXjB2WfOiDVfbSTkfSxccxOn4Bv6Hf7vJuMCRIX/CRo736jdDBmcwbhp6qrMS88ic++3AUZCZnulsxrrR/YI1Lyhtj1Y4FqaqPEk6chP8J10ubIKK7cwsAYNGvzW1KiY9k5NPPwRlHmVXrbgFu/3Idc5pM1KBXxIu9iofJ7pHrkaaoS6xr/zJDQPXq6zBtgPTyrgFL/Cz0uhGAgTFhkMW3CcRSJCepnp+TpTlBIyyQwUQskYTWCIeQOamctuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8b8RTAC+7WM1VFe7EPwSS8Rll29mNNAfbNxtaMTytEY=;
 b=biUt7UoetNBsjOSaqMD8mGsQyAuncrZf8P1hzafPYV9HwuKew8bAyDczfcAFGnYOqmcrgwGLpjdcrvrHEW1/HNVHt2h7pEQX/Jnu9vTEa7dalmwVSvftFuzN28mfU0dJ3Q4J8oOEUmrU49yus/Q6fGifsmfYLohya4NATQoV24BDKuLlbZwXEeUSRdmQ5nibUrVHCzu7ZzB+oP7CIep3/L2t6MpAS05cAUrXVvgpZwERovy5PLIaAUX9C82wwpb56yL16zCsjqpIkTJiLbwjbDT9c+E6UsBwxuQmsEsm3Rcllr+E6Abyfds3Db8FvCO2pBImoUsE5kKSE4a3lehiBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8b8RTAC+7WM1VFe7EPwSS8Rll29mNNAfbNxtaMTytEY=;
 b=ihqsJQPbKvtflSUNLRZjtqtklMUqkba/pfmxP8HZ5kRK92A4PM99I7/d+w4rSSQQI1uaFtZZect+ZubkGOvwlsL/oeMXV/6ncz+LLs53hRSIthFZfzxvNHP5I7QxsiuMUXxQrPvP9PM/4b8PG7XlDoeSaQQbNCBVo4Kcb7VLN/7222zzunEqBlcF3IqLgXLYr9e0Y8Bbp34vaByYHk0w/gyznXzGmmPTRLkiSr0CoTv3pvTt3SIIYZF9hNyaT4ZUYxaU8IbWq+WAajqDLPwubaSX5Tvso48MltBwOTb0/1s1jgE9St6mEkgwtHHa60QSugvDQ4pUJAigWxQautZccg==
Received: from DM6PR11CA0031.namprd11.prod.outlook.com (2603:10b6:5:190::44)
 by DM4PR12MB6496.namprd12.prod.outlook.com (2603:10b6:8:bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 02:15:40 +0000
Received: from DS1PEPF0000E640.namprd02.prod.outlook.com
 (2603:10b6:5:190:cafe::75) by DM6PR11CA0031.outlook.office365.com
 (2603:10b6:5:190::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24 via Frontend
 Transport; Tue, 14 Feb 2023 02:15:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0000E640.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.8 via Frontend Transport; Tue, 14 Feb 2023 02:15:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 13 Feb
 2023 18:15:26 -0800
Received: from nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 13 Feb
 2023 18:15:24 -0800
From: Yajun Wu <yajunw@nvidia.com>
To: <qemu-devel@nongnu.org>, <marcandre.lureau@redhat.com>,
 <pbonzini@redhat.com>, <yajunw@nvidia.com>
CC: <mst@redhat.com>, <parav@nvidia.com>, Jiri Pirko <jiri@nvidia.com>
Subject: [PATCH] chardev/char-socket: set s->listener = NULL in
 char_socket_finalize
Date: Tue, 14 Feb 2023 10:14:30 +0800
Message-ID: <20230214021430.3638579-1-yajunw@nvidia.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E640:EE_|DM4PR12MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: b8637a84-9b0a-493a-e345-08db0e315e88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 153FZUtR86rjS9NuJfxD2kGJ4HUDbSUgmmq0mNv7uEFzHNGOMObeBhQDpgeRhWM/NnmV3/Huo2JygNBR0qmmBgiB9wEdvZm2nUBKt2yMFWdaGIwE6a6DyQXfdOgcv6caiLVwuEN8ZQy+y5skTllzidWqSi7iVs5NnwkqVDpux2dhcnkFdotQbd1vMPJL5j9p7SQu1oQ0m6hqTbUqFIsadMjBfaerJq/gklpeAdVArs3/7tjwVOIL8q1ne8DuYyYQwocrGFlSuOJvGnX/YIhJTwBfUthEcN303yHAgX6a/jO+IcmcJJLIOHEtZxh3qGHTyxZRBCpuYTbGjtUFg5xbtKBSDqF+OE4P0pJq5BLGAxsnyZvwfHRFIDhjTJtngZ/4TtN2PlI8veJPNaM6SXiA86VcD3eH84mPqI3HVR/+TJHjpq61k+kJEaIpqtzyNGff3f5Biy6YVzXoiZAUSc6ZewlIvOLAjyMfxZUp/AomGUuR1hDMnPHvQGtfljBndK3f/T7mRO49MfBTIsXlZNNOqHc2saQt5dxW8vJRBxAdinYo+BzWl5DarOwz+dkYJ41hai5p8lsyMvQd9ID7N6xPlRn3wmUmGiJn6xpjiJO4h9F1Jq+KR03130g3Im1BsP92De8s2JR3GsoplUzJH/J/IatoChKA5cLodEG98A/85yFPO9im2WVScmNLwqoZBeV/nB7KsX1XL4M1v2wTu9GFDw==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199018)(46966006)(36840700001)(40470700004)(36756003)(83380400001)(36860700001)(70586007)(70206006)(55016003)(4326008)(8676002)(7636003)(82740400003)(47076005)(82310400005)(336012)(426003)(356005)(16526019)(1076003)(6666004)(2616005)(316002)(7049001)(41300700001)(54906003)(110136005)(7696005)(6286002)(107886003)(5660300002)(478600001)(186003)(40460700003)(26005)(86362001)(40480700001)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 02:15:40.3710 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8637a84-9b0a-493a-e345-08db0e315e88
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E640.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6496
Received-SPF: softfail client-ip=40.107.223.55; envelope-from=yajunw@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

	#0  0x000055914f46f795 in object_dynamic_cast_assert (obj=0x559151b7b090, typename=0x55914f80fbc4 "qio-channel", file=0x55914f80fb90 "/images/testvfe/sw/qemu.gerrit/include/io/channel.h", line=30, func=0x55914f80fcb8 <__func__.17257> "QIO_CHANNEL") at ../qom/object.c:872
	#1  0x000055914f480d68 in QIO_CHANNEL (obj=0x559151b7b090) at /images/testvfe/sw/qemu.gerrit/include/io/channel.h:29
	#2  0x000055914f4812f8 in qio_net_listener_set_client_func_full (listener=0x559151b7a720, func=0x55914f580b97 <tcp_chr_accept>, data=0x5591519f4ea0, notify=0x0, context=0x0) at ../io/net-listener.c:166
	#3  0x000055914f580059 in tcp_chr_update_read_handler (chr=0x5591519f4ea0) at ../chardev/char-socket.c:637
	#4  0x000055914f583dca in qemu_chr_be_update_read_handlers (s=0x5591519f4ea0, context=0x0) at ../chardev/char.c:226
	#5  0x000055914f57b7c9 in qemu_chr_fe_set_handlers_full (b=0x559152bf23a0, fd_can_read=0x0, fd_read=0x0, fd_event=0x0, be_change=0x0, opaque=0x0, context=0x0, set_open=false, sync_state=true) at ../chardev/char-fe.c:279
	#6  0x000055914f57b86d in qemu_chr_fe_set_handlers (b=0x559152bf23a0, fd_can_read=0x0, fd_read=0x0, fd_event=0x0, be_change=0x0, opaque=0x0, context=0x0, set_open=false) at ../chardev/char-fe.c:304
	#7  0x000055914f378caf in vhost_user_async_close (d=0x559152bf21a0, chardev=0x559152bf23a0, vhost=0x559152bf2420, cb=0x55914f2fb8c1 <vhost_user_blk_disconnect>) at ../hw/virtio/vhost-user.c:2725
	#8  0x000055914f2fba40 in vhost_user_blk_event (opaque=0x559152bf21a0, event=CHR_EVENT_CLOSED) at ../hw/block/vhost-user-blk.c:395
	#9  0x000055914f58388c in chr_be_event (s=0x5591519f4ea0, event=CHR_EVENT_CLOSED) at ../chardev/char.c:61
	#10 0x000055914f583905 in qemu_chr_be_event (s=0x5591519f4ea0, event=CHR_EVENT_CLOSED) at ../chardev/char.c:81
	#11 0x000055914f581275 in char_socket_finalize (obj=0x5591519f4ea0) at ../chardev/char-socket.c:1083
	#12 0x000055914f46f073 in object_deinit (obj=0x5591519f4ea0, type=0x5591519055c0) at ../qom/object.c:680
	#13 0x000055914f46f0e5 in object_finalize (data=0x5591519f4ea0) at ../qom/object.c:694
	#14 0x000055914f46ff06 in object_unref (objptr=0x5591519f4ea0) at ../qom/object.c:1202
	#15 0x000055914f4715a4 in object_finalize_child_property (obj=0x559151b76c50, name=0x559151b7b250 "char3", opaque=0x5591519f4ea0) at ../qom/object.c:1747
	#16 0x000055914f46ee86 in object_property_del_all (obj=0x559151b76c50) at ../qom/object.c:632
	#17 0x000055914f46f0d2 in object_finalize (data=0x559151b76c50) at ../qom/object.c:693
	#18 0x000055914f46ff06 in object_unref (objptr=0x559151b76c50) at ../qom/object.c:1202
	#19 0x000055914f4715a4 in object_finalize_child_property (obj=0x559151b6b560, name=0x559151b76630 "chardevs", opaque=0x559151b76c50) at ../qom/object.c:1747
	#20 0x000055914f46ef67 in object_property_del_child (obj=0x559151b6b560, child=0x559151b76c50) at ../qom/object.c:654
	#21 0x000055914f46f042 in object_unparent (obj=0x559151b76c50) at ../qom/object.c:673
	#22 0x000055914f58632a in qemu_chr_cleanup () at ../chardev/char.c:1189
	#23 0x000055914f16c66c in qemu_cleanup () at ../softmmu/runstate.c:830
	#24 0x000055914eee7b9e in qemu_default_main () at ../softmmu/main.c:38
	#25 0x000055914eee7bcc in main (argc=86, argv=0x7ffc97cb8d88) at ../softmmu/main.c:48

In char_socket_finalize after s->listener freed, event callback function
vhost_user_blk_event will be called to handle CHR_EVENT_CLOSED.
vhost_user_blk_event is calling qio_net_listener_set_client_func_full which
is still using s->listener.

Setting s->listener = NULL after object_unref(OBJECT(s->listener)) can
solve this issue.

Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Jiri Pirko <jiri@nvidia.com>

---
 chardev/char-socket.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index c2265436ac..8c58532171 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1065,6 +1065,7 @@ static void char_socket_finalize(Object *obj)
         qio_net_listener_set_client_func_full(s->listener, NULL, NULL,
                                               NULL, chr->gcontext);
         object_unref(OBJECT(s->listener));
+        s->listener = NULL;
     }
     if (s->tls_creds) {
         object_unref(OBJECT(s->tls_creds));
-- 
2.27.0


