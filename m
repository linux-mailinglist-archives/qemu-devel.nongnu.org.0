Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ECB409824
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 17:57:42 +0200 (CEST)
Received: from localhost ([::1]:59078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPoKz-0000eD-No
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 11:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mPoJM-0007MT-IR; Mon, 13 Sep 2021 11:56:01 -0400
Received: from mail-eopbgr70100.outbound.protection.outlook.com
 ([40.107.7.100]:1935 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mPoJI-0005Qk-3L; Mon, 13 Sep 2021 11:55:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrPx+0q7GgGgaJM+t3giiO02aZZlpHml8a9ryfPEe3uzAaOtGakF4A97YAMPl9Em9DBmxyiiDjtKtkb1U8X9cCSUP3Xq6Bfr1vvU71zyfxdaKSj65l4gGngBTjiqCmMwYUi8NS4hJfYxormXesVrzKx52pva/Wa67p7nawfblAVx/hKH2XyyRph4/DubpZ0oaw1gvgZfV44YW+dPhI5lPeyIHq8xjTKwxqe54qotpBevIprqTVaIbqk48O/a8zwDjb1iA/oPZVdZ4MIXRfC3a5VFfJjifSG68ZZ0TU3d3/z5Q8Dk+MLC3aaniNGNsdkpSili+a6oTnpRTSgqlkjWOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=yrZCVIzT2nGsWJXzL0FB8G87cj6/M8cpWCaNbhxX42k=;
 b=QHCh4GiA8QaAf+PJyKTlfBZW0LK0nEiZTsMUvGvqWP8BWUDZ9TDER++fp9rMckC5/8ymS4447YK34T1PZc+nWn77Boi+y4tVnITWloWApzr+0P+cVEjweWSxOm/VKcwoqV8h6LcvAGJWZWpxgyedILhqQrIVkv4IoVjDlVeoW2qibl5VbVyGzP8nuHwrN/1sJfKCmTYVENUFP7veS99dPDr7aiZ2rH2UcZEtKzuD2xgzlwxwm1NitZaYDztrlvDNDIc5I5G39PeFCZMpA9pKZ9bB91IXqkD7OB2mP6qEmkJHTuLqmhCFGXFtLPHT6V6YoRuvyRNJ1nEWbuAyIjUKcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrZCVIzT2nGsWJXzL0FB8G87cj6/M8cpWCaNbhxX42k=;
 b=NjTy2flNzHkoRmWLpBjh8x2xN64u9NOSd9xfc1AZfNOEK6PkKqSshuQTVQ6wz2X634HKKQM6F8fY6ENVG5I8kZGdK6BLynUwGsgqUCKrtuYDebmqzzxQ2h6bmODWeRj9yND7BmvCTX2dLWU4KpzYFKK6wGtlCyESGgZRc36JGrQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6437.eurprd08.prod.outlook.com (2603:10a6:20b:33b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 15:55:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 15:55:51 +0000
Subject: Re: [PATCH v2 17/17] iotests: declare lack of support for
 compresion_type in IMGOPTS
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 den@openvz.org, jsnow@redhat.com
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
 <20210720113832.586428-18-vsementsov@virtuozzo.com>
 <dee9d649-f667-4029-7929-b7da9da89cfd@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <53c967e9-9fab-de05-ccc7-4bb77cfc7db4@virtuozzo.com>
Date: Mon, 13 Sep 2021 18:55:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <dee9d649-f667-4029-7929-b7da9da89cfd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P193CA0014.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR3P193CA0014.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 15:55:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 533e9dc5-0e8c-4318-ba3d-08d976cef5dd
X-MS-TrafficTypeDiagnostic: AS8PR08MB6437:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6437273B8CA643F5AB3F83DAC1D99@AS8PR08MB6437.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q8PMnoNMCXzrV/cklRBdEYbhtpqiZZggL6uGNWRv/K9b+JcAOF/+lIBuXAxHvcI7T0c6xbZs2eX3mvZD5lCgvX48iZAcpbrkFzqlcgwV6IhmXVnDJ8JLpHteyMQ8C9VToEy4iQQggwYBrbGHT3C8SvEHxd/9A7n6SmoVqNinQ2NFBhYjE4/JAbPGQSMToA/ogWqNb/CNfsqfbfQhxKJd3T6iKSYcpFunOJlZTuw5cT12Fh53UJ8AK38HVACYflA+xqxioc9/cqYFVUhyvs3SSfyDVp5U0T6/cbyqgoT8anykXYlB4OZt8NZJAGlv4DU65LHJhBdoeuaLHhkRDHbmtAe1uuFAlWN8U3Hult1JrtMpggUcnySkAIpICPTfKsRqHf3gq36cs3W0pO5jqgU6hVuzSsqzeTCI2X5SiVSt9F8v2anu2ULkSxqdk5BtffWkdgKzgVo1z6InMn/crE8mnavfdrXhRVBhUMIfF3m1yy5m+z4YaBMAqoRd//02/EDjL9HdqDA/gr9c+w91s/cPwpbxGcaVFi1a0dnXOY0vxugSrv6MC04GbaQLXzNyr4QBFAwkiYsdXo476EnrkFaZ8mLemOup47YCqmJ+JL3aQEDOefsqJZhHBJIGNy6EK9auHOYzdowYw68auoGZ38dRqOfKIpb4q/b7zFiv8VyFgqS+TOOoPYjtZXUTj8cgJLqv6fPfYodRLu5Q/EdDIIU1AoIN/Q0fwFFjkZcMO1d1CURS3+aU5z7unzTzPD/Rtqm79+1wONyDhaOlyfEhkNmgwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(366004)(346002)(396003)(376002)(4744005)(26005)(5660300002)(6486002)(8676002)(478600001)(38350700002)(66946007)(53546011)(186003)(8936002)(31696002)(2616005)(2906002)(31686004)(956004)(16576012)(316002)(66476007)(66556008)(83380400001)(36756003)(4326008)(86362001)(52116002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGswaHYvVnRhQ0JxVEgvcDBqV3ZGMmNqaGpaMHYzSlBnQkZlZ2Q3VngyV1dw?=
 =?utf-8?B?ZXhMeUxuRFA4dVg2QlpSaVgzMnQ5RjYyVFR4OUlMcHlOWHNWaGgwNElJSnpi?=
 =?utf-8?B?dytSVXQ5VGhZMWNDeC81c3FJdkxTSDV5ZHl5dTJVWEZYczZUaE0zQzhsbVVw?=
 =?utf-8?B?MVVQNU5JdmJxRmdjbzI1S2t3R2MrZkVGUW01NUE0ems1VXdEeVgyMkdvcXNa?=
 =?utf-8?B?RDFiNlB1Qkl3c2w2bnVzeCtFL09oNkErcXEzVGtKVGNjTkZSRGRHRUh6VWZZ?=
 =?utf-8?B?cjlQeGhJY1VveXA2YVdOV0hGb0JkV1VIV3JHWU9FWlBrUjZTZ25KZ1FlYTJz?=
 =?utf-8?B?V2RsZEIwbjlXOEhSSHFtdzVXSDBHMHp1dHV6UGtITXFsS1o2WjVkK2dFdXBM?=
 =?utf-8?B?S0J6RXRnYmFQK3pEYi9sRzdxQ2J5cVFwRytUb1BFMGVCZmFxSWd5Tm5YL0dD?=
 =?utf-8?B?VTVJOVBrV1FQM2Q1QlYxOThudjVOaEcrOEN5S2ZDcFVieXJBK2pxOVVtRlBn?=
 =?utf-8?B?d2NzTUM3MExSdWZrWkFqVlJqZkZubVRCajJNVzlmT01ZQjdwT1FiY29DRmhi?=
 =?utf-8?B?WEZjc0tLUTJaNTNYVHZkZE5LaWx4Wk5GbzREN1EzeSsycWtNdzJ0NXVobjVv?=
 =?utf-8?B?TWI3Mjk5d1VaZU9GMXFnZjd0UzZJRkJENDFrUHB2K1p2WFlKMHZIUW9JanIy?=
 =?utf-8?B?UGNTODVoNEc1akZtWmcyUkYyS1AvYkpSYlR5UmhKUWQzOEpSc0Uzald3WnJI?=
 =?utf-8?B?cXRmYVlIckRtUkJabkpzRkpwZ2ZDczBBUDhUOE5nRUNqb25ZZ1E5b1BrM0Fh?=
 =?utf-8?B?QjUyK3V1RXU4YnltTjBVZm1CeHdORFNveXNQV2VOaUFzeHRlbmJuY1JoWXRm?=
 =?utf-8?B?ZjB2SUhXR2gyeEIwdm9Ldml0SnQyZkRxL2FYNFI4SXFqRHVGNVJEZWM1OWV6?=
 =?utf-8?B?OHNOY1J0U05DckdidHVaR1ZLeGtFM2poMjFoSDBFazJtYzlCRFFxVkh5Z1Bk?=
 =?utf-8?B?STVWOWcxQ3hGTGxjZDVXaGVPY3RreFdrU053VjV4L0ZlMCtQU0xUb2FsQjR2?=
 =?utf-8?B?MS9GS1RqQnU2MEpqTVZNbktMb3hUSXNkem55Y0RjTi9QYS9DTzAzRnE5N1pJ?=
 =?utf-8?B?MVBlbStSZnVOM1BwN0FENmhwc3E3eThKTzBTakhmTFB3YTdMTzJMOXJ3REs3?=
 =?utf-8?B?MmVPUmg1Y2M5V0E0TlBjZHZQVkd0S1B1NG1BTkYxT1hFWmswN1lLT0xVampM?=
 =?utf-8?B?V2lzRU0xYmkvaG1kZkpoUURhdU5sVlZRTVVjUm9PRFVYTjBKbCtseVVpZHEz?=
 =?utf-8?B?Yi9SazZXKytoQjJQMHNIUWdYN2RXcTM2TjF2RUJVYTc2NWZxb1dKNlBKWXFl?=
 =?utf-8?B?blZWRU9qZjI4b1JxV2RNejJMWEM5QVNXVUpadjFDcjI0ZlNTeWJoQjIzV1NH?=
 =?utf-8?B?WXNYdG1ybmNsTnlBMmJob3NRL0dqUTBMMERidmJCNEQyaktOM2xBTnVIZTN0?=
 =?utf-8?B?K2E5dndnRG0xTFhncW5LS2JCZk5mZlh3RTBwS3cyanJhdnlYVUpNZWlrd2Y1?=
 =?utf-8?B?R2VhbXRZejVDL29TR2VzR0liT24rL1lhSjZDMU1EUXRKUTJySlp2ampJUE9i?=
 =?utf-8?B?RTJFcHlUZFNCV2w3czI0V29peDkxRC9TaURCeGQ0WStmYnBoN2d5YXp2K0Ux?=
 =?utf-8?B?VXBxV0ZIUFNiWXB4UVVvR1VYZTJRZ3ZJVEg5dnI1RnIya1dyci9NOHZzaWE4?=
 =?utf-8?Q?GvLk9PlJbhtt49+F+j7TAF8LzImh9i8cpZd+/GP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 533e9dc5-0e8c-4318-ba3d-08d976cef5dd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 15:55:51.2314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wnchtXayphMq7uU7zpDneVWKEXJ4RnL4FXLxSb3zbo7JlciIXidZV8sqOCg/tBNWGP+jHcdm8uc7N2i87HxqxUFX5B+qp0CS6pUR0IV4M0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6437
Received-SPF: pass client-ip=40.107.7.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

13.09.2021 15:43, Hanna Reitz wrote:
> On 20.07.21 13:38, Vladimir Sementsov-Ogievskiy wrote:
>> compression_type can't be used if we want to create image with
>> compat=0.10. So, skip these tests, not many of them.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/031 | 5 +++--
>>   tests/qemu-iotests/051 | 5 +++--
>>   tests/qemu-iotests/061 | 6 +++++-
>>   tests/qemu-iotests/112 | 3 ++-
>>   tests/qemu-iotests/290 | 2 +-
>>   5 files changed, 14 insertions(+), 7 deletions(-)
> 
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> 

Thanks a lot for reviewing! I'll resend tomorrow.

-- 
Best regards,
Vladimir

