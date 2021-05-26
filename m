Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB71E391FE7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:02:04 +0200 (CEST)
Received: from localhost ([::1]:41840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyn5-0003C7-Su
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llyZa-0000cU-9M; Wed, 26 May 2021 14:48:06 -0400
Received: from mail-am6eur05on2091.outbound.protection.outlook.com
 ([40.107.22.91]:3776 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llyZW-0008OU-Rt; Wed, 26 May 2021 14:48:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcFg9Qves3+hnGaNIpqsAySkQWbrrmFiyc9ltdB3mAWY0uhQi4ilNebCprXHT/6seoGu1l++5AU5h40t9oMUjGmm7gIaPJvLdxYL2jUTlOFbFV5rcD22h2EyKuJoutKlt6v7FKHg1rXE09Bu8XFVD7PsApZUyGE9i+mrJh5AJ2U0Ebji9yaFfF4WEJUgkX8qYwEeFxS2AGg8nzNXUJJSPoQikCjZhwnKgBRyRVc/3zuiKcgVT6IQP9fJIj/wSOd955mpj4Rh39adsJDBmVG/osxnJXz0smiLTWPINshU73HcZn++b/3vc2DRqVu4HVl1ydFbsRE+KnO3VHlgRHfxIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAJXTZ/J/YsuBauaTuLT3DRnjie9KO1IZvsClxDYGCY=;
 b=BOBEcZ0F7sx824tUGy+yphSKg1PWa8iVhm1UGYvpI4JBdUHyvAtdJ6hpUwTSxwYjDLGGVdf3To5qh7TvGORYl7sXrv2hn46xLMoOt3tmAunlf74r3dq/vYEhcQ+Vy037Z5oJBpfMEbSMynfgb7OaIVPf/66QagpN2J67UedYnPMwoHxzy4KiSOD0+o0yWVlWVPUz1gEDDlC+V10ZB8oZZgcJQXB7EHbvGoTssuVnEdLCqNLYkf1nd6LNhqz/CEUJ8U790pEps1E2fpV5WWV0cY2sgo63G9ZX2yZ0Hvw9f4PC5wc3oZoYkuULo+JaZEsptJqIdsK8ziyat29P//dXdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAJXTZ/J/YsuBauaTuLT3DRnjie9KO1IZvsClxDYGCY=;
 b=IoUazqftFwv3A7mFssEgeFDsc6A6h5JfFBMBDkkizjo1DByzsaBnJyYVmx4V/DLECN3cH9TSeMeVxnJ2B4M6Sk96x07sOnqZ/XFQsoxthfcnFndQnpRc5GyFQW6lypY8t2uIoeqD+UWhsQvIa6wem0k4MBo/81jGyt3lH1t9pA4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3285.eurprd08.prod.outlook.com (2603:10a6:209:4b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 26 May
 2021 18:47:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 18:47:59 +0000
Subject: Re: [PATCH v7 31/31] gitlab: add python linters to CI
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210526002454.124728-1-jsnow@redhat.com>
 <20210526002454.124728-32-jsnow@redhat.com>
 <3acc5107-33a4-1ae7-eafb-076d39fbd6e9@virtuozzo.com>
 <36db607a-2f29-2b53-5578-c17861e0dd1c@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c507b546-6877-48de-365f-5bb44cca0cff@virtuozzo.com>
Date: Wed, 26 May 2021 21:47:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <36db607a-2f29-2b53-5578-c17861e0dd1c@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: FR0P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 FR0P281CA0037.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.9 via Frontend Transport; Wed, 26 May 2021 18:47:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a257ae21-fdc5-404c-bf01-08d92076c86a
X-MS-TrafficTypeDiagnostic: AM6PR08MB3285:
X-Microsoft-Antispam-PRVS: <AM6PR08MB32859454D87D7CF49F52E31DC1249@AM6PR08MB3285.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pdqYhr6yPED3grXw8QAtBPCuF+rPnIOEM898kbgdNHYN4CbmmJGrQgraPFttCqz8dhD+FqQqtVWCObWC8B9mXZKqCSucBIzfwQfQ3jLUhHHxPoiGQF/dhD8MjyUhhyf39M+GBLnDeYpvEO54czRWc8CZ/n6s41Do5VLHKcOFljajS7Ye0KX6oLV7vy2NOvpRg7MqTwPFf3QIS/OK9XfrHUnm7Giql2nSxgoYhtbswArCe45QfW6fLYiMhV0IFWdHIfpOzQCI5b1RGpTsigFeE6v5mS6/JUpELHDVO56GeT2Z6h8UE7bYZdVhSq9yEuhn+GddaKZ1gUrZe/9lvAuGaCQ+k8e+bE6fER1sGcEnT6YpxB4y40W1KOK1wgyLjI3h1pEboD+zf458KuNSDhz5ve/Cj48oknA1yKyLMllTqPcXrNv2dNx+a24sXLPEktWzZYSpdrilRIX91N3pDREnWrc+g33gO0qbxAY/nkpT+rXIJ4lRnsjvYiD4Cz95mpvAYX09GnVM9w39Gw8DnRuH3WUMquZYyZCI/pj7mX1vS45D0FjJXthuL1it3L/P3m8fp3PxoHYBWshAWcQG3cjBpjfJYOS6IoEG3sQUzDwS5oauH6zw4hScqvYyXmKDbSCxchlA0/S0XBTDfJpPViCxxJGjgH3FCT/OOATC+C1m6CkuD1UCIHuOWdUnBOZyBE4srPMvOK0F4XSiAbt0ypLAiga/qAtRULAUWk4n+4yBDbi2DwrZb+xS+/1L3FzMDagtw/ivwbZdesngBGj+IRP9jflxpVNKIF09Q3VMEbV2scP60/hcF78PBa5gdYTaVwAIG0u8PAJGKOMnLJrmA2TUdWEHIaRqEXNicDcVlMggfu0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39840400004)(52116002)(83380400001)(86362001)(26005)(7416002)(53546011)(16576012)(316002)(6486002)(31696002)(8936002)(54906003)(8676002)(186003)(16526019)(956004)(478600001)(66476007)(66556008)(66946007)(31686004)(2616005)(36756003)(2906002)(5660300002)(38100700002)(4326008)(966005)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dW9SRVQ4ekNYNVlCNmhCQmszdWtuU2piRG9QaUJhM3d5WmVzR3lZeHpIQnVj?=
 =?utf-8?B?VlhnS0d0c0s4VnpBL05Wd3YxZ1c2R2RKclA2dTlmRWlGZCtoU0xwdXE0N1RI?=
 =?utf-8?B?YjJYdUthQkd5Y2h3TFBuRFdzN0d2NzN0MEo4RUpHL2hmU2o4TkxpWE9lY1FK?=
 =?utf-8?B?aWthTThuL1ROQzN2aVVMUHVqK1dncCtRNE9sUVhHbW5HUnFKTUpsNUdMRUhq?=
 =?utf-8?B?bUJFR3RQckZ2SlF0WjBLUVlpR0lTb1BNVS9adXlUR2tNZGk3VHU0TFovQW5C?=
 =?utf-8?B?ckhLeWtOSld4YWNWZ1lEc1BzOGZpbyt3MjBrZ2VEVUZoeGJ1bVRsL2IrU1RK?=
 =?utf-8?B?L2NuQlRzem9teDFNYVhuWnVrdjh5czlGTEo5VU5MUzVGSnlNZEN4M3FkcU0w?=
 =?utf-8?B?YVpRRUJXQ0VDN1ZDVmtQQkNMZkxoUXJQc1FjdFQrdER3YWxvdmZwRjdtZmRy?=
 =?utf-8?B?cnVmWko0NjFKM2I4Qmc2eWxSa2dkZ05UdFpIZjhOQk9zdDBpN0hJcktDeUw3?=
 =?utf-8?B?aEdzQnpGZ0VHTzFnNDRUNXgvbWNxYkZGcitJVVpoYnJRQ3FoT21aTFA4cHlU?=
 =?utf-8?B?dnk2TWpHajRnWHFKZDRYZEVGQnNrbGVPRGQvamFlaGxiT05HcU8rdFlGbWxn?=
 =?utf-8?B?SW05RzJNTUI3V0NsYWpmS2hMZ0trSVNGS1lkOVdUSW9rOXBkZi9TR3ZRanpN?=
 =?utf-8?B?SmNKVVRwdkdGMW5lVUkvT05lbE5ieDF0QndNUkkxZUJuZ1JnbFBhdC8vRVVo?=
 =?utf-8?B?U2k5cmUwZFRTY0JjaVhaQWFBQkVuZlUyUjNYRnNwelZTZ0ZibFNkenIyNzcx?=
 =?utf-8?B?ajAzQmVZU3JRSVJiU3RtRi8yanphL21PSkVKaW9TVEdQUmVxRkFlQ3FXTnlI?=
 =?utf-8?B?Y0lxS0NHV0xHUUZ3bE15Y3NqZEJjUTd5S1dOVHdFSzR6Ykw4L21NNDhRNnUr?=
 =?utf-8?B?cEQ5UTc4R0d0QmMzVkJsOVBZSVVab0xvd2MvMldLbWRBZ3FZODd4UXlYYXNa?=
 =?utf-8?B?WXdpOHZudTVrcyszV2xLclB3T3BaWUdPM2Y1c1RLb2R1OEZwSTB1a01rTDNG?=
 =?utf-8?B?bnZiamVWdW92TVBJdnhjdHVXK21GZjB0U0NJbmZlWWpORzhyTW9BR0x6OG5E?=
 =?utf-8?B?SStQR2x5cDN5MkRZT2VYYTk5ZzFjQ240R3JDekpybG56aDlLdVF1NHUyRUo0?=
 =?utf-8?B?WjZ2S2tRSGl6MHVqODB3bTNRMmJtcmxLRDRHQXNPK056V0VBQ2tQNDVvQzBD?=
 =?utf-8?B?YUJwYnpGUi8rd3lmK29QdVo3NHNlcVZYYWxua082UDRKQ2llUmRFWnd6WDB0?=
 =?utf-8?B?aWI0MmhKRG1QNzk2VmJhNEM4enZlTGJLMTE2MmZ3MTh1SkVRWGJLc0lhd0VQ?=
 =?utf-8?B?bCt4NWhKM3hiaEhEZENLMmRPbjc5QWJlRnBaeFVjeGZpell4S3dvT2FLa0Uw?=
 =?utf-8?B?dHp1L3NjeDMwdFBTRWcxbUdGV2lNbE9wT1RWUUd3SG8rV3k4cjlpMTVuVW1l?=
 =?utf-8?B?cVd2MmhxSExxNzUyUFdhcjZIK3MrVkdvZ0RZVjVGSUZtSG5Rc2V5TGZBb3Ji?=
 =?utf-8?B?cTdnNjNnNUJPdENFVVNBYWU0SlR1bE16amNuYm93L3V1SkpvdlNiWnVFVlE2?=
 =?utf-8?B?OXVKZEdobmkxTXpaM01lck1CVkVYL2cvdkF2RlRPYWNrR0grc0k4RXlTU3FP?=
 =?utf-8?B?Y3NJVFFPcUovM2ZrbmJHOEc2eC9GdUV0M2MrWFdwcnFXVnBCOGRRSGJMWmFq?=
 =?utf-8?Q?rYVczZk8Mq5iZPJ/fa7VbMFX8LwiiB/3lfuksvv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a257ae21-fdc5-404c-bf01-08d92076c86a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 18:47:59.1349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fx0fCA8HelvmU2OKWExxAzPrl7cvQB6hGvYHL1tMFY3qLCT03tYFXa56CgM2XDnYlGPmKpxHbh5wUiwkUiOb0zlgPNB9CQfrE4gzXZX3Z6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3285
Received-SPF: pass client-ip=40.107.22.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

26.05.2021 21:24, John Snow wrote:
> On 5/26/21 5:33 AM, Vladimir Sementsov-Ogievskiy wrote:
>> 26.05.2021 03:24, John Snow wrote:
>>> Add a python container that contains just enough juice for us to run the python
>>> code quality analysis tools.
>>>
>>> Base this container on fedora, because fedora has very convenient
>>> packaging for testing multiple python versions.
>>>
>>> Add two tests:
>>>
>>> check-python-pipenv uses pipenv to test a frozen, very explicit set of
>>> packages against our minimum supported python version, Python 3.6. This
>>> test is not allowed to fail.
>>>
>>> check-python-tox uses tox to install the latest versions of required
>>> python dependencies against a wide array of Python versions from 3.6 to
>>> 3.9, even including the yet-to-be-released Python 3.10. This test is
>>> allowed to fail with a warning.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>   .gitlab-ci.d/containers.yml            |  5 +++++
>>>   .gitlab-ci.yml                         | 26 ++++++++++++++++++++++++++
>>>   tests/docker/dockerfiles/python.docker | 18 ++++++++++++++++++
>>>   3 files changed, 49 insertions(+)
>>>   create mode 100644 tests/docker/dockerfiles/python.docker
>>>
>>> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
>>> index 765408ae274..05ebd4dc11d 100644
>>> --- a/.gitlab-ci.d/containers.yml
>>> +++ b/.gitlab-ci.d/containers.yml
>>> @@ -242,3 +242,8 @@ amd64-opensuse-leap-container:
>>>     extends: .container_job_template
>>>     variables:
>>>       NAME: opensuse-leap
>>> +
>>> +python-container:
>>> +  extends: .container_job_template
>>> +  variables:
>>> +    NAME: python
>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>> index f718b61fa78..cc2a3935c62 100644
>>> --- a/.gitlab-ci.yml
>>> +++ b/.gitlab-ci.yml
>>> @@ -789,6 +789,32 @@ check-patch:
>>>       GIT_DEPTH: 1000
>>>     allow_failure: true
>>> +
>>> +check-python-pipenv:
>>> +  stage: test
>>> +  image: $CI_REGISTRY_IMAGE/qemu/python:latest
>>> +  script:
>>> +    - cd python
>>> +    - make venv-check
>>> +  variables:
>>> +    GIT_DEPTH: 1000
>>
>> Hmm, interesting, why we need depth = 1000? gitlab recommends to keep that number "small like 10" https://docs.gitlab.com/ee/ci/large_repositories/
>>
> 
> Yeah, I don't. Just copy-pasted and didn't consider it. I can set it to "1". The default is apparently 50 and I don't need that either.
> 
>>> +  needs:
>>> +    job: python-container
>>> +
>>> +
>>> +check-python-tox:
>>> +  stage: test
>>> +  image: $CI_REGISTRY_IMAGE/qemu/python:latest
>>> +  script:
>>> +    - cd python
>>> +    - make check-tox
>>> +  variables:
>>> +    GIT_DEPTH: 1000
>>> +  needs:
>>> +    job: python-container
>>> +  allow_failure: true
>>> +
>>> +
>>>   check-dco:
>>>     stage: build
>>>     image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
>>> diff --git a/tests/docker/dockerfiles/python.docker b/tests/docker/dockerfiles/python.docker
>>> new file mode 100644
>>> index 00000000000..56d88417df4
>>> --- /dev/null
>>> +++ b/tests/docker/dockerfiles/python.docker
>>> @@ -0,0 +1,18 @@
>>> +# Python library testing environment
>>> +
>>> +FROM fedora:latest
>>> +MAINTAINER John Snow <jsnow@redhat.com>
>>> +
>>> +# Please keep this list sorted alphabetically
>>> +ENV PACKAGES \
>>> +    gcc \
>>
>> hmm, interesting, why you need gcc to run python linters?
>>
> 
> build requisite for PyPI packages in the event that PyPI only has a sdist and not a bdist for a given dependency during installation.

i.e. some packages are compiled during installation?

> 
> Found that out the hard way.

Worth leaving the comment somewhere? (not worth any kind of resending of course)

> 
>>> +    make \
>>> +    pipenv \
>>> +    python3 \
>>> +    python3-pip \
>>> +    python3-tox \
>>> +    python3-virtualenv \
>>> +    python3.10
>>> +
>>> +RUN dnf install -y $PACKAGES
>>> +RUN rpm -q $PACKAGES | sort > /packages.txt
>>>
>>
>>
>> weak, as I'm far from understanding the details, I can only check that it looks similar with nearby files and entities:
>>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>
> 
> Thanks!
> 


-- 
Best regards,
Vladimir

