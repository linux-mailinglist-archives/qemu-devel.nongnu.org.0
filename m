Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EAC358342
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 14:28:21 +0200 (CEST)
Received: from localhost ([::1]:34298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUTlk-0002ij-K1
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 08:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lUTkm-0002IZ-3A
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 08:27:20 -0400
Received: from mail-vi1eur05on2125.outbound.protection.outlook.com
 ([40.107.21.125]:11132 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lUTki-0003sZ-HQ
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 08:27:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WW+9uULp2n036fYDkC+EDwoCK6sd8tM6RLKvOe8uygCi6ul79Xp0Z6FV8tVaDbXLP1oMXYAX8BGG2qCabCURY+KQXEy5vWxA/Azj4RPXaWTjrPh45J2GjjJPIl3+fx52+17lGENfcRrPae8mrQ2ILz0+bYcYLH/nwBfp2pbqJXtSeS5vA/Ip9HVLjWcn1W1ONippMQ9zbLlYlUCk/9vlGH4/p/kVZx03O3ajwjj8HncXg/bs0a7eDMTOKIbTww4PUsCs4FwOZEwbekPFQbG8zdZVrhthCwRINZlVCs1Rhc7Srgg70np/+e91zbUaBqVt8nTYJMzEaFXr1h84i3kPoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXgk8mGxIE7A9VtdffJocA5FYKeRpaNp4IG0dQRg2LU=;
 b=BQnyw88jWD2CRJ8EfNW8F2AA2Q17OrkDiZjuQ9x2yym+3ll/VEnD8Z8kqlVD/1rCiCIfPel5XC3If/cCUmMvAKPqiyZIwLIhHNOXUfU2PPurOz6i8ewF/6xw1uJshbi54Pr+rGv7WcGUTxMcP/AKaez1LHal6u3aY43+7z/nCIAXmTDpUrid8Hma2JQJ5hs7JEtTXwuyVt7v83nzB9/BNIvQHr/KaGRjAxodWbxGnxT7Y2jouYO+eXsiZfUBI1NRRHTa+obcrdrmBxX073UHgDzUkaV7opezRRoiUhBj9plQpBm5Q59O6ZRV3+asmLEskgg7og/aAtqsKK8n0ogf6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXgk8mGxIE7A9VtdffJocA5FYKeRpaNp4IG0dQRg2LU=;
 b=SEVlKjOZ7tkChPogsfYFsHFC4KiLxhgHxppK2Z5cJMGq6lY1Vg04mB4Q0nDsgPS/Xp90hsrkTnX2zmykacrIGG2TOWQSstqvNX6uNhj7Jo6prrkkOgIs5UPgKtq05GVVTXbIZHAZTYvs+0bZ7+rflcJ0/dyibwPdWLAXB6w3pMU=
Authentication-Results: chinatelecom.cn; dkim=none (message not signed)
 header.d=none;chinatelecom.cn; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM8PR08MB5588.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Thu, 8 Apr
 2021 12:27:12 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::a8e6:4693:824d:19f5]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::a8e6:4693:824d:19f5%7]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 12:27:12 +0000
Subject: Re: [PULL 0/6] migration + virtiofsd queue
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, huangy81@chinatelecom.cn
References: <20210407102021.95225-1-dgilbert@redhat.com>
 <CAFEAcA_cjGZUUYUzFygYS3NKXd02CwrtmK5U5fqF-oz5wAddGA@mail.gmail.com>
 <YG3i0xBDon91EEbL@work-vm>
 <f9e6f72a-0c15-cfba-ff85-4eecaca132f0@virtuozzo.com>
 <YG7f7mShw2ypUPZM@work-vm>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <e92d6666-35e7-4b0d-e6f0-a1b18da900a8@virtuozzo.com>
Date: Thu, 8 Apr 2021 15:27:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
In-Reply-To: <YG7f7mShw2ypUPZM@work-vm>
Content-Type: multipart/alternative;
 boundary="------------DDFC3806D4158112978276F1"
Content-Language: en-US
X-Originating-IP: [109.252.109.82]
X-ClientProxiedBy: FR3P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::6) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (109.252.109.82) by
 FR3P281CA0019.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.6 via Frontend Transport; Thu, 8 Apr 2021 12:27:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ca29976-30f4-48f8-baa4-08d8fa89a2e0
