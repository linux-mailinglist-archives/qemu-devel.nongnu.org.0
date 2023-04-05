Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1EA6D894A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 23:08:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkAMF-0000HD-4u; Wed, 05 Apr 2023 17:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pkAM8-0000CB-Dq; Wed, 05 Apr 2023 17:07:48 -0400
Received: from mail-sn1nam02on2062e.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::62e]
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pkALx-0003l8-Mm; Wed, 05 Apr 2023 17:07:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJxVB+bntSF8pzqIw5ttyZh6ff5A5mKE+5m0tEzLdKW3i5I3dWnDw0mC0XKFzCYeXaeRy7MPxERoX9s9rPKlSKdQWyAtWGJSwZIXR07tJeXFF4ifY35ac4UHMgbywdlNmQdnaOwPzs5qoU0p9DasNCznsNtHWT+phRcvOlUS15UQw1obdZg5zApZhjRDCHpjdNxwlebr6cG5zj5a5Iva83xFpDAO9mZfQvV9Mz14bW1CZ8UqJxCmMkvSzzsr47dQCXR2DTwCdlwK1Glajx1hLODQaoFvmgAfKPF+sUGGTXHSni7Ko5T586m1ZfaZYdM5Mqjd+kkfpMTX0YT+8wOJbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSo2KcDlX7gprSquWrMqXjvg73+gC2Yv1HsPqrVtaJQ=;
 b=bSlD3U7w4sEkHAZnbGLtFCHflLCPhWIf0vOxu9YVR1rf2tln0K25qjZybAt7dhfnnu+8dOQobrXwqxxKXtIm+cjLxfWBagIXdwQryD03m67ETBLzVVzDYy4EEctLh9+NHJIxcnNdeKZ4WcjZueV3J8b1NJfSPJVWsNa8hmUmidZPdLSz5LBSVo7TFqfd/FMMjE+91DYa0TaIs2sSaZZ2jRahiO9zIscSGQ22iL9cpCU8lBWcuFzNcsTeGgo6BwJinbxiMYz1IbIcp6ObR4cvM1CCQSVK2liph/D34iy7z4L8nXt8p5znerTT8O89klV+nC66yXbBnjGyUTwt3DHAcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=tls.msk.ru smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSo2KcDlX7gprSquWrMqXjvg73+gC2Yv1HsPqrVtaJQ=;
 b=RqMt6RgnMXCk/l1Zv9Piw+8sVc7Jo6CHUUn+ZpV0V1Fb6IcCPoWWwlGPgo6oA6bVe6lg2AHYHe/EU0HOYGjpHz5mZl65qdRcml+4EGpqZpbusvMn6D9ejlnztEvb97kyTzQNMt4bd19d0DtxfvMVtvuYnQ47xaqrL/8pFhZd1Xk=
