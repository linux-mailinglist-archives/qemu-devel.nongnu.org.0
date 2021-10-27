Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F68343CE38
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:04:20 +0200 (CEST)
Received: from localhost ([::1]:40094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflPX-000761-If
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mfkhk-0001QR-TI
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:19:06 -0400
Received: from mail-bn8nam12on2060e.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::60e]:57313
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mfkhf-0008Nq-Ox
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:19:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVyFLNna6M8TEu21NpGOycK61QtYmlpCNy0fEfBlYumLAvqeOarvNj3nlYvw6Dk1dpkNalgviRE5PJT5kyxu5CqV9kdpHKTz2kIBePZj8nVn3glDtFu49AOnywhkrafJGIZK4FVDnJgCBceJxx7MUvlaqZL0HAtCRXcfUDv8EVGdAKah6PTcvfVGB3CGHCq+xOuH0Qnxl7tf4HIZDtjDuJV/FbeWHc/DaFbbJZgLptRP+y6Gg9KLOBudcPs5UM3qhhlnBuRCsAMD1R6MnmYCDdyYqrpBkY5B5cpI0QRMerMJwJmbnT0JRsTB3ybW8LUYLpK6gGA5o8SoD55vTpdWJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gxbh4oP8LFGPD008+HEXf4kRJYRj2hSO0CN6PcGGLH8=;
 b=EjO0nd4vAvvam4NF9UJHorb7EzlNczyF89yOLFdA1Pj+ojhEdHam8eP5cOsOcRwG/thcU9JdJrNpm9E5TrlQA0KUXQ1w1VeKfbVS902Trh87zVm443NGsWE+1+QzXV47PkjhFzRYKDzDMauAZIol+fmtsDzChan4vQPQmr1aL+IypJNiHK0IVxqi00urX/aC4yjTziz1BuOK6mnAgGXt88TlZoa6VFM+SIfYmkiA/zmzk++wM5albA25oUQHIZiWxKm5wWoVENucFfZLF0MURo8ezX7oMrSXwQoqutAZf+oYQH+0nU15m1iWRhfsU7iOFvqLcMsCmwjFh3vmKbTesg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gxbh4oP8LFGPD008+HEXf4kRJYRj2hSO0CN6PcGGLH8=;
 b=ZrOKaZO5eIYCF9DIcHSQ8azaKh9+4mcz/zLjlJupEdsQALVGVJ5idwip6djSnqVU8iPFfdLgXCW6Rs9r2vC1GgLucaYqoMCvbw0s6NkrPwTP0scXDD8G2rnZV+p4UHuhjgzgkprld1HsZgpBcluXym5qlqikPbKfs4M5fRyI0/E=
Received: from MW4PR03CA0007.namprd03.prod.outlook.com (2603:10b6:303:8f::12)
 by BN9PR12MB5209.namprd12.prod.outlook.com (2603:10b6:408:11a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 15:13:55 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::75) by MW4PR03CA0007.outlook.office365.com
 (2603:10b6:303:8f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.22 via Frontend
 Transport; Wed, 27 Oct 2021 15:13:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4649.14 via Frontend Transport; Wed, 27 Oct 2021 15:13:55 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 27 Oct
 2021 10:13:54 -0500
Date: Wed, 27 Oct 2021 09:33:49 -0500
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
CC: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH-for-6.0.1 0/2] gitlab-ci: Only push docker images to
 mainstream registry from /master
Message-ID: <20211027143349.s4kh5z4soj6h5cct@amd.com>
References: <20211027052656.1275436-1-philmd@redhat.com>
 <YXkSm13RTFCWyWxR@redhat.com>
 <6a9cfd05-e2fd-0091-44c8-25f7229d5877@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a9cfd05-e2fd-0091-44c8-25f7229d5877@redhat.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d55b78c7-e290-4fe8-b225-08d9995c6482
