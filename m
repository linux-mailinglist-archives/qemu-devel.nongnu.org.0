Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0914532D33
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:20:56 +0200 (CEST)
Received: from localhost ([::1]:44186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWL8-0001Hs-Mm
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ntWHJ-0007CM-RU
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:16:58 -0400
Received: from mail-sn1anam02on2071.outbound.protection.outlook.com
 ([40.107.96.71]:57313 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ntWHG-00011k-Re
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:16:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/MmhwLgmGNnwBIbdC80E36clfG8eOK6sd7RAO3JmP444hSdqGrqudtrFVKsNrrRlB5iGQgSPPBTSxnxF15OBtJK8bf97FOY74xPEP9bJRi8y2R2K3T9Y+yc9HDSauatXIiXsp4AdACf5oHKd/7019W/WkquCOuYurK77E6ZmWBot2J4HUjpDGrcxg8pTqU7E+FrB0wS5gVDeWasKAvr9tEtR4/7AolGd+BIMY1P5uZRzaYy0/yDnfU8NaLvhlXgZZHx393mIUqGEEq2743Qhp9OKGieDmRAIaEGzk+UXkFRTgWElNYaxE+CVQmPujyR20FC/77ghYpe6eMPfxn06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0xgHQvjc1XGjAtdo3SmWhdQ8LmifK2fD+6TR83cq3w=;
 b=KuBXAT2IS6B2UNsU0oFnoDKeN7dMBko2v+qd8HS76cXMoGqhi1FQ+SycFhT2cAyfP19U4H4WwgcJqXX7LEbridxruiGtMx0FkOCJbzSJQDQSBy3r2YqHu/4ho2UmavpF5vK4uWrpIcfkA8QAN5Xursevi9xWFipQd2JG7Yc1PbPDcJ7yiwwrvXwXLCKN6xbarZ5B+L09DtKZ5iMoaJL0DhyuCD93smjIwKStSvE5l/kIkN1RG0iGmr5NMsmsjKcwl+6NJEEk7J2qhiQ6ir0YaIcyjcACfhMS08upgiCMHTeb3JPiwOc+EeeQfoEGC8YOqto/XunxYzoHNiXQbALRxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0xgHQvjc1XGjAtdo3SmWhdQ8LmifK2fD+6TR83cq3w=;
 b=EFZEkOOUNg8hpRn5mXt6YjKNS2tj0sNbuhftKMzqG2TJYeuOSXAIaKh01Hm4n3wSANcAG0ur0MqUsJ+KBU1F+e5c9vJ7CnCz7lvlVTASStgSeomL3hvBdZeXxdyS18pt68PD5dB47iSCN/nzy3ZNFVQ6ekTZsFdxH4u+tfOGF3l3hdnkBfQQ79ryGljFpVphySIkO0xrJAxiBS591IydyyILw8L0vUOFg9+EvUxu4sL2rbhzlJ4gwnQFa77y658u8FKxb1dX/bE9hoQXlRM5avfiUCAcwd+rWbPCchBLtOfiWHbw4ax3wuOQJdUJ9rQWEVcXACeZ/vX1AtTWZPVCnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by CH2PR12MB4245.namprd12.prod.outlook.com (2603:10b6:610:af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 15:11:48 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::d4a3:9322:f9f4:391d]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::d4a3:9322:f9f4:391d%6]) with mapi id 15.20.5293.013; Tue, 24 May 2022
 15:11:48 +0000
Message-ID: <ae478792-11cc-cb00-2294-d0ecdf596dda@nvidia.com>
Date: Tue, 24 May 2022 18:11:40 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 4/9] vfio/migration: Skip pre-copy if dirty page tracking
 is not supported
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Juan Quintela <quintela@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-5-avihaih@nvidia.com> <87h75psowp.fsf@secure.mitica>
 <20220516142200.57003872.alex.williamson@redhat.com>
 <20220516230832.GP1343366@nvidia.com>
 <20220517100045.27a696c9.alex.williamson@redhat.com>
 <20220517160844.GV1343366@nvidia.com> <87ilq3f4ss.fsf@secure.mitica>
 <20220518155039.GL1343366@nvidia.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20220518155039.GL1343366@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0184.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::28) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 772d2995-ca63-4ef5-4e7d-08da3d97b917
