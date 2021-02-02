Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BC830CCAF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 21:06:35 +0100 (CET)
Received: from localhost ([::1]:51580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l71wX-00086g-7z
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 15:06:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l71tl-0006LT-6m; Tue, 02 Feb 2021 15:03:45 -0500
Received: from mail-eopbgr150135.outbound.protection.outlook.com
 ([40.107.15.135]:6020 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l71tc-0006uj-M1; Tue, 02 Feb 2021 15:03:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2RABx2/twnPQI+jVG5VzI6BkdyEljPnPIXpYPKfgP5npWphbHKqs6RZzKSAmITLgxECHCZDiunPOJhLjMGaAYSgHwiLPj/a7yrbm9uVDY8L+jwPHOjEDOYdv98R9Jbk3om9HCUnCsriNr1uumXKaiGQGtpXebE9Tcv5ro8lNxeAjmy+NwsGxEvMHeG+CKQfoP2tnJ4RvcG3OOpEaTreQ1R0CYc//laSEvVj03IC3zdzhKcILbqxwFYs5ElNsJQRvbKDFyZYdENDX40dxPfYFvP9x1Ge0TQJ7BLav0ej4so4sSrb8NaZw/nsmSgM8UsRLv9pouqoivpQLC5nSn1/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWIp8kRscI1x+7DvWHb/YBm06/+B4UZmp+EDwQZC1DE=;
 b=LmGNkLEJZEkDHeGDKNAIRM+jNH/TTE4sizNiJOmZb8+KwWvglv1EqFci0BTV6ZjuAfPRbvDVopaKtqIcvuDxJ2qO5S+OGrgZl5ObIctm0Smjdk2bw0bgZeKXoSdXwgLUmu3dlAaafBW/dA3CUr2TqW9yrz8RFMBKYdhL8oJStETm2cwR/lBZtnoEDjCN+OCgaYlzHZeOQopI09OUs6DBp3jhzjgLu3FYkoSLRJDICMWSj4dVedJLWSDzca+OdEW1CfPySlUQv+zKLUj+u951QSUoh/0WjvCWggtb37eTK6MiLwkc1WATtDaHG8wtdhZ+4zAoVjKEzmGdKvID4lWedQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWIp8kRscI1x+7DvWHb/YBm06/+B4UZmp+EDwQZC1DE=;
 b=krH4OnPoozkOZe4YXtpGtBhyzfxy/xpA6PEc7rRmWxAIbnNqwiH8Lj26QAXNWuLKTMNM3AJ+WeuE7fvXbLksbi5LpK+RSn4hjt9OhA3rdMgWPnkpGmfMpFdaoBqFRhXDG6m4XRMJLKQ/yAwugxkOX575S32qO+HJZb1d5kDD07w=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5079.eurprd08.prod.outlook.com (2603:10a6:20b:e8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.23; Tue, 2 Feb
 2021 20:03:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 20:03:28 +0000
Subject: Re: [PATCH] iotests: Fix expected whitespace for 185
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210202185914.614705-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4c0fc5aa-d7a9-728c-24a8-e0aafc5a791c@virtuozzo.com>
Date: Tue, 2 Feb 2021 23:03:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210202185914.614705-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM0PR02CA0005.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.137) by
 AM0PR02CA0005.eurprd02.prod.outlook.com (2603:10a6:208:3e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Tue, 2 Feb 2021 20:03:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10eb5918-fac8-47c0-fe0a-08d8c7b59b4d
X-MS-TrafficTypeDiagnostic: AM6PR08MB5079:
X-Microsoft-Antispam-PRVS: <AM6PR08MB50796C387A2D11AAAD6D6EE2C1B59@AM6PR08MB5079.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7AEdatlpAsTa3XVunqFOy3v6wyf1EeCWcD4yg5Z7ZLlb95KjBMg0n0lP08uGSUbO3CJoR6jHZOW1WwZFI9r3WZ3OedN6Q+q+bIVH8VEw7DpLji6HI4uT92vEgVt6FJlC1fkw3MqZEX4StL9BE0hzSIur9HxsPsJI1GJIL8xMGbNT+2IEeFq6jAnASVDStaQ2UoRCosEyxBmOL8agSi0Xk6rdtqkqeGeJuShJhwrd6VhptA+RIZQKGiKaO06jlL+icu+PcnIRqzJdbgGJS6Q9tytK2Z6IhRG2BgbDb94LziUnDMmPRrK6lgZacyvVkMmISQtpNM1yc86lnfy1Mjoe0DgsviWRJHuyPG5slQJOn/dwMXP3MGXpefRtCGFn1Q2tBSJtTyKDW7IGmSf24kflDStjguPPSyNM52/eHjH86Wqo1iiF02wjSxE0JUv5T7xnp29qjPfaKA7jPamqHYIx07giNlPJl5Jj5BUeNxal5vg9Dz07rsrzsocnIg6AALryuH7bECEMachvEx2Hm06S+VsTvesrP9448Zh38IW2XqhT/OMIPreSoBfh60js+YRbSaBJqYdKUwedFaXnjVakvCYpdx87K7vHKFsl6tEcgAY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(366004)(39840400004)(136003)(26005)(31686004)(186003)(8676002)(66476007)(66946007)(16576012)(6486002)(956004)(66556008)(86362001)(16526019)(31696002)(5660300002)(2906002)(4326008)(8936002)(316002)(478600001)(54906003)(52116002)(2616005)(36756003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VW9SNG1vNVZFVWNLR1J0QWc4U0RRck5rMUtWZEczUDU2UUswSGVQUXpTbUts?=
 =?utf-8?B?cHZsQkswcDh3STNPUEdNOHV6cS9QNFpyNTdxbEJJQWpnNmI3SU04VThGUi9r?=
 =?utf-8?B?VnR3YWFwaFh4T3NsOE9VUTVDWnBycjg0N3BWWXZTUmd4My9nWnFHNzI4Tzk5?=
 =?utf-8?B?dUZwTDFnRjhBMm1vZDRNY2dpMEhuME02WHkwdUw2cjB6aFg0eEwzbk5tczFK?=
 =?utf-8?B?bU0vcDdJcmh0WmczbjRnS0d6cFhmcTNOSXFNdXNjbXcvTnNoeUdUSFA5Wk5I?=
 =?utf-8?B?MjNsNHN1M3FiQmJSWjAzMGRCUm52NlhqUnZ4RGtGQUJMY2xBVnpkUXJMMk41?=
 =?utf-8?B?ZHY0K1p3ZGhQZTREWG9Uc3ExKzNJb2dSVGY3TzdXWGs1cjVHMnRzaHYzRlFm?=
 =?utf-8?B?anF5RXJUZG5kZ3RvQVhtL3FncEFRZWRGaU9TaklBZ0tTR3c4ZWZUL29WSmJN?=
 =?utf-8?B?N0xrNGFPZUYwaDRTTzJUblVOc2RSVmNHTS80QXVpQnpVZnE5Z2szdHJxeG5n?=
 =?utf-8?B?a3FKSnJhdEZ3MUphS0lzVlRqb3Qwcmw2TzZJNjFsejV2SVdHQzlsd08xR0Z4?=
 =?utf-8?B?V2p2NjVjV2xwaTFxWFNjOW4zTUgvOFdCSzFhTmh5bFJXczZWQkMwcnRieW9k?=
 =?utf-8?B?dzZ1RnFoY2JpNTZOemlXLzNjc3o2NU9BUVZWOS93NGlTZjhPOFNFODRZTEVm?=
 =?utf-8?B?R3pqMGdNdlNrN1ZjY2VpdUN0UjZNdG5aYU5lOUo2L2FES3g3MUFlT3F0TU1W?=
 =?utf-8?B?QU5CUThraWdCSzZJQ3VJMnIycHR2d2NWeThKOU9sZkZJWXdMS1JlZjloQVBD?=
 =?utf-8?B?KzRwVFQ4NjU5UUtFeU5naThPK0JOWnN0MCtZMlhYcjBzdk5UbXN3MHRRNXdp?=
 =?utf-8?B?bENBZGdhc0J4a0YwNEpWaEFvQnVKc1J3Y2ZwQm9CMGVQSTVlZGxYSVNOWi9V?=
 =?utf-8?B?aXFCQ3MwVGxUeEI5b1RwbHFVWUZQTG1DbDhhSEVEKzNtUGFtNEdMQTdyb0Fs?=
 =?utf-8?B?QVVXemp5OGNra1hlRVR4cnlBR3V3QTdXNTR6MUltY1pGL1VCOWxjb2lnR25l?=
 =?utf-8?B?U0haRHY1MjA4NkhzNnVGUlB3TW05ckVjenNuZEJ6aHlSN285aTFVNmV3eHhX?=
 =?utf-8?B?QkJGN2g2bjhKbkJDVFM2TGJOSDlTTDhUR2loQ2YxWDBCdUNyUEJSRzVFWnE4?=
 =?utf-8?B?VjRycEVHQm5YbHBZMUhDNzV2OHR0N0pYZkFqVWFSZjVyYkdMcmlVdzJDbXFi?=
 =?utf-8?B?ZENlUHdwR05kamFFdVd3c0NHNkNYREIwMGRZcFlYdEtyZTNNbXVWZiszdEFp?=
 =?utf-8?B?Wmw2bGM4c3RwaUs3TTIyK1RzMkljeklOcGZUVUk3WnZUSDN5YkFGOU4vcGhp?=
 =?utf-8?B?V0Z2eTdqc01kNGFDZnNHQjhtMDdTanVBZkEyRXFwN1p0eWttOCtyMzlydVRG?=
 =?utf-8?B?Tm43MnJoZ2o5b1M5RXBnQ1FwSkxONktxQU5pdnB3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10eb5918-fac8-47c0-fe0a-08d8c7b59b4d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 20:03:28.2757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAZ24qZoTHaX94vK3F355Ar+DRrFyXfsHBj1JB1+eY0YyU9A7AGQiMdcFIt880d7Do72IHazMEiJGxcmmm9cusa/lDN4gB40QxWTZzn0y2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5079
Received-SPF: pass client-ip=40.107.15.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

02.02.2021 21:59, Eric Blake wrote:
> Commit f93e19fb03b adjusted various iotest whitespace discrepancies,
> but missed a test that is not part of default 'make check'.


Actually, at point of f93e19fb03b there is no x-perf at all, so it's not a miss in f93e19fb03b...

Let me bisect it...

Hmm, seems, it's wrong since introducing this line in 61623f82153788e

Why was it wrongly added - it's a question.. Looks like something was merged in a meantime, that changed how qmp log looks like.. And original patch was made before that. But I don't want to dig more :)

> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   tests/qemu-iotests/185.out | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/185.out b/tests/qemu-iotests/185.out
> index 9dedc8eacbed..754a64125865 100644
> --- a/tests/qemu-iotests/185.out
> +++ b/tests/qemu-iotests/185.out
> @@ -89,7 +89,7 @@ Formatting 'TEST_DIR/t.qcow2.copy', fmt=qcow2 cluster_size=65536 extended_l2=off
>                         'format': 'IMGFMT',
>                         'sync': 'full',
>                         'speed': 65536,
> -                      'x-perf': { 'max-chunk': 65536 } } }
> +                      'x-perf': {'max-chunk': 65536} } }
>   Formatting 'TEST_DIR/t.qcow2.copy', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=67108864 lazy_refcounts=off refcount_bits=16
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "disk"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "disk"}}
> 


for the patch itself:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

