Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 575196024B9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 08:47:11 +0200 (CEST)
Received: from localhost ([::1]:52594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okgNa-0002uB-2z
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 02:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1okfqM-0000uY-79
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:12:55 -0400
Received: from mail-sn1anam02on20622.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::622]:29027
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1okfqJ-0007Bo-Uh
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:12:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPdkW4DFTAYEF1EJyo0H7DtsvMmNH1KDyxGzL8toQHAbuIXK7iIJLHRIW9sj+t7rvBs2m8Dsaw1nuI2Dxff/d5e0siZk9OEidTP2WPDmf1b5F19hHGKGGpjpRlk+4H2coP1EX5fmzwKzaIrNfh4e/QbMxZaApj438O2a4rg+w1FCVfTaWjc5E31uKisE+C3Z7a0kau0dSNmyetN3V0x0OVrY4J183yj3rbAS1q3wmZ5/qpzDYAAM9yySRn1IITnIdIcg7pf2p5vFs1/9fQz8kWAdUDq/jK0lk8D5C11macDtcEpMEfJwez2Xu+MKI588UIzTBpRosOmlRIHNlIpgGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBSwoHx/tDDApZcYoQ+4iY1pWHgkg6HPYMU28Hb9ut8=;
 b=cpQsy8X2pf9du+nMAmEkXulAw2lekmrVOB+h17X5By/JUKpzftUgYlujH5xN35hxtywI+BcrmZjtXm2m0Ce+U8H1DESr3+UXUJO4FHwTO6gq+kW9WMFTFwPAezrOGX/fWeGWd+pqpW/eOl73Lvq96SUL5uUhI4vtTy+68V3yL0gqdLxBk5qj21gXZ9kFRlkz2oZi/2mOwL+mMPMyQWLQILJSwBc6XFRpQGzXW7de72NDzKIlBazYool0SKohN9+awTMXJKwmAoHCGbeKYCxWVx6scgIYVtnTKhb8T+H61SemW0LHPEbYxomX1Sr1jGFvXdsj5D02+G6D2dVlw5wiDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBSwoHx/tDDApZcYoQ+4iY1pWHgkg6HPYMU28Hb9ut8=;
 b=qKN/pU7Cry0maACEhOOiGoXa/YE1o2nRV4ox5p/okvH6hq4QiJ1XhzZK3m8gl+RFdYjXQXbTo4lyjnQpgKaijKIC1hf17AfQAuALsNTutBeNESJnGKco4E6ezdy9MBkTAzCjErEiruzGhbZt67BsB1STpqFYTGacTQj4Cpv62RVUYkAb+lZVeIOjXTZp8uTsjx6Lajz2x5/G5+dm/+diED8HaiD02tvtQ0F7ISjKMwMRQc5hNoyAG4KPA1mC9ZBSYS8KDVzFs7WgYthR0ymAT75C0x0A20yfpgU4E4KbpkSk36s4z46orK8+1mYrjFMnpILaW+gbpECFRbt9wfxU3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by SJ0PR12MB6928.namprd12.prod.outlook.com (2603:10b6:a03:483::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 18 Oct
 2022 06:07:39 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::cb51:f0db:dc58:4d74]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::cb51:f0db:dc58:4d74%7]) with mapi id 15.20.5723.034; Tue, 18 Oct 2022
 06:07:39 +0000
Message-ID: <fdd1d6ac-0181-41b5-44a1-27eefaaa88b3@nvidia.com>
Date: Tue, 18 Oct 2022 09:07:31 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] vfio/migration: Fix wrong enum usage
To: "Zhang, Chen" <chen.zhang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kunkun Jiang <jiangkunkun@huawei.com>
References: <20221016085752.32740-1-avihaih@nvidia.com>
 <MWHPR11MB003134E104A73113165B23FC9B289@MWHPR11MB0031.namprd11.prod.outlook.com>
