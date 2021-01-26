Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3B430421D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:18:39 +0100 (CET)
Received: from localhost ([::1]:57856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Q74-0003gL-Hj
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:18:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l4Q48-0000nB-DK; Tue, 26 Jan 2021 10:15:36 -0500
Received: from mail-vi1eur05on2121.outbound.protection.outlook.com
 ([40.107.21.121]:44768 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l4Q44-0007aF-O3; Tue, 26 Jan 2021 10:15:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZINmZ40ykDRGk0T73ps1pXnXHSIySE06dbo/fHkVbEpv8zgg3V9MqGqJNCLF332aksu1IiL0wd1JwgE32rMAr+sIgHvcebtrxY8cGGJjNJ4mCODVZn81nTU1bdnR6yZjoqCiReE804vd2tb3jKpuNhHsuPkXcH3BcEmbilkMo330rtB7rBWWGcL5HQspBGH4LcTYw/ZNLhEYIAEgGGF2JwM2WKUchYPm/4YZO+zgvQb4V7TFT9hnyVktC8wblJ2uxYoWxJ7g1j0RAa2BrK/IeRstPlA2rnilFXVIsfuZl05tzSPnpUAoXMehfD6iZnTe70TUwDHdK3yMtkyuJHmYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlii7/ySB9L4pOUg8/VWNtwf32+YG1GxPOdN8lQyk4c=;
 b=RY9K3GaTYZ4h1qgLoKEkSiIzJRdtEkGZri6QIKa4J+bVeY5f2yD4LzC7dA836GoUvCoYwst8ELWJ7QwiAXP3kYJkV9w95Yw7ury+8hmFHmCJ1ifQzauGK1GN2zLT3D2x6J6Ur3ogiYPZPjuPPVKbskmt0IPIxBZ7jXI2ImHhz7sNO3s6kmo1Bxpsi0QG134uiECjWN5j8uI6AE6+u6O6iJIIBLelqn+JfxmsWlujd+yLrHXcYaYy2buQzZHGdfkPJikeLDoKIpEo5i77kV6ZLqBKX/8TlQLPBQQdyY07cdmOVU/8iciCJ3Barj3v6imMqD6e0mBJIA942XZyTcCCTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlii7/ySB9L4pOUg8/VWNtwf32+YG1GxPOdN8lQyk4c=;
 b=ew4PeFgPWT0gTdvrT7Bq6KhoE7pr6ZvKlyXj/y6ZZiPzBLLkQME9IL8n4P9fKFDB/vHtb0i3rd+zjRSJhiR6DSLh9gO9U4RtbLIjQO1t3cQOcFbcPFcJl+0QF2f8MkNKfjqoBkw80fzrlVOTFqWxb4Cq2+jk/hTxh+EgCPTsLWo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5127.eurprd08.prod.outlook.com (2603:10a6:20b:e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Tue, 26 Jan
 2021 15:15:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 15:15:25 +0000
Subject: Re: [PATCH v9 0/6] Rework iotests/check
To: Kevin Wolf <kwolf@redhat.com>
References: <20210125185056.129513-1-vsementsov@virtuozzo.com>
 <20210126125301.GE4385@merkur.fritz.box>
 <2628b158-cc41-908e-550f-ec4fe726a31f@virtuozzo.com>
 <20210126150750.GH4385@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5bb6d3fd-2a2c-91a4-f12a-5e195627a7fb@virtuozzo.com>
Date: Tue, 26 Jan 2021 18:15:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210126150750.GH4385@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.100]
X-ClientProxiedBy: AM4PR0101CA0081.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::49) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.100) by
 AM4PR0101CA0081.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Tue, 26 Jan 2021 15:15:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 572a220d-058c-49e6-3aa5-08d8c20d350b
