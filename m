Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7212830022C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:59:04 +0100 (CET)
Received: from localhost ([::1]:36864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2v5j-0003Sx-Ds
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2v44-0002vw-G1; Fri, 22 Jan 2021 06:57:20 -0500
Received: from mail-eopbgr10105.outbound.protection.outlook.com
 ([40.107.1.105]:40199 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2v40-0005cS-W5; Fri, 22 Jan 2021 06:57:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ML7xWvPYQIj7pRpZb7yGoGZod800CS79FwsJxeJKKLl1uyPczDNp9LpjJbMaKG5Zy38jOb1ei9/jckw7ACX3pmuL68efxayMCXNuNILkltm10wkT7XhniRjvRTSfmVJ0Jx98Y5/VfHvqpHbae73UOV89H/vJ6SWERElbf/jX1+JIh9ZCc8IvjR8/1VaGihErAqsNYKqpR0tGg6x2seRxXSmMKnsz5/blB/sqQbPCmTDNfTVF2SNm4eXjKDgHHFQDKedM2qcP8b/Sbu4vncZdjuwXownJFx7BD4WJypyveTkQKK/kcghsE8XW61t4itualsNIPuYwhPJ04c6DXvWINA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdlvPCA+sWYzo7qMeSR1q69MoWTB3fQbrdux4X08+7E=;
 b=XIqwyrnjJjeCChJD2XdPwCTK6xZpk/AzPX6i/lYmZ+ORPiMUBeECTtwkDaJyLOxRVISuuakq9VEBvi85bxI7YhoW0sJH/mZDUztTNxNh/0cZW2GbX9hWQ/MSYu3MWbDCz92pVbuJQw3/NGYqqlHkRhxDxCH6vZ2dgxZxneffzMOwRDyQMpKpB+ck2NTYpIaQn2OHDtvWj+zKoJSqeJqaA1Wh6wPmNApx49QPJuVNpddRkX0Bfz83A9mDfPYwPa5p61tFeUHopbpUrQUoXTGiqp4CYDpmrY35fMzWKrvJmhnftuflRHGjIUlgda/9mDFhwIpSy1WrkLXb45fReEqESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdlvPCA+sWYzo7qMeSR1q69MoWTB3fQbrdux4X08+7E=;
 b=SC9lSdm9C2DqgFlwOnMeq7wO6pJhFXCfb6D0YggoS0GnGIN89lsmlR6bihvIccRfRVkhQ9mQP7YkI6As8CtA2ahrX5S3tGTGKJOWGiHgDU6EoMx4YMyhbkmBMgbAPr+hWWBUIfsKXdRVpbn6Qf7zAK+8UUfJLjAUj7CK4U43A1w=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB5296.eurprd08.prod.outlook.com (2603:10a6:803:eb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Fri, 22 Jan
 2021 11:57:11 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%5]) with mapi id 15.20.3784.013; Fri, 22 Jan 2021
 11:57:11 +0000
Subject: Re: [PATCH v7 07/11] iotests: add findtests.py
To: Kevin Wolf <kwolf@redhat.com>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-8-vsementsov@virtuozzo.com>
 <20210122114815.GC15866@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bc7e60f2-11b2-255d-2d69-cbd1563a0e19@virtuozzo.com>
Date: Fri, 22 Jan 2021 14:57:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210122114815.GC15866@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM4PR0101CA0045.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::13) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM4PR0101CA0045.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Fri, 22 Jan 2021 11:57:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc93cb73-8ab1-4330-25ba-08d8beccda0d
X-MS-TrafficTypeDiagnostic: VI1PR08MB5296:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB52961235A044BAFF06813B33C1A00@VI1PR08MB5296.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V0n+Q3lau0UNytQ/dj0iMuh8EoHAt8+nj09RoClC5yotaw34Lr6zD0rihK58q5ba9xnYIv2wV9+6sdFwR0hJtFFrZZFPL6EVq4DDi0Vw7q5zDLt4T7nc7CMb4OralC0tJ54u3h0fqw+wza/wQPgzhwlu+0eKD4rNpC9twKDjHkgXEe5iasSiyDJ9rJI7Lw2ukdgPvx5CxKSVNH/7uVQ75wtWwBnTYHFH57JK7/IDKF5yvSyjWHkBwOEGTZlx1ALmitBXJWKgzOK47FrRAjmbMJboZ6LIV5M9JwhnJRFu6Q2rTxCtISiif0oSPhG/pf8vwwZ8/G08cQFGXANDykD6P4+AGnIgn3Ub/xgaEJwm4TpqaqKqHQk+CriBP/d3EkoPKeanEhL0gAQyGKM9li49ZO1o8yGo0w0GyLQLekkbULFO2zPSicg5q5h80fAAg1Mx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(346002)(136003)(376002)(396003)(36756003)(66476007)(16526019)(2906002)(66946007)(26005)(8676002)(316002)(5660300002)(66556008)(956004)(2616005)(6486002)(52116002)(86362001)(186003)(8936002)(31696002)(31686004)(83380400001)(478600001)(4326008)(6916009)(16576012)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bXlKMWl1b1FnNXVTbUJ2WVBzbmpLbHV0V3FKK2FrZ1JlWkN6RW1xV1kwKzF2?=
 =?utf-8?B?ZkdpeUF5eUoxd2kzVUR2WVB4c0tiZjhUZE53NmMwVWNWR0VWaEN4TkpjNHJN?=
 =?utf-8?B?THUzVjBXTmFqcFRwQm42Szh0Tk9JaE14V1pLTVJ1T0U1WG9NS1JJd1V5NW0y?=
 =?utf-8?B?ZWtYY0RFOVZHU05XVFA0cTF6NVhvNWN2Yk9SNHRIenA4NmFZQjg5OVovdEhh?=
 =?utf-8?B?MzhqQzVEdmZLS2pldFhzVzI3dU1iTUM2V3c2OGFMQ3FzTXhpQ2lEMytuYnQy?=
 =?utf-8?B?a1F6NC9jWEFNd21CbjhISTluT0VaVzQ1Uk03dks1UmFHMjI2L0pJTE1Kcm5w?=
 =?utf-8?B?dUxGVEROMFF1ZjkwbEVURTQ4b0JEdC9pbmdReDdOeEdYaThCMStlcGowdVJi?=
 =?utf-8?B?NnIyb2o2Z0ljeVg2YVFOZ0tjZFRtY1Jid2tKdE8yL1lkbzJKQVdCNnBsak51?=
 =?utf-8?B?VGoyZDF4UnFRWTF5MzFoWEVFNkV0RTdxcDc3Ym1XNFhEaXp6cGE1ejliSmVs?=
 =?utf-8?B?QXF5UFRGU1RvbXlxZXpVUXZBN3Q2bkdwRktZbFBYdWhxa09jY1VvaGFIampj?=
 =?utf-8?B?WnptV0ZkS0RkNXRFWFBKeDVQWE9YdDI3M2hCQ1ZHWlI0U1ljYk5IN2Y4cDZM?=
 =?utf-8?B?UUs1MTJ3dXl0aU9ieVFNeTZxbThmRG1KQXNxdDByNmdkbmRjNE9hZjNNNENX?=
 =?utf-8?B?R0FNTzVnNC9MZzkyMnNwR08wRlVFS1FiTUhIbTRHemxtTm5RaDRxKzVSSG9O?=
 =?utf-8?B?M3EyZzA4OHZwOU9mK2ZIbnJndXJwdGQxbUNvTEQ4NkZpcEN6YVl3M0VyeEVB?=
 =?utf-8?B?SDR1MW1wN3BOeFhCYXhtcXQzZVlCbW1sYzlUYnQycWhQdGxaU1VXRjNDZFBi?=
 =?utf-8?B?ZUpVTkNUbXlFbGpLaWwwME55OWpXeTZoTDJQRWxGWXJJZUxlaWVHVXAzQTI0?=
 =?utf-8?B?TGMwSEMvcFNJZERhNDN6dXdEQzdkbUJHOTN3T3pKZXY3VFRsUnljNGI4c0pZ?=
 =?utf-8?B?cUc1bGJBUDR6T01FR2ZqTGMwWUg0WWg2SUg4MDAxbGs2Nko3ZGZyZWJMRTBF?=
 =?utf-8?B?RXVKRHl1M2FZYzNhUmVYRkwyY1pxTmIydHUrdi9LTzBwb1BxblkzbENqbGJt?=
 =?utf-8?B?S3EzWCtsVDUrNW1iT3IzRDlnWjFQNjZBREJoVzEwWllySXZtNTB3RW9QVEtz?=
 =?utf-8?B?RnV2L2UwK3NXT0JUVTg3L0JnZ3ljc0pmZm54MlZBcTY2d0dGMU9rOXJTeXRJ?=
 =?utf-8?B?dlJaUXZLRldyZ3JpK0NZRFcyendRQWNFMm5HMURQTnFhQ1FtWGJJZDF3QTlQ?=
 =?utf-8?B?T0FSemVPR2RnTVBxdFd3REhWejVJRmRQQ3lpai82MHg4NG5FSGhGTEVQR2cw?=
 =?utf-8?B?OEJ4eUhJYUs5cW9qNGtMS3dZVXMwcndHM1pMYWxpWUlsSkVvSWNJd25WS1Fs?=
 =?utf-8?B?Tm90UE85UHQ5Lzh4eDczeDZ1ZTVWQ0pUWExZZG13PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc93cb73-8ab1-4330-25ba-08d8beccda0d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 11:57:11.5926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ByWMGxEq70jT2qEFclCKNl9Jx2BYP9IMRDqcK8FsKtqOwQAzrnEYfBrnhTZP0zRbqIU4ghucojytVNwlLER31sdUPIXRzEsXOjmnElPsGzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5296
