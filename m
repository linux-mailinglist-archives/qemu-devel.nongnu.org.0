Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3110D357F3A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:33:13 +0200 (CEST)
Received: from localhost ([::1]:41482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUR2F-0003Zs-PU
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lUR0g-0002oT-Fg
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:31:34 -0400
Received: from mail-eopbgr80091.outbound.protection.outlook.com
 ([40.107.8.91]:59677 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lUR0X-0008UT-SE
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:31:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEsGU2CwGvodBEZdb10eYJl2PBCjjBYsGH958XwwsBShBzsSsFKEGldYT81TKhilM+KhLv9S2t3GIdmuJPv8JpO9zFIq0jK2SKsy3RnL6jYW06+P6H6wyRrDMWk4GTeTyLU+Hb1vXNqgZKlFWg2+JYj4fq1qdeKRVCmrxeGdWAV/iavlp6gtpfo++lhV0krb7ZolrNjDtNgdZ63Oy1L++7z3iMhxJnm/AYmYrVHtA1AGr3RUlmooVHteBlRWg7flX3AmqTlaW7B5v+n6mukUVR8l8CmkYciQ8dnhYQkf1z3rqJBCXUrKI7hOFDQg/ePzxcZM6oFhIvBtZLQIJdSOZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Px9t2mNyCocKTUvhH0lBSyex5f+ipaqTWd2cgKlwPs8=;
 b=Sz0cf4seT/HXwjTR75T8ghcut0BDVVEtBwxznzRA4h9DKlNaUcC6apB/jkB5CjdI2+WOZGVSdJHbErkjIiCdmFhvnLBxy9AIyL5zEQCeJvLbCVlj7JxJQPrRH2z9/GFElDdd25nTd4GKe8y6PKqdSwC+5CTibXEH1vcA2UAWMLOB9Zg2d0vX/wffwQdoSZ93qC6vxB64GDVMOOyCoGXY4n5rokoWh+O+3HpmblTKysrfUXRpEmRELgJ6sGtmKRQMfhDe3TUsrCd98tInwINjleHsXb6oYh+Jz7fxXdYVNeuihBlWyy8Tz9h5bEt/hDeYUD+ronDAbYEiCm0XZG6JsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Px9t2mNyCocKTUvhH0lBSyex5f+ipaqTWd2cgKlwPs8=;
 b=YPIDrhkK/C3uXMM45De3bxDusF0STFAzKneZiq2Qh9NahaKNgP6GcMC3C+Nz+3uNmBw7Np/qY+xYtu6QXGZ/MAG6ko8xEIEzxbksxK3ToNsqsZ4hVtbVkxGFESZDI86BJcpWCmlBuOtYOcHNaV8x1vpGnuzxWxBGtlukIvuhBGE=
Authentication-Results: chinatelecom.cn; dkim=none (message not signed)
 header.d=none;chinatelecom.cn; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM9PR08MB6803.eurprd08.prod.outlook.com (2603:10a6:20b:301::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 09:16:19 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::a8e6:4693:824d:19f5]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::a8e6:4693:824d:19f5%7]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 09:16:19 +0000
Subject: Re: [PULL 0/6] migration + virtiofsd queue
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, huangy81@chinatelecom.cn
References: <20210407102021.95225-1-dgilbert@redhat.com>
 <CAFEAcA_cjGZUUYUzFygYS3NKXd02CwrtmK5U5fqF-oz5wAddGA@mail.gmail.com>
 <YG3i0xBDon91EEbL@work-vm>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <f9e6f72a-0c15-cfba-ff85-4eecaca132f0@virtuozzo.com>
Date: Thu, 8 Apr 2021 12:16:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
In-Reply-To: <YG3i0xBDon91EEbL@work-vm>
Content-Type: multipart/alternative;
 boundary="------------0DBA7076B7826780224D7884"
Content-Language: en-US
X-Originating-IP: [109.252.109.82]
X-ClientProxiedBy: AM0PR10CA0067.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::20) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (109.252.109.82) by
 AM0PR10CA0067.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 09:16:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ccff503-edd9-4781-ad87-08d8fa6ef80a
