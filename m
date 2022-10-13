Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312FA5FDF24
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 19:39:42 +0200 (CEST)
Received: from localhost ([::1]:59226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj2BI-0004Mf-CJ
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 13:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1oj24U-0000wG-Uy
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 13:32:40 -0400
Received: from mail-dm6nam12on2082.outbound.protection.outlook.com
 ([40.107.243.82]:1857 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1oj24P-0008Ae-Jh
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 13:32:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULiOhGP1zK9tajT9HfLK6Tz4xEUooG2y+evYMaP6h7xSiMi+vsQzRcc6/JWMzPtMFLIcrqy6GhXwS71NyWrHqEePsRdJMRN125HpKWK9XvBsf5CwEQn7/3LVzwCVpjnZXrG6ftAUEjAfvbC4s8kgWjpX87VBmOciBN9XvWfl2KPOe6UiPNGhleJyxP1XXbSnzbNzoBP8QsG0R+ISbOqqLGTJvB0u29lsjUP7NyoYw4GnJr+1k5AxEqmSFQaTSym/peLo6iLj8+BIMfBi8sg9jDovBgIc02mkUA2Cq9cuw9w2BdoZdcMljEB1fw3VSYeoTfCcP43ZwtMedkfy6u83iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9OStwsGnhMYr9+560mY/LU2tpY02Ns9Thckun1B5ZM=;
 b=EGEwpp7Fp6r84sfq/OoXhNNZ/hWee5wmpcIH/vSTXRhFFjxVCLEYHXj4OsIcCsiXyL9M9bUny79hmapVVlrZKfJyPYofv1wITuhHeQQ9g+IJ5seH8NBFh2uayUe467Ykky5TJROB0n2CU9X7OiJZbFyXeCbn4Q9AvCwvKPbO7jChn7S9YfuMDNoqlkOkO3MUXiVN/YabjdB/5IYtojoNAYA/ELcAQOIbKgrJhptsnb9TCn6++laMTqZDKT3TZzTOpwNm3usP85ry2WfTHrdTqzs9zLUKho+Doe/wHAaDUkA8mSL3F2YWFC3JYFg77vLD3WwGBo1t5nw/xWidkWLDjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=memverge.com; dmarc=pass action=none header.from=memverge.com;
 dkim=pass header.d=memverge.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=memverge.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9OStwsGnhMYr9+560mY/LU2tpY02Ns9Thckun1B5ZM=;
 b=EcFYl7OcP1I/G5q68vrkPNhy75/BGUGWDLcl2F2PDENlZlrP0/Zj/Pm4m7zryptxPCTq8EAw9e/yWs0gGc/1LXQ7nMtExWLQHG6jxKotGIkdzEQk/bhnnKlkZWtvxYSXAcJIXdxSdaGVAyboUV0K0yNY8S73GdVjI2mRxse6A4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=memverge.com;
Received: from BN6PR17MB3121.namprd17.prod.outlook.com (2603:10b6:405:7c::19)
 by MN2PR17MB3853.namprd17.prod.outlook.com (2603:10b6:208:201::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 17:32:28 +0000
Received: from BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::655f:bfa9:e33a:5af4]) by BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::655f:bfa9:e33a:5af4%5]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 17:32:28 +0000
Date: Thu, 13 Oct 2022 13:32:26 -0400
From: Gregory Price <gregory.price@memverge.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 Huai-Cheng Kuo <hchkuo@avery-design.com.tw>,
 Chris Browy <cbrowy@avery-design.com>, ira.weiny@intel.com,
 linuxarm@huawei.com
Subject: Re: [PATCH v8 4/5] hw/mem/cxl-type3: Add CXL CDAT Data Object Exchange
Message-ID: <Y0hLquDTg8jv9SbE@memverge.com>
References: <20221013120009.15541-1-Jonathan.Cameron@huawei.com>
 <20221013120009.15541-5-Jonathan.Cameron@huawei.com>
 <Y0g8UgumJwqU4QyB@memverge.com>
 <20221013130840-mutt-send-email-mst@kernel.org>
 <20221013182144.00004466@huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013182144.00004466@huawei.com>
