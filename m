Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A169662F52
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 19:38:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEx1B-0001Na-AU; Mon, 09 Jan 2023 13:37:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>)
 id 1pEx18-0001Kv-H4; Mon, 09 Jan 2023 13:37:06 -0500
Received: from mail-dm6nam10on2059.outbound.protection.outlook.com
 ([40.107.93.59] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>)
 id 1pEx16-0007Xx-8p; Mon, 09 Jan 2023 13:37:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QalwytiILgEq0lpV9oCDaRkLnonjbNKK93m+hz6nhcI/NeOOYRGanyCxR8QmyCa4gzOU6Ayszv2jrupcUnvDWqgqhefoVfHUfZmKk9DqTbjwAougHMpROzd+npG2FNYcb+n0J74gmkRtjArQL4vTulgKAw9BmL8/+Z5nhuBZ6Fkue3nR0ye/ssezsmp0YB3HK0ng5GFWimCe9mhKPmXOjL+6DzOHpSlkj0Kht+8Yz1HYFPoMgEKM/2p8VUOVtHefC4j/oN9EPWmf3ir5FfdShYs2da0ny4SEG8tHlH9gn6f5s8zr+C0/7H9nL04ZsTgvY0TN2kw+3gIamNtyb8Ne8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3Y/VSIUo8kZOVWmNHVOKUAILwo2HDP27ITtC14AgDI=;
 b=Aclu7XCa7rh99WhQgLUvRKtGyXYww0on+SMzSm/D6N5kvewyWpRxJSv3WOgfWoDEveO2eumR/rIZHM1d5VD4lVAolJafLBgj8ekXlCQ9dHosIzYNo6kqR9Dx0UIF64DW08cFW3O5pM7LuB3AbWmGt8s+39eQm6Dij9zx+l64YXdAYg5RlMlxqbEqpSgDwgPqo6NzRp3NiuaHMAJzKwiVpZiB1GQQy/YJ5cvtNfe42f2WkO+hYM+JIixNhgIy4v7/eeAHPTCFGFKOPIF42T+xul+RQF20kaeq/ytcbIXC5eeTs/NCRIKwBJbujPL1Dkw6FvHlSTPYQJ/FN1Q4wZRg4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3Y/VSIUo8kZOVWmNHVOKUAILwo2HDP27ITtC14AgDI=;
 b=uhpZ0Fwej/3lDN/ct73nj9Wzvh+/njE7ViCtRdM9CgYijvhVe7JWNADX3mzIisePEU+zMd//iPwZebBiRDqRPEWm1+cBOfhNPPyGEnzfLNxSG/Ckt2Lq7sEathbJG0IjceP58jG7c/YJnQL3GePVP7UH8eEXULIPXzxW4uEMV5qi5iQ1kLp5P6dMl/Yok7HKOTTYIJAmGImZ8k7Jg/iDzGgPMgNaPZuQA1S7SXAIGhX47MKPCnLdJ3nEQeOlWPWChDK3B+fiOqAhunMu+1ht7i58+MohSSfBnA5rm4cZCpyrS6Ac9M3kL/h+RfjasB9FNjuQM6ryCzFQcAq2Jn5opQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB8124.namprd12.prod.outlook.com (2603:10b6:510:2ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 18:36:56 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%8]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 18:36:56 +0000
Date: Mon, 9 Jan 2023 14:36:55 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org,
 qemu-block@nongnu.org, Yishai Hadas <yishaih@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v5 10/14] vfio/migration: Implement VFIO migration
 protocol v2
Message-ID: <Y7xex6YisfjZoZvj@nvidia.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
 <20221229110345.12480-11-avihaih@nvidia.com>
 <27a868cc-d816-76f1-1ce1-60b6552d791f@kaod.org>
 <5ccd6f67-3ad3-c9dd-634e-d2d0900c429e@nvidia.com>
 <0bb116fa-3609-8b01-0a16-10436ba6cc56@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0bb116fa-3609-8b01-0a16-10436ba6cc56@kaod.org>
