Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D64FE475A54
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:11:21 +0100 (CET)
Received: from localhost ([::1]:51674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxV04-00016H-VP
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:11:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxUZX-0001f4-BK; Wed, 15 Dec 2021 08:43:57 -0500
Received: from mail-mw2nam10on2074.outbound.protection.outlook.com
 ([40.107.94.74]:15458 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxUZS-0001ge-T4; Wed, 15 Dec 2021 08:43:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDgN96A3Vv+PqeIud4LtcUDICUWLjW7vtSWKSv53zWcZ8R/TcAHggZCEFLFM6ZmTWMyRAoVQG3HDwlOZCaCrzai3unPHiTcqG/qdZSenkim6siskW3h+3gdhn37XzwzbOq+eElZD2O2VL7EyYVxzrZpagVXgUz2oVPsCfM3UuhwI7lQrIhQ2yahQC5VtvJtOU+ab/xoQxZ0Xxk5ZMYFxDjPQkMeaC0Q3c6X8BatOtQOfK5DllcLoX0euInaYlczCczahYdMTfcuQBJAYJ/SAoOlaf3q0/sKbo65RRWbFcgvcx3FEViHayv47kobHY125NHn2m0FbQrEnDcEwL4hWPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cb6zEyhzr1r0DGlROO/4AmgKkcBHz3tuof/g9I4jVno=;
 b=XQ+1YQc10prWQ+FLyKwHAhMffe4lksc3KYGzlb6lfoP8IsITk9mKDiji3Jlqq9QTcYxRXGI8S6vqqwrsqgCX7sj2f6wDD0NhNR4oK+B7m4GqgaaTxrJOIhIeWKO3n51bEncac0F481xqWVcJ9p305sW6feZiYGyTWlmq0SK4hEB3JRqKsZLvdOj2RihTI3SbYnLuHnFKxa+gzyaArCq0ZofIt2/p2iBzQz3HBHvl9y1nZIeYkmWtGEk4FJEQNXaNiOjXFTkUb6g48Jm+k4IkApfgBeVCXmbaa5cl3qXzygKFKE+8aQhpkoeVfgNhq6IdNuprnMdzTeR7u4kk4D5MNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cb6zEyhzr1r0DGlROO/4AmgKkcBHz3tuof/g9I4jVno=;
 b=Gtx7QexAydR77BUY8R3942QpvanXdpEHqjwzdTDGPbuP22BIAHkHzemMNFHE6xu/cFMl9IqG/rE9jBMPWVG+Rvc4uWESSIXrqEGccZ0M3Sm1p9XRtzXWsSHy1DEUjoGgndqJ+WvaRYNJqze6Xg546LlMaox7o+n2AMfYXpYcxCY=
Received: from BN6PR1401CA0024.namprd14.prod.outlook.com
 (2603:10b6:405:4b::34) by DM6PR12MB3049.namprd12.prod.outlook.com
 (2603:10b6:5:11d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 13:43:45 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:4b:cafe::bc) by BN6PR1401CA0024.outlook.office365.com
 (2603:10b6:405:4b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14 via Frontend
 Transport; Wed, 15 Dec 2021 13:43:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.16 via Frontend Transport; Wed, 15 Dec 2021 13:43:44 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 07:43:44 -0600
Date: Wed, 15 Dec 2021 07:17:43 -0600
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
CC: <qemu-devel@nongnu.org>, <qemu-stable@nongnu.org>
Subject: Re: [PATCH 00/47] Patch Round-up for stable 6.1.1, freeze on
 2021-12-21
Message-ID: <20211215131743.lb7xk5zaqtntl6ku@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
 <YbmzXzFJlXmzgLS8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YbmzXzFJlXmzgLS8@redhat.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24df94d1-63ed-485f-c9af-08d9bfd0e9f3
X-MS-TrafficTypeDiagnostic: DM6PR12MB3049:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB30491D004304130EA4D62C3495769@DM6PR12MB3049.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bufQcLABw9NrVHvrRzoGIGrLJwS82EbrgHAZNYSDQfUZIl87RQ0DPxVIO14ZtSWit3kgyUiM8SA2yoBwf6b0K1SDi3S9/jYW+r4dLoWfLQRyfUotMNAwlfG1v/Vy2T2ZWZXY7KirdqKGQfat8GXDEJ2dfoxgGTGccgLAwOOSizCpIT1tJ2ADcCOU0tW9TL6K0rq7EARHZBWq+M4kQAGLc3wSMhKfgTeOfS8nNvV8G5Ih4fcW302tJMdQ9OCEw6e8DA1ZXZQxctu612rjk9X2QAQN8bJV/zSjJ76wzFF0fB08N8tMcdjmp37fgt6rYG7BFNBEv87190Oh8/S+TkB4ROhhYp4y9Gd3jkW1y4Fe1hTr4vLsyNnmY2fYfXgfn3B/uO9taEeekp8WYJCs44/STDMdr7vISmHC12zriO4qUGdmryCRg6tR2brxDCZgbl3Ik7xesgmH8pqyuqrDSVo++lQlTk+oe8jGPX/zsAQ0qYb+y9NapKGD/qQW1CoXoPmfj+vSqflk4k2Tq0Sw+cRxAo4X1xamjyqET7w5DAWEsLiHmYr+xNQJhN4I09P6j6Kps1HVJtNX0NmOc8L5LjrjBMNW/a5bJT/1cKh6H9l4gSTemg/f6EKRxpo7dTF3IJ3bvPuNW5oZ+sNF9/e7o4DYmytrZ6mPT7EqUaMdqzx02u2gqfkwl9QlYLouBkUuOJlp6CaGYtixhnclcCgGTlefZC7qVCx+xWZpwVtYW2FE63b04jkH//TlQgNqp81zVecpmyrrCBcR5729JtnywxAYf+8HRIgvEQU4oGxdtKnFIIAqxp1p1Lp07RQHNd95kYZCprYKMGWZQT153REgaIv9sI734BNnBHvzoB7cR+aIN05P3cRQLNfNNE1Td+XBriasOJVOZXehRykKklyEtMsCy+YfMUJKpG7GyQ5cuQNmlmE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(26005)(40460700001)(82310400004)(4326008)(2906002)(4001150100001)(2616005)(8936002)(70206006)(5660300002)(44832011)(70586007)(8676002)(1076003)(36756003)(36860700001)(426003)(86362001)(6916009)(186003)(16526019)(508600001)(336012)(966005)(45080400002)(81166007)(356005)(316002)(54906003)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 13:43:44.8338 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24df94d1-63ed-485f-c9af-08d9bfd0e9f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3049
Received-SPF: softfail client-ip=40.107.94.74;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Michael Roth <michael.roth@amd.com>
From:  Michael Roth via <qemu-devel@nongnu.org>

On Wed, Dec 15, 2021 at 09:20:31AM +0000, Daniel P. Berrangé wrote:
> On Tue, Dec 14, 2021 at 06:00:38PM -0600, Michael Roth wrote:
> > Hi everyone,
> > 
> > The following new patches are queued for QEMU stable v6.1.1:
> > 
> >   https://gitlab.com/qemu-project/qemu/-/commits/stable-6.1-staging/
> 
> FYI, this branch doesn't appear to have been pushed.

Argh, sorry, outdated link format in my email template, the correct URL is:

  https://gitlab.com/mdroth/qemu/-/commits/stable-6.1-staging/

> 
> > Patch freeze is 2021-12-21, and the release is planned for 2021-12-23:
> > 
> >   https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwiki.qemu.org%2FPlanning%2F6.1&amp;data=04%7C01%7Cmichael.roth%40amd.com%7Cc2deb18e48d7428bcd7a08d9bfac34df%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637751568618799581%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=yyM%2FWVt9UcJocOhBwRVXRN5MJmhttQ022gRhB1XlRcg%3D&amp;reserved=0
> > 
> > Please respond here or CC qemu-stable@nongnu.org on any additional patches
> > you think should (or shouldn't) be included in the release.
> 
> Based on critical fixes Fedora users hit in 6.1 we pulled in
> the following fixes that you've not queued yet:
> 
>   eb94846280df3f1e2a91b6179fc05f9890b7e384 qxl: fix pre-save logic
> 
>   69e3895f9d37ca39536775b13ce63e8c291427ba target/i386: add missing bits to CR4_RESERVED_MASK
> 
>   b9537d5904f6e3df896264a6144883ab07db9608 tcg/arm: Reduce vector alignment requirement for NEON
> 
>   8e751e9c38e324737fd3d3aa0562f886313bba3c tests: tcg: Fix PVH test with binutils 2.36+

Will get these applied. Thanks!