Received: from BN9P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::32)
 by DM6PR12MB4465.namprd12.prod.outlook.com (2603:10b6:5:28f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 21:07:30 +0000
Received: from BN8NAM11FT105.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::15) by BN9P221CA0020.outlook.office365.com
 (2603:10b6:408:10a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.43 via Frontend
 Transport; Wed, 5 Apr 2023 21:07:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT105.mail.protection.outlook.com (10.13.176.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.30 via Frontend Transport; Wed, 5 Apr 2023 21:07:29 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 5 Apr
 2023 16:07:25 -0500
Date: Wed, 5 Apr 2023 16:06:58 -0500
From: Michael Roth <michael.roth@amd.com>
To: Michael Tokarev <mjt@tls.msk.ru>
CC: QEMU Developers <qemu-devel@nongnu.org>, qemu-stable
 <qemu-stable@nongnu.org>
Subject: Re: QEMU stable 7.2.1
Message-ID: <20230405210658.yg2i6grklgqp73rr@amd.com>
References: <62db7253-9cd7-e095-6b9f-ffcdecfa9bf6@msgid.tls.msk.ru>
 <20230405135818.52ggpbvumybryvr7@amd.com>
 <ce3bbb93-2534-e2bc-ece5-8bc4e2943bb8@msgid.tls.msk.ru>
 <20230405185720.2yxd52njk3tcsauk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230405185720.2yxd52njk3tcsauk@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT105:EE_|DM6PR12MB4465:EE_
X-MS-Office365-Filtering-Correlation-Id: d3680d8b-8eeb-4c2b-1417-08db3619c3f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tDiTk/0zDoIrFQuRgqhqONUVkRVrXBtz2AziWCudP9yhFjjfItsjCXezrLZqhNarenSYn/kqlL+Nv4/fPDHeXY5v9CUBiNn9VC5I50ZjUUtGV+DpdSNzkoor2jDlQ/NuW4gktiAW6xtytR29k7N5aVkZCSdFRZQLSn0gLD557PwtLCrtsBBG8yjGhwsjtAfyrO68PDN/77QttJifO+dA3eXHQVXZO4kvBgmWYGlmV9Auk8bgZdTERmTv2VWCu0d5gaX6v5A4yROlqR0KeGG/MlE4jh6BCgHEmmk7vrG8kmV54ivRIDYt3pYMOhwMpM3UIg6og7b160zUtB2mLGlH2c967a7aV0/ZniYLcc8mg7laq9/eed3Bkt8airaspGcxs752CXnvXF4Ndu3hmepnE/qCQmdAtX6mUpjxtaqeF7wl/KnjEXUkhk8lGdDK2znb7DyzrGqX39PvGMWsWLsvt+3ku4yGmEHH5Dvtl4/yTVBRYbjiGiX6C1i8KZWbkmYlB68xrmGi33/ZYf6zbsFr15csGfzfghHJI1QAo1McNXd1lI3BYad+MrtA+tlRBnSB73bvYfCiOnOA2RyU7pqPBd8RWA7Oi3vyAYNNt33l7af2FiCiTIFIxyC8hc6eYa3kDa8akK22/soe5DTL9bzJ+epXChzgftD9EoRIy+WYRhACvWvFbCe1n74KKIHM7ZxFWKklovYj6LcddpGPUvXeLESGqVEc/2n34YufdBR/Oco=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199021)(36840700001)(46966006)(40470700004)(70586007)(6916009)(44832011)(8676002)(4326008)(70206006)(54906003)(186003)(316002)(5660300002)(41300700001)(478600001)(7116003)(8936002)(966005)(2906002)(6666004)(356005)(16526019)(40460700003)(1076003)(26005)(81166007)(2616005)(336012)(426003)(83380400001)(47076005)(36756003)(40480700001)(82740400003)(36860700001)(86362001)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 21:07:29.2380 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3680d8b-8eeb-4c2b-1417-08db3619c3f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT105.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4465
Received-SPF: softfail client-ip=2a01:111:f400:7ea9::62e;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

On Wed, Apr 05, 2023 at 01:57:20PM -0500, Michael Roth wrote:
> On Wed, Apr 05, 2023 at 05:16:33PM +0300, Michael Tokarev wrote:
> > 05.04.2023 16:58, Michael Roth wrote:
> > > On Wed, Apr 05, 2023 at 02:54:47PM +0300, Michael Tokarev wrote:
> > > > So let it be, with a delay of about a week.
> > > > 
> > > > Since no one from the qemu team replied to my final-release steps, I'm
> > > > making it available on my site instead:
> > > > 
> > > >    http://www.corpit.ru/mjt/qemu/qemu-7.2.1.tar.xz
> > > >    http://www.corpit.ru/mjt/qemu/qemu-7.2.1.tar.xz.sig - signed with my GPG key
> > > >    http://www.corpit.ru/mjt/qemu/qemu-7.2.1.diff - whole difference from 7.2.0.
> > > > 
> > > > The tag (v7.2.1) is in the main qemu repository.
> > > 
> > 
> > For the tarballs, it's definitely better to follow the established practice,
> > I published the generated tarball on my site just as a last-resort, so that
> > it ends up *somewhere*. It should be prepared the same way as other releases
> > has been made, including the .bz2 version.
> > 
> > If that's okay with you, feel free to re-create the tarball from v7.2.1
> > tag, and compress the tarball with whatever compressors usually used by
> > the qemu team.  It's the way to go.
> 
> Ok, sure, I'll go ahead and re-publish 7.2.1 tarball a bit later today.

Re-packaged tarball based on your 7.2.1 tag is now uploaded:

  https://www.qemu.org/download/

-Mike

> 
> We can stick with this approach until you're all set up for uploading.
> 
> -Mike
> 
> > 
> > Thanks,
> > 
> > /mjt
> > 

