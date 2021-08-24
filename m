Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326753F6BB7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 00:30:33 +0200 (CEST)
Received: from localhost ([::1]:53154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIewC-0005uw-1Z
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 18:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eugeneh@nvidia.com>)
 id 1mIetf-0003j8-M9
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 18:27:55 -0400
Received: from mail-dm3nam07on20603.outbound.protection.outlook.com
 ([2a01:111:f400:7e83::603]:55616
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eugeneh@nvidia.com>)
 id 1mIetd-00055H-Da
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 18:27:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dD0ilhVG3eq44Paio5CFnQf8skmiQK0oWmGM++T3gjDNGtpz4j4ukCQlG16iAbiEqN3562RwHWvGaFNajqVMPNYDXEyTC+L/1zkrviKb8euSdvZGpIHZtNlnQ/zBt03wtu1Bu58DIlZnZ5AB6PCCq43BCVA6M56RRppilahpHG/d9l9EgXKTX70JJ+Clps6wDBV73gJDKeLOjcbm6WOGWf9u1XWN/0Yd4Cqx3d0AERBc6jtWxTFwiBEi/h4Ojs5OoKdh+chpHBU3vflgr3YwftuVdCB40PYZ8XOWBDoMvKt2LE1dBATYMeA4FH8pgTPIB96Qscmsk7Jbl2URqclakw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejQ8tt1hx+AE5oUDMIa5dpyuzC9q2S2t2EqLK0EcvX8=;
 b=Dv1A5W+XFtUyKDA/cL4+wYcIJOJp6VcRNdXrH5/Hw7yXeBUtkrnCFQRjyszDcyMZgruS8crbAalRv4/Ycb4BX95oOcQG5F8VoXxX1fZ756Fro31BNnT0QEaJFNlqjVS0ZI1d1O+UblnFxwjpct382YfC050LtvYwoys/wMlAlWhJyChvr1f9i9O5GR6Z0sb2S6RgodBS0OPylL/jThr8iHbFyfDlAJS55Myx6eFssGmmEsntGRCMplIQ06ruTcee0zR/tOoVFlqeceQYytJRzZd2jAC4BCs3VR1OdP9V61oL56aYyvUWaZXvYI5hJnkOgzteWHZvJ4zTGAihOf4n0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejQ8tt1hx+AE5oUDMIa5dpyuzC9q2S2t2EqLK0EcvX8=;
 b=cI+kXXdy+/wpSK+xDgE5UDmFpJJf6ZUT7ZmWe+uQKch2Qlp7HK7MqykBKPiZgUhAAdEy28uDWQXj6nm8zp5g5MWdxuqT0Gsw/BqHO4paxO83sK+G6Wk1E/IS7F0VHKQo8390hrX7BWE+2vGgYUnzcdr8nP7L3iM2WxUBnKvKp1ztGoTidMfHMkgNMKC8AG7fN+sGZIN5mJXIN/GBi/DtY9wJU5wOggIgFk2C5K6Sf2M7frzlOZoioXQJZ/+aJ43xXdajyhq+d2g6tJUvzSQ/YyCmWZk64Mdk5feDP44o6/R4Y37F4VmsY54jcIm9g3jy5eNTJcSAcmJJ5lqhGga4kA==
