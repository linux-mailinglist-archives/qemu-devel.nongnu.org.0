Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77A3380E8A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:59:44 +0200 (CEST)
Received: from localhost ([::1]:37930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbA7-0006Pm-TT
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lharJ-0005Y8-PT; Fri, 14 May 2021 12:40:21 -0400
Received: from mail-eopbgr20132.outbound.protection.outlook.com
 ([40.107.2.132]:7139 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lharD-0003oL-H1; Fri, 14 May 2021 12:40:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOKopsPRXQEImheuOUIkavGatE0hCQz1eA0MHrtWZPJEb/yfhO4J3RWCiinL7qsieGMKUXyMs9fx8MaOEIXy/p/yFlpFghbSz8ms9kJT/FfwsF3ymespJ2rCZeI+PdtMcGWt7jbXk+kiV5LiBSDzYCxoWqugGJIkFt3fgF6KoOaVksTLkxK8ZNqAGBlWQCi7e+4P7/HQf/uDhl6NmJvvSf+4ULuvGWB9mMPCGRpaaPmE2fuoXp17bp9NbK5iWlkrG34KW4Dtv0G9tD6qmpeJtuHj2q83LFlj5n7oPyglVoVOZUUn4EPuGNHcgIhNcf+IjRsCm9ZXD6QgHUvrep1JQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htJMkFFHrDKEmqu9X5Q9hzGjybPaze6mRY7ZbAfn/MI=;
 b=beORlR6WNTelHYurIaL7X/vLLaWvk/UH3dHGqw1zzYYFa/z0xDr0xXu6aDhCkfczlHN3UDiHMr/LBmZS05M8lfzFPFJ4z0JwoWfDaUEi6j0SvSmp0gVcbpQMcyMjacDyGpXYlxrmcB2M++Aow/azrV9Q2CML8XwV3WjCOWEUIU+wL84SUypwGeyU0lwceWNmNur+bFTZcFQhKG5KkiGG6D5zZNH/5NA/YtPW4BvqjGsbhHtyDRAyxWHEgxgpwp9NQ6hsdERrX3RJcUKVNN1HxzDLzO2NYAPLr/vzi0rOHjufIC2OU+pYaqm5t53BIgQVYuBed/SzivtJ+Fl+bM3nFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htJMkFFHrDKEmqu9X5Q9hzGjybPaze6mRY7ZbAfn/MI=;
 b=tVl4QKd4GZz9nHZJMyycf8teiMjcRMhWIDF6dUHo1wCDE2SJQ0MCUUC+0wlvZooGX6767j7XXQbpiKsaZ80WSFm/KG8MH6+joLgtNhcLmj7WNW8EIU6hAHXWKPujWd8O5thNl4P4DiWB2nA/lqZ0cDTi3Jp9XDpmI9x9eW9Ebc4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.27; Fri, 14 May
 2021 16:40:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.026; Fri, 14 May 2021
 16:40:06 +0000
Subject: Re: [PATCH v3 3/4] migrate-bitmaps-test: Fix pylint warnings
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210514154351.629027-1-mreitz@redhat.com>
 <20210514154351.629027-4-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <dd0c6b92-d081-1e30-ba7a-8b4240b9a62a@virtuozzo.com>
Date: Fri, 14 May 2021 19:40:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210514154351.629027-4-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.249]
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.249) by
 FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Fri, 14 May 2021 16:40:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67a6ba6d-1a82-4cd0-4e5d-08d916f6ee31
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6904BF8AE300ECADF19DBBFDC1509@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: En1y2cig6cDYo8L84JHX3dcm7vRjcpaIQdaWN3qxlG1LY1K1rVj7kMUD5cFGQjrXeqsvoZZXhmce1oInYIWJG+KK1YMkm+pHDTRUlEt0RPMXa8xwj60UI0TofzxpzS+8BQ4/nqML6dgtGRkrvhag5qAqMOt1JYuWpof85Nc8pg8LPKhw6azYQ0H77mbV1kolce018qxNgQD7SYtHL8XL/wcZnhfaeW6oJBBH3i3KthomiN6LuT04uz5bCDAVfyZZ39gaewwIVyv7ZpNqL0AXepfPOjWVDFU4ga0hAXSiOht6Dp7goMYjz2wdv/MKvsH/iVHkLkGL8+CIvM36VWA5uptGLGXNwyK6FH0bgk8Wn9KVePPCYj2IsJzh4Mdzgrvo99tuLxk4vJ2ZxkRWsRqfFgGiXLOqnxP8kwmQ3N04ilk1WklLi+0iNGdbrG/bVI2T0h4SpA/PN2lpBRFWLUA3AJ1c2NzXebSlVS/9FY3FlZ3eKAMnn60iCMYm4mQikNijZUMvZm0pN8x9UCnneEosXw5HoWh0zWE8LqNWywp6yOA6vrtV3nY9z9yO/hx/v0j3NHg/A+oHK1pt57neY2Dg1s5DzyriofwH32GEuY/l8Yyh+qp6mlACOGQk+5ifVsJzJ2WTvIig5nq9tLwqRFL8lqDVCJS6pfF4EaLl8/QpMfgadD8sybWI2tVsRn9+ngIGXyBY8/nzWoy0BjIkjBwCAzAa2TYgm+5+uUwFv+sNvPM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39840400004)(366004)(136003)(2616005)(6486002)(956004)(86362001)(83380400001)(8936002)(31686004)(26005)(31696002)(478600001)(38100700002)(52116002)(4326008)(38350700002)(16526019)(16576012)(66476007)(66946007)(66556008)(36756003)(316002)(186003)(2906002)(5660300002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QVYzSm5yZ1E4WlNpd1FSUGVKazNMcm5JRUN4SFB5ek5pbCthTlhkNWFsOGdm?=
 =?utf-8?B?NVM4L2FYTXBaalVCY0UwZmJhY1RjeUdSUmhRTlB4ckhSUDdBUGx5QmZvSXRM?=
 =?utf-8?B?OVVDU0RHQXBaakJKaFZWSnh2cFJjYUtnQUxsekNYVkV1QnpiYTdwYksrWHU3?=
 =?utf-8?B?TzZLRzVZTDhsNEp1ZWdhbHRndlVidkY4eS96VTU1dDlYeTBQTHNqOXZMdkhm?=
 =?utf-8?B?S1JSQ0FTZFIwelBnT0cveWRRK2ZHVnlGQ1hCVHRpblF1RHlKV3NpRXdqWWYx?=
 =?utf-8?B?MFRQbUEzNm9NNUV6NGZSb2VRUGppaTRDUzJ2RWtoRi8rWEoxSEpicnk3dHp2?=
 =?utf-8?B?QTdzV213QmtEZzdaNThUZUxoeTRMaUpydU1GeXJYNnQyby8rNTF6NHFMR0Fz?=
 =?utf-8?B?V0UxeHRiaTBzNDdQWGlEcDF1VDhGNmROUHVudlJTRzU4Y25TOXU1b09jdFlE?=
 =?utf-8?B?MGdXY0htbXpDL0xTYXB3bHllVWhUR05DUUNleXM0SmxrdEhqdHY2aWk2TkxP?=
 =?utf-8?B?djBOUFQ1S2FQOG1rUWJ6bGh3NVN1b056SGJjbFNOdkIxb2xlMjRUWkRSMzBE?=
 =?utf-8?B?K2F3N2UxeXdHKzlvMUxUSE5PS0VoOWtvSkRkSXFTZGtQdnZyTFpRbnB6VFdq?=
 =?utf-8?B?Uk9jeGw2V2U3VkVnK0hxVWU2aUhuOWFkUTF2WTBjSDZvRHZOeHVNV1I3ODJS?=
 =?utf-8?B?YjVTZTVxc1RvUGc1L1YrSkdzWmpBenlJZlJFdjhRcnRONWlUalFlWjNleEJa?=
 =?utf-8?B?YTA4ZGtyYkVXa3QrREE0OE9wNjg2SlVjQ3psNjRuT1RlNHN6UXFrd3VoR1ZI?=
 =?utf-8?B?eFhiVlB1c2FMVkdHY204dUlEbFBmUXVUckFIVzFicUMwbHV3MWZUeG9nUWlP?=
 =?utf-8?B?cmMycDQvZXVaN096MWtNRXU5ZWNsYzY1L2VWZ0c4YkhTWDFHVExDMmhQVThE?=
 =?utf-8?B?MGs2aDNiL2ttbVVLV1gyamNYS0FLcGpNcEN2NUZQZTczc0YxZVd4K1VTcklH?=
 =?utf-8?B?R2w3b1JEWnpHd3gxOGVBdlpOWEd2V2x0VzhIZkRmK0JtbGxRMzJ5am53VWU0?=
 =?utf-8?B?UlhSakxubG9vTHpHaUZUalFQTURPbC81STE1L2F6TzQ1OEMyMFd3VVZRVUFQ?=
 =?utf-8?B?MTBQT2FxUHMxcGVQOTZrSkJueURLZUprRU5EVEZicyt5R241bUF6MTBoK1Fx?=
 =?utf-8?B?M0xhVW84dVVVcVJCa2J0YUZDNkxTc0lycEpUYWFUUmZlOUNkRzNQdFgxMWJJ?=
 =?utf-8?B?RFVNSXZOZ2pqaGN4VTJDdlpDdGxaeXQyV3hSYTVXaVU1NVNjZmw3TWV1bmlo?=
 =?utf-8?B?aGUrNUhuejRuUCthSzdqZ3NDMk44RVRyQWJ0USs5aEt1RXgxVFBTaHRDdkxr?=
 =?utf-8?B?MGM1cEJOSVpHTDB2UDdCa2doK0ROVVZrYW5xRFNndWlHZ3B2U3lxUk1HN3Er?=
 =?utf-8?B?Tjh5b2htYmxYdDhxUUdKMVRSckZ1YkRiY2ZPQkhjUGQyckVmd1hDRnV2TDEr?=
 =?utf-8?B?cytPY1pMOHdrYmNTTlFHemY5end1OGV0RkQyNGJFVnJtWU5VYVVJSlVDVy9E?=
 =?utf-8?B?K1dCKzdpRHhlNHlIWmcxTXhQNlpiWEZPL0Y3K3JnSi92aGNlVVJ0Qzg4TlJV?=
 =?utf-8?B?a0lpLzUxNTZzK2lTbThiL0Zwd1dtU2UwSDIxNzhIZ21STnh2T1BYY2RGc0N3?=
 =?utf-8?B?eTNZdWkxZ3p4WkFCTU16eUh0bW9FZE5Fa0t3ZVlqYTZwZ0pSQ211MGNxRDZh?=
 =?utf-8?Q?wQejoEqynkZYjBbihgHR/aX4Yyv3P9FLsZT1RWT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a6ba6d-1a82-4cd0-4e5d-08d916f6ee31
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 16:40:06.4257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hJSmdALSna7Fah+ooyLbTK5GOh1XgIQeYI5vF3CxYWJnXefgazhxASeu5yKHI05kWZXHRbnfGpdfAuRWhx2L1Zjfpp80dQ5ycqIqfsr+Gg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.2.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

14.05.2021 18:43, Max Reitz wrote:
> There are a couple of things pylint takes issue with:
> - The "time" import is unused
> - The import order (iotests should come last)
> - get_bitmap_hash() doesn't use @self and so should be a function
> - Semicolons at the end of some lines
> - Parentheses after "if"
> - Some lines are too long (80 characters instead of 79)
> - inject_test_case()'s @name parameter shadows a top-level @name
>    variable
> - "lambda self: mc(self)" were equivalent to just "mc", but in
>    inject_test_case(), it is not equivalent, so add a comment and disable
>    the warning locally
> - Always put two empty lines after a function
> - f'exec: cat > /dev/null' does not need to be an f-string
> 
> Fix them.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---

[..]

> -def inject_test_case(klass, name, method, *args, **kwargs):
> +def inject_test_case(klass, suffix, method, *args, **kwargs):
>       mc = operator.methodcaller(method, *args, **kwargs)
> -    setattr(klass, 'test_' + method + name, lambda self: mc(self))
> +    # The lambda is required to enforce the `self` parameter.  Without it,
> +    # `mc` would be called without any arguments, and then complain.
> +    # pylint: disable=unnecessary-lambda
> +    setattr(klass, 'test_' + method + suffix, lambda self: mc(self))
> +
>   

Interesting... I decided to experiment a bit, and what I can say now:

The actual reason is that class attrubute of type <class 'function'>, becomes a <class 'method'> of the class instance on instantiation.

lambda is a function, so on instantiation we'll have "method", and method can be called as obj.method(), and original function will get "self" first argument automatically.

mc is not a function, it's <class 'operator.methodcaller'>, so there is no magic, instance of the class doesn't get own method but just a refence to class variable instead.

So, let's modify comment to something like:

We want to add function attribute to class, so that it correctly converted to method on instantiation. lamba is necessary to "convert" methodcaller object (which is callable, but not a function) to function.


with it:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

==== my expirements =====

# cat x.py
import operator

class X:
     def hello(self, arg):
         print("hello", arg)


mc = operator.methodcaller("hello", "Vova")
lmd = lambda self: mc(self)

print('mc:', type(mc))
print('lmd:', type(lmd))

setattr(X, "test_hello_direct", mc)
setattr(X, "test_hello_lambda", lmd)
X.simply_assigned = lmd

x = X()

x.assigned_to_instance = lmd

print('mc attached:', type(x.test_hello_direct))
print('lmd attached:', type(x.test_hello_lambda))
print('lmd simply assigned:', type(x.simply_assigned))
print('lmd assigned to instance:', type(x.assigned_to_instance))

x.test_hello_lambda()
x.simply_assigned()

print("x.test_hello_lambda is x.simply_assigned", x.test_hello_lambda is x.simply_assigned)
print("x.test_hello_lambda is X.test_hello_lambda", x.test_hello_lambda is X.test_hello_lambda)
print("x.test_hello_direct is X.test_hello_direct", x.test_hello_direct is X.test_hello_direct)
print("X.test_hello_lambda is X.simply_assigned", X.test_hello_lambda is X.simply_assigned)
print("X.test_hello_lambda type:", type(X.test_hello_lambda))

try:
     x.assigned_to_instance()
except Exception as e:
     print("assigned to instance call failed:", e)

try:
     x.test_hello_direct()
except Exception as e:
     print("direct call failed:", e)



# python3 x.py
mc: <class 'operator.methodcaller'>
lmd: <class 'function'>
mc attached: <class 'operator.methodcaller'>
lmd attached: <class 'method'>
lmd simply assigned: <class 'method'>
lmd assigned to instance: <class 'function'>
hello Vova
hello Vova
x.test_hello_lambda is x.simply_assigned False
x.test_hello_lambda is X.test_hello_lambda False
x.test_hello_direct is X.test_hello_direct True
X.test_hello_lambda is X.simply_assigned True
X.test_hello_lambda type: <class 'function'>
assigned to instance call failed: <lambda>() missing 1 required positional argument: 'self'
direct call failed: methodcaller expected 1 argument, got 0


-- 
Best regards,
Vladimir

