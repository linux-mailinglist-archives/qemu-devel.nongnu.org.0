Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF3F388DEE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 14:23:02 +0200 (CEST)
Received: from localhost ([::1]:39692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljLE5-0005DX-0y
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 08:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljLAc-0003OS-Oz; Wed, 19 May 2021 08:19:26 -0400
Received: from mail-eopbgr60131.outbound.protection.outlook.com
 ([40.107.6.131]:53181 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljLAV-00072C-Im; Wed, 19 May 2021 08:19:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMR6oWRYZZt4fUqZQ+F1D3PU0FzUeHj/8CI68CN2DLVYW51Uk4bA6cvyJ+Rs4IG2iiK5geFH/AowyUQEzrGAMyXaPSrhFLyfEaFeWgY8jQ71A4wW5WYObI0AIDOXYCKLe8qgatld1byXvRPJ/WXSbQZu1t63MsAInwhryzU0xgk92IuKI8UcgQ73yi++or+L4Zp4JDYkVkGP3neEjFflIGu3BxH4nTnFS/p3iH0W2xnp1GHHzxrm7DOSs4q1MJ9E38aK2Mb2hL4tV8ODPlS85pzlItPA8Kjnyqg+iE9GznO4p+0DNdmsc8R9LvNr/JsMCM7S12hBTa7NjlmtuZ9BeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UARHQ4yHpWQ98yCvcD1scD9WTTk/4zDAJj0gixwxP7U=;
 b=E1KBLpwra1mLYGFOVPSnDcGlcibbRFcsdDn86FLOSjvoR6oE+P6PuhltJXsIKl3y9ICRv7n5nDzvqmITUmm6kyX4DAhaTCzbLgdNb6m7/HADVx6JItLyH17sRD2XuOIkJmgj8az6AIGkW1V/A6pLFKwKrcFcQkG9Hxy4OtIa0AbtI3AqMqjVRDGbVitfElwE0aqbaSdgxEBPF9OcO44vLCUjJQxUcDtsY/p5e5dGQ1qjCH+5QKu3MvMdDuXScQPrTlsuQy4Lezsw5i7SS7dBGoasNs+TsBoHzAEPy0qw7Lka0RPujm+dwsSUBrLG85HPGo28/uABk3DXe+7b5gmaiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UARHQ4yHpWQ98yCvcD1scD9WTTk/4zDAJj0gixwxP7U=;
 b=gaPsMcLYMhB6lo30dBQA7/L5S5TEXtnMqFt6QnMgyH4xUPDGCbUysdy47ZqW6jgUVQH6+sPPowxmAxdmZvXJwQi7mYvU6U+oe64wK7glhULHsHxidNSfVAypjqaT2aZHH6e0mhu/Ke8t53RhNCDlI1caqv5ecz9qwt/O0EdeB7A=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6774.eurprd08.prod.outlook.com (2603:10a6:20b:399::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 12:19:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 12:19:15 +0000
Subject: Re: Qemu block filter insertion/removal API
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>, yur@virtuozzo.com,
 Dmitry Mishin <dim@virtuozzo.com>, Igor Sukhih <igor@virtuozzo.com>,
 Peter Krempa <pkrempa@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>, armbru@redhat.com
References: <a1de7e2e-2048-50d7-4373-7e04299cf7aa@virtuozzo.com>
 <YKT6D1jg4gYi8nZE@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a6435411-d4dd-29a0-02b7-d99e9b42597b@virtuozzo.com>
Date: Wed, 19 May 2021 15:19:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YKT6D1jg4gYi8nZE@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.218]
X-ClientProxiedBy: PR0P264CA0281.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.218) by
 PR0P264CA0281.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 12:19:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 549187a7-37df-41c8-be0c-08d91ac05140
X-MS-TrafficTypeDiagnostic: AS8PR08MB6774:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB67742D90629B6AB6BD7AC5EBC12B9@AS8PR08MB6774.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Q51smrO+8WGCanspTB72goD48pCQ0lQiqmAE+JSh2yXAJs5sZn/12f/Kp+3zluCKrtjK7DBzFIOduQqmle6E0eSG0BYP0OJbRVOyeuZ60sfWJ/0MaRDDzXIlQ0BTuxBc9aEoEyQDigNbfvbf3LHRnxsheDycJC0Fs8f16fBIOmXRUVYqFxM+MiO834XuSRtOrmd8JoYfXxRq38xCuQGI4q2aLJA01lq4tX4aZ9GF6+t1+xF+O+5DYDM5L7iC9UAI3teV5vT+KX/7zDx04if099KiLQ0U4QgP9fKGgss8nv4yrj+3nu6tHh5PFdgKPvUVpwtXtFFToTQURJPErzEpNzhHoyc9CNmT0NwRcrbnRWY6CO11MUZeE7Y1zvxVF5MeV2JJAG8jWYNJa53GgJdlxY3ivePUaBJJeGBmtiGM784BYSn8yjg6cZTeRqXMYpZCmqN0DRwLCoO7yJDr95Hr9DyogsBBOJ4LsyNwAx98pbnaE5cf5VdZBpYKUIDm/9U6bmcfYV3Fs48a9Db7cyPPvGtjDxdlIP5ndcLbMmYo8ZOPVrZsxGXV4/R+TdRg72iVbXx6GrUrAyJE/jW4k8dG97SqttgIiBlb41eEO7TGrKZHOu4i8hAlmDnzEoZiM6gx503QhqqlMCYNuEbK0wlCTSuE7jmXmarxvd6ChAAWBoHT4DHyvFl/Ml8tp6i4+J0rm/JhW6tk1YqxzGqd1KUs5lCfOUF7c/UGi/EZkATnvg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39840400004)(376002)(346002)(396003)(316002)(6486002)(16576012)(6916009)(478600001)(8936002)(5660300002)(38100700002)(52116002)(2616005)(956004)(38350700002)(2906002)(66946007)(66556008)(66476007)(8676002)(86362001)(186003)(36756003)(26005)(83380400001)(54906003)(16526019)(31696002)(31686004)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eHpjSXN5OE0xVWp2dUhYdXZCam1Ea2VsejlTZTFsckNsTnJ4TGlLdmM5RGE2?=
 =?utf-8?B?eGlLVE5xUWdZUjAzQlU0cGxaclNpQ2hEQy80ZGljNmZXS0lIOFQvTm9hZGEz?=
 =?utf-8?B?WStrS2Fnbjg0cTlUZy9jQWs0Lzh0NnV4UitLVzV6STl3N3hOamtTdi9QcURo?=
 =?utf-8?B?M0xyOVlDQ3E2MGI2WVd6RTJaUEQ1TEFSREo2TXREbXg3VmtEV2tPSGEzRDhF?=
 =?utf-8?B?MnZadEJCcHFPYVZpYS9IbTlYVFBWNXdJTnZSSEJrK3RLL09RN2M2Z1JiVitk?=
 =?utf-8?B?RGJ2U1Q3VzNWdXM3bERxWVlBZXJrQlNnNUNhMWoxRlRieWQ0V2RTQnNaSWRC?=
 =?utf-8?B?NFBtU08xUi9hMDlpeXZ1MTUrL3V0MVUrZklack4rSm5rMW45TzB1ZGw5ZWhu?=
 =?utf-8?B?cHB3SDJMQ2NBNCtMZUJpd1VhSEE3bXVPUzJJOGl4WDhsclRBUlhwdUg2TkUr?=
 =?utf-8?B?REZxM05XanJnWTZ0bzU4MGMvVEtBSk5tMWlBTFRmNGVhQ0grTkJMZFRHWUpJ?=
 =?utf-8?B?MnAycEpMN0Z4ZE5qaUVVTjBjK3VHMUwzUWZONkh5QVgwdGN1dXU5NXpQY2lI?=
 =?utf-8?B?Qml5UDR4ck53MkNEN2tIL2lhcGVFR01ITm10QWRaR1pUTStBSU5Ob2FyZDBS?=
 =?utf-8?B?ZGJ2ZGJLdFVWZDhlVnQzR0l3ZWl4M2kvdkgwbGw2MEtuM0c4b3ZrN3NGOHJK?=
 =?utf-8?B?RFZhK1lZV2gxZnROOFFFWU9ZKyt5RHdYb29xQUh2ajQ5RmNjMWJ5ZTZkVG95?=
 =?utf-8?B?M0hHaEc1cDRkTWhRaXpFSGgyQnNLblRkaHdGRUk4aVdZU1Jud2VQVkNoVC9X?=
 =?utf-8?B?SjQ1SWdSSE5uUC9PbFBCTnZZTWU5ZGxxZE1VSVRGRjNYeVR5VzFGZ2ltcTh1?=
 =?utf-8?B?QlpSV3lWTkZvWTQxdVBCWXd2QUorakN2Y1h2WjJYTGxkZUxrbGg5SFFNSnVX?=
 =?utf-8?B?MGlGazhMRkJFc3h4WXAzSjV3R1hoNEpNK0tKZi9KOWl4SXo4NjZrMVhIWVd5?=
 =?utf-8?B?WjdzOVdzbFhtVXlFYjkrdUlQSWdSTTdXQTVJY0RyUERMbjN6Zm92QW8wWkFS?=
 =?utf-8?B?Nm1LTUlFbXVsYTVadTRKUEloRTRzL3JYSkdVeFdWZ0E0aGRrK01rZlBCYzNT?=
 =?utf-8?B?bENOZEt5Ty91a0VBdkExZnV5YmJ3NmQ1NEZ2ckJqOUx3dCsrNnM2TGJjSlN1?=
 =?utf-8?B?RHVuQ1ZqdFlMUjYxMkU4NGljVGFYVnArbytNWjFmNFpMSWJPTHZuYmkrMkhq?=
 =?utf-8?B?NTQ3YmsyRzludmViL3JzTHdwRUkyTE52eEZEU0ZXcjdaWm9SNVpZM3lwZHNC?=
 =?utf-8?B?QjRDOEc3RGJianIxSGxsSzNaNzZGUTRtL29mbm9NazlYVlJkby9FR2pQaURG?=
 =?utf-8?B?ZnYzaHpiZmdPcWZ2Ni9wc04rZDk2NlZiemN5OW5maXMvVlAyOEE2M0VHRGdr?=
 =?utf-8?B?cStOS0pkZ1FKUWZHZ1RhdFdrYXRZa2pMZ0NCd1hYUnEyS3JVdzR6aUpnUjBW?=
 =?utf-8?B?UlF5ZlVxOG9yQjF0dzhIOTZ5aE8xOXE0ZS83V2Rja2N0eWdGdHlXVlVGTVds?=
 =?utf-8?B?Q3dyVWExUzg4RElxMlpWakhKODRtSlpUUTQ3TFgxOE5kSURJWTZQcXFucTNF?=
 =?utf-8?B?U3R5SXVsM1hUMmt5ZXc0ZmpDa0Vnb0lPYlhVVEk5T2JVT0RPWVZkeU4rTVdU?=
 =?utf-8?B?VEwvRDBXd0hxWk5ST3haQjIyb21kRWdEQjBJdlFzNXhpUlRLVzNtQkhkeUZr?=
 =?utf-8?Q?sIiNGlU/0rPxAl2FDrPVIK/ZBoB5W1htmFtRsI2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 549187a7-37df-41c8-be0c-08d91ac05140
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 12:19:14.9921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6cXmG+BdDgRUs7OnUxAAfKa6cqCcujRnPljYW0DzQkDkiwpZ2h4282A9f7CSuuKVLioQQZ0ttBquGWnfBqDlOE7emcamwSZsu2VhjF2t74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6774
Received-SPF: pass client-ip=40.107.6.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

