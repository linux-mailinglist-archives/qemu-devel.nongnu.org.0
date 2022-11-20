Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBB3631338
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Nov 2022 10:36:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owgis-0002mj-PO; Sun, 20 Nov 2022 04:34:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1owgiq-0002lj-7k; Sun, 20 Nov 2022 04:34:44 -0500
Received: from mail-dm6nam12on20610.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::610]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1owgin-00044M-Sk; Sun, 20 Nov 2022 04:34:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKDo9dDRZ9L6yrnM8UQCFcMn774OTsMVXlpv8/5P/atj82EmPFfYsCJSMZZm10Kbkn5CSMXfYbhGdcjQkDE30xuB/ssWo2Hz5yJ5hx2Rzn0W8cNwUVNMr0noYmwVsm/GxWuLhz/vXXRYeLamH866cgRBvDUVtc7D1GwSL9YgINzMqm3eZkNajOS3EZ1GIMoAmUhame/+8KrfsNiT+LZAS02Bzx0qDrQZ+YOdEEJ8mqvmcDM2Rpi0Lcqnnr1yBj+o15Vo8Y0dGXD8lc0gQpAoM1dUY8g6OF3Gg9vOL32CxuMeX2uXtiMjXPdxGRpkm1Ut1xU9MwebNccs0vOSA3drsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qgd96fCRzRNehZzLvIiK0Bz5pZ5zLJqF4tpJPU7erSw=;
 b=jK+DN5bTsBWFaHBT2GGUMWehvuiqP6X3q+EuKExxEZjz9Tib1LwRRGJMUM6a98f+Beby5T2IIAF3sfJqxk0iVp2uFmPH6uwF6XQba47yXn//PEuCeshCwVSS4q0p27nta3ZuUYZehHFlvYh1wSxNM4DWLSX4ALwWXlgLSjnvt+vy0E+WRp3wtMiHFKse8K0+QKOhusGG5lEmBS7OB1OcurhZ21+lmcTesI2J2uC3FlnLhTbewHWXYKF8ZRgdrt+mOzO+8T1Qz4u2QM73fAuPa5xpH5/pX0FYfjm3wD9xVMGFMM5cv5mExWy3CSX5K84QFsTGGdq9gnPOVoDdFROC1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qgd96fCRzRNehZzLvIiK0Bz5pZ5zLJqF4tpJPU7erSw=;
 b=eacg35M/14Pst3u7JD66U1uBumza7leiJOVdngtbbm/IBpipN+8mQoMBmcAfQ57wC9110vdjk/yzpnU3nQHO6oyU5YrE/Ml6vehfCZoQoH0hnTcVkNXLPuzGlfBrO61b0JRUyauoh0M5pHTZRxwyFWi6RpVzFJMVqN/XnkK8vwg4wyAlzfv9OmyV/WWH2JDNve/1rHPPz5Or4AtFNUMmqDFj7P3Z3YF58boIbgKpsYWDC2cdmyLDGUmRjr7Ka9OZjI9QxwhbXnb/A1HsxjKQywQl2Cgc8Mdvd8x91L/6rryK8CpAkoS0y3C2SnsqNi5Jwg4S/vsPZnFaoIbA0PyZvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by DM6PR12MB4532.namprd12.prod.outlook.com (2603:10b6:5:2af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Sun, 20 Nov
 2022 09:34:36 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::820f:1fa0:9353:bece]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::820f:1fa0:9353:bece%9]) with mapi id 15.20.5834.011; Sun, 20 Nov 2022
 09:34:36 +0000