X-MS-TrafficTypeDiagnostic: BN9PR12MB5209:
X-Microsoft-Antispam-PRVS: <BN9PR12MB520925263AA5241BB0AA437D95859@BN9PR12MB5209.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YGJ0Lh4omdkJxmAwVlXepU4S7DO77mFAV7UKCVtFqiNbbm1s7QQzP8iClcbrZcsvGFEiZIuzjyTL1lKcbfMTvZ/NozH1N5CN4FfAnPi3OxjjcWEzmsPobU39B0hAbmTVzqiOgb136COuCZ+EyqZmJ7T7RR6wlJBqqk9vFbF6rDScxobvacPyjI06Jco1kmWhGxsvkyzRCDY/i5zvvIxWQ7AryISyxAMJDC33Zy48QBqsAYKvOEQ+WrSUMEruxW0UIzFMJllc+QJO1UWIaG+k1bym+GX2QJqggpkJMAvmVUck/kTlUCljJ0WrmueNWUhuEjTspjvqwYAwajPPQhS3aqJvKYLR4TQeutSKTad7NiXp/wdaBOaBD+li3o5FrSkFaBU+SnM9QKx8fpOwHj4E3fxR/d4IF6SYnoQoNnPhwogG2AqQkdknsgqmSmSYlEt5VK+bmvyVqTtt3HCWDgr6NdPcRSQxTaXeOFkj1ZCmp5mViIWjLODhZO7PBVASbN0KQ8FGPHsOz8fZUnxK/Hc+KNKGTgAiWQCgAQTgPYg8WOz7VDOca0Lu0U17BW3IeHEjcyNwOR1rCjcseGcmLf7SDAi4lrddGhZs2AF8hCaTOfPWubHajuaHD8EVykE8y20fT46vnucA6kkSX6hbvqLw/SkTl5bRgMHBmBtZkTnzUqyWM32gomE9jmeFPS4w8hx3QW7udBxG0UfzNfi0QtEP/0wUNC32pEaDZIels79YIMsiO4/uGCB43rYZZ6q+xjTfQ8+ZbOQhv3F+lYRlPCSqaqJ27LDUIXZq22dUbgpJLuh1yUh3zgfnwkEndP1NdC4N
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(316002)(186003)(26005)(356005)(54906003)(47076005)(82310400003)(4001150100001)(70206006)(1076003)(86362001)(2906002)(44832011)(5660300002)(16526019)(36756003)(81166007)(6916009)(36860700001)(70586007)(8936002)(4326008)(53546011)(83380400001)(2616005)(426003)(6666004)(336012)(45080400002)(8676002)(966005)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 15:13:55.0494 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d55b78c7-e290-4fe8-b225-08d9995c6482
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5209
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::60e;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Michael Roth <michael.roth@amd.com>
From:  Michael Roth via <qemu-devel@nongnu.org>

On Wed, Oct 27, 2021 at 12:09:39PM +0200, Philippe Mathieu-Daudé wrote:
> +Richard/Peter
> 
> On 10/27/21 10:49, Daniel P. Berrangé wrote:
> > On Wed, Oct 27, 2021 at 07:26:54AM +0200, Philippe Mathieu-Daudé wrote:
> >> Hi Michael,
> >>
> >> 2 more patches to avoid gitlab-ci mayhem when you push the
> >> stable tags. See this cover for more info:
> >> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.mail-archive.com%2Fqemu-devel%40nongnu.org%2Fmsg846861.html&amp;data=04%7C01%7Cmichael.roth%40amd.com%7C3c19b44a450a4db8aa1c08d99931e741%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637709261892671750%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=kPrWrqTCJSgz%2FLoCfYNDyIb6zqXY%2Fl8v1p4IgUg5psM%3D&amp;reserved=0
> > 
> > Please don't push this to stable - Thomas points out that it is broken
> > when any changes to dockerfiles are made.
> 
> But we still don't want to update the registry with these old
> images...
> 
> What is the plan then, hold the stable tag until we figure out
> the best fix?
> 
> Otherwise Michael can use 'git-push --push-option=ci.skip' to
> not trigger a CI pipeline when pushing stable tags (running
> CI pipelines previously in his own gitlab namespace).

I can take this approach for now.

Thanks everyone for all the debugging/suggestions.

-Mike

> 
> >> Based-on: <20211019140944.152419-1-michael.roth@amd.com>
> >> "Patch Round-up for stable 6.0.1, freeze on 2021-10-26"
> >>
> >> Daniel P. Berrangé (1):
> >>   gitlab: only let pages be published from default branch
> >>
> >> Philippe Mathieu-Daudé (1):
> >>   gitlab-ci: Only push docker images to registry from /master branch
> >>
> >>  .gitlab-ci.d/containers.yml | 11 ++++++++++-
> >>  .gitlab-ci.d/edk2.yml       | 11 ++++++++++-
> >>  .gitlab-ci.d/opensbi.yml    | 11 ++++++++++-
> >>  .gitlab-ci.yml              | 18 ++++++++++++++++++
> >>  4 files changed, 48 insertions(+), 3 deletions(-)
> >>
> >> -- 
> >> 2.31.1
> >>
> >>
> >>
> > 
> > Regards,
> > Daniel
> > 
> 