X-ClientProxiedBy: BL1PR13CA0336.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::11) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: d3314816-d121-4303-ceab-08daf2707c09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PTTYPh9G+/1WeMMOrxj4zOk+UPpWhHGjeuH/2qrLXGQp5WNzOxYgZ6qc1HlQcsdOdZ22znJN4Z5/pDzwAv8qZq3WqlFwM+xvsCSqEcG7d+3jonig1M6DM98RyV0phmPERNi84mFmsigfBD2asH465/ssFbRwZZ2Zl0MU1b6UkIQuskoNEGT4u1dA5zJZMb+JXFHNu7/RPEDQyONfMXX+MZm/4IC07AV80liFJTTiR2uzk4eeCXUu9489joiemwtHMafbLLJ1oWxgVLgfZp+oy71+eqbF2AE8/EHV5Q6dGs0FFqv6eEQhW8tqKb/eYa3OCEeiunLBvmtt53sDouS2B+P9e10F3A9dIZUPvYkCHq0kjU2/togw63t1XEaLsFbEjiGVM58mzpW4K0jj2W8rc4Twf92sj1bipuRfoXm4pCHLHpAP5KE+oO9aVAR/UA6QrNxwY3yruDITCkwMo+r5/8V5Ao8EYCr6m0Rh1mFSVTmQRX9iNh2b/yumJw4eFJXg9LAkn7qUmp5mVUY+uiVBnpzYPPi/5Q6M/skFZKzXr5GAdZu/k4Fbw3Jf2I8Pn9A7ikLeHISqP13jrc6k4jLkRRx0tG3JsxxCo3kixjL4XMFdgxCJN6T3eb2KOfiV8riDwactl3jjhOhuGkVu+NYGQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199015)(8676002)(6916009)(316002)(66946007)(66476007)(4326008)(66556008)(54906003)(2906002)(5660300002)(8936002)(41300700001)(7416002)(66574015)(36756003)(83380400001)(6506007)(6486002)(478600001)(38100700002)(2616005)(186003)(26005)(6512007)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2hsUEJPNlcvSjRsWU55My90WlIwako3UHh6MXdoQWhPMmxCTDM4eXM0dTB4?=
 =?utf-8?B?RGg4b1RlNVJ2QkFKeDMxa2pVVEpJdlBaVk45dUNxd3N3Si9teDBURno0Njlo?=
 =?utf-8?B?cTgrc1hPODJCSFpOdHdkSmMvUkRKV2xRRnlZZlViR3hjTkhEb1NCcVdrVG5a?=
 =?utf-8?B?QjU4M1VTekc2ZUpUdS8vTmJjTHRXZTZYTXd4ZDZTbk54UWRQaFRDbHZERXY5?=
 =?utf-8?B?eUlXa3d6djlPdVFFY1hpZDlSZWRpWTJGcnpXSUh4eXQ4RkhrV3ZmcmNoRnlZ?=
 =?utf-8?B?MWhxN2ZmeWx1K05VVzRoUWZ6aHVSKzBkdVFiaWxiZ3VzK0hJTWNPMVN5TWox?=
 =?utf-8?B?SFhudFE3Z0wzclV3ZGE4QjErQURvWWRaS2k3cmlYc2NjUEVFbSt2N3B0WXZt?=
 =?utf-8?B?aWtUL3Nra2RSM1pKTzg4OUI1ZThpc0Ywd3RNRG5TYnJ4Qm12WlpLcEU4a1RP?=
 =?utf-8?B?bzRjOWpWZVRQeWRnVU1sV2xvK3d1WlQvak1lNVB3bW1vNHJVMTRjd1R5Vkxk?=
 =?utf-8?B?V3hxR2xBOTVURlNuTHlPcHJIMTdaejBKNGQ5UHc5Y2E5QytERFVLYVQ4QVh4?=
 =?utf-8?B?RkxwN0laakJnZmt2Z1FSY3ZQazN0dW1VMHFQVkt5RTRVZ2g1UEkrdkpVWk9T?=
 =?utf-8?B?YVp5UEhzb1lYQk1OQ0wycS9ROExRa1hYb29ZUTBkUkh2VENwaUVwd3doRndY?=
 =?utf-8?B?eTRnNjN4eDdyTnpsMWZGeDlmN0FtNzRmeS8ram5tb25JQ3NvU09zbFRGeGh4?=
 =?utf-8?B?d2x4UmNYUWF1OG05MWZQSXhBbVM2bFo4K0xldXo1WTNhbm5aeEtFdC9LeWVw?=
 =?utf-8?B?UWNyWTE2ODJiY21tVkFSVmlhOVdGZGMyZHpldjBvMGZ1L1BGNG0ydDZMTFFj?=
 =?utf-8?B?dEYrUFN5Z28xT2dkbGNFTG5EMXpUR2VIMWZNR0dPWUI3ZDhhTnk5ZytGbUVk?=
 =?utf-8?B?OXBpemNPSHE2WUhMNnVtM0VnaFZWbGVyTVBZRGhFVjk0VGdRNUM3M2E0MU41?=
 =?utf-8?B?Wno5bk0xL2ltVHlTdkpFUExiUWo0SjV3VU1OYllIbWxiNkFGV05nQzJwQmFE?=
 =?utf-8?B?R3dzSTcyRFJlVExjUzBEaVhQT0h6S0M1bFB0SG9mNVZYS24ydEN4YW5UbjYz?=
 =?utf-8?B?SDhGc25ZQkYwUTBFb2lyV1VBMm5GbE1HU3BXNFNMcFQ5WWJrdW94UDNtSldY?=
 =?utf-8?B?c3VJY3hIbVRXUVJ6bGVKRUNCVDNhQTBXNkNIb1VCWXBzRUpJbmc2S2h4SG03?=
 =?utf-8?B?cTQ3dTFOeWZ2OEM2Z2ZKeUliN05SVTN6M243Yi9sSHVkeE53TnI5VWIvV2Qx?=
 =?utf-8?B?UENsWnc4UC9aNmRJd2Zha3JadzF0SXNncEpYc3dhRWJUVGx1Zm5SemU2N2Vo?=
 =?utf-8?B?QktvUHBVeWVHV1NTNi9aOXNEK1lRUCtCQlhCOWRkR21VSWNHMVMwb0JnYTNU?=
 =?utf-8?B?S2U4OTdGM0t1Tkd0THhkdEVjcTFJR054NVJkSnZNMDQzNmYrVXMzS0ZOMGZG?=
 =?utf-8?B?cThxbnhJU3k5Mi9MVGJHT3MxZnZpS1FlNnNYVkdNS3JFV2MxaEUzOU9lVk9E?=
 =?utf-8?B?akZiWVdENS9URVZSd3BmMXB6b1l4U2xsL2Z5VzJGUlJHZVc0SGU4cU1xMTNE?=
 =?utf-8?B?WDJaSEliaVVPaGhmcEJHM0Q2dkpOSkRUWXpTWm41RmZTRGNvczl0RjU3dnJu?=
 =?utf-8?B?aThKdThRaWMzNnZDbnZ6azdCT0ZQa3lSSmJORG00ZWJJSWI3QmlodkRDTGdX?=
 =?utf-8?B?ZUF2UVV4Y2V3TVk4UjB0S0d1Y1lNUlU3WTJDQkVPVXNVeFBiVWc2U05rLzdx?=
 =?utf-8?B?M2VXaGt6cURDOVNrZlExSWlrc1A2OEo4L08vR3F2Z1QybUt4T0lUMkxaM0RE?=
 =?utf-8?B?VkJoUzVGVGZoM3M4RitFbWxodzRNNzNBYnNRNUVLQlNPbTgwbUoyN3htWk1J?=
 =?utf-8?B?amZtalh5U0JUUlRRUEkvZ2o3QUxVWWVMT0NUZEtvZWJJam8wVnpzUllBWTBO?=
 =?utf-8?B?RGxnMmVhYjI2OHFSODBXUmJyUEJuazl2eWNRU3ZobjlUenpEV2h4MVVzcms0?=
 =?utf-8?B?YVRxamd2OHg3cEZoVm9JLzJORUdwR1hQZzViWUx6Q3VzdjRRVFlLeE9waERS?=
 =?utf-8?Q?jXbQE3gv+nkJxn1xDyW+MlVgB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3314816-d121-4303-ceab-08daf2707c09
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 18:36:56.0122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Poj2yrG+zmoIPC/qTtO+z+C/3NDcidAtmQtvfq9QJzEVDh2mCsMZH2eJiWjGgknM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8124
Received-SPF: permerror client-ip=40.107.93.59; envelope-from=jgg@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 09, 2023 at 06:27:21PM +0100, Cédric Le Goater wrote:
> also, in vfio_migration_query_flags() :
> 
>   +static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t *mig_flags)
>   +{
>   +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
>   +                                  sizeof(struct vfio_device_feature_migration),
>   +                              sizeof(uint64_t))] = {};
>   +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
>   +    struct vfio_device_feature_migration *mig =
>   +        (struct vfio_device_feature_migration *)feature->data;
>   +
>   +    feature->argsz = sizeof(buf);
>   +    feature->flags = VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIGRATION;
>   +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>   +        return -EOPNOTSUPP;
>   +    }
>   +
>   +    *mig_flags = mig->flags;
>   +
>   +    return 0;
>   +}
> 
> 
> The code is using any possible error returned by the VFIO_DEVICE_FEATURE
> ioctl to distinguish protocol v1 from v2.

I'm comfortable with that from a kernel perspective.

There is no such thing as this API failing in the kernel but userspace
should continue on, no matter what the error code. So always failing
here is correct.

About the only thing you might want to do is convert anything other
than ENOTTY into a hard qemu failure similar to failing to open
/dev/vfio or something - it means something has gone really
wrong.. But that is pretty obscure stuff

Jason

