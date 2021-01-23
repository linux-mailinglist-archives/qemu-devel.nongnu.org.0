Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B043301631
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 16:16:11 +0100 (CET)
Received: from localhost ([::1]:59726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3Ke2-0001xn-Ep
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 10:16:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l3Kce-0001Ot-Am; Sat, 23 Jan 2021 10:14:44 -0500
Received: from mail-eopbgr20120.outbound.protection.outlook.com
 ([40.107.2.120]:20491 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l3Kcc-0008Qf-Kv; Sat, 23 Jan 2021 10:14:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cdntah1+aiMe1q2sZPuAn13DHWtAx3WdVh9yhhyB1gKS1KrFiXrkmYW+xONEdOychIEKfFv8aLE7CseksboXzlBDLYo7uGd9VYisWRivSK2zegJnZuO5SExGbjL+gzPi9gEKRx+EsRMKyQZfVjOsY14tSmECGyF1FBM9ltMuFJmy5CB/W2UjD2kYqCrkb7H1+ePua8qPgNatWAe53GzJY4EhbAzaf1DlbgZNptSW7AWsCYkF6Zbbooi5xrKSScj3YPIQ/xGl6iTWHBEUcALvBZnzmzRDN393GqHznnPAZ9TPjSGBRBivI207A19r0SZqKqVqVVoFewWNv2bNJ9Fi0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLbJsXManGlKlco2v/BAScniLHNSCD4YA4iW4wq3R2U=;
 b=NauC9iWrffmPqSSYjaW/va8yNQ4Rvp0U+y+ty67kJmOFGZ00xvDJtC5BgxpLtOt+8M4x7peZ7ozQIZ7VmJwqAuv7AN/P/aTkOwttT7IN654bl4ardg3fmwOdxCfN+xHzI/IzG5Oik3LtMHL+0DYvm3g+B52kDLgQla1USWKSVFbCHFUdaoGq4Y4hjal9uSqef/KCT9TEPTF6ETDI/wr3iKZ3cHQ50fo7s523Bs+d3lQl+aD54w95yDL/9ycbsVJefxJDafgBagZNWMsu3lLUNnxMVotkhwgWSxgSunupy6OJH2HwULi//y/1w+9TsqOPVZnvUFrO3Wy34ADAyMqj/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLbJsXManGlKlco2v/BAScniLHNSCD4YA4iW4wq3R2U=;
 b=YK7ng0GATzAnak9vNKvD+Sge+UANDcGsT1xVEMY0egrDlUtW5fzZlTPD7M8Cylqd+kpk1kARCkzcBlcC03W3RoYgzKmirBZSEg4OlcjpqgLTXGh9khr11XAn9jl0OduBYgzGkngAP54JfpDcd90J+X2PvxT8vgeFtoQd7BbB4mw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6293.eurprd08.prod.outlook.com (2603:10a6:20b:23e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Sat, 23 Jan
 2021 15:14:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.015; Sat, 23 Jan 2021
 15:14:36 +0000
Subject: Re: [PATCH v7 00/11] Rework iotests/check
To: Kevin Wolf <kwolf@redhat.com>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210122161618.GK15866@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5ca1af5e-364f-254b-aa44-a07ae62ebcf6@virtuozzo.com>
Date: Sat, 23 Jan 2021 18:14:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210122161618.GK15866@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.79.161]
X-ClientProxiedBy: AM9P193CA0024.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.42.4] (178.176.79.161) by
 AM9P193CA0024.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Sat, 23 Jan 2021 15:14:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b3967f1-2023-4a88-578c-08d8bfb198cd
X-MS-TrafficTypeDiagnostic: AS8PR08MB6293:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB629353108FE6D22284DC4FD7C1BF0@AS8PR08MB6293.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xadTJqpGGm7oBy1+bqWz2ZcreqXa54SqN+5fCAT5jyBK/QavPBKPTGn2c2+l8QA16u989lhtyxRXHs2NXv6xTLlnVbRRtx2JjBWuj/7voFvopfO4hTy/BpfHppdh+OOlsqEXIUxpR1vwWnjqPbksgHCpzomPEIj+mR+AQWOm9d3HASH6Z84WdIHCzkV8UiGmEY4SfxAXrgjmURaZDfJ28pu4gOqzOxyexCsUPrwIr47fk5yN+zImmIQBKQFEg39FhN8Yt5mxfn4TB+sfO0SBdRzJHD+Ix/4xb1LGtB6G8hDRkpD3LGvdwFz/rAgDJ8GAjsY0Je7tEO6hQwwglfReWjtckRw32x1W2lCZ+uRSdmVK1PuMgJXfzQnBAfjo2o0O2Z2/4d7oNg8DknLLFlH+EK5A3hEYcjvG69b2hCNKnzMozqEO/lrgh+k4OA22HCjtwJI8SyKBCeXamm0CQfhhLzmLGTotIsATQhrNNDRAjks=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(498600001)(5660300002)(83380400001)(8676002)(6486002)(36756003)(16576012)(6666004)(66476007)(956004)(86362001)(66946007)(16526019)(186003)(31686004)(31696002)(2906002)(66556008)(26005)(4326008)(52116002)(8936002)(6916009)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NllQUDhZUWg4OXhSQkg4WkRwSmhHcFdYdnV1eXloZnBza1RHTkd5YXFXWkFI?=
 =?utf-8?B?Q3V3cENqSTJKdnF3dWxyVmRxempUNk5UM3pOdWVUeHF5eW9MdXZtY2l0b0VD?=
 =?utf-8?B?ZTBrNmVNbW5SdXJEWXVpN0tIVW1Pck5oUStMd3JXRjY4bFlzeWhCYnYvaWNq?=
 =?utf-8?B?dEpBbDlvLy92MEI0TWpueU5jcWpDaXJjbnBOL2QycVRiYUlEVHd6VFBGSnVi?=
 =?utf-8?B?c3ZkaE9MZW02cXZmVTVDZTB1Q0pYUHM3SGlsNnR6MHVhK0tid1YxMnhBWlZ5?=
 =?utf-8?B?ZnJxTTlWc1FhVmFNVjRBUllVZ2RZd1Q3cTF1c1dEV2I5TmpCeWgvbDQ5bWRX?=
 =?utf-8?B?QXhLVkV1WjQ3ZFBpVExyeU0wTE5xMnNXa0ZhOXhmcjh6Ty91TXByalpLUmts?=
 =?utf-8?B?OW8wNFNlOHN4djUwR1dEMjlPbkx2RW81TE5pNm9va3d3UEk3d3oyWWlSOWdT?=
 =?utf-8?B?MTVtdjVpRW52RngvY3lGSHpQZWNta2hkMElxL2g0eXVYMzdnazI3eFA3OEdI?=
 =?utf-8?B?M1dFZEhIOUNhdVVoMWpLTGpnV0FNVkVNYkJ3MVl2TEE0VkhyQ292VzZuOW95?=
 =?utf-8?B?a0M1amtJWU1XSG5YVU5IYnoySGwwZFFmQ3V6bms0Y3ZueXdkNXNoeThsZDVZ?=
 =?utf-8?B?MEFaY1JHcVlOVUU3Q1dSb0NGMGVJSm1yZmQ2WXIveEZUQlAxWTFESEV0NkVT?=
 =?utf-8?B?d3hvNU1HbURZRkJhY3ZYZlNOY21kaURVUmNhbDRkZmhXR3R1MkdYMm9WZ1V2?=
 =?utf-8?B?QlppOTBkUElmWGlrUFYyakZyazJZTllnWFdUL0NtemJhRUVWdXdZZWRrSzc5?=
 =?utf-8?B?UnRzZUxYWGRGZGk0Zm9aWDlDQWV5cStwMXB6cXJKRno1VHpZU3hwSjZ2Ti9x?=
 =?utf-8?B?dG5FUTRLNE9lV2VmTm9sMlBPV1hKZHA3Si9NKzZCTGJybUp6RzVkdldMd3Z2?=
 =?utf-8?B?TjRMUjlwOFJteDlORzJ0T2RzdmlXRWhmdGhnU1o0ZFJwMVNGMmVCV3dTaE1L?=
 =?utf-8?B?M3l0elNrcXNpb0x4RTdPUldTTEpHNWxUWmVvdktwMTQvMkZOV1p5dm94bjlZ?=
 =?utf-8?B?eWNjNGdEaEEwcnlEaDAyNWE3S1RobXpEZzdSd3BkVDB0NWVRTGxpY3k3YTE2?=
 =?utf-8?B?SUwzZzIrSitaZ1IwNUpTcWpuZmx3ODZxMTVoYWRyZkVteXhKdGxJUmZPUi9D?=
 =?utf-8?B?KzROdkR0NGEzdVRIYmxNZ3ozazlpb2d2aXUxcFFKT1pkMEFzUUZvcE5oSXVD?=
 =?utf-8?B?c211ckRURjljUVJTdklvRE9OaUQvWTJhQlovZUE4TWtBb2VFcmM4YUN4NXJ2?=
 =?utf-8?Q?x6TVY/mo3tPwehfR0IxeHnEBSyrRrco7wJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3967f1-2023-4a88-578c-08d8bfb198cd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2021 15:14:36.7701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: goTaScO+dRcD0YSQRD08qQZUtBGdC+qu69PMxDLBkhFsQCMAIIRjJPd5abjj1XI5gRStllTl0tAHVZ0CMAH/V5fHINoaGnT6KGZ5r2KmnMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6293
Received-SPF: pass client-ip=40.107.2.120;
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.01.2021 19:16, Kevin Wolf wrote:
> Am 16.01.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Hi all!
>>
>> These series has 3 goals:
>>
>>   - get rid of group file (to forget about rebase and in-list conflicts)
>>   - introduce human-readable names for tests
>>   - rewrite check into python
>>
>> v7:
>>    - fix wording and grammar
>>    - satisfy python linters
>>    - move argv interfaces all into one in new check script
>>    - support '-n' == '--dry-run' option
>>    - update check-block to run check with correct PYTHON
> 
> Okay, I think I'm finished with the review for this version.
> 
> I also tried pylint/mypy again and it's mostly clean now (pylint
> complains about the TODO comments, I think we should just disable that
> warning).
> 
> Feel free to include the following as patch 12 in v8.
> 
> Kevin

