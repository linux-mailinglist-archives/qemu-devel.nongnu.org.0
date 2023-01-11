Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432DB66586C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 11:01:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFXuI-0002oe-Pi; Wed, 11 Jan 2023 05:00:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFXu1-0002mT-82; Wed, 11 Jan 2023 05:00:13 -0500
Received: from mail-bn8nam11on2040.outbound.protection.outlook.com
 ([40.107.236.40] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFXty-0002Dx-Mw; Wed, 11 Jan 2023 05:00:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPFOLswOyWxNGwb4fU1RQ3NqZk+tlcSzMsVy+lX5zH//qNxubA0x4ZtGdNK95G4o40CNJxGFOprAks1Qn2UBdXw/66pl/qm/EJePJ+Lb/Zm4dTJrg7jerAmghAYPC9N1XW+PZLXN/GrVprMZxLZnczbYaGV0ZJjolrf2kFsdQGmuiybjLiaqlL/dbj5RHlShopoV56gjiPgxyT0mOhM6tcNa+16CTcGWTlgNObu4OAyPVXzx5sqdRlxtYJcEsNlFLvOmWXZxchialQVyIwaPURiPuGIwZjVprXa4b9vFOlpBsoTR1Gy4o+k/aTfVlkRnS9nwdgeizQ4hkaPOoGEgXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ow9wz8VFeJ1GV86GNlR1q9bRWAfgtwyHr73Vzz0C9hs=;
 b=gbD4BrjuCUKP6Dp5uX6FOCjHGaOndouPL2MtI/p1Bk7TTKlaWXkwFX2rV8UllEsjyxMnzNbqeG9MSI4CGsqITZHqxuvVmZ5ZqYD1tucQZum35LBSeJgco4BQ37q1Scl/hpkO8N2xaaq3js7yNYG8jXrp5m792EZAykHryaE74ET7qf1BJ07ZguR8mY2pwkpCaM1C4t4csR/Kw+PM6wS2h3m63xLLJd3RnriKxDHRO+kvio4LlPNjpSrg3h8Y0EuStfCOjbBDtsa2vxt5HHjQ4tWacLQiCBvxpFxyKLpfKE6B7JO7WiJRy9iEgNX4N8vDS0LlKBEs00PX86NyGsxBgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ow9wz8VFeJ1GV86GNlR1q9bRWAfgtwyHr73Vzz0C9hs=;
 b=jj2LCZ5Czr3QwursKm0XDPLn4bJlF5ZXw44h6COaTIFFh3CnXZkYubtonKT36vB6+SNBbAoX4iX1dVnH+CQA5FE9UxXGVNmN3QnKEnCOpsW3zZZOBOAC6SqYvPK72SXqT44jf1K54hSMpyt0pvWcB575UIb3hst7zO3v8jMogKJwOQfTqiAqGkItuS6X4fKohEBuNznTv2yKCeFo9y4xthcsz/eJYN+rOGfnkzEoKWThsnw+Oj/0LiGJvkBgtrTgAdXF11/6e1Bd8q3a1sO4Bq0oSitbn84d44LUjLujGpPIjHroUNMUqU8Vm2BPUiN0eSzSKp7ICkca2cvnqhEtqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by MN0PR12MB5978.namprd12.prod.outlook.com (2603:10b6:208:37d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 10:00:05 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%6]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 10:00:05 +0000
Message-ID: <49855493-8723-8abc-389b-b06f98f1e143@nvidia.com>
Date: Wed, 11 Jan 2023 11:59:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 10/14] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Jason Gunthorpe <jgg@nvidia.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
 <20221229110345.12480-11-avihaih@nvidia.com>
 <27a868cc-d816-76f1-1ce1-60b6552d791f@kaod.org>
 <5ccd6f67-3ad3-c9dd-634e-d2d0900c429e@nvidia.com>
 <0bb116fa-3609-8b01-0a16-10436ba6cc56@kaod.org> <Y7xex6YisfjZoZvj@nvidia.com>
 <ad2f5ab9-8529-0286-53d6-33e5a63c94b1@nvidia.com>
 <0353ebb8-49cf-d6b7-9bdb-d8124e2a224d@kaod.org>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <0353ebb8-49cf-d6b7-9bdb-d8124e2a224d@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|MN0PR12MB5978:EE_
