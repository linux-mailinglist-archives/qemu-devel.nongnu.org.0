Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110CA42E4C4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 01:32:49 +0200 (CEST)
Received: from localhost ([::1]:59518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbADN-0001eL-UV
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 19:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mbABs-0007vr-Id; Thu, 14 Oct 2021 19:31:13 -0400
Received: from mail-dm6nam11on2055.outbound.protection.outlook.com
 ([40.107.223.55]:28601 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mbABp-0005vY-7p; Thu, 14 Oct 2021 19:31:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhyJ4trkJe4GuNLrFFWiVA7/h0FbyoDZCxgEMkzkjzwRlWS548HbTshgIrwPmB5pD5LfMzG7J90scyBdxtUemNmWmWPrNdrdTBnilKxZpE4cnrvHMpagAqmUCdfCbPNeX++TknOMpA/zJ6yPdv+M0l7LlmOpKFmeGHSE478T1c5Z+PXNnzKAJ3mf7R0XowVqZbKtJCJFodSUkC5L+YmcI8WJ3/TP+nZXFuOl+lpiS0CwzZa12yNXEqlgY4hbHePvbbi8/YLSO0sWqiYNnFToNKfzrGbxdYHGTtEs1XO1lH+1Y8/xHWEU7hhIMPvq5ZQCz7pPdvYx3bB7IgWDO0+ZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrSZulDq2vxiKCHNhY9CiRhBlM08ay+IanNBoYVkmdk=;
 b=JYk4czbOzKsuupjLs4CTBUZ4Xsk0WXCx59lDUYLKRzqPXG8Zo2YvUF8wa9YnNL81Tx3luYGWiiDPeCngWqavs9mwrZJlY3+6dMmwNJlZNz2SNwOcTxGWxoP3QRO6lhxAiIqB87KgNyBPJYz2nqoQmKLtUphlh9c7QhbjkAf8pPa7x8IU6lrN1ht5mFs0S1x8EPhtYm8LuxjyH2DPumEHysD5K3wCJumDmOD9ccgy8wMlzCheKJLfKAWWYwVx9GtwvA0TVU0L1qTVghLQoXjUJ3WQaK/GHzGvfWYfwpldqe9qqZXPz/vB7iAdVivGeHfiKHPrb2cixeYK1o5QZC9P/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrSZulDq2vxiKCHNhY9CiRhBlM08ay+IanNBoYVkmdk=;
 b=iHFgpAojjP+x59OwT0d1ZkOZhcs3Y3vbwtQtaX6oZwMYAzsv3Dj/wPZflYjrjBNq7EC2pVjKed3d+9UipazN+wD8887f/rvb1ggv0e6Kq5iuDOQ4VFMvA0FYK268WX5bg55aE1K61xul1nYOwoogp6EQXvf08TzyVC3fC4XmBYI=
Received: from MW3PR06CA0010.namprd06.prod.outlook.com (2603:10b6:303:2a::15)
 by DM5PR1201MB2554.namprd12.prod.outlook.com (2603:10b6:3:ec::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 23:31:04 +0000
Received: from CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::55) by MW3PR06CA0010.outlook.office365.com
 (2603:10b6:303:2a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.26 via Frontend
 Transport; Thu, 14 Oct 2021 23:31:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT036.mail.protection.outlook.com (10.13.174.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 23:31:03 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 14 Oct
 2021 18:31:02 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e7f5c4ae-3284-a155-cb98-69ff6ce52649@amsat.org>
References: <YK1aPb8keur9W7h2@ls3530>
 <e7f5c4ae-3284-a155-cb98-69ff6ce52649@amsat.org>
Subject: Re: [PATCH v2] hw/display/artist: Fix bug in coordinate extraction in
 artist_vram_read() and artist_vram_write()
From: Michael Roth <michael.roth@amd.com>
CC: Richard Henderson <richard.henderson@linaro.org>, Sven Schnelle
 <svens@stackframe.org>, <qemu-stable@nongnu.org>, Gerd Hoffmann
 <kraxel@redhat.com>
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
	"Philippe Mathieu-Daudé" <f4bug@amsat.org>, Riku Voipio
	<riku.voipio@iki.fi>, <qemu-devel@nongnu.org>
Date: Thu, 14 Oct 2021 15:48:33 -0500
Message-ID: <163424451319.2158.17281639845866547751@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bfed014-ccf5-454b-9a53-08d98f6ab095
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2554:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2554DD0D0F175C914637D8B895B89@DM5PR1201MB2554.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IaLZG4gaqAdDFCSZmA612OoG995+9+LTbNCnvmtoa0BGJVtyQGuyqYTjIPmLsNJxrwSrDZKBhRl030yY+yFKMJKUJOMsHBacbnSIR3A/jueY1gI2Pw6bbPhD0iBIYhXgufn0eSVFeIW9a3F/yS0fWXXAc2cgWVGFRQNyALUM2Sy7B24V6UrbL67PNXZL4pEis+D2PSLfBcEiM/LZ1BOgcIa/1119qmZMwiW03Ilblwejxj3g20/rn9VBDNnhMV/8qoBolDle3fHvO4U12kPswKuD/Dhz9L5n3hh5qYAIUj2hhMrK3egL7cR+Pe1Gt2dbFiSFdBTxoip2RvWE4zPnTWrbuZBL5MjZet4TvGSBCQfkt94WorWw71nqpgge9IIGr+Aw/sn1QqqF7ABX+Gl58278MCE5tlhzkwEaovFyzje22v5zu8pspfiWMaAwiGX9H11G8m/Glb+skTRYDlbKhb/In4Vb11v3wxgEmSxcPXc/rm7kaD6WavRQIU6C3IlPgUbBnXIIdghMJs2kG+eWBW0yAxnrHLvM4DB2KyqE53R04I1NBmh8BE0PjHbvgpCA642KAsjUxHIHjzICWUETXypbLjBuk+vjdrvT0IZZXybCaYk4pQMqyWx/6xCTSWBacEHV2yK3iVHKTAga52oov4r8FdeIAgX+pvB7G/Ao1T/ELieeZ0JNu6+BjEHmVwnkgSncG82eq7GyGCrWOQlEdrQ7kav6ilNKAYChFgIN//M=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(356005)(81166007)(110136005)(36756003)(44832011)(70206006)(8676002)(316002)(5660300002)(86362001)(186003)(16526019)(70586007)(47076005)(26005)(83380400001)(53546011)(82310400003)(54906003)(6666004)(36860700001)(426003)(336012)(4326008)(2616005)(8936002)(508600001)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 23:31:03.9966 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bfed014-ccf5-454b-9a53-08d98f6ab095
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2554
Received-SPF: softfail client-ip=40.107.223.55;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Quoting Philippe Mathieu-Daud=C3=A9 (2021-05-26 02:30:19)
> On 5/25/21 10:12 PM, Helge Deller wrote:
> > The CDE desktop on HP-UX 10 shows wrongly rendered pixels when the loca=
l screen
> > menu is closed. This bug was introduced by commit c7050f3f167b
> > ("hw/display/artist: Refactor x/y coordination extraction") which conve=
rted the
> > coordinate extraction in artist_vram_read() and artist_vram_write() to =
use the
> > ADDR_TO_X and ADDR_TO_Y macros, but forgot to right-shift the address b=
y 2 as
> > it was done before.
> >=20
> > Signed-off-by: Helge Deller <deller@gmx.de>
> > Fixes: c7050f3f167b ("hw/display/artist: Refactor x/y coordination extr=
action")
> > Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Cc: Richard Henderson <richard.henderson@linaro.org>
> > Cc: Sven Schnelle <svens@stackframe.org>
> >=20
> > ---
> > v2: Fix artist_vram_write() too, noticed by Philippe Mathieu-Daud=C3=A9
> >=20
> > diff --git a/hw/display/artist.c b/hw/display/artist.c
> > index ed0e637f25..8758c77bbf 100644
> > --- a/hw/display/artist.c
> > +++ b/hw/display/artist.c
> > @@ -1171,8 +1171,8 @@ static void artist_vram_write(void *opaque, hwadd=
r addr, uint64_t val,
> >      }
> >=20
> >      buf =3D vram_write_buffer(s);
> > -    posy =3D ADDR_TO_Y(addr);
> > -    posx =3D ADDR_TO_X(addr);
> > +    posy =3D ADDR_TO_Y(addr >> 2);
> > +    posx =3D ADDR_TO_X(addr >> 2);
> >=20
> >      if (!buf->size) {
> >          return;
> > @@ -1233,8 +1233,8 @@ static uint64_t artist_vram_read(void *opaque, hw=
addr addr, unsigned size)
> >          return 0;
> >      }
> >=20
> > -    posy =3D ADDR_TO_Y(addr);
> > -    posx =3D ADDR_TO_X(addr);
> > +    posy =3D ADDR_TO_Y(addr >> 2);
> > +    posx =3D ADDR_TO_X(addr >> 2);
> >=20
> >      if (posy > buf->height || posx > buf->width) {
> >          return 0;
> >=20
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20

Ping. Looking to include for v6.0.1/v6.1.1 as well.