Message-ID: <feaa77ec-c574-6267-0872-d8769037e4c7@nvidia.com>
Date: Sun, 20 Nov 2022 11:34:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 12/17] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
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
 Kunkun Jiang <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-13-avihaih@nvidia.com>
 <20221116112935.23118a30.alex.williamson@redhat.com>
 <099b99c2-8949-c101-45eb-9a8aaed2adb7@nvidia.com>
 <20221117103829.18feab7a.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20221117103829.18feab7a.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::18) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|DM6PR12MB4532:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ed05a19-7bec-431f-01fe-08dacada7010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f5B9jTD5BK3VYzPSI43oc5hufaXHYFCQtc6hhrF84rPyRj882UezwT4Ss4e+LodDq0rNCun6FTdaZRca8CU2Df0z2t1ZrLJn3h/0VrIsYvHBk7l5g+VEY2p65oOOD7+lzoT6XSv7gS5CFTbgLxYy5vCQ+mRDm+84jcKLHVZd8hokMDi6dPNASfiMsuMl5n0QeCF4cLNS/5Koxr6MlUZa89H3LQ62uQQujjI5b/mSLa8R3ZKSlVeQJNrQcn33VzoP4bXZOBSYx+VDYD0clI+Va5y90fx+m7vF0+N4ize1/pB6GLDwqFAZYjQnBwlwpOxgI+voUYM4vvKkvqDK8eTGbnN3TbEfKLICSmtHHz8VaT6+00FtTPb6up2oWU1or/iXDem4BfWcA6eG/h2PaMzobZAXRg/k+sR/sAKH2SXTmtqPp2+rsizlXJAydYOYz3yN39EvZL1LpKkQc4IGiHZGQMmx0lOd7uj3GMW9wOxNdLY2VkfjVYsBsMKZaIbXQMvpIoykOWZTkrX68fNF9jCUmak9wHJV1GD/9TM2RWM+jWE21dSEcRsDL1iak2896v/XgjMRio26rsBJae+naRVQg2S1C0u59+nXpjbQTfgLa1HByvhDZE/qzrgcSR87XFwiQByWDu3fZ8CRXpLy08qxLg+wK3NKVSNcv5hemVYQgs73jaEoi6hHfU/M8xto6TwDQTGSwPCFbQvGgxUtRSk4UpxDpjswipoyEqW0N81d9vI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199015)(6666004)(6512007)(6506007)(2616005)(186003)(53546011)(26005)(6486002)(2906002)(36756003)(478600001)(38100700002)(31696002)(86362001)(83380400001)(8936002)(7416002)(41300700001)(31686004)(66476007)(66556008)(66946007)(8676002)(5660300002)(4326008)(54906003)(6916009)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUZDTG8zN0VIQmZQeXRiNEZtcDZLOWhEWFdHRHpvLy84STNtcUw3TVora1E2?=
 =?utf-8?B?cUhwa0lBbDBDbGRiTUZXY3duMVo5blE4dnBDSmZqVjdnYjZ4QzRhU1RKRjBk?=
 =?utf-8?B?TVplYWdteWVLLzBkbmRBcmtNU3ZObkxML2ZZeERxUzVyL2xFWjdFZmpmdVpM?=
 =?utf-8?B?c1lsZHRiS3pQZ1VpZ3htU1E2TlN0TVFYVDFXcCtPS21uMVIyNHcyMnRya21K?=
 =?utf-8?B?b2c2eXRnbkNvK29ZVWNYb3dvcnQ2QW9jNTluZTQ0ZFlCdmQ5TjRXUnFoZlFr?=
 =?utf-8?B?T0JJVUFhKzkzbUpjUm5PQ29uTUhDSFZDb2tFQTNxdnMwY1FhaURlOFBkQmRm?=
 =?utf-8?B?b3BEMWxaaGkvTm5vYUxrRkdPdzB3TDFyYi9FWHBVSmhyWHd3T1h2bVd3aGhP?=
 =?utf-8?B?WG1zTXFOM0E4d0NpMWtKdFVXOFZvUS9POTJvYW9wSWtiK0xjc293cDVmWlJt?=
 =?utf-8?B?TEF2SHlyTDhJdnQ5SzZhV0Q3dVFWMVlrTHdJRC8xbG5KYVJXQXIrcU1ZRXpD?=
 =?utf-8?B?RnY2cVZBSlJoS1NTcUVmSnpOZGdvekZUMkFxUHF5WkdvbnRscUR3TFZxLzZP?=
 =?utf-8?B?OTBlWlRKeU1RQ1RPbEw4OG9nRy9ISmFKSkV2SERZNjhjYkx5ZEFPQThjOWda?=
 =?utf-8?B?a2FubVVpb1Bwb1ZucEdwcmxXekhwY0ZNSW5uTDQ0Wmlhcmk1YkRLUDFVYXB0?=
 =?utf-8?B?ZTVGNTlkbjNNclNBbytrcElGKzQ5aTNxUmo3bXIwRWdaWXBGMlBBVHBOVUVV?=
 =?utf-8?B?TXNHeFRWdk9zUUxWRXAxTlQrKy9yOG10Q3h5YXhIdXg2azc0amtsak9kUTVE?=
 =?utf-8?B?aDZVbU9SSVd6SWovSGFYaCtnanNyeGhCVkpWVzVMaGl6c3hGTVZiRzVMOXY4?=
 =?utf-8?B?UWI3Y3VUM01rMUMzMEp1WVlHQ043Ti9yalUvVVJOVjdOT1dqdlRvNmZjeVRF?=
 =?utf-8?B?cUxVQWhOUlo4VlU5VGllYlJzZTdseVJGRDVUS3pwOUJZcmZEdUR6aGxwenFJ?=
 =?utf-8?B?ZUM2ck9QNzNZNGlQelN2ZFNMbk5LdEpVQTJrVmozbkhSZUhwS2hWMEFxRVZG?=
 =?utf-8?B?cFFlWXBQUU56aUtzQUhURFkwYnZQUk1nSWhGdzlDdmlSbGp1YWlJamVpWVVh?=
 =?utf-8?B?bmpDRUkrb1I0OGZGeTQxSFFSUjU5bUxaSXRYMUFhY2c5RGkraXVmNk1oeWtl?=
 =?utf-8?B?M2lDUmtTYmNIMkVxOWRkZ2E2WmdQdG5jS2FOaVI0c0NxMmtLekxZQWZtZzRW?=
 =?utf-8?B?eWFMbE9aTFBCd1lNa0dqakZ2TitQa3UzQ0V3VTdGRDdRSUVhT1k1bXpvZFhr?=
 =?utf-8?B?OWN0VHZxZE5HMzZDNFNPa3MxcEtERXVhb09KSVFXcC9KUWlNbkVqdSt4TG51?=
 =?utf-8?B?cW9yalBqa3FOQ0NmUXU5L3M5VlM4c1hZRGpvd0JQV2NrK3dFMUd0cTB0TVpZ?=
 =?utf-8?B?YnJGcENTeGZYWE1tcXV2eURUOHFyY3owSkdZTElJVHpuc2FhRFY2TXVYdllG?=
 =?utf-8?B?a3RpSkI5azc3NnEyVGdHUFQxM1JHZVJiVi9ueGdVUVhYa1VtenV2Wmh6VTlT?=
 =?utf-8?B?cTR1ZVVhRnVZRUhDeGJFOE54U3dCOXpIeFFucUUwY25DNEdOYTlrTXNFb2VC?=
 =?utf-8?B?TGVCUzVMNFoyR3MwWEZIV2xMem5sVnllR0tVSnRaUzNqSDJwcVlIUTdFWnNB?=
 =?utf-8?B?V1RhZ3o2YnNsSFZpSVBscGlUZThxV01udHU1d05Qc1NMcmdJa0FvQlRvR0FR?=
 =?utf-8?B?UHFoc2hBbGtSaDJNaGJKVkRBWCszVjRHUGhYZ0YxR3lpa002T21TeFd5b3Fr?=
 =?utf-8?B?STdiUEh6TlBrNW5PZmlENzZNbGVieDlxQWI4Z2h4Vk9xckVsbU5HSFJ3Rk1E?=
 =?utf-8?B?dDg1aVhkL2dxMWo4WGlrSjBsR0VONmd0bEppMCtPbVdUL09FVDFsNTZMekd5?=
 =?utf-8?B?L2VXVFVKcmhyM2FGaWJieE91NFdmNWd2QU5vaU1HYXhvZGNxenNzenFsazZ4?=
 =?utf-8?B?Skg1d1F2T1JXQ2kxYldsNXhjbU44ZExNeERSdzNDYnJaU0lCMmhiaUhPdTIv?=
 =?utf-8?B?TVpSYlVmS0xoMnhkdXlzTGVpaWpuY2R1SWNLWklLanozNE01Vk5mOTM3QkhW?=
 =?utf-8?Q?QzfVsFTEJVt8PHFjbagd4AJyb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed05a19-7bec-431f-01fe-08dacada7010
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2022 09:34:36.0936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JhKTy9Q6E/iay2IWBRvzu70eScs6T5VrJeG55FIiWIUzNwgwDZiOQ3GIM4E4Y8GRjWSrY10t4ru1szZ+pk+8pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4532
Received-SPF: softfail client-ip=2a01:111:f400:fe59::610;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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


