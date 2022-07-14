Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AAF5757D2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 00:55:44 +0200 (CEST)
Received: from localhost ([::1]:42542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC7kF-0007RU-6a
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 18:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1oC7j8-00065r-1j
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 18:54:34 -0400
Received: from mail-bn7nam10on20612.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::612]:40053
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1oC7j5-0002p0-JO
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 18:54:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6rYg4rCCo2Oz+g1alFzk6xkCPzTHsyCBY0E5b155OTFhXkpLdOdGK9rF+JOmxTa7EtAZjyeTOA+q+UGRiz5fWcTj2bnq0yjpJdpXoHAx5lfiBSjxVVGstxVIweW+hjvRueHgj+72uGF2ndlvo07fbktN6FvFR8SjngWbqo/BK7Videf78/gd8YcjgPjtszfQga/EFLaeODG9cVvpHNswbMw0CoE+gs3Yqe1OKHtiAiTZfXfb6N15yGYkz6M8yayCR6E8iT8S4qPGwAn8DP8ZXfcOy1is44uK/TxQowOTGy7l7AYOzBFseH67BwtKKsCNAA3yQVNkEKxh6qTp2ySYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwfPls/826M3d88EzvLU3Y2f2/LHEtVZES648/2HrsA=;
 b=XPEY1vY1lekUShbesH2Qzr70Gtk+5yPrYECiAuyH9gbdR6K5yfZHe0vvOV2GbQHHFBxGdnP5ormRLxK8x+0vTaIp7InvKXfAnM9DJ/mDM0jU0Fur7rPjXjbzIXUbXCUzLRUEA5ayWjll83RwWXX56efJgk8zMUnnLnu8j/xoaJjmGbSB+oM1/mfCyuf3y0EEeuSZRNfSaRLnL5ujuDtXn6VD7Z8/I7bMo/KFa7wsL+RywZJjhkzgk+YWCRbZ6gUG9IdJ6C0JWSieNFMrjSYS5IJCRQ7+jA57D1Ar1vGbI+VTH6nnGqMFI8j12nPfn5qE+HYg4bQz3jMoJa2/34uRLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwfPls/826M3d88EzvLU3Y2f2/LHEtVZES648/2HrsA=;
 b=amvjv14tfTDFOiwxD4Wq+lzOc8lAtUYFRsAR2Is8THjwzRIz/talTmLAg1ygqWZqRmclSEwRA1VE5VTPTWGDHVOdgQyyzl6MSihKtww1AEJRFafb0IZ3N7J/4BwE427Ka9qaEZjGCs4/UCJBZJRVDu/uLroE0B6orU7y2sDz7GY=
Received: from MW4PR03CA0133.namprd03.prod.outlook.com (2603:10b6:303:8c::18)
 by CY4PR12MB1367.namprd12.prod.outlook.com (2603:10b6:903:3c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Thu, 14 Jul
 2022 22:49:23 +0000
Received: from CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::8a) by MW4PR03CA0133.outlook.office365.com
 (2603:10b6:303:8c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17 via Frontend
 Transport; Thu, 14 Jul 2022 22:49:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT017.mail.protection.outlook.com (10.13.175.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Thu, 14 Jul 2022 22:49:22 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 14 Jul
 2022 17:49:21 -0500
Date: Thu, 14 Jul 2022 17:49:05 -0500
From: Michael Roth <michael.roth@amd.com>
To: Konstantin Kostiuk <kkostiuk@redhat.com>
CC: <qemu-devel@nongnu.org>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as Guest Agent co-maintainer
Message-ID: <20220714224905.zbjpmfav6yy4thhf@amd.com>
References: <20220713133249.2229623-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220713133249.2229623-1-kkostiuk@redhat.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5c8e787-c058-4ef2-e72b-08da65eb1878
X-MS-TrafficTypeDiagnostic: CY4PR12MB1367:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zOFVVI3ZiB8oLXSQ2dCpY9PQVUnGS1+kw//+o0dUgLb1H8HeYjbgXzgQLl5kHqX6T9C4eZ6MJnWGdP0rMBbO1rkvQOoIKb+r32U48qp7X2ziPgSG2cXsniIpAW0+Op20UtGpe8kXzKGwJTVoDbX4raTwpYQQAKn1FT0raGvecIVwWqAS4ZGgEOqAi3hzqxTADxZkeukguqUEhPjal6KTyGDN036NpjanW1Ai6VSIZIoxgH0PTiRM7Qrkwb6ZABlHAv2wMnnxT3xVwRpDXJGiT08GfYQfC5R96K7SB9P5s0lQVfAGLYLFa+aIjdQO9Zwe/W4xdd7/VcI91ekp4FcCf44QZDR5dq8Nwc+1Kk99NflROJdW+UpVZa7eUssNeUR1oDRDtNjBIiKfUoqZZVZtFYxdTeOEIgDwy4M0vq9HjeJo/LejaW7470mJUjGa2Pwfnkm5zEyhFM4h+VW7ytE9XvmlX21kjOqJS+hVbGq+AtkTHqwEadGVU4GGNMMWd4tgO/raCEZq0kftWAnpHOF+kOz/NB2JDGzGQgycwq8RVZM12IgYnl7v7CoHszpN51PsoOKi67DKUKtc09jKa6hPIjnA8LSSDgJuRl2bPQe2vfPreRUpSmsFf8GLsdO+4xj+ajkKOHef7lpFkYHOumghhCMB4HAR+mf19KlKAljNPUMTU7xwT3rJJ+VgT3zBTzO+H+BPeaqBcp22HKt22VIZIwa29WjH2ErofG9B5OOHY+8YxQfp1UzXMvifxLRq7N8eR97GqtdaA4b3EymSmO9RXmext6Y9vLSBco7+9BGCq0gx93XGVRDm5UCAQL/8vLTUQR44CTqQfJ9JLCaYQzSipaN6NyYf3flO5bcLHEghODW7VLQ2sT+a5WLD+4SbAzwH
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(396003)(346002)(376002)(36840700001)(40470700004)(46966006)(47076005)(6666004)(186003)(4326008)(426003)(40460700003)(16526019)(36860700001)(316002)(36756003)(81166007)(6916009)(336012)(40480700001)(8676002)(44832011)(54906003)(70206006)(966005)(70586007)(41300700001)(86362001)(5660300002)(26005)(2906002)(478600001)(356005)(82740400003)(82310400005)(4744005)(1076003)(8936002)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 22:49:22.6924 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c8e787-c058-4ef2-e72b-08da65eb1878
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1367
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::612;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jul 13, 2022 at 04:32:49PM +0300, Konstantin Kostiuk wrote:
> Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>

Acked-by: Michael Roth <michael.roth@amd.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 450abd0252..22a4ffe0a2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2880,6 +2880,7 @@ T: git https://repo.or.cz/qemu/armbru.git qapi-next
>  
>  QEMU Guest Agent
>  M: Michael Roth <michael.roth@amd.com>
> +M: Konstantin Kostiuk <kkostiuk@redhat.com>
>  S: Maintained
>  F: qga/
>  F: docs/interop/qemu-ga.rst
> -- 
> 2.25.1
> 

