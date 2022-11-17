Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A26B62E2A2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:12:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oviQw-0001nT-Kw; Thu, 17 Nov 2022 12:12:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oviQt-0001mG-OJ; Thu, 17 Nov 2022 12:12:11 -0500
Received: from mail-co1nam11on20609.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::609]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oviQr-0002zk-Qf; Thu, 17 Nov 2022 12:12:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbA6rhfT169i7nZKIoB7Mkn1LMZ3VDU8sKiN6vcKPVHd+QIiatYSFmkLlql4Z5x4TCWvvnrZN7iQh1RpOPMt38xQREfOcqe0ixm1w/GFfQdeYM4+lm2oT748gJDxnQWNp+jrFMFr1OA2E0iZHzAB8YKFP9prItxY6Io+0fy+oGOXYlK32WxOGSyj4RQD4IKETvsHTl45wQbvgVmdN+OGcJG62nddScJA01swp/3hMUaL98k5ivjAK702sUDsZEy29cDGD4MBj04Zjm3/sTgav/0RVHVCwBjvvv1dhuw6W7e2PS5xQ6ZKjEWnWwhNmc+ZjYP3HD8JpA+AnRWWvgCO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJ5FBSdR4UHzqINtcywDsxX6q7pTXUVAjvGsQwfGED4=;
 b=SYuNvQ+S+0xN1npFn1kRsdeVlx5LUNvUpyL+vyz2hw6bhApy8GqjCK+1SkQYOGSYM8mdbCJEITc1yiydk19kgiQINkgFk97KSWQ3YrY6TH2nu0jywIHdkLrp6byaPkFMO4ZJQUiWaH9EclOFpNeodDodSlEBYiP54mxbNWKVctemcKIm/uRZD1txZGoqmFPVaue9LXLFhrZwrz8fJKhfcQwnyLP/jhM50J5KuD+33t0SCSyIiE5+1upJwLFXZ8VuCYv1rW4Fx5ZeNwVorxCsY143E86UT1FtFdS5hLhaq2goimmhueeH8+d6LvL0T97tBcT6Nade/SegIs5sXQIXxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJ5FBSdR4UHzqINtcywDsxX6q7pTXUVAjvGsQwfGED4=;
 b=MDqcFJAjs3iX3DXgrcnTTfNxfA38BKxwxGBCuzDU8xTYrZJEygHDXGmp2zB00AhOXX6Iuqme8OQ3Bk/1AErs8EtCCM9xCNlo4zYADo7bR4S6gXR1FXSm4cEDstO5lhv1s+dDqu+WjBfddANpaWlYcSUEyk3/o3KFYkrvfva7D0hRnkL1w7YpKXrJkKchHyZr/7eMPJaWpIshLxG99pWRHxSDhWCDsgN78tanZt10FHDqjcDFFEu229eaYEMzTuDfgHSQEervTplnpB+SbFBg8vkqLL9SpRRmxFlOYjtvGxKosH/YstbtMoufi201J4xDRQYMHv8+obXXsT/gd3h23A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by BL0PR12MB4883.namprd12.prod.outlook.com (2603:10b6:208:1c6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Thu, 17 Nov
 2022 17:12:00 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::53a7:afdb:d6d0:f167]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::53a7:afdb:d6d0:f167%8]) with mapi id 15.20.5813.019; Thu, 17 Nov 2022
 17:12:00 +0000
Message-ID: <2904a876-72c2-45d2-16a4-5a9733b432a7@nvidia.com>
Date: Thu, 17 Nov 2022 19:11:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 14/17] vfio/migration: Reset device if setting recover
 state fails
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
 <20221103161620.13120-15-avihaih@nvidia.com>
 <20221116113651.0bdcfea1.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20221116113651.0bdcfea1.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::16)
 To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|BL0PR12MB4883:EE_