I remember Max already queued good changes for 297 in his block branch

> 
> 
> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> index 85bc1c0c85..8aaa3e455c 100755
> --- a/tests/qemu-iotests/297
> +++ b/tests/qemu-iotests/297
> @@ -31,13 +31,15 @@ if ! type -p "mypy" > /dev/null; then
>       _notrun "mypy not found"
>   fi
> 
> -pylint-3 --score=n iotests.py
> +FILES="findtests.py iotests.py testenv.py testrunner.py check"
> +
> +pylint-3 --score=n $FILES
> 
>   MYPYPATH=../../python/ mypy --warn-unused-configs --disallow-subclassing-any \
>       --disallow-any-generics --disallow-incomplete-defs \
>       --disallow-untyped-decorators --no-implicit-optional \
>       --warn-redundant-casts --warn-unused-ignores \
> -    --no-implicit-reexport iotests.py
> +    --no-implicit-reexport $FILES
> 
>   # success, all done
>   echo "*** done"
> diff --git a/tests/qemu-iotests/297.out b/tests/qemu-iotests/297.out
> index 6acc843649..85213ef96e 100644
> --- a/tests/qemu-iotests/297.out
> +++ b/tests/qemu-iotests/297.out
> @@ -1,3 +1,3 @@
>   QA output created by 297
> -Success: no issues found in 1 source file
> +Success: no issues found in 5 source files
>   *** done
> diff --git a/tests/qemu-iotests/pylintrc b/tests/qemu-iotests/pylintrc
> index cd3702e23c..980bfa7b20 100644
> --- a/tests/qemu-iotests/pylintrc
> +++ b/tests/qemu-iotests/pylintrc
> @@ -9,7 +9,8 @@
>   # --enable=similarities". If you want to run only the classes checker, but have
>   # no Warning level messages displayed, use "--disable=all --enable=classes
>   # --disable=W".
> -disable=invalid-name,
> +disable=fixme,
> +        invalid-name,

Max just disable it in 297. I think we should not disable it globally, as additional hint doesn't hurt (except for test output).

>           no-else-return,
>           too-few-public-methods,
>           too-many-arguments,
> 


-- 
Best regards,
Vladimir

