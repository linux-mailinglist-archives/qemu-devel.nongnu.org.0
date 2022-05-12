Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A215A52585C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 01:33:59 +0200 (CEST)
Received: from localhost ([::1]:37964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npIJi-0006OO-7O
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 19:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1npIIH-0005ji-QL
 for qemu-devel@nongnu.org; Thu, 12 May 2022 19:32:29 -0400
Received: from mail-bn7nam10on20613.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::613]:33761
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1npIIF-00035p-DC
 for qemu-devel@nongnu.org; Thu, 12 May 2022 19:32:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIfOynTjUnSKZfz07GyPlBsYIXZAfWVW+0z5v55BtEbfkkIGZzvtCUU6DOlzEFalrsPxX3F3rJTEtfSQOUZEq/Y9/xL+xhWxoJE926stp3J/elIA1RuP+GhmB/lrvjd7CxzGlU6pIdwlz84m4ydJNNG6jfNvpLOLBinHOg+06mloia1noGAQ9dUPPd4N7E/WcX19wgBO/viVmyGKtoK5u3IHMgNDBzFy09renm3lfCdLplWuHwwwBWVVQJ6O12yx7xH5vs5FYT5TDIzeGtsELz6A1LkVI+W3/R1BSfDZWn6fJlilpbpIEkykCaQqUBYRvtCAs7YMnKx/WEBOSmfRAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yq18otl4AuibhkkwD4HDJTfC/mPRvLNyW7uK2dovsGQ=;
 b=JiGCWU4rb48Hw4IuiO78WF0lQVM3vMBK5tnd44YWwjwsvSFgDp+zRSik6Zd53AXYVkd2EMIsC9DV7wFPz1jUrvhvK9uEfe/kGd34am4SrM/QSUzGQ867mfCFxbXAlDWXXHzT6jvyU93Dp4lEmfnWYdEpyokJ95Pvh5y00MI2MwSGiOcIYR3qE1+5iwHUpxy4asKl8OWo8UdHCSRP2MywOWBxmTDovt/sXc71FmiNR0eKFveXirdag6X9YUV3ZykKjb6BZ1sJjcdKEqmpPIhPBJ1J93kNRipyFIp34PAAGo8kj+UINwb/tGz9XcAsMqUBnIyYTkYXHy6u4ujyQVvrkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yq18otl4AuibhkkwD4HDJTfC/mPRvLNyW7uK2dovsGQ=;
 b=Mc+rAkSvt0jCQ8tSbNYhRKTPsh81n/u7FFSAX+YJE3xudTVpmmobzDnw5m6OI69IX7rPW9+cHZjyBkXCgbFgNXnWsoeso4sspaffyjPLkpABYKnqya65lIfC8vEgYmfM+qyH+m+mNLMJG7CeGVniUq5hZgdWtqOXo2gaXKWJHqQe38YkryCTTcGkJvsK+PjHGJ8ocVSlpcmbBNWeyhg74E1AvAPJO8nRfvRwvmzrB7tKZHH7VBSjgkK/H7CTuQQfD8zD82C8MPGJqidNkfh0xDyMpQLOVjOOlFTFS0j6oQ6KhjI+vQjmjJ2KKoRCtkPtXr632IjQjHm2fhKzm5jnoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN8PR12MB3090.namprd12.prod.outlook.com (2603:10b6:408:67::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Thu, 12 May
 2022 23:32:23 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5250.013; Thu, 12 May 2022
 23:32:23 +0000
Date: Thu, 12 May 2022 20:32:22 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 2/9] vfio: Fix compilation errors caused by VFIO
 migration v1 deprecation
Message-ID: <20220512233222.GH1343366@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-3-avihaih@nvidia.com>
 <20220512115710.413c7e34.alex.williamson@redhat.com>
 <20220512182532.GG1343366@nvidia.com>
 <20220512151140.0de06d87.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512151140.0de06d87.alex.williamson@redhat.com>
