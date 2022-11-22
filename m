Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0809634915
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 22:20:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxafU-0002L7-Dv; Tue, 22 Nov 2022 16:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukes@xsightlabs.com>)
 id 1oxY3G-00034z-1i; Tue, 22 Nov 2022 13:31:22 -0500
Received: from mail-am6eur05on2061e.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::61e]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukes@xsightlabs.com>)
 id 1oxY3E-00023L-4Z; Tue, 22 Nov 2022 13:31:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVj+Ay9OikLGyC6IwFxXVVWuj4ChxxG4UsfCVOVeTmvNCM7xwQngHq01XEShHlpBFT8k+WaTlptYyYZcgqf/QHSo1kCJ+WUFAm3thUtrHEFr3CVsx4rmR992l6j0+ZHudrhgJOF1DWR/IUnTpZRzcYwTO6mn+F0h4mc3ST57aYGtiuj9yvBf8nnWxpx31eVsD97KED6jehXxxBh+wSzXDrhzoJv0l6UqnMvUVJ8H5Q9cR5gV6Pe/z9Sa7xdb3QuVZDH+CrDKkBjLD+EbBnYEBrfq2c2cE2YGHq1oc2hag0FdvAdgRCFgc61URPu8kpnlqRHJUXr9AE0Q8/23eurwCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sg9UJbKMbyA0CB++uNdmCWpH4FVYjm+vgB/xmUY6Xs0=;
 b=MythNY24NW2zwntCK7VyHrjdS8gRVWWjt1HpOb1QhoRxrB3eqBUG3GpK1js8W3W/gIE5DNjNxr7RPiJwLy9JbhljLxHLQplbzJFoemVlOXDL0BLLaoSU7NI+wYqUdthpy5LaJwNk/ysV1KBYHcp5O2PfSoqRGz0osRyEpheq05S1w7mTJoJbKi0I3Sedz/zLQZfD1ZPvnr2YjImdV2e+cB+eUCagVQXL1J0cBf+vh+y8QSuK1QUyEXI3if35QFlk13W+pzb9JmbdunjXTRLc7qtqIbG2zL++nFm+5toSFFXzQzfbP1gg5eachxeJbOdEHC9mZpjjeXpMdtf+sewVbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xsightlabs.com; dmarc=pass action=none
 header.from=xsightlabs.com; dkim=pass header.d=xsightlabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xsightlabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sg9UJbKMbyA0CB++uNdmCWpH4FVYjm+vgB/xmUY6Xs0=;
 b=vLZCnW0oYxWQ3WmaIZk8HBZ/SKi//tUa5HBadtdOx5Ij9yjZet0AegrQ3IZewfvfAAD8jr9XXneKqBpV8qJbSZ6voJy4jFm7OixCOAbz+qzVq0GqXSG7zMJP/ZvpFRVxzYaSLWXFOOcwDdOVkAfdg8C4BOZH5hWl4RsuBsI364U=
Received: from AM9P193MB1684.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3eb::9)
 by VI1P193MB0751.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:15a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 18:31:13 +0000
Received: from AM9P193MB1684.EURP193.PROD.OUTLOOK.COM
 ([fe80::4250:f814:d3d6:53fc]) by AM9P193MB1684.EURP193.PROD.OUTLOOK.COM
 ([fe80::4250:f814:d3d6:53fc%4]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 18:31:13 +0000
From: Luke Starrett <lukes@xsightlabs.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] hw/intc/arm_gicv3: Fix GICD_TYPER ITLinesNumber advertisement
Thread-Topic: [PATCH] hw/intc/arm_gicv3: Fix GICD_TYPER ITLinesNumber
 advertisement
