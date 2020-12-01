Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75682CAD71
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 21:36:36 +0100 (CET)
Received: from localhost ([::1]:57148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkCO3-0005LP-QG
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 15:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kkCGs-0005go-VA
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:29:11 -0500
Received: from mail-eopbgr40108.outbound.protection.outlook.com
 ([40.107.4.108]:59454 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kkCGo-0002Kz-9N
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:29:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDVIBbhFOJ0QIK3rwtHu46A3oDCHrrdl6ftiNX6WVqGxwFtZtaOH9tCos6G0Rx/7r97d40PWl4XQwxoTWxzN/TvWa0OzONz2bPsevLc6kwadZHX7aBI2a3YvC1gpXDe/QP3ooN5l1P5sZ16D4MRMd9ZK0fyOmeJWTZ5Udf3dL7apdA7eNVC4it30biDW90lJycoUGa+Dvd6ahYeXBgPaynipmIATyrphuD9ETdPxlbTwno82Kyhxvs5Lmqodxp1282tguy5TSVyKgUNoZ6oUk0WnY1DJWQ+gdaX/MvVnOgmmpsA9FqzEuszlbRF5H84pcpU1FeEY9EI2GmsGiG41Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jj1NASIX5JD1EmWLesxW9bkwPiFR/ofuBY/c0QW5S44=;
 b=BMvavkT7LtOEU5xq/dKu6diYv7ca7jd230N6JK3tl+NFQzqCbR+fO/6Z+5baqnl3zwCRgfUKQTBlhe4XjFDIm5sp4t/8uOxyFM7Yk/rt53CJNrx7coD52UsAIbbyYpC07d/2wwBPC3nvz+gdMIUbvk2EqVcDtI833wgdI/DwSXTXyvtoG0COs9Fwa/6Caw3S7gfaV79jheFa5y2lMFdayfuABIt90sRZ0gsHjJyo0EClaz4bG3stuiAmMwjbKhLnLcbz/efyEYMe36kF5eUut5OqUN5cq1Y4uTPc4gzDfKZgUBX13aK0fOGu6H7L9eYbyINcIY2cvSuvN+f3o9lkWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jj1NASIX5JD1EmWLesxW9bkwPiFR/ofuBY/c0QW5S44=;
 b=LQa/mVoMyzxqOJHb29goKMoa+PRxlL0WWTe47lpZueOeAwk3hSG+14iijx1ut3QAk+NILI2Gfnv/+wO2yGI5Ba03oOhF3qOHyej56Og0e0p24f4RjfUveyilLBqTQNV9Is+9VNGiOaKBcvn6nuJjd8EDdC7IFYEQDCFEn/YBCDE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB3184.eurprd08.prod.outlook.com
 (2603:10a6:803:41::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 1 Dec
 2020 20:29:03 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 20:29:02 +0000
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org,
 Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201201070820.GO105758@angien.pipo.sk>
 <f9c53596-912a-0b52-adfe-68afff8799dc@virtuozzo.com>
 <20201201105300.GQ105758@angien.pipo.sk>
 <d3b0c767-14d8-b7e7-345d-0314acb3d07e@virtuozzo.com>
 <20201201184055.GM4338@work-vm> <20201201192247.GF3277@xz-x1>
 <20201201200137.GQ4338@work-vm>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <5b7a5ad4-c722-3261-8784-97972d9923bd@virtuozzo.com>
Date: Tue, 1 Dec 2020 23:29:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201201200137.GQ4338@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR04CA0085.eurprd04.prod.outlook.com
 (2603:10a6:208:be::26) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR04CA0085.eurprd04.prod.outlook.com (2603:10a6:208:be::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 1 Dec 2020 20:29:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0992e997-1b0d-46a5-6752-08d89637bde6
X-MS-TrafficTypeDiagnostic: VI1PR08MB3184:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3184971C211E644AFBF617429FF40@VI1PR08MB3184.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zryN9yJRw9mRBBOUMZmW/OdIl1LPIoUh+OMsFQG3jDL7KdNmAGgc3Zw/7kkUAntuW+TTZ6ykbOozA+K+PZnfSuEFzpEqZdbjW7T+S18/cnQnnyJU+1WKgNGvKdNKTZLkoODCpKNNL4hjZSUhlSrzxbBnr7ckVNXS0RAJG42UPuN9XNz89YpEjCKv/cM6aNWs/6ztYsc2SOjYZTSk2ESPxg8HCwdG4HVaABErptIF1ywUPbttQm0KhPVWoEsvaBNnEPIgxO7CN2bJCzQWhUEN4Bbd6tp8BUxviwTBrM32vmlrX0TMKvXbZAWPRKSnFP0d6Udyfq8mRc8Uuyk1IEB7uysDsEp4b3PyiChJJb85y69JNWolE3GEe5+7hTmb959J
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(366004)(136003)(346002)(376002)(5660300002)(66946007)(8936002)(44832011)(478600001)(31696002)(2906002)(110136005)(54906003)(2616005)(956004)(31686004)(316002)(16576012)(36756003)(53546011)(86362001)(66556008)(66476007)(4326008)(8676002)(26005)(52116002)(186003)(6486002)(16526019)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YUswSXUvVGdFd3d3T2xiSy9NS3NmVGovL3dZSSt0TTNKN0Q1MXJDZFRuMzY3?=
 =?utf-8?B?N1NRMXhtMWZPeG1XVHBTajRqK2VyVlBKRHdkSFRzVUM4dzJxVDh5clJmQXlH?=
 =?utf-8?B?Mk9leTMrRkF5VmFzaXhYTXIzaUowbTRWcWhYZ1dCWlcxd3JYWk1Gdkw3SlVC?=
 =?utf-8?B?NjRSN2Q0WnVqV1VLTXZmTU9ZcHJ1aVhTTmlhU3RGS1VVMzNzVEZqVkJrYWNN?=
 =?utf-8?B?THhKd2NFWHpESVl1bGp5RlErcE0yWENVN2JaRU1ramRBaHRXTG9jbnE3UU5J?=
 =?utf-8?B?d3JHbGJQYkMxdkFRRllGSWhEVC9mbEtWSFUxTE1OVDhSL3JsR29ZNUdwQk9a?=
 =?utf-8?B?N0FydnJlUFBGZkJwYU9vMkRwSFVrWUlRWjVDVXlvZER6ZkNvTGxNZzJwZ1dM?=
 =?utf-8?B?NjM4empOVUQ1QkppbjlNN0NoZHNmVlZVb3FVdHI4aDY3YkR4TXlCVDVFaG10?=
 =?utf-8?B?bm5yZEsvREo1TGtmYXVGdW5sUk5IckhFbkprMlV6UUdrK3NJNjZzWitmakxm?=
 =?utf-8?B?SnQwNGdkMmNyYTJaMjMrK283UXdxZlhSd1BiTWRySXBNN2pNVkVXQ0h3Ukpo?=
 =?utf-8?B?dXN4Ly96YXFkZEhlbWEralFBK2FJbDUvMVVqK0tSMmY2cGJkQlBvQTVsV2Fu?=
 =?utf-8?B?T2xHMUdqNWZZaWU0OWgvU1RRSktydTVuUnlpaTgvUlVjTjNxRkpHWWF5bDZz?=
 =?utf-8?B?VlgwNU96Q0RkNFRnY0o3ai9wWTN6RHZnMkNFRVVMUSs5b2JXTnJBcGpHaWNw?=
 =?utf-8?B?OXBCK1ExOTRRSCs5NWlmMDArRHVRSVZ1THdDQzV1b1ViaGxJcWQySFFyaGpa?=
 =?utf-8?B?Q3FRQ1pqeDE1Y2xGQmI1TlRaTmY4WjByRG9rU3JwblFzdG43NnZ6OSs4WHJN?=
 =?utf-8?B?SDlLQTJYdGdvcVU2N0VsaFVLc0UrTklCY3loQ2IweWoxTFZYWXRaRmo1SFlv?=
 =?utf-8?B?S2hxRUZQY2JKWnFabjFjaXVOMWZIKzZJWlJ4RjdOQUNtNFFvU3VlWFlKNnI3?=
 =?utf-8?B?YmdENFZFdVUyVUVEUk9nM1pJWmFMQnk4NTBXRzFQN0JYK01RM2Z1cjlYdGtm?=
 =?utf-8?B?T2Q5N3RlZU1uU25JV0wrZjdYekx6ZDdvVXI3K1JLZG9DSG5yWEJrenJmRDQz?=
 =?utf-8?B?S1NiVDZCM0dSVGtDRXJYSmkwcXZDTGdIWjM2bm1ramxiclM0YzRxRXIyaDhm?=
 =?utf-8?B?M1FqMXdKTnd5MFFQMjlTd2ZtNTFaaHljdHBGcXZvY0VwR2VXdEtaMzNQZ3k3?=
 =?utf-8?B?RXdwSVRlUmRRYi9VN0VoTzF0WllKTnc0UTNpancwZHB6dnUydkJ4OEV2cDJp?=
 =?utf-8?Q?oV/Kln++2pyqLeP0kfw8RqiQWmsTs4a+oL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0992e997-1b0d-46a5-6752-08d89637bde6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 20:29:02.8345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/rdddq0bTMRIDK8fyyyFJXmNsrTmK06q4mdIMkrcv/1MTFOtg3Oaq/Y9jxHfIxiUcGYloYXcoJ4rQEEehTS0HhkY5FXZXbKPIoEZwl8G6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3184
Received-SPF: pass client-ip=40.107.4.108;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 01.12.2020 23:01, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
>> On Tue, Dec 01, 2020 at 06:40:55PM +0000, Dr. David Alan Gilbert wrote:
>>>> Yep, seems that current userfaultfd supports hugetlbfs and shared memory for
>>>> missing pages but not for wr-protected..
>>>
>>> For hugepages, you'd need kernel support - but also you'd want to make
>>> sure you write the whole hugepage at once.
>>
>> Or we can do similar things by splitting the huge pages just like when we
>> migrate.
>>
>> I should have overlooked these facts when I replied previusly - we do need the
>> same logic, but also special care on these special memory types.
>>
>>>
>>> For shared, there's a harder problem to ask; what happens if RAM is
>>> written by the other process - for postcopy, we get the other process
>>> to send us a userfaultfd that they have registered with their VM.
>>
>> Good point... so we should need similar things too.
>>
>> Looks like we'd better explicitly disable shmem/hugetlbfs for now from qemu
>> background snapshots before we have prepared these utilities, just in case it
>> got run on some "future" kernels and accidentally got enabled, so the snapshot
>> files could be corrupted ones.
>>
>> Is shmem used a lot in libvirt, or is it even a default configuration?
> 
> No, but it's used with vhost-user applications; like dpdk.
> 
> Dave
> 
>> -- 
>> Peter Xu
>>

Yep.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