Received: from BN9PR03CA0632.namprd03.prod.outlook.com (2603:10b6:408:13b::7)
 by MN2PR12MB3933.namprd12.prod.outlook.com (2603:10b6:208:162::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Tue, 24 Aug
 2021 22:22:45 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::1e) by BN9PR03CA0632.outlook.office365.com
 (2603:10b6:408:13b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 22:22:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 22:22:44 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 24 Aug
 2021 22:22:44 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 24 Aug
 2021 22:22:44 +0000
Received: from eugeneh-X299-A.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 22:22:44 +0000
From: Eugene Huang <eugeneh@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: <marcandre.lureau@gmail.com>, Eugene Huang <eugeneh@nvidia.com>
Subject: [PATCH 2/2] Add comment for qemu_egl_get_display
Date: Tue, 24 Aug 2021 15:22:26 -0700
Message-ID: <20210824222226.22528-2-eugeneh@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824222226.22528-1-eugeneh@nvidia.com>
References: <20210824222226.22528-1-eugeneh@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f0b21e8-fc64-4628-bad4-08d9674db256
X-MS-TrafficTypeDiagnostic: MN2PR12MB3933:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39335AE295601E29C9861E16D9C59@MN2PR12MB3933.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XY09n7VngZuH4GyhIzWteX5rurVbmhYorqCvlfJZ39xfnah7Bez9aO82BOOoQ431O4b2uH/wRnncbe6UGYc39oJDfiOeSZglNtMUvVJLnkj+5zw4a+J3iPW1bXj/0B0A7RM/KHbFK4asuaas/yLMHmL/+wA1VPeN311N5s+IEY0/3U5kK48xaBmPNoicau/JujfmXM7RdkDBfEIXjNJA8afaoxo3dZ4AYzlXyFXXIndG3hwZpscGshnB4wkbL2leebfWBOC2saP0GOtubIhrvBFY9mxxXY/3f11FSvsiej68NBhgwA6Zsfmfsu/6HyzdsndWr5EggxrFufIXhOcCOAeSfXxNNFwoMLVIi4BQjF5tSSYVuZ4fBMmGnq6CjG8+azzsTrOclbfUg4w79MutRSoTRMIXxxy1p63OS/m9Yo5h3LRqYm0aetbYHH8WEatR6uUObiOMkfz+p/2oSH9gxJnBj5cpGk+OCXNFPRpOw+BKpr109puMNvwlUqFu09W4TWeExd0V8k/SsYbmEzOrfgprK2TaJLr/EUHCXHsvQjF7zoy6blEe2CyRcvfj4CJyEpeiYsoCr2kogZOnm2MZWb55PnY3dvIF4BHyfl9H26Lm2NpVl61+Yx7vZnKDuC+V5Ker6/daqO8yu1gcWusqF3++nYYB3vsrwKz1sIuF5jiezuEUEbXVGktYFXu87zo4CqduP9EXTSdOnXEuHZHWvg==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966006)(36840700001)(356005)(2616005)(6666004)(4326008)(47076005)(107886003)(36860700001)(4744005)(82740400003)(2906002)(70206006)(316002)(5660300002)(7636003)(82310400003)(6916009)(54906003)(70586007)(8676002)(36906005)(26005)(86362001)(186003)(336012)(478600001)(426003)(8936002)(1076003)(36756003)(7696005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 22:22:44.8738 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0b21e8-fc64-4628-bad4-08d9674db256
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3933
Received-SPF: softfail client-ip=2a01:111:f400:7e83::603;
 envelope-from=eugeneh@nvidia.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Eugene Huang <eugeneh@nvidia.com>
---
 ui/egl-helpers.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
index ce0971422b..dee31c6fbb 100644
--- a/ui/egl-helpers.c
+++ b/ui/egl-helpers.c
@@ -346,6 +346,10 @@ EGLSurface qemu_egl_init_surface_x11(EGLContext ectx, EGLNativeWindowType win)
  * We can workaround this (circular dependency) by probing for the EGL 1.5
  * platform extensions (EGL_KHR_platform_gbm and friends) yet it doesn't seem
  * like mesa will be able to advertise these (even though it can do EGL 1.5).
+ *
+ * 5. It is worth adding an EGL_EXT_platform_device && (EGL_EXT_device_base ||
+ * EGL_EXT_device_enumeration) extension check with the EGL_EXT_platform_base
+ * check before using the EGLDevice functionality.
  */
 static EGLDisplay qemu_egl_get_display(EGLNativeDisplayType native,
                                        EGLenum platform)
-- 
2.17.1