X-ClientProxiedBy: BLAPR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:208:32b::20) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49e23e0a-b19a-4f1d-075c-08da346faa62
X-MS-TrafficTypeDiagnostic: BN8PR12MB3090:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB309097EBA237BF9EC253680CC2CB9@BN8PR12MB3090.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3jLf53Jyh9CGPF9VNcRcu6NRYdK8/aMq+XxoCO9ERIAdwUeCfZvYijO9FKEb03hJDcXpqZL4i4OZnZh0gSrWvrWnSBbZgOxdbrQPN7VCXUOGF1JIsIg/gVbsSw195AMqW+dSH8prKenPb/D1+HMO6DpWOS1slwz+3m/WLD8g1Qz7NoKgMp+WGDDmEURLB5+nTPp7zC1vcqxxCgb+iwkPLDUbbXsaHq80AP4qsjXJPHF5Fjc1kosnp3EY8WZEWCK2vR+38ZSyx0aBHeN5nXzeazHnNi0Qu8re52BNzsTDH4ni6QSTbosJGpHvRsGucMICZ4p76ZaB+vCgTK9YgB57PWSW2s+ip3PNdSAQ0dF973VBV827jxwysNSgyu5se4R7ffIPFussJDPkTZj5rBTdAj+TMRpwg9vU2hHKS5+9mdGbw66BBhjInKSaLAB57eErUC+2JT3pLcEW6q9KZkom2TQThgrwzw0aDuh/H3+gkaVEYEcovAULIBBopOMkm7RQbP2FEdbiSl3AO1sG6oGEHKnmWioqwroRwI4JBNVQKei5bjO8v0GuCk02gddgvD69Lqq2AYYJhUKX8CaoaZjm+eWVyyeWRUPUKTqAwZ9jlfAgACdgWXTfwxSqB52Ha08/HpZuwbiMuO18BIUG5APeZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(107886003)(6512007)(5660300002)(1076003)(316002)(2616005)(2906002)(86362001)(186003)(54906003)(38100700002)(6916009)(6506007)(36756003)(4326008)(66556008)(66946007)(8676002)(66476007)(8936002)(33656002)(26005)(508600001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T6f/tIHdL8f1+LP9AEV5oIabZ4d5htNIgvNFWEfZNA5aAEZSnKqK//Y9c1yx?=
 =?us-ascii?Q?2GxZh20aSe8Qsvtp8pvdLiPQRhGek9FrvrXoVAYsGPnH4llW44hKUcmBaMI6?=
 =?us-ascii?Q?KZRpTR27dl7blEjjy9cghVB3UC0FzMveC5TKEtATzNpXtQK37fO1+6tf5IfU?=
 =?us-ascii?Q?3Pq/8YdV6XIDVXpNn1i+RkBmgI2+eqmvosyDByVnxC6mI2R6OYM0133InNza?=
 =?us-ascii?Q?3HmrvfASuuV0y86ztmQ1JyXqAwEaosjgehvdd6X/6okbR1o3xbe9KOU/qThk?=
 =?us-ascii?Q?9/h/X5OKVMqjdYPxviAHP+Yb+/JKBAjQmCnpaUxkpqkHNH8J3ee5Yo8N5/KT?=
 =?us-ascii?Q?biBbAhk0ERtS9ndKwTbNmN/sBv80V5ZpG2TI0GlGYT3ds8XiDoGKBtS8jO3y?=
 =?us-ascii?Q?Eo4YKfdjyg/FhXQkv4/f2EEd2UsRtbhKLeS4epvHUGlvKK0CmWSKetutkRxM?=
 =?us-ascii?Q?SSMfRCDZPSJCHwtH8oeC4NDkqWMFslcZmu8he+gL1Oibp6naQHdNzqT8yb+g?=
 =?us-ascii?Q?xO+lconx4/kAe4n0Z4b0fxqr+S98cVxoLABlwOxOFZTXVW67g7/aibgc6+hG?=
 =?us-ascii?Q?0DixGYH3fqtCqXakw+NWTdyPUZHY/16bp6RfWb+/5MkTQg8YPLFsdjsKgDD2?=
 =?us-ascii?Q?NBWDAdqmCq2GNToocF9Rj/lQ/N8nXx51XtRxBXhUbbVxtZWZVJ2k/K02lIQX?=
 =?us-ascii?Q?++vCZIliLFOWXxi781C553ouIUT7NA5qgBJHMvvJ989igP+82pw52IOk050x?=
 =?us-ascii?Q?yxB0E5Fo0j6y4DveMeyHhS6Bzr3CsjNXPDSvCqTp3YSvNQZpV3w5AWfQ7d2j?=
 =?us-ascii?Q?GkwHYWHcxitppf5q9sJnDxdZLCDy0nJXA/l9FyunXCXsNIDEW5xT1W1Phol8?=
 =?us-ascii?Q?jMTfzp/rek+0EAsVpvuHji6Khcx+e5fMUprZdCUpIdSlkOcRpT7fyAmzG+h0?=
 =?us-ascii?Q?e6063LL3h/OkWm4u45qhnBZBWti+IJyxgIlvXPDRFEKKGU1cTsNyeDhVBdfC?=
 =?us-ascii?Q?wLkKt+doJvG1GvN3V3l4XeLpXhAXY4zmGTxp6AH/IPTKYaDhFKbVnpScKkmD?=
 =?us-ascii?Q?iE6h41IyAknil+9+TW+PhGVhMhE89B8OxV2xL6XaXapcpiLj01a/C6jqcDmQ?=
 =?us-ascii?Q?6iYj4tgbs39A2c2wGXdUeLUb7yTsyRHcoVLYh4cHiUjpl/tnJBG9niZe+iJQ?=
 =?us-ascii?Q?XZuxSv56p2Y/IXlOucC7naAJ48aPBaSolI7fEnzBW1+GIV9Nau7Wut9W6lMe?=
 =?us-ascii?Q?05Hwcs9LSUB6GjB8fDtxyWLphTuuNZltCPQLAFEGvOSmqIG6y7VAV9eVDoRN?=
 =?us-ascii?Q?CJPdefVso9KbSqrg9j6p1QwZNaFuLIQ7weRaSkFaegA3N8NIzHkt0egnPoF7?=
 =?us-ascii?Q?Td5jy3KejTjEgimEj4jGOL+O5rlUebbmE7QOoDq+X8BC+v9XJWPAbu7nkIch?=
 =?us-ascii?Q?9E8WDgOxu9XiC40bz3WWPjjIyTjDigQ2KdL83PjX87ejbKfhqY2B+/Nl8dnz?=
 =?us-ascii?Q?9Ly1ERazt/v1bXWoieUFB/YtO5hndJHLGrwjCCahpBGVqcdOb8aUz+5n6uwE?=
 =?us-ascii?Q?Ob1uq7HQbeGeQk33M8dwsmFXQzrY5BhfIb337DtgEUyOp19aJns6suVNNBV2?=
 =?us-ascii?Q?nBg20fzbCEGJu9oX+bWJi+EBPYKkZjw1gGcy0QTiJt/V7lVjoYcRXTAivSaQ?=
 =?us-ascii?Q?MFseOpsqWvFFaRzhg/VkhVpKt/W8sJdfu7Ki2+UCIRu7BLgNnGJUC4k0LMXf?=
 =?us-ascii?Q?lUHlY373zw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e23e0a-b19a-4f1d-075c-08da346faa62
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 23:32:23.2161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fV4mTRgbDmmieWaQcT7SlwdkwK3Gxhj+aoIhWKyBInjHq+4P8p75ZdQGhvIlHlz8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3090
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::613;
 envelope-from=jgg@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, May 12, 2022 at 03:11:40PM -0600, Alex Williamson wrote:
> On Thu, 12 May 2022 15:25:32 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > On Thu, May 12, 2022 at 11:57:10AM -0600, Alex Williamson wrote:
> > > > @@ -767,9 +767,10 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
> > > >      case MIGRATION_STATUS_CANCELLED:
> > > >      case MIGRATION_STATUS_FAILED:
> > > >          bytes_transferred = 0;
> > > > -        ret = vfio_migration_set_state(vbasedev,
> > > > -                      ~(VFIO_DEVICE_STATE_SAVING | VFIO_DEVICE_STATE_RESUMING),
> > > > -                      VFIO_DEVICE_STATE_RUNNING);
> > > > +        ret = vfio_migration_set_state(
> > > > +            vbasedev,
> > > > +            ~(VFIO_DEVICE_STATE_V1_SAVING | VFIO_DEVICE_STATE_V1_RESUMING),
> > > > +            VFIO_DEVICE_STATE_V1_RUNNING);  
> > > 
> > > Yikes!  Please follow the line wrapping used elsewhere.  There's no need
> > > to put the first arg on a new line and subsequent wrapped lines should
> > > be indented to match the previous line, or at least to avoid wrapping
> > > itself.  Here we can use something like:  
> > 
> > This is generated by clang-format with one of the qmeu styles, it
> > follows the documented guide:
> > 
> >  In case of function, there are several variants:
> > 
> >  - 4 spaces indent from the beginning
> >  - align the secondary lines just after the opening parenthesis of the
> >    first
> > 
> > clang-format selected the first option due to its optimization
> > algorithm.
> > 
> > Knowing nothing about qmeu, I am confused??
> 
> Maybe someone needs to throw more AI models at clang-format so that it
> considers the more readable option?  QEMU does a lot wrong with style
> imo, and maybe it's technically compliant as written, but I think what
> I proposed is also compliant, as well as more readable and more
> consistent with the existing file.  Thanks,

Let Avihai know any indenting you don't like he will fix it.

IIRC clang scores line-breaking an expression as worse than going to
the smaller indent. Personally I would agree with this.

Thanks,
Jason

