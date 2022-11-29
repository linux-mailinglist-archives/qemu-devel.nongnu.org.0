Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C650C63BE30
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 11:43:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozy3M-0001ij-Qg; Tue, 29 Nov 2022 05:41:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ozy3H-0001hq-Fx; Tue, 29 Nov 2022 05:41:23 -0500
Received: from mail-dm6nam12on20606.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::606]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ozy34-0001vG-MW; Tue, 29 Nov 2022 05:41:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTpAsE9MP9XCotbC0oWRnQlMolVV+Hn3PgCvRAKyZipjB4dkQc8eHbNHFt19TZJ0FMIr8R1nrewu48CYSURVO9bHXEZ8OFVavXe7jLNDnkpkNT1x/2BeuIGNMVtb/QhGKUMeu5HKk/eLGEs1obsxtojOXa/1zKT1HPkTH1QuSIVw6PmkZi2fO6Gn1S/t4LV1WzSgxDmSwv0vn8VZ1EaFBKD5HnkJhf4xgUftUiXxWdZkkurSgqVUewqBv70HePNcEwWL+8xDzXlg9ZAGQn0pMJjKzQQq6BVB3gt/hs1WZy4gs1+CwpmNvb0AxAWNs9L7TLOGc7p5HUHh7iOHKMxBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3Ow2DFICjDP0D9RQR7gAKCkOJFYJggYBFJJmT3xz7g=;
 b=PK2VbQ8gdy2xd4G3qXPQluTEE/t1wHsi0dFRSoMTwyuv6zIqIzNXTu+Z79VWUwHMjm9pSOTsopgl7oDBiPqRS6OQ5bei4oPF+dO2E+mdOWKWA78rEwnJZmZEdCzK72MqmXjDKzO+sJz/BgNl+6Szyc+QuTXNI2KUKK2TQmjPETvchOdNZ3tPfCxwL89w0rrsK5o56XEeVnD2i2maKFcOXLqGXKOqzTLX5qwP2VFb5s9bYmG/+YPYS/Nc9/HxExzxO3VZD0gx2dDKgXM79epvsY3kLUpGLCak3x7BL/K5DUpDA98m4TMB1sO6Fan3Kwh90vfuREwjAdMmlF6qjUmB6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3Ow2DFICjDP0D9RQR7gAKCkOJFYJggYBFJJmT3xz7g=;
 b=t4bhTN3aCZf87moZuJtsntxcWy8vgC92Z7HVeyYPOMc4lY9bWlQhZFQh1OIsBe3FCtz3yNGTf6DYGQ4lmlpjThy45LBFUNTJoEeozxuS7HHxm9yVlesWQ5ZRGAhpkN0Cl7zd4HyNGe97QE54ABoe0ROgQt1qt5Js8W7pUFm5uk8LRp+g4rfeTGRZjMVLIMXILPwXjR31cLSiyFdPmW8dlYBZy0c7uTibVens048Wln5UATI5grpc7rnUOE/1k9SrdADh3Jx7FvUcfMVS8J4+M99H09a7rRgrtCwdKizZ7ubVA+VIV0cUN4Y+G6sukmap2gmJhXSx8svyrOVgwMGE5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by CY8PR12MB7123.namprd12.prod.outlook.com (2603:10b6:930:60::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 10:41:05 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::820f:1fa0:9353:bece]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::820f:1fa0:9353:bece%9]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 10:41:05 +0000
Message-ID: <a4bbf010-10c9-59f3-b13d-a3a36b9a7615@nvidia.com>
Date: Tue, 29 Nov 2022 12:40:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 12/17] vfio/migration: Implement VFIO migration
 protocol v2
To: Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
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
 Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Shay Drory <shayd@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-13-avihaih@nvidia.com>
 <20221116112935.23118a30.alex.williamson@redhat.com>
 <099b99c2-8949-c101-45eb-9a8aaed2adb7@nvidia.com>
 <20221117103829.18feab7a.alex.williamson@redhat.com>
 <feaa77ec-c574-6267-0872-d8769037e4c7@nvidia.com>
 <a867c866-c297-960c-6fe3-51f292f4c6d3@nvidia.com>
 <20221128115003.602d4ef7.alex.williamson@redhat.com>
 <Y4UOp7Wi/fwsY6DY@nvidia.com>
 <20221128133630.07e1fa14.alex.williamson@redhat.com>
 <Y4Ugh3TU5lq59pfM@nvidia.com>
 <20221128141045.2ae4da7d.alex.williamson@redhat.com>