On 17/11/2022 19:38, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Thu, 17 Nov 2022 19:07:10 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>> On 16/11/2022 20:29, Alex Williamson wrote:
>>> On Thu, 3 Nov 2022 18:16:15 +0200
>>> Avihai Horon <avihaih@nvidia.com> wrote:
>>>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>>>> index e784374453..62afc23a8c 100644
>>>> --- a/hw/vfio/migration.c
>>>> +++ b/hw/vfio/migration.c
>>>> @@ -44,8 +44,84 @@
>>>>    #define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
>>>>    #define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
>>>>
>>>> +#define VFIO_MIG_DATA_BUFFER_SIZE (1024 * 1024)
>>> Add comment explaining heuristic of this size.
>> This is an arbitrary size we picked with mlx5 state size in mind.
>> Increasing this size to higher values (128M, 1G) didn't improve
>> performance in our testing.
>>
>> How about this comment:
>> This is an initial value that doesn't consume much memory and provides
>> good performance.
>>
>> Do you have other suggestion?
> I'd lean more towards your description above, ex:
>
> /*
>   * This is an arbitrary size based on migration of mlx5 devices, where
>   * the worst case total device migration size is on the order of 100s
>   * of MB.  Testing with larger values, ex. 128MB and 1GB, did not show
>   * a performance improvement.
>   */
>
> I think that provides sufficient information for someone who might come
> later to have an understanding of the basis if they want to try to
> optimize further.

