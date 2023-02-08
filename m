Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117F368F5D0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:41:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPoR2-0005Ui-Ue; Wed, 08 Feb 2023 12:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pPoR0-0005Tf-5Y; Wed, 08 Feb 2023 12:40:42 -0500
Received: from mail-dm6nam12on20616.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::616]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pPoQx-00064w-Kr; Wed, 08 Feb 2023 12:40:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d45W8VhQwpbVx/+QBRtqvy7qJcUYjnZ9S0iJdDBghfrX/pbuPOb7etfhKbBnt5IBZw4wAR3UZ9AGjFxLV1JMsZfZwhoCm57MTPEsUV8fWP8K6FxGelFYwORCDoGdpn14mB90vHTrVrxoWG0BaZsoKO3rzmKEDNud1Sd8mX5H+Vrrd6kTuPQnPyWSbkql7rERbWXZxQv8RiaK8jotbll1T25YTEVfLCNpnXpavO+1l21IeWBgizSU8s/hEXUBuG1Z/Ga2u1ob10AjjnWzUgFHKIHMeojtWBGS6IrPZ+utNJA0tDEsJty7Dn2XRAOirxn3Vzjjcj3ec4wLjAX4kwTnlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44y4eoCu9ASBYi2cfY7pCjVcFZn3rFQ2TP89A1N1+sQ=;
 b=JoUJggnqFPs/rTCH/yQYhTSf/SyAlSpQm/uS9zVqHeZQft8yg9C1O+ZP1xgdEPGWqBHxurcULJVYvdk7EYMd/w8I/MRTfv5CH1s2TG4GG5n5V8x4+hyNIwIue/aTQ50VrhIauVxkSLYRZzKBamUOadXwSNWPBOa40fAkF45JEyUqpIK6AnVvViujBMHZoTG2fqxZEt8AoFhk+1MhQbrJ83mHlJzIJZBi0CFN9UqWe0CX/7VHZlok+xpJYvB+k4eLsmgdsOsprK6YJx8ObGC1eBWYFyWsHQM3PwTPIc+K4kcLq+sRr3OD4VuTOeQzfiMjCQ9vyOk9nOq6IUK6Vk54Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44y4eoCu9ASBYi2cfY7pCjVcFZn3rFQ2TP89A1N1+sQ=;
 b=oSpdZWB3zw1Qy7Vog3SB/Wt7/4Zmf+7MF1B4jVT1y9hNAX6Y0MQEA79hVx5xVcoCmNiE1OPwoVQkLVA9916jRyWgcEGl//KY3R99RbKedmOjNGjRfXtu3dnKJoTJCWWTrqqYg1qRCMc49ssoxCJ8SxYCGykqZiuYDxlp/1Asikaz3YsuTo7UEnaDEJmqi5c79rrH2wfcm90w/V7aOwTl9PTZ/T1ZtFjzb83sJGmTh0yQXbtUSu8nCJqZwhuBNcFUvkKjWzLL/RTrAA5IhtzkS0PO5wx3VoLcyyxHFOu3H4SOOHG2yQYoual62/b2aSySxsVY12/Kx0zWa28bqGZAwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 17:40:31 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%5]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 17:40:31 +0000
Message-ID: <f8fe256c-fe95-f866-f70e-a065094835be@nvidia.com>
Date: Wed, 8 Feb 2023 19:40:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v9 14/14] docs/devel: Align VFIO migration docs to v2
 protocol
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
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
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
 <20230206123137.31149-15-avihaih@nvidia.com>
 <0ad070ed-3cb0-edcd-2f80-407344f8306e@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <0ad070ed-3cb0-edcd-2f80-407344f8306e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::10) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|MW4PR12MB5667:EE_