Content-Language: en-US
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20221128141045.2ae4da7d.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::21) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|CY8PR12MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: 021c3b90-9b02-42a7-cb29-08dad1f636e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HGXg8lFJUr2+gMROaK6dgXY3Hm1+hIYJ86HAH4KSefUNly85E7ybKVFeYwdkC++9vQ0rmx3X5GSwn9DxLdSVEnaRipv/qMuxgAgHDaaS2Xu/xZk5r5jsMDyUeO1+GN4LSkaLyYJccEtNjUhYKR9M8vgrqKj6yAHgmKtVE8a2Q6DFTBh5JPZcdllNdk/qtfhsZtCfU5ldGFyVbGhv4nRWzeaqackSKl9XFb9G1k9tTKXPnmLctFFmBCaIb1+uTRUih56ku0N/BjVp6rnwQA14aSLIhy5wLNqErL51ba8K69O7DO64R7TslMV4fWb6RIWVFnKW2HQOYv713S5U7kjHWIpKYdxmG9jXoK0W8enlCGFRP21Vpd1HJxV9q9YrHKDryInqLeAJU+0XD8xI+LCYasv3WMv7Y5KpaJa/+mbrI2qnDS2w0SPhqjBxk4KOhl+6hcZR2fgCFFwWiv7sneNf09bDaXgdn2kzY3aDrK8QzfKoQHCgS9lVlY9Uv4QGimxHM+tjDHUuvA634NghdsskzYR3r9UkPCO+zsSIA4vivM2jem4ROK6Zk1ZzEfH0quxPYu8W/Mltow6VoxpofVBvNWUgQl78bDz/Z3k9ychw8qxpXGKpo07aTxXAZXLf2U21SelqJuzS+J5hKpQwyUy+H2RYlU/gQL1AGZUmwwwpHuRMgRnXo3hNEbYNcrFuABRVvcW9VX6pRBewU8MgSAB5/KLpiLte7XUDKM7ysrwjeBQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199015)(6512007)(31696002)(36756003)(86362001)(38100700002)(54906003)(6486002)(6666004)(6506007)(110136005)(8676002)(53546011)(66476007)(6636002)(478600001)(7416002)(8936002)(5660300002)(2906002)(316002)(66556008)(41300700001)(4326008)(66946007)(26005)(2616005)(186003)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0N0aGZFcVROQUcxdjJ3M0pZMnh4a0t0YlhBVXJCTUxUQ0NCbUhocjM2Uy9u?=
 =?utf-8?B?K2RncmJwTUpTa3ZTem5USDFkYXA0R2hnQjQzd1kweGZzVzl6MnV6ZzhPQWxB?=
 =?utf-8?B?UllqTjA4Tms4YVk2MjBKTGpTL2ZNZjNxUWNFZGtSY0c3bmdTLzRISEpFN3V1?=
 =?utf-8?B?bVVRT1lJeGdIZkFqYVVBK2UweE1HQkYyZUREbWZWTGFibHlYUFpKZWl1Rytp?=
 =?utf-8?B?ZXJnOWNmZlE2NnhFY0RRRFloRWJhWGl4UmpoNFh4TzNSRXhhVjNuU1hTbUJB?=
 =?utf-8?B?ZDU5ZVh4eGF1N3R2eERKRytWSUtNY21yamlsVGx6N21VRnBrcHBOUldsdVZP?=
 =?utf-8?B?N0F5SkRVUUx5dXRkSVdvYy9XdmxwVi9CT0xxTTVXSTlOVjFCQlFEMUJPb3ZS?=
 =?utf-8?B?MGk4aGdVVTVWYzhJbmhnSk1MOHAvWXhXVlFBc08rczlZUVZsNnhVd3dwcXor?=
 =?utf-8?B?OEQwWGpLRUE3ald6V0tubURjN0FMaGUvckN6ZHhzK0gvVzFKSHBBTjgyVUFH?=
 =?utf-8?B?dkFSdmI1OFlVUVliY04rN2NZVGRzT3JOVnFsc0JNSVFPNjRGZzN3b08xbHdt?=
 =?utf-8?B?cHdKemRPSEQ4M3psSW91NkdSSkpDVEZhK1ZCSmNZVmZFb2E2SGpzdFJBVUtC?=
 =?utf-8?B?dlRtN25LT0JYOVA2MHg4VlFqV0EvNnVJbFNueEUxZDBHM1ZOcklSQml5ck9i?=
 =?utf-8?B?ZUpnVE5vbkRJUHcyMzN6ZlEzdVFSL2U2QzV4VVpHdkdjemE3cUMvZjlVNk02?=
 =?utf-8?B?VU4rRVp0QUhuOHVQcWFjbXFHeWhva2tYRDhJS3VhMmR1cWJGWGJTVHFYWDhl?=
 =?utf-8?B?NTFzZ25tV0FEaFNJanAwUyszRklVYkdVSGw1bW8reWV1cTl4OG9lTnptZVRx?=
 =?utf-8?B?akJkMkRnRDBTdTQ3K1paVG9wVVJadEJRVEVNVGtlQW5BYjJsaTZCVHNYSjVM?=
 =?utf-8?B?QTg5ZGhrcTE3S3d3SzE3QW1jWGMxSGREVkJoVzY3NUtJYk95aXV3Z0piSlgz?=
 =?utf-8?B?SWxyb3dyR3kvMmJCQnZMWEliTGFodmFURG1kelhnb3FhOUNiRDE5bUUrZlhU?=
 =?utf-8?B?Q1c3ckJLL1FPY245YU5vMzZxRXUvRllLUTRVa3FUbXU3UjJLNVp1dm9Oc1BF?=
 =?utf-8?B?bnJIZ2c0LzR3M3JONEF4Nmc0akdTdktaTE9rK3NrQ2FCbkswZlhKa2NOcjJo?=
 =?utf-8?B?bnlYNFRmSUg5K1FLQjdNMTA0U1FteWlBcEFCM0ttTGlVQk1INE9qTUY5NllI?=
 =?utf-8?B?VS8wa2tTRkNJdkFucjlMNTBWQytiN2V4czE1dDZ1NXhxcnNaaWwzZXY3RGVw?=
 =?utf-8?B?clc0dURDaTZJRGZxcDlZOU5zSWZOaFV2VGhBRXRENTBMa1B1dkE2d3VSWldx?=
 =?utf-8?B?RG5QRVczdjFNdE5vRWxVOTlYVFV3OUh5K0RPMThOWHBMTHUxaWp3cXpVamtG?=
 =?utf-8?B?VjRHdE5EWGdONUVwL2RDREhLTEQvZElram9rYjh5dE1EQ0dldVd1VkwyT1Zz?=
 =?utf-8?B?SStmYnhiZXBabitRcENrM2JWQ2RMaTN3ZWxZOGQrNHZhOVZHb0I5Z2MvTlRK?=
 =?utf-8?B?NlhtNEt4K2tnM3g2YU11ajM4blNzRUduVS9kSEFLbHBrQW5sbGRPd3NseDZI?=
 =?utf-8?B?YkpIbC9WMXlPZnltbGw3a0NMaGovRS8zUHIxdGMycDF4dTdpODJmRGxSbG5w?=
 =?utf-8?B?WVoyem1SamRONFE1eElYNHBxVEV0SzRFT2ZDWUNnWmFvTmxTUHYyMXUvQlpR?=
 =?utf-8?B?eDA1WmtyY2IweDZkZURWR2pTWGxBOEVNa1IyY1NOTFplU1JwSnhrY2pFMDZW?=
 =?utf-8?B?cEwwY0xYb210dnZidWRhYWpvR0UxWnhOMGYwcjlLZWZMZ1JRb2pUM2MxeUlU?=
 =?utf-8?B?aGI4cWJzR0M1VWozdDV6bjIrOU5HN21LVDdPVFBCNWxqWDE4QnhMaFRQTEg5?=
 =?utf-8?B?bUZHWk5KTEtGS3Y0ODd1UzVvcGpXUENOR0pLUHB2ekRIMG9VNE82MHlnUkp0?=
 =?utf-8?B?REFURXhlYnBjTkRPbkZQeVhRdVhacUk1dytLY0kvU2hSalpKSFFkY1JFdTNF?=
 =?utf-8?B?ZitMYmZlVVJBUjVFVTROLzhyQmNLQjg4Qnp4TjV3Tk5WQk92RFhzdE12bjgw?=
 =?utf-8?Q?FLrJQE5T/P3SE5YMlAOY+h0TI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 021c3b90-9b02-42a7-cb29-08dad1f636e5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 10:41:05.3139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WsyRh7TlW9Llsq/0HQvOkWv68M9q/XphLQlXRZoHioHcX420cBubv24c7eBCiAFkIFacfWCowAoiF9RamcWrgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7123