X-MS-TrafficTypeDiagnostic: CH2PR12MB4245:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4245F4CA8173F25A9F13748ADED79@CH2PR12MB4245.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uaFs3srniyBhcyRaSPIj0szi0pUrBszo3m7OFIon6LC0oY34RerhcdMQ9kT8LvfhfYdCy/DENmQr7ViklowIA0kKNMwKVCvc2zzCXb72ufK+sRlHXlV6Z2Bj3tebWUbRab0Ny/IFyarA308E/rb3wehpgfuIi15YEP8wkNgaIxVYC2YTMq5LOrv5I7XKwI2804zD8jkSVOnm8rBqAmvrzVPyf8/iOmF+iK55KTNrVmcZ2Egg66h81c80pYEMwar5qEcpOGviQA3G0N6ZPb1e0+T7V/MrGDoiOXk67v46fQwkSj/gg9EhnqQXAjU/mM40h5xYjpLacqwTr7MPsb5LsBSGXWpUGRno4EryhLvjU3TfvB8pUvlp0+x1RyyLErWzrV3UV8qy0n7fm6tOrXnpuStCMZjLq1h4q0GYXhzVvNVg1pQsuGZzEmpOJ4zUTvu4h4jkXefBKwSAPUCjlQ1tZvleQaSyco+Sus6mpkeu0sKh79PBGuaXS4RRG+PgztMNr0JQ780P3jUEeHQW7ijvqegdWHrrMMFpNwQezrvM4napkqJFkxA612EJ5svtQH2XmhMh9pArNiWq7SDAhScSVL1D2moJlHztIGBkH9uluWkI+BaIvXRTdz42Z1i7UFdLNzeFoW425VDxVWkz0zsoyllEohimy7TnzpkF3Sbu4xcs1h9aDhMxhuITALXGU+mH+oHV09gPArQUnMWgUZrpukqptWStTmPH26lb+yXIUowK9finbwi6cK6DJs6+HnBk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(36756003)(107886003)(2616005)(31686004)(38100700002)(2906002)(66556008)(186003)(508600001)(6486002)(110136005)(316002)(83380400001)(53546011)(54906003)(8676002)(6506007)(31696002)(6666004)(6512007)(8936002)(26005)(86362001)(66946007)(66476007)(4326008)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmhGS3pvMFB5VTljWURFL2Q0b3ZYZFpndjZNOVpoS21LVHF1Vlk0TVBxamNN?=
 =?utf-8?B?MW1kcmtlc2prTFBvSlBJMHVoeWhHckk4clQvRk1FSFQvRDA3aGVXOGJpbitt?=
 =?utf-8?B?ZUcwSW5BalNXWWw5MkljeWFOeEs5OUxmMEp2dndCd0FpZG9SbysvQWlQOFpa?=
 =?utf-8?B?MDU5aWJiTEZuN25uQXBkS2U2SEt3eElRTlEyQ1V5dStLcTNrVFJucmRJQjU2?=
 =?utf-8?B?bm5DSHNkdlJaZmFmbmZNcTYxVW1ERUROd1JyWXVkY3RlYTlVZFl1UkZZZnBq?=
 =?utf-8?B?c205d2FIbnR1V2JrUW9hQXNOZWM4a25zbGZrd1ZnZXRWdHVnTm5xVUs4UXdQ?=
 =?utf-8?B?SlplazJDUVpyK0VpZ3pWd0RiMUovY3M0djZWVVJjb3gvSWVLZ09ZSURrVEY5?=
 =?utf-8?B?bUJBNGNBaTN1Qk5wSVppbGZES3pYeE1Tb0lTbkFFNHhuWmoxcHBLazNEb0NK?=
 =?utf-8?B?QzYwK1RjLzhXb0Z4TUxPZ2xjSVF3aWsvTlBjQlMwbW9yb0wrd0FubjZtemdX?=
 =?utf-8?B?eHpxVXBrNmI4SllycExIaXdYMmtGM2UwUExJRWRyUUVnTDh1T24zTUJaNk9x?=
 =?utf-8?B?RXVvcFpsZC9yTzZaQTZRVTRpT0lFWWQrSXlGdEt3NzlGdXI0UHBGUWRPdWFV?=
 =?utf-8?B?UStvSFN2cFZWQngyaU1neXd0TU5PSm1zZmVndGVvT245bUpYcUF0QkJ6Q0Rh?=
 =?utf-8?B?WHNtNWQ1R2FLSXo0YnV4cXRuWG9BdzN1dDlGZkx6VHNFZjArN3o2K29VYTZo?=
 =?utf-8?B?VXU5ckZJTVk0cGh4S1ZHT2Y0Qk54Z0dLdk44MjhHa0dheXhvM25nOXNZOUV4?=
 =?utf-8?B?MzZxOHRzTWYwRmJ4TFBGRHZRMlNtRGtUN3ptcjhEVEVjZ0xSYVRzcUFtZSsw?=
 =?utf-8?B?WkxWbldnUERkSitZa1ZNMm1RMjZzWHJ6ZEhaeWR2b3pZTE1DT2JORS91QWtq?=
 =?utf-8?B?VEtKRW1vSUc0K0RvTmxMRGZ6WkRibW9aVHZwY0tnZDQ1UVZXcGJQNmY0cXRC?=
 =?utf-8?B?aHdIdEcvOVdJM0ozZjJvZS81aGFGYWJPbXJQME5OR1kwVXc0NmhRN3dyT1JF?=
 =?utf-8?B?dm8wOXRYb0gyMk4yVC9oM01YaGhWUlZJaUpSRjg4QzQ1L1pIZUhFMXh4a09w?=
 =?utf-8?B?WUxTb2gxVm0xTzNQL1Y5aTd2MEVQWFFYL2pRUTdjSU5iZThtM09KTDdVNVpn?=
 =?utf-8?B?aDNSWFRTRU1HN0xrMktkdUJublRCcEJNTEY4b1Q5WVJ4eWVXbUJ0aUFhcDFJ?=
 =?utf-8?B?dkVCZTN5cXV4bW1wOWRTOWxjcEViV08vSmVkZHpNT0FYMldJeHhreG1WUi9C?=
 =?utf-8?B?QmlYUW9ZSHBMMXV4TEtZRENpQWVzOVZmVWUrbWtHWlp3MGh0dzUwWmMwRGE0?=
 =?utf-8?B?ZlE5VzlDSU93WEVKYzFNWEExdUdtVGNlQ2JVUE8vcDJENjBwSTFjUW5aZWh6?=
 =?utf-8?B?WVpwaGRCKzBlL1dHS0Y3MTdoZGxNdzFDZ1BlcnRzK21zVjlib1NxUDJzTVpl?=
 =?utf-8?B?Vm12RkM1djhHcFRiN280QlF5c1dSR3BVdUVmdTh5b01xWmpRZ2FnbkFSY3Vr?=
 =?utf-8?B?YVBxWGRsbGZDc3k4VUprQmI0aHBBQzY3RWdrM212MTd2NjFMUThiUUJ5Tk1B?=
 =?utf-8?B?SmhNWU5UcEVzbHk0WVVGTmUwZUtIY1BodEVQZm1MTWVLTkRMcWVqVVZDSGxp?=
 =?utf-8?B?UU9vR1BGck5MdjkvaGswU0xaYWhrSlUxQk5LSldVZ2o4S2xMaE1oeGZPTUtB?=
 =?utf-8?B?aUhCWndUYkFBb2VRZzhkc3BQQURJWnBKUm9qcXpuNVY2Q2lWVHBZVFVVMDBu?=
 =?utf-8?B?c0hGNTREeHRiWUJQN1YrdWpXdEZpUVRjWjBsU3phU3owc1hDT1BsL09OODU1?=
 =?utf-8?B?N05zczExaEdJM3ZnZDk5TzNPZVVpUlRuR2J3eFY5VGRTNXFQckxESHlxdndX?=
 =?utf-8?B?Q1lPcG1oRDRqakZBalViS0JsZENZcjZoc3EwdVFLSWgvUFhQUS9VVFYwOEJQ?=
 =?utf-8?B?SExKZGRMcFdBbVBXaUJJWlUrZFJPTGJnNVJRZUFEeUx5eVJENjNCS0VvM1Vs?=
 =?utf-8?B?SXdweTVPNTlBUlpCL3VER0g3aTRvRVBEbFlZRTFvMWE1R2pJQURWb3psR2RG?=
 =?utf-8?B?YTRMcGM2REFNbFFiTm1ITVVWM3hzaTBCV1ZBbVpkVU01KzNvVGxRajk1aUpk?=
 =?utf-8?B?VmROQi9taUNmdkZpK3VIb1VCKzdPdVB1QUl6ZGVOSmIveXFBMDdHcWV3OEMz?=
 =?utf-8?B?d2lwekRIdjloMVdsa0dxZVR5d0lJVWhSa1ZPOHJhdGpkZUxjOU9qYkMrTnV3?=
 =?utf-8?B?dlM2Qk5WRStpYTQrbyswcktXUCtnU2NGdXJHd2UxOHpOMkoreVVwQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772d2995-ca63-4ef5-4e7d-08da3d97b917
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:11:48.3501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gOdI9tCx+ZndrGAdd0T+0eTvVrKa0arGitdfOJfG4Bng+J20fMr4wI4stnP9uARAVmjod0vsUGhF6aH6Wmc3GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4245
Received-SPF: softfail client-ip=40.107.96.71; envelope-from=avihaih@nvidia.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


