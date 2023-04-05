Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060F46D866B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 20:58:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk8KQ-000729-AB; Wed, 05 Apr 2023 14:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pk8KO-00071t-6e; Wed, 05 Apr 2023 14:57:52 -0400
Received: from mail-co1nam11on20606.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::606]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pk8KM-00009N-6D; Wed, 05 Apr 2023 14:57:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtHyJOXfE7yOe0sBCDTsUhPEPLZffQlEEAoOPisxvMO7PXadDH1xPRCLSkD2woL3p7ewouFYqd1CL9QIvTdIK90xH9wl8GTexJIs9tw7jAKVyLMJtiKU+yFvsBQpb8goH1Gd6fTtcRuctJAepcYfMsvnxEpoYs69/xYPVvAqjYLG9tpyX1zg+cJEPSBmdFp53fpSUjLtV+zK14+9yakSi3tkjd4DLWCto8w4VZv65Xrli9VyFTrCktz1g/DIOphCf29Vncol4Z0OinATnasYslk3+wEZ/UEj21DuYYqkYnGBiA11UH2VOK+reDAzRH05hUMlNLdRwjNaqR+abSq7bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdaleJc5jnxtKyf9mJPAGjSnvJQAz88+a/0sNhOO7a0=;
 b=Pd10OvKQbbB57Z8QEPu3RMJDdMIYXpK3dKgpnROYx5wbo+Ys1HbiXZDs/xlkwZ4U9uzjonHegqxwq/Mxlq401mApEyiPNeIXtL70xEMzdQD8ZMfnjWw4I7Sw1P4ThO491GdKQFQkX0ZCYtGALcX+ebJk7YL8OuitYgnvIVQ1AKlryMNTvxLy8k/dQNF5tK4ZkRcH1McSwJR9pUTYosWyloEGONFeQhkEdt/JzJ8oVktakOGR7X5NGCtM9S1uaADXDz74jnG/LCaoeFqjSa9BQLTZ+7OUswgQ8vg7lSMp/nHGLhf2ORcW9bEokJbJ+N/uWSl5HKLR6X+i9P9tGLBEJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=tls.msk.ru smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdaleJc5jnxtKyf9mJPAGjSnvJQAz88+a/0sNhOO7a0=;
 b=wdRvcs8EzF75rbUUIu3kndUey150jEN9kNMi4xBm8DTBcfHQ7N5hVNtmRAf30aKeQ/zw7UkVeUCD0qc4yw6sjNfHQCjdXz5B3a/n8JPV080ww5+MuwrHh2V7ubTsMuXPzr3MFi3U9AHC8sYQvRBdZcH8v54e4UfLpMReMysOS2w=
