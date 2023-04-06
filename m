Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414356D9BD8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 17:09:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkREE-0000Z9-0N; Thu, 06 Apr 2023 11:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pkREA-0000YZ-LR; Thu, 06 Apr 2023 11:08:42 -0400
Received: from mail-co1nam11on2075.outbound.protection.outlook.com
 ([40.107.220.75] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1pkRE7-0001Qh-2O; Thu, 06 Apr 2023 11:08:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwaajSuwNg9o7+eqhB4uBV69o/JStONK1RH1JAsLo4qib3AbgFS4z/rMwo5N/38S1l398uLqPT+7YZ7InA56GoWUdpPpcEmmyVAaWQVOXFA2uF9WVeFROYblfNs3b6l/ciC4Ek0q5TsDfrFvWAuEKM8Slbc6rFlY/rgrnp46i8sEOr/BDhSNjDR+X5rFwDFl3WhFHzQFL6/t7dbpUcV6mundmQGkJrz2zx1hyvxayb/NNOByWSIxDyhfdpXYMPrQv67VarrNxtaccxtoY6nXJwDeGZMzMH776DR/1qCERY+6fOGlKkwjrGyZJ6FZXnjBj1aXTbM6CxVv4vAzs4Zt7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+A/3/VSYxjMV3wilta0zKPjzuAMPm59wvHN5U03NJo=;
 b=i28VC+ac+BWI2tkGp+vMhhF576O3pA7X5MfJR4FitHFL1H/yjcEc/BhdTQASun6gk8OOqKSrula2llfFaxu3P9XCmear4DCewuTfzMotAc1UaCmbcgAVLTeVWjzlAHnTSANb7DQFF4OpFEMJ8151YxxEaINxbIk5/OYL9mjEK33jrxyDL+tpcQA7EPmWwLzFRk5CbknRUu7TFPXb1a8x2vi+z5lMMciy0RNrwn2mB9yCaGFKBV9pqTchWR4jJ2tYpjt1Opm6pfIw3XVNU1/z3QdA76hfENUoRo+T87UNw6m662uJrWkRGdIU98tp3NsoulzYBZu3n4blOa87O0i3oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+A/3/VSYxjMV3wilta0zKPjzuAMPm59wvHN5U03NJo=;
 b=HXW+9rqCt1dMfHXUjroF5jUyWEyzZF5FeFqG6t71YOWAzL46dn1yHj7F45ZlgOczgzCztbZMEaKbKO0bFLMOC+y3xzFgn2ESJ3KXWYH7E45FYn4nIB5AcmU77iyfqZFBzsfaSytGOKQjJwslbiQUyLtVHYT9hbwus69lBss/5pk=
Received: from DM6PR21CA0010.namprd21.prod.outlook.com (2603:10b6:5:174::20)
 by MN2PR12MB4334.namprd12.prod.outlook.com (2603:10b6:208:1d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 15:03:28 +0000
Received: from DM6NAM11FT091.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::16) by DM6PR21CA0010.outlook.office365.com
 (2603:10b6:5:174::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.16 via Frontend
 Transport; Thu, 6 Apr 2023 15:03:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT091.mail.protection.outlook.com (10.13.173.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.30 via Frontend Transport; Thu, 6 Apr 2023 15:03:28 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 6 Apr
 2023 10:03:27 -0500
Date: Thu, 6 Apr 2023 09:32:37 -0500
From: Michael Roth <michael.roth@amd.com>
To: Thomas Huth <thuth@redhat.com>
CC: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>, 
 qemu-stable <qemu-stable@nongnu.org>
Subject: Re: QEMU stable 7.2.1
Message-ID: <20230406143237.e6pc2g2zahwsw34j@amd.com>
References: <62db7253-9cd7-e095-6b9f-ffcdecfa9bf6@msgid.tls.msk.ru>
 <20230405135818.52ggpbvumybryvr7@amd.com>
 <ce3bbb93-2534-e2bc-ece5-8bc4e2943bb8@msgid.tls.msk.ru>
 <20230405185720.2yxd52njk3tcsauk@amd.com>
 <20230405210658.yg2i6grklgqp73rr@amd.com>
 <9d2a753d-0b50-8fa4-2a71-590fd5ffd22f@msgid.tls.msk.ru>
 <734b7b91-0305-1358-15f4-f63d7d272e7f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <734b7b91-0305-1358-15f4-f63d7d272e7f@redhat.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT091:EE_|MN2PR12MB4334:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f8cc5c9-7817-4df6-fcd8-08db36b0144b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LMWFQdumScOuLiMPIAGaVRRwam/8Jo2Ud282GOXsFoLVRzOvKEat/nInMD4m8YfXv6fqJxr29oo2nZVp72xgjGXgCrRjhWMw/j6F5gdLdjF9KmCCbAGQTk0s51iCH1L6+YfGIrUtgOH5GZHa+If5A6k8erUKFCh+0kWGIjnDD0qEXZvCACZz0bg78talalhPexHjLqsT82pgokkTdRLKiugnDcae44ZO5ZKImx/gHRkjxt9As/czb7gfdJn+mn1dVycyvi4Y/I9I+vT34QX82vtsH5aPtFmOScJuD6bN5OolrBYY8QE/8XANQVLtqNy9JaU7Bxew1q9s7eYRJGsnM4c0JuxID85lwo027+jwAF56CH0KDtcVQ39IHxokV/gXjTqGNZI6kxTlMFBUjFoYW93l4MwJXziEHBpBvMEIStyyEAa66w4O57Xp6K4Uv8/qXicW7CmKBnf2du1fNtmq2U/yqFg3R0bDsNno5fQU7VyTPgWv2jgj4PzJHL8wS/9wxWbV9zDlMIYyYz215WwKwpe5MmIs0IwZJC0+SJP3rfjyE2ueTV603JCjVtHY0Pmr3JHxieBYi7lKox8zWhtq6OfDc1qd9mHtKFFJ4mqEjsoTbyEafO7j/+rvMHmiQ09lP02/agZIYtlnIhdcHCdBHHtMuJYXAcpEBzEdVzvovvaRmUyglUHeKklYbekugmClA8aURKxqjMItW6ShNuEjYQ5MdXrT7YbZ/FGLeB78uFs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(36756003)(4744005)(2906002)(44832011)(5660300002)(82310400005)(40480700001)(8936002)(70586007)(81166007)(4326008)(8676002)(41300700001)(86362001)(70206006)(82740400003)(6916009)(7116003)(356005)(966005)(47076005)(83380400001)(336012)(2616005)(426003)(36860700001)(6666004)(186003)(1076003)(26005)(54906003)(478600001)(316002)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 15:03:28.4944 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8cc5c9-7817-4df6-fcd8-08db36b0144b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT091.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4334
Received-SPF: softfail client-ip=40.107.220.75;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, Apr 06, 2023 at 08:48:34AM +0200, Thomas Huth wrote:
> On 06/04/2023 08.33, Michael Tokarev wrote:
> > 06.04.2023 00:06, Michael Roth пишет:
> > ..
> > > Re-packaged tarball based on your 7.2.1 tag is now uploaded:
> > > 
> > >    https://www.qemu.org/download/
> > 
> > Thank you Michael!  Finally it's there :)
> > 
> > There's one minor caveat still, though: it is missing in the
> > "Full list of releases" for whatever reason.  Dunno how that
> > happened, maybe that page hasn't been (re)generated yet.
> 
> FWIW, I can see it on https://download.qemu.org/ now.
> 
> But there's another thing I noticed:
> 
> On the homepage and on https://www.qemu.org/download/ the date of 7.2.1 is
> still the date of 7.2.0 (Mar 30th 2022) ... do we want to update this, or do
> we want to indicate the original release date of 7.2 there?

Thanks for the catch. The date should reflect the date the current
mainline/stable release was tagged, so I've updated it accordingly.

-Mike

> 
>  Thomas
> 
> 