Content-Language: en-US
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <MWHPR11MB003134E104A73113165B23FC9B289@MWHPR11MB0031.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0027.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::15) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|SJ0PR12MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 666a6112-bc63-4e04-f865-08dab0cf0dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WjsuRu9O5JzObz9IpZBQISOlW9fBGKvuNwAEBfCBorUqMq8G+YXODmk6ifKsgxqrDlkhCQCD1q1Cr6XHPQz9Uo324TWDueq/5q5DczZsg+hApIEtKtZ+NqRo37iE2mvOQMYz6+WvZTf0afaUGr5q5rPzKP5xjvfX+7Q7GMkdVpfU2lrX7wZOGLgWx1bGTlFS6EQqh2mNni4QFn5900o69mPB/hS3jw2fgLpXJCCQNE/piTtFNpely8RE8XM7ghGiplQzWnSjDaQ70gDBnaKPnK/Wc6dZunCNFUanRaPoFa5/WKwjvWRJZoYWCtfzsozSXRbfOeyZaH5xcEMNqpoMoWeTxI3gys5R6XxggNtcLjwyUnOKft8XZOdYXbNI2qQzXNeHFuJM98KNaHA8IH/ax686RhWf+wF2ByFe6Gp3ZtIe9+w/Mm4K+WkKw8lzMIkNaCfsZ6J95S8fNbesp/+TxFLtmDgApR4Wcu766kIqYLGnLRQt5A+lir87tq2TEUK+gK337/S4Ql0yaAcIJLVof4PoRiBsjleOecp/zqIgezrKQGVq3Bud9PqDxvbCFCqM9fe13W20EIXbRNUIapezWb45pFgs9jxFzC9wzZuM3GHP2uVjOtCU7P9Vo/Hdo8IKvrl8RPF7aaJgjvLa4P28cjgJZHE79ienlLw+mVxp3ax57nEKXlYq6fMBHIuB+uxYxRUaf/LUhSGJsE/vE4VNRIHpLtsgc0+qGiFhGUhBZ5FbZN3n8mkhVqw99Al5TOnfKslz6S+sUr7jF265boox3BTw/fl90oDgEO25v4wRf7A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199015)(316002)(110136005)(36756003)(53546011)(2906002)(186003)(2616005)(41300700001)(6506007)(8936002)(31696002)(6512007)(26005)(5660300002)(83380400001)(6666004)(8676002)(66476007)(86362001)(66556008)(66946007)(31686004)(38100700002)(6486002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2hKQjdqeHpZV0ZxdFJQdVpMbzhhNXVQc3FkbnFkK1VLQUlkZlUyQUI3VHhZ?=
 =?utf-8?B?SFNjcXdmcHlEa294MlR3akI2aTlvRFVzR2VDZUJ6NlZjTWJFcjV3ZldLcXFE?=
 =?utf-8?B?U3JnUGtqWWFUejhJeTh0cklGSnl5K2h5OS9yR2dLaDZ1b2pkVU1NMkl1K1g1?=
 =?utf-8?B?bVN1Z2x0b2I4VDZJZ215Zit3TDBMTFlVUFQya0R3Vjdpd094QTAyYlFLVnZs?=
 =?utf-8?B?WjdqbE5JVTdkbEIweG5lTkhNVldVOEVIT2ZmTUc1VkFoSEFSaUtSaEJzalU2?=
 =?utf-8?B?YjZVdE5GenJwL1ozaWVab3lZclltdm8ybkJoUHpvc1IzTVJDR0VhWk0zKzAr?=
 =?utf-8?B?dDFqQWtocVFJSGgrTzNGRldCNXRHSklMcHc4SUYvMUY2U0FCMHByeEMxRUlB?=
 =?utf-8?B?VkJpOHBoRnhNUmpkZVRmV1BkZnNUbW1JS2pidHE4Y1JmbUVVd2VkcjQrdHQ2?=
 =?utf-8?B?eDg5RUhZcGljc25kOGxQZVJQdG9hRzdWSUwvNWpXd0lRN0FIakhqMnc3Qnpy?=
 =?utf-8?B?eGFneDFwS05GN3hHNnN3U0Q3YXRKc0JjdkVhQXdsajliS0FXWVhLWnM4eUxp?=
 =?utf-8?B?ejNabnNPRVU2TjlFeTYybUJ4dGZRWVlyRjN5WWEzWWFIUS9pc01TanZ1K29I?=
 =?utf-8?B?Nmx3OUJNYXZORXVoTGVsVGZzZkRCYjNlbmNkWjVXdk5RanErcmNzdWFHSVpW?=
 =?utf-8?B?NjZFaVJaZXp4K2RxN3RDVDlSYnVteGlFUDdXL2M2RWl4VG1uTGZ3V0V4Ujha?=
 =?utf-8?B?ZmF6Rno3UjY5QkIvMEpBS1hubDVGc3FhT0tnMGFDV0k4eEQ4VXZmVWxYRTFm?=
 =?utf-8?B?dHVOb0l5Rk9LNWpVUyt1U04zS0ZLVm9CUVU1MnQ0b1JZcWQvYVVKUzZJb2Vq?=
 =?utf-8?B?MENJQTQweDB0L2picklldm9ldkxTcFdTRWh6dnJhUE9JbHQ1bVpDWFZoY01I?=
 =?utf-8?B?RmxFTXZOUVJKbVhwV0M0UjdJa1dkeE1lNDU0MzZOcGtqSmdRUDEvZkNncXlz?=
 =?utf-8?B?TVQyWTkrUU16cDM5RHJ5L1NWdHdZYklvS3g0NnJ0S3lna3Z6TFJCVTFhNmJq?=
 =?utf-8?B?TlJ1bVJPMThaREdIT1k0NndjZ0ZVUnNFbVdpbERvWnB0cnRDUXBEZlViZzJT?=
 =?utf-8?B?SGdkeVdaTkFQd1NOODE1V2RpSE1zSkxndGh1bUVhRzUyRmhUQ3VKRkVHK3Fn?=
 =?utf-8?B?akxYYWhZa0luS2tIT3NGSWFHV2dpVTZpL2xDNWtnN1hoczFiN3cwc1c2UTkx?=
 =?utf-8?B?bWFDZHBoMFRzTWxsS3hHWTZVUi9DVHdoakp5K3pZOHh4a1VCNUtGQXZkODFV?=
 =?utf-8?B?WEdUNTdJWS94YTBCTEJWbkRlUzdBQlordjYwbEh6UU14L205RjFPTm9VWXlu?=
 =?utf-8?B?RnFyU3lVd1dzRTE3Z3ROd3R3RzNjemk2aldFZzZ1NUdmN1hqTGQ1dHdTb3NT?=
 =?utf-8?B?SFJKVkx5K0hla0tQbFFwUkR3REl2c2xvWkVkTlhEaDVjMUVadGhQc1B5OFdn?=
 =?utf-8?B?eDJxc2JVazFPcVoyRVg4NG9EazFuMmJYbmxxTVpiQVprNHMybFdDR3FIMlFK?=
 =?utf-8?B?WVFHQ1RseklMVEV4M0crMkR4dnVMTkF6aUhNbjBidVltUmc4VlZJU1VRaEV2?=
 =?utf-8?B?ZUpISFlsRXF0NHc1REdpTHVETmxTMUxTUWJOZVI1RVNkMDJQWllrWXZnYmdj?=
 =?utf-8?B?MWZBOGVESXZLa0tVOW9yUUJrRHh1eGVwZGJVeVJMeDFveEJMUlpKdTd6Mktp?=
 =?utf-8?B?Y3NHUlVJc01jK0U0OGozRzFaVGRmbEhJNGp0M0o0UzR1czFYT0M1MncyY25O?=
 =?utf-8?B?d0hDbitFTm9qT1hxc0VrZFVjT0NGemhvWXVKNnEwT3N4a0RHUTFLUVFGd1Bw?=
 =?utf-8?B?UUlDY3FYZ1VoeWtpR25hWW9ac3l6NVYzZUMvQVJMc3BWd0pXYTJlcFF4T2ZP?=
 =?utf-8?B?enVzL2JSTFplTFhPZHo0UE5sQmE1NEw2ZTlWM3NJT3A4Z3llRC9SaVdyejNP?=
 =?utf-8?B?clZhUkxwNXZGVmRFbm5qQWZDOEcydCtnODZSQUg1OXlVNUtkNlVWS3dFRDh4?=
 =?utf-8?B?WjJMdEFkZmtQcGNiMnJ1eUt2NEkvQUFtZklQbldKOHBuaWUvem1KMXNKcEN6?=
 =?utf-8?Q?+cW1darWhWjwwzbzlbM7JMqDL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666a6112-bc63-4e04-f865-08dab0cf0dac
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 06:07:39.6273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wyG6i8IQHX+1b4JEdHXwT9FdunPUXmUYuk+a2U3acUH99xoOR8k0yNn+mqLxvLTwYHsyONJC59uT02yMm6U2wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6928
Received-SPF: softfail client-ip=2a01:111:f400:7ea9::622;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 18/10/2022 5:37, Zhang, Chen wrote:
> External email: Use caution opening links or attachments
>
>
>> -----Original Message-----
>> From: Qemu-devel <qemu-devel-bounces+chen.zhang=intel.com@nongnu.org>
>> On Behalf Of Avihai Horon
>> Sent: Sunday, October 16, 2022 4:58 PM
>> To: qemu-devel@nongnu.org; Alex Williamson
>> <alex.williamson@redhat.com>; Kunkun Jiang <jiangkunkun@huawei.com>
>> Cc: Avihai Horon <avihaih@nvidia.com>
>> Subject: [PATCH] vfio/migration: Fix wrong enum usage
>>
>> vfio_migration_init() initializes VFIOMigration->device_state using enum of
>> VFIO migration protocol v2. Current implemented protocol is v1 so v1 enum
>> should be used. Fix it.
>>
>> Fixes: 429c72800654 ("vfio/migration: Fix incorrect initialization value for
>> parameters in VFIOMigration")
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Looks good to me.
> Reviewed-by: Zhang Chen <chen.zhang@intel.com>
>
> But I found nowhere using the enum of VFIO migration protocol v2 (vfio_device_mig_state).
> I don't know more about the background, should we remove the  redundancy definition or add full support for
> the VFIO migration protocol v2 ?
We are currently in the process of adding support for v2 protocol that 
will replace v1.
Once v2 is added, v1 will be removed.

Thanks.

>
> Thanks
> Chen
>
>> ---
>>   hw/vfio/migration.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c index
>> d9598ce070..8dbbfa2c56 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -803,7 +803,7 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>>       }
>>
>>       vbasedev->migration = g_new0(VFIOMigration, 1);
>> -    vbasedev->migration->device_state = VFIO_DEVICE_STATE_RUNNING;
>> +    vbasedev->migration->device_state = VFIO_DEVICE_STATE_V1_RUNNING;
>>       vbasedev->migration->vm_running = runstate_is_running();
>>
>>       ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
>> --
>> 2.21.3
>>

