Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E376AFD36
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 04:03:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZk41-00055b-8w; Tue, 07 Mar 2023 22:02:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pZk3v-00055H-P1; Tue, 07 Mar 2023 22:01:55 -0500
Received: from mail-co1nam11on2060a.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::60a]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pZk3t-0006eE-6v; Tue, 07 Mar 2023 22:01:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8VQKO6oZPrQ7ru6sZglm1ZD9l6yRsi3VzKEDIAkGSWhCgALXSU1Y5VeQSbLi05tlxSaZ/Mvs853ZFXAotprCEfkqrPsOXuVa3FOPnS+rDGz2BcVCQg8KHx1Wtmaq7pjjkNFwTtSb0iqlDL5P1HjdqR0ywifBwu2E34CioNYj0530AZtiwHDswdauiqOl7fcKvE6PzZFDJhktHriIT2fWU1GFHlmp/aSMdtfKv2PIbP3TEi/fjquV1BRmsS0YrKA7kbMe8q5jzWdwds0nZm6+RJ22AYCWLZO8ugiyuSyYQ8ONBFHQbTB8GJVtLM5IW0iIN/e0E2J4rB3LL7gK4VHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9G82t7dqU8g6XYd7viFksvVV9teDOC872cBwv3MWr9Q=;
 b=ZzPqHG9EsgivZJH3CV+tQS1vHL1xznQecZHjCqqI9FQS/e3nAuP+HtNPj6U1xFRqXsiEwobRei9meIVKq+FRNBSnV2gKP2bhyZI00rwmk5yikb6fGV/eVG9Ho3WPaWf+/9TDvQz+3m09PhscOa7S3QYo34X35NBaHTwM+77tN23vogpJwnkEx1jFKv4t2880IZ8w1a43WFkq9mNYp+NHJkfXfypelikBbE3+e6Mk/Z59S1tE+ufUNM+5Ws1qDDURmWpHXXvzplubDWXI0dsONKr6vcc6UZUIVuUnmLo4x2IHIdYF3FLVnWFd/k+UMPSafT/GycbE7rIx4iijgnb4Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=tls.msk.ru smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9G82t7dqU8g6XYd7viFksvVV9teDOC872cBwv3MWr9Q=;
 b=Dx2dQ013og7ah2NBuSIaNq/3Q5snxqLs/g0GKWfSqtoaqND4sosei45qYqK3/NlAYjKC7guNTkvTbuhRf1yd+wqqPFVzy9fgz6LSsDxAJS3syaBLSlf/nXiw0MUoDnQozdGXT9cOVVfb6djDRsRUP7sDZm4z/AHqnV0HntLI0io=