Received-SPF: pass client-ip=40.107.1.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.01.2021 14:48, Kevin Wolf wrote:
> Am 16.01.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Add python script with new logic of searching for tests:
>>
>> Current ./check behavior:
>>   - tests are named [0-9][0-9][0-9]
>>   - tests must be registered in group file (even if test doesn't belong
>>     to any group, like 142)
>>
>> Behavior of findtests.py:
>>   - group file is dropped
>>   - tests are all files in tests/ subdirectory (except for .out files),
>>     so it's not needed more to "register the test", just create it with
>>     appropriate name in tests/ subdirectory. Old names like
>>     [0-9][0-9][0-9] (in root iotests directory) are supported too, but
>>     not recommended for new tests
>>   - groups are parsed from '# group: ' line inside test files
>>   - optional file group.local may be used to define some additional
>>     groups for downstreams
>>   - 'disabled' group is used to temporary disable tests. So instead of
>>     commenting tests in old 'group' file you now can add them to
>>     disabled group with help of 'group.local' file
>>   - selecting test ranges like 5-15 are not supported more
>>     (to support restarting failed ./check command from the middle of the
>>      process, new argument is added: --start-from)
>>
>> Benefits:
>>   - no rebase conflicts in group file on patch porting from branch to
>>     branch
>>   - no conflicts in upstream, when different series want to occupy same
>>     test number
>>   - meaningful names for test files
>>     For example, with digital number, when some person wants to add some
>>     test about block-stream, he most probably will just create a new
>>     test. But if there would be test-block-stream test already, he will
>>     at first look at it and may be just add a test-case into it.
>>     And anyway meaningful names are better.
>>
>> This commit don't update check behavior (which will be done in further
>> commit), still, the documentation changed like new behavior is already
>> here.  Let's live with this small inconsistency for the following few
>> commits, until final change.
>>
>> The file findtests.py is self-executable and may be used for debugging
>> purposes.
> 
> As Eric mentioned, this isn't accurate any more.
> 
> You mentioned using it as a way to debug things. I assume this is now
> covered by the dry run option?