X-MS-TrafficTypeDiagnostic: AM9PR08MB6803:
X-Microsoft-Antispam-PRVS: <AM9PR08MB6803E42BD2C43874C22506C59F749@AM9PR08MB6803.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:422;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hib0Z9tVXqNMW+4ULg6aISJfbxh1VtoWGlSR4uzPoWOWJGH5P7L5+foTskMu6FX+0FZKt02WCrag6jE/17w3zSjfxE4SMwStpYuh/CMTxglA3rZfYot8ANqwuLpleU+fGyQPtdLNvvTVcdOKmCS0vljHsxwTfidIy5QOErF8RPeVxW3b5btZDOYetM8s4UhovpiRyRFlzDmJWFtuW0HkCau1iH8KplaBQBlLaXiFD9lLeyTgSxe/C+hVzCxopfu4FSyopdvWZZ2VC878QumJeZWFYmrNIxiTimnCGrop2/j6FqhBCj9IZc42aMlj2W5danNfU7E264eJOcbju95HrtMSjzzq/xyrISioPdw6uxhQFyj+XnT0gw5sHCoGcjhO4tvYyC/Mav1xPwbTwC+IFctCPtY40gmKee1L9wbb/W1pLBYuja//obiGKz+Q77sYCjp6mMCD3vSNhyMXrcJfJkvFr3XOAaoMdpjlhlxgoGNMGqjv/8n1IJGOVIyObYgCc0U1rxsWXkojTx9S2Bu90hQ2EAPEU+WXDkgl5+FFOzd7ewTo3nKKcYP7P3s9mJfR2p33hJgc1iXgMNt8we8VXN4H35pkyBUmDBWnUpDlC0c87tdReewjYm3Dm9Y54TvgHTbnx94xxxZ2N4SpILIpaKnG8LBe6G4+jMwOGzqLwU0g9fhQaZbEMrkUqZjQW8BStUVlQxp26OJocuCyRa/SQGGFZHVaQKiYJy3lhB3Zs+Ehsx2Ujp+XxO9pYSpe8Nfh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(396003)(366004)(136003)(26005)(38100700001)(8936002)(52116002)(38350700001)(31696002)(53546011)(44832011)(16526019)(186003)(86362001)(83380400001)(33964004)(5660300002)(8676002)(66556008)(16576012)(2906002)(31686004)(66476007)(6486002)(2616005)(4326008)(478600001)(66946007)(110136005)(36756003)(956004)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bFNZQkpoWmc4K21mc3JaejBKZ1ZmdW9pTEJwU1RLa24yUEE2bWZDd1lWaVhP?=
 =?utf-8?B?TGVtOEREdHFtckR2TFZPczJqVXdQaVVzS2l6U0NZTHFIaFFMWkN5UE05K0Fo?=
 =?utf-8?B?ck5scjQ1UWYwK3JjTVJheVlyRU44TjJVNE5GSWRncVhQbjFLL3lTTXR5ZTBS?=
 =?utf-8?B?NW9JTExjNGQ1RXBnMGtpSWFHR0Z4bTNxVlZaNjZZMlpINFZUbHp5KzVIcEJF?=
 =?utf-8?B?VjQ0c25MaVdId1BqdGFzQWNoT2R4bFdGODRPcDJ6RWlPdWl6aElDdGR4alNM?=
 =?utf-8?B?cjNiNXRVVlRiWERPakhBcExYQUJPRCtIKzFPRkJvcHFXNTlUK3RLR0tJUUZS?=
 =?utf-8?B?ejVhYUpXSnkweTJsZlRPUlFBNXJoSmdsVG4yMjVWaGNJZ2ZDc2NqNTJLand3?=
 =?utf-8?B?cUc4Sk85OEpRYnd1SVhCZXhVQS96VkRWVkt6R1U2V2I5UmFpVlRWVjRSL3p1?=
 =?utf-8?B?UXRmU0JhQXBuRytvdHFDd3JKSnd1NUdSMTF6U0tuRjh6b1pKSVhOSkNSdUVB?=
 =?utf-8?B?c1M3Z0JBRzJPU0pTRVE1TFVzYzVlZUFIb1pvNlFBbTFvSWoxUzdSS0xFQWNi?=
 =?utf-8?B?T2NZNnFuZnEvYnpXY2VEcW05QnZHbzJnZFFVZ1FJcjB0SVVQTFo2KzE0aHVa?=
 =?utf-8?B?R0ppc2svbDJ4dldGTTQxd0hQeXM1ajl1QTdnd3d0bjhLbFZaWjlpSkNabCt3?=
 =?utf-8?B?NzV3R0ZLUTJSTkgvWXMyMEVkbjQrSG5MZWdUa2dTOG5rVm9QUSs5SWFTUUF3?=
 =?utf-8?B?OFBBY1dQMU1zOW4rem5ZeW9TR2JOaWFpUnJQaHQ4TXZVeUFrdUZtMTlMWm9R?=
 =?utf-8?B?NE1XcG5YOGJCRUpRb2Q5MTZCZmxqZUFYenN5dkE0ajBwR2lxMENwNWlwMGtC?=
 =?utf-8?B?dHhrRlV3UXFpbldDWW0vNnhhVEVoM1gxOVZsQ3NlR2pBdHNqSXRweEV0TEdQ?=
 =?utf-8?B?VlZLWE9MZDB6dUF5RGZoeUs5a0wyWkEwVXNXWUlZeHRpd25PUWtXeWtRd0JD?=
 =?utf-8?B?RkQ4YncwVFZDd3l2bkQ4Z3BGN0RTZnNCRzNTQTJET0d1cUpHQWM2WUIwNzlp?=
 =?utf-8?B?VXV1Q0ZHUE1ZcnpaOG1pZCtOcDUxQTRpYnpnVE1FWmxWWDBnWjcrMDlTcFM1?=
 =?utf-8?B?OGYzc2RjcFdJb0FLNUhJMmQ1L1BiU0JOVGtaTEJBcjg2SDdnc0pocVJwQTN1?=
 =?utf-8?B?U1BJK2FnZHRqZUZIV3psdTRYNVRGVzdGcm9wVjB1Z1drNmphN0gvUXFoTHJ5?=
 =?utf-8?B?Vm1obkVCNFZ4NlE0U0h6S0pFMGQyZ0YvaU1HK09HMEVzWHJDdDVKNnRaSXJU?=
 =?utf-8?B?ZTgzeG4zM05KTHUrTHU3a2ZVM2ZlZmUyaEwvU01tN0NQWGFXQ2ZKQ3ZyMjRO?=
 =?utf-8?B?YTV2OUJVZnRSU09UVFpoRmtDN3FEbjZhME9QT1Vkbzg0TEYrd3pCOUpBclhs?=
 =?utf-8?B?STZ6Y0NKUjRVTTlTOEtiTEt4NlJwNmYyV2hKN2lKY2xoZlpIT28yZ2QyUURL?=
 =?utf-8?B?MTRyQ3YzV1lwNWltVTNaM1BQMklwd3FmY1docDlmbVE2Smg1UUFwcytPVnQ4?=
 =?utf-8?B?d0Z5T05YTnI1eEp3dHBZZ2tIdmRrZVJOZC96bmFSaVkyZFRBS3RpVk9uNzhB?=
 =?utf-8?B?aUd4NGNMY3hodThXazBLd3FtTGl2WmxEZkdBc3EwTStqU0pLUDcyZW9teGpK?=
 =?utf-8?B?cnFuU0FoV0hWNmFaNkpOcTBTc1A4cnpza1AxOXdlaVhMNm5DcnJiR2l2cy9D?=
 =?utf-8?Q?U93DczqIsgPU8+DFdj0ZMvFSrvv9392UReZyNIF?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ccff503-edd9-4781-ad87-08d8fa6ef80a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 09:16:19.0279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5KwRhb9hjIy1l3JNCpJdsYevAGBsYiaTC3NnAY0yLAS7y9BJqkLnfLe/EW+S1G7DuddFqAutRB07L8c/9y46UlLY0s7Ev2grz3vZGu9Jf2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6803
