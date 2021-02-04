Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D4830ED44
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 08:26:29 +0100 (CET)
Received: from localhost ([::1]:59612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Z24-0004Ba-OH
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 02:26:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7Z0q-00035p-6u; Thu, 04 Feb 2021 02:25:13 -0500
Received: from mail-eopbgr80119.outbound.protection.outlook.com
 ([40.107.8.119]:49838 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7Z0j-0007PM-8G; Thu, 04 Feb 2021 02:25:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GV+nPFQMHwDarilkxl1ymHU0H+GRMr4JycVmU9xLm81txiGY986ma4aoyl2pGSFGvREdq8AAWGa6u2SQAAx/e69fOQ3bgsUm4+2jMlW94JBmxNx3u6wQtz4jvnib+HIujnnnELslTOlDeNnPRsUN/Pii8Yt/mw5cB3bDkouKwfswfdX5NIZOvcVDl15DeJEegCru3Nqffxf8WVd+6nxKbA4wEk5QzE2PAof4gGNJr++gw3uht7mUCk6VbmnaFIxhq3MXkTjxeopkCp7SIif1ifJvtH+0fewlsoeV1hWm9C69uamGWw00Vyh3BJlNu42lBX8gW5/XyV+otc30F8WsMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxCVIKqZHV0ALJ0CrinKWBdALDpscM9iaDEIg1QY9lQ=;
 b=C7H576Cm1bLNSuEsS0eGguBJ+xk4gDPm81LqyanmIbhXGSJ1mzM1rn5UxLPtuTYl9LDJgvYXzh418vrwNFGPxVqVIiaj7wJlG1fCH70BiJUvXryGt6wwZXSDCJq8EMYsvlqIT8+5j14y9YVL7zpk2JMW6q2/5+WT9Gur7Ro6KWluSto6QW3cUoLTEbeaxno5yzWT335O1MJf71Yb8tSn8FdM82/q5BZAmka4RWwLS8EI90LCPxXpEAJzZCYayXGCT/JBFnNVXpzlIZJ3KdMxAm0yinFCbTJlBwuyUrPt7o4hzSvB4D5yUsyLWSAWnCVVRwZ0cbCMeEWKUkIR//KqhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxCVIKqZHV0ALJ0CrinKWBdALDpscM9iaDEIg1QY9lQ=;
 b=PUUT96uNTPedbmItPDjU24WEwa9ySSYPFlmmrLSXvWRs4pHMntexfGj5uBXTX3hw3YDqSU7tclpTSGBc1ClPsYPAfgmsCIlhBV5asW8sXmBx6RkGYJDWrwcD9Hw2CSsrM4oJgUFz8m+V4HBkQ6gpBqhOtH/QTijP2d5UuZfatZk=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3446.eurprd08.prod.outlook.com (2603:10a6:20b:45::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Thu, 4 Feb
 2021 07:25:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Thu, 4 Feb 2021
 07:25:00 +0000
Subject: Re: [PATCH v2 19/36] block: fix bdrv_replace_node_common
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, mreitz@redhat.com, den@openvz.org
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-20-vsementsov@virtuozzo.com>
 <20210203182337.GF5507@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0a5788f2-c967-770f-a0aa-21507381acef@virtuozzo.com>
Date: Thu, 4 Feb 2021 10:24:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210203182337.GF5507@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.214]
X-ClientProxiedBy: AM0PR10CA0006.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.214) by
 AM0PR10CA0006.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend
 Transport; Thu, 4 Feb 2021 07:25:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36544f52-d956-451a-6d0a-08d8c8ddfb9e
X-MS-TrafficTypeDiagnostic: AM6PR08MB3446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3446D1C8F915EBC82B9DCC85C1B39@AM6PR08MB3446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mrYl7ip2kQ0R0MlX04fO3o96oAQup5jSYyueNVQcJhSivMqyzsgpvKIo5DLSqzjCgHAEuqBHe2+nXzJjFugG41wRuDXHEonmTIyELj5jDQiPONHOrEkoY/H4g2k14aJotzfjwQ6J1q4X1DVbVHuFgp7WFLOhofVLAI+hpv1Ma+FUqpJIp9MC5LfbiTuz0Km+EtBjWVUBsZQi1WOLFdjODcvlm0end2lQsN1avE1M0WoQFyrW3REM+Lc4Kt6A7LVZYWD78YsZNgb5EvECE8+3pFOFm1gWlzHfLfjKSsDEUJ7TADix3CaB+j9Rmt/4rTWalYSyjdic7MZBKknLnw1vbVjtXND+SQUBCsh8o7tExFqWi+hSMe8a2nbMyqidnf0/ZUU5aO7ulXGyCplH7O6/wTuAPkxvqShX938MTigSc2X5J4J63q8Ey9KuV7wp+bS4uKufKd52O8VzJNeOASv/FGXr0cIb+MCuUFEl1+kWelmxqIhUxFJrKptlCNi64puPcYqSoY3Wt7dXemkwsQxSC2sG6lr2yh+SFfth60B+9GNIOuQ7/AFfnDgIvfrABCNh+0+P+bLDof8mRld7WakzYlPC1hQDVgBhX/13UbpfITs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(39840400004)(136003)(6486002)(4326008)(16526019)(8676002)(66946007)(107886003)(86362001)(5660300002)(66556008)(478600001)(2906002)(186003)(31696002)(26005)(52116002)(36756003)(6916009)(31686004)(2616005)(66476007)(956004)(8936002)(316002)(83380400001)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L282L0c3TDlsUjZLRFZ5UFdyVVJSODMvY09Odjd2VlpGOWdKN2RITmpMQVRL?=
 =?utf-8?B?TCtSYTZmbGlMYWN6WmU4ZXB6TEZWV1U3TUJLcmtzcGxKb2l5NkVWdkdIazU5?=
 =?utf-8?B?bHV6MFFsVityRTJqZk90bXBQTW10aHNNZmU4eXd5eWlzUnZCOUtoQjVtSXRL?=
 =?utf-8?B?NmRNVC9tUHNIcFV6Y0FaSG8xbnJmZkYvdDlLa1NjeHVROHkxMXMvMnlrRndW?=
 =?utf-8?B?SVpibVFvM1lUMmI0emJFaUx6YjBDYi9Ram9IamdDQzFta2FtcHJUdWNoOFpp?=
 =?utf-8?B?ZzJZTlRBS2hIRDdEbUF2ajlESjhFT2hqMmpxS2cxeDVtVzlpU0lVL2NlR2hj?=
 =?utf-8?B?SDJPd1Vwb3J1ME8zSVh5aDNWU00zTTZCSEErUVdLUUV2M3ltMnNSRUtzbnMr?=
 =?utf-8?B?V3ZvQzRkaUhvYyt4ZWYzbVdKRHd0VGVybVVVTDNmYzBkWVFXSWFlVW1kQkE5?=
 =?utf-8?B?RHAya1BldmJuMkM5L1pGR0RVbVdPdjlKQmphVU5oZkY4ZERzZ2Y1YXJldG8w?=
 =?utf-8?B?eWxXeTVvTVdFYVBJbHpsN1E5dU1JWTBnRE5RMmppOEM0eldlQTFoRDNCbzNF?=
 =?utf-8?B?N25GUnJ4dWJaS2sxQkNrbVdCb0ozODVodVI4TTRCYVBHaGd0L1UxdnFwU3ZV?=
 =?utf-8?B?N0RVTmpxS1hPd3NvQ1pvNWZEU2pSTCs0Um1zODZQTzZuWXVrT0lHWmpSSmg3?=
 =?utf-8?B?Zkt0QW5zc3hkN1BpdFlSc2lXQXdDT2E0VzJYL2NBeGppSWl2RENPdzdLcExS?=
 =?utf-8?B?UnplRWNiSW4wRG5lY1EvZnpLb3RaaG9IdG5aRThRY1lUcmdXWVdhV09FTEhJ?=
 =?utf-8?B?blhtTHNUaEZIbXE0R3BvbDdrUzhGaENwWVIyeUExaWJkY3A0c3hsZ2NPM2Nn?=
 =?utf-8?B?Ym9OT2d0NFJlaEFFeEtBelhBZkZjYVNFaXF4SkZ1VjVRdU4vYkI4dC8vVVFD?=
 =?utf-8?B?ZSt4ZlROeEVJRC9TVjRieCtXcStXdExYcFRPaUVsUkRoMGtFbG0rZWxWckdF?=
 =?utf-8?B?MStPZlhXRHNveHJobko5VEZMNzBxSUJrWllCT1k4TDMrRnYrc2d1dVU0YjNn?=
 =?utf-8?B?SVN4aVl0UVVNeENoeE90SlFoQ1RCaXhtY2pxdENBcE1iaU1YRHh6cG9hZCtt?=
 =?utf-8?B?M2szUFFBaEVpYVRnN2FKeTB2eWNTUkpKR3gxSXkweWxRNFMvNnBzTSs0cnJr?=
 =?utf-8?B?UGFQMjRIWkZhbXkzOGhuMnphVnk4OGxBb3FNMlVEZTVVb2ZZcUNPajV1SEY1?=
 =?utf-8?B?aWlvYnUzRm9yTlQ3eUlTSDdpU0lSRmN1bDIydVdJNnpCUEZiOFBzNU9Ud1VH?=
 =?utf-8?B?NnEzRk0xMFQ4T2pKY095N3JKUW5WMWRNOWNxZUpjRGlwb01WSHJ5RFJTMXE3?=
 =?utf-8?B?akZHU0RGTmY4ZThBcVFrWlhOUkQxOWpuRjlkQ3RIYUVtM1JYS2lUNmpNN0JO?=
 =?utf-8?Q?hBT+nasZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36544f52-d956-451a-6d0a-08d8c8ddfb9e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 07:25:00.8931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgvtOZN8V/fCiOy9hX1NUqp263D6OBDJ2RwsmHrJhA4ffr7/vUSdj5wT2UIeAeyPPVj+ROl9gA2Gjjr0Zdyp1foRd4Jsv0JqZ6LwMd2T6Uo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3446
Received-SPF: pass client-ip=40.107.8.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_NONE=-0.0001,
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

03.02.2021 21:23, Kevin Wolf wrote:
> Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> inore_children thing doesn't help to track all propagated permissions
>> of children we want to ignore. The simplest way to correctly update
>> permissions is update graph first and then do permission update. In
>> this case we just referesh permissions for the whole subgraph (in
>> topological-sort defined order) and everything is correctly calculated
>> automatically without any ignore_children.
>>
>> So, refactor bdrv_replace_node_common to first do graph update and then
>> refresh the permissions.
>>
>> Test test_parallel_exclusive_write() now pass, so move it out of
>> debugging "if".
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
>> diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
>> index 0d62e05ddb..93a5941a9b 100644
>> --- a/tests/test-bdrv-graph-mod.c
>> +++ b/tests/test-bdrv-graph-mod.c
>> @@ -294,20 +294,11 @@ static void test_parallel_perm_update(void)
>>       bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
>>   
>>       assert(c_fl1->perm & BLK_PERM_WRITE);
>> +    bdrv_unref(top);
>>   }
> 
> Why do have this addition in this patch? Shouldn't the changed function
> behave the same as before with respect to referenced nodes?
> 

Hmm, looks like accidental fixup that should be squashed to original commit.. Or just a mistake. Will check when prepare next version


-- 
Best regards,
Vladimir

