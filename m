Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734483024F7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 13:33:31 +0100 (CET)
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l413i-0001XO-6I
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 07:33:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l411t-0000vv-Pn; Mon, 25 Jan 2021 07:31:37 -0500
Received: from mail-db8eur05on2116.outbound.protection.outlook.com
 ([40.107.20.116]:39521 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l411o-00030w-1F; Mon, 25 Jan 2021 07:31:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZ3GzhnF6wm3DyOkRYk9kzxqy4HwYkCfLa115K0Tf0PWDZU7BPXWD1OGFWp1fDVlMFkv8h4C5sKDW9xpoOgMT4acEnojuqq90OH4Oq7i8iJYdbRWbh/klCwAmDGGiPkytthmbuv22IEbgROyO4A0CcS6ybIze9zEaCSTDWpHF73QAmODCR6e75KecSch1OvjmtHJVEEo9FZLOqEiua+PFw6IjkRtuR6EvHmAtyXBWtA7hWYVxQbGZVdUgkActkv+8qTpaDDm4dk/vy/fHju2bMCS/0btvXKzRsIzcHwArzf81Wfg9ugru4uLHxeawtO2lru2xGqcHzoCzyJ9Rdpt7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raHGvNRDus+YLVJrd3bLJpSzTAdtnD9Q5dGO0JitJIs=;
 b=IjK9WLCKJr9a85Nbr/KRJvJG7zzX0TW+qKJMSo0tNFO0GfBJWWAmzZtLTPhhKFPD+WzoQH8aUaGAtZZ8pFdZhu5/x/TYApXWDQaYkyteoFSqVQy2tLZ7Lfagk1C9BYbUtIdIFbfNATEcI/0uxg5ABZ0fjdvTJC5MJ+DplyclUc/pqjzjxGnwUaH1G6eK832itfzrzzqOzujhFxqhx/rbXnXLASCHxi+v28JhMzY+JLujv2fk53tn+hzgtIKwqmHYqbUiricRti1buspTrxFoKqjJhRT1dkr6SUFyGQH1gm4DcNFLVXpvnHOkHOsh2H9DMOynXmdPXsV++ZG7k3PIwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raHGvNRDus+YLVJrd3bLJpSzTAdtnD9Q5dGO0JitJIs=;
 b=H8qEKlR4nEJp0QLGaB+gCopqy+o+odnHngjXfKUfab9y2+K0waO7xR/bDq6k02rI4sutym620QUV1am6f5VWJnDXeHdbxs5YyN5WpHbyZumM67Tj0ypsbSC8J0qnGmQxrv9Gkxrjap0Xx5bvfNWzfsCeFlgROTNDlxYdu045PfY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5029.eurprd08.prod.outlook.com (2603:10a6:20b:e7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Mon, 25 Jan
 2021 12:31:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 12:31:27 +0000
Subject: Re: [PATCH v7 10/11] iotests: rewrite check into python
To: Kevin Wolf <kwolf@redhat.com>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-11-vsementsov@virtuozzo.com>
 <20210122160804.GJ15866@merkur.fritz.box>
 <0cee83d0-c77f-b2ef-3c42-648d217ad9a7@virtuozzo.com>
 <20210125120240.GA7107@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <22fe65f5-669b-0a23-a473-12bfee586de6@virtuozzo.com>
Date: Mon, 25 Jan 2021 15:31:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210125120240.GA7107@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.113]
X-ClientProxiedBy: AM0PR10CA0031.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.113) by
 AM0PR10CA0031.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Mon, 25 Jan 2021 12:31:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1fcfe55-0ead-42bb-e169-08d8c12d2283
