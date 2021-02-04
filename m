Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3164C31002A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 23:41:14 +0100 (CET)
Received: from localhost ([::1]:48358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7nJI-0007b8-PQ
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 17:41:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7nGQ-0006DZ-Az; Thu, 04 Feb 2021 17:38:14 -0500
Received: from mail-vi1eur05on2125.outbound.protection.outlook.com
 ([40.107.21.125]:1364 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7nGJ-00007n-VV; Thu, 04 Feb 2021 17:38:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5a6gOJkVd17xdwkKMBJalm68W9RrPQnCfrRaOXLgGrS+vBYVRCmcGu/ipRA+AimU0KBxExhesmzz6ACBqHM39A5ENv1v9VY1s0wOWIs90xNWzCfzhl92RxW33igc/04qL0eFh5aQfN4m5c1575yWARBkXzHBBL42FJwyUImIcrnbOd2D/UF3O6YBC6XK2v3EB2i3qnMTpXoaUukl0heFmkv6zL979jfKYHpoRr+4sVtqdAksoETrhnXpD3XmkynlWBY5fGM+5TTTRg0n1WbFSgJ9f0RuIZ2gZVPWJdObWKJlQ9MlYSJWVbufy9KgG2FILwZTTL1yoy/3NA92Neh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kA+VCjWtpb2+FT3aV1WlNODGx9E86z9PbzYsweLDmBk=;
 b=eOzBQ7Hawx7lnQACeqt16sjFBIWhLuBN/5e3mpfZ+FW/1HzQGYt52RSDIR99z66LaIrPOd7+zui2Nc1xHDhDzcwH5XvxcDhegWRS7lDQJFp3VnUTJevbMZG78/FnIoRJ4TrBa0MayBmC4kYtHi3AmNT11N2QdrxRBMuurmU7gX0SqjbpncppXm4NafPjLz448ZYgB8lDFiN6i3duLtH7a1G/I2KvGCZnzC4NAWVB9OUNJNSOpr/U4pCiv7p9gggW3+W98ylgIROOdbdbDvTm5IA0JZGzDel1BQG7fWQA2RzXancRbGQUKqoboLKNQ6+LcLlZevIkE9YQ27Epf2KkVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kA+VCjWtpb2+FT3aV1WlNODGx9E86z9PbzYsweLDmBk=;
 b=IJ+EmnpJ1wsaVxDqJr2W5FPGGJ7OfWKOoj3o0qb+AdtrbUWWZX56kxdIqAodNrCRruqjled92fCsfUSrg7uBT5mFzJCDmqkSEMtyN7rBk0Fyuk3SVdO3VGkbn2naZfD+5eCm/KU4Oo7tCZLgaWeBXcFprv5RwxlFvKGXt/jEBE8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6071.eurprd08.prod.outlook.com (2603:10a6:20b:29f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Thu, 4 Feb
 2021 22:38:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Thu, 4 Feb 2021
 22:38:02 +0000
Subject: Re: iotest 30 failing
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
References: <818b08af-3077-7003-63eb-614fa459d01c@redhat.com>
 <CAFEAcA9LJMS+qZRn9H97cnderDm8LRg7wyy+dgz3nXGLF_QQeA@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5c0ffc79-aabc-1b40-8758-9840845432bf@virtuozzo.com>
Date: Fri, 5 Feb 2021 01:38:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <CAFEAcA9LJMS+qZRn9H97cnderDm8LRg7wyy+dgz3nXGLF_QQeA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM0PR06CA0111.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.213) by
 AM0PR06CA0111.eurprd06.prod.outlook.com (2603:10a6:208:ab::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Thu, 4 Feb 2021 22:38:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ffb44ff-e400-46ad-6bb6-08d8c95d8811
X-MS-TrafficTypeDiagnostic: AS8PR08MB6071:
X-Microsoft-Antispam-PRVS: <AS8PR08MB607102194EE22C19F00C06EDC1B39@AS8PR08MB6071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IOjEf5WW5JCWjYy2er8/wohjf5dAP7VmWQ8wHGUskl262NnTxX3coaCc2YT6DLyYPZW8Ayf0OXI6vPBrMHC5jJknwx1UwdhLiLYdXHdCUBv+zudL+hZFzhh+mGERrUJGYSBplWAchmHPyi0v1OvqaWcHj6+/vIKAfaru86rC5NYQBpqyPifl2bWlRe/9xejqWBl3o7xKefveZhj0rxXudhpVyoOBp0fjuMuG+co0/aGZb7H6jU/hdn+ENUiBQEvOoM8PQjDFaO5jA/cKv8E92VbTNRgXVwjWTuQX7Ku+CcVjD++AdSX5SfKRHA8MD7rx2FpCkQN4QeMHuU4J90LebefmS074L/VUu/q3RR0NOlfWlU1CJ02G3LWxEk0ZVeju8gkq+wy3KmPGm/rwmrDlyV2c+HcOK71cq57uD5eGiPOAYuvKWOyb+NBuN7jemkxczLix+msl5XseiXtLq4FrXYLfADwgqF0ld36SQCJ9Djxw8aH4n1bZpVkg8UOnkz9bsMRQmQrvAD/7STO3nqyOPscOfRMP4dXtzRm2LUteVtetYU8LuFYWSPxID4LgRTm6EYDG2XYEhKa+it6eoqeUoFasLiRb3wqikrBE+vwMRiaTyI9lLgq5mfxpeWZN7wdZrS+q0DHMsHblEYZD4nv51VFVPkuOd/+HFlD51VXWC/SBD3ZkEZwc7T4F2ETrr6t2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(136003)(376002)(396003)(366004)(346002)(316002)(4744005)(36756003)(186003)(16576012)(31686004)(26005)(2616005)(4326008)(478600001)(6486002)(7116003)(66946007)(2906002)(54906003)(8676002)(66556008)(31696002)(966005)(52116002)(5660300002)(110136005)(956004)(8936002)(16526019)(66476007)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YndPUDFMN0Y5SFptN0FxTVlhVnJxU01vcXc3QkdBcW95c0duaURESmNDTnlY?=
 =?utf-8?B?MHFxWkI4aThvWklqZ3J5dHpkWVk0Q0ZvQWtCeDIrak02Vmk0MGRLY3V0NlRI?=
 =?utf-8?B?Z1FLbzBZY01IZEJlaktxMWkrUG5LZDhjU216TDloUU5HSVY3TnQ5UDhVR0JY?=
 =?utf-8?B?TGgrZjFueHN1QVMvd0RRUzRDVnE3anVBMHFWVkhzNDJ5UnVkY2tWMTVuWXp2?=
 =?utf-8?B?MWU1QXpTMnRlSDFhNUJhbzdnNE9WZnEzVG5md1ptZkZxcXVqNWIyWldnMWNp?=
 =?utf-8?B?aUpHZTJhdVBvbnA4NTFuaXVmWXdJVmlRZnZRYllZalpKejVpV3pQQ25mK1NS?=
 =?utf-8?B?OWdxS3RwSm5Sd3VyTk1GTytyeDl1SENZc25sSGNzRHdNcUZtYkE5dlNsSlUz?=
 =?utf-8?B?Y3RrbkI2Y3FBbTJaSVpLRzI3eXdZQ3VleEtxU3lHdWYyU0R6Tk1IZmRabVUr?=
 =?utf-8?B?eFNyN29rMXUrdy82U3BwcnlrWGdBTFhiK2dzbU9Gcm1DSkJ0cG9iUTRBOXNE?=
 =?utf-8?B?VjRGc2ZjRGtya3hYNUdZbUEwWkxvZHVFRW53QXN6Q3krQlRvZENuNElYR0VN?=
 =?utf-8?B?dlh0SG95cTZHa2orOWx5WVBObFhsWjRWL3Nscnp6RGpKOXVlQ2FOR1FNYkJy?=
 =?utf-8?B?MVp2SmVOcUQrWGhsY2VtNkVJN3RpT0FLd1V1a0VpSUdMNzFNNjkvTTZZTVhY?=
 =?utf-8?B?MmRIWDc2cmFIWG5GdFpXOTVTZGczdzlWelh5L1orYXFxc0djRCszTndyUUFi?=
 =?utf-8?B?aUdoL21LRXk2Tk9UeG90RG1RSkpxNmZYa3o2WFg2ZVRRbFBCdUpuN0lvd1NQ?=
 =?utf-8?B?QTdkWFkvWUx2anMxWWIyRVYwUCs3WUZ6S1F4c3VZangzMHhOZ1Rwd1J1b0tH?=
 =?utf-8?B?NHpoQUpSbmlXWjVnTENpWHV1RnkrdUtRODZ1ZkI0RC9FeUVPODdzUFdpM2NP?=
 =?utf-8?B?NTh3Vk0xYk4wc21HTVFFaUwwTzFGVFhMTnVtSlpEZ2VISkhLNDh6MUFuUXZQ?=
 =?utf-8?B?bkVXVTNJZEdtRjNCcFRNQlR5NUxEeUFaais4VXlkOUFOM3owRlJKSEN5Si91?=
 =?utf-8?B?S3A4S1pYYnlzTHRqcDZuUkhsZStGblpjVHExdXdNOWMxZytRRU5EaU1sSDlH?=
 =?utf-8?B?M3ZHbW02U1Voc09OQ0JIK3VGNFhqN3pLTExQb2JpSEJJMnAzSGxSYWZtaVp3?=
 =?utf-8?B?aEc2NzlnYkJ3VWpISTN1T2Q5ZkVacEc4K05JcXU5ZFA0MkJPdkIxSGFoR1hS?=
 =?utf-8?B?eVBUbnJMc2ROb0k1bGwvdEVKM0MySmdQaERaUE8xWGJ0MmhHUWcwT3B2bnVl?=
 =?utf-8?B?TjVyYTFqQkppcVdEZGJndStrZ0gzRFBXazEyU1BHNEN4bmg0cDBqUGhISlpy?=
 =?utf-8?B?Q3lQYmZTbzJqNktWdTZoTHM0OURPT2hrNFVVMkg1L0hCcGt0RnM2YWdnK21S?=
 =?utf-8?B?YmFsTDl6OGxFb2xyM3VtNDhuQm9nZDNhVUxVSWpCYm5YdEwzZ0hoeEJYTFFi?=
 =?utf-8?B?UGwxbTEzWlcwckRFSVlwQzdNaVZNK2MwajNGWFRKbis5VlZKRkNFZ2gvUVhx?=
 =?utf-8?B?dmZ5dGd3SjR6MTlVcGpJV0IvcnV6eXA3OEg5ZWlQM0tFMTUreE5VZThzOEsx?=
 =?utf-8?B?eGo2L0NLZ0J5QUJoTWdJako5RDhZSG5KZW0vQjdpaWpzai9TdWg2QkJwTTJP?=
 =?utf-8?B?empNUENkUGtLNnYzZ1hoVldjWk1RT3BCTlQ3MnBYbG9FbVFPM2hxcjdIZHZW?=
 =?utf-8?Q?8GVcV//WIwoetRL9QbfrQWl/RQBnVk2zIccWroZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ffb44ff-e400-46ad-6bb6-08d8c95d8811
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 22:38:02.6970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LZtUJNALS3Wpgd/jCsOyfMrhdQo7KB7TGBHYe4/K7fdjwXipWr+8MqbNv10ZEEXdv2mTnm0YdfJhvBL1I8s6TchMuCzSZJcGx/ElsgNZkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6071
Received-SPF: pass client-ip=40.107.21.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7,
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

04.02.2021 20:51, Peter Maydell wrote:
> On Thu, 4 Feb 2021 at 17:48, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Hi,
>>
>> Based on commit 1ed9228f63e (ericb/tags/pull-nbd-2021-02-02-v2)
>> I got:
>>
>>    TEST   iotest-qcow2: 030 [fail]
> 
> Yes; see also this thread:
> https://lore.kernel.org/qemu-devel/9e71568c-ce4a-f844-fbd3-a4a59f850d74@redhat.com/
> 
> Can somebody write a simple patch to disable the test entirely,
> please? It's too unreliable to be in our CI set.
> 

I can..

Still, maybe I'll try tomorrow to make v2 from my "[PATCH RFC 0/5] Fix accidental crash in iotest 30"?

It would be very interesting will it fail after that fix. My experiments shows that my patches helps. But the question is do we really have the same crash in all these reports or not. So I think it worth taking my fix (even being incomplete solution) to understand do we ignore some unknown bug.

-- 
Best regards,
Vladimir