X-MS-TrafficTypeDiagnostic: AM6PR08MB5127:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5127D11CC75BFEC0865580A0C1BC0@AM6PR08MB5127.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cKJa6DuS/3LwdchbS2x7cQ0KHnJQGDoZzXXzEQLYolZqbVwCttjNhGp/ccsNrqgOAp2mrYhQUMgENBEeWaiejOxz0j2QrqidvdzL0SD9hHbj19cHSfX2LLGcijycGo9mwSFTk8gNZozCO/7mICqLtFTbrfim+wC4c54U4w8YZ/VWoKon82Htf5F2fpKC3latMYbpXBjTHFyGSPbDK//MewZdZ1CI0hAXvxctMLRoLgb9iGHFlPwA3jOap9pi/uH3Fc/oazP5+ZUi+fBIqFs6FWWegzRZmyq0ajeRON2qmUoryBpsLxjZs/YwxBDiGG7QtWsjRGEUxCdnRCDbMdzvW9jYH3BiPjJ3NWqkSY8jZhvNI2Km2qT+DEScBoLAYO1yKbbXcwYc1IO38AYKWKPd/RlA3/+9u0hXhomsr5Vd59mPnigAts5kv4pzIO6XO87jSlIQ4dgF7Io67Eb2hGdZl6OrFRt6GcdV0kRz522WHL0Q1xlFUu7OGyWSycaLy4yREJwoYJ0y0zpbLaCReQImp3A/AOmz8sn9udV9nRoZEic0IsmFeIZOs0pijumjFUtNPXKHy0AcwSIsF06xIWG/MQFN8yNMsOGK8xO/zVxRtU/okDXrdOTlgFKG6iQdn5vmjqY00nY9w8AJzabsrstATcHL1gMVoEK3HpYSLWdyr24=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(966005)(86362001)(4326008)(66476007)(66556008)(31696002)(498600001)(26005)(31686004)(16576012)(8936002)(66946007)(5660300002)(2906002)(8676002)(6916009)(52116002)(36756003)(6486002)(16526019)(956004)(83380400001)(2616005)(186003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SVdyZHhLcDMreEF1bFRFcFo3M2xtN0hmb09OMlpFU29kcXdDMmcvblJZZXpv?=
 =?utf-8?B?Q0k5cStSemE2QU40TzRuczYzNzJpYnphOWJoY05QWHdmZlRIODdaclZoMzBr?=
 =?utf-8?B?KytOOFJJTC9ZZFZ5WW52cExYY0pkU0c2M0pFQ1dRQ0lsUUoraFFZUzNYTDBG?=
 =?utf-8?B?b0JFSnZidm5adnN2ZC92Y0NJdncyVTFsdVBNL0Fjdis2OE1lek1WaEFlZkl4?=
 =?utf-8?B?QURLcTNndURxcC9TTjdxa0dkVDc1cklmdDNtK1l1N1dUM0M4LzhtMHI2dE5h?=
 =?utf-8?B?NTJIcnhYU2tnS0RoQ2tKYjdHVXo5NDlQVFVkaHVIbFh4TC9MT2Z5UGFNMHZ3?=
 =?utf-8?B?SXFwWWl2RGt5WHh0WkFDS2pzdHM2WTIrY3hyeHdoWTdPdkV5Mnk3K3ZncTZR?=
 =?utf-8?B?WWtYNmx1RFV4eUFuQzQrdFdvbGRyL0puRWtYRTVycjlCVXBiNGxaWU5lUVV6?=
 =?utf-8?B?enFPTG9JVlByUlhlaU5SMFBzTkpVcVZwTjRIYm1Bd3JrZ0FDUGxaWnU3QXR2?=
 =?utf-8?B?WnpQZitXcFBVcGpFNGc1bXJXdW5nQVRNYmkybXdoUzhlZ3E3WWZselkrUzYx?=
 =?utf-8?B?S2lGaXIwUnEyT2VJYXZiQVZOT0VOaDVyQWg5OGhHNWtLMVZOUUhMOGFFNGRT?=
 =?utf-8?B?M1d3bjJqa01nc2FHL1liblJSNXBlSXNsWHZoLzF5RTREU0tOdnF5a2NGaTdl?=
 =?utf-8?B?b1ZZZEZHRGdDamc0T1JTZzhwakR5dWY0UUxPL2ZCZnZ0a3JDUFdWZHJKN0ZZ?=
 =?utf-8?B?WXo0Zm9Tb0t0SGs0T2xSZWs5clFlcE1WWkhmS0c4VHQxT0Q5dURCTXFGVzVD?=
 =?utf-8?B?VCt5ZE0yWlVYNGNvK1BFOHF5Nnc4UDh3V0p2VWNlSm41KzMvQmhHOURKSDdq?=
 =?utf-8?B?c0wzdWJLZ1ZZalJKOWhzVkovejdvS3JtLzgrUHNSb0xzdXlnYnUrc0tJU0p4?=
 =?utf-8?B?NTZTL3pKQW1kS0F3QVlhaVgwVlJycEZJRHhMbVJDNnhzVitSdFRMVG5TcUVT?=
 =?utf-8?B?UWVtM1BmYkU0d2R0QWhYV2NTSGdzSVlOUGNpeFNIVjJTL1Z3Tm1xaXhSbEhK?=
 =?utf-8?B?MlJnRUlzczF0MnNBSmRaNldDQURlY3JUakhCR3dQdUJjYWN5bkp0MWhSSS9w?=
 =?utf-8?B?Szc2SFdIc3FiL3pNRkFiaDRoZWozYTMwaC9kNCtsMXZHU1ZTZjlnb2lkM29B?=
 =?utf-8?B?bDJLQng2QjBaMjFMWVNKaC80R2VEVUlVRkVucnNwSmZ3NGo2RzhYU1VsZ0RU?=
 =?utf-8?B?WnVYVUlwdzM4bk9jY3lJY3d5TE1uSkRmMXFkT1JWR3AxWlJhaGx3T0FVRnFz?=
 =?utf-8?B?Nm9vdlVDNVV0TXZNaWRzZENGZXlVY1RRbVVLTGtwcnRQS24xREtMVGg3dUxa?=
 =?utf-8?B?YlZGdUZCTFpSQ00yN0dXYURQWnBXY0ZTTi9iV3g1eFl3NVg4Y0tnSWVsRTJQ?=
 =?utf-8?B?SVRKRU9icWQ1dS9kQ0hrRWp5cnl6UnZ1aHI2QWpnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 572a220d-058c-49e6-3aa5-08d8c20d350b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 15:15:25.5586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbbJ5PLGnESNKrPPkreHpSoTa4YhZAydbA0SfiBkDLl2VUYr9zpvgUBV5T5YhmfVGW2XYe/STLKpLzwlKnHzGwD2yA0VfMgW9PuSCuJqKeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5127