X-MS-TrafficTypeDiagnostic: AM6PR08MB5029:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5029612CA925444C4C42BFA5C1BD0@AM6PR08MB5029.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pdX8F7XUmtkOjM8OOB+bTY2t9gyn7whSdLuVwxQ0Q1j1lwvnF68Mfsjxt32Or1Cn3io75EnM+UFOQirGKSVBnaF2OW1vjBKqo3EN6Ty7xbi3m0FW7QymSFZPaihyOC1W1v9LW60phz3EtaS98nuP2z10zDtDXiBNnJFCu9CdxQAI5l51H50FhlYXnfPHj9ayZ3qdBKkqk0yOFRZnZmz2jusq+ntxb3witVOlrF9jTYcEiHLZ38u2zi6Ob46/dndpSQMhgbzdYbWo0P8kLmjpqh+dmLMs+VzPr//Ne2K1B8zwT2ys8ChoFyxvCesJ41geAndokly5x+hfowLLcsq5UIbvEPKNs0IfMVQw3ovEZbwgP7qzMEYl0BeIG0XhmvguhwMTNnMEYULKBkHFCUpWlKTm0WwPeYg57CkmD2DmiYTaiI0GFRK/3eCH6udd4PevK42BFGsGulDHyW1HnEgZtktTjrkyXp4ag7NZ2BWWwTE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(346002)(136003)(39850400004)(2906002)(16576012)(316002)(6916009)(86362001)(6486002)(8936002)(66946007)(956004)(2616005)(16526019)(26005)(5660300002)(66476007)(186003)(31686004)(83380400001)(31696002)(52116002)(4326008)(36756003)(66556008)(478600001)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ck5WV3VUTGgyOTBWdzI0Q2tpTVFnenVEcklZQkp6TWJtenpsVGhRQWZzQW05?=
 =?utf-8?B?RmIrZ2NQdkNVRFhRU0hTSUZwVHkwaFgxZzdDTHNJeXQrL2MxWmFiam8vRGtl?=
 =?utf-8?B?b0FlVW5yUFpPOXNUMmhpTjRuaklVQmY3T0NyLzlXWkkrQk5kTU9vV2ZGeFJX?=
 =?utf-8?B?cVV1NXNtK3U2TUk0c3dtRHVOM1lpckpRcVRqYVlnTW9HUEFrUkIybDlHTzgy?=
 =?utf-8?B?RUVYblJjeHpWK294SjlNbnlycVdQaDRueThTemhVQWxkMXN5amwrQkpWS3Vn?=
 =?utf-8?B?UHZZRlJ0VlAwN2xDRkkydm5pZ29uOFRLc0dlQWVHSjErMlg0NHdWaXdJRmFP?=
 =?utf-8?B?c3FmcTgwdkdLS01BaE1vcUhzYmQzazZTR25sVUNuL3JRTTlnQzFzM0wvU2lP?=
 =?utf-8?B?R3NVbkZ4MGkvbWhVZUF6OHhyNURPTG1sbFFDeGdiSTc0REFVdUN2NSt5Wmtw?=
 =?utf-8?B?c3YrcklCOWFzWkFFVWI3MEV2Q3VtRFd2STVjNE4zRzMxWnBJekdxTGRwWmEz?=
 =?utf-8?B?Ylk2UFVXZWw5aUVOMkozZC96YU1xem1IbGNuUGRrMzVWSWdMOGNNNm1TR2Ji?=
 =?utf-8?B?NEM5N09GNlc3em9mNjRiaGFlMUpMK250NHBuRlV4WlVwVGZHOThpbUhmTnE5?=
 =?utf-8?B?YTFFQUJhQ2tWT2tTQ3VvTE10SWFsTjlqMXQ0RXo4YjZUV2drd3QzaHkrYW56?=
 =?utf-8?B?RmJ1VlNGT0VJRnBOVkNoRm54N3ZBYzV0eUgwV01zNzJGZ2lpZjNpc1hLcFBV?=
 =?utf-8?B?dm1pMUdDc2tFKyswc2tGT2RmZFI4Y01abHFhUlMzU0JLVmlaVnNkb2lUVUFY?=
 =?utf-8?B?S04vVlh5b2p6M0hFcFBNMzA5VGQzNUFnMGZWRzZVNGc0ZWFya09sY3owVHhV?=
 =?utf-8?B?TlBjTUhVVWdmTjN2ME5aOXZFTlpCRUg1S3BFRUNzSlNHZkpPc1ZnalJnNFow?=
 =?utf-8?B?NkVhU3V5d3g4dzVmSHNSanpmVUduOXlsYUI0ZXdaZlc2dTJpUzl5Rk1MMzJX?=
 =?utf-8?B?d2QwVld2OERaL2RjMnJ4NjRXUU5kNHFvcE9kekw0SGxrN0ZHQnp5QmkrSkFD?=
 =?utf-8?B?cHhlbTY5a0dCV0tVS1pkd2kyT1Zrb0lQL2FNYk1aUzdFM3VQWDRuM2Z4WFU5?=
 =?utf-8?B?WkhyeUJVTUh1OUdPTFVXR0JjcnQvblVTckNtcDNuUHBuVGhDQ3Vxd2dvR2NS?=
 =?utf-8?B?SXpEZng2RjM2dlIxMThLc054dVpFQXBMbXR1d3Ftc3UrZHFFK1M4eVlPYURM?=
 =?utf-8?B?ekRPckZxRFRMU3ZBL1Q1QnVWOTZJMFF1Tk9VRnZhOEUrbWZRbmZzMEFlakNY?=
 =?utf-8?B?Y3VwQ0ZSVUNaeXVEemVvSVhDN1p0VkgzakF6NWZKYlVjclczQzI5bXU1anZw?=
 =?utf-8?B?S011Z2RYcFB5UEQ4RlI5SE1vZDA3dUFKZEt1RjVOVTVIN0RmNW1VdzhvMjly?=
 =?utf-8?Q?tmV95Erf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1fcfe55-0ead-42bb-e169-08d8c12d2283
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:31:27.2848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4Ge5PMv/+696+TpsoXBwrtPuOzSV2xTARewJSXwXhxHOW/QgNOUJqOmu4GIqO0KhxnTs7TPNeVC7VMtmXN0ajdEm3b8w2b62xGcx9Gy188=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5029
Received-SPF: pass client-ip=40.107.20.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