Received: from BN0PR07CA0027.namprd07.prod.outlook.com (2603:10b6:408:141::29)
 by PH7PR12MB5902.namprd12.prod.outlook.com (2603:10b6:510:1d6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Wed, 5 Apr
 2023 18:57:39 +0000
Received: from BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::76) by BN0PR07CA0027.outlook.office365.com
 (2603:10b6:408:141::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20 via Frontend
 Transport; Wed, 5 Apr 2023 18:57:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT094.mail.protection.outlook.com (10.13.176.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.30 via Frontend Transport; Wed, 5 Apr 2023 18:57:38 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 5 Apr
 2023 13:57:36 -0500
Date: Wed, 5 Apr 2023 13:57:20 -0500
From: Michael Roth <michael.roth@amd.com>
To: Michael Tokarev <mjt@tls.msk.ru>
CC: QEMU Developers <qemu-devel@nongnu.org>, qemu-stable
 <qemu-stable@nongnu.org>
Subject: Re: QEMU stable 7.2.1
Message-ID: <20230405185720.2yxd52njk3tcsauk@amd.com>
References: <62db7253-9cd7-e095-6b9f-ffcdecfa9bf6@msgid.tls.msk.ru>
 <20230405135818.52ggpbvumybryvr7@amd.com>
 <ce3bbb93-2534-e2bc-ece5-8bc4e2943bb8@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ce3bbb93-2534-e2bc-ece5-8bc4e2943bb8@msgid.tls.msk.ru>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT094:EE_|PH7PR12MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: a600e3d8-c528-4dec-b158-08db3607a049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BJeFuWfRdPs84lmw2IrxzKGv78VPQH/cjcAL2+F9D46IbmDkVJH63e+01beRm6pnwSb3O3lX0USoA3sDKmdxD9gQGkBA06e3JWPG2lVaaXZwg+dwcHs61CRcywyxfsojzY8YWI/yKLZcAcjU66oQQZ+TmmIM+MNKO7YynfH0dY9A7NZu7kkP3+ZqljqtppoUN4s/tPa9cdWhxXtYqXlihZm3oQRWWNB1Fs3xvIUsmS7etUVPBWZFZI9JLHvIabwrM9b95UqCYbviG8DP/wYI4ozedYjatqLsQoEwOOcsJsZmzpNEjk8DEA/R+VBlJ2K5F2Kz+fV4MD0U0LFIvjx5tTV+65DWcMsjXR0wufV04WmF57zowVQdPKyP28jmAy1YVPMQWDTQ7YkyiAC/LQwcNsbYEXEmGhpS+XM8wjzluKC64PDMPouQtzRZaF0zMBitNLZCE8nJ33kE44FkLwPXlW0RlJu2A1L3R7yPnzFu/TiZcc3tMz5JUKW79AZE4GwryU4oMoHb9rRG3VHvNgvkPBPz0TZ7Fn4/xA72vr2bqpBVHuCLXhc72UGFpSxiqCZ9Co8sDkQNb1ZMWaWsSTyjFKf6w0iODR9a3HM0kzlKxkVBpNVXoThOy5bjuN2nIJrOGVhGIjuq63TjDYQyQJTDyQ2Vpbci4sFuHwn1aIbS58o2tVZZyqJdKwaRi2KlJeyDzTcncDOy7WwG7tbcRA88CBNyHSoRd5qlw9yBRjVMVpI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(36840700001)(40470700004)(46966006)(6666004)(478600001)(86362001)(40480700001)(83380400001)(47076005)(36756003)(40460700003)(356005)(82740400003)(81166007)(36860700001)(426003)(336012)(2616005)(966005)(44832011)(2906002)(54906003)(316002)(16526019)(186003)(1076003)(26005)(5660300002)(7116003)(6916009)(4326008)(8936002)(8676002)(82310400005)(41300700001)(70586007)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 18:57:38.4443 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a600e3d8-c528-4dec-b158-08db3607a049
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5902
Received-SPF: softfail client-ip=2a01:111:f400:7eab::606;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

On Wed, Apr 05, 2023 at 05:16:33PM +0300, Michael Tokarev wrote:
> 05.04.2023 16:58, Michael Roth wrote:
> > On Wed, Apr 05, 2023 at 02:54:47PM +0300, Michael Tokarev wrote:
> > > So let it be, with a delay of about a week.
> > > 
> > > Since no one from the qemu team replied to my final-release steps, I'm
> > > making it available on my site instead:
> > > 
> > >    http://www.corpit.ru/mjt/qemu/qemu-7.2.1.tar.xz
> > >    http://www.corpit.ru/mjt/qemu/qemu-7.2.1.tar.xz.sig - signed with my GPG key
> > >    http://www.corpit.ru/mjt/qemu/qemu-7.2.1.diff - whole difference from 7.2.0.
> > > 
> > > The tag (v7.2.1) is in the main qemu repository.
> > 
> > Hi Michael,
> > 
> > Thanks for handling this release!
> > 
> > Somehow I missed your final steps email, but for future releases I would
> > recommend going ahead and tagging your release (also signed with your GPG
> > key) in your local tree once you've got everything ready, and then sending
> > me an email to directly so I can push that to gitlab and then handle
> > creating the tarball and publish it with my GPG key. That's basically what
> > we do for the normal QEMU releases as well.
> > 
> > Then once you get your accounts set up by gitlab/qemu.org admins you can
> > handle the tag-pushing/tarball-uploading on your end. Would be good to
> > have someone else involved with that process so we have some redundancy
> > just in case.
> 
> Thank you for the reply!
> 
> I'm not sure I follow you here. I already pushed v7.2.1 tag and stable-7.2
> branch to gitlab/qemu. The branch has been there for quite some time.

Oh! Nice, didn't realize you were set up there already. Just noticed the
7.2.1 tag when pulling down 8.0.0-rc3.

That also helped me notice that your reply here got quarantined by my email
server, along with a number of your previous emails relating to stable, so
that explains how those slipped by (the ones that hit the mailing list
still show up if I'm looking in the right place).

I'll keep a better eye out for this in the future and try to reach an
understanding with this advanced AI technology that treats straight-forward
direct replies to my emails as spam for inexplicable reasons.

> 
> Should I avoid tagging/pushing for the future or is it okay to do that?

Nope, that's fine. Just ignore my comments regarding git, everything seems
to be good on that end.

One thing I forgot to mention previously is updating the wiki with the
release schedule once you have an idea of when you plan to push your tags.
E.g.:

  https://wiki.qemu.org/Planning/7.2

I usually set the date once I have the initial staging ready and get
ready to send out the "patch round-up" with expected freeze/release
dates. Might be good to email me directly or Cc: me on related
announcements around that time so I can make sure I'm around.

> 
> For the tarballs, it's definitely better to follow the established practice,
> I published the generated tarball on my site just as a last-resort, so that
> it ends up *somewhere*. It should be prepared the same way as other releases
> has been made, including the .bz2 version.
> 
> If that's okay with you, feel free to re-create the tarball from v7.2.1
> tag, and compress the tarball with whatever compressors usually used by
> the qemu team.  It's the way to go.

Ok, sure, I'll go ahead and re-publish 7.2.1 tarball a bit later today.

We can stick with this approach until you're all set up for uploading.

-Mike

> 
> Thanks,
> 
> /mjt
> 