Thread-Index: Adj+n8qZOS4IkPRKTWSt1D/2cKRy2A==
Date: Tue, 22 Nov 2022 18:31:12 +0000
Message-ID: <AM9P193MB168473D99B761E204E032095D40D9@AM9P193MB1684.EURP193.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xsightlabs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9P193MB1684:EE_|VI1P193MB0751:EE_
x-ms-office365-filtering-correlation-id: a0db79c6-f68e-41fb-762a-08daccb7bbf6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ztn60Ugxk3yc78jhWHC3Cnypqckwe2lGk1gaf/DFaBogGyj0PBZXXwi3QHHs33CocirSliR66JD2nrzlWHOYVWA4PXoya1fy4fnD7LevoXrtoKOvXQSKEQtXKRL3syvwEAsBU234NshDOhTXO7e9P2aFLQzH1cl64tbsTTU+CxeJRQoaT7OdLjvc/W9Ry+TJa6zJuh98jZipZ285mH/FZAf3HIKh/TN4rkXhsJe3xK4Do201oHTS8GiKaoEzg6lQjG78isPJkzAsGC3waf/a7hTbcRBlnbd4HIFkORHPPm/xtR3orEessW8yw6fKXdsTsdNdSvDll5drHZ7lmZqwsEgofUFDAphocbXuV9xPOa/qttXiP6GNbv9YPmoq/B8kWqj1L8B7VKnb9hQjwd/eOMpjcyHfpamaD/NFAOVK3mk0lkuuZAZRUvxin7r/JTkqbGVnz2EeaVsWRui4NL+QF7onXWYdrc1M6qosr6a/Jy9ytflgRWXRd4cF7noZGJwoM7PMS5wKZuuQj03sqQG3QyP4DYpPeAnjTFTb7aEoOOxblF//3K01MgKE+BHitK6LDN2rX3PbsDj2YspH4pidUDbWVGB6Zp22So/nZThuAU0iWPUdKZfMVr/wkrykIdWr3LQHxC+1YCnt5/E7CJl/VDqGrQM1wax8zvVYaFT+VXYEGXd54jUp8LyzgG85H6QAMRAKgJkUrguqIjd8UE2saw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9P193MB1684.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(39840400004)(396003)(136003)(346002)(451199015)(38070700005)(26005)(2906002)(110136005)(6506007)(55016003)(71200400001)(86362001)(83380400001)(478600001)(38100700002)(9686003)(122000001)(33656002)(7696005)(186003)(8936002)(52536014)(41300700001)(76116006)(64756008)(66476007)(66556008)(8676002)(4326008)(66946007)(66446008)(5660300002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Wxe5J/RbtnC4nU5Jb7CZXI0EwCK8abkxXQ2Li195ePmCqbiY7shNnFQ3kg8b?=
 =?us-ascii?Q?MWwG91CRO3Ray/XqxRP0Yw25zWLOLpRiwdQ0Za4JdeL+ScCAE38FA9mLJ1j/?=
 =?us-ascii?Q?3T1j51hydsyqwYpQCRUNV6x05SHTOowSVyyKDrU8zkY3aOJrqqVF1TrPjfU8?=
 =?us-ascii?Q?kEOCBAqiYzXziTHk/JZHGe2dCj1ITZqvH+vL7id4XpMrQtjkXXi0KvvUNllf?=
 =?us-ascii?Q?n3u3jC6I0af+H/SE41IukwYJfyroVwLgPZzyr8XYloVNzGTV3AXyQVrxWnm8?=
 =?us-ascii?Q?sxMXwXvAlMgAy8KFj0yDqo55zjKvQnMuxev/iLnkFDvtJE+OoTOBX55QQVgP?=
 =?us-ascii?Q?WlfKnf5Bigb4IVhBgm5haIWFqwenNQTiUzDOLXcoAoueDttQVL6aI22TTYNy?=
 =?us-ascii?Q?6DHmO7JrOX32aD3YdpZZvWqrWWwWKKEnJNnxuj+cXNIOK96WB9oRt1a5AYXa?=
 =?us-ascii?Q?jb+O1yNMzs4FWC/mFz9NShIItiasdeJYDB8u+vdnp2hcqDaHD/+PfmygYfe9?=
 =?us-ascii?Q?hiGPHx8UBLP/82PM9yS8vBSXBHTUxeBVaXEXWDTP3cQbOn9yImwWQDFMZBtO?=
 =?us-ascii?Q?zcxON7khm84d22Top0mx143gEG67hGIAX/y02XVpsqQh/O5cjDI/tKy8uvD+?=
 =?us-ascii?Q?oqIKFpymK3pNowf/mMXMbieAfoATwjfb9SPRnWFeXra5TF+nobhoPvd6GWR6?=
 =?us-ascii?Q?nPhFNAjUi2LKSnXHi/TMPDjQnM/oYsGeRM9zXiTq7N4FYrS6frNk1tPn2iCa?=
 =?us-ascii?Q?tjsFRopuMVLnqkHRqZFSgab17nAkwg3i/NVQ8OpuETsIqavyQ58W2ByUEBW/?=
 =?us-ascii?Q?t4UENL66kaAWWhFzoeVmK20YN/fQpn8ORvtxVmQJN8L1lZpT/yuLML0R5Imw?=
 =?us-ascii?Q?Ql12WxgTsS2OfAEnzT43M4iXj4/U5ZdHNhg2CST7ayypPf6D8ygZd0cbpKce?=
 =?us-ascii?Q?PAnwgAI0XQPmRk3UXnlTeuN3Q+bi8l571zNwkojvcTWwxXtS1JO8eNjGTwTP?=
 =?us-ascii?Q?xcvxzeAkRh7xUqkbGvEnl9HN0pRoP3CdTQn1m78zjuNKYgilnurfq3vzxRM+?=
 =?us-ascii?Q?+HywFVHPxArZG9MGlmTkwsYCKAo+pSvBk7pmzr6J+tA+hmOakQ/FfmU56RfI?=
 =?us-ascii?Q?60fNiO2Wzk2Tvx4GVoc/sfcj9Bz/fBlZtpwx4IAgNDodn3xphWJei8z9aTIL?=
 =?us-ascii?Q?xCURAXqJ/xPnhxgSie16zNZ6Kqn/uLVAZDmvTEc4ZYueGEXVVRpbw9CDGqD7?=
 =?us-ascii?Q?zZ8Y8agg2RvULQTUYz+vAF9r+38RyB/M26zhBK+FX6NoVYIMiRsE4qF96RFT?=
 =?us-ascii?Q?ZzECXGgASkqQj6pGOVCzzEFw6g7Ns7KwMf/yUapQwhK3uzUSByhCy/oFbSVT?=
 =?us-ascii?Q?kbpFpoW380b4ftfsY27DU90JnIFmJaXvfiyThEjFbghkQIrZlp+Vy6VFj6ky?=
 =?us-ascii?Q?+FIDb00hZlcN1ms7epLCobCxGQI0MRUHMqEZIwoYot6p6F3dXS6smwf3H5Ar?=
 =?us-ascii?Q?Un3+BLOWmgQvXsKyWZa5F92XMA4FZk8DhK9FstRdx5Eyp+GjxqR6xMN/mr+J?=
 =?us-ascii?Q?5IOEeyX3kIfjLARcuiy3q969gSvFlcQaKObqBZcQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xsightlabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB1684.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a0db79c6-f68e-41fb-762a-08daccb7bbf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 18:31:13.0450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 646a3e34-83ea-4273-9177-ab01923abaa9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HbzZo1U3YBhVj7597bYbb6L5OAPxrDjUXcIJEN3QlZEZ+2BMzOMhUfP7tGkPDDnsl1t6xWQWiYkpqAebRaxgNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P193MB0751