25.01.2021 15:02, Kevin Wolf wrote:
> Am 23.01.2021 um 16:08 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 22.01.2021 19:08, Kevin Wolf wrote:
>>> Am 16.01.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> Just use classes introduced in previous three commits. Behavior
>>>> difference is described in these three commits.
>>>>
>>>> Drop group file, as it becomes unused.
>>>>
>>>> Drop common.env: now check is in python, and for tests we use same
>>>> python interpreter that runs the check itself. Use build environment
>>>> PYTHON in check-block instead, to keep "make check" use the same
>>>> python.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>
>>>> diff --git a/tests/check-block.sh b/tests/check-block.sh
>>>> index fb4c1baae9..26eb1c0a9b 100755
>>>> --- a/tests/check-block.sh
>>>> +++ b/tests/check-block.sh
>>>> @@ -69,7 +69,7 @@ export QEMU_CHECK_BLOCK_AUTO=1
>>>>    ret=0
>>>>    for fmt in $format_list ; do
>>>> -    ./check -makecheck -$fmt $group || ret=1
>>>> +    ${PYTHON} ./check -makecheck -$fmt $group || ret=1
>>>>    done
>>>
>>> When I add an echo to print that command line, it seems that ${PYTHON}
>>> is empty for me. Is this expected?
>>
>> It seems to be defined defined when called from make check. Did you
>> just call check-block directly?
> D>
>> It's not intentional, but I think it's OK: if PYTHON is not defined
>> let's just execute check as self-executable. And for make-check PYTHON
>> is defined and correct python is used.
> 
> Hm, where does that happen in 'make check'? It seems the old makefiles
> were quite readable in comparison to what we have now...
> 
> Anyway, I think 'make check-block' should run just the block-specific
> subset of 'make check', without changing the behaviour of the remaining
> tests. Anything that can be started through make should respect the
> configured Python interpreter.
> 
>>>>    exit $ret
>>>> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
>>>> index 952762d5ed..914321806a 100755
>>>> --- a/tests/qemu-iotests/check
>>>> +++ b/tests/qemu-iotests/check
>>
>> [..]
>>
>>>> -            if [ -x "$binary" ]
>>>> -            then
>>>> -                export QEMU_PROG="$build_root/$binary"
>>>> -                break
>>>> -            fi
>>>> -        done
>>>> -        popd > /dev/null
>>>> -        [ "$QEMU_PROG" = "" ] && _init_error "qemu not found"
>>>> -    fi
>>>
>>> I think this else branch is kind of important (if there is no system
>>> emulator binary for the host architecture, find _any_ system emulator
>>> binary that was built). I can't find its equivalent in the new code.
>>
>> Hmm, I decided testing "first found" emulator is strange.. It seems
>> like we have several emulators and user don't care which would be
>> tested?
> 
> Remember that we're mainly testing the block layer, which is the same in
> all qemu-system-* binaries anyway. So yes, any system emulator binary is
> good enough for many test cases, and certainly better than having no
> system emulator. Differences are only in the supported guest devices,
> which may cause some tests to be skipped.
> 
> If there are multiple binaries that we could use, we could change the
> way to select one instead of just the first one, e.g. by trying x86_64
> first because this is what enables the largest set of tests.
> 
> But anything is better than failing with "qemu not found".
> 
>> Probably we should instead used qemu-system-* binary only if there is
>> only one matching binary. And fail if there are many.
> 
> No, 'make check' shouldn't fail because I built arm and ppc emulators on
> my x86_64 machine without also building a x86_64 emulator. (And I think
> this is a case that fails both with the actual patch under review and
> with your suggested change.)
> 

OK, I'll send a squash-in



-- 
Best regards,
Vladimir

