Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347DF5BD5F7
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 22:58:41 +0200 (CEST)
Received: from localhost ([::1]:46554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaNqf-0005Iv-T1
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 16:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1oaNoB-0002x7-Vb
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 16:56:04 -0400
Received: from mail-bn7nam10on20624.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::624]:51431
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1oaNo7-00053M-FS
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 16:56:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ay/OCuZx/InVSUVah81/Nf6eOOenqVMDZ3fs8vF87HnGRePVWg7nc01ZRfw3DUohkeV7JYhqqcKSxBH8SJ5fMClPmuk0gtUP1vVnZx9mnyxEf9fW4aAs1weYroEXf2XmuZLOGFjujZkRsH2rXeYKGXfsBaJF+M3BJicBjosEzBD8gFHdmVh4DJWsu4I6I8KWzfx6hbKFLjaQlOXAkqiAhQRLDUsXat6U7qC0ZynSBoXaH/20PPIB+qOoDVcQsHqW6OxtyE3gU24yZlpqxfyQaReAFDyJZdpRlJ1yIzPUeG/Hkq+bA4Wv5p5Zp9T4WvfZc1hi9U24FaD7+9jRUY3Y6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alP9yqx/rN84x9+hTgcNZ9SEYXS9y7532wSVqA7+Us0=;
 b=eLvcJuxenYd21Uj9tusZ77h6hQdYp103NZwqmw0QPDH32Q48Hp5TuSU0RICtf4lh3cK5OR+h+jan7n9mVrKctSwdb4b8h8tyvxB1/phW9vi+B5v6HSPr7JSmKhUURIro6qR0C/GkjgMH1DL/WDuf7EBujKT4RN8oVaTe6aUEvv5AU2atDkMZvPtbK26yl2kUlZaxjLEwHzsy/zdWBQLKDMiYZn3/fsin17U3aihr3W7J4KT4PxRQp5ntBj5+vl0RUuO0KZCESyEOyEmcJFJnFplhQePDhZbmFlhEKYZEgTTmCogXlyN7DNX6l/cHcHEG6RjghshBKaS0cglXoY1RDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alP9yqx/rN84x9+hTgcNZ9SEYXS9y7532wSVqA7+Us0=;
 b=QbL3oE5fo0RuZf8r9myGDcYSPCkgTMbKzYxO8G93s62ZuvxZXH4+Q8j77KUR4dGV4leQr5DOAFbHyril8qRCSG/Cmt8oAftrMmsYuQHiJsO1FiM2/ALeEAlPIOyfIUYJ1zwkEJBZM7KwLhTocuBK+td4wbWIO8fqSWfun/z7Blrncq40zMu1eFedYx59mtE94WVpyG3KRGbYmcQ06OId9YtEuT/lQ9tka5rNISqbTOvLnhD1vkIF4GzGM17hb5JfQ6qfGO1mmH3kvuVP9TYHKnucJ11P6f7asq3hZYZ8Cya+nlxGgCaWQDiSQM4IVTqoHoP7SWQLj0crdf534pH1kw==
Received: from DS7PR03CA0332.namprd03.prod.outlook.com (2603:10b6:8:55::19) by
 PH0PR12MB7079.namprd12.prod.outlook.com (2603:10b6:510:21d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.21; Mon, 19 Sep 2022 20:50:54 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::f6) by DS7PR03CA0332.outlook.office365.com
 (2603:10b6:8:55::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21 via Frontend
 Transport; Mon, 19 Sep 2022 20:50:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Mon, 19 Sep 2022 20:50:54 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 19 Sep
 2022 13:50:42 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 19 Sep
 2022 13:50:41 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29 via Frontend
 Transport; Mon, 19 Sep 2022 13:50:41 -0700
Date: Mon, 19 Sep 2022 13:50:39 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
CC: <qemu-devel@nongnu.org>, <cohuck@redhat.com>
Subject: Re: [PATCH] vfio/common: Fix vfio_iommu_type1_info use after free
Message-ID: <YyjWH5jgqaOsC7Xu@Asurada-Nvidia>
References: <166326219630.3388898.12882473157184946072.stgit@omen>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <166326219630.3388898.12882473157184946072.stgit@omen>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT016:EE_|PH0PR12MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b3b6f5d-7e5f-4256-af9c-08da9a80a55f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q3N+O8Kw9DhrNnNqcXbGks3nQYElE49aUdwN5WHHR27dXQ6yriNL+Ff+WeZjdpeYZw5PxZhKYBwUo9k/QLcEVpodc9QYkOVH4XGry35aPBtF2tppLdl60RbTQpPSh9S4ZO/KK/30XWmYN0nRo2fA23qgtNNWeU+b7X+j3/3psRMDllFqvpjK1ZOAqxYZ7nvHYksivNWPEzGdXXtEJQZ7C0vkklmdQxWx9K4RraRaPI5f7SfPBG9AVjV/N34ED05pt/PyTTmU/LMp7Nb4f6UgyxJCklGxFgv5W3+NEHKVmxg1hXwXQiOj6E9BrpmI4liBDj9gIXQSHTJQ4ToaCd8fdxNu9p/3BlKnXI5PyofVySEFtB5ZxgjIgZ90s5d5C5KVSKYLVZdIxOxmhhpSCXScyUcL5KJi8Lw1dRKmxlr8K07m/77ISDHO4FQL+vdJXzlI06B7NjzJS3vQFwf+7464FPvlb7iokapHbmY72zJJHh8ucg/fd4Uz/BE12FXKkKHgQQJq9++M7eU/OancplfyGUP+uGAQt3FJUCazUYmmgQWqW1WVBywPxtg82X0KB+5E6rnF9HDOsMaNg5GDzsE42h3HcQdnn1aXNgLbpOs83+sDx1FuHkoZW4G8G0UCHq8qDz2QoGL2OZtLfEkK5kW17zlp+C/G5STWM/d0fGCQl7UnGW83BbG6CPqT1OkYi49z/waw3+dcRDSfRpBVuTUgmwQrh3smPlMkBrJGLmdH2dvsnmUJj/MlGjWebiJ6ot7y3erOWKzfdu21tK70chtqb0OQVimLoHAqReoe+ZsQvU8=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(4744005)(5660300002)(82740400003)(83380400001)(47076005)(26005)(40480700001)(33716001)(2906002)(316002)(6916009)(478600001)(40460700003)(54906003)(86362001)(336012)(426003)(55016003)(356005)(82310400005)(9686003)(186003)(7636003)(41300700001)(8936002)(70206006)(70586007)(966005)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 20:50:54.5787 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3b6f5d-7e5f-4256-af9c-08da9a80a55f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7079
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::624;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

On Thu, Sep 15, 2022 at 11:18:27AM -0600, Alex Williamson wrote:
> External email: Use caution opening links or attachments
> 
> 
> On error, vfio_get_iommu_info() frees and clears *info, but
> vfio_connect_container() continues to use the pointer regardless
> of the return value.  Restructure the code such that a failure
> of this function triggers an error and clean up the remainder of
> the function, including updating an outdated comment that had
> drifted from its relevant line of code and using host page size
> for a default for better compatibility on non-4KB systems.
> 
> Reported-by: Nicolin Chen <nicolinc@nvidia.com>
> Link: https://lore.kernel.org/all/20220910004245.2878-1-nicolinc@nvidia.com/
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>

Thanks!