On 5/18/2022 6:50 PM, Jason Gunthorpe wrote:
> On Wed, May 18, 2022 at 01:39:31PM +0200, Juan Quintela wrote:
>
>>> That does seem like a defect in this patch, any SLA constraints should
>>> still all be checked under the assumption all ram is dirty.
>> And how are we going to:
>> - detect the network link speed
>> - to be sure that we are inside downtime limit
>>
>> I think that it is not possible, so basically we are skiping the precopy
>> stage and praying that the other bits are going to be ok.
> Like I keep saying, this is not a real use case, we expect dirty
> tracking to be available in any real configuration. This is just
> trying to make qemu work in some reasonable way if dirty tracking is
> not available but a VFIO migration device is plugged in.
>
> Just pick something simple that makes sense. Like if any SLA is set
> then just refuse to even start. If no SLA then go directly to
> STOP_COPY.

I tried to follow Jason's suggestion to check if there is any SLA and 
block migration, or no SLA at all and allow migration.

It doesn't seem like there is a way to say "no SLA at all".

Migration param downtime_limit takes values between 0 and 2000 seconds.

What does downtime_limit=0 mean?

If it's 0 then MigrationState->threshold_size = 0, so ram_save_pending() 
will never call migration_bitmap_sync_precopy(). Only upon entering 
stop-copy phase will migration_bitmap_sync_precopy() be called, which 
will collect all pages that were dirtied during pre-copy, which could be 
a lot and impact downtime.

In libvirt it seems that downtime_limit = 0 is not valid and can't be set.

Am I missing something here? Is there a way to allow unlimited downtime?


Thanks.



