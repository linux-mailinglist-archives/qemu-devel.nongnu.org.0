Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 857C33097B6
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 19:57:41 +0100 (CET)
Received: from localhost ([::1]:34676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5vRE-0008Cc-4e
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 13:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l5vPN-0006R1-NB
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 13:55:47 -0500
Received: from mail-dm6nam12on2111.outbound.protection.outlook.com
 ([40.107.243.111]:39905 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l5vPK-0003tS-Ha
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 13:55:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlX9iy3KuTQu1OI4HpDEbc6zTB50JXiVbhsowbyAD6vCFTR8cSZjSjmAoj36DuH68I/q5UTaX3VURDU5vORNgZmkjM0W1equq9J6sSai533DQL9CmeQmAzACokjn1JSmVaeaioPentvWfuo3Hd5EjROqcXgvp2NhD31U3iOqoOlQzep2D6PAuzGkHKhCfdPk5ncVoablFVCBfckMQs+7Y9HCU0RTbRIjwnuObvFCUy2yl8qf3ImbMER0CyJ1OuaBYpaieFuzvESqO4LMvv022d7FoF80XK0610LVbnMSrpcIWv1gx69tfv8Y1GzFC/Yq1Dm2zC4jm+Uw3IEzZH43NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHl0boQaKkEjOuI3YdGfFet60YWDz8vrGzVJN2TdLPI=;
 b=Mx7gJ14hT8lSPQTWHPlHt8d022lwl69jqpucVmgczPiNXMQGjXfeRRsRm2nYiW9lZzYQp1HPQOMlsDZJH9pooKshAnVYHz/RnOqiKSYGOVIePVMij1p4S5hLXeFaoFZv2mhg+RFQeVyJ82CnPcLDXEjkAUEMuCk2lCcPs4V307BpKgNRfMkBioObrNx3Az4MkXzUztL12JgE0YN01wbYTcUW31rWR8VQgmkftfh3WZQvyw07nJd+N4bFiSpnI2pt9PW6dNJv8yt32XHwb3CE7Uv7hSgLlIWQhVzryCR3Tgg6kohcel2x+54XAoQE1HtkxaEY0i+yU1nZqyHw+LW4Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHl0boQaKkEjOuI3YdGfFet60YWDz8vrGzVJN2TdLPI=;
 b=qqNU9af8Vc7JfjAsF9b524Xh4uRq25URSt2gXbe2f1yTi6t7qDUWXCRKcdYXx6Hm2/SreRlXzENNHuSHO0LbJmlEFHNGMZNqLEgvqwGqRs7uyHughIlPXrx8WmTpaS5ciZM6gqHHkthIK4AmRbIgG+27NM+K48VN/bXfFus8Nz4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SA0PR01MB6204.prod.exchangelabs.com (2603:10b6:806:e9::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.19; Sat, 30 Jan 2021 18:55:38 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c5d8:3c64:9f92:90d6]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c5d8:3c64:9f92:90d6%5]) with mapi id 15.20.3784.019; Sat, 30 Jan 2021
 18:55:38 +0000