X-MS-Office365-Filtering-Correlation-Id: 63aea9e9-4c2f-4c12-b5e1-08db09fb933d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L8gF5/27TI4W5lvlq0ybFu1ospXW1eEV+iNzqMlm/Pt66xFQkrsRCdqzLtL/MvozADtJNLkBJ9bE5zjb9o6vdMeUlcBXlUA4dWADSytUnp6yWZsHGgK1hhRAFOpl5nwtTi5z88kP4guS8kDlIwH9OfDyDE/Zbj/hhw+4YWqZFO/pkWKpiCeSHPjvf/BKQjiR50u/0dtb8F6NhQiWsz+6dirsEndz+8ioXVN+DEKiNnLXZsVejtfZlEA0bdcle2Qz0dbnXWoX4oPJ7VBzgtAdSYBCJtkEp+xpISmKuUwCaVdFr+SvTcYTJKExLay8aDlAo+pBzFZtvBGAOYJ9mHQLojvoZ/pKzxew6GW+XqX2qqYlqC+KsZKsh3tickGYCFDTWitIubTTOGCLJM6dO2nvdTgz8eVRxn0htF4zuCf3NyjkJvwlVb9Qc9jAJJPjY/AoazcngaD+J4xptPGdFsgHBq2fI64b340rC3Vie/kLgvzM8xPmB2OCXdPAgX1AALD5guK96FKRVtbvwKP/syUqnm6lFX9NO9eQaErDRi/XEaqaHaSkRRX+o+U2Aqu8AmFJ7jUNczxsM4NLkl/5cwxvTXrdTukuntL3cPue0IeH9fELlSucGPEjX2J5B3St2ek5o/EAKAFSKlZkdUBsPIoGimcenObNYSpSSk7HTB8RjtLA2UNNBARwXmlozzUpfibZ2R66JKbfWvaYLKAyfJZLsc/VCgFp+L76B20P3H5U5JM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199018)(66476007)(4326008)(66946007)(8676002)(38100700002)(316002)(66556008)(66574015)(83380400001)(31696002)(54906003)(86362001)(5660300002)(7416002)(6486002)(31686004)(478600001)(6506007)(53546011)(2906002)(6512007)(26005)(186003)(36756003)(6666004)(41300700001)(8936002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3BOb2NjM2tSUDJMRVZ2T0MxajNHZFIxNnZPMnBOd2JpU0RSdFlDelIrSVdN?=
 =?utf-8?B?dnRrNmd3WG82YVY0SG9iNERCVGxoakRPU2k3Y0xLV3Y1Y2d4a094OXBXc2M0?=
 =?utf-8?B?Y3FMRXk2dUxta3E4V09EdHNiVTNKcG1Yc2s5MmE0cVJKaUhPbjk2cTJUL3Ba?=
 =?utf-8?B?VzBPN0U5S2ZQbkwrYnJuOEszSElEY3JHYXdYQ1VUcG5YNjZSNDBNdVF5dXpI?=
 =?utf-8?B?S1U0cVo4eCtOLzYrbVVYV3JieWoyS1dpYnJOc1ZIRFRtT1ZEUEUxNkw2Ykti?=
 =?utf-8?B?UFo2NFpRYkJIcjBQbVZWdWlwU0ZJUTRRY1pNaG1DOXphUko3NWJWeTV3YlZV?=
 =?utf-8?B?TTRodTZRbVpWeDNsUCtPa3Q1bGlmZVFPSzd3OWYwZTdtdVVWWXZLbDUwL0k1?=
 =?utf-8?B?MWdSK3FNclM0R0J1S0ErL0lFbnF6S3dFdFBLd0xuSnVQVm5WdXdLRGIxTVNI?=
 =?utf-8?B?b2hvVXE0QzVDa0pTRjBlT01YdEVpbXNoeVJOUldkZUdWSjcrQkZGUEZubnlz?=
 =?utf-8?B?OEs4UmtYcnY2ME1TT0twVlpCUkRyOEJHakZoRjBDYjNXZW9CZjhvVUVUYVly?=
 =?utf-8?B?WW1KSTlNMXZNL1pvYkFaaDNweHJPZ09wY1lzMUIvSVl2NGRHZ2VmbzZvL21V?=
 =?utf-8?B?RXM1Um5RRHI4ckI5UW9jWG9xeHN5NTEyOU9hcGh6Q0ZyU0FUWXVFNHdlcEVj?=
 =?utf-8?B?R2g0UkxVZDdJajVPWGRxUE9KOGkxaE5HbVZLcWtIL0Rua0xQaG5sNGRZNGxU?=
 =?utf-8?B?SVg2dHJMQ2JrUk1BZmlDRmJnL2hCbm1aK1NJQkxIZnpDMTZvczNaeFJDR3I5?=
 =?utf-8?B?VC9tbGZHRFRaUXdJVjRVOU9kSHBQTGpPZFZLVUx0WFNJMFZ2dmd1c0hsNzQr?=
 =?utf-8?B?b3ZhZVNEV1NmYzBNOWNtWWdCamk3Ujh6VXVkeUxZbWkzU2FUd0dSQnZ4dDVJ?=
 =?utf-8?B?ODh4QUNQdTBzVkZYNUpLNk5iMXRxSGxzcm5YQXZ4aFpBdCt2M05FQ2JyTTV0?=
 =?utf-8?B?TE5KZUFkVjdpRmUxT1FZMG9aOXlodXhMWSsrNm1IclQzcElyVVMwUmhOaTYx?=
 =?utf-8?B?ZU92aDJjOSs3UHVzZmN1OTFJYk1oYlNySVR6VW5xL2dmNXlRN2xmajQrUUtO?=
 =?utf-8?B?S0RUR3VLandDTXZjMzdnZ21IZ1hEOVFCQlRwak56dVd5N3RsZVZacGsvTVV3?=
 =?utf-8?B?d1d2S1FLenRsWEt2RG1MbFNpbkhXelJaT0M4eXpHdWhjVTRwenNPSUN5TkZv?=
 =?utf-8?B?dnVCRWFrUk8vaWhlQndCcUxMSU9Xelk0NkN6L3lpWnU1b1YzSUkwZkVVcVhs?=
 =?utf-8?B?Tmtndnl6UlpNOTR5UHpUTHpLR2F1cHdCYnRyZnZxaHR3ZGJzMi9UME9OQ1Vo?=
 =?utf-8?B?NmVsdkFraTM1TXVlSFdyV3VsNXdwVzhhd0FjNGNiME5ZdEhkbVF2WXROZEM0?=
 =?utf-8?B?cG1mREhHWEpsTm5OM0NQK1VTK3p2eGlneGE4Y3B1WFV2R3N2YlRxa1M0NmM3?=
 =?utf-8?B?QkFNdXlkNUsybmVGWFNIRnAxWHJxMkg1cjl3Y3hGQWxYdWt1K25yVEZ0R3hl?=
 =?utf-8?B?N1pQN3c0NnppZDdycEh4WTFqQUZpQ1JyTE9wWS9zb2Fab3IydlVZV1lCZjZv?=
 =?utf-8?B?eC9Qc2twcHR1WVJJYklaNnlpeXU3SDViUTE2S2Y4elhaOVVwVlMySW1uVDY3?=
 =?utf-8?B?U0QvQnBiVEJhZ2pDdU1PYzRHcGFKWDd3MjBqMDkwVlorTHVuQUpwL1BYNWFu?=
 =?utf-8?B?cjFTZVhxc21QSU9FcWd6SnRFZVh3aHhlTXdaeUQ1RmhVZXpFR3V6TWpUQnd5?=
 =?utf-8?B?YU5wU2pBU1I5bzBLQWNxcFJBTDYvWVViOVF0R0QwdVBmTzI1TGNvRHFEVkVZ?=
 =?utf-8?B?SHFRR1FxbzVIWXdxWTMrd0xWSVphejJybnJXLy9TT0M3Q3pFTjlUallwUGhq?=
 =?utf-8?B?NllZS1AvbC90L05qem1DWXBhdUVqREJXYTlMZ1JSZHNSN1N5SjFVenJTcUNy?=
 =?utf-8?B?VzYxSDAvMFJTQkw1NUhqaG9JcERuR1o0OG9rVnM0Y0VwUkU2WHNGT3JscGtV?=
 =?utf-8?B?VFZMTWpaUE90NW92UmJpYXNzYWVrNFpZWHdBUGFNYVlYUy9wVXZqT1dzL3d5?=
 =?utf-8?Q?BSLL1oN+pP/z/XpN21hqr79+p?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63aea9e9-4c2f-4c12-b5e1-08db09fb933d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 17:40:31.7136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rpK30UAeHnWpdUh+PdtqIt3XMujhuFZ/GXHCTgAdqBuefMqe6ku/qEXewyeyzoKwt4L4B4VvZBC2BSc+Tw5eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5667
Received-SPF: softfail client-ip=2a01:111:f400:fe59::616;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, SPF_HELO_PASS=-0.001,
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


On 08/02/2023 19:25, Cédric Le Goater wrote:
> External email: Use caution opening links or attachments
>
>
> On 2/6/23 13:31, Avihai Horon wrote:
>> Now that VFIO migration protocol v2 has been implemented and v1 protocol
>> has been removed, update the documentation according to v2 protocol.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>
> You will need a rebase for next version. The migration PR was merged 
> since.

Thanks for the heads up, will do.

>
>> ---
>>   docs/devel/vfio-migration.rst | 68 ++++++++++++++++-------------------
>>   1 file changed, 30 insertions(+), 38 deletions(-)
>>
>> diff --git a/docs/devel/vfio-migration.rst 
>> b/docs/devel/vfio-migration.rst
>> index 9ff6163c88..1d50c2fe5f 100644
>> --- a/docs/devel/vfio-migration.rst
>> +++ b/docs/devel/vfio-migration.rst
>> @@ -7,46 +7,39 @@ the guest is running on source host and restoring 
>> this saved state on the
>>   destination host. This document details how saving and restoring of 
>> VFIO
>>   devices is done in QEMU.
>>
>> -Migration of VFIO devices consists of two phases: the optional 
>> pre-copy phase,
>> -and the stop-and-copy phase. The pre-copy phase is iterative and 
>> allows to
>> -accommodate VFIO devices that have a large amount of data that needs 
>> to be
>> -transferred. The iterative pre-copy phase of migration allows for 
>> the guest to
>> -continue whilst the VFIO device state is transferred to the 
>> destination, this
>> -helps to reduce the total downtime of the VM. VFIO devices can 
>> choose to skip
>> -the pre-copy phase of migration by returning pending_bytes as zero 
>> during the
>> -pre-copy phase.
>> +Migration of VFIO devices currently consists of a single 
>> stop-and-copy phase.
>> +During the stop-and-copy phase the guest is stopped and the entire 
>> VFIO device
>> +data is transferred to the destination.
>> +
>> +The pre-copy phase of migration is currently not supported for VFIO 
>> devices.
>> +Support for VFIO pre-copy will be added later on.
>>
>>   A detailed description of the UAPI for VFIO device migration can be 
>> found in
>> -the comment for the ``vfio_device_migration_info`` structure in the 
>> header
>> -file linux-headers/linux/vfio.h.
>> +the comment for the ``vfio_device_mig_state`` structure in the 
>> header file
>> +linux-headers/linux/vfio.h.
>>
>>   VFIO implements the device hooks for the iterative approach as 
>> follows:
>>
>> -* A ``save_setup`` function that sets up the migration region and 
>> sets _SAVING
>> -  flag in the VFIO device state.
>> +* A ``save_setup`` function that sets up migration on the source.
>>
>> -* A ``load_setup`` function that sets up the migration region on the
>> -  destination and sets _RESUMING flag in the VFIO device state.
>> +* A ``load_setup`` function that sets the VFIO device on the 
>> destination in
>> +  _RESUMING state.
>>
>>   * A ``save_live_pending`` function that reads pending_bytes from 
>> the vendor
>>     driver, which indicates the amount of data that the vendor driver 
>> has yet to
>>     save for the VFIO device.
>>
>> -* A ``save_live_iterate`` function that reads the VFIO device's data 
>> from the
>> -  vendor driver through the migration region during iterative phase.
>> -
>>   * A ``save_state`` function to save the device config space if it 
>> is present.
>>
>> -* A ``save_live_complete_precopy`` function that resets _RUNNING 
>> flag from the
>> -  VFIO device state and iteratively copies the remaining data for 
>> the VFIO
>> -  device until the vendor driver indicates that no data remains 
>> (pending bytes
>> -  is zero).
>> +* A ``save_live_complete_precopy`` function that sets the VFIO 
>> device in
>> +  _STOP_COPY state and iteratively copies the data for the VFIO 
>> device until
>> +  the vendor driver indicates that no data remains.
>>
>>   * A ``load_state`` function that loads the config section and the data
>> -  sections that are generated by the save functions above
>> +  sections that are generated by the save functions above.
>>
>>   * ``cleanup`` functions for both save and load that perform any 
>> migration
>> -  related cleanup, including unmapping the migration region
>> +  related cleanup.
>>
>>
>>   The VFIO migration code uses a VM state change handler to change 
>> the VFIO
>> @@ -71,13 +64,13 @@ tracking can identify dirtied pages, but any page 
>> pinned by the vendor driver
>>   can also be written by the device. There is currently no device or 
>> IOMMU
>>   support for dirty page tracking in hardware.
>>
>> -By default, dirty pages are tracked when the device is in pre-copy 
>> as well as
>> -stop-and-copy phase. So, a page pinned by the vendor driver will be 
>> copied to
>> -the destination in both phases. Copying dirty pages in pre-copy 
>> phase helps
>> -QEMU to predict if it can achieve its downtime tolerances. If QEMU 
>> during
>> -pre-copy phase keeps finding dirty pages continuously, then it 
>> understands
>> -that even in stop-and-copy phase, it is likely to find dirty pages 
>> and can
>> -predict the downtime accordingly.
>> +By default, dirty pages are tracked during pre-copy as well as 
>> stop-and-copy
>> +phase. So, a page pinned by the vendor driver will be copied to the 
>> destination
>> +in both phases. Copying dirty pages in pre-copy phase helps QEMU to 
>> predict if
>> +it can achieve its downtime tolerances. If QEMU during pre-copy 
>> phase keeps
>> +finding dirty pages continuously, then it understands that even in 
>> stop-and-copy
>> +phase, it is likely to find dirty pages and can predict the downtime
>> +accordingly.
>>
>>   QEMU also provides a per device opt-out option 
>> ``pre-copy-dirty-page-tracking``
>>   which disables querying the dirty bitmap during pre-copy phase. If 
>> it is set to
>> @@ -111,23 +104,22 @@ Live migration save path
>>                                     |
>>                        migrate_init spawns migration_thread
>>                   Migration thread then calls each device's 
>> .save_setup()
>> -                    (RUNNING, _SETUP, _RUNNING|_SAVING)
>> +                       (RUNNING, _SETUP, _RUNNING)
>>                                     |
>> -                    (RUNNING, _ACTIVE, _RUNNING|_SAVING)
>> +                      (RUNNING, _ACTIVE, _RUNNING)
>>                If device is active, get pending_bytes by 
>> .save_live_pending()
>>             If total pending_bytes >= threshold_size, call 
>> .save_live_iterate()
>> -                  Data of VFIO device for pre-copy phase is copied
>>           Iterate till total pending bytes converge and are less than 
>> threshold
>>                                     |
>>     On migration completion, vCPU stops and calls 
>> .save_live_complete_precopy for
>> -   each active device. The VFIO device is then transitioned into 
>> _SAVING state
>> -                   (FINISH_MIGRATE, _DEVICE, _SAVING)
>> +  each active device. The VFIO device is then transitioned into 
>> _STOP_COPY state
>> +                  (FINISH_MIGRATE, _DEVICE, _STOP_COPY)
>>                                     |
>>        For the VFIO device, iterate in .save_live_complete_precopy until
>>                            pending data is 0
>> -                   (FINISH_MIGRATE, _DEVICE, _STOPPED)
>> +                   (FINISH_MIGRATE, _DEVICE, _STOP)
>>                                     |
>> -                 (FINISH_MIGRATE, _COMPLETED, _STOPPED)
>> +                 (FINISH_MIGRATE, _COMPLETED, _STOP)
>>                Migraton thread schedules cleanup bottom half and exits
>>
>>   Live migration resume path
>> @@ -136,7 +128,7 @@ Live migration resume path
>>   ::
>>
>>                 Incoming migration calls .load_setup for each device
>> -                       (RESTORE_VM, _ACTIVE, _STOPPED)
>> +                       (RESTORE_VM, _ACTIVE, _STOP)
>>                                    |
>>          For each device, .load_state is called for that device 
>> section data
>>                          (RESTORE_VM, _ACTIVE, _RESUMING)
>

