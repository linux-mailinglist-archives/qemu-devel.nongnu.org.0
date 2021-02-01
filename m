Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BB330ADAC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 18:24:11 +0100 (CET)
Received: from localhost ([::1]:51106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6cvq-0007vN-Vk
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 12:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6cgn-00016C-P7; Mon, 01 Feb 2021 12:08:37 -0500
Received: from mail-am6eur05on2108.outbound.protection.outlook.com
 ([40.107.22.108]:20704 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6cgj-0004FN-PD; Mon, 01 Feb 2021 12:08:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7+u629LngsUXT1T34hq6g2RwA7kfXUYLzcqxq8Pyt8eay8Q09ypeg/TjKBbs7NyKFAhV6hR8IuDoXOIjuCydBz/2TtA6Wa28oluVaiajbYrtJHly+HBRJLZqKXNI8rfxFy5pEl/AJEH5T93fTepX5MJItrhWZUnwsb2195tCY8kYjt9YNT0x5ApILHHUl+fiKDM7OTxGc3CYo2bf5EkqD9TPKj6ER/RHS4t6xtD2hc5pGo5ZOEm0hYx6c/bT5YRiR579Cfe0JHqpZUE+oS0Lg7mTqcpKi3CLK+eKsDDbzXre4p7JlzZLZKDM57PTA+tm2BfsYW+B5jBCgWPzQKEoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfObp78G0pIqsL8DyqpXh4mmptmfKbEeOxsEcTnCVSQ=;
 b=cOhnLp4wlCeSk4o5wnt5+5siVPEokrUVUwwZZt7Pi13ifHL/DDUyxly1F/MLnp6p7x3VApqAqbEygkaXb8GFB0oyAFijSzXVje8GGpEaSsk4X32Dq3k0uiyQsuyr82om/67aiwLA+gVb9qto0rubkYki9kXbRMPMIqgWYF7QyfB5vU0Gx8Aph1SOzIV5G+LVFjVTfNyovRY8i37xGcmz+gbTQXGmd3+nZMSXyjNzaL0VU7mCW3HANscy89R4u7oB33NzOxVAlrSSwKPTxLQOdcOCqKPxpL7m5ypQt8CHKlO14xroE2NfAMU8+yTTNrHvrpf9xdzEyA0OHzWbK0pGOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfObp78G0pIqsL8DyqpXh4mmptmfKbEeOxsEcTnCVSQ=;
 b=GJVdDP1HmdDb8mu1X2MLZjSIz+8XV5W9HNiyptUApZcSrQSdeFDnym8LbYRQ7LK7Qplwmv2LrR60k9O23DzzeEFAjvIFmjViF7jIhXGN/HEkMC4iZhqMZQja4/dKsd9X9U1Tgu9il6CDXh/ZoiZgZgmu8TEMzuAgfPFxjg9+aKo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4536.eurprd08.prod.outlook.com (2603:10a6:20b:bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Mon, 1 Feb
 2021 17:08:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 1 Feb 2021
 17:08:30 +0000
Subject: Re: [PATCH] MAINTAINERS: suggest myself as co-maintainer for Block
 Jobs
To: Kevin Wolf <kwolf@redhat.com>
References: <20210128144144.27617-1-vsementsov@virtuozzo.com>
 <878s8d85dz.fsf@dusky.pond.sub.org>
 <2651677f-aa5e-1937-0fb6-767c080fccdc@redhat.com>
 <094df33d-f944-7a68-c0b4-a7c509287a6b@virtuozzo.com>
 <20210201145056.GD13157@merkur.fritz.box>
 <304b3b7c-a58e-901d-7f52-b6efb1c1fbfe@virtuozzo.com>
 <20210201165823.GJ13157@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c111e300-8732-77ca-7f5a-8d084f2cd75c@virtuozzo.com>
Date: Mon, 1 Feb 2021 20:08:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210201165823.GJ13157@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.160]
X-ClientProxiedBy: AM4PR05CA0007.eurprd05.prod.outlook.com (2603:10a6:205::20)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.160) by
 AM4PR05CA0007.eurprd05.prod.outlook.com (2603:10a6:205::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Mon, 1 Feb 2021 17:08:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9cd30b9-6bc8-4e0c-e216-08d8c6d3ff67
X-MS-TrafficTypeDiagnostic: AM6PR08MB4536:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4536AA14044CE39FE6E376F9C1B69@AM6PR08MB4536.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yL//4skhjG+DWYGZO3xOdPGCTpIN/+B1aZeh8nJ4tOo1Vfa1yHaeZvmm040KoB5CXPHmtXlVpvDPM/Uva2XzPOxmfHRUNdtRChLki/l/AQPwplEECsBkt+XQX+0QiqRxsxmyExJlW0FKP1sOovL/N8ON5Lfqkm3BBvw7/oh9AHh1aCHqpgbDVtUAEChLbwVryxcKQ3KpIeqV2HWm6Lb7QUrhmqsKA9oFuXZwiKFjP2CU6ouNdpknuZAuKxFgKYsTSTjGAluktnKoyJY2GCxG4CayzQYi+/YGvSE6h6AB4JmOXvsld9ESZBv1GwOuXEQKWgr6lhR8PSrSndNOeN5hMplzrsHl+1qXt6HFMkfZC6VfxWdbZUqA4pSsH0vnVaII1UquICeon67Px98IWJGf8l72oaAR7diSvbFGTDyJ2iMmOWCz/e0/+Dkpr6ABjB1YMghQYfJousVsSkE3beU2lIF0PQgPvDgXO2v907XRywc6EwYpWi+U2LrK18IP9dh9fbdyDhx3HVG41SUoJcosBL8qBaE+5ywnJKwpAjlnAZY1OedX2WOZdgMAAc1rOUc2E8oPgZaaMBc0Vf/y3OTvEPjfXGkBYH5I6pPVzGupD5BQKaVYd173spmM6DchlQc6EjJFpFWCnDkDY02GkO+YLx35ecrqaNrX8PO4Doykn4oLSKXqY/Twqr3i3LZxVuTV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(498600001)(2616005)(31696002)(6486002)(16576012)(186003)(16526019)(26005)(36756003)(54906003)(83380400001)(2906002)(966005)(31686004)(86362001)(8676002)(66946007)(66556008)(8936002)(66476007)(5660300002)(52116002)(4326008)(53546011)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RTV5bjd5YmNKZUJhSUYweFdFZlNZUVVJbE1QRFFjWlY2TjEyaEJRWmNFeXV6?=
 =?utf-8?B?RkwyU2t5aVFWRG1oMzdnTVlLUWNGb05zeFVEbmJZaXEwSWJmelAvSzBPcTJZ?=
 =?utf-8?B?SkZXQkhzT1VqQWJwbHZTN2NpRGRjQ3VQQXRvT0xMSTlHVTB0dlFTK2FKd0lx?=
 =?utf-8?B?eXRsZm9NR2lvWml2SnRud3doeXE2VkxvaFd2MmhkN3pxcEV0UEVzRys5ZmtI?=
 =?utf-8?B?dDEvcXlzUzA4ZFVuVEdyVzNjTWdyV0o4NlJ5aTB0UnhUQnpLNjNMN2xRVSt0?=
 =?utf-8?B?M2tWakxOTnM2RzRoM2J4dzUyblA4SEgxQktkQnEwT1JiOFh2NnRSUWFCcWoz?=
 =?utf-8?B?OHkrVHIzcVVsMTNKbDZtT3lPdk1JUmo1VGtlczZIaWZNS0JEMXJKelFGM0lj?=
 =?utf-8?B?bVd6L2JiUzdWb2VNRUZXV0RKczBJeGlqSW1vZnl6SHBqN0tJNGR1UURtL2Rw?=
 =?utf-8?B?aElEY2lQOUZqVDNyaGVhUkhCQ05kOGlPUFpQSTJmYkd2OE1lWnZDYUdzN1F4?=
 =?utf-8?B?TGJLZEdtVjltNzg3c092S2hFODB4di9JQ2hJVmdHcHRyL2x5cDRhckxHQkxP?=
 =?utf-8?B?YUMzZVI0cnVrMDhIeWVvTjludTZJRGVTcEVINUo3NjIzcFZ0Z05CRXBCMTFU?=
 =?utf-8?B?bnFLSXBlaGZDNUtnMnF6WTFjSWcwNFVpeDFjOWJoMEE5Y2duL0NhWTVOcVU2?=
 =?utf-8?B?NzJoRTlMU05OTlBEeE8rMU1RKzVSeGMxOHc4TU1kMUhKbmVGbC9ZUkxEWDVG?=
 =?utf-8?B?emI3NEpuNEZ2cFAxanNueGhiTXZDeGJDSHV3WGdVN2tBMGluZWNXRzg5ZXJo?=
 =?utf-8?B?c2hrSEFiZGx2cStHMzcrYzRjVUNISXhzK1RVY3VEU3pQNUpqNjhOck0xYlEz?=
 =?utf-8?B?ek16d2NMR2pWS2crd1ZYQkFkYy9OTFdJOXlPYkJPc0JCeXpYWTZNM2NJRXgw?=
 =?utf-8?B?dnUyMUlYckxOUEk4OVA4UzhUcW9INnF6Nk11a3oweHlBM1dMbDg5OFY4WGpa?=
 =?utf-8?B?azBhVXhTRjJPOGVZOTRXM0hITXNiY2xOd3ZpSGRrSGkxWmdsbjdDSDYyMWVR?=
 =?utf-8?B?VnNLbTJ0SmhFNDhpWVdoYndHTTFNd0dCK3E1bjJnV1g5cjZ6M0tkdFV6RG9Y?=
 =?utf-8?B?K28vWnNjMUV0WGRnbXFiZW9Vd2RpTkVrMGg5MURCMHpXd1VmMzNXamZLc0NZ?=
 =?utf-8?B?dmdBQ2lkQ1NlRmIvck84WVVUeTFqb2M4enFvejRJcEpReUtUTGdNZEJTS2Rm?=
 =?utf-8?B?WGlZU0ZFdFVCcysvNnZub0dYWWxSdGE4SnY2NDRnS2d6RnNNU3dpdGZZOE9S?=
 =?utf-8?B?Y2pob25Tak52VTdvbGQ5R2p4TDNJWFpMZjQ4MDFqaFhYUXBycnpTZ3VLV20x?=
 =?utf-8?B?STlYZVF4RUNrenpPNmZaVW1uQlU2dlVncmxtNVhOSHo5MSt1TVJnb2I1c1Rz?=
 =?utf-8?Q?0SBLYAfj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9cd30b9-6bc8-4e0c-e216-08d8c6d3ff67
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 17:08:29.9437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpSrZR2mxNXV13it0fIsM6fKriaRZH1zY+23OKJ+36MiRKM1Q8g8sIQIhqjcefH/uibXYHmFHjwJZob+MsolnLtC21qek9t2tyP5R+2vHVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4536
Received-SPF: pass client-ip=40.107.22.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: mreitz@redhat.com, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

01.02.2021 19:58, Kevin Wolf wrote:
> Am 01.02.2021 um 17:20 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 01.02.2021 17:50, Kevin Wolf wrote:
>>> Am 01.02.2021 um 12:03 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> 28.01.2021 18:28, John Snow wrote:
>>>>> On 1/28/21 10:09 AM, Markus Armbruster wrote:
>>>>>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>>>>>>
>>>>>>> I'm developing Qemu backup for several years, and finally new backup
>>>>>>> architecture, including block-copy generic engine and backup-top filter
>>>>>>> landed upstream, great thanks to reviewers and especially to
>>>>>>> Max Reitz!
>>>>>>>
>>>>>>> I also have plans of moving other block-jobs onto block-copy, so that
>>>>>>> we finally have one generic block copying path, fast and well-formed.
>>>>>>>
>>>>>>> So, now I suggest to bring all parts of backup architecture into
>>>>>>> "Block Jobs" subsystem (actually, aio_task is shared with qcow2 and
>>>>>>> qemu-co-shared-resource can be reused somewhere else, but I'd keep an
>>>>>>> eye on them in context of block-jobs) and add myself as co-maintainer.
>>>>>>>
>>>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>>>>
>>>>>> With pleasure:
>>>>>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>>>>>
>>>>>
>>>>> Absolutely! Glad to see it.
>>>>>
>>>>> Reviewed-by: John Snow <jsnow@redhat.com>
>>>>>
>>>>
>>>> [..]
>>>>
>>>>> Great!
>>>>>
>>>>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>>>>
>>>> Thanks!
>>>>
>>>> Could someone pull it?
>>>
>>> I've put it in my block branch (with s/suggest myself/Add Vladimir/ in
>>> the subject line), but I don't know when I'll send the next pull
>>> request. If someone else sends one first, feel free to include it with:
>>>
>>> Acked-by: Kevin Wolf <kwolf@redhat.com>
>>>
>>>> I don't have any signed PGP key for now, to send pull requests :\
>>>> Interesting, could I get one while sitting in Moscow?
>>>
>>> If you're planning to send pull requests, should a git tree of yours be
>>> added to the MAINTAINERS sections, too?
>>>
>>
>> I didn't add it because of signed key absence. As it turned out, Denis
>> Lunev (my boss) already has a signed key, so it's not a problem.
>>
>> I think it's appropriate to add
>>
>> T: git https://src.openvz.org/scm/~vsementsov/qemu.git jobs
> 
> I've added it to the patch in my queue. Now you just need to actually
> create that branch. :-)
> 

done :)


-- 
Best regards,
Vladimir