Received: from MW4PR04CA0192.namprd04.prod.outlook.com (2603:10b6:303:86::17)
 by SA0PR12MB7076.namprd12.prod.outlook.com (2603:10b6:806:2d5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 8 Mar
 2023 03:01:43 +0000
Received: from CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::9b) by MW4PR04CA0192.outlook.office365.com
 (2603:10b6:303:86::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17 via Frontend
 Transport; Wed, 8 Mar 2023 03:01:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT013.mail.protection.outlook.com (10.13.174.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.18 via Frontend Transport; Wed, 8 Mar 2023 03:01:42 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 21:01:39 -0600
Date: Tue, 7 Mar 2023 20:59:23 -0600
To: Michael Tokarev <mjt@tls.msk.ru>
CC: QEMU Developers <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, <qemu-stable@nongnu.org>, Thomas Huth
 <thuth@redhat.com>
Subject: Re: stable releases
Message-ID: <20230308025923.5j3yfyke7codvgp7@amd.com>
References: <69963eba-d001-150c-71d4-b2b23bfed4d1@msgid.tls.msk.ru>
 <0d2a9e13-850e-d140-d63e-a940148bdccc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d2a9e13-850e-d140-d63e-a940148bdccc@redhat.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT013:EE_|SA0PR12MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: 203b2976-4640-463d-a082-08db1f8171ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mMgaaUOF2U3B5oD0U3FFG3yox7DtiHpwWCUoOF9RXVU4AKNSwhuV7VyLmvQthgYYcvPsf7HiHyVqxP5Pb+Hm3jERCrfmI38nenHkZjENoYxluhABvt5a6TwPxtQ+rY9Izjpx6X9oZLdsZaDGYnAvwZH9Ah1iDQHWBtgwLlO7q9YWrDjquZqZkh2qiXVyF1a2+tdObsfWudXNd5ooHd3eD19MacGXXyOWwiIDL9gRS8FmukzDw99RJk9+cxTNyc8ex9Y1u9XBO/3BRzWNVbC+khKyaFBtyeyev+xtGZeIMgKDNe5hjsaTD4mPm5SJEtydre1KMfq3vV3X7Efy/UsvU1YV/KI11HlnTqRVMe5Y82O6X0zLDMYEJwFW8NdmKyUwp2RcCFqpox488CmsMXXV4Ma5DUt0C+e5NTkUe+BKjwJDf7ehKwTShOV8l/RF1kyP6pmYwxzqm+BzTcAwcgZClXNyGBKcA6AYbyoVtTVBdDtsWc2jtDknkKwcpvBFVLnkKEiYLGK9voOuVSi7g3rZ+XkJJ0ZKM9yjXwdtd4yztgC28yRrVejfwZGaflrWMIJD/szIbnOc3x5KVc8NQ0eWyzKsJteSinWNVt97v5KxSzI2c0VrA4lNB5goFNrU1LzZDqagKIK/FaGyB9cqdl3hUSlhbTMzT6xemXZfBRG0xDUsdF0mFzLmCFSeNuy/JTvcRFHz/YMA7mkgipVlzlmM8a4GPpVnLySpOh3cnPy4Pmo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199018)(40470700004)(46966006)(36840700001)(3480700007)(86362001)(81166007)(36860700001)(8676002)(70206006)(356005)(36756003)(4326008)(2906002)(7116003)(82740400003)(1076003)(5660300002)(6916009)(41300700001)(70586007)(44832011)(8936002)(40480700001)(82310400005)(47076005)(16526019)(2616005)(186003)(26005)(336012)(40460700003)(66574015)(426003)(83380400001)(54906003)(6666004)(478600001)(316002)(66899018)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 03:01:42.2104 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 203b2976-4640-463d-a082-08db1f8171ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7076
Received-SPF: softfail client-ip=2a01:111:f400:7eab::60a;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Michael Roth <michael.roth@amd.com>
From:  Michael Roth via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Mar 06, 2023 at 09:57:58AM +0100, Thomas Huth wrote:
> On 05/03/2023 11.27, Michael Tokarev wrote:
> > Hi!
> > 
> > For a few qemu major releases already, we did not have any stable minor
> > releases.
> > I'd love to change that, in order to consolidate efforts and to make better
> > software in the end.  But I need some (hopefully minor) help here.
> > 
> > I collected changes from qemu/master which apparently should go to -stable.
> > Published at git://isrv.corpit.ru/qemu.git , branch stable-7.2-staging
> > (probably should publish it on github or gitlab).
> > This contains stuff which I use on Debian in qemu package, which is based
> > on 7.2 version now.  The last 18 patches are not in Debian package yet,
> > going to push it today or tomorrow.
> > 
> > If nothing, this can be used as a base for actual 7.2.1 stable release,
> > maybe with more changes added (or some changes removed).
> > 
> > The help which I need is to be able to run some wider testing. Debian is
> > a relatively good testbed, and it is used by qemu already in terms of
> > bullseye-backports to run other tests, so it should be good, but I'd
> > love to have wider coverage still. Maybe some CI stuff which qemu has
> > for master, if not only just before actual release.

Hi Michael,

Thank you for offering to help with the stable releases. I think it
would be in great hands and am happy to help in any way with getting
things going there.

I totally agree on Thomas' suggestions for next steps, and tried to
list out whatever else came to mind regarding stable releases in
general (sorry if things get a bit rambly).

> 
> I'd suggest to get a gitlab.com account, and fork the qemu repository there.
> Then you can run the CI on your own by pushing your patch to your forked
> repository.
> 
> You can also get some test additional coverage by running the avocado tests
> with "make check-avocado" ... but beware that this downloads quite some
> hundreds of MBs from the internet. And some tests are known to fail, so it's
> maybe best to run them on the plain 7.2.0 tag first to see what works for
> you and what does not work properly.

As far as testing, I think some other good tests/areas to consider eventually
adding would be:

  - qemu-iotests
  - VFIO/PCI passthrough tests of some sort if possible
  - live migration tests (especially things like 7.2.1 <-> 7.2.0
    migration compatibility to allow for rolling out/back live upgrades and
    things of that sort)
  - Windows guests

> 
> > And as usual, this needs help in picking up changes which should go to
> > stable. But this is something which is always needed anyway.
> > 
> > Let's resurrect qemu-stable :)

The "current" stable process is documented at docs/devel/stable-process.rst
As written, 7.2 support would end when 7.3/8.0 is released, and then
8.0.1 would be the next stable release afterward, but maybe there are more
optimal ways to integrate/schedule things in your case so don't feel
tied this approach.

As far as this release goes I'd recommend going ahead and getting your
stable-7.2-staging tree rebased on 7.2.0, along with whatever other patches
you think should definitely be included. For me this would include all CVE
fixes that went in after 7.2.0, and any patches tagged Cc:qemu-stable or
forwarded to qemu-stable mailing list. But that's another area to decide on
how you want to handle things. Maybe in some cases some important fixes
are better to get out sooner rather than trying to make every release
"complete".

I'd usually then post the staging tree to the mailing list to see if
there were any more candidates, which I think has pretty much always
identified more commits to pull in and proven worthwhile; but probably
depends on how frequently you cut releases. Maybe it makes sense to not
even do tagged releases, and just have a rolling stable tree? Things to
consider.

Ideally you'd be able to eventually push trees to the official QEMU repo
like I've done in the past. You'll need to work with the gitlab project
maintainers on that. But if you need to host/tag them in your own repo
until then that would probably be fine. Will want some way to
communicate this to QEMU community though, and official git repo is
probably the best way. I can also push your tree/tags as interim solution.

Will also need to figure out how to handle uploading tarballs (assuming
you still intend on distributing release tarballs). I can upload them
in the meantime, but we will probably want to work with Paolo getting
you access.

If there's anything else I can help with please let me know.

Thanks,

Mike

> 
> Please make sure to CC: qemu-stable and Michael Roth - I hope he can give
> some directions for this effort.
> 
>  Thomas
> 