X-MS-Office365-Filtering-Correlation-Id: eb5778ed-63da-4eed-9739-08daf3ba9d43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FzjTTHYm1Xj4tUZupjQATXP4Dqe1ThpUk2y68fVYeOyX8zA/gp6F30W5pTnDtwY7sJtE9mXJ4CyIYXLS5VC2GAmSZyWWwAkl+FOq19HzIuiikdy+PctrmEqnwJVZ/qcPA+w5eGqE8R73G5zj7pL9+gKuQruEjUjYa/5captA5jSuUsimqP+Ipil7ljFEu7n02I4kXGpKcNbxaVbA0q8No1VGXrtcamgEaT5JXTzDmc7oMaHSiCLdb67YLgCgA90HvojBfop5cfdaf+m2Fj6Jila5ef1Y1dnN42XR1IupyluU0f0DRHWYZJsVffOb6Geof6g2SEzTMURNmiXRRgVZJqxMAZ6z5Y2zdql/Ha1DhfQ1AbkIPf2+aevvIkoLrDd32q3Lf/VLHdTQroSVae9OtQ6/HQAKpFTSHDO1JXtj9K8CRSZ9f6Ozi0IMgoaNvz+to5q1iKBDg7kXIC5cAL4p8cYYG+0twaEuOx3xLydju8hvtrS2vgn9zGI92ODKQveP1soT5ao6UL4SI/eIflhf2/T6CVMYCwogUvuAZn1mUor5uVCxFcHG5nB0HnTQTIO1vCN6+TGRf13mWu9GpiI1+hXjJU23kHIpKM55muBwbEDYOO7Feln6aa/quEbbZcLxDREcUnP0st9POfTM+45IVY2G65iGNLaBIZWryPbIQJO7J7i827PWlkmvb3ycAPS5bze93diJlOiE/PfrJxkkDsjfOnhrAsbqoP2+sK6Xlgs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199015)(36756003)(31686004)(66556008)(66946007)(8936002)(66476007)(7416002)(5660300002)(4326008)(8676002)(31696002)(2906002)(38100700002)(83380400001)(478600001)(316002)(54906003)(6636002)(110136005)(86362001)(41300700001)(186003)(6486002)(53546011)(66574015)(2616005)(6512007)(6666004)(6506007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T21TZTFiV25MMTJuU0dEQ0dRbVorZ0FPZDExMXlEVVBzSkp1bmRES3VhS2Rz?=
 =?utf-8?B?Ni84eTFSTjB3VkxNbERmODhwSEYxYkVDNFVkL0ZaWXRlellUL2lIRk40UzlF?=
 =?utf-8?B?c1VDWXFzYmRmMjlnU3g0QzdUVnN6V1lBMnlISEhzdjBwS1F1Um01K0ZtTjN1?=
 =?utf-8?B?K01vbkIxRlViY0JYWHhNVEgvcUpPMy94ZU51SklBK1JJakdIN01vczZidlBK?=
 =?utf-8?B?aXJDQmJoYU8xc09BdGlzRFVXM0k1bVdQb0dPazJDVmdoWnpENHhNaFZ5cGxu?=
 =?utf-8?B?aDhQTE1RbjYvS29xRE5ETHFDR0h1QjJDbnp2eWVnRjBPY2pER1M3T1RKWFkz?=
 =?utf-8?B?dFk0WTNGZDRlZjZ4UTJEMkxpM1BhWFY5TW5sOWRmZk1mTm81R09jTFhCRmdC?=
 =?utf-8?B?eEgyK2JRa1VDaW9ETU1PN0trNmsvRVZPS29QN09CWW5zUVRra2E1RGUyQ1Rv?=
 =?utf-8?B?SEJvTDAvNjRIbFh6TFZMdUxYY2NKZXdWc2krNG5QSnlvWkJsT1J5aDE1SEYw?=
 =?utf-8?B?alFWTHFRaUQ3SW8yVjNiQkl1ZlRRSTdkVk5mSWlYaWlSb2RDNFVsQkZaZXpM?=
 =?utf-8?B?b1p3alRua1Y0WkRjNHhpN000ZjlqZkZtbmcyVFp2eU1ob1p5WUFuaHFaZDY1?=
 =?utf-8?B?aHZoc2NmRnowREJibFJmRmhDdnNyK0R2NE56WTNDU2JyaThqeTUreE9oc1lK?=
 =?utf-8?B?SUw1c2Fidk92d1FhR3k5amc1NlBxZGJoZC8vVEExaTNhR244bnJYdTJrN0RS?=
 =?utf-8?B?MldFcHdUSTM1anJCaFd2UkRlVW1qSFhPM3ZuMDFLYXUvQmpkbGVEdEszWk9Z?=
 =?utf-8?B?d3BpbnFIdXlQT2g2OHhrY3A1VHN2cDB1MjVpcTVFN0N2aS9iMzdtZzdqTWxi?=
 =?utf-8?B?M3R2UHpZVWEwT2w4d0FlVUFJMUtwZVpUeWJMS2dnem5iR3hSOFgwcDFMbEs2?=
 =?utf-8?B?bTJHMGRRZ0pMLzExcklUZXlHWEMwVWFpV1ZaTEU4MGVFVEhaQktNZlcwZHlX?=
 =?utf-8?B?QllZanJWalFFTTlheExTb2VFQmxFblJyM09JK0ZLSFQyUWFBQTQvVkxZTEJH?=
 =?utf-8?B?U1BJYzc0R1B0T214UGp4c1BRMzRFTlhJREtSajVkT0ZvSTJtd2V4WWIrWWt6?=
 =?utf-8?B?Qjdyd0tyc3BxcitVejFuNjFVa1ZMS3VIWS9hdG5IL1Y5Yk1nMktHajJ6ZEkz?=
 =?utf-8?B?cHFNOTAwMEhHdUhFM0xIL0NhUGZvMlB4Tk03eEZsdlFuYUJMcld5VGcwTmdm?=
 =?utf-8?B?UU9WSWhwZ0tubTNtL0ZtL3p0MkZFWWp5bDI0czc1OC8vcjFFQ2R2aXZIbmRI?=
 =?utf-8?B?WXREdVM5WmVYSURnZ1N2bHpnOWhCa1ZJZjgraWRHdUlROWxDdmdTMm5WVEFw?=
 =?utf-8?B?SlQxRHdFMmtlRlQ1Q1FDb0VVdWZtaWs1dklzb1VyMlRocmk2YW9mRFlKcGUv?=
 =?utf-8?B?cHp1NDAzY1VKaGd1SXJqQ29NWW1pMXZrQjVlbzk4RndFOC9oaXMzYXBQcXRy?=
 =?utf-8?B?M3hrOEwyREwrL3Vrc1Z0NVRFS09rME51b3VyTHd1ZHRmWW83SHBvcU5NR21p?=
 =?utf-8?B?V2ZCVDNyenk5M0RhejNPeDVoMktheFA3MGFscWNEU3dNYlk3bEhybjBzRVgw?=
 =?utf-8?B?UjV0aE9WRGgvTG5XdGU5Q1BuSUlkdDZDU1J6YWE1cUpVMjR4TEVXanE4bkRT?=
 =?utf-8?B?dVVLNDFIUzhLRWpQajdhRng4bEZUaDJBejIyS3VqNEYwMExxK25hVXY3Q3N3?=
 =?utf-8?B?UHdjTU1mQUxzdk1kcE5ROVVkeldERTBaQlp4Z2RjWjJIampJa3FOYW1FTkZV?=
 =?utf-8?B?KzlnMS9YSGM2S3I0TGh2TXNQYzBWM1hzYjNFay8wdkk0YWJ4UnZUN2JhdFV3?=
 =?utf-8?B?WjE1WDZuK3BJODRoV1RJQjVFTnRRazlmNGtYc29lRkVWMGdURml5ZVV4ajFu?=
 =?utf-8?B?YUZwVHl5Sk4vZVlHRlZoUFZDRFNxZlZhRnIxTzQwcGdLT2daR0JYWDRiMnE1?=
 =?utf-8?B?a1p2NEE1ZDdMQ09VazMwckdsUExvWGduVjlYbmRPK05FRGxPVE9UaGN4Y3Fp?=
 =?utf-8?B?VzZIT01kaDNPOXd1SHFmenBIWVo2aVhYNlpTZTIwRzlFNGc5MUg4OXE2OTBT?=
 =?utf-8?Q?G36F7YD9ZEsP+f5CiIA0hS6ey?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5778ed-63da-4eed-9739-08daf3ba9d43
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 10:00:05.6921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3Ah7+CbLvAJ51b38WK0kAlxonwJWR2zWAwpo5CVxXsuf3pyiiIZOm+0fC1uONvNTFss+pjcSVY3NKTygm9txw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5978
Received-SPF: softfail client-ip=40.107.236.40;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 10/01/2023 18:19, Cédric Le Goater wrote:
> External email: Use caution opening links or attachments
>
>
> Hello Avihai
>
> On 1/10/23 15:08, Avihai Horon wrote:
>>
>> On 09/01/2023 20:36, Jason Gunthorpe wrote:
>>> On Mon, Jan 09, 2023 at 06:27:21PM +0100, Cédric Le Goater wrote:
>>>> also, in vfio_migration_query_flags() :
>>>>
>>>>    +static int vfio_migration_query_flags(VFIODevice *vbasedev, 
>>>> uint64_t *mig_flags)
>>>>    +{
>>>>    +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
>>>>    +                                  sizeof(struct 
>>>> vfio_device_feature_migration),
>>>>    +                              sizeof(uint64_t))] = {};
>>>>    +    struct vfio_device_feature *feature = (struct 
>>>> vfio_device_feature *)buf;
>>>>    +    struct vfio_device_feature_migration *mig =
>>>>    +        (struct vfio_device_feature_migration *)feature->data;
>>>>    +
>>>>    +    feature->argsz = sizeof(buf);
>>>>    +    feature->flags = VFIO_DEVICE_FEATURE_GET | 
>>>> VFIO_DEVICE_FEATURE_MIGRATION;
>>>>    +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>>>>    +        return -EOPNOTSUPP;
>>>>    +    }
>>>>    +
>>>>    +    *mig_flags = mig->flags;
>>>>    +
>>>>    +    return 0;
>>>>    +}
>>>>
>>>>
>>>> The code is using any possible error returned by the 
>>>> VFIO_DEVICE_FEATURE
>>>> ioctl to distinguish protocol v1 from v2.
>>> I'm comfortable with that from a kernel perspective.
>>>
>>> There is no such thing as this API failing in the kernel but userspace
>>> should continue on, no matter what the error code. So always failing
>>> here is correct.
>>>
>>> About the only thing you might want to do is convert anything other
>>> than ENOTTY into a hard qemu failure similar to failing to open
>>> /dev/vfio or something - it means something has gone really
>>> wrong.. But that is pretty obscure stuff
>>
>> Hi Cedric,
>>
>> With Jason's input, is it ok by you to leave the code as is?
> The patchset removes v1 later on, I think we are fine. I was reading it
> sequentially and it felt like a weak spot.
>
> All errors are translated in EOPNOTSUPP. That's always true for pre-v6.0
> kernels, returning -ENOTTY, and v6.0+ kernels will do the same unless a
> mlx5vf device is passthru. I still wonder if we should report some errors
> for the ! -ENOTTY case. So the code below could be a good addition.
>
Sure, I will add it in next version then.

