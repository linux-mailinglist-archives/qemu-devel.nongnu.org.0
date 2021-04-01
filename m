Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8409B3515B0
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 16:40:13 +0200 (CEST)
Received: from localhost ([::1]:57576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRyUW-0007b4-FH
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 10:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRySN-0006ZA-Hc; Thu, 01 Apr 2021 10:37:59 -0400
Received: from mail-vi1eur05on2101.outbound.protection.outlook.com
 ([40.107.21.101]:39297 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRySK-0004wG-AU; Thu, 01 Apr 2021 10:37:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfMSzKY6C7GuG+JCgUFeM1UitARtESkqEDb1RwudjVbt+gvNBnfG3DzhnwEqW68eRK3vLvShGnkJAyDbtiZ8djXjdXhAZF5jDk9I4fv3E4t/QnOZ1q8SmeHfIm+bcar/2xCteJi0GlnkhOSjLXhPf3s+blCYwQOeSCRKEBxEqRAWwoC8GDWmCPEpb6RV6JZYBf5wrVKSwvVjaqbz2mvBlY4pu10aFNnV6P89rsyXpg3ygzzM2gFBQTMjIO6Yh9w2fMqSWz0aknpeQ4pze/WrgsC119K/ApY1azZRX2IhvPubbCZooYi+hGBo0T4fEyrgKuyUnD1r1hb1zr5uP02VKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzkhP2+Q+e6RpMeW7X1RYa7yrqj9iqg+ZoI0c80qKW0=;
 b=ONuRZqeDS7RYwBeIo2KcXx0Yz59yg6CPuPS8zt2LgoWI2Hy8cd6NUd/1eXTBvulcNd4kkWwP1RZBKu9rf4tKlW1eQ8wQThQTyXWR1snf5k7qwRN4gHtDZ4ct/nKu5qrpYYQFTJes3lmEa/rN0i0gLTYm8oG2AVvFnr2HL198K+QAvyhNqfS3urGQOBJJCY1urzLS/rAjoUTEyPr73BL88gPcDjhmvCxcRwtrqPJF0WIn/6sZC++SSyRGitERut+poGIaqc+XLEI5jPs98pCTl/M/EC7j3Z64aR++hxVFEvOeZs6yNnpuM0UzR0h40+k9X1wMqJW31xioFvT+7zobYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzkhP2+Q+e6RpMeW7X1RYa7yrqj9iqg+ZoI0c80qKW0=;
 b=hIZqrGSGqunvfTRPgKsjtaXmsc5goUb3vXUiSQ2Sf53JBLB+gTMi02QtURdZDrXPVjD55ApcDTfjCqC75rFhEYafqOaYjMVnpWPSWkeYpM4flw/eUr4MGWKWUekS0fBYphJehbxwldtVhBhnTqS6kaOLxKwHFdjP23I3rmfcyhE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6134.eurprd08.prod.outlook.com (2603:10a6:20b:291::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 1 Apr
 2021 14:37:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3999.028; Thu, 1 Apr 2021
 14:37:53 +0000
Subject: Re: [PATCH] iotests/qsd-jobs: Filter events in the first test
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210401132839.139939-1-mreitz@redhat.com>
 <c0f53da1-bae5-d853-1cd3-355fd296d23f@virtuozzo.com>
Message-ID: <816e08d6-25ae-c84c-6d42-91f3a3a48fcd@virtuozzo.com>
Date: Thu, 1 Apr 2021 17:37:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <c0f53da1-bae5-d853-1cd3-355fd296d23f@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.200]
X-ClientProxiedBy: AM0PR02CA0194.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.200) by
 AM0PR02CA0194.eurprd02.prod.outlook.com (2603:10a6:20b:28e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28 via Frontend
 Transport; Thu, 1 Apr 2021 14:37:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66c0f3f1-5495-4398-fb7b-08d8f51bbb66
X-MS-TrafficTypeDiagnostic: AS8PR08MB6134:
X-Microsoft-Antispam-PRVS: <AS8PR08MB61345350BC08B0BDCAFD832FC17B9@AS8PR08MB6134.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7QxsHvwBwQUNX/hR7k/xd6bxXCt6r5mOAiGW6AjW2lgC1doV61J8b7gb7G8duFXBDn+DsCi9Q8ob6csFakkh+uPERNRw71AeOpUSwG9VJxpoBSiJmrFrnhrFvR3O6g8JDEC6l64Rnd/nbytjUD/2xDuXZPr+0vGRb8RfRIeNG7SZvXMyuWB/REscWNSofWCPzX1c6Zms98kBDZ083M5qqTTJZZngXqOzQ6Y7n3+05FNougQXSPnnwlt2MyU9oHasAlG3AHNFLYVlEQFmfCRRhgmBUBI7OK7xBAOPIT//b1Lm34Azija5xERxzWXwXZvPgS1JpGflV8GrIIKTdv8LXAy4ZlDdnEuyorW6bl0SrLksqHjt8TCZO/FANQvUwsm4+kmMwtk02LSOzZWxQuTaLz5QcNMQhfaw/joVb2/+yGy9sVafLVP8VBc8Kz4qhLrFdJ4XODRBMbkAXLSrvXIs+RZ0nb5TQjE1v1CE7sR/WGRq+UMQ80s4VsDKFSCfLLwVigbC4ngu0C+VCoa+qL+LVIfAIZegXCr/qeLDt4iYUu9yUufHg1oFPri9k6f4ST8ZvYJdUwCy6qhiVHq8Q3VOmPfUUC8mEsN92kkPMKT8cw/L/yJJ2ctCWrL49RaRrnOwBi6V5MJDOvM1XUfol3d4N8xOLSmTwhGTsd3Zgl2qWLWGDII0qKgoGuk9D7LE8uJEvdMgq1lBC/DtfVXjlGjPyi7hx6EFJKYo1X55DRA2rWU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(366004)(376002)(346002)(136003)(16576012)(31696002)(66556008)(66946007)(31686004)(66476007)(316002)(52116002)(86362001)(6486002)(956004)(2616005)(478600001)(8936002)(36756003)(8676002)(38100700001)(54906003)(4744005)(5660300002)(186003)(16526019)(4326008)(26005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZWtyUnBMT21xV1ZSNWY3cFhCM1plVVVuZHZ5WjUvSlFvSitFbzRlRThJbThu?=
 =?utf-8?B?YVVHN1ZUUjlQY2QvcXR4dll1YkF6TnV3Z1VYVnBESlBWVlZMbjJwMnhKZG52?=
 =?utf-8?B?OEQ2MEtncWRYNUJFRWlxbWRndE1rYlUwUW5MdkVwV20wV0lyU0d0anIxY0J3?=
 =?utf-8?B?VkZQTWgxWGV1TTNaZFpJSHdYeEpYbmlzWXV4WTRxMDJlTGtLaUNseFBNTUtm?=
 =?utf-8?B?T2JpTzRzQnJIR1ZRdkp0L1dwa3I1VDNJTEliZHV6VjAwek0xbGlQd045MW9F?=
 =?utf-8?B?ZTFOaURvYlUzSm1neUJzTXJjaFU3SExjb0gxc2V4aEZIeVFSdytLenNEMTRO?=
 =?utf-8?B?UkJHSG51a0tkVXNmTWQ0aHVuL3BlZWpudlIyN1VWSS9yaCtEc3BxTzkxa1VQ?=
 =?utf-8?B?Qk5mcHliNW9TSExNNE5vNDBGQVZUUWxIK2ROc3UyQ2tHTGRQeVBxWmwrRGZz?=
 =?utf-8?B?Lzd0OUNFL0xFMmszRGI2MHZjUjZoRFg1b1E2SWFnK21lZkNaUWNVUHNnbllo?=
 =?utf-8?B?VXpjc2luZ2FyV0UrSkdOQjkrZUpXS1d2c3FnS1A2SURLdVBmVzMrWkEzcHVu?=
 =?utf-8?B?VFlkeEtha2xHQVdpeE5DclpjK2tweTliZnNsM2tEUytYNnc5YVR4R2d6RHkz?=
 =?utf-8?B?eldKSlFKTHBnanRwWGdrK1pLKzJ5dHJuaGQ4Sngwa3V4UjlCblo0TVJNTnNx?=
 =?utf-8?B?T21neEpEYy9YVHJNYnFJSFdNa0doaHRKT24raGdEeEFhd3ltanlVQ053bWlh?=
 =?utf-8?B?OTU2SG5ZRlEvTkloK0N0NUdrNHluSXdKWEhLU0ZjdmtmSXZ3b3REelMzczdz?=
 =?utf-8?B?NVBVTm51dkZqeUR4OUtnUUZFSFpKYlZHVDlFbW9XR0F6dnRQSkhBSmsza1lC?=
 =?utf-8?B?bkQrbEFnRVVnNVVka29QY0x0citMcEgwT3RlQUxka3lNTXFuZVR1ZE4zMGo3?=
 =?utf-8?B?UTFQb1FQLy9KRldtLy94MU0wOENMZmdkUHdaOUVmU29IWUJHMy9yYkNDQ0xm?=
 =?utf-8?B?S2ZOMkZseHZEYlE0cmpyM2p1NW9QcFh6bGVSWExDWmhpYmRxdEluQVNpWXFp?=
 =?utf-8?B?aytBLzBqYWlXQ0dTeHIvc1FzemRGbjZtQ00rdEo3NTVxNktHRm9UdFlBVUNn?=
 =?utf-8?B?TC9KcmdQcVhOdEdtZGpsY1Nab0s0eW5iNHVNVVhaS0hSNWhVZkJpUUNHR1Ro?=
 =?utf-8?B?emZHUEpIaHA1L1VKcGdKQVZzSEE5cWtnbHpreU1VSUdZQnQraWdTd1o0Qjlk?=
 =?utf-8?B?WnRna0FyYnE5MTVnNmJtditRREpOK3FoNDlhMHV6NWgvNkFmZDJ4b0VzTnVu?=
 =?utf-8?B?dW9iaWJrN3JIN1JGWEVZNzFTZ0RUNldBU0VGUVFiTzNlN0JKSlVjS0FMbkkr?=
 =?utf-8?B?T2kwYm9pOEVXWUkxcGlxdzlwQkhjNjllWmhSSldzNWNkMmI2NEdZSFpLdkFY?=
 =?utf-8?B?Z3I1L2VJbXU1c01UaGxVY0FGNkZCbHlUamRGZklQOTloVDJrUXp5M1Rvc2Nt?=
 =?utf-8?B?R0E3b2p3YklOYTl2a0Y2Q3VHcjhLZ1p5Ujd5K2liczd5TXQxT1JIa0w3MEhp?=
 =?utf-8?B?MUw2SnZsTXB2Ym1MQ25CYkcxdUZFY0hrU1hqbXNENlh0d1NwTy9Cc0g2UG84?=
 =?utf-8?B?VDdzSkRvN3NZOC9ObWNNd0NFWW00TldFWVIxTmNXeFBadDIvbVlNOUluNTM1?=
 =?utf-8?B?Vzl5eWp2Smg3VG1nVC9JYmhYTEdQRC9LUHQ4eUVoMnpZazlKN1ZJSk01dEhp?=
 =?utf-8?Q?JpliPpiFqzXZ9knVTvMjd06oQ06C4m8R1OlorGA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c0f3f1-5495-4398-fb7b-08d8f51bbb66
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 14:37:53.0791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vhZhp5/ego+pv9OyMd8dvy4RgLuYr9QiQGnjOJZg4b+UAjTpaOyaTNyS1xwLploe1k9/eeeYSnffJhwx7yv/uerINasHbugOkIaK4z68+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6134
Received-SPF: pass client-ip=40.107.21.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

01.04.2021 17:37, Vladimir Sementsov-Ogievskiy wrote:
> 01.04.2021 16:28, Max Reitz wrote:
>> The job may or may not be ready before the 'quit' is issued.  Whether it
>> is is irrelevant; for the purpose of the test, it only needs to still be
>> there.  Filter the job status change and READY events from the output so
>> it becomes reliable.
>>
>> Reported-by: Peter Maydell<peter.maydell@linaro.org>
>> Suggested-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
>> Signed-off-by: Max Reitz<mreitz@redhat.com>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> 

Hmm, in your mail (and in copypasted by r-b) there is no space between name and "<"..

-- 
Best regards,
Vladimir

