Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB8840C038
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 09:10:06 +0200 (CEST)
Received: from localhost ([::1]:48306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQP3V-0000mm-Hk
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 03:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQP1b-0007LH-Qv; Wed, 15 Sep 2021 03:08:07 -0400
Received: from mail-eopbgr80133.outbound.protection.outlook.com
 ([40.107.8.133]:51873 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQP1a-000745-2l; Wed, 15 Sep 2021 03:08:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUvNgW5fP1MZltli6d2O6GERSwx7R0+OWrpxMj/HCO8u76zbDx+TJ72xpg+dL7d2oyTlKzY/jlmY6kAKPH4goNe6N6m0VL6MdO6xpxiIAF0FpaW4xJtrTVAsgyO/m5GVyrtnyGRSI9//6OdmaqrtnP/IaQNMvbBnZgf6lx7TAhv9/UlR/IJLZdu3mLi0q8PwXRAcTNQ1FMsUP8eJsd8YDcgbu+VuUDhttIA3LXsAzsHlhBrRTK747PyT5/OBXEdWxvIW/KrBDzpAoQwzccANDdqUc5n0gLuRAxwPoPRA0HcCqcIT7vzjF29EdTpleINPMgrsOPdsmykgFsgiK0/raQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=wnL+sUjKUowPRzUd5glEqn3kQ9gg8eP7Zd9Q7HC68bA=;
 b=XjrEp3IJW9IkIit61r5QdXvMf+oOGyDsPJw9gUnnMB8tLbs1YfkFO3CNnYw3ivwBg+2OsSWn192oP6nEjZpfLd7X8Qs8NWRmFnZK3CfeSusO4oiW7SbRjmL9ND2Sf5WJ/+hjdvBXgxpVTT8+5xg70bVRAhqVW279s4Qy5l7S2flzWKNKguDh2hUbroJ5caAee7CZtJbUgS6GpYwzRL+7EStix6XLz683qrehQ4S+L/PSC/LjmzZHNk1Z8rlLiGbYzDbelhynSW4g7/NEPpH7FAdBHYUSzv/ikzvtR0jiycbbdbzKmclNVqnFP2I0Czj7dsvoi1bGT0/09eTxu7aC+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnL+sUjKUowPRzUd5glEqn3kQ9gg8eP7Zd9Q7HC68bA=;
 b=IAEnVe66eZuAFP2EpTe7u4OrWLTt+LpcZElukejE6/DQyfgJ9qFmlBuugPNLiYZqGxGT5rt9aOBXCQFUXCcHAp5erANtMliJ9UbWKoBcisjXNVxw8+zuvOQ/MijhLR5F9BR4cKZ/MwHWMGySARDGZCt/AXUovIdXVfIe8AT+7Wk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5336.eurprd08.prod.outlook.com (2603:10a6:20b:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 15 Sep
 2021 07:08:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 07:08:01 +0000
Subject: Re: [PATCH v4 05/12] job: @force parameter for job_cancel_sync()
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20210907124245.143492-1-hreitz@redhat.com>
 <20210907124245.143492-6-hreitz@redhat.com>
 <7ed34792-cdb0-ce82-33d4-07a37348d3dc@virtuozzo.com>
 <2c374f18-a38a-a248-8cb9-4a9f7d0d8d3a@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <edf76506-31ff-7a8f-6fa1-3f1001dea608@virtuozzo.com>
Date: Wed, 15 Sep 2021 10:07:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2c374f18-a38a-a248-8cb9-4a9f7d0d8d3a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.5 via Frontend Transport; Wed, 15 Sep 2021 07:08:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e19e89e-11c3-4381-24c7-08d978178df8
X-MS-TrafficTypeDiagnostic: AM7PR08MB5336:
X-Microsoft-Antispam-PRVS: <AM7PR08MB533613B630EFC280925B57B6C1DB9@AM7PR08MB5336.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ibGYMAZ7VP1evjeySL12p2+7xx8uZG0OJQr5JKm8Lbc+7+wZFjq6RSkSb2AVHU6FP/zr07ZWLptKnXnpPxAy1FxMOqXBJT1nCBFOf/0CH2tT6Adowttt/+PUznJCjZvyhc1sbbbFFwieMF1mmq8HQ2D+NKTb9fDnTagsCLV6D0nEEhGrJBSMs4I1RqYcjsFeuLCVYq8dGoHUamB0qFsWU3ihcLokUREIzZMypnahaTBr7TeEUsZnZ6oN6J1XXx+Gq4DeHJI3go15jxNcIFXdQT37EqJxyzhcKjLbXWi2/8ZZeQGmRab1mZmIsptfNna5gM13i2jLsNsUgQLFZ7hzkcgw0RZXFidSym2xfhGMDF6aLQOp9uxHBWHGT23iPRC3tsl7HVjbZhQF4w+Cfs49oZheOPIJEr6MPYtp/a8bao0Kh8dhUeYO+PJls54jT9lDiIcfAjYfmD9dvZluzjXrCJz1V4yq/OSCO/0v8+IF9jzmGFXKi7hEi2dpqnoKgaUPGhiJq/OJyhMLa/j7W/PDOif9t4eP5Pg8R+qrrl07LyHTIWTMX6hVoNi0UlNFbpm0wfNQVBkOTYjbfYrdRXm1w5RCvzJvy9jjBwz/3xdG/x8Gc2ekHD8e3shzOUR9xxAIaUM+ZitRGUt2ne4nYeED657l5RAMwe/oL+F4683W7YX6aWj/LRSdmk40nRHrfxIoYl3lVrDqY7WaNaKcAawpcRAqNBPg28QzhwDTfQZaxheQXbyh4dDtfKlV94UPVwB7j7UvanSgOVZww+QR/wqK/ZJYlJqpCJYszqUcxINlWlI2EOmPD9SD3MTs2WmDfqb7/Iz5pGeoz4RqPcZPzV7u7fhU28gpgFGeA5Y2zd5hWKk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39840400004)(478600001)(2616005)(316002)(16576012)(8936002)(956004)(54906003)(2906002)(36756003)(26005)(83380400001)(86362001)(52116002)(5660300002)(31696002)(4326008)(8676002)(6486002)(31686004)(66556008)(66476007)(66946007)(186003)(38100700002)(38350700002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDZVdEx0cGNROUh0QnRQbU43aldVclIrZDEyWUt3U29KR0k3dXpZMUN5YlYx?=
 =?utf-8?B?c01WeFFSODFyaGk0M0FjdzRUeStSQ2xyM0FNT1lXLzRqY2cvY3hKYURBQmFn?=
 =?utf-8?B?cU80TDhTZi8vSElta28vRk9xMDVRclY1SGNRNDMrMHFMcnJrcSs1Wko3ak9T?=
 =?utf-8?B?T05oZEJyUFZiZ2lCRjNDZ1NuaHQvOW04SUx4eUo3cUh4MEZ4R09kbDFEQ2Zk?=
 =?utf-8?B?cjlrVGg2TG90aGVsYmU5TTVRRkpiTXliNmtnYkhlWWpFZTMzRmc3OVZ6WXo3?=
 =?utf-8?B?WDg4R2FYWGNYNDZ0aVhyL1RRbjFEdHArbXdaYm0xaDlrNlE3akdTWjIvaEMz?=
 =?utf-8?B?RDVCaEUwelF1dTRXMmNtOExNTEdtMFFXUW9LaFQxTnlyNlpLV1Vwcm9BTWVi?=
 =?utf-8?B?cjNsMWZPU1JCZlNiNnloVjZQSHd6eENJQlN4aDRBMEdaakl2amU4aUZ5Q3Bm?=
 =?utf-8?B?K2tkYmEwbVgvMnVkVCtoZUZFR0FoZUxRbGNIM212bmdGZlpLRmo5VUJsMmFo?=
 =?utf-8?B?eitHNENKbFFpMTYxMW5JdXMzdCtJZnh2RkVkYWVrb3hsdVRGMDlxWjNaVG8v?=
 =?utf-8?B?ZUNYZXVIV09tUU9YeHVjOVh4YmdyZ3RvUzJ1VGN5ZjRYTjN6enZBdnJnbWdM?=
 =?utf-8?B?UEZncUd6a01TOXN1N05vVHJDekdjaTdkRElDNTRzVGRodXZGaWNxMllFRU9n?=
 =?utf-8?B?R09GQlpNNHlPVS9Lb1pUNUVoUm1tcCtobDk1aWQ0Y080RE85bWhjcXhpakdT?=
 =?utf-8?B?TmVTQ3U1cXNGbUFwTXRUaWRZbTd2YklTeCtsRGlLNFcvS2ZZbXVOV0g4QzI1?=
 =?utf-8?B?aTV6Nm4wdmQxb3BRc1VnZkRrMkgxS2t6V09SZ2xINFZsTnFoQlZITVlhNE05?=
 =?utf-8?B?QzV5ZXhIRFB1Ukd4OXB2ekJ5R0RXajByOWJzNkM5aEc5TlZ5bUJXejk3dXpZ?=
 =?utf-8?B?TFJLRWh6b1BtQUtQK1VNWTA5SVFmZzd1bWVwaUcrdEptVnEwbnlBcnFQdHlL?=
 =?utf-8?B?c09yVkk2NUZrL1RrMkVFbG9scWtKaE1QSzhDZlFtaTJPRUwvTGlSRC96VWFy?=
 =?utf-8?B?TVM1OTNnUkRiQzlFRHIydGFRc0VKb0N0and2Ynp4a3pvWGc0RWZhZzQ1VHdT?=
 =?utf-8?B?NW40Q2tLNm03eFVTS0RLY2d6eUw0VlgwaG83YkNrSjlxdndLUEYveW1uS0dC?=
 =?utf-8?B?QktXbUowMm1tcVBud0l6QStiUnNCZ3l3aDdmQ3VYWEdERUZIUWdaS2U0TzNx?=
 =?utf-8?B?Yy9VSDBsZThmaEdUYWp1WldYY2lLY1dPWU5sR3JNemdNRit5cnBrN3p0em9h?=
 =?utf-8?B?bjdOaElzdWNsRFlDSGxaQmZlZ1dKeExVVTVDMVhMOUhWM2daeEhMNll0YmZy?=
 =?utf-8?B?L2JFUDNRd3EwZkJ6eUJmTFdZNm5jYWFUTEVsT3kvTEhTazB1N3BsTE9FelNZ?=
 =?utf-8?B?VTcrZ2k2Yi9LRnc4M3ZINTNsYlRlbHI0VENRdGk5dVRQL1B1U05EZkRqL2tE?=
 =?utf-8?B?a1F2RExqdkhrd1hIa2gzNmZ0R0JIaGR4Z1QvS0lGdy82VmxVNDBINDlFN0Mv?=
 =?utf-8?B?TUNxbWMxY3NMKzEvTGNFdTNaY0JWcTVSSTIzb0xZZzRPMG9XQlI2QlpKdHhW?=
 =?utf-8?B?Qzl0bUt4TDNOV05wUG4xVzZsUER4N0tRZTM5TmVnd3NWS25TNUI0b2VjbVdw?=
 =?utf-8?B?SjluQi9BeVlyQ0RRbitFcVhPbUUwaFRaUlRyZi8vUW5QZG4vNklYeWx5RWRk?=
 =?utf-8?Q?GxZASw4qtxOmBWatF41DtI5KRdhd+yaVxwlEdEy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e19e89e-11c3-4381-24c7-08d978178df8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 07:08:01.2126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IwAfiy/cb6NeiXLR5gR4ziwvJu9osRM7xDQN8n0BMUoaDQznvc35DH0g7MR3PjQ0XKGvxwLUo6Q1rYATUi4K1C+3EatxgfrP+92Qj2KFMVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5336
Received-SPF: pass client-ip=40.107.8.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_NONE=-0.0001,
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

14.09.2021 20:20, Hanna Reitz wrote:
> On 08.09.21 18:33, Vladimir Sementsov-Ogievskiy wrote:
>> 07.09.2021 15:42, Hanna Reitz wrote:
>>> Callers should be able to specify whether they want job_cancel_sync() to
>>> force-cancel the job or not.
>>>
>>> In fact, almost all invocations do not care about consistency of the
>>> result and just want the job to terminate as soon as possible, so they
>>> should pass force=true.  The replication block driver is the exception,
>>> specifically the active commit job it runs.
>>>
>>> As for job_cancel_sync_all(), all callers want it to force-cancel all
>>> jobs, because that is the point of it: To cancel all remaining jobs as
>>> quickly as possible (generally on process termination).  So make it
>>> invoke job_cancel_sync() with force=true.
>>>
>>> This changes some iotest outputs, because quitting qemu while a mirror
>>> job is active will now lead to it being cancelled instead of completed,
>>> which is what we want.  (Cancelling a READY mirror job with force=false
>>> may take an indefinite amount of time, which we do not want when
>>> quitting.  If users want consistent results, they must have all jobs be
>>> done before they quit qemu.)
>>>
>>> Buglink:https://gitlab.com/qemu-project/qemu/-/issues/462
>>> Signed-off-by: Hanna Reitz<hreitz@redhat.com>
>>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> Thanks!
> 
> Do you plan on taking this series or should I?
> 

Hmm, right, I'm a maintainer!) I will, sorry for a delay.

-- 
Best regards,
Vladimir

