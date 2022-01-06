Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC934865FF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:26:27 +0100 (CET)
Received: from localhost ([::1]:49554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Tik-0006uP-0s
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:26:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1n5T6A-0008T7-0i
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:46:34 -0500
Received: from mail-bn1nam07on2072.outbound.protection.outlook.com
 ([40.107.212.72]:35649 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1n5T66-0007Qp-JT
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:46:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBpJNazLCNpiZLEGO9+P0+KEk2JDLjFu+LFSJ60UH1+cKDzasfUAxJndRUvcAFnVugvCkaqFKh7Wx6lyQJrk1i7iWbU/YqyWNOXE6JI7CM+x7rokvgW/WQdH0a8jjmPHAMUWVkRxTuicA17cfGalPno4Bgsd4302bNcvKEGdzxGk7ldqzUir523okMtpMGXws6J/5XtoKIgKD9AdS0A2bm1nwZcP+8wKmVIDdLxG412YipWI/5kqrQ5o/zQ5lI6u5E1Y7wW2FCJ+sJPrWDKLNimiq4f32m8K3ho1INI9LoPzA1VagLcY/dBde8DzY3UMpZCs1P5kLzZ1xoiATD/sGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6gO5uw6uQwMH3mmv885um3cE6WkT7uSwV8EpkIqxHQ=;
 b=nLhh6iKg0+SkqG+jblCycV80DPuEfd84Y2GR12jQhkNYq0YnoxelBkc8jesH+ewu7tSUPDfPkojpGh253biuiUe2T0MHiQLlvYyA+XysPiREXrzmk1XKQrEk1K+HeDerYS6Yr8TEpLIQ5YVLQNQ8+uRvpv5UWXjJ1W5+giUhSBgvZvIFZ4BMdDYNWZr0T6lBQ0YZhR00zANg7Nj0BXf2qZ26uv/lbRoPLpvTCmiAgBJx1uGjSAdA4WkA2mXU5L2jbgsbOdqA6mwWflyzf9/Ns1Hp8hZZ7/kytkMIj7XpxREt2oDYuCLzpidRYDu8Cm7FHfKvpVtfPwmCbXdZP7tnBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6gO5uw6uQwMH3mmv885um3cE6WkT7uSwV8EpkIqxHQ=;
 b=GlpbEMfV0U+w9noHsduoK1RHqjWf4AFTGmG3ICq7sCPTokNqOlED9IXusp7eHhvD51RjooTjOdX0EZq7ncwFNInnOTfjmXSCNExYJ1bOEq6j1b7D/cO2NBmh2tQ3v9MSBRlrhb9atNRELp3Xx/rzLT7Rcn0WN0qjgOxi009s3zw=
Received: from CO2PR04CA0113.namprd04.prod.outlook.com (2603:10b6:104:7::15)
 by BY5PR12MB3988.namprd12.prod.outlook.com (2603:10b6:a03:1a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 6 Jan
 2022 13:25:45 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:7:cafe::e6) by CO2PR04CA0113.outlook.office365.com
 (2603:10b6:104:7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Thu, 6 Jan 2022 13:25:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.7 via Frontend Transport; Thu, 6 Jan 2022 13:25:45 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 07:25:44 -0600
Date: Thu, 6 Jan 2022 07:25:07 -0600
From: Michael Roth <michael.roth@amd.com>
To: Kostiantyn Kostiuk <kkostiuk@redhat.com>
CC: <qemu-devel@nongnu.org>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Paolo Bonzini <pbonzini@redhat.com>, "Daniel P . Berrange"
 <berrange@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Add entry for QEMU Guest Agent Windows
 components
Message-ID: <20220106132507.k3qmvpnb76caqvoj@amd.com>
References: <20220105095055.44475-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220105095055.44475-1-kkostiuk@redhat.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 648060b8-d688-4500-a0c6-08d9d1180b9c
X-MS-TrafficTypeDiagnostic: BY5PR12MB3988:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB3988B8B1C0FCBD06E93491AF954C9@BY5PR12MB3988.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:202;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gvXrPB6HBsHHlMe8g5TQxzwAtNIUoqpqE5ncBa2s/h5FFDz8TE7/QDVkBWnYQTiywgMVHP+YtntrTY+lLayIpfbJBvmqSZnqpOE+3FPhbzjROXNW+iYf1EE7HW6hzZDENaSM2oUCQidiT/sKjMAb1ecCDpwqCXZ3uiCxsYtaHWyzXmNncYA2rNUgwmoAY43fkkp0+dxIpB250CWM7xlIMtuqqfR1mxJ5r3q2AUgvpMMrJ92neTN7Q+xzvMzV0CqqH2yoqDhdJLSgGap9IoN4OX3ek989ctn7oQumfDzlLTOcK9MIANSyHzY5OZ1TZ1gQi1w5iJcSarYGjYWYdaGtkgPSLaUPLiE0Ugnb8icl1+0/oS/BGW80Wnq9iH9mCgbT6Ldl7cbDSwjYtzJnnVBBCLqwFVCcptAQytT8WkrYxtTb770GHRXToCXVpXHbTO5h5QYvEDZTmW5l+vtbaKn2xEcrjGNHft0V79LW9oKovK/Mr+0F54rYTZyED2846fEpc/6gMtJPJ5Lq8QpSVPzkAgZhz3XgSwVEH+FJEKRPIZBeEllP+Zr2Ilzq/5v1bRz/J6ScBPVWrJGDC6kkV4ZflwD7n4mm1g8QP6KAo/PR1yqm2wd5x2e+FGQNwR+kbkWiSYklgpRmI0sQeerEpz5WhdKZkUlXrNS4VV98RWgTbg9eLycQIeE9jJw/xNJ11zxhlcsW+ydCjc6CaPp6Bs4tzjQrV1+k8xu9Rg+XCedHBITLuxatlCK5TyuA2Cm2rYChkzi5A1+c7lwDA+Ud8ciSHjf2S4UeZdW3hlR3ONfUN13hI9HRySidzAksNciDc4hWoJFXmDP1BzTH7XzvxcuVwr0lkAkOXc2YlxQZ+AlqL6qo9y+zQQoo/8SgXSWm2QKJgJSImIYbzX3JidPdn7UUpD9jv2HWFQGXOfHkoW7HKcI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(1076003)(54906003)(316002)(6666004)(356005)(36860700001)(6916009)(82310400004)(8676002)(26005)(44832011)(36756003)(70586007)(70206006)(2616005)(8936002)(16526019)(186003)(336012)(45080400002)(86362001)(508600001)(966005)(2906002)(40460700001)(47076005)(5660300002)(426003)(4326008)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 13:25:45.2307 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 648060b8-d688-4500-a0c6-08d9d1180b9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3988
Received-SPF: softfail client-ip=40.107.212.72;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 11:50:55AM +0200, Kostiantyn Kostiuk wrote:
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

Reviewed-by: Michael Roth <michael.roth@amd.com>

> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f871d759fd..1f255ec874 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2729,6 +2729,14 @@ F: scripts/qemu-guest-agent/
>  F: tests/unit/test-qga.c
>  T: git https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fmdroth%2Fqemu.git&amp;data=04%7C01%7Cmichael.roth%40amd.com%7Cc45c1f7f33bf46b8d91d08d9d030e422%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637769730676930493%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=6rSV8TxrGn4VNruxLMQJ2UmqUQbnBwvyWqGSjqzyfMo%3D&amp;reserved=0 qga
> 
> +QEMU Guest Agent Win32
> +M: Konstantin Kostiuk <kkostiuk@redhat.com>
> +S: Maintained
> +F: qga/*win32*
> +F: qga/vss-win32/
> +F: qga/installer/
> +T: git https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fkostyanf14%2Fqemu.git&amp;data=04%7C01%7Cmichael.roth%40amd.com%7Cc45c1f7f33bf46b8d91d08d9d030e422%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637769730676930493%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=Wr9hoFNZY9IIcp1z3hP6gNs2Mq4BGCgBN1L4UyN7afU%3D&amp;reserved=0 qga-win32
> +
>  QOM
>  M: Paolo Bonzini <pbonzini@redhat.com>
>  R: Daniel P. Berrange <berrange@redhat.com>
> --
> 2.25.1
> 

