Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2EC39A0B8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 14:21:21 +0200 (CEST)
Received: from localhost ([::1]:59272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lomLg-0001dM-SN
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 08:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lomKD-0000lh-NT; Thu, 03 Jun 2021 08:19:49 -0400
Received: from mail-eopbgr80123.outbound.protection.outlook.com
 ([40.107.8.123]:63108 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lomK4-0005Tv-Ma; Thu, 03 Jun 2021 08:19:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJF2xTUkKVrb9+yt1DWPst2UbTZUwUuykpIfNaoHipejGGzwhXaeI9rRYba9u0DWaY+zwOs9NtMKAYQi7RG+g+mvjpobAt5lKvVjdQ6wHqewZ+uFRVnTMAQO0/UiPyJxh9Hs9CWBaGnel8tjB/T+WzFIYQ2rz02l+cUiFlaGP+l27ENnnBsMTqVbydnpT2ZB9lFGoFWZi8Gw5uA8kTTh6cJeRv+9rUzv+OJr4KF0iZl+653vhTrGoeq3R+YTfTfXraT7GIYBIBiQMPBG9dg4uiLR6XnfPbnrRHTSz73p4HhwGxeElsNEFFk5ltmELN+o+BOXJxzT0iPSQ8nTIk6kTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EdWwLPFT6+5lWkBnTRAsjVHeyThwuRGGcqcr4GucKs=;
 b=dDng2vYt2oQboKJsVn/eVOA/fac8alEZXGNe/07s4XvowIHly3RB8/pWgz1X+hje0DEpOhwG7osePkk1R+v3oXCVDhfhr5OFZv4kiSclz2Ckmr1kjn+fqqcMAuG00vfexXhacpIJFXiyz5m3y3yF30FzXlsADO8BGtcu7atLlaXOwnXD/+oPvrPY7Y0MAAwSX74kNdThiGWicZMF+d0gUBJ93ZwHHcmF9CGzgEsnqgZUtMcQaOgF/a7YlNMUCK4jCBrFtatUApyjtrY5v9qtlbH+AU7H9L96RUCT4tos/5l9r9yiDE+gHWTASOpeLrGmCJiOIur58YzSsYzDD57fww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EdWwLPFT6+5lWkBnTRAsjVHeyThwuRGGcqcr4GucKs=;
 b=nZikFvwUz+aW8mDv1jV23OKhJDBcV1T6Hex1QVlpHdpvVYQ4QsByL00QSB6zJ74A5E1v2tcIiJWRBSLpRGjzZLsEU6w3xGztqEcrXZknjOhI0c3e6QBrw93kglvzkVbLMpk+dnTv3BgQNXIBjO8Svc2thbrDcqd8Kp+JKWXTl3A=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3286.eurprd08.prod.outlook.com (2603:10a6:209:40::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Thu, 3 Jun
 2021 12:19:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 12:19:36 +0000
Subject: Re: [PATCH] iotests/check: move general long options to double dash
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Cc: kwolf@redhat.com, mreitz@redhat.com, qemu-devel@nongnu.org,
 eesposit@redhat.com
References: <20210526181659.365531-1-vsementsov@virtuozzo.com>
 <3d086c41-80c0-a970-367d-00e19ce55817@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ebfba20f-badc-422b-f71d-28b9280f65cb@virtuozzo.com>
Date: Thu, 3 Jun 2021 15:19:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <3d086c41-80c0-a970-367d-00e19ce55817@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.243]
X-ClientProxiedBy: FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.243) by
 FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.10 via Frontend Transport; Thu, 3 Jun 2021 12:19:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: daea8aef-cb5c-4790-35e9-08d92689da44
X-MS-TrafficTypeDiagnostic: AM6PR08MB3286:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3286B4CD4A11F632244D49ECC13C9@AM6PR08MB3286.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wd+iKakbTIBjYBy9CP1bj+Di9s/uJP01jrIpxNtwO4HShX6s0imlrEutWKUvEGKacjm8SiF5At9CNuZ7Ml7s23LDJltxPbCla0Vr70UcTyWl/9XDFE9LjsUo8tWJsrn0tJuaw77fbt5R9vhfqfUMWOAee7N1Q2yUzmtK1+XmnVEpjG8m3Ty6f3iWKFfk/9502PuDIhLoalSWaSqRSUiMqsI/8kW3hWlHTTdb2WdOGUuEYnon34u2DCDmgVtJCcDG0xX1RUlWCxPnUvCfnExzBn9FrKh7mIKN2gKJRZtvQD1mA1Oub5NazVOPh9ozMN2AXRAa0J8AdoCivgabzTNPflf5gOhwQzwQoRXGJPp7Z6nIeKlNHt38+PQE7jhp9QnCzO4WKyHwGrF1WiIunrMJr6akMTaiCfIbplLL7ArPmM6/blHprFlQ3H/rXpx9RI/IAl61VkerfEG87lMl9hEweQBszsqc/YpDJNl4sI/tBnFJrZcC+btIrkwUyWCXorCx6CN7GWfOk63zXjReFa3eUDbKIvURh9Adlc4XFK8DKD5SbgDOFl/6N7l67/A/kiuz9tE1Ja6dv6KeXfsabyaNqjSTN/+7cL6V93KOtlmUGO/pVTu+s7CCbaLgwYh3TVvLl1aDPuMgSVd1/7pRJOLyyAcrHlivcX2lpwMHgy8nQhLZsRoUEhisjZi1jw5ZtBxvPd0c+YkXABaJnra59u3PnbHvHMmQ7gz+wiYTnq8QvVU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(376002)(346002)(366004)(396003)(8676002)(36756003)(6486002)(5660300002)(16526019)(16576012)(186003)(31696002)(26005)(4744005)(66476007)(4326008)(52116002)(31686004)(66556008)(66946007)(53546011)(8936002)(316002)(86362001)(38350700002)(2616005)(2906002)(956004)(478600001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RXJUcGtlNk1aVFlpMVM3WEhWcnY3VVh0RFVIZHpKZHNaUVh5VjNKSnlIcE53?=
 =?utf-8?B?MUdRQkRrKy9ibThhc3NWMjdJSmRlWlhrUjNrZXc5TzAvOG5Fbm91RU1HZDdr?=
 =?utf-8?B?T3BCTWJ5R1FSS29xUHhnNGNjN0x3cEd0Zm94ZjJEdlBzTm5pcmdlc2RRanVm?=
 =?utf-8?B?RzJ3cHRJTUlrRlBtZWtDdDZYcHNGV0QvNEhPVUhUczZTc0g2OFk3TmhpbzRF?=
 =?utf-8?B?dnZuNnFLRUZYSERScTJ2Ly9LRFhQYy84Z05ZUndoNi8rNUZxSlNabzlZZnE3?=
 =?utf-8?B?ZTVTbzM3WmsyMFVSK1NjbUowVkZ2VXZZbDFsQ25JYTZ2ZE5peDY0Z1ptWk9l?=
 =?utf-8?B?cUtGazB1YkE5ZGkzZnNaY3k0U1NwUDQ2dURxWk1QaWorQzdMY1RraWZVUlE1?=
 =?utf-8?B?UDlrdUVRUTcveW1EaHVveEtKZHNxZEFmVXE5ZC9yUmcyTXhvclJ6azM3a3p1?=
 =?utf-8?B?YlRVc1JBbEN4UlNpN2RRY1VocFFpMURyalpzZWF1ZjI0MDZsY1VhUnBkR1pN?=
 =?utf-8?B?MHVTYS83TzhYQUNGNVpJdEdib2JrQXplYkZnY0xrTHNNODFISHFnbTY0dXBv?=
 =?utf-8?B?dGZVWDB4bmtVY1VDRnpZYVc5V1cwTXlvNzFZK3hmcm5xMWI5c0dWbm1hdkFS?=
 =?utf-8?B?cHVUNmtlNUlabEYySmVMeGprd2tGUzk3UngwN3BpOUxxWGNuZkI5ajdScmVS?=
 =?utf-8?B?Z1prUWRUWnUzM3ludGkzMUJZREJub205ekhUVmZPRlJlOXk3TEJnZkkwcE1J?=
 =?utf-8?B?dEJsZytTekN4Y1ZRRXFtNldQQjVxT1VUSC9KeFU4Ykp0VGEwUDE2ME5mYXZD?=
 =?utf-8?B?QzNuUzdRUFFadzVPVHA0N2FWdmJCeE1vb2tCV2J3Wm1WKzkzei95SXV2eTJX?=
 =?utf-8?B?MTUyZnVtMG1NR3UzeGs3eklvTUFaRStPOG5lL005ejc1KzRXbnA3cXRVdnNH?=
 =?utf-8?B?alErTlhDQXJDTUUydUlaVUFoeXZlYzgyeUdjRnJlTmdvR1ZJNWFvTTJpU2dC?=
 =?utf-8?B?MUdjcGJpL1lmaE16UVBZeUNaNm5mYXk4bUJ5M24wR29RTGdYVHRHZWpHY1JG?=
 =?utf-8?B?M2RYVnJ1MklKbEVZd1ljelBpYm9xTDlCbUROR3plN2RGQXU5UkdkV3k4eWhh?=
 =?utf-8?B?RisyZEQvblpjOFRicHJQdkswQWl5emFEL2pZM1UrdXFkdVJNRXF5MCsveHdH?=
 =?utf-8?B?ZThsNVFyR3IrSDlNdUVaUUVDd3p0QkpYcVlyVGJFbWJDWmo5VVYvYWE4ZDJ6?=
 =?utf-8?B?citXd2tSdUZrd0xjWnRYOTRGNWN5ZzRKa3pUNVZ6ZUlZaXhKTzR6UTNVUERY?=
 =?utf-8?B?QnJvZU1nNSt5MUhsQ1EwMklobkhCWHRvRTRiRzk3QkZzUjFOTkh4TjllenlT?=
 =?utf-8?B?c25ocHExalZna00wMTZ3ZlYwNHpMMGFWd1NDbFZSQWJKUGxhOFZCMmVuVnlh?=
 =?utf-8?B?cE15bS9GRmtlUFZXVHJndTZNbkhDbEkvYW9vdDZFSGhUTTlqdEZxcnVZYUR4?=
 =?utf-8?B?OG11UVQ5Y2JIQWZ5Z09iWlhqYS8reDBEa0ZkaE43WU16enRvK1h3YktwOFhU?=
 =?utf-8?B?TU5oUU1SdzNXd04yOU9ON0R1SHVKcnU1SXNoWEdBY2tNRk5oTkU1dzJRdktr?=
 =?utf-8?B?eGxPTlZSZkFIZG1JTVlHaTRQS2g1M1c1S24yMXhZZHpJb0JzSkJ3blBCSllM?=
 =?utf-8?B?ZGNQb1R3VEVxVkc2QktjYUxqbXY0YXNJVXZNUTlQcitiUXVJRUJ5NWl2YU5z?=
 =?utf-8?Q?8zPcPRQfHWfdWiar+ijBNbxXGRDYIuSwfhllBNM?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daea8aef-cb5c-4790-35e9-08d92689da44
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 12:19:36.4850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2Nlgl8wV0hwUJIRMSkYzmBzb+mqjAzbrZBZ1iOYIi3djb0iO7AF0XaBpQy1Bdhww2N4ysnmoR59MOmBUVsJu12HGg8AoMT83O5Ptt61mno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3286
Received-SPF: pass client-ip=40.107.8.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_NONE=-0.0001,
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

03.06.2021 14:38, Paolo Bonzini wrote:
> On 26/05/21 20:16, Vladimir Sementsov-Ogievskiy wrote:
>> So, the change:
>>
>>    -makecheck -> --makecheck
>>    -valgrind  -> --valgrind
>>    -nocache   -> --nocache
>>    -misalign  -> --misalign
>>
>> Motivation:
>>
>> 1. Several long options are already have double dash:
>>    --dry-run, --color, --groups, --exclude-groups, --start-from
>>
>> 2. -misalign is used to add --misalign option (two dashes) to qemu-io
>>
>> 3. qemu-io and qemu-nbd has --nocache option (two dashes)
> 
> Just like for QEMU, let me reiterate that this is generally not an improvement.
> 
> Double-dash options give extra information to the user that short (single-dash) options can be combined, while this is not the case for iotests/check.

You can combine short options for check script, as argparse supports it.

We don't have many short options yet.. But something like

./check -ng auto

makes sense and works..


-- 
Best regards,
Vladimir