X-MS-Office365-Filtering-Correlation-Id: c478340c-3dba-4d5a-e757-08dac8bed6ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R3TwcQIsWMpnZnFCe4+SkfWfVOifsVcs2ISI91hzv2tms3vA2ZViBxPJUz+AjLMHB6PYxON7rjp5X3ipkrJl6sxIQf9VAxt7hECCpNZFOeeOTWbOpopajgzXqXsJYZEBL1O0/nx8BPX9EHpTFvreCwt7fDEYuAPW+GV0EN+HyiLWCcrmJKTfkTGo+MJgToutmAzB1oHkTbYy8v3Q8bvCK6/7zD870TxCBWlY0QwIuRa3znkdObv8KDp7sBKOkpRPE3vFYkiS/EdpSX22Kw33xnMnEpyeay3OvULUKy/jeBrI2J+AteCamywzJp+200cYkvPymu9cqvQOKJCAjnun6KHY/sSluqj0RKqpFPU1ckvutdbfaH4+TBw2fdzc4rQIqVNL7LOcl6yfZ/1RDBjDpL+9IIZyGjShs7jLu5WRsRx2ctUsb7RT27ZMHpUziRNwKhqWOZFxzjZZ+5Xf9semkYoxgrlSvJHlxqaJyNSoVW6krlJ3NgtnxH3gQtHZMrnCADrf3TbwL6zNLmjlmLmZWpzxc2L0lWZsFCyExMTVebNm7fus1BJkfPoJptX/7udxztuN80l6D8jOCZO2SL7IWpBqihG7TpjphnHkZZGVyDrx+23xzt2Mm/6XVfqUVtq6vROrYL8md3ZMcXmMKjuGDfqdQdHwWR8avmt/1n4xvqxSXHDmvoQ8gUODPIN2ohZjo3iWp1E+nwMFGDE9A6ib7l4f/4xf6ky3Znx00VjlCRc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199015)(86362001)(31696002)(36756003)(38100700002)(316002)(6512007)(26005)(31686004)(53546011)(6916009)(6506007)(6666004)(54906003)(2906002)(478600001)(83380400001)(8676002)(41300700001)(66946007)(66556008)(66476007)(4326008)(8936002)(6486002)(186003)(5660300002)(2616005)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjFzVWtOeHI1YkdNYmZrUDE4MnFtYnhBS0piN0FIOStTRzdLSXZkTFVmQitW?=
 =?utf-8?B?WmNZbjZDY2lQSG1uN2JoZ2xhcC9MN1dEUm5TbTl5dHNZOHdJci82enNBN3pk?=
 =?utf-8?B?ZkpHTW84aFdVUldyYkIwckRyaHZZdmtmRkJUbWhScERnNzBNMTJ5dkQxbzFV?=
 =?utf-8?B?bGRiZ2RLVkttU2crK01hQ21KQW5rZkF5aFhpYzMrenIyekZzRDRhc0VCdFNk?=
 =?utf-8?B?NFdUL0NSbk1oMTR5UUtYVTI5VHJLeXA3endRYnZlRVpIaE5tc3QrcWlDQXB3?=
 =?utf-8?B?aEVlTFlrcllyYkFMMG14bmFocHNCZGNGYmo4eGtrcWlub0xqWkpsRVZOdFM5?=
 =?utf-8?B?THNVZjZKUmtqNGFvbVYwb1pkSjFxM2gwaUhFVVdCT21wOEY2M2I5a0VRWTkv?=
 =?utf-8?B?ZHNzS0IrNnhnY0hTNXZVbXpIOEJUWFBEd2JFaHRjbTZocmFTcER4RU9jUE02?=
 =?utf-8?B?OE9CZmg0YWZiQUdZWkQyZnRpK0NCNU0va2dud3c2ek1XRzhqMHZLSXZ5cDNT?=
 =?utf-8?B?RzNLZHdqbi9jckF2WnlRbWlGVU5hL3NGZzZnSThmL0djUkVGNGtsTU42NHI1?=
 =?utf-8?B?S29iSmh6ZlVTcFI1Q0tLRWVIZmFjcWo1STgrUTdPSFZtald0NGFtNGwvOVIz?=
 =?utf-8?B?RzgvWk1BRlQ1TVN6eHZTVXdvb1l1Z25VMEE1OS81YUhDanlReEtxdXl4SlNx?=
 =?utf-8?B?cWV4ZWZsampDMzZ1VFRjekdSQ1B2cGsyUzhMYUlEdDNjbzNIWitnUmI1aHVT?=
 =?utf-8?B?bFFZRXE3aTFoalFmK3ZQdlJqL1pOSHB3WEVGZS9zbGp2MDFtcHdjenIrWk5o?=
 =?utf-8?B?NmZwdGJ1a2F0VFRwd1ZKcWZwY0VkRjFmTDQ0RllLNC9KTkdmaGpDTDB1WnNY?=
 =?utf-8?B?MEI2bFFLTnJFL3FtajhidkZaenkzSDF2V2YwUnhTNFplV2RnUHNlUms4UU1x?=
 =?utf-8?B?M2tQSVVyTThaSlEreXliQ1FQZzRjelJFYTJSUEFRbk13QlpaL00zMm9FSW9q?=
 =?utf-8?B?UjM3OHVyVUVOYnJFSUJBejE0bzhEQUNMdEswVUJING9EWC9zekJTeUpmSnFy?=
 =?utf-8?B?RmNDK0V1MTloQ2M5VTZsQVJNUE5Rbnlaa2hrSzB1R0UwZnluQ0VXN1pyRmI5?=
 =?utf-8?B?VTRsTWU1Nk9la1RLRnI5Ny96bEZDa3lkVENiMWh5T1hNSDR6LzZsVm1XYXoz?=
 =?utf-8?B?eTZrMTNTODl0c25MdHYwcG1VdXBtUkl4dndRRnhnck82Z1lUM2ttd0xlQjIr?=
 =?utf-8?B?bjJaTTIzVUxYeDRSOWwrZW1XMS9kZnBaZk5OVUlNSmVScTBXbEJrVjloQmxm?=
 =?utf-8?B?UlBPTXBMTlVKL1o4Q2RqbXJOR0p0MWlEcmwwbHltRHNydVVkdjU3ZCt6SjQx?=
 =?utf-8?B?MHlZVnJkTWQ5YWZQRE1yekJ3N1hteTlsZFBWdUlXaU1CMHFVaFRCbkVnYUVZ?=
 =?utf-8?B?TkFOMHQzMm4zSTllYUhjWVorM0E0d1hLOVB0UCtZREFPMFg3MWV0U1hrRDZ1?=
 =?utf-8?B?UlZXdmh1dGMzbklYbUxDVkF3b1ZnczUyUkN6M3Z6bURFbFFzMFdrbUYwVDhh?=
 =?utf-8?B?aXBqV0NWQks1V2lVWGlxRE9mYzQ3SGxYYVlDU2VPTkF6dEwwUVpFM3F4THFt?=
 =?utf-8?B?TFA5RmlndDFwRjBUTG90WDE0a1NTeVN3QW9lL2R5VXJ0bTY4ZUwzcVNYMUpu?=
 =?utf-8?B?VnVuakRoaTZEUTZiOEJ0MVM2Rmg4TytJKzVoZ25nS3E1ZGdOV2wwUmVlQ3RV?=
 =?utf-8?B?RnN2c0xXMmU5dWxFc1FaaThwcFVJYmNMLzBQTTdGblZQdUxKbjE2WTlNejhu?=
 =?utf-8?B?ZkxPay82bUNUSWxqYWw2akYzNEI3U242cGoyRVRJQVhOUTJVL1NjUnJyWWxC?=
 =?utf-8?B?TUw2WUo0MFhjQWxNUUExbmZidnZWcVpwWDhmaXJCT1EwbndPNUdDVWM0U1Aw?=
 =?utf-8?B?UkYwM2tka2FRRGh1RW9Gdms4WnF4eXdmZ0ljWGFRY2lub25oc3lnOXJMQnRk?=
 =?utf-8?B?dVpGV0JHRXROM21tVTBITzR1Tlp2d2VoWGVjdWFHOWNDeE5GcjF1MU54c3JF?=
 =?utf-8?B?KzVHSmxIQ3pQdGpFRDNKNDEwd2JoVlF0b3ZwYWc1cFdhMUxOeGNPYk1iYkxa?=
 =?utf-8?Q?givEqD47HbpOopxsWl6yKrfjr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c478340c-3dba-4d5a-e757-08dac8bed6ec
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 17:12:00.4349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSufEHd7MMnxcb+5/tN5SEebyk8ydaV7TlhfQZgUb+KSEv7248M/Cs/PCNtqpe7fc/KZU1gLIr+ypVQ9BQGfgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4883
Received-SPF: softfail client-ip=2a01:111:f400:7eab::609;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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