Received-SPF: pass client-ip=40.107.21.121;
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
Cc: qemu-block@nongnu.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

26.01.2021 18:07, Kevin Wolf wrote:
> Am 26.01.2021 um 14:19 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 26.01.2021 15:53, Kevin Wolf wrote:
>>> Am 25.01.2021 um 19:50 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> v9:
>>>> 01: new, one more whitespace-fixing patch
>>>> testenv: allow case when we don't have system-arch emulator, but have several for another architectures
>>>>            change direct os.access(..., os.X_OK) calls to new helper function which also check that path is a file
>>>> testrunner: s/fail/not run/ for 'No qualified output'
>>>>               drop elapsed time arg for one of 'not run' results (now no elapsed time for any 'not run' result)
>>>
>>> More CI fun:
>>>
>>> Traceback (most recent call last):
>>>     File "./check", line 117, in <module>
>>>       testfinder = TestFinder(test_dir=env.source_iotests)
>>>     File "/builds/.../qemu/tests/qemu-iotests/findtests.py", line 53, in __init__
>>>       for line in f:
>>>     File "/usr/lib64/python3.6/encodings/ascii.py", line 26, in decode
>>>       return codecs.ascii_decode(input, self.errors)[0]
>>> UnicodeDecodeError: 'ascii' codec can't decode byte 0xe2 in position 1591: ordinal not in range(128)
>>
>> Can be solved by adding encoding='utf8' to the open().. But.. Adding it everywhere is not fun.
>>
>> So, what about just define PYTHONUTF8=1 for running check in check-block.sh?
>>
>> https://docs.python.org/3/using/cmdline.html#envvar-PYTHONUTF8
> 
> That looked nice, but we both missed the important line:
> 
> "New in version 3.7: See PEP 540 for more details."
> 
> So I'm back to explicitly requesting utf-8 encoding everywhere and that
> seems to finally make it pass in the CI.
> 
> Kevin
> 
> 
> diff --git a/tests/qemu-iotests/findtests.py b/tests/qemu-iotests/findtests.py
> index d0c72efd6a..dd77b453b8 100644
> --- a/tests/qemu-iotests/findtests.py
> +++ b/tests/qemu-iotests/findtests.py
> @@ -49,7 +49,7 @@ class TestFinder:
>                                  os.path.isfile(f + '.out')]
>   
>               for t in self.all_tests:
> -                with open(t) as f:
> +                with open(t, encoding="utf-8") as f:
>                       for line in f:
>                           if line.startswith('# group: '):
>                               for g in line.split()[2:]:
> @@ -57,7 +57,7 @@ class TestFinder:
>                               break
>   
>       def add_group_file(self, fname: str) -> None:
> -        with open(fname) as f:
> +        with open(fname, encoding="utf-8") as f:
>               for line in f:
>                   line = line.strip()
>   
> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
> index 046f9ce38f..a581be6a29 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -41,7 +41,8 @@ def silent_unlink(path: Path) -> None:
>   
>   
>   def file_diff(file1: str, file2: str) -> List[str]:
> -    with open(file1) as f1, open(file2) as f2:
> +    with open(file1, encoding="utf-8") as f1, \
> +         open(file2, encoding="utf-8") as f2:
>           # We want to ignore spaces at line ends. There are a lot of mess about
>           # it in iotests.
>           # TODO: fix all tests to not produce extra spaces, fix all .out files
> @@ -81,7 +82,7 @@ class LastElapsedTime(ContextManager['LastElapsedTime']):
>           self.cache: Dict[str, Dict[str, Dict[str, float]]]
>   
>           try:
> -            with open(cache_file) as f:
> +            with open(cache_file, encoding="utf-8") as f:
>                   self.cache = json.load(f)
>           except (OSError, ValueError):
>               self.cache = {}
> @@ -102,7 +103,7 @@ class LastElapsedTime(ContextManager['LastElapsedTime']):
>           d.setdefault(self.env.imgproto, {})[self.env.imgfmt] = elapsed
>   
>       def save(self) -> None:
> -        with open(self.cache_file, 'w') as f:
> +        with open(self.cache_file, 'w', encoding="utf-8") as f:
>               json.dump(self.cache, f)
>   
>       def __enter__(self) -> 'LastElapsedTime':
> @@ -245,7 +246,7 @@ class TestRunner(ContextManager['TestRunner']):
>           if self.env.debug:
>               args.append('-d')
>   
> -        with f_test.open() as f:
> +        with f_test.open(encoding="utf-8") as f:
>               try:
>                   if f.readline() == '#!/usr/bin/env python3':
>                       args.insert(0, self.env.python)
> @@ -256,7 +257,7 @@ class TestRunner(ContextManager['TestRunner']):
>           env.update(self.test_run_env)
>   
>           t0 = time.time()
> -        with f_bad.open('w') as f:
> +        with f_bad.open('w', encoding="utf-8") as f:
>               proc = subprocess.Popen(args, cwd=str(f_test.parent), env=env,
>                                       stdout=f, stderr=subprocess.STDOUT)
>               try:
> 

OK, thanks for handling it!

When will we move to python 3.7?

-- 
Best regards,
Vladimir

