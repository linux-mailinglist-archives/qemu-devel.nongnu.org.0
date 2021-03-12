Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0E2339775
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 20:36:30 +0100 (CET)
Received: from localhost ([::1]:34876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKnaH-0008B5-G0
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 14:36:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmXX-0006fw-SZ
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:29:35 -0500
Received: from mail-dm6nam12on2116.outbound.protection.outlook.com
 ([40.107.243.116]:5760 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmXW-0005KM-FC
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:29:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkcLa8KfLUtTPdI9rfap0xRdUQd955V26EjkifCIXlDM0WWZO3keWfBNeD2qMgdGekZoyjCtZjw4dGDa7LZN6HYZPf/Q0xWsbeBNXtFiLUUbJDDdoRFwt2WZRVtJLEhtmHaSQmL9Mt11T7CsG8l9XgN2AWAsIXnSFrfNR7EWUh/z2pmTpSTBz6VsPnnCogA5UfPAP9AwPa5Hcd+kgWwUjzmjDjn/eWUpyXmwuM1LLB95Wams776h9F39rxxF6fElb06nSxm4q4MQ3PBghWqUVnxfQpiP9hySwnDJX52t8Y9AeZ62s4+HiaNP/rXsp6naloPSKMbeh2N9fJNy/vZODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOSA55wJ3WBZ+mCbEsbiYyxD0zCMUBR+QxpAAFZx0xA=;
 b=nXeWaJxoC8cRrXzYcs9s46mDIwXbjJeOZBCKkUg/rrlpqtepkVxbFHgBNf8eNihzPxrL6kgH1XQlptiBe2GOL2IRaw0V07di6T3928rSXIUJP0i4AybLHYbmdeTnwz/LXuDfhbRuLRjtE1GYOBxDlgPpSVGQLX+WvwHKjT7L6YMWPVjppfjtdv8xuqze+LqcOdNM6NWsVB78KaZAEMMbgQVjH2ihYFa4h1bBAHMH6Kjw3+56pZJCy5d38XmzJdoKjtnhPSmiIkeMoqJp3PXcl3c9cF5gZYSoAQstpZ1jGySU7tMebQZPi9hit7nZn2bZ47isOIrA7U92uH3OkgcSRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOSA55wJ3WBZ+mCbEsbiYyxD0zCMUBR+QxpAAFZx0xA=;
 b=n8oMLZ76OIoa80tRsESbEXDeGc4dt+e7icGssw/o+6bBdQqC6AUx8d9tsvLoYxfzXKIfnyGn4JU4nIFbYtSKynARc7Y5UYq5vUCMuOTkABTKm8LFa1zCG/4Jd6VtI4JHZpkTJZhc8Qw+CCYDMir3T9zWpgRIH8n313MtwuF/xEc=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB4048.prod.exchangelabs.com (2603:10b6:805:b3::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19; Fri, 12 Mar 2021 18:29:30 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 18:29:30 +0000
Date: Fri, 12 Mar 2021 13:29:31 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com
Subject: Re: [PATCH v1 08/14] plugins: add qemu_plugin_cb_flags to kernel-doc
Message-ID: <YEuzC5GYBwpef05D@strawberry.localdomain>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
 <20210312172821.31647-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312172821.31647-9-alex.bennee@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BLAPR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:208:32a::33) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BLAPR03CA0118.namprd03.prod.outlook.com (2603:10b6:208:32a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 18:29:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 784666c1-60b3-48ca-b619-08d8e584c68b
X-MS-TrafficTypeDiagnostic: SN6PR01MB4048:
X-Microsoft-Antispam-PRVS: <SN6PR01MB40480F86843863E093C0C3198A6F9@SN6PR01MB4048.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z+kcKzUT6BAr9hhKMt+BaQ8Cd0nj78OaybxtumZQHgrHALyDsTOesAIOb7rIdBw/KqQIiHo4k2HWyzbDUY4Ywo0A5QbufUjhKJW/8U233jK5v/moXu9eXOsfylnQebL5Fv8YBftA2mXBxJSJxawJWARtcsoGYJSbc4kD6MslvkarZ6GAqvPbzNwdPIvwjezkVKzZrwkrmbYCu/ftbNkbFW2cRrOicnsbLO2EIO7PxrnjiDreOjXRaPKPF/w2ewEFczff0IQS3M4KVG056WZXOXSELSFfSc95j3UHQhbVg+rgobIUgrMT5DVvI82Ju+m2rilbJYd8iMKvxksmq7sbaCgC9e/+2InYsKLp2MtJUqLIczimkBroz12i7Zk7BsWwZ8dxw5caUbVEQFdj4YDN5JFwOsVV0Ux7zrMtPdXb+zviU0qSCEI5LpTicubhvyXFn+vSYG5NboLEslCnnt8mTcVsMT+9iIXxZNFw0Q/gMdMkWRyax+lmewA9oyTo65VKk5qe1ZO9XUyMbfgGCX+6C4rf52CBliNUQJe46d2qxYVX/MBGk3dSoUxr5JMydWwJN6CbvS39GTsXIliXwP9QEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39850400004)(136003)(478600001)(6506007)(5660300002)(66556008)(7696005)(52116002)(83380400001)(66476007)(6666004)(186003)(9686003)(86362001)(8676002)(26005)(6916009)(34580700001)(16526019)(66946007)(55016002)(4326008)(66574015)(956004)(316002)(2906002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?tNgSA+huLfGCcoyB1Wmp12lbCxzpHX7kCLrKy7T4GcKlzZ2+/iWuh+1u6a?=
 =?iso-8859-1?Q?UOPtsEF2nObXltiPQtz/EKzUw+l+qj89L6RAVtF2mtPcIaO3qvhM/61hZ3?=
 =?iso-8859-1?Q?BSUWcZ9px2xDD1YDanUz8KWJaz02jR2MNAWU+4QWv7W70x7fAKpwQByp3f?=
 =?iso-8859-1?Q?cLRebbUh+kG70kYmFHcwenuHeOtScjRe8Nit0jtyQK3xZppIZzwrfWCpqV?=
 =?iso-8859-1?Q?vehEzF57qXxDe2cA3uuMHG/oNo+nuZvVp1q8/vAsga5FDCws/MRMEbgh7I?=
 =?iso-8859-1?Q?SWXrj3mV6RmnmW1O29EtREkFLTqaoRb88Q+vrBBERP9bssfFmH7zQ7J+Hw?=
 =?iso-8859-1?Q?7ForqfODYpDsu1/6wLcsL6i/6peUftQaxH+BUv8Msd8LLOEJ3Bjxs07lcJ?=
 =?iso-8859-1?Q?78NZ7JG+Di2MHszxRWDudhfLPAmQK6ZYdQAGkUavW+M9lOHPub/pRP54fQ?=
 =?iso-8859-1?Q?BE+kiyRp6pw5vcJq8X9PREQ5GgtFNkHrv4Pkrl8myE4TaHC3f+jiYWi835?=
 =?iso-8859-1?Q?Z1E0eq/2UX9qSowNEWcNJetbd9yg9WBrqlnK95bXTb283Dwmuq9Nj1SqxI?=
 =?iso-8859-1?Q?t9gTrODG/7LljU3F55Swh9z74A+nBm3u+BFjcWbxbQxGkSiuWad8lfXOmf?=
 =?iso-8859-1?Q?n0GJvoCYdlyDGYJ72UUPS6Dl8G12ZAl5nrIo2lzYHpiz1gtch0Yo+SJEA7?=
 =?iso-8859-1?Q?SxGhADneFmFt/2jiK3gMIrFycZUT8FHnVvwT6OkuUG2xGrq0Ko8cPdqdjG?=
 =?iso-8859-1?Q?Ixqr2DIsNffk/fdZcwRybXGpaTjVh0RNepB7y3flOe1uOGwcawqT1MKjf8?=
 =?iso-8859-1?Q?UowzFy7/MEVZvCqkBIMZLU1z/KvXedO3OH2LIGeYWIVn3+mfcQ2smKtX6u?=
 =?iso-8859-1?Q?ndziub3nH6JePu1yilSmWQCZAHNcMqQvR8TSxY60Yvs3h5YxvqK0h1U+KF?=
 =?iso-8859-1?Q?zE5xeZAKzymxiBUbZkwMgw6ZPTeFbuTvfqyhmjqC5lSCr13huQ5rEJKLNk?=
 =?iso-8859-1?Q?CA5FT3p5SL0chlTOWAHelDtBfKEeEXmiBHvOAg8U5Rp/4TMQ1gL5gDYOCB?=
 =?iso-8859-1?Q?tsT+9NjSwEicwhx4A5vsFzTMTh36fxCBr0h+SkKbSBIl6YmGtu022nYLVc?=
 =?iso-8859-1?Q?bwMZAp/ee76bgrQ03g0/2nHpRlIAEe8rSN9HWVNGXavc3OOglrCSOmrlGE?=
 =?iso-8859-1?Q?XP+Ae/fdFqkEyh9QIs7OdAnhF4LODvdj1jx2gDn5Ve4GDoVR0SdjxSk5HF?=
 =?iso-8859-1?Q?373Gma6/9YxVZvicsOrTZzjFIkAI4izruYd/u9jt92IVtwBz6hXJIU1r3t?=
 =?iso-8859-1?Q?PAaUfNxQsx/Quw/c6FSn2CFycsqRQGMioIakIQXQ6Sb3YIN1mwD0ZuZFOn?=
 =?iso-8859-1?Q?4K6SLjfgV6?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 784666c1-60b3-48ca-b619-08d8e584c68b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:29:30.5212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8rWCgJ7r9w6OvCxHmfeSL0bIdMKDLdkxWQAcmIyj+b3RWYspJhfwWiqP9q5HlOo1VIv/Yw8/cZGQJnxM1rYjkEK0QKEAF9sgH20Cef2VO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4048
Received-SPF: pass client-ip=40.107.243.116;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
> Also add a note to explain currently they are unused.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

I'm personally interested in one clarification below, but don't think
that affects my:

Reviewed-by: Aaron Lindsay <aaron@os.amperecomputing.com>

> ---
>  include/qemu/qemu-plugin.h | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 9ae3940d89..c98866a637 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -207,10 +207,20 @@ struct qemu_plugin_tb;
>  /** struct qemu_plugin_insn - Opaque handle for a translated instruction */
>  struct qemu_plugin_insn;
>  
> +/**
> + * enum qemu_plugin_cb_flags - type of callback
> + *
> + * @QEMU_PLUGIN_CB_NO_REGS: callback does not access the CPU's regs
> + * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
> + * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
> + *
> + * Note: currently unused, plugins cannot read or change system
> + * register state.

They are unused in the sense that the current plugin interface does not
provide a way to make use of them. But are they completely free from
side effects?

-Aaron

