Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65A62F5A9A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 07:18:35 +0100 (CET)
Received: from localhost ([::1]:52540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzvxq-0007VO-HY
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 01:18:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzvvi-0006XL-B2; Thu, 14 Jan 2021 01:16:22 -0500
Received: from mail-am6eur05on2102.outbound.protection.outlook.com
 ([40.107.22.102]:16996 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzvvg-0005Yw-5n; Thu, 14 Jan 2021 01:16:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8UEIq+u6MBo+R0J2lozGSaJHM4D5PDzxO75diRWgoOlvte6vaZcR+HMmG6C5J2Pfl9GpzOunfaaewwsEk6I+UGqSh9lit7NDfZ48wz7LJgoGITNSmHa1dYOWO52PrIvAxfEN97co5mM9l6DnwXRaqPkPpYfSRqmDVP6w3Gy2u+erYe4O+FA2FROfyogeKigKHiA1rkg61ATH/ST4FapykJUY6SnwoCPqRQbcfUpOUJgH6SiE9mleMclrgCPKl/leS2Vb3m4qVmT4ePT015q/v4EtSm1K/6XjPZl8u/Y1ufEnr5+zz8ZFAADWBGYVS8oCDFuaZCBhgxrUqkQLvf/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5oMgz0oB2RX0O2lK72MVLclfKUtaHJkf98JndTv3IA=;
 b=nZQunKOTOg9AO3sZnwDXu01xb2WDHWkI0H+MCb0lrlj5d7mc6SxrnzwTNWfDU8ttnOb9vAo4x4yV0Dok9RS8QkOEb/rqAAKeNBtaQnkXKUgZ6u2eXX1UaTQNn9g96AR5yQ6ooU5/s6T2R02xsT+0fpfH0vpQCyWzlTDhARiCZAVStraDfoLbh5apyUTlqL1QgrQuJUlKiHjCMEVkglC208ofwcuOcgmIevcGfiVvAKkEmZVDpuwomYlxADX1OcSKwMrY0KsKDDXrD5rxiAWogB4NuFi1CVPy0jt7X7eawHzml6VSxzRuuv/gzRB7W7kGOg/RPeJ6R20/4X+pQda/0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5oMgz0oB2RX0O2lK72MVLclfKUtaHJkf98JndTv3IA=;
 b=JwGhO60ZWkIpUXpd+Xc1fqdzi09yKuhuQZwLoiB7EMk7vqnY5uyJ6g+7pt439QvuYglUtwVXXIldjbxtwGyvE5XPT9LzBXkwFuj62xhut/ODN7PnmfYpFRjphknuzIyN/oQPCEhCBUd2x5ZM6GbokCUjw+6+Yod2ZUTCA1DSN9w=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5496.eurprd08.prod.outlook.com (2603:10a6:20b:de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 06:16:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Thu, 14 Jan 2021
 06:16:14 +0000
Subject: Re: [PATCH v6 08/11] iotests: add testenv.py
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-9-vsementsov@virtuozzo.com>
 <20210112173626.GC6075@merkur.fritz.box>
 <186c6a87-9abb-a6ae-1555-e7395573c674@virtuozzo.com>
Message-ID: <ece13ef2-bbb1-f017-9cac-2b897ec75f98@virtuozzo.com>
Date: Thu, 14 Jan 2021 09:16:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <186c6a87-9abb-a6ae-1555-e7395573c674@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR03CA0098.eurprd03.prod.outlook.com
 (2603:10a6:208:69::39) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR03CA0098.eurprd03.prod.outlook.com (2603:10a6:208:69::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.11 via Frontend Transport; Thu, 14 Jan 2021 06:16:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd645c2e-3c4c-46a3-7c83-08d8b853e5c5
X-MS-TrafficTypeDiagnostic: AM7PR08MB5496:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5496CC8B0B65EFAB6E919E20C1A80@AM7PR08MB5496.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R6j+k52pWyfWN1Brbf5mc2K/XkLjY/fMxX6M9/rGG6aqw0hLkI8JAF5VWbsUa01VQkMV9X2nq4DC0YTlTVkOqLOo+69sdxHCkakwj5iKhJ2Rjx1EW3uDX2xoLGqvXfq+LoDiKueCnlUfcgBq2rMBSTan7xTIULr/6x69luHI6afq8jfOXA3Stk56JdM2La1oPJBxYeaFenT7egB88wvk0PWkE/eeCgWMsvlhkYXT3qXINU5tZcgmUPNgWrOaZjt3Rmbga9x2winccsq8s8Adqa6xpAV82Gq2X+Vg/S8YyiJEWF9fvvbFT7vqJhNC0aJsi6wijKU1eCS/NJL2TW1U6de4GLfeJUPH0/0vchAU3dCrzuzxTMQbYa70ZroB2Ku417KWUyktzzxayJyJHlmQMd9TwZ0xJQPHr/mUuHGc3+rZNt3YaTzpCdXT+/E3tDxj/M1mk36xqbsvUWHmMI8MWUwBhVffj92U099nrFHfdEk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39840400004)(376002)(366004)(346002)(8676002)(31696002)(956004)(36756003)(478600001)(66556008)(6916009)(26005)(8936002)(2616005)(6486002)(66476007)(86362001)(31686004)(16526019)(2906002)(5660300002)(4326008)(16576012)(316002)(52116002)(186003)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VW5XT09ZeFN6Y2Z2eU9yL0tBckM0TVZBeU9QTlhadHJONG9GQlpFdk9EL3RT?=
 =?utf-8?B?MVBHS0hwSk8xd0NZRXhlck5hRjZmSFN6K3dkUXRsNXE0dGNxL1B4Rm1iRStv?=
 =?utf-8?B?NjgwN3NxQzFXb2k0SGs0REpLbVNoWkw0QndNNTNJVVZmbks5RndnSTBjOTJt?=
 =?utf-8?B?OGdRd2MvdHAva05qVzlkTUEwT3htVnhSWXpuSC9vektHdGxrd2wxY1pRaHBF?=
 =?utf-8?B?eDBmTXEwNXJtbnE5NFNzdE82Q01EVDFXcTFjRG11aEVXZ05MMmsrMEdjL1Jq?=
 =?utf-8?B?d2Vka3BjZGVxaGRJZG5RNTFJVTY4dlJLWWxYUjBHUEpMNHVablZVdzRpVmRr?=
 =?utf-8?B?eFcvbXdpL3lBcWhpUXkzYjZ4THVsNDBMK3ZVek5JNzdNbnFlUmcyTXJKdHVS?=
 =?utf-8?B?bEl2SlRRdnBBaHVZYjFVNmpDWmI1RVZSTGdiWmgwTWt0bTFSZ05ETHZwQ1VN?=
 =?utf-8?B?TE15Nk00NTVRejZXWjltbEYvSkVqOFRua08wWlhNU2dBS05mQTdpUEUvT0lF?=
 =?utf-8?B?aWdPbzVGaG9xbXEvUEFPMWNBVHl6QWFwaFpmMitEUGphUnN4TytaRjltWTZk?=
 =?utf-8?B?blUzQVhhdlJGdWxuOGlhVG1Xdk9aOHcrekJUZTRLODZ0NjdRbUZ2ek1nTmZ5?=
 =?utf-8?B?Z09URW1zSnR5S0JxUG1JWGpvK2kxeGYwU2IvUmhyMFZLTlRnR3pZdUdVZ1o0?=
 =?utf-8?B?L1BZK2c3dFRtWndubmpMMDIwa1BFcjV1ajVmc0trVlF2SUQ3VmNIaXJEdkg1?=
 =?utf-8?B?dWxqLzRhaUFaWElDVEEyV3huOUl3WHJDNUh5aHNhN1RxZnVkaGl2cXBhTEIr?=
 =?utf-8?B?VWpBdjRGNGkyeUoycUMrUzFSelVmSWtjaTdRcThKSnlXMFB3U1QzVzkxdFRD?=
 =?utf-8?B?TENWOHZFMC9LN2tKQ0lWRGdWQnB6dCtyclZWNjNxRWlPdDFYZDRXMlBIZTgx?=
 =?utf-8?B?UWZmakNvcU5sczB3dEE4UWZQUVBQWHp3cjRDQnI3VTlrQWVNbUc3ZUtCZmpV?=
 =?utf-8?B?QjBBOFNzckZ5cWlWSzdXRlpEb2JhbXZ0WGtHamJBUE1xNWRVVUlXV2RwREsy?=
 =?utf-8?B?K3Jaay91aW1YMCtYbURqMG1kT3hCVUtQYWE1eHI3MUJmZTRpZzhoT0lWVjAv?=
 =?utf-8?B?N3BaTitvU1lteU5GMWFDSjRqRklWZUVVWkU1R0tzRVNjcEE3eDF2Umh0VnZO?=
 =?utf-8?B?OXdqQ2ljNEljZVRKOFYxamp0LzRwMC9VZjI5QkFmdFdOQXF2TUxTRlpiYVhl?=
 =?utf-8?B?OTZhUDM1ejZZeUt5UXRxQVlvdDZDYU1ZNWM3VStQc3U4OWNNaWRvQ1dITzVl?=
 =?utf-8?Q?cLkWSOt6HPtPcbu0IO3eq2Oc+g/Gnr80HU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 06:16:14.9193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: cd645c2e-3c4c-46a3-7c83-08d8b853e5c5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sp4P1vF71Ia8hxuolmWzt0pySCNoIfw7k+tZIa+pgJXs3R6kw31W1xYJVNtzmAeMwx/HlMpYyu7F7aBp5z+QAEKZmsOBh1jl1Lf5nDXMmJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5496
Received-SPF: pass client-ip=40.107.22.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

14.01.2021 09:14, Vladimir Sementsov-Ogievskiy wrote:
> 12.01.2021 20:36, Kevin Wolf wrote:
>> Am 09.01.2021 um 13:26 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>> Add TestEnv class, which will handle test environment in a new python
>>> iotests running framework.
>>>
>>> Difference with current ./check interface:
>>> - -v (verbose) option dropped, as it is unused
>>>
>>> - -xdiff option is dropped, until somebody complains that it is needed
>>> - same for -n option
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>
>> +************* Module testenv
>> +testenv.py:48:0: R0902: Too many instance attributes (34/7) (too-many-instance-attributes)
>> +testenv.py:212:16: R1722: Consider using sys.exit() (consider-using-sys-exit)
>> +testenv.py:214:16: R1722: Consider using sys.exit() (consider-using-sys-exit)
>> +testenv.py:324:8: R1722: Consider using sys.exit() (consider-using-sys-exit)
>> +testenv.py:1:0: R0801: Similar lines in 2 files
>> +==findtests:45
>> +==testenv:72
>> +    _argparser = None
>> +    @classmethod
>> +    def get_argparser(cls) -> argparse.ArgumentParser:
>> +        if cls._argparser is not None:
>> +            return cls._argparser
>> + (duplicate-code)
>> +testenv.py:294: error: Function is missing a type annotation for one or more arguments
> 
> Interesting, I don't see "similar lines" error in the output..
> 

Ah, that's because I added a newline in findtests.py. Add it in testenv.py and the error comes back.

> 
>>
>> I wonder whether we should just disable the "similar lines" check? The
>> instance attributes one looks kind of arbitrary, too. The rest looks
>> valid enough.
>>
>> Kevin
>>
> 
> 


-- 
Best regards,
Vladimir

