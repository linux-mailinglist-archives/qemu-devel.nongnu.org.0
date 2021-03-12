Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E61339768
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 20:29:17 +0100 (CET)
Received: from localhost ([::1]:46234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKnTI-00006D-Mn
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 14:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmTE-0008C9-JJ
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:25:08 -0500
Received: from mail-mw2nam10on2121.outbound.protection.outlook.com
 ([40.107.94.121]:44901 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmTD-0002dU-13
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:25:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4JjJ1S2NJACwxApKsU9L8EsU2ZX85e+Yhm/cE5wq/lIm2gwioeuaRtfgMxw1QBa+cvmqaQQdoeoBnRxCCkkheiap13hnmQWqDaDwUVT7Di0T+ixNTqsjM+E7lY0Xx2ZnmBoLqwtecqJQHkMVvarhh9YRUkGpL18oOn/nBfFlXbq4cyrs66SwJCQSJnvyP9NJsU9V6b3Qr4gZkX/0FJd+syZ5OLCK8dU1K3V6A1tTHABxtRxAaTC2dav2Fj1I5jtl4OTjans7F34mxNXjfkHiRvGufrV4iyZvlgtq2hXHGeW3xi366pq1rnYCs1gVwhjwMXQlvTKfrdBEXNVpRN5qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGCl8H4ung02z8xwMlcBUMgADsp1Ojaxtgh9HAJ+j4A=;
 b=gvslHni2cYmWwWgoGPIAsf9u6+I3qlJs1ssgZdYgvR7zr1AtGvkkvaZ1htOM5asIiovNkwieKf+yra1sYd/czdtOSY9H2wQWXwW+uhx5z0iXPDyuhkMaiWwSq2I1Cy8dbdhDyNbAFjxE/n2KZSkLIjJL7ZB7HXULAsruv50Xin1cqmNTOA3B9yMb8YaxTmZQoEc7gWZwWzSK8RlzjMHS0EKzFuVxW6lKgg6K/kf9GzrNfOWRRUYfr3r6dAriH8gYx22N9wPIR5QyB9CGu/i7WGLHH3Ura15TAnF6aQMAsgsdEKT0doOBlq1vdORe2RAyTb9Zy8UiJ/u8u8m0Kd96Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGCl8H4ung02z8xwMlcBUMgADsp1Ojaxtgh9HAJ+j4A=;
 b=tgydv3gZMXdSx5JgkPFmHodjFOQ4KrDYVltXXmmwwXZ9AajHN1JskrW35RVO8rUAX5nINONoKtyrdHtKqxzN/pfPZxqPzUaJUgLsIkbrWXIFHFXUogiLPr35xeLLw9er36QaZAvvu14u9snOAcuSdX/5yWvC5/XlR2W2VyRJRog=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (52.135.119.151) by
 SA0PR01MB6458.prod.exchangelabs.com (20.182.6.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Fri, 12 Mar 2021 18:25:02 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 18:25:02 +0000
Date: Fri, 12 Mar 2021 13:25:03 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com
Subject: Re: [PATCH  v1 06/14] plugins: expand the callback typedef kernel-docs
Message-ID: <YEux/6mWQYgJCHRC@strawberry.localdomain>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
 <20210312172821.31647-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312172821.31647-7-alex.bennee@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: MN2PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:208:c0::48) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 MN2PR05CA0035.namprd05.prod.outlook.com (2603:10b6:208:c0::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.11 via Frontend Transport; Fri, 12 Mar 2021 18:25:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df0dab75-5551-459f-3183-08d8e5842715
X-MS-TrafficTypeDiagnostic: SA0PR01MB6458:
X-Microsoft-Antispam-PRVS: <SA0PR01MB6458D453B89FE1167908E8CC8A6F9@SA0PR01MB6458.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vOFjtji/7K4TlVFGkNaK8mdx14wXFy25hY+hsxVMJRHjvlhCjcyebLuz0n2uT/g+eybvf95OHuRu1wUxgWyY45zCQyylCsLCql6YxS4KxpX5vxj212zV7O9D8U1kPTkHtX7XHRcQCQowhScKb8d0s70+Ui1jmn2elyXgGjCb4Qksn/S27mqo+0Ucn0/DLVkb9ICXHB9VOWs4fTmYl0th1dIsKfuZixi/7MwTs1zDoKE1envwsdFH+adrbuej9d63nbTtydY6u3MrzHCiZcleTrub1V0HlRfAl8PdDcFiupibeQXQ+MEarJ5TU7pHrGUvYcUbLsU+BnrRHV4oz/+4Ti4zLVEiI2i3WvwhMOrdKVEmAhyaxJTfvcy2XLY2caLL0fihVPPTRlf3l0bzWnoek3mLE5PyoQ2TYxKr/o8+oPwhehMCT+PioRp17l5iVJWM9xNoeiZl73l662H+YFaAt+CvwXvSrSTLqTVId8gxxvMu69KXOR+46feUs/73Hml9I22Y7JINHhzhcrG9ZoblrvF0xiy02CjAoNaxNa/oMhnFnwDQB7/hQnRhh6JcTK39PDzMz3r6utjURS38heQqon1eZ4uX6cbDOZefX68WYQI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39850400004)(6506007)(83380400001)(52116002)(7696005)(86362001)(16526019)(186003)(956004)(5660300002)(2906002)(6916009)(55016002)(34580700001)(8936002)(8676002)(4326008)(316002)(9686003)(66476007)(66946007)(26005)(66556008)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?WaMVf66q5Y1w8xxIEuYes+yh7hst7L7nKmF7W6xDdr0vHtofoGR4Z95dPq?=
 =?iso-8859-1?Q?Jyt2SOF3DPqvQvNLNXpG8Jtuwa08EUBaUn2OrH2XvkneVz8IYOcEvpdvnL?=
 =?iso-8859-1?Q?n/VMrb/J/X+iSfZLaaEE9fBgGOVLqRnQw0w59ZNDzFBVvJd5FOLu3P0sH4?=
 =?iso-8859-1?Q?zIAXEyIQTU7UdzfdCIctrOTxAHIb6t3CUb3eoA3asvmCKpPkLoieCj/Ow6?=
 =?iso-8859-1?Q?G4f/w9b5Y3t/AtFLCqWpWtMbE/XcDE69J6cwGzLpRXj44yv+oIkrBQ6vyA?=
 =?iso-8859-1?Q?TU8WaGeyK9Zo8ifldPVASpdOIkbvuAG3qb/rZdxIkuBvzsU5SL3CfWG7eP?=
 =?iso-8859-1?Q?Ku2cl1ZQM/9jJfnsemWeY2CL5IynA/FPlOLVmvJF6bhB0aoY/WouW2k9YW?=
 =?iso-8859-1?Q?MbB5JhpAy76Rb1arSFGIxUBEw9Lxd3zmf7sNxMPbKePldp700RyFs6MANU?=
 =?iso-8859-1?Q?YW6MAN4vm+ZdewPiK6V7vuZ4W7S5RzsP5ANph8zYNTrFxRziiJzzUyXF9k?=
 =?iso-8859-1?Q?uGOEQxVSPuYBgcXOtHkCSNI/QO7KiKw495k2iPlPY1FglbwNoeUt8CeNjI?=
 =?iso-8859-1?Q?vmh0DbvccQINDD5Ss059uf2VXbCU0RKr0AKQvAbdzTqGHU5O+N3Yrw8cB1?=
 =?iso-8859-1?Q?VW8gL7C8CnzYarS/s+8RbE13Ax2i7mgaDO9LugnZR2k7705rba5++GYVtm?=
 =?iso-8859-1?Q?kc/7WJmrbivBsQ418gKIEkqntdS03+6nAwKxC4KefnYQQBrfvo+0x4Dcaa?=
 =?iso-8859-1?Q?nmeEJO2/bXQRKUUHeyyX95qI/JXHPctP/oKyqhsbFxuAM2TrOZagtFyyvW?=
 =?iso-8859-1?Q?z7R00AgFrvuhDDQwopcPRthowX/qR8IonOQh7TspXuCqa5bVdmQ359dnz3?=
 =?iso-8859-1?Q?D2O3SBwNpkyxHeBcQfirRC+pEv+aWcNK0A2vh6C4Kjy3Y4dQ/AOM+eUtJB?=
 =?iso-8859-1?Q?9myoW7S/XZ/zrtgkRIpr95ogiEUe3bjh5rr16nV06Yd7GIeGhO7GCCBlJz?=
 =?iso-8859-1?Q?wU7FtJqoR/WQdz69OQtxS5+1ClujZN9uidTLXN9Z+HWHxGXW5mTi6XGv1b?=
 =?iso-8859-1?Q?Hoe2cXT8nqnDGEQgekoVV31lvzV3rZrh/SyKtr6XvKzU4GzBxmsZBQyHSP?=
 =?iso-8859-1?Q?NKMpkAdzP1jYPZL/hEEuP+s74Hkpoi8PzI6bJPv2Q4Sh0QJ/E5zMM11OIi?=
 =?iso-8859-1?Q?XJEjWx0K+BInnYVS20ZCCucqaXPC7BOmViFqVO6ZrhPnhYA3F7wIHeIthQ?=
 =?iso-8859-1?Q?DQKFguHiqXFkvvX/utCA6jwvGPXY5hTt28bPGKIMAgco4FkdHtXGbnvX3x?=
 =?iso-8859-1?Q?hXgkVAW1ur4d6875+bI0oV1Hn+ffhc9/WtzJmfRhwBJGmWHhH1LLeJSaFH?=
 =?iso-8859-1?Q?ysrJ2PZwub?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df0dab75-5551-459f-3183-08d8e5842715
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:25:02.8318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/hLmVcJWHFNER9p8korw/Vdw6WaUBV+ymryP+4O4fPktIKix1iHlauZi0lSTJDBs10ax1ZLYWpyefHIMr0ocp7s7k5R5qKGAFM/lBjCt+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6458
Received-SPF: pass client-ip=40.107.94.121;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

One nit below, but otherwise:

Reviewed-by: Aaron Lindsay <aaron@os.amperecomputing.com>

> ---
>  include/qemu/qemu-plugin.h | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index ac1bb318da..09b235f0b4 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -99,17 +99,36 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>                                             const qemu_info_t *info,
>                                             int argc, char **argv);
>  
> -/*
> - * Prototypes for the various callback styles we will be registering
> - * in the following functions.
> +/**
> + * typedef qemu_plugin_simple_cb_t - simple callback
> + * @id: the unique qemu_plugin_id_t
> + *
> + * This call-back passes no information aside from the unique @id.

Should we be consistent about always using 'callback' or 'call-back'
instead of alternating? I tend to use 'callback', but I'm not sure I
have a solid reason to prefer it.

-Aaron

>   */
>  typedef void (*qemu_plugin_simple_cb_t)(qemu_plugin_id_t id);
>  
> +/**
> + * typedef qemu_plugin_udata_cb_t - callback with user data
> + * @id: the unique qemu_plugin_id_t
> + * @userdata: a pointer to some user data supplied when the call-back
> + * was registered.
> + */
>  typedef void (*qemu_plugin_udata_cb_t)(qemu_plugin_id_t id, void *userdata);
>  
> +/**
> + * typedef qemu_plugin_vcpu_simple_cb_t - vcpu callback
> + * @id: the unique qemu_plugin_id_t
> + * @vcpu_index: the current vcpu context
> + */
>  typedef void (*qemu_plugin_vcpu_simple_cb_t)(qemu_plugin_id_t id,
>                                               unsigned int vcpu_index);
>  
> +/**
> + * typedef qemu_plugin_vcpu_udata_cb_t - vcpu callback
> + * @vcpu_index: the current vcpu context
> + * @userdata: a pointer to some user data supplied when the call-back
> + * was registered.
> + */
>  typedef void (*qemu_plugin_vcpu_udata_cb_t)(unsigned int vcpu_index,
>                                              void *userdata);
>  
> -- 
> 2.20.1
> 