X-ClientProxiedBy: MN2PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:c0::21) To BN6PR17MB3121.namprd17.prod.outlook.com
 (2603:10b6:405:7c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR17MB3121:EE_|MN2PR17MB3853:EE_
X-MS-Office365-Filtering-Correlation-Id: ba5dfe88-b1e4-4520-bfd1-08daad40e6a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VZnQJI/FcOxQXooL5yFQgGAIqEei7amC5+c/kvYlQ7bKP4w+G8BQuoY4gIyK8353yNnlVG6mI3pNFh5U2sHTbqlTzHSQOKjjbqoQOb4vUekv8PSSXjA6/iqgH7qpOP/eu2isW5nUt1FKwgTwSql1AYJdMkuIjfM/AI0FQfAta2psw43Kd8Jr9x/wDoVSwYZksQie99E58303LwuumtouL9v6Xaut3PRTUE7RKT5XYa0gSStT7/EP4ZHrcaviE35+uaGzQsfnDia7htg0BbXEIg4w1N5aoFffpxJi8V1YcBcni+2d5VjxOXzE6JDBz/8Ui2+W3+ldjRNRlKoVQ0O+sOWUBz7UtOr4qhc7mJPj68pPsmQdyw5lqgja7F5WRCRKmC2i9sVWwAT+lWtd+3dKjscmJ7Qvn8ABVfGjyZdUKqpK4kjhpmkXV+FseN/94UTCORGFfXkjQ9lLkj4/uTNWC+5ceSonJTCdcAATwPu+tfUdN6A1RWz5LgGlzhC+k3en3sQytT/4EgtIZZWbCSTPrtOkWYojNM/6+e4bxqDf/7fto36W2pmRdcEialrpivZTgJtH3iifLRnBLXV8Qr2my0R4gjut7n+raK2eZAFerwYr6hBgAIzrLyngpj5bg+gnkKTb/trFmX8AKxFID5gfpWBjETCAAUU2bJ65+gIKTx7Ugomp0hT25RQ7GSozGfR19s20BGqi++b81Zwyj3Kwqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR17MB3121.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(39840400004)(366004)(396003)(376002)(451199015)(8936002)(36756003)(2616005)(316002)(5660300002)(44832011)(186003)(2906002)(4326008)(8676002)(41300700001)(6506007)(38100700002)(6512007)(26005)(66476007)(66556008)(66946007)(86362001)(6916009)(478600001)(6486002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gz2j1+zMUpG+vRaN2yfa3+TLQXhV+cYSQRE46jzMTM+EOSTIDYY6+GW3bUw4?=
 =?us-ascii?Q?RaC1g4dNPSuJqdhGZiPdUD/EL8pKvWAQijtC1zIhuhITQnCUQfmK/1Ho/CQf?=
 =?us-ascii?Q?737/6aGeYCeHZAQo4Q22qI9LDzTKlfP6RyVvGjFZffDNwOLagZFgjD7S1Ctr?=
 =?us-ascii?Q?DSIffa/DtxGuMV2/gVwiwaLNh/mtn8wZLP4XPnuJMVgN4ACROnwo+zCbQpZ6?=
 =?us-ascii?Q?xZdUM1kd1Wq0cE85vPOZjUdzZzr4kHduVSE9REI56r0wstzjhg3GDdQkLp41?=
 =?us-ascii?Q?SCyhTWScsC65jA0wgYCONo7hgIgon2DEdp+IBlfrkPBGrXULkRlnVTN4raiV?=
 =?us-ascii?Q?dR4QKVlD9XKOgN2KPsU+v+qUkuCgeajZPnyyrI04hZ7BJzarUkPmD9v2hANy?=
 =?us-ascii?Q?ZPlOPQWJJieItayNVQkCvodT9ef2cawn1VBYRjBmJDEV6WCr91YsCHtp6/8d?=
 =?us-ascii?Q?FG+3hmRZ7lsYF8xAyq2jiHJ8GCdT3wC+EruHIrnaNnN1yG6718jCfOrjILGb?=
 =?us-ascii?Q?mHpIWXQbpUO8nkA7rnXN4vqlZz2PI6X/EYsrwIFWjAc/7Xt6tp4RKh1CrrnW?=
 =?us-ascii?Q?jOJ7RlRQIxXQ+zFr40y0O21Dl8LYQXDM7cjw2stMw90goo8lN4b2GQ5vjltS?=
 =?us-ascii?Q?4gW0Lm8dlC0Wm0tnWs7Fk2OBYyk1I/MglsjdXfjShXLP8Wg3bRsekyFv9771?=
 =?us-ascii?Q?xoGz25VPqiKBVdG6WQC7c6kc7S4ZFxnjgvquyIDvlYEoRUihRBPQuxpdXI+V?=
 =?us-ascii?Q?G9wg4FVE8/fiZWwIPriA57OxFQd4+C5mM1WUF3vkw+EAjAmVip210s+M+Sll?=
 =?us-ascii?Q?Gmua1A2X+4JMe4SrmnuOX7pTBp7A7fegE+UkFswZjTyNz/BGDbZPcs+xqh3e?=
 =?us-ascii?Q?COULaJIN0HvjvtmV9R9L86dQYswaFWBdGxLGhV/LClDEXt7SN6m6Lz5YbzYO?=
 =?us-ascii?Q?qbA7zACzRH2piyIJfpBn51pjSMZPItl3KidT2w6UJmE/+b67ouJ/npbBC1Ef?=
 =?us-ascii?Q?Y8imLHW3a0Uaa2oap3rPJONyvoQi3XYW2Bj9j//7jZmx+H1c1SydkrDYg7zD?=
 =?us-ascii?Q?KWRCHx3QR/SMgZ9pEY7UTR08f7A1nwrMYovO1P9V411yO87O1iFg9KdYX08A?=
 =?us-ascii?Q?wFYwR0Ac+FtPqOTwxqIX6FPLyqPu5rVfYQp/nA7uF+erlUFJNe6Yr1dbg64h?=
 =?us-ascii?Q?3z7VlHYIz7s2iOM+ma/TBVr1+m1ob859yedXhXMcSHxfmcGprMgBGRc7sMm/?=
 =?us-ascii?Q?tdKb6BehgqFQLQKyAAL0VrAoywnOaCw6Pd/Um175fxdqvv+7TP6Cb4Py0mDd?=
 =?us-ascii?Q?IqYAwAIAuMwZWqcG6qK3lbKenqUbB13bnowqU3T6dZBAaNPVJBeAj9LVRNok?=
 =?us-ascii?Q?Yt+Zx+mjuO27gmKIizNa9ChfBzFyNO3ysCA5TU3rt541tz2eXZvO9333c6Cf?=
 =?us-ascii?Q?lYxKohp7+wQKXG9oCwZavBvD1ZvXyYPn+neaL5kSYNk0Uf9YCNs2Xk59G6BP?=
 =?us-ascii?Q?Xg5weTDl9k8Q8cKQHemPi9K/OR4ShTj1JHElExFXEjjOI5VJXUvnAAK93LyR?=
 =?us-ascii?Q?lUgEl/yMLCtcmy0fEIthqzUpcwcPnYf9dJzPMI/gdT5fG/oySrUeR8yYQbS+?=
 =?us-ascii?Q?Tg=3D=3D?=
X-OriginatorOrg: memverge.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5dfe88-b1e4-4520-bfd1-08daad40e6a8
X-MS-Exchange-CrossTenant-AuthSource: BN6PR17MB3121.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 17:32:28.6927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5c90cb59-37e7-4c81-9c07-00473d5fb682
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jfg+eFfD5yAS5tD0/3qSsSFcp1lPFnigAWnGc5JlYdy+2nPCwkyQKYmfU1eGFMJjx5jnT3CiPm8grUsrDi9JGmcCGx+KBY1bqz83tagKcHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR17MB3853
Received-SPF: pass client-ip=40.107.243.82;
 envelope-from=gregory.price@memverge.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

If you're expecting this to be dynamic in size in the future, then maybe
what we really want here is a function

static int ct3_get_cdat_size(CXLType3Dev ct3d) {
    /* TODO: Dynamic sizing calculations */
    return CT3_CDAT_NUM_ENTRIES;
}


On Thu, Oct 13, 2022 at 06:21:44PM +0100, Jonathan Cameron wrote:
> On Thu, 13 Oct 2022 13:09:26 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Thu, Oct 13, 2022 at 12:26:58PM -0400, Gregory Price wrote:
> > > Other than the nitpicks below, lgtm.  Not sure if you need a sign off
> > > from me given the contributions:
> > > 
> > > Signed-off-by: Gregory Price <gregory.price@memverge.com>
> > >   
> > > > +/* If no cdat_table == NULL returns number of entries */
> > > > +static int ct3_build_cdat_entries_for_mr(CDATSubHeader **cdat_table,
> > > > +                                         int dsmad_handle, MemoryRegion *mr)
> > > > +{
> > > > +    enum {
> > > > +        DSMAS,
> > > > +        DSLBIS0,
> > > > +        DSLBIS1,
> > > > +        DSLBIS2,
> > > > +        DSLBIS3,
> > > > +        DSEMTS,
> > > > +        NUM_ENTRIES
> > > > +    };  
> > > // ...  
> > > > +    if (!cdat_table) {
> > > > +        return NUM_ENTRIES;
> > > > +    }  
> > > 
> > > the only thing that i would recommend is making this enum global (maybe
> > > renaming them CT3_CDAT_[ENTRY_NAME]) and using CT3_CDAT_NUM_ENTRIES
> > > directly in the function that allocates the cdat buffer itself.  
> > 
> > 
> > Yes I think I agree here.
> 
> Ok, seems a consensus against having this local.
> 
> I can do this for now and then revisit if / when things become more complex
> and this becomes not global.  I guess a potential case of premature flexibility.
> 
> Jonathan
> 
> > 
> > > I do
> > > understand the want to keep the enum and the code creating the entries
> > > co-located though, so i'm just nitpicking here i guess.
> > > 
> > > Generally I dislike the pattern of passing a NULL into a function to get
> > > configuration data, and then calling that function again.  This function
> > > wants to be named...
> > > 
> > > ct3_build_cdat_entries_for_mr_or_get_table_size_if_cdat_is_null(...)
> > > 
> > > to accurately describe what it does.  Just kinda feels like an extra
> > > function call for no reason.
> > > 
> > > But either way, it works, this is just a nitpick on my side.
> > >   
> > > > +static int ct3_build_cdat_table(CDATSubHeader ***cdat_table, void *priv)
> > > > +{
> > > > +    g_autofree CDATSubHeader **table = NULL;
> > > > +    CXLType3Dev *ct3d = priv;
> > > > +    MemoryRegion *volatile_mr;
> > > > +    /* ... snip ... */
> > > > +}  
> > > 
> > > s/volatile/nonvolatile  
> > 
> 