X-MS-TrafficTypeDiagnostic: AM8PR08MB5588:
X-Microsoft-Antispam-PRVS: <AM8PR08MB55889AE171879D179DCB79D89F749@AM8PR08MB5588.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z3Qq0ac3f68wNap8RU4aM0EFIRdC7R8+QvSU3B9Oie0bSw24999Pj3ju0l8s2v555F9S8qq6EigE+Q988zT7dr2DotRQSb1ZfudoQkZt1aH9LGxYBvZSibGWccH6z7Zu2pJX7ldohAo71iXpIOl4odHfK2kUHApfEXB2L63ZjLY4YsvpefFBT4rr4se9m4+dbOQf82pbs8+jeOqxJmVwSWONoEQis24JezGde+nuWeyE37sOsfMeRaomTe/h5rCMBTDKw58jp1RVEaWU3OEF/vWzeX4R7GR4kZdnezill6Bbk57YZFo1td8tvsQcOk0Xwb5imeBlpSF6gzrmiVd12c2t8a4pI0KCC0PSl+JaKzjhBs8VoR1a/z+j3CU7qTl86me2Nn4sPHgfiaA8XXXc/oNyahMSJR5eD0/Kk4Gg5X2m1T/UIvHn89xKGIIUqDqcb9umXZV5q6cOJDfJz6DxMkneTFJYZX7SwVUeNYlPdg/UW0eI5tXdR1fBh3H5sjOsKK444FfafUgSJKcKT21OfdcGDwHNYdCv/0pHb4OcDHzIXjusEaRcqNtvCrLQH2J8JFXrgKdy0IrmobmF3oHrgOr3QXDw6ixcSYKoa/LZ+PfRkAzeiSK0js6nNLXABZFdMzw8xitNR0KDlscRqQLaV8ywj/KNHvdz19XJZf19uIh/zXLgHI5rMbGUaMV+RBjvb6iW/IiHZs4IlVTobOu2N7SkKpL5f9gnYbaX42lliLVsUNQLncUPrY7+DzIJAxcf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39840400004)(396003)(366004)(376002)(16526019)(66946007)(2616005)(36756003)(6916009)(33964004)(38350700001)(86362001)(38100700001)(31696002)(66556008)(8936002)(478600001)(31686004)(66476007)(186003)(83380400001)(54906003)(53546011)(4326008)(2906002)(52116002)(316002)(6486002)(8676002)(26005)(16576012)(44832011)(956004)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OUdYOG85UUM4MVFzZmZGMk84SmkzMDh4WGRIeUttVm56cGZ4ZTBST2k1VWxI?=
 =?utf-8?B?eE8xUldXYkZQYThuUStpZWNjTzRPVWpFdjMwdUprK3J1OFArdVp2aFNpVnU4?=
 =?utf-8?B?RDF2dXBuanROZVY2ZzFVTHdWb2xqdkQ3VHQ3STA5am92ZndyZGt3NkYxVjJm?=
 =?utf-8?B?ZHlOb2poeFJKSk9aRUd1R3YxOG44OW9sT3BhQjdzdVUxTG1kbnZSemhFc0dQ?=
 =?utf-8?B?WThJU3JlTDA0NUVPNng3WXVETDJsQ3FMSzBuTFFTN3VyRlYyNC96eGNPMzZw?=
 =?utf-8?B?c3BtR3JyenV5KzVjS2hhZzdVRmNqbXd2TGhEWCtqcnNDUzdVMlFGN0s3QjFv?=
 =?utf-8?B?WG1LYk1BNnB5bmY5bktaZWRGeDZzcmVrYnlldkc1dFNydTB0WXQzSmdkZHBv?=
 =?utf-8?B?Q1FDM0dkVVIzYk1WWVBKZFgvYlFCQnE3b21GaGxxL1Z1eDB3UnAzZnhXd3ZR?=
 =?utf-8?B?bmVaUWJ2citOKzVhSkFPa0c1Qm5nZEtoT2pWSFVTUWdjVEw5QTNWMXUvVlZk?=
 =?utf-8?B?QXpaM2owdkw4VU9wNURQcjJ0amNhVEpuWi8zRGxlTVM0bGRDenVxVDc0VHNS?=
 =?utf-8?B?Y2VIMDd6MW40SGxwUEhRTE5IdHU5OUUvdXkxbS83MDNicFNkdUo3TW5lbWw5?=
 =?utf-8?B?eUJYaWJMcnE0M2tyZEpkQ3ZsMXVSYVdKSENwaU1mWitNalgrbUZYU0lvOUhl?=
 =?utf-8?B?R1dlcEcxN1FyWTJOaWkrSFlvSEF5MnNhNzRRNGpNT0pDZTRTMWRGV1BydlVI?=
 =?utf-8?B?ZUpTY09RZURwei96T0E4NEpGaUs0MW5BTXN5bW5sM2NnTFFIMWRYeE1nd2pK?=
 =?utf-8?B?VktkSTJZTmhYZ2dMSXZLejhTNURiRTBnbmpzMFFRTCs0VHpSQmlIMzFFMkZJ?=
 =?utf-8?B?cDdraXZKYUJWb3JsUEV2UEI5MFd1S0VGTFNtNEgzVzc1SEJ3S3JzZkpnTjhN?=
 =?utf-8?B?Zk9YNWFBd3hCdyt3dGl0cHZiMkgxb0c3VjlrSDhUWTRXMEk3ZDZYK2E3aU1X?=
 =?utf-8?B?WFdwZ0lxYmVad3R0citBQTh1N1VxVmVybU5wZE9JbjR1MGtqZWkrWEROWkFq?=
 =?utf-8?B?TEtEaG4xbHYyVXZYRWFBV3BNaWVOSkd0RTZqcGdDVjdId2xCa0RDQVZBTDFX?=
 =?utf-8?B?UEtSYlRCL3FoUVBlZHVsckJlQ0JEK0FETkp5cUFMbFNuY1o4SW5NZHJsV25n?=
 =?utf-8?B?My9oVy81YmhsZnZjU20xTDR2cWdncG9JT2hUWE14NDVLVmF5dlZMcTlVd1hx?=
 =?utf-8?B?cWUrNGp5dm5vUks3M0hiM3dhVlRhVlN3RjdzSktxRmIxdnFJNTR5VnJRYmxK?=
 =?utf-8?B?cTFxeE1rbktwQ1NlQmpmTFJRV2NuWWtob0MwK1U0WUFLWDZuZzZ0MGhIWjFa?=
 =?utf-8?B?RSs5OGxFTzRtZllTTjh5RHBiU1dIY1lBMEY0NW4rL2grQlc3a0pJcnNBZHN3?=
 =?utf-8?B?TDZqNVJqWG9Ma0RJU092b09rT3dNRHplVklRSzBqbmJOMGdNbUx2WHdBSEdx?=
 =?utf-8?B?dy8xM2svYVpqdjBsaWVtTzhWYmxPZUE0UzcvRlVMTnUyMnBjUy9ZeG8rRFVC?=
 =?utf-8?B?bTJqWmdkbUFpeXQxaHdpeDVGY25aWWR1UXRNenJRbkN5YWdpMXAxWm5BcEZr?=
 =?utf-8?B?dkpGbmZIcTBFbnhuWW5KMSs3c3l1ZjNxWWlXcW11WEJPSVNOYTBtTVEzWmpH?=
 =?utf-8?B?bXlWN1RlMWgrRHZObWJSR0lZZnVSVUd3MXQ0UEFONnJ5Y05GYnUrS0FPTzgv?=
 =?utf-8?Q?EGrhcnW4O5mYaEuTpfBxQCaUqxQlsmaiYL4R+A0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca29976-30f4-48f8-baa4-08d8fa89a2e0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 12:27:12.4384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMXaOIGZN5ts4JHxSvwsv0U923ljtp3uxmDEDc7JqZ+DxOnTmcH/gzq75fPvf5pcEH6hSj1rZpKia5SoeX0loX4LDGDlGDBT7uY6LrDibfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5588
