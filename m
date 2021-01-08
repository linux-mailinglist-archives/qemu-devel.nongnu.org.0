Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE35D2EF0A1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 11:25:54 +0100 (CET)
Received: from localhost ([::1]:48298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxoxt-00047Z-Rv
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 05:25:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kxows-0003ct-7Q; Fri, 08 Jan 2021 05:24:50 -0500
Received: from mail-eopbgr60097.outbound.protection.outlook.com
 ([40.107.6.97]:46820 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kxown-0002yf-Rk; Fri, 08 Jan 2021 05:24:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7rSR+c1B8hA75lN4gSbRYWQhxewgrJlCL6UXwTXzoKcLvelrwWRteNQeP58OWulGziWCUkiEgddk5oj4W9WLgHnsydo6pLvhNvkk71ob7LvgJL/OArphfLsT0Nc09t6Q0R79vtlvumfbxhvyigWR4q+Kldu4CabnO5p3ZW2qLxxrua8o+JjaB2lFp8Yuf17+d71L2HbQHDYV9TT+HcvT7wDdK+mgUD2zoUnvoljgHQ1awTPFBBSM1uVZikkzd3Qze7e1kQ87rk7VEb4GdVwI3NA0C/CzRh6dqekTyUKkly632WDCLQkhwX3MrJbKqI5fgSeDfyaV+7K6h/5qyaCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqikAH14enPejdLLZRQFM7ESiExRVxtN0NTI+YEplJ0=;
 b=IgpGX13iOna1WDx4SDr6mrdtRdR4WuftOrR893sHNjuyU3RitkZUv+Vgzs7jEKii1MsoJmygoSs6LEKZc7KixhHvOhBveLbg3ZJucPK5GQ+GL3v/YTjz3z53zvDFBy8cWlUORuxf1jySq1FTp6a5dn71Bxrl6s8YnpgCe7pKPha6Xjr9xUNsMkb8lRS4syrqB3ItUXmRpyZNt4K6OpmGeBPBDPYzOYfpUz3B05Kyaq0RhqeZpOdK1xempz1KGgAj98kpd3xTCallP5LxP9UDxIEnhjgI/QrWyztJn6+ZapnF1dEpIJnET58rxStFqcQxDEhLEduiYMtS1+fQH70ZjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqikAH14enPejdLLZRQFM7ESiExRVxtN0NTI+YEplJ0=;
 b=vT3bjlhNrW2z7whuNxSoae/sp/CejsP5E8xI3jXTMtfQmcIuAdrXI0uevnMxQ+hZ2tGsKX0LTbBwDIZWz+58GQLHx8UqV9lmgMrVBbWWGaRJ7gmgsTB89EpRrDVPZbdpMtgTGgtp9KYPtVP2td7KsGpfjhUCmi6tto41VEXjDLs=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2100.eurprd08.prod.outlook.com (2603:10a6:203:50::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 10:24:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 10:24:41 +0000
Subject: Re: [PATCH v15 00/13] Apply COR-filter to the block-stream permanently
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
 <e27a95d4-be8b-581b-65aa-32cb47657069@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <8aa716e3-9db3-b0a7-5635-e6034313c3dc@virtuozzo.com>
Date: Fri, 8 Jan 2021 13:24:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <e27a95d4-be8b-581b-65aa-32cb47657069@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM4PR0101CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.119) by
 AM4PR0101CA0056.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 10:24:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a774d43b-b6be-4233-5e84-08d8b3bf9c10
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2100:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2100F7E578BCD01710330FF9C1AE0@AM5PR0801MB2100.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yjs+dtkLACZYmJD3Z9U7BGf9JJQp1jAvURR/9TmMSWZOo1THhZc0CcBXnuvxKgxmvgQvqokSVkkCdGMbXsW3kIq/txBDLci9FpiLDJ/Xk+kgeoA2jHuMVv84uWdmNWCVRUzJjMOoE/wt8bltVJWvGEAoxb/cypdbsCdqmYqEQGFKcOeOpvYyPRBvwWi1HtXlogL3Rf+n5rXnONA9cMWaUD3ieyFuy7/mjFJS7YuiZTdjdL0hw4FUDZ10o3WYD4b4pWStR5gllOs12HOSHRX1wv7kqtrtJY2gsPs4le4VndobbscBofadDtVk/tS3avBcfkPhPuvvKnPiR2tVIEKi6lPcJYb0TFPbA5kloOnlTovXSHVPGfUAXFhBU5ndAy9/wL8q4wA8a0TkEPx9XshjPib4lBVfQK51Qvc1mgpxGztvgjkBykuHerYBak/T3bCu78UHyvTS50Hx7YrvZqth8Mehq6FRNzXPu3DdF8gBphsdo7NfdjLqYmdrSFfHJp/AfeHgF8x+DU3DhNF6Pxilnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39840400004)(316002)(8936002)(36756003)(2906002)(6486002)(966005)(8676002)(5660300002)(31686004)(478600001)(83380400001)(52116002)(16576012)(956004)(66556008)(66946007)(2616005)(31696002)(66476007)(26005)(86362001)(4326008)(53546011)(186003)(16526019)(107886003)(4744005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RVcxS0Yyc3JwMWRZRmJuOWxrcnA1ekhFeS8ycEZ2NEtJM3VGTTJqbkQ1Ymo4?=
 =?utf-8?B?enJTSTlyUlVSeTlXTW5HT04wa1Z2WHZnK0NiNlVlWkRMK0lCMUt6cmEvRjFt?=
 =?utf-8?B?WkgwcUdSRTRuN3NRVjkvMUtKT2dEUDE4UWtyakdUOXJrQkFlV0tRQVkvWTJj?=
 =?utf-8?B?cDFHWUVtdVJNNGJEWm1sNk1jQ3lxcFJibm1TUVZueFRucTF4M0kyVHhWaFdS?=
 =?utf-8?B?b0tSdi90QVNCSkl4QVErajVaMHQvdmtaYUFFN1diUFQ4VE5WT2NFeFR4NzFK?=
 =?utf-8?B?WFVzZ09HY2xYa1VNUjlsdUxTTEwzajJrRG1ocUJBemVJKzgyREpXQUZHTTJW?=
 =?utf-8?B?UTYwZ3dxQmo2R0FQam5JV0kyUGFXWFFhQlVjeS9Jd1NTaU5HMisweG9nQldj?=
 =?utf-8?B?N1JIOFhndXo3bjUyTUgrNUFhOGVseVpjcVJQZVRuZ04wMXZSQkVURlIyeVRj?=
 =?utf-8?B?QlBJbGFlU1NESFVwbUQ1bnRQUDV2OVZRWGNzdFZGU0tGaGdEYndLOTZkL3Nx?=
 =?utf-8?B?TjB5ZUxpQzZISGI5cVBZUHQ3eVRNVkY1U0hYZEhvMHovQlhqNjQyck4rZkg1?=
 =?utf-8?B?TElzelVINk0wd1NRYUp2dk0zdk1WcUlHUjJZaDBWa3V1VGNxS0VndW41RWor?=
 =?utf-8?B?Nkd5STdVRFlEeVhYUndsYXcxVjBiM2J1c0RqQWJVaEhlWk1scDB5U2VydmQw?=
 =?utf-8?B?R0o4aWlSU3ZIZzlDeWZFdE8vNmhGdmpXeXFGSS9QZDJ3TkNDVmlXS201b0FD?=
 =?utf-8?B?NXRqK0JXWWRMN2FVbjcrWm11U241UnNlbGVFVkhwV2ZkMXVkYkJhNHc1dVM0?=
 =?utf-8?B?ZnUrcmNJQytHQ3o4ay94cjlwZnNxYnJnQkdKcno4eHViQmNyb3puYVBoUDEy?=
 =?utf-8?B?bXlCNDJycGZEVFJCMGFwV1FGczFISW9wVk1XL1lhYS8yWUhuVzdDRkhWcElS?=
 =?utf-8?B?ZnlNYUtCTGpvZzcwUWhXUlJsL3c2Tit5cm53cjY0dnBXWi9XWjhHdkRzeGZi?=
 =?utf-8?B?K1pWVDZaN1h2NXFsZmhvYVRoWm5kWGI3WEVzNU1SN2E5NUkwODRYcXRLSHBU?=
 =?utf-8?B?MGdzVS9KTFkrbUxYTVVvQWtXczIrNjBaZUdaWW83STkvUXBDZ2YzSVpxSFFx?=
 =?utf-8?B?NFNlT29tYzhsRzR0cjlLRWVkeHd3dmU5Q1ZXVU5DSmVQZjFraFl5OEhxS1BZ?=
 =?utf-8?B?ZVJKVUJEd0ZJNXVZdm1NNzFnRGxLaXZJZUdsRGp0Y25USklWdWtKUnZzb0p4?=
 =?utf-8?B?QVA4QUw1dTREcVZTVW5LSmhqVDRmUkRlYmZHaW9Ic1JoMzkvMTFVdTEyYWZB?=
 =?utf-8?Q?Hdqaskc9RlPbhl5kcE84G//b5qXVFFIjFR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 10:24:40.9786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: a774d43b-b6be-4233-5e84-08d8b3bf9c10
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUBZ+BbYYP8I8iZwjnByq4nzfxKrHcEK9j5Who0tnLhfYu2m0K/VhZZFltC8zpuwLu2qRuklV+uCUM8uU63SpJ1PPLuoO2bagUwV6UkyAo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2100
Received-SPF: pass client-ip=40.107.6.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.267, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

05.01.2021 19:08, Max Reitz wrote:
> On 16.12.20 07:16, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
>>
>> Here is a new version of cor-filter in block-stream series. Main change
>> is freezing the chain in cor-filter itself.
> 
> Thanks, applied to my block branch:
> 
> https://git.xanclic.moe/XanClic/qemu/commits/branch/block
> 

Great! Thanks a lot!

-- 
Best regards,
Vladimir