19.05.2021 14:44, Kevin Wolf wrote:
> Am 17.05.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Hi all!
>>
>> I'd like to be sure that we know where we are going to.
>>
>> In blockdev-era where qemu user is aware about block nodes, all nodes have good names and controlled by user we can efficiently use block filters.
>>
>> We already have some useful filters: copy-on-read, throttling, compress. In my parallel series I make backup-top filter public and useful without backup block jobs. But now filters could be inserted only together with opening their child. We can specify filters in qemu cmdline, or filter can take place in the block node chain created by blockdev-add.
>>
>> Still, it would be good to insert/remove filters on demand.
>>
>> Currently we are going to use x-blockdev-reopen for this. Still it can't be used to insert a filter above root node (as x-blockdev-reopen can change only block node options and their children). In my series "[PATCH 00/21] block: publish backup-top filter" I propose (as Kevin suggested) to modify qom-set, so that it can set drive option of running device. That's not difficult, but it means that we have different scenario of inserting/removing filters:
>>
>> 1. filter above root node X:
>>
>> inserting:
>>
>>    - do blockdev-add to add a filter (and specify X as its child)
>>    - do qom-set to set new filter as a rood node instead of X
>>
>> removing
>>
>>    - do qom-set to make X a root node again
>>    - do blockdev-del to drop a filter
>>
>> 2. filter between two block nodes P and X. (For example, X is a backing child of P)
>>
>> inserting
>>
>>    - do blockdev-add to add a filter (and specify X as its child)
>>    - do blockdev-reopen to set P.backing = filter
>>
>> remvoing
>>
>>    - do blockdev-reopen to set P.backing = X
>>    - do blockdev-del to drop a filter
>>
>>
>> And, probably we'll want transaction support for all these things.
>>
>>
>> Is it OK? Or do we need some kind of additional blockdev-replace command, that can replace one node by another, so in both cases we will do
>>
>> inserting:
>>    - blockdev-add filter
>>    - blockdev-replace (make all parents of X to point to the new filter instead (except for the filter itself of course)
>>
>> removing
>>    - blockdev-replace (make all parante of filter to be parents of X instead)
>>    - blockdev-del filter
>>
>> It's simple to implement, and it seems for me that it is simpler to use. Any thoughts?
> 
> One reason I remember why we didn't decide to go this way in the many
> "dynamic graph reconfiguration" discussions we had, is that it's not
> generic enough to cover all cases. But I'm not sure if we ever
> considered root nodes as a separate case. I acknowledge that having two
> different interfaces is inconvenient, and integrating qom-set in a
> transaction is rather unlikely to happen.
> 
> The reason why it's not generic is that it restricts you to doing the
> same thing for all parents. Imagine this:
> 
>                      +- virtio-blk
>                      |
>      file <- qcow2 <-+
>                      |
>                      +- NBD export
> 
> Now you want to throttle the NBD export so that it doesn't interfere
> with your VM too much. With your simple blockdev-replace this isn't
> possible. You would have to add the filter to both users or to none.
> 
> In theory, blockdev-replace could take a list of the edges that should
> be changed to the new node. The problem is that edges don't have names,
> and even the parents don't necessarily have one (and if they do, they
> are in separate namespaces, so a BlockBackend, a job and an export could
> all have the same name), so finding a good way to refer to them in QMP
> doesn't sound trivial.
> 

Hm. I like the idea. And it seems feasible to me:

Both export and block jobs works through BlockBackend.

So, for block-jobs, we can add optional parameters like source-blk-name, and target-blk-name. If parameters specified, blk's will be named, and user will be able to do blockdev-replace.

For export it's a bit trickier: it would be strange to add separate argument for export blk, as export already has id. So, I'd do the following:

1. make blk named (with same name as the export itself) iff name does not conflict with other blks
2. deprecate duplicating existing blk names by export name.


Then, blockdev-replace take a parents list, where parent is either node-name or blk name.

-- 
Best regards,
Vladimir