Received-SPF: permerror client-ip=2a01:111:f400:7e1b::61e;
 envelope-from=lukes@xsightlabs.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Nov 2022 16:18:58 -0500
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

The ARM GICv3 TRM describes that the ITLinesNumber field of GICD_TYPER
register:

"indicates the maximum SPI INTID that the GIC implementation supports"

As SPI #0 is absolute IRQ #32, the max SPI INTID should have accounted
for the internal 16x SGI's and 16x PPI's.  However, the original GICv3
model subtracted off the SGI/PPI.  Cosmetically this can be seen at OS
boot (Linux) showing 32 shy of what should be there, i.e.:

    [    0.000000] GICv3: 224 SPIs implemented

Though in hw/arm/virt.c, the machine is configured for 256 SPI's.  ARM
virt machine likely doesn't have a problem with this because the upper
32 IRQ's don't actually have anything meaningful wired. But, this does
become a functional issue on a custom use case which wants to make use
of these IRQ's.  Additionally, boot code (i.e. TF-A) will only init up
to the number (blocks of 32) that it believes to actually be there.

Signed-off-by: Luke Starrett <lukes@xsightlabs.com>
---
 hw/intc/arm_gicv3_dist.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index eea0368118..d599fefcbc 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -390,9 +390,9 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
          * MBIS =3D=3D 0 (message-based SPIs not supported)
          * SecurityExtn =3D=3D 1 if security extns supported
          * CPUNumber =3D=3D 0 since for us ARE is always 1
-         * ITLinesNumber =3D=3D (num external irqs / 32) - 1
+         * ITLinesNumber =3D=3D (((max SPI IntID + 1) / 32) - 1)
          */
-        int itlinesnumber =3D ((s->num_irq - GIC_INTERNAL) / 32) - 1;
+        int itlinesnumber =3D (s->num_irq / 32) - 1;
         /*
          * SecurityExtn must be RAZ if GICD_CTLR.DS =3D=3D 1, and
          * "security extensions not supported" always implies DS =3D=3D 1,
--=20
2.27.0

