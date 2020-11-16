Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3202B3FFC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 10:39:33 +0100 (CET)
Received: from localhost ([::1]:44106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keayy-00087S-LT
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 04:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1keasG-0001zv-AE; Mon, 16 Nov 2020 04:32:36 -0500
Received: from mail-eopbgr70127.outbound.protection.outlook.com
 ([40.107.7.127]:32750 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1keas8-0007d2-WC; Mon, 16 Nov 2020 04:32:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCjFNsH7BcXGGRSYIiG3prHNhFFbAoNkIXtjd/KnpVKyVhuC5QGjbpbr0RcNenbJMv2ZAem1z7K3J/Z/bEHtgUeYYJurQMNvXy9BAdnnyJh6pVEec2QBHOhQif1sO52mjMt8IeKklh8D8+jS+jlJh6Kf1tDQYxyAwxOZgHilNnRVglwDwvGI5oXgmBNL0TuTu07u04Vbf2U2tMeFyvXysgIHw4yrpHAfalTWjjZO6v3AZLW7UzC5fPSksWPbZWRLWvoMCfuL7W7q/iIYX4/SYCgNll267FunF3c/Lm1ONk8taXuIXhpcXxsKgZMCoqSQh06KrozHj7NEYqVVKfZlzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQobo8GmexV4PCueP9AmNVH0lLrSPN8t4IZNjUDfYLA=;
 b=XKIiPx73HrTejQijiHVo8ExXJh8+q9eHLhf8BUE94yF7/QqFASFHKokSOVIsfDo4zaNBOUGigY1TtLIO7KCFn+O12fakutXucB2/S8JvG8g1j1vACLHuqDON6r1hpSIs3RjxcFOfKUEoWr+7DgBASuzadmrIllzIzSJXMlqpDhsOOgQqv3ZmID+olqnVy8clm8S4aZlZ7XBF5ffg2fCyq5m8bawSJB8pjuTE7+2F/cVwzax4xCAKqNioIfkm36Ez2oWQxrIBtKQVnjjVEZbkOVkFPk2eYaoSYM8aYBGMCuTc3qym8uVdPweqSuhD8XWsPFJWL3qwovU7j7ClKtU4wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQobo8GmexV4PCueP9AmNVH0lLrSPN8t4IZNjUDfYLA=;
 b=s9GHTPa8iZpJJfAN7oxzFGWK/sjlaZ65NDgTMkDFCG9CJ33zZSdBlBkLwxrfBMfMTz/uBq3wYUgcw6+XjrkAaH9F82eVLrnzN2S9B85LjYcloKWDJwWxXGKqlH8b22pkvKbuBsbqanJIcomUoguiZaop64NPuBdud9qDlyu7YI8=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 09:32:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 09:32:21 +0000
Subject: Re: [PATCH v7 00/21] preallocate filter
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 fam@euphon.net, stefanha@redhat.com, kwolf@redhat.com, den@virtuozzo.com
References: <20201021145859.11201-1-vsementsov@virtuozzo.com>
 <775a4a8a-a45b-e5e3-fcc3-ca1f5bf9e584@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a5596680-2cc7-b652-9416-5bef7ce9df60@virtuozzo.com>
Date: Mon, 16 Nov 2020 12:32:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
In-Reply-To: <775a4a8a-a45b-e5e3-fcc3-ca1f5bf9e584@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.126]
X-ClientProxiedBy: AM3PR04CA0128.eurprd04.prod.outlook.com (2603:10a6:207::12)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.126) by
 AM3PR04CA0128.eurprd04.prod.outlook.com (2603:10a6:207::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25 via Frontend Transport; Mon, 16 Nov 2020 09:32:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f125fcd-a71f-40d3-4701-08d88a1284b8
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44700FB6397AD8BD57AC7C9AC1E30@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fm7Ekf48fBUrP0mvTzE/L7cQPkWY2qv8HmcS+FPnKqJWwzcT9pASv8Wu4WMN8pGGiQX/wJPQwIxnEx3jgvxkiLgXPMLNYH8V6g3jNE632ZogKvwl0ULkHDu2ZvaE+iFgUkRr5QkSj3aAQnAgWf4Rqdf0PQh9q75dLDMB5q8KjZAiE6hjVwjL75a8i9VUU0HN+yLboMb9MQi3bB2RVOpoAiUe5uply2JCNcm7dwWSk/d6qm/sirkHMRbWQ0PxqDdIkWP7sEicW//Xb/fImqC1kTZ8CrcEjWY3cS00+2cpDrHw1s1099PR+golOgWs7vJIt9XnahFp090uo5T208aOvzUDy2S6kCRFn0RVHWwvYjQG8NXP41Dp8m7pSNQ08wV6BDAlmmbz7a7bNG5JY8adTEqoEtXGLEbIztBGMUAYysrqrRtrjlJYTYFJq5Pe9Ya0g6+F72hWBNgxzSIiNpr0KA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39840400004)(346002)(376002)(316002)(36756003)(83380400001)(16576012)(52116002)(66556008)(66476007)(107886003)(4326008)(5660300002)(8676002)(8936002)(31686004)(6486002)(2906002)(966005)(31696002)(86362001)(4744005)(16526019)(66946007)(2616005)(956004)(53546011)(26005)(186003)(478600001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: z+ICgiZoJB6bJlFsYkphzkkrFyhC+zKAQ9x3K96Hjb7TNhgWAtFFJcSOWUwjudJK3hTalOMZfdriqJ/oqJPyi4E8nDgk1p6rx6Abp0qTxO5fIyPnBNs/cEqCvKJvn/2bvGluxvv0MXHYmvZ8TxpIMsV+0q5xA26UbBci/X4OQ5B53GBrZBO3PHbMaRa2U33Rr0zFb86gObahqSOqckN6kQUcyCcUNxDT3iin57yodiAf6ORruB2YmL6w/nyG+FUfw9Sz9koR8AKjXzd2fRyByk8tXXF2tHVaqmT9nyPSmUJkRskPND4XetQZZn2pXPBTGVwSD9ZWuUx9JJNyqCS3bqGUssUVc6xBEVMTioO8atU10HFVB+YbDRsXNXMyL/AeUCLy71Af6Du922nt3NqsZpyJtIFAVlchUD27zByxJMjrASZXzcXHpW/CCoSq0l11UMOYWPl6EBK95r88yvahunYLQZ996ez3aLwBGNw1hAwYM1PaGx7eWOTmFw3oQhth9OJ/tubiro2CMalmn+ZIyWbp6O3YcdQ/qwPXsfpVW1qcU2heJQoh8a1a02/ZSf0iZ8yDtPBLvi45hAARxABBt4FREqMDF/JlB7sqhe4fG0ynMBqfhSw+3PLwVkG5QCd7DRX5lGfpi4LU0a6QChBKvw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f125fcd-a71f-40d3-4701-08d88a1284b8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 09:32:21.6874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGcUxAlWzVNG+DkTwMv/SN0xbpjLhilDq3l/5d7XhxmTymo3GpAaOXrflbJYBKtxKKqJUp3ozSJwMqqXrcAkTlvoJr3D6VDvG5+CV6j0PAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.7.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:32:23
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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

13.11.2020 22:33, Max Reitz wrote:
> On 21.10.20 16:58, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
>>
>> Here is a filter, which does preallocation on write.
>>
>> v7:
>> 01: add Alberto's r-b
>> 07: don't remove sentence from the comment
>> 08: - drop extra "s->file_end = end;" line
>>      - improve check/set perm handlers
>> 09: add Max's r-b
>> 10: add Max's r-b
>> 11: new
>> 12: - skip if preallocate unsupported
>>      - drop auto and quick groups
>> 13: new
>> 14: - improve 'average' field of result spec
>>      - drop extra 'dim = ...' line
>> 15-18: new
>> 19: a lot of changes
>> 20: new
>> 21: add results dump to json
> 
> Thanks, applied to my block-next branch (for 6.0):
> 
> https://git.xanclic.moe/XanClic/qemu/commits/branch/block-next
> 

Thank you!


-- 
Best regards,
Vladimir

