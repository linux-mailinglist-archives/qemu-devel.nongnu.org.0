Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E77B3D028E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:11:54 +0200 (CEST)
Received: from localhost ([::1]:55884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5w5o-0000cV-I2
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1m5vyd-0007JI-Su
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:04:27 -0400
Received: from mail-mw2nam12on2121.outbound.protection.outlook.com
 ([40.107.244.121]:6702 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1m5vyc-0005rl-0q
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:04:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVYGFuf7Gq53xpR/8wHquAIj0dpr0Xw2sY85xn1MdLamx26X+/IrvCxX+ycKDo4J/jRz6pyTlvqYZyyf9PeLywdE7kLmPCDd/2J4sVtltLqjAJ/LSW5SZdo1e4J5uE/fw7R7TUAlb2yVDRHLRlEIeV7uMKTlHOmh7G7CWUZnaxsjEPuT+H+fLwMsunM/K8kZFSg0aTHgrQEWLOgR5IfJTvLivr4hZjRkS/+J7VKFcVNp3RSnXG7GvYg08cAMQKEF7W410Fa6Rga/pZMaDk4FwU4kZnmX+ThxxOQc0KYQyek2JnoPaC5EbA00HfwNdPvDqq2N8FVQxphumkpTn8n9wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSV99AdIvH/KPN4iLi5uwKESk0pVdiSFfqXuLsfkXTk=;
 b=XfpGKjRpM/hvZKduzExkgQL4nUf6zY2Hgy+iIMivOI7Lg/DWH5qg/9ft5lAtwQErSnsa3mS51u/tjV9ZVcJflXD2L9knn3BJsYIecUiXQB5kisbVLnBrPH4YH0wlG3rcHkN3X6DdRADjU+VK2zTy2lMeXuo3VEV9exX9F3/HYhyK0YaApbl1JvNB08fPJnPMAeNZSRlpBSP1S7ljFbnqeTCNvZo3gVAXUxpZK7WL/MtbA3I/ecjt0QqtOspgk07iM0rADvxo/v+ixYUL5kWB5Bgjx5N7LbdZ12fgsHTSlq3i22Wy/os6LKZ5GfrNAcRszDufhlwM88y0gCy0V7HumA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSV99AdIvH/KPN4iLi5uwKESk0pVdiSFfqXuLsfkXTk=;
 b=VisGsB9mXIE6/d5m0LADV2NCZYG3bYx7Lr8R5C7DVip+LKX+SBGqpUHabvlfbC8/K9Tc4IMzhLYasaY4i6fMnJNYTIJax+kn/Xt5PdKOgSrNMBmcHPVeK77gvL+ltUSxs4IXu0f4k6OLtY10xcTWQOQuZNkn/YjdqzmhOaUocmg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SA0PR01MB6185.prod.exchangelabs.com (2603:10b6:806:d9::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21; Tue, 20 Jul 2021 20:04:22 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::ddd:63a4:21a3:c9f8]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::ddd:63a4:21a3:c9f8%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 20:04:22 +0000
Date: Tue, 20 Jul 2021 16:04:16 -0400
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: cota@braap.org, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH] plugins: Fix physical address calculation for IO regions
Message-ID: <YPcsQMsN9uqj/PT6@strawberry.localdomain>
References: <20210720195735.3934473-1-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720195735.3934473-1-aaron@os.amperecomputing.com>
X-ClientProxiedBy: CY4PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:903:c6::13) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 CY4PR04CA0027.namprd04.prod.outlook.com (2603:10b6:903:c6::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 20:04:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acf23aa0-5b3f-44ac-a7c4-08d94bb990d7
X-MS-TrafficTypeDiagnostic: SA0PR01MB6185:
X-Microsoft-Antispam-PRVS: <SA0PR01MB6185F66D45F5EF50E606AED08AE29@SA0PR01MB6185.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XZuUHSms4HE6pDOzODpbIKJR/a28iioNBKo6Jgj4gpAJaRCAinnIapywVHrjoaac/T4rbKvrqsVchgo8NFDLpfbBZg0vVhPtoKLO000tyjcy2T3M5MmxpHacUFMtcKQ4YSzdRDgnLUWIXNB6oqpJJLhBNIz6ti1HEiVz/Z9lvjexSfngPFJtXG3Sp5xw2o/QjC9ApWPYywpL8naL2CrFrwHM82ykPunLf9Pfhnpl2nbPjayggevRWoBNFB4hMAnmZ53H10DPXHNkRCHCpulN2bz3xMs/M5DU2JclzulQW0jedcA3wE9tfmv205V+g+mQDQS6f6PwElJfp9m5q6oCGgo2ZUywPrX/iTD4hjK/+lMzDSLUl0wUyvEdlT0VQ0KOpeoijjLmuXm6YIKnPk3bHMYEnwKG1iA11yKbGA9/v8aS1qje1Sa8sIY6AI8LB04nldxAmgM5I/RcFZb6lNvUPQOKSLKlpuU7fh5aZbGEoq3lKzfNH5gtMEGgYxgkVAZYaZsbiPnbPZMzyx78RwA6XrezA1t8yGdzarATMnjIG9sbmsFoubFDvZaAPZ/6NZgJyJl5oFn4Q73l5hykt3r4xPMe+Uzrtj3kPpIF6X/rY1pj+nuUKNEI+2zNjhBG0J+swQGUMwRo4DMwn93s6NTs8cQEPXYd4WQec4MFsthyAeJem+fPQnMIiYJScCgT3JolH0dUSDkQI7aEDw5xhifOx1OMCW+cp74vLi/UHwVASdOF8O4tXvJW+P+T8KxcpcApeBZew111M1Gf1U30kzBMgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(376002)(396003)(366004)(136003)(7696005)(110136005)(8936002)(52116002)(478600001)(5660300002)(186003)(2906002)(8676002)(86362001)(4326008)(38350700002)(966005)(316002)(66946007)(38100700002)(26005)(6506007)(55016002)(956004)(9686003)(66476007)(66556008)(54906003)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YQfi9YytLxd3aIFUzHN++lu5MF/VfgxbKlxa3Q6khbQtmDXwI6WNPCPuvbH8?=
 =?us-ascii?Q?vKzdqoQgaMsQtad5EZIaOKW7GOJmo4y3OlO3t3EN+E/fQSbn5yNSCI3xOKM3?=
 =?us-ascii?Q?B5MgvKD/BvgbM3+FWvQiZTITEhIputH0q4r1NQ8wJkCSa/sEXzp32kmNFBai?=
 =?us-ascii?Q?fD+y8qOjWMLh50hYhYdW6q7wf1IeQzq4+rcypAPvPZ6b1LU6B7dEb598RIAY?=
 =?us-ascii?Q?9jfwBskSZlPe7a+iKb9Cfdy8Flg6czlpQ+xA0Tr7rJd0jI/Qm6mTcuW7OId2?=
 =?us-ascii?Q?3V+ey3YdHLiP2iZsa819jCOq5K8wfZET0139u/54sZs+jXJNJbun8dQhN3eW?=
 =?us-ascii?Q?skcpziJ70+/+2DR0l3kQt9wh3Ln8kqwkev5tI9CL21kMhuNWt4sPmL4qt70k?=
 =?us-ascii?Q?rC3QDWsFgd2Ryb5aIssBZ7NS4KB5qdt4z5IZiQr8NgUFRb5zAg3/S/66K15v?=
 =?us-ascii?Q?W5erE+Y94jF4u+EuMyRlACfmNc41BRwW/MFCyDDr6lqe2d0cQixOKdV8SOiH?=
 =?us-ascii?Q?2ChTY0l8bubAEuFdzeG0dgrJIbyLbIHCo1w1WIHQwURVEKs5xYBJAi0U0V2d?=
 =?us-ascii?Q?WRLgwVvsJp2r0+zskK5mSxLwGPJGYH8EmBlh6Q9pvyWwlyRscmfApQoeoJ19?=
 =?us-ascii?Q?cqKlFraMuNWGcahmUBXJAaJnP/iktfvyf+Y4b6MR27jYSReOR/rjoFxHrUV5?=
 =?us-ascii?Q?m04HXXwPYSuFWNp0xoXaocm5+/oZq+whAJ0OAIYrc9EAuLhaSYBYGt5HjwJ8?=
 =?us-ascii?Q?MOjSpRdms/fTDszJ0f5BJNDBx7D6qqOA9S6vfB6OideUs0cmIAA/65fHcVO9?=
 =?us-ascii?Q?LlkdkO8uiTb+odhOnTHiRLvI1RVcsZbaQyrCR7awuTNQKmCOYgQVoMKqrfZi?=
 =?us-ascii?Q?uwtJzTSpmKyyKQRwBmPoO5Ch6nxUvCCOvQXkKh++luLE7nz3pwsTtabVxVcz?=
 =?us-ascii?Q?m8qKB5oTEgb4twwIo6wHH/kSFqf8sTNc+eswAp1zU5kMP2apHG248IVRenmX?=
 =?us-ascii?Q?e6YKXizCEyZn2eX02Msn1A2cjD47GKKtFZ4uUBk5mIYGJVFpzZVFvAcdTaAk?=
 =?us-ascii?Q?X405QFq54uVk26aXbUC4YFF6Vv/EUZammkbbWfdd4gnCTw8z9LO0FypUZ0d+?=
 =?us-ascii?Q?yzPFRyvfBKlP3U6ftbd3uLAthO1VbeFeXmICTtZJtQH6nIEEKmRiLJ1wud+5?=
 =?us-ascii?Q?Dcgoh6e9y12LyT/B6JWH+keBa5LukPNqVUNjswhary/v8uJOMBDwVmY8qz7/?=
 =?us-ascii?Q?wmj70vUJLP96hyvtHlFklizBaMyrNtxtSOkkMxSvRNPZ2rRN+5JAXbvnge80?=
 =?us-ascii?Q?QimO4P3nVkbU/pLB3VN+turE?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf23aa0-5b3f-44ac-a7c4-08d94bb990d7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 20:04:22.1750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8eV/nM1hLqtxO67GjTbdOLM0XGZNl40iq3U4nxP69fQQjuDeNyiR80JD3U2sHdcGgDWo6arL+RGcAbLHJhHeJAPW/RnKMcXum33mND3avus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6185
Received-SPF: pass client-ip=40.107.244.121;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, MSGID_FROM_MTA_HEADER=0.001,
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

For reference, this patch is intended to address this conversation:
https://lists.nongnu.org/archive/html/qemu-devel/2021-07/msg01293.html

This appears to be better than the previous version in my testing, but I
absolutely welcome being told there is a better way to solve this!

Thanks!

-Aaron

On Jul 20 15:57, Aaron Lindsay wrote:
> The address calculation for IO regions introduced by
> 
> commit 787148bf928a54b5cc86f5b434f9399e9737679c
> Author: Aaron Lindsay <aaron@os.amperecomputing.com>
>     plugins: Expose physical addresses instead of device offsets
> 
> is not always accurate. Use the more correct
> MemoryRegionSection.offset_within_address_space.

Whoops, forgot my:

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>

> ---
>  plugins/api.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/plugins/api.c b/plugins/api.c
> index 5c1a413928..ba14e6f2b2 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -319,7 +319,7 @@ uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr)
>              return block->offset + offset + block->mr->addr;
>          } else {
>              MemoryRegionSection *mrs = haddr->v.io.section;
> -            return haddr->v.io.offset + mrs->mr->addr;
> +            return mrs->offset_within_address_space + haddr->v.io.offset;
>          }
>      }
>  #endif
> -- 
> 2.17.1
> 