Date: Sat, 30 Jan 2021 13:55:32 -0500
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org
Subject: Re: Detecting Faulting Instructions From Plugins
Message-ID: <YBWrpHUgLqY/h6Da@tahini.localdomain>
References: <YBTRSK4/F5KLH+FZ@strawberry.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBTRSK4/F5KLH+FZ@strawberry.localdomain>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: MN2PR15CA0054.namprd15.prod.outlook.com
 (2603:10b6:208:237::23) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tahini.localdomain (68.73.113.219) by
 MN2PR15CA0054.namprd15.prod.outlook.com (2603:10b6:208:237::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend
 Transport; Sat, 30 Jan 2021 18:55:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bea36ee-8256-466c-73e1-08d8c550a249
X-MS-TrafficTypeDiagnostic: SA0PR01MB6204:
X-Microsoft-Antispam-PRVS: <SA0PR01MB620456AC9A9BA305CB6135538AB89@SA0PR01MB6204.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zTNkZrMhYev9jclrN5t489LNvsGS4HRj21uyIaIVbhENPqDxXczkoarMWXVVOk4AgXaffYAhYmsrrFZzUg0KtEe0R5Sqy7mlKKNhKczm0X4WCRdy7Mf0Pu4EfIeZ4ZwNb/MzFPm9ny//5bVZIBChyoANezV3ZB/FSNkDGOhRxe6O2ncybmWFdkqMIPf7DJ/F7E0AEYW6jVz0yn0TekSfgs3xhBcFmQv8s/Yf5aX5bWyYZK4Q2YwCG4mXVYGYDNB+gYn5QLbCWBMBAKysAl6zXyNpWZXXYsdKIFkcqQm0Q5q9SnHPzm4K5xJbsJCp7yGGmIwWE4xgES3FLw0orwcQ3m8kbVBdbdILkPCrnksK++G2GGJKcr6JX5Occv83eelsrjjz1t9BxE2GjuEjfmCj1fID74sAiwJokOXq8pISWFl9NOQBoU8KJUhnqCmqd3V1iwv5qaL4DPAAa5sy4ukWJD1C5cC6E55z3bmYUTAJ1KakMRNuXzKLK5KFL7ywW35D9tC815JeSgQcsufbqLahdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(136003)(376002)(346002)(396003)(55016002)(4744005)(316002)(6916009)(6666004)(9686003)(5660300002)(83380400001)(16526019)(8936002)(8676002)(66556008)(186003)(66946007)(66476007)(26005)(4326008)(6506007)(2906002)(86362001)(52116002)(7696005)(478600001)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZwXXLO2GwFLIMu1o2cfHKqFTcP3Ynksx0d2V73N7dI+/+iRxWRAOHkql1O3V?=
 =?us-ascii?Q?Ik3HefutyDBrL3b62zAtFOsx19dYymP2ryfmTqF3aWFZxCXRkeIJTgPYpAJz?=
 =?us-ascii?Q?7LkEmc+Zrazmfb59pPK6WHsZ3I/2T8V7qv4F2vvw2MvOyQfVipHfIAB0Yf+o?=
 =?us-ascii?Q?mszTwOOVRJaDKu4Y0xzJJ1/U51fgm/UXI7YDGBZoQ+CFnA7/NuFeKTzrgDfE?=
 =?us-ascii?Q?OympZDsxobuHizqmLKWfQ1MzNjQDgwEHmTAqaEdgdGmrW6ttwcnG8gnUi3ug?=
 =?us-ascii?Q?hKdu5P03+ExL3prGgW32Oa7OpEGY0JDEj626g02KZ7rujmW6EIggpxixdHd0?=
 =?us-ascii?Q?D7NAgHLsuyf/jqIcaChHwnlHnsDuoGntsk6Q6C52VePWSZPIa3jFUCW2hspd?=
 =?us-ascii?Q?Ev03QuW2a6QoJ6GQTbXmbM+xZSoD+V+gfVdtOzSOm8eKkZTOTImuZ94H3qHe?=
 =?us-ascii?Q?imUfFsI2Z0pnmLg6RUWD5ggNg8c7pMJokgfi0rlfN97D0hjmTy9+S2ztr3t8?=
 =?us-ascii?Q?un1zLGsQVFZ9mSTbPm4CcjWPVqoAC27Ji9rdCl5GIkvQPZNJpTKSeGGnzbv+?=
 =?us-ascii?Q?955zpowjScaY4kDkyMLE5OkTT5XBiXaG37mxT3WslKpm7X6tfYei12p94p/W?=
 =?us-ascii?Q?0MYBlAwVqHQFULsxYQ+1/bX7dU8/MsjZN3EEaglLogy4BB+S8TWqhyS13cLR?=
 =?us-ascii?Q?2Ngh9So9VUWau29um5n0nNyYZv0f5NaEDNgleHsmjRWeTH8GtG79k3rUWBJL?=
 =?us-ascii?Q?X/dwofrkg+fLRj8EUvCjYyQqEacBJt+mvjZ5sny7hLWL1WR2NRTqC4w3it3o?=
 =?us-ascii?Q?2WszcZ2KAjtCKwNlloLZdwU2d/mLf+amfLqCVRLHrpZF0KOIZ1VbIY7A8Ug/?=
 =?us-ascii?Q?NChqbVLMvt7g1N5GmPYljtL5hC3aw8OdZKQY/IPWvEN7rNnZbSriE6SyQUm4?=
 =?us-ascii?Q?85dRutTM+m3A2xohhA8YScHS9ACgjPq3bPQ+xEnVcduhXimkiCF7viPAvR9p?=
 =?us-ascii?Q?oc3O53rYb+aANkWeHVRr1gArr0O7QNdKGdtlSQv4J/a/n0JowFKC8aozzySp?=
 =?us-ascii?Q?itLeZpHr?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bea36ee-8256-466c-73e1-08d8c550a249
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2021 18:55:38.5762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: elatuxoY6bkmT/LgwYGfWa5ab9heoZw/rAIEi0idHVOn1XrrI4H1j8WtGR6dOodAtXE5nMcWm3wjRaPTYyDxm0U8njWDJhVmKBFTuX8j45g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6204
Received-SPF: pass client-ip=40.107.243.111;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
Cc: richard.henderson@linaro.org, cota@braap.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jan 29 22:23, Aaron Lindsay wrote:
> 1. Is this considered a bug or a "feature"?
> 2.a. If a bug, is there a good way to detect this from inside the
> 	 tcg/plugin infrastructure and avoid calling the callback for the
> 	 faulting execution of the instruction?
> 2.b. If a "feature", is there a good way to detect this from my plugin?

I think I've convinced myself the current behavior *is* a "feature", and
working as intended since the instruction can be considered
architecturally committed, even if it faults (ARM statement). But I am
still unsure of the best way to detect whether a load/store instruction
has faulted from within the plugin interface, so I welcome thoughts
there.

-Aaron