On 16/11/2022 20:36, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Thu, 3 Nov 2022 18:16:17 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> If vfio_migration_set_state() fails to set the device in the requested
>> state it tries to put it in a recover state. If setting the device in
>> the recover state fails as well, hw_error is triggered and the VM is
>> aborted.
>>
>> To improve user experience and avoid VM data loss, reset the device with
>> VFIO_RESET_DEVICE instead of aborting the VM.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   hw/vfio/migration.c | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index f8c3228314..e8068b9147 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -92,8 +92,18 @@ static int vfio_migration_set_state(VFIODevice *vbasedev,
>>
>>           mig_state->device_state = recover_state;
>>           if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>> -            hw_error("%s: Failed setting device in recover state, err: %s",
>> -                     vbasedev->name, strerror(errno));
>> +            error_report(
>> +                "%s: Failed setting device in recover state, err: %s. Resetting device",
>> +                         vbasedev->name, strerror(errno));
>> +
>> +            if (ioctl(vbasedev->fd, VFIO_DEVICE_RESET)) {
>> +                hw_error("%s: Failed resetting device, err: %s", vbasedev->name,
>> +                         strerror(errno));
>> +            }
>> +
>> +            migration->device_state = VFIO_DEVICE_STATE_RUNNING;
>> +
>> +            return -1;
>>           }
>>
>>           migration->device_state = recover_state;
> This addresses one of my comments on 12/ and should probably be rolled
> in there.

Not sure to which comment you refer to. Could you elaborate?

Thanks!

>    Thanks,
>
> Alex
>