Received-SPF: pass client-ip=40.107.8.91;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------0DBA7076B7826780224D7884
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.04.2021 19:50, Dr. David Alan Gilbert wrote:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
>> On Wed, 7 Apr 2021 at 11:22, Dr. David Alan Gilbert (git)
>> <dgilbert@redhat.com> wrote:
>>> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>>>
>>> The following changes since commit d0d3dd401b70168a353450e031727affee828527:
>>>
>>>    Update version for v6.0.0-rc2 release (2021-04-06 18:34:34 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>    git://github.com/dagrh/qemu.git tags/pull-migration-20210407a
>>>
>>> for you to fetch changes up to c4e232bb57aca19ca60f692ee830023a76eca78e:
>>>
>>>    tests/migration: fix parameter of auto-converge migration (2021-04-06 18:56:02 +0100)
>>>
>>> ----------------------------------------------------------------
>>> migration+virtiofs fixes pull 2021-04-07
>>>
>>> A seg fix in virtiofsd, a bunch of fixes for background snapshots, and
>>> a migration test fix.
>>>
>>> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>
>>> ----------------------------------------------------------------
>> Fails to link on non-Linux hosts:
>>
>> Undefined symbols for architecture x86_64:
>>    "_ram_write_tracking_prepare", referenced from:
>>        _bg_migration_thread in migration_migration.c.o
>> ld: symbol(s) not found for architecture x86_64
>>
>> The definition of ram_write_tracking_prepare() is inside an
>> #if defined(__linux__), but the callsite is not, I think.
> OK, reproduced here.  Let me see.
>
> Dave
>
Seems that non-linux stub is missing, I'll respin.

>> thanks
>> -- PMM
>>


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------0DBA7076B7826780224D7884
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 07.04.2021 19:50, Dr. David Alan
      Gilbert wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YG3i0xBDon91EEbL@work-vm">
      <pre class="moz-quote-pre" wrap="">* Peter Maydell (<a class="moz-txt-link-abbreviated" href="mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Wed, 7 Apr 2021 at 11:22, Dr. David Alan Gilbert (git)
<a class="moz-txt-link-rfc2396E" href="mailto:dgilbert@redhat.com">&lt;dgilbert@redhat.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
From: &quot;Dr. David Alan Gilbert&quot; <a class="moz-txt-link-rfc2396E" href="mailto:dgilbert@redhat.com">&lt;dgilbert@redhat.com&gt;</a>

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
        <pre class="moz-quote-pre" wrap="">
Fails to link on non-Linux hosts:

Undefined symbols for architecture x86_64:
  &quot;_ram_write_tracking_prepare&quot;, referenced from:
      _bg_migration_thread in migration_migration.c.o
ld: symbol(s) not found for architecture x86_64

The definition of ram_write_tracking_prepare() is inside an
#if defined(__linux__), but the callsite is not, I think.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
OK, reproduced here.  Let me see.

Dave

</pre>
    </blockquote>
    <pre>Seems that non-linux stub is missing, I'll respin.
</pre>
    <blockquote type="cite" cite="mid:YG3i0xBDon91EEbL@work-vm">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">thanks
-- PMM

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

--------------0DBA7076B7826780224D7884--