yes

> 
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   docs/devel/testing.rst          |  50 +++++++++-
>>   tests/qemu-iotests/findtests.py | 159 ++++++++++++++++++++++++++++++++
>>   2 files changed, 208 insertions(+), 1 deletion(-)
>>   create mode 100644 tests/qemu-iotests/findtests.py
> 
>> +    def add_group_file(self, fname: str) -> None:
>> +        with open(fname) as f:
>> +            for line in f:
>> +                line = line.strip()
>> +
>> +                if (not line) or line[0] == '#':
>> +                    continue
>> +
>> +                words = line.split()
>> +                test_file = self.parse_test_name(words[0])
>> +                groups = words[1:]
> 
> The previous version still had this:
> 
> +                if test_file not in self.all_tests:
> +                    print(f'Warning: {fname}: "{test_file}" test is not found.'
> +                          ' Skip.')
> +                    continue
> 
> Why did you remove it? I found this useful when I had a wrong test name
> in my group.local. Now it's silently ignored.


Because now we use parse_test_name which will raise ValueError, so we will not go to this if anyway.

So, wrong name will not be silently ignored, check will fail, and you'll have to fix group file.. It is suitable?

> 
>> +                for g in groups:
>> +                    self.groups[g].add(test_file)
> 
> Kevin
> 


-- 
Best regards,
Vladimir