OK, sounds good, I will add a comment like this.

>>>> @@ -804,34 +1090,51 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>>>>            return -EINVAL;
>>>>        }
>>>>
>>>> -    ret = vfio_get_dev_region_info(vbasedev,
>>>> -                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
>>>> -                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
>>>> -                                   &info);
>>>> -    if (ret) {
>>>> -        return ret;
>>>> -    }
>>>> +    ret = vfio_migration_query_flags(vbasedev, &mig_flags);
>>>> +    if (!ret) {
>>>> +        /* Migration v2 */
>>>> +        /* Basic migration functionality must be supported */
>>>> +        if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
>>>> +            return -EOPNOTSUPP;
>>>> +        }
>>>> +        vbasedev->migration = g_new0(VFIOMigration, 1);
>>>> +        vbasedev->migration->device_state = VFIO_DEVICE_STATE_RUNNING;
>>>> +        vbasedev->migration->data_buffer_size = VFIO_MIG_DATA_BUFFER_SIZE;
>>>> +        vbasedev->migration->data_buffer =
>>>> +            g_malloc0(vbasedev->migration->data_buffer_size);
>>> So VFIO_MIG_DATA_BUFFER_SIZE is our chunk size, but why doesn't the
>>> later addition of estimated device data size make any changes here?
>>> I'd think we'd want to scale the buffer to the minimum of the reported
>>> data size and some well documented heuristic for an upper bound.
>> As I wrote above, increasing this size to higher values (128M, 1G)
>> didn't improve performance in our testing.
>> We can always change it later on if some other heuristics are proven to
>> improve performance.
> Note that I'm asking about a minimum buffer size, for example if
> hisi_acc reports only 10s of KB for an estimated device size, why would
> we still allocate VFIO_MIG_DATA_BUFFER_SIZE here?  Thanks,

This buffer is rather small and has little memory footprint.
Do you think it is worth the extra complexity of resizing the buffer?


