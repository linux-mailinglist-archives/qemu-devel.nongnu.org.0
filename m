Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5783396F8
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:57:15 +0100 (CET)
Received: from localhost ([::1]:57840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmyI-00069i-RN
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:57:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmPo-0002TY-TC
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:21:37 -0500
Received: from mail-dm6nam11on2133.outbound.protection.outlook.com
 ([40.107.223.133]:41312 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmPl-0000hr-J8
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:21:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aORiGibHA/+/zKE+SffKg1pzKS8mxs8QPDKJ5fvLatjnKdU9XRAqGAH/hpC/oIWGoNzTIFbTrDrTFEC7LW3AOv4OGe/LURDg0HTmKVrT647ppWu6RLB4zY9ReBfLqZZVLdvIHh/ESn2oIBoXgql/cRE3hJfRNsIrrfesDYZMD4HsPc3bI3J+xU/FeW6xBLbx0frYkFKz6sHZ2sZtOyIJbiZA5P71uFWQ81sbeKqAEsC8sykBY/KCOKLwdtvRbdgMlMxO91nctSFlISFScCGWgiFmXfKNo134L5UTTUynPhrU9uVOCMbHbQ+ryacn/EsiWuJXYGN88t8+vxZeznCIdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bke1W6KEdSig5dApZ9IAG8xpMjQ8YmbOZ3FLnv7Uj8=;
 b=aeki3hDpe26Uvi6T2j1iG+4XcDPGWJj6cSjMTt97usAEx+pY2XPs6P5XrDmJnfzEGRIGFu+56V+bI/ck6db9UQlalxH45lYCodeibxvRXp/+FyqN2cLD5pB0nhyp10p/CCYC8Er+7BDiRAkYq3oiOYITsD/SUXDwhyYH3kQ+5DmSOHTNHPl6YlqhFjD+Zg2XNMQgzr3S2y/eXL9nd9+U/k/HfB4S+mbBAoMfc7r5RHLVtWWh0mfnsbhyCMCf6rMx5Xi769oyVWh5CXIYJLzBDpvqNkImE7GxOWp7+FFQSKJlGxFJJAneFuo3jhvI/gDnZEJtwqm3h9OJS+zV21S2Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bke1W6KEdSig5dApZ9IAG8xpMjQ8YmbOZ3FLnv7Uj8=;
 b=l8DevRjhN/94oOUb5BGCGkwDMcgZUF7EWY1u1ES4opgUgunaVnnHgsJFj+Zfq2NRG3uDS6XMfvUiXlXuVdLsYC0oULct+HTZ3ZfmD/a/vQ1uuJYmcV8QS+e6IH1E8Qn4tjGZWnnEz7l36cmr1S+Wxap9eBJL6s96cdQvI57eLSM=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB4895.prod.exchangelabs.com (2603:10b6:805:c7::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.27; Fri, 12 Mar 2021 18:20:59 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 18:20:59 +0000
Date: Fri, 12 Mar 2021 13:20:59 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com
Subject: Re: [PATCH  v1 04/14] plugins: expand kernel-doc for qemu_info_t
Message-ID: <YEuxC4Kx0tv2YPTq@strawberry.localdomain>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
 <20210312172821.31647-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312172821.31647-5-alex.bennee@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL1PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::19) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL1PR13CA0074.namprd13.prod.outlook.com (2603:10b6:208:2b8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend
 Transport; Fri, 12 Mar 2021 18:20:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10f9c2e8-6b58-48be-d63f-08d8e58395e5
X-MS-TrafficTypeDiagnostic: SN6PR01MB4895:
X-Microsoft-Antispam-PRVS: <SN6PR01MB48951B42D3E84F5703A5B5348A6F9@SN6PR01MB4895.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WS8NGr9kzPTTw2/+9JGOLnh1Q/jJwos3Qm8DfCtvPKoFH4bTm/446P8iJqDqGRTnBS5Y8WRaCAF7K7L4WzXlwW0NoKyPGgsMrpuBcsBsDennF9l4otNF/jgkHs5TlaY2wQp2G7Vjenqqt9dHkLH4PXuZ3FMwFEm4JGRfcnyG/FAjQxqH51i3GGE2jinXngwp9aBO/b3APqJkcInt4aZUEg0CLy9kFqJ6mGcylfQLmPn2+QCPBDGa7NcV6ZTf6/e/7DvxdVTTsdXEvG0Bgmd+woJ4V7YKQId1Wqq9TYVs16JoHpabyO2bEYDqHfamvVLVdiOb4QytmgMaO1X1JpwEE6V0XsXOvz2gKzjvGpXasnIthcWL4B91rPfstsDT/9uGibP2mw/gnKxW5C3pCWpOMSidMZTTxqW9mHa7MoWII9CNqThhxYEYilm/EUW90FoE0M8a/+codDBae5emyiAaNRrVNSILg3jO4QrC+0H9zaWnthYMP6Uxpgqw3ylaP5P92eO3WOw3ZA4P9lXyWBdfR5TzcVNUOV/mTrFzVB0yOH4KpBK79YI/OMfysIhguIDw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39850400004)(86362001)(26005)(5660300002)(7696005)(478600001)(316002)(186003)(8936002)(16526019)(66556008)(66946007)(66476007)(8676002)(956004)(2906002)(34580700001)(4326008)(52116002)(6506007)(6916009)(83380400001)(9686003)(66574015)(55016002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?l5PtxI1HziUuxAJnobgvn+8Gsei45H1Ltf3I0rT5xOrcxgpjmfhdowARgt?=
 =?iso-8859-1?Q?dEF9T2OPeaNscK54t69VpYZvcixJrZW3wvMYaJs7Lyd/C6b3cObJEM+9fJ?=
 =?iso-8859-1?Q?9NYFkpUe4Fu6JFNtAmfXe2MDsyNLBGWNV/39WnBKsNrdedJk4xj04ECguY?=
 =?iso-8859-1?Q?gX6MgX6dQN8NB5pIevxqGAy+VF7/jW2Ue4rohV6iTvsIOtKxSJgeq5rF1I?=
 =?iso-8859-1?Q?D51aJZuL4KMXqV88447sM55wnX6QlneQv/QYYX1VJwagnvAeL7fWQ3J/Tv?=
 =?iso-8859-1?Q?MGN7hd+UGw+k5FNZ1VNB1wr4jdQXVu6Ltx5iGsJa7uN8N7cBmpMqNbxSbl?=
 =?iso-8859-1?Q?IcCh9ALSdDhUfCtw9VYSvUsI5mneC656QAGsINAZnQuORqBjcZrAYbN7fx?=
 =?iso-8859-1?Q?g1dfk5jnmapQ3OYKoyqHRrws4xb3QGtK+Rgwk5bnC+cciGVPIqxLhB3B83?=
 =?iso-8859-1?Q?OxYgQeFw4/BDY5haaawue9NWih9H4F/KDZADwBSEv7a6y02um1F3z+Ej76?=
 =?iso-8859-1?Q?mA1faMsXdHjllPGEuV0vKgr4mFo8RFsUxPxQGw6GvxHadE96MUe5cZsgrO?=
 =?iso-8859-1?Q?AOK5tWBpPzXSRP8KyyghSXKr5ZgvQXDMSvlQwRN8k7EDu3MnbrDL3lifuc?=
 =?iso-8859-1?Q?/AdkZS/RXBt6CEnWzKexTL3Ii0YMoNpN/JDTFjz93RGwWD+snmHGIe/eMG?=
 =?iso-8859-1?Q?ErxQhRFXE0DsN3iWww3YQpaSHk4V4ChMpYVNC0eo4aYCr/wTPlvV7/vHTT?=
 =?iso-8859-1?Q?3PozcgO++wKpVFiO1HTm7iDZ7nQw4UOLqyfyxngXa5pKVKC3XXVEHUCQJ+?=
 =?iso-8859-1?Q?3s57zWBpDozs6s1SVzL6LUDUPocV2mxACWmUojGHE30wyvVO49uohqTjRL?=
 =?iso-8859-1?Q?fYoJGpDfoiXCO1JopanIzDSx9vS5GDB8TUHdwTkoX59wz+pFbAGl5vIOUc?=
 =?iso-8859-1?Q?age0ESbZrqhnCmXQNYWWzcuTy23C0mWB5g8cDLlM5PaZrpI4MsGQUNyPrM?=
 =?iso-8859-1?Q?eB4iminqrM79EpmswIzN+ug6LOI4scwCHMayHRTra583+/rx/+TfxI8Ybg?=
 =?iso-8859-1?Q?gwRK7VjLtVPgLCgkI0VS+9ajx0G1laX8WnSZON+1zKLGsJwx7M2u/7N4EH?=
 =?iso-8859-1?Q?UY1bOZOxgUly/cKOZPyAnfsqqpoO4R+slOtIlVh/+F3OCzm/CEK2TJHiyw?=
 =?iso-8859-1?Q?vgrC5G1Kajhba1N3yUFsRfuZHYHSqnQDHvDMdfMHpq7l4RLt4GEBEP1AhO?=
 =?iso-8859-1?Q?puJjla//Fcgua+91iscL2Q1uhIZb0CycRxUx2sH6wjvWvx3wBoArOd/wdf?=
 =?iso-8859-1?Q?AY6RmMiBHdiWtWNNFnZkFXvET6DAZcOlwNUoLoPzqA/0gqHLscTPniu3vx?=
 =?iso-8859-1?Q?doIS638fiB?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f9c2e8-6b58-48be-d63f-08d8e58395e5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:20:59.3408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j914EiR3Y/Tk/Y03IO5Wr1scU1dgNVAtsENW8BgPMBlU6/Nc2PLiUKmQqFa5Yah/5D1XLR4i35YjIeKh8AM7cktMlzKPMNtDD4iBqiDiQzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4895
Received-SPF: pass client-ip=40.107.223.133;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>

On Mar 12 17:28, Alex Bennée wrote:
> It seems kernel-doc struggles a bit with typedef structs but with
> enough encouragement we can get something out of it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Aaron Lindsay <aaron@os.amperecomputing.com>

> ---
>  include/qemu/qemu-plugin.h | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 3303dce862..4b84c6c293 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -49,22 +49,30 @@ extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
>  
>  #define QEMU_PLUGIN_VERSION 1
>  
> -typedef struct {
> -    /* string describing architecture */
> +/**
> + * struct qemu_info_t - system information for plugins
> + *
> + * This structure provides for some limited information about the
> + * system to allow the plugin to make decisions on how to proceed. For
> + * example it might only be suitable for running on some guest
> + * architectures or when under full system emulation.
> + */
> +typedef struct qemu_info_t {
> +    /** @target_name: string describing architecture */
>      const char *target_name;
> +    /** @version: minimum and current plugin API level */
>      struct {
>          int min;
>          int cur;
>      } version;
> -    /* is this a full system emulation? */
> +    /** @system_emulation: is this a full system emulation? */
>      bool system_emulation;
>      union {
> -        /*
> -         * smp_vcpus may change if vCPUs can be hot-plugged, max_vcpus
> -         * is the system-wide limit.
> -         */
> +        /** @system: information relevant to system emulation */
>          struct {
> +            /** @system.smp_vcpus: initial number of vCPUs */
>              int smp_vcpus;
> +            /** @system.max_vcpus: maximum possible number of vCPUs */
>              int max_vcpus;
>          } system;
>      };
> -- 
> 2.20.1
> 