Received-SPF: pass client-ip=40.107.21.125;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--------------DDFC3806D4158112978276F1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.04.2021 13:50, Dr. David Alan Gilbert wrote:
> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>> On 07.04.2021 19:50, Dr. David Alan Gilbert wrote:
>>> * Peter Maydell (peter.maydell@linaro.org) wrote:
>>>> On Wed, 7 Apr 2021 at 11:22, Dr. David Alan Gilbert (git)
>>>> <dgilbert@redhat.com> wrote:
>>>>> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>>>>>
>>>>> The following changes since commit d0d3dd401b70168a353450e031727affee828527:
>>>>>
>>>>>     Update version for v6.0.0-rc2 release (2021-04-06 18:34:34 +0100)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>     git://github.com/dagrh/qemu.git tags/pull-migration-20210407a
>>>>>
>>>>> for you to fetch changes up to c4e232bb57aca19ca60f692ee830023a76eca78e:
>>>>>
>>>>>     tests/migration: fix parameter of auto-converge migration (2021-04-06 18:56:02 +0100)
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> migration+virtiofs fixes pull 2021-04-07
>>>>>
>>>>> A seg fix in virtiofsd, a bunch of fixes for background snapshots, and
>>>>> a migration test fix.
>>>>>
>>>>> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>>>
>>>>> ----------------------------------------------------------------
>>>> Fails to link on non-Linux hosts:
>>>>
>>>> Undefined symbols for architecture x86_64:
>>>>     "_ram_write_tracking_prepare", referenced from:
>>>>         _bg_migration_thread in migration_migration.c.o
>>>> ld: symbol(s) not found for architecture x86_64
>>>>
>>>> The definition of ram_write_tracking_prepare() is inside an
>>>> #if defined(__linux__), but the callsite is not, I think.
>>> OK, reproduced here.  Let me see.
>>>
>>> Dave
>>>
>> Seems that non-linux stub is missing, I'll respin.
> I posted a v2 pull with an extra ifdef, lets get that in, and we can
> tidy the stub in later.
>
> Dave

