Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C43B470B74
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 21:07:24 +0100 (CET)
Received: from localhost ([::1]:37488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvmAs-0006ux-P1
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 15:07:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvm8u-0005zt-34; Fri, 10 Dec 2021 15:05:20 -0500
Received: from mail-db8eur05on2138.outbound.protection.outlook.com
 ([40.107.20.138]:8801 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvm8o-0006Fg-7Q; Fri, 10 Dec 2021 15:05:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SC0KcULgPH2IUmtQyNKDX7UgfH/9uTRP++q2TLwnGqjRel9ZzJBvF0HbJpCeSOsS7FclrFh31UtVk090RTYf+xTXJPxZvYxL4IMpQiRQUvPBy7UQMkhiA0mpf/xWnLkv6pjeZCeF/aR/X+HROAXu4xvOWMw/iGa7xxr7eCgPPqIcCiSeCS5jtLH+pNNPcasXCmxgjyPPZfnWccjfkN2KD1ULHhvYSlyNcEH5D0pRx5pzXP93Vp21TYAEcJUeCZ2QpfiorKs2lrtfKpUJS4QxTZeGnKRB8zQNMaPPe4z/y9Q5YMxNJUDKZqHkqrfLBZM7x+5tYAjSSiLnAhDu1olaqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V25nGYncOkyh4B+mjG8xt01vqQpCAzVbYaF2murPXSQ=;
 b=NiQjgNUe79cc598h75/YXOl1BhEulmaT2TT7wZVmV0sY0MVCGYhakjKtfRxA0QrPlBeP/JipbpnF/pbikjNmQouevs4R9y3uz6VZnfIRSfmClPu1UbjMjMCSYRll/cAewOVniT6vhUAfW2s/etrbR7ube0FL7yXgpyOrX0Kjch/GJ2W2YLJHZI5ZGfM2vKFV2iYGajQ/BUZ9G4U/nmlhlD6wnd7WMO/3gg8lj3L142y6ifjlIWA9rlSrlmGNvtH9HQcQhUAnN/T0bM81hDhZR0dGxv7TyQtkIwFWQxCrmYODkyoutS61tRH55Evyr5lckz1exOIsVpkanuKeAv1ckQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V25nGYncOkyh4B+mjG8xt01vqQpCAzVbYaF2murPXSQ=;
 b=FaTCq0I4/EAzLX42mO9roDVAEeXIMb58amDa5/aspS/jCKkJwnIkbSnyntq0kUuLNuA39eAFWo6jucRsFqOHrcU6vbXQ0ZCpkqJ8py2pwm0B2lVrnccO5XyBNDzuqtLGPRnetAqZprkztYdOwMQi4avVEmTPaTFWbLP3j9E55og=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4435.eurprd08.prod.outlook.com (2603:10a6:208:144::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Fri, 10 Dec
 2021 20:05:10 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 10 Dec 2021
 20:05:10 +0000
Message-ID: <7d998cad-019a-a3bc-6beb-3debaa41c955@virtuozzo.com>
Date: Fri, 10 Dec 2021 23:05:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/3] iotests/testrunner.py: move updating last_elapsed to
 run_tests
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, den@openvz.org
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
 <20211203122223.2780098-3-vsementsov@virtuozzo.com>
 <CAFn=p-aAB9TXcJkm_cNtAowz_AjWeTvFgyL8kZ7E4zyDqMxF_Q@mail.gmail.com>
 <YbNjcA3GVWbN1SHI@redhat.com>
 <b18f421c-fb4f-9305-2113-12a5e829048d@virtuozzo.com>
In-Reply-To: <b18f421c-fb4f-9305-2113-12a5e829048d@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 20:05:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1d10d8c-02bd-4e90-87b6-08d9bc185ecb
X-MS-TrafficTypeDiagnostic: AM0PR08MB4435:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB443568AAF218BB782270E738C1719@AM0PR08MB4435.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QXPeelCr9DmZFAKKNMHkVMbvQXSHuRVbZFaFgpxkgt8Q7nv++uE0wpPvbOO2FlZNNSq/N8TM1oRmqgvJ+Jtb5WBxy7/nrxBXnsc4W0Bs3gE9bGuUhsViOmHdCE43G/1AHCax+FIYnZLjWsZHnFD7ciDcOsk/AONdrYM/YEA76snFfH3VlHbQ99tWBAAa/3cDK3gannHrTbOi/dq7EfM4CfCci3E3/Mr07kRyrEXUaHXNJp7DkQ1iZzgFE9R4SFCnOHfKGGnaIVUInQEY2V1/IIzbdiVReIeMNVYzPfYiCbYR7PflrR665695goBC+xWpH4v/r0QNERWFYO8zR+y6Uo04LviIUzBfzjqlA/+LbaV9b1woGSrZc9PW9DBGFp696eRaHHKNWrfNHb3RPgPN/RG56jIfuU0bxp6kz1Qha9YanJj/HY5NTu2xvyuTYKLdWQCqbMVh7O9+/M1LXBBkt361Jv6lJmvSQizolmBdAItgFH0OBxgyE2jpRTblBnH9VSQxkHFFi/CfQHHlK6WRxX5wmXeVVUbhOxDiPqQTuGH857RUKinzj1zi0MyO7Xs6GREmHTP1pGV3ap59vaIvq+mt7ZCFdmIuM5876RVqftjsbro2k17P/UPJE6vEKJ1KtUOHTAX7SOIm6JMii+t4zzrhtNn2wo5QzN0eL9EL5vNA1C10jfxEYg9XbHcref0lM69lDU2IbXKRfgQR2+pzpSGVpyhM5XW/c9L4EqkrFQKu30b53FbG+0MsjY0vIbGQU4V3OdrwZok9SaztRuPOIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(16576012)(110136005)(54906003)(36756003)(8676002)(8936002)(186003)(107886003)(6486002)(31696002)(38350700002)(2906002)(38100700002)(83380400001)(52116002)(86362001)(508600001)(66476007)(66556008)(53546011)(66946007)(5660300002)(956004)(31686004)(26005)(4326008)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHN3U1dRUi95RVl1Zkp3bFBzck9LRDBQVGZCTGF0eHQ5VDBOeDV1aHBVUUw4?=
 =?utf-8?B?NHR5TWV6RXlMNGZGcmJrNkpwYlJxV0MrUGoydk5tTjltTUd0eHVsNEF6Zk5n?=
 =?utf-8?B?L1VSTi9od0JrNmN5eUZKUlMxdVQ4UEd4VlFTUGRzeTVHSkQ3OWhyTGs2Vlpn?=
 =?utf-8?B?Rkt0RVprSFVYeEF5b2dnL0FTemx0ZW1nYi9LTDJZZEhSSGJpQ3U2Yk5udXJP?=
 =?utf-8?B?UElQK2VRTDVHa1VMMnpkRHllbTZGb3lyOGxDbU1WZndBVExLZ25SUmYxcExD?=
 =?utf-8?B?d0h4dGJzci9sVVJ0c3ZGSHNVYjAydkYyb2txWkdBVXpwcWZKVXFQUzFHYitW?=
 =?utf-8?B?ZWk1ZjViYytzMFl2MHB5cWNURFMxYUxzVHV0R2VJOENHU2dmRTNhVTZjQXJY?=
 =?utf-8?B?ekZQd2kzdXBmNTEzSGtJTUpIdUoyTTdyU1p2cHZnVUJBd2ZianlUSnlMeStT?=
 =?utf-8?B?SmdmSWV0S2xSaVpRaU8xMGZwMGlSYnhJQnhpYzczTkJOK3U1TGtTYUZueER2?=
 =?utf-8?B?aENITWtneTdEcjhySUt4bURWU2tDd1g4M0wraWRTYURQRjdTMXdCTXVIN09t?=
 =?utf-8?B?VnUvVGNNalBpNXRWNklmZGpNd2xVRGxVYkcxYnhZeHcxS1YxNkZiVy9HZStx?=
 =?utf-8?B?NS9pdExiRUxCQW5NVWx2cmZRTlkzM0JaeWw3SnVXTG1IQzVpNXVzU0VlWGNB?=
 =?utf-8?B?ZDlFbXZsNEN6M3lkL2xKYmZsZml3MHJRWmFWeHcxMUgzcFhjR1RLTWJCRFA2?=
 =?utf-8?B?UjBsL3BvZ3pudTB2dUxvT3FaMkdLb1BWY1JGa2VPM1p2QXdLUjFPc2d0NWZk?=
 =?utf-8?B?QzNnVGQvRTZtY2lIK04weXJySWN6T2hrakJuTWxGZHZyb0tMOTV0c3E1d2wx?=
 =?utf-8?B?TDRVZW4wN1VhMzhXeFo2cmNOTkJsVDVHRDNRd1YrQzBqcDhKMllrS1RtUFBB?=
 =?utf-8?B?M3MveTJFbjNFTENSZXF6RkduQlBwOGI2SW1sbUxPdURXK01jN0ZJMVg2UWUx?=
 =?utf-8?B?UEVwWUJWUWI0ZlgrUGdCSi95MnQyQkpUWmF3emxETkYvWjU5UVI3OWxpU0No?=
 =?utf-8?B?QktEVlpmaXBOYzNueWd0bUx5YU1vVzh5aHFqN2lUK2Z6bFh1TVEwaEJ6Q055?=
 =?utf-8?B?ZmwrNmc2dW05aGtXUzZxVjJpZlBOVkNsSkE2UHBEMW1kUTM3NjZ3bU1rTFJN?=
 =?utf-8?B?VzNOMlVlbmtQVnhoOFl1MllPaGVMcitDMTFGclhQTFBFT0hqYjZvblArTGtN?=
 =?utf-8?B?YU5PdFcxU0EyNmFENU1TV214UHFuTHNDbWJlNXJ3OFl5LzBHVFZqeU5LMlB0?=
 =?utf-8?B?Y2JHSTQ0MkhQM3pHT01ieVg0VU1xOXc1N2FHUDc3OGRha09hMjZjK2wvdEJi?=
 =?utf-8?B?RGh3akhlYXB6K3ppckUyekpralUwcHVUZ3NEOUVueFFRQWtTTW9CaWFoZ0JN?=
 =?utf-8?B?NFlDWlEvUTBiMlVZQlI0eVdDNTNWMDYrVE9tdDN1bysyOHdvdDBNQ1d1K1ZD?=
 =?utf-8?B?c3Nyc3VpNGZyQ3dEU2hiNjNLd2JhaDFKSVlOZEVtZFZiQVBjcmtYMXQvY2R4?=
 =?utf-8?B?K3V6dTRsYWlqZEs2KzJsYlYvSDMxdTUyY3RWbzNncmlpOWNQVG9KbC95NldE?=
 =?utf-8?B?MFBwUEhjUC9pY3BUdTJTNnVzTEpUcURsZkpNZzBHZWluUUFwbnFYWThPcE1W?=
 =?utf-8?B?Rk94YmdWdHRuY2UrTmhPTFFONFBMRkZWV0pxNnQvZmlCVTBJNjVJbHN2N2wz?=
 =?utf-8?B?OEsvbjZJUzNyS0NxcGRKR2x3dGFvQ0R3ZUgrN1A3eDlVcXgwQVVSVEIrekRD?=
 =?utf-8?B?b0NNRjNYdlZFNldxcGY4cENlTU82ZW4zUjRCWTREOTZqSTJQcnc1dU5ISExz?=
 =?utf-8?B?SCtxWFlmUllsY1VTTDdlM2lHY0pQQTRRZDNuUjA3S2t0UklRaFcvY1ZaMGRn?=
 =?utf-8?B?OHU1L0p1Q1l1enNKaDdWalFYTEx0WTRueWNiN0V2S2NuK0JQd1hEbVNtY1RC?=
 =?utf-8?B?eGlYdkphbFpmTXo0ZXFCZ2VSMzN3OFdFWi9Hemg4RUpWQ3JkUmN3YmVUdmtZ?=
 =?utf-8?B?YVRneXI1MHJRK0ZqODdwU2RUT1VMMFVMV3I5cldtcmNjdDMzdWxqSzZFa0Rl?=
 =?utf-8?B?Si9BZlFldXI1d01leWZLbDFrYnp0TVZQTmNOaXFQUXZKUWdwMi9EN1QxSStq?=
 =?utf-8?B?RFNJTzFsWGN1TVh2Nk41UEV1MHdmaVVSLzBpS3E0Z2NLbW1pNVlab1h1TXJ4?=
 =?utf-8?B?M1gyY0ZuaXhCUkZ2b2g5ZmNIRzlnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d10d8c-02bd-4e90-87b6-08d9bc185ecb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 20:05:10.6374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJyf55LzxUmvPjQd6ZHY9/p3llehORp/j4N3QHBYMP0NnIFEBwlT4DiwWzUMCUCTZlE8ZuuuDzMJWFTC6ef2xe0p7fms3E4aA53yLx1v1D8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4435
Received-SPF: pass client-ip=40.107.20.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.317, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

10.12.2021 17:47, Vladimir Sementsov-Ogievskiy wrote:
> 10.12.2021 17:25, Kevin Wolf wrote:
>> Am 06.12.2021 um 18:59 hat John Snow geschrieben:
>>> On Fri, Dec 3, 2021 at 7:22 AM Vladimir Sementsov-Ogievskiy <
>>> vsementsov@virtuozzo.com> wrote:
>>>
>>>> We are going to use do_run_test() in multiprocessing environment, where
>>>> we'll not be able to change original runner object.
>>>>
>>>> Happily, the only thing we change is that last_elapsed and it's simple
>>>> to do it in run_tests() instead. All other accesses to self in
>>>> do_runt_test() and in run_test() are read-only.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>   tests/qemu-iotests/testrunner.py | 4 +++-
>>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/tests/qemu-iotests/testrunner.py
>>>> b/tests/qemu-iotests/testrunner.py
>>>> index fa842252d3..a9f2feb58c 100644
>>>> --- a/tests/qemu-iotests/testrunner.py
>>>> +++ b/tests/qemu-iotests/testrunner.py
>>>> @@ -287,7 +287,6 @@ def do_run_test(self, test: str) -> TestResult:
>>>>                                 diff=diff, casenotrun=casenotrun)
>>>>           else:
>>>>               f_bad.unlink()
>>>> -            self.last_elapsed.update(test, elapsed)
>>>>               return TestResult(status='pass', elapsed=elapsed,
>>>>                                 casenotrun=casenotrun)
>>>>
>>>> @@ -353,6 +352,9 @@ def run_tests(self, tests: List[str]) -> bool:
>>>>                       print('\n'.join(res.diff))
>>>>               elif res.status == 'not run':
>>>>                   notrun.append(name)
>>>> +            elif res.status == 'pass':
>>>> +                assert res.elapsed is not None
>>>> +                self.last_elapsed.update(t, res.elapsed)
>>>>
>>>>               sys.stdout.flush()
>>>>               if res.interrupted:
>>>> -- 
>>>> 2.31.1
>>>>
>>>>
>>> (I continue to be annoyed by the "None" problem in mypy, but I suppose it
>>> really can't be helped. Nothing for you to change with this patch or
>>> series. I just wish we didn't need so many assertions ...)
>>
>> I'm inclined to say it's a None problem in our code, not in mypy.
>> Essentially it comes from the fact that we're abusing a string
>> (res.status) and None values to distinguish different types of results
>> that have a different set of valid attributes.
>>
>> Of course, Python already provides a language feature to distinguish
>> different types of results that have a different set of attributes and
>> that wouldn't run into this problem: subclasses.
>>
> 
> Agree, you are right. I'll look if it is simple to refactor.
> 

No it's not simple)

Actually, it means making TestResult more smart, and moving (most of) logic of test result result parsing (checking different files, etc) to TestResult.. But we'll still want to update last_elapsed.. Adding a method "TestResult.update_runnner(runner)", which will be no-op in base TestResult and will be actually realized only in TestResult subclass that have .elapsed to call runner.update_last_elapsed()? And we'll have a hierarhy like TestResultBase -> TestResultWithElapsed -> (TestResultFail, TestResultPass).. At least, that's what I imagine, and I don't like it :)

-- 
Best regards,
Vladimir