Thanks.

> Thanks,
>
> C.
>
>>
>> if not, would this be fine?
>>
>> +static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t 
>> *mig_flags)
>> +{
>> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
>> +                                  sizeof(struct 
>> vfio_device_feature_migration),
>> +                              sizeof(uint64_t))] = {};
>> +    struct vfio_device_feature *feature = (struct 
>> vfio_device_feature *)buf;
>> +    struct vfio_device_feature_migration *mig =
>> +        (struct vfio_device_feature_migration *)feature->data;
>> +
>> +    feature->argsz = sizeof(buf);
>> +    feature->flags = VFIO_DEVICE_FEATURE_GET | 
>> VFIO_DEVICE_FEATURE_MIGRATION;
>> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>> +        if (errno == ENOTTY) {
>> +            error_report("%s: VFIO migration is not supported in 
>> kernel",
>> +                         vbasedev->name);
>> +        } else {
>> +            error_report("%s: Failed to query VFIO migration 
>> support, err: %s",
>> +                         vbasedev->name, strerror(errno));
>> +        }
>> +
>> +        return -errno;
>> +    }
>> +
>> +    *mig_flags = mig->flags;
>> +
>> +    return 0;
>> +}
>> +
>>
>> and then in vfio_migration_init() prior v1 removal:
>>
>> +    ret = vfio_migration_query_flags(vbasedev, &mig_flags);
>> +    if (!ret) {
>> +        /* Migration v2 */
>> +    } else if (ret == -ENOTTY) {
>> +        /* Migration v1 */
>> +    } else {
>> +        return ret;
>> +    }
>>
>> and after v1 removal vfio_migration_init() will be:
>>
>>      ret = vfio_migration_query_flags(vbasedev, &mig_flags);
>>      if (ret) {
>>          return ret;
>>
>>      }
>>
>> Thanks.
>>
>