Ok

>>>> thanks
>>>> -- PMM
>>>>
>>
>> -- 
>> Andrey Gruzdev, Principal Engineer
>> Virtuozzo GmbH  +7-903-247-6397
>>                  virtuzzo.com
>>


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------DDFC3806D4158112978276F1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 08.04.2021 13:50, Dr. David Alan
      Gilbert wrote:<br>
    </div>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">* Andrey Gruzdev (<a class="moz-txt-link-abbreviated" href="mailto:andrey.gruzdev@virtuozzo.com">andrey.gruzdev@virtuozzo.com</a>) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 07.04.2021 19:50, Dr. David Alan Gilbert wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">* Peter Maydell (<a class="moz-txt-link-abbreviated" href="mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>) wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Wed, 7 Apr 2021 at 11:22, Dr. David Alan Gilbert (git)
<a class="moz-txt-link-rfc2396E" href="mailto:dgilbert@redhat.com">&lt;dgilbert@redhat.com&gt;</a> wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">From: &quot;Dr. David Alan Gilbert&quot; <a class="moz-txt-link-rfc2396E" href="mailto:dgilbert@redhat.com">&lt;dgilbert@redhat.com&gt;</a>

The following changes since commit d0d3dd401b70168a353450e031727affee828527:

   Update version for v6.0.0-rc2 release (2021-04-06 18:34:34 +0100)

are available in the Git repository at:

   git://github.com/dagrh/qemu.git tags/pull-migration-20210407a

for you to fetch changes up to c4e232bb57aca19ca60f692ee830023a76eca78e:

   tests/migration: fix parameter of auto-converge migration (2021-04-06 18:56:02 +0100)

----------------------------------------------------------------
migration+virtiofs fixes pull 2021-04-07

A seg fix in virtiofsd, a bunch of fixes for background snapshots, and
a migration test fix.

Signed-off-by: Dr. David Alan Gilbert <a class="moz-txt-link-rfc2396E" href="mailto:dgilbert@redhat.com">&lt;dgilbert@redhat.com&gt;</a>

----------------------------------------------------------------
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Fails to link on non-Linux hosts:

Undefined symbols for architecture x86_64:
   &quot;_ram_write_tracking_prepare&quot;, referenced from:
       _bg_migration_thread in migration_migration.c.o
ld: symbol(s) not found for architecture x86_64

The definition of ram_write_tracking_prepare() is inside an
#if defined(__linux__), but the callsite is not, I think.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">OK, reproduced here.  Let me see.

Dave

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Seems that non-linux stub is missing, I'll respin.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I posted a v2 pull with an extra ifdef, lets get that in, and we can
tidy the stub in later.

Dave
</pre>
    </blockquote>
    <pre>Ok
</pre>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">thanks
-- PMM

</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com

</pre>
      </blockquote>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------DDFC3806D4158112978276F1--

