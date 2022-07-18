Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1726A578620
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 17:19:19 +0200 (CEST)
Received: from localhost ([::1]:59228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDSWj-0001lX-N1
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 11:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1oDSV2-0007cw-Te
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 11:17:32 -0400
Received: from mail-dm6nam04on2061a.outbound.protection.outlook.com
 ([2a01:111:f400:7e8b::61a]:20224
 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1oDSUw-0007lv-RA
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 11:17:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ix9vcuGA+hZQyDkKq5lTDTD3G5nGXY6KW8ul31N0ztCzfXVV8xl3LYkaDToHpV+YdoLOuR/ybxZcAQ9KXt7mK/TGt/Su+crSi3oJgC6FSbmygh03XgXkdGCzvOkbtZ3sBsI6/lJCcG7iGSb/byjZJBIKJkj1XWW1P3bCFRkklyq2uaUPGYYws0m9JqUtQzJZ62AMUkPPV90eWZwt0dZ/F/u6X890GKILcPpkxqd4vDrueRvA1NIVmDALVgqF+7GN/3+1eDv/8k6KWG/NqvyYASCjFMYulha+L/RCyqnkmVbFIrQ7QuDe66uDyEpWQnEPc+EyKIOZjMxkulgVWfHLEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhQIV5xoMuKvAEnNfHrlAX4QSiBzxGcQuyblHCT4Rrc=;
 b=hnZP+zsOgcXbLvLWBAfD9aWXqFV+ylATUWU8PrRsMG5DTsM/WjlLUXX5JvriDbiQPtWJ/wt+6xuc7i9zUut58h7oOqBuZeS33asxWdzDINp6L69r0EZ/MqnjOJ3j6cQHVWm9xZHFC9AmTdCtM+kxTJjl9p6WKOQXlXlHsgKR8pHpL4/JOssukagICbw9Yf2ODH3vmdmFLnRZAAG6goRp2qMcQT4OmtjGXNpNNv4MbjVsuXV9kRavnfRsQqC6peCjWRDzkbwlcLsrRHBIz4QUwcJ+u0RaAy92Y+3LIeoDZ4U/s2BMK5dE2DWHnS+QX7OlYPIbXWhyr1GNy5B3yrzcWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhQIV5xoMuKvAEnNfHrlAX4QSiBzxGcQuyblHCT4Rrc=;
 b=sHtvtb2EHBRJOzoeH37I+NhZfhKBITvouKXXCHqWr/5dhtR9QGDicRrSbLKKhvvSbQwel/H74jwpZMPqKD8nx9E8inbRETepCJ1Jk7y2Hu3+QdkDeivIbtmaC15BUEFUV6lrEzfjU7LjUf4262a3n9Z6/ThS91PWXbTo2OJM3WbMVn+YStVXoezP61qb5oHGkHhHARd1weeKvqO08ZdBsHpPSJNlm9JTxVVe23OcibLFfwgqbXPzJnccHGb1NzmBZC8gTuqIuNcFQGV5kqRtFEGatJExTV06yHGKxmtK/WQkbtv/8SD8f0ZTUk7Gd/g91sx6HwIJbu2xvHO5EAGqWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MW3PR12MB4585.namprd12.prod.outlook.com (2603:10b6:303:54::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19; Mon, 18 Jul
 2022 15:12:21 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 15:12:21 +0000
Date: Mon, 18 Jul 2022 12:12:19 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Avihai Horon <avihaih@nvidia.com>, Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Yishai Hadas <yishaih@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH v2 07/11] vfio/migration: Implement VFIO migration
 protocol v2
Message-ID: <20220718151219.GA60193@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
 <20220530170739.19072-8-avihaih@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530170739.19072-8-avihaih@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0375.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::20) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efdfed60-dd00-4871-704c-08da68cfe959
X-MS-TrafficTypeDiagnostic: MW3PR12MB4585:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lle6m00eh2ux0ZLnxHkb7CHnYetaZhNHghKIzUmUnFCpan/3YoB60RCdho0AQZ8UZdra46lOPYzVU45niJZK+OT6AHd+oQXmGpHXMQqod1bt2Za/5fF56o2iJFvYHnq3R49NByT+EHsKk107YtYl68jdPvkRIDRDheu3QS4l9h0USweecIKlLf1napaxcxSZkgGO7LROyzpuxR2Tyg774YNEC3TibkJK94rRMhQOb0s749Tg225rHIAJdut5YtAKuNzMVVu+IUSCFeTVsCkbIZM41hWeLsc8zhx9+kmOoVLL3SCXIYZPT4ucaFpdT47oQLTBtl1/wdcAgPk/8J9GJfcgLLytXp4L3XlUSAjllKcoyR8PMxxtoU6/2Can5WfGibcnX/aVJY06TzKuVbb+ixbMCMAfuH/DzVyY8fF4geouGocfZb8XJLqqYlrDwSVNd3We7C3pk6xNTj4vdiI13nLR96RXiXgoOQaYUsPq9k/r5fSbWlRNQydJo6xASMVLlQ461lc5ew4qDdckuEaiN/AhQh3U+Rs0LmRHt90Wlyty2E2Won9FAxOkf6J6ffQz7oDfR7isOeCaP0JVGwdEGjcpucarA9mLzX+IF8XCfclXGl39J/elVoiqUt/c5cA1QNPxPwMGeJHot3IkYiiKGAFQTt9MhHcbbG8FT/0PTuqr4MaiHKXBV9/xDaRwQL2j4ALjujOfqOXg7iFH+XjKKCUZLLIyoR6HxYi6TMVDkv1flYqrPeCgaUQ8sxn+7d4Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(54906003)(6512007)(316002)(41300700001)(110136005)(6486002)(6506007)(26005)(36756003)(2906002)(33656002)(66556008)(66946007)(5660300002)(38100700002)(1076003)(8676002)(4326008)(66476007)(83380400001)(8936002)(186003)(478600001)(2616005)(107886003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i28AP8mr61x1PsGMqmR0lNzufBdvag/ouqPcIunvykDW/ANUSU9aCIdAAJ9q?=
 =?us-ascii?Q?XhOOHhg1asNZq0XVaPw7SOErdQwx/L+LSSMqFwt9tSF5BOt1Dbk87Ykmp54E?=
 =?us-ascii?Q?DtPaj5dCfuLrGcWcSn2JUfYGVjyO+68JsfPhIw5oNN4bHnMYye7IUC6GIPSG?=
 =?us-ascii?Q?f3mwlpoMadJTxc9j7w8J0VNLP3dXkugpF0CsaqEu/yWb1ThYq3TK6P3yOU2W?=
 =?us-ascii?Q?zG1lmNZQBDa11DYqVnvhj4mi9RkkLcD+jEG0LUrSPCgarkPODzp7CslpdSd1?=
 =?us-ascii?Q?9K7wHXZdt1Hre2OfdHPmyrWe2p/3OnYQIZqL8ong4j5pOLLOV2OJ0xZ2hxy4?=
 =?us-ascii?Q?J9Ei6mC2AzREDlUEohtiUT9Oo0ZOYEoaa+jelPaZHp3a08ASpFUcb45Q7VKY?=
 =?us-ascii?Q?YIJb0g+4reN0YHJTyWZmcNqJX616tgl30qEm0M6dFH1XLqIIU3LggX1ShbOP?=
 =?us-ascii?Q?6NBk8wa0LYGFaBzrW+HiQeJeQup+ZRE1Eysb5ssjt9UQraiC5a6FuWjSOeS0?=
 =?us-ascii?Q?SVmmV5ZntDar9VBnatIl9bl6ZXM87jUuaoZilyF0TrVrt+W8gFfzJ17mcIg2?=
 =?us-ascii?Q?ujiigyFJFV0/55iu+qO+2ABbxeV88OBgk9eF9x3AeRAHZ5a7hzHhg6JxF2IY?=
 =?us-ascii?Q?yo/kQBWcuNO5lDn81LPXmsgSv7V/0X0LmOXSG4ZJX2UGxndTxhaebRllTlKj?=
 =?us-ascii?Q?3dFtV7e7Qgv+S5lntq/kaJZL9BzPfNKjgd0vgHanZQ69aPPF8jr4cw2AE7er?=
 =?us-ascii?Q?G5WNAnTRzcxcPawVqq+Dz2tQNwk7HUlneOcRlMyRjSA2dhp8Jgx4tC7OMtLH?=
 =?us-ascii?Q?yM8FcpnSpOACfkFCKZy8gABWS54bzwVqJL6G+MKuxyC14j3mGwbf9aUQZOWk?=
 =?us-ascii?Q?SI2kHHhtf2Wv7MdpzzOPMnmlYfcZDTnj3m1CQpiwMcwo2Ac7jnSwOnoiZRkk?=
 =?us-ascii?Q?ge1LLuoF9aEEUC1CZ6sugik7f0iTMb0p3UaXuu2ZuRVM0tvJp+9rjoD5T3oj?=
 =?us-ascii?Q?SkfxO9E9Ju5MzRKgtoC7O1LDSbaSsK6NC6AQV+z38pltYndCvZLpqirno1BA?=
 =?us-ascii?Q?o0xxLCr0hyLSFY05mtV+svADCr8ZnmG3z06UEXBwvADbjw9dqiqDDpQ1q1Xp?=
 =?us-ascii?Q?aNf0FZxR9zG37FiunzqtPtPU3OE2a7Q3VhQGnA+uogz/Xok36W/7EFnAf22q?=
 =?us-ascii?Q?qIJvalEwZqeHbARPWY3vgOXYfoQamD9CR4NjSKtL+WO9FzbqMdiMqwWftore?=
 =?us-ascii?Q?Jw/WjxiY0oGs3cX1HWCNdwPaMGTmp51FFZAndlkq5tWjksryZn5w4l0+PAWQ?=
 =?us-ascii?Q?HRBSNB33NHfLjXNwGutMrmtq6yQXzQxgo6kgH/DN/JsO/+Ljp6f3N9Lg6Tsp?=
 =?us-ascii?Q?wP3jFT0n1uIlhYVsPZjHODOKgVzfQO7fPfBKT7q83wnVWu5I0pDm+b5zc2V/?=
 =?us-ascii?Q?pBOJzbYQyGt02rox2XmIbQ2/8KOUZ6SAGFv/4cdd9LJmFpJWNSbsohNXUL0k?=
 =?us-ascii?Q?WBo/iXZtFm11UHmoHtMjkfBdkJK9vKJqBRsXAHjEr8PvnMYjoi+kST0rZU10?=
 =?us-ascii?Q?qxRp8Q1ip4OTKDHX8HKClIicqsZcjv0/i7NA004d?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efdfed60-dd00-4871-704c-08da68cfe959
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 15:12:21.0849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7HfHLTplSGxQZfDRQqk65m/6ZmOSNntjljPmlt4JNBzmSj+Ywr3Lfg9k1BXxQSN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4585
Received-SPF: softfail client-ip=2a01:111:f400:7e8b::61a;
 envelope-from=jgg@nvidia.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Mon, May 30, 2022 at 08:07:35PM +0300, Avihai Horon wrote:

> +/* Returns 1 if end-of-stream is reached, 0 if more data and -1 if error */
> +static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
> +{
> +    ssize_t data_size;
> +
> +    data_size = read(migration->data_fd, migration->data_buffer,
> +                     migration->data_buffer_size);
> +    if (data_size < 0) {
> +        return -1;
> +    }
> +    if (data_size == 0) {
> +        return 1;
> +    }
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
> +    qemu_put_be64(f, data_size);
> +    qemu_put_buffer_async(f, migration->data_buffer, data_size, false);
> +    qemu_fflush(f);
> +    bytes_transferred += data_size;
> +
> +    trace_vfio_save_block(migration->vbasedev->name, data_size);
> +
> +    return qemu_file_get_error(f);
> +}

We looked at this from an eye to "how much data is transfered" per
callback.

The above function is the basic data mover, and
'migration->data_buffer_size' is set to 1MB at the moment.

So, we product up to 1MB VFIO_MIG_FLAG_DEV_DATA_STATE sections.

This series does not include the precopy support, but that will
include a precopy 'save_live_iterate' function like this:

static int vfio_save_iterate(QEMUFile *f, void *opaque)
{
    VFIODevice *vbasedev = opaque;
    VFIOMigration *migration = vbasedev->migration;
    int ret;

    ret = vfio_save_block(f, migration);
    if (ret < 0) {
        return ret;
    }
    if (ret == 1) {
        return 1;
    }
    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
    return 0;
}

Thus, during precopy this will never do more than 1MB per callback.

> +static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    enum vfio_device_mig_state recover_state;
> +    int ret;
> +
> +    /* We reach here with device state STOP or STOP_COPY only */
> +    recover_state = VFIO_DEVICE_STATE_STOP;
> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
> +                                   recover_state);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    do {
> +        ret = vfio_save_block(f, vbasedev->migration);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +    } while (!ret);

This seems to be the main problem where we chain together 1MB blocks
until the entire completed precopy data is completed. The above is
hooked to 'save_live_complete_precopy'

So, if we want to break the above up into some 'save_iterate' like
function, do you have some advice how to do it? The above do/while
must happen after the VFIO_DEVICE_STATE_STOP_COPY.

For mlx5 the above loop will often be ~10MB's for small VMs and
100MB's for big VMs (big meaning making extensive use of RDMA
functionality), and this will not change with pre-copy support or not.

Is it still a problem?

For other devices, like a GPU, I would imagine pre-copy support is
implemented and this will be a smaller post-precopy residual.

Jason