Received-SPF: softfail client-ip=2a01:111:f400:fe59::606;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, SPF_HELO_PASS=-0.001,
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


On 28/11/2022 23:10, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Mon, 28 Nov 2022 16:56:39 -0400
> Jason Gunthorpe <jgg@nvidia.com> wrote:
>
>> On Mon, Nov 28, 2022 at 01:36:30PM -0700, Alex Williamson wrote:
>>> On Mon, 28 Nov 2022 15:40:23 -0400
>>> Jason Gunthorpe <jgg@nvidia.com> wrote:
>>>
>>>> On Mon, Nov 28, 2022 at 11:50:03AM -0700, Alex Williamson wrote:
>>>>
>>>>> There's a claim here about added complexity that I'm not really seeing.
>>>>> It looks like we simply make an ioctl call here and scale our buffer
>>>>> based on the minimum of the returned device estimate or our upper
>>>>> bound.
>>>> I'm not keen on this, for something like mlx5 that has a small precopy
>>>> size and large post-copy size it risks running with an under allocated
>>>> buffer, which is harmful to performance.
>>> I'm trying to weed out whether there are device assumptions in the
>>> implementation, seems like maybe we found one.
>> I don't think there are assumptions. Any correct kernel driver should
>> be able to do this transfer out of the FD byte-at-a-time.
>>
>> This buffer size is just a random selection for now until we get
>> multi-fd and can sit down, benchmark and optimize this properly.
> We can certainly still do that, but I'm still failing to see how
> buffer_size = min(MIG_DATA_SIZE, 1MB) is such an imposition on the
> complexity or over-eager optimization.

OK, I will adjust the min buffer size based on MIG_DATA_SIZE ioctl.

Thanks.


