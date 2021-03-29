Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACE734D0A8
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 14:58:29 +0200 (CEST)
Received: from localhost ([::1]:49198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQrTQ-000614-BW
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 08:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lQrRp-00057J-Bd
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 08:56:49 -0400
Received: from mail-db8eur05on2117.outbound.protection.outlook.com
 ([40.107.20.117]:38863 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lQrRj-00021D-7u
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 08:56:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oM3eFZWEoqN3ou8Zs7VGyn4IL1CPgOYDn4k9zjU3szG6Gr/x7qy1DCBRJpwroDm4MqgTgKt1cinVL0HtoLNq6fnbl7WxpN82bI3FrIS/MCayRzQrqRFvc2Fg5wg6Xff4e/344C0o/quAZj51Wy8X54IbaH0G/NIyyky+PIP6SZ+3wVgHnXaBV+9lBk0cLmTQhzOb9LmaF4YqZ024pDOiMglSWRVG6oD24mBRRoV6qJvxWT12vpWTV4SDXN9B1xH2IVViDhWP68RAhrEcYED5nzDsDqYKuQwNNAKEvAiBLTBGJlAZ2xKPb15BIUfJpzLUUAtmTj/eziO0z6y4f6KwSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ux9WDF/XohoNjQz7xkLArWuKenUoiIwEANQyDCTDuzc=;
 b=kHlkYKoAeYsPQuXjO96HFz1o8yzC+wG033xSST0khhE8LE4DQOMT+oziBkjgKxaR7s+8NPEI2B43Vng8ZEAKaQ+9cVKSV62AIn2C7DN2Oky+XBMEABpVjn7kurdu1bgsqeUosCM2sZhS/e/Y2Ydj2odPMppS2CTtc60/eigZSkNo62N6cqSsCTQdRKWmDdBhpqa1puAIOuOv1/w7fNzzADQrU5PyGprnoFTjWIbQTSFBQQAcRCwgj9kaSodpo4cyxtjFXVsb3QPilROT89pCO/SpX8jcV9Ba/S+TDGNDa78kK+YfW24kynsZPznHAyYhbd2sGI7QCsBGRC+18ZxHFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ux9WDF/XohoNjQz7xkLArWuKenUoiIwEANQyDCTDuzc=;
 b=WtKBSP5Pv+t1M4Bgo5a/7xPWSSdrqr5/XxyD4gq8SrcPe1cNrHnVsnt4BJMJ8ygGceT88Go45HzYOx7QwV4CCcxPyipe6Y4lUl1+R3N+8Lk1D3QwHIBnJXFhH0Zw9DXEr+s/gmZkStVUdeiUnhh87VK/2WWny8ijUmPJN9xzA8M=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from DB8PR08MB5499.eurprd08.prod.outlook.com (2603:10a6:10:fa::16)
 by DB9PR08MB6380.eurprd08.prod.outlook.com (2603:10a6:10:256::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Mon, 29 Mar
 2021 12:41:36 +0000
Received: from DB8PR08MB5499.eurprd08.prod.outlook.com
 ([fe80::f127:7f1e:e776:42c8]) by DB8PR08MB5499.eurprd08.prod.outlook.com
 ([fe80::f127:7f1e:e776:42c8%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 12:41:36 +0000
Subject: Re: [PATCH v3] qapi: introduce 'query-cpu-model-cpuid' action
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Denis Lunev <den@openvz.org>
References: <20210326173000.18750-1-valeriy.vdovin@virtuozzo.com>
 <YGGb9ohT/EztzFbr@redhat.com>
 <20210329112153.GA413337@dhcp-172-16-24-191.sw.ru>
 <YGG+k2PMJjc2yX2g@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <15924dba-1618-0b7e-fbc3-42e4f02d8176@virtuozzo.com>
Date: Mon, 29 Mar 2021 15:41:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <YGG+k2PMJjc2yX2g@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.207]
X-ClientProxiedBy: AM0PR06CA0111.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::16) To DB8PR08MB5499.eurprd08.prod.outlook.com
 (2603:10a6:10:fa::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.207) by
 AM0PR06CA0111.eurprd06.prod.outlook.com (2603:10a6:208:ab::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 12:41:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3f07501-f302-4683-3bcb-08d8f2affdca
X-MS-TrafficTypeDiagnostic: DB9PR08MB6380:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR08MB6380DF4E87AC2FFEE0774750C17E9@DB9PR08MB6380.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3287GSD1BAkBJHiyFuR21uYaSyB7AEf/SZulCWPYaJFf/VHE5Zmtf+Vh14shNmrxDqW5Em9ph46+5ePwE7nY3meYhBNAB6uU41vvT3rN/FImRWomCG8vYg18LOeg1mIhV5i2DQ4cIml2n5XvAW/C9afcXtAWKBG+Uj8HRHKkwMo62Ssb+lwGwS781v59mJQ1Ev2dzaCAw1KtxIfnsDcZG/xZzWPQeCTnb7VCoDtkooi5APIG57xnlBUBUdos7W86ExbQOExJEQFLLEaDsxu0BHxSUtNt2pulluET+HAqHFjJKOU9XxFgsbi9GZloIH6QE25XxQmP6zo34ZC2IfoU1sag3pqyKQ3MxlfFxASoV5YsohH0SjjX6ei1x8333CVZ0SVDlD5088vK+knK1dTv1EkKF5FxycsdrOzgP5znVeMhQuVDsbLdiFs/S6AwL7K9JF25yQiy8vn7IIJLZfPye0ymHprJP+TZD5ZTVO132LG68rqpv3WZgmhJJFw6Ej7mZ1iJ1lXN/xDAdbkBojdrDGXEWFVkm0FocnjOyTGGMXns0MTca5b93JyaTAyJme8WBFA8u2Lpr8xC7KMmwX7TE603wM9zbhOom3cfRBd2pX9Zb1T487UeCEjhSIW5xKw5YaWVFRAirLArQNOW4dIorHWVs+eQlW1t0QaUkgKtpCc5fbShUTQODEAceBYUlF3Qq9B+gCnP6OQ4uTQvm3uwoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR08MB5499.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39840400004)(346002)(376002)(396003)(66476007)(8936002)(2906002)(26005)(2616005)(186003)(38100700001)(4326008)(52116002)(16576012)(956004)(8676002)(66556008)(6636002)(36756003)(86362001)(31696002)(31686004)(110136005)(54906003)(16526019)(6486002)(316002)(478600001)(107886003)(66946007)(83380400001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q1RCUFM3TFB1bW9UcDlUcThOWFBtdE1ydUVjeVQ1emdGY3BpeVhzaWNxSGtW?=
 =?utf-8?B?T3hwUktmajZaMVRvMjFLTndPc0VZWVU1cGNLSjZiZUZ0dzlhMTJRWmhLVWg3?=
 =?utf-8?B?dGlsSHdaNTUzWC9KbER2aHpWVTQyTEpKazVkeWtVbTRUMTc5b21pY1RmSyt2?=
 =?utf-8?B?aDNqQWhIRGtoekFFTzViRWRUaXR5dHRSUnA1amlsMkdDMUtGM3p2eFhuVEJm?=
 =?utf-8?B?dlEvY3g2UDU4dElSRWtsWWpxU0M5ZjZieSsvekVHYmVuai91K1RNQUNEYWtN?=
 =?utf-8?B?TGdwZFpCeTFhS0VxOURaNEJlTUxoNlNKaEJhaEF1dFMyN3RaeGFqL2pOYUJ3?=
 =?utf-8?B?bmlpOVUzendLMjNFRHhTRS9oak1PZFhQU1QwVDBqeFZqV1VrRHFhUDlSZkY0?=
 =?utf-8?B?M2FnbWc4LzBESFZOWXBRaVBoRjFoSEw5dTBPTFRDdVU3TEQ0b1dVaVVpZncv?=
 =?utf-8?B?M1k0T3VvYWVsVGNKZDVPQ2t1czI2V1ljRFRRc2VDVE9HRVRrV0pRRzdNTUFM?=
 =?utf-8?B?Njc5L3dsUVpuOVBMSWw0SUg1aTJPekpzMVBrRXhlNGNYTm1TMWZrdlVqY3BT?=
 =?utf-8?B?THdYS3JzeUVqaWpDQ2xBVG03QWV0Qm1uenkwUVhYREpDRk1VNmZZQTdzR0hk?=
 =?utf-8?B?NlNMU21KSS8veE92OVNxcURhNEViYmtvK2phUStvbWlVYjVpN1hZaHJXMzdF?=
 =?utf-8?B?c1R2a0Q1NWJqK29nSzdBNnhPb0Y5YzMzQlNGeFREYjZyT1FzWWkyampZb1BP?=
 =?utf-8?B?dGYzWGRaVkJqRkJvbllwdklHUDF6ZFdPcUtYV3JNd1dxWlRieHk3WmZDVmNr?=
 =?utf-8?B?eVlEczgybmFyVWtWZkdNZFpQK1lHNmRVUEtPN3MxUHIxa3Y0aVpZV0FnV2tZ?=
 =?utf-8?B?M2Jvb01mNEFoZzJ4OWJnTHB5Q1NaejJGS1FDSE5rYXZRdG1uTkVzd20yUGdW?=
 =?utf-8?B?TXkzWXFLeXVvUUt3VzBsTitKUmNwb1VIT25qSjhyLzVOVVlFM3ZqdTR5ZkNZ?=
 =?utf-8?B?VFMzM2FkVE55Q3kwcmQzM3NVTXJqdlU0WU1lalF1dkFnUEh2QUpGY0ZRTGZh?=
 =?utf-8?B?MWZkTC9DZnpHQjR1KzhtTWkxVUpwRVRmUUVwZ2hOMkx1dkNTejc3OGdJSmEv?=
 =?utf-8?B?Y0JiUXBaOHZpVUdvaTBVbE85bVladEFLZUtITlpCTDVmOWZDbHc3aHNoclA5?=
 =?utf-8?B?RHEwQm9LRVhtRjVRdlN6OHFBdGJjSEMranF3Um1HcEJlYnNmT0tManpTa3RE?=
 =?utf-8?B?UmQwMkJQNkFvYWlmallVcGRtcndIeUQ2Mlp5KzEyWXlGNUg1dTBtMzBydFl0?=
 =?utf-8?B?N2VrcWxwM3Rjdlo5b2l6YjlPUlV4SGJWT1JRbzlxVS9aY2FvRjE5aFBrMmVS?=
 =?utf-8?B?dTBzc0J1YVh5dmJBQTVRL2ovVW5ZTmtnaWlCOUtndHE1Yi84bG9XSWtDeHlK?=
 =?utf-8?B?Y0pmMmJLUFRtMGZYQjI5S1o2QVZLaktLOW1oM2lCRUZOeHNBRjQ0TElnVzNF?=
 =?utf-8?B?ZHVQcmpJY0VEM0prM1k5NUlZT3BGUXdNWmtNc04rSCtQand4ektkUk1WcGM3?=
 =?utf-8?B?QVl2N2lwNWtUU0ZUcDFjdGdETG9OdUNIZElGZ1YzMTlhdnFweGQxbzB0bVMx?=
 =?utf-8?B?UDd3UitQazI2UUhrbnRWMHFTNWNRSXRaRDRIRExUWlgyT1ZzZG5zb3NZUmJT?=
 =?utf-8?B?WnBNeHJhaDlyWG15c2cvOTlxekQva0JFRmZOMFQ2ci9kV0FTZVZldWNTZzNs?=
 =?utf-8?Q?0DOxPWRdpxEfWNwGnHcYh+TR9ZjdIGBtujfpjo8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f07501-f302-4683-3bcb-08d8f2affdca
X-MS-Exchange-CrossTenant-AuthSource: DB8PR08MB5499.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 12:41:36.5028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywdxnO+Rz8IJGj+C7pEvHTMK0rgtc1Ksu+yOEpx2OYUIIthonOQKtrIPfuVDjaeVnolAsuCQaT0GobTpQBdDWNsGp8Ca2IIP2kB0fSz9Pxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6380
Received-SPF: pass client-ip=40.107.20.117;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

29.03.2021 14:48, Daniel P. Berrangé wrote:
> On Mon, Mar 29, 2021 at 02:21:53PM +0300, Valeriy Vdovin wrote:
>> On Mon, Mar 29, 2021 at 10:20:54AM +0100, Daniel P. Berrang?? wrote:
>>> On Fri, Mar 26, 2021 at 08:30:00PM +0300, Valeriy Vdovin wrote:
>>>> Other than debug, the method is useful in cases when we would like to
>>>> utilize QEMU's virtual cpu initialization routines and put the retrieved
>>>> values into kernel CPUID overriding mechanics for more precise control
>>>> over how various processes perceive its underlying hardware with
>>>> container processes as a good example.
>>>
>>> When I read this, my impression is that QEMU's CPU handling doesn't do
>>> what you need, and you're trying to work around it outside of QEMU.
>>> Can you give more detailed information about what situations QEMU's
>>> CPUID handling doesn't work, and why we can't simply enhance QEMU
>>> to do what you need ?
>>>
>> We want to override CPUID for container processes to support live
>> migration. For that we want to base on a reliable cpu model, which is
>> present in libvirt and QEMU. We will communicate cpu models information
>> between physical nodes to decide the baseline cpu model and then we could
>> use the new method to get all CPUID value leaves that we would return to
>> containers during CPUID override. In our case the QAPI-way of getting the
>> values is a clean solution, because we can just query it from the outside
>> (not as guest system).
> 
> IIUC, you seem to be saying that you're not actually going to run a
> real QEMU VM at all ?  You're just using QEMU / QMP as a convenient
> way expand a named CPI model into CPUID leaves, so you can then use
> this data in a completely separate container based mgmt application.
> Essentially treating QMP as a general purpose API for handling CPU
> models.
> 
>>>> virsh qemu-monitor-command VM --pretty '{ "execute": "query-cpu-model-cpuid" }'
>>>> {
>>>>    "return": {
>>>>      "cpuid": {
>>>>        "leafs": [
>>>>          {
>>>>            "leaf": 0,
>>>>            "subleafs": [
>>>>              {
>>>>                "eax": 13,
>>>>                "edx": 1231384169,
>>>>                "ecx": 1818588270,
>>>>                "ebx": 1970169159,
>>>>                "subleaf": 0
>>>>              }
>>>>            ]
>>>>          },
>>>>          {
>>>>            "leaf": 1,
>>>>            "subleafs": [
>>>>              {
>>>>                "eax": 329443,
>>>>                "edx": 529267711,
>>>>                "ecx": 4160369187,
>>>>                "ebx": 133120,
>>>>                "subleaf": 0
>>>>              }
>>>>            ]
>>>>          },
>>>>          {
>>>>            "leaf": 2,
>>>>            "subleafs": [
>>>>              {
>>>>                "eax": 1,
>>>>                "edx": 2895997,
>>>>                "ecx": 0,
>>>>                "ebx": 0,
>>>>                "subleaf": 0
>>>>              }
>>>>            ]
>>>>          },
>>>>        ]
>>>>      },
>>>>      "vendor": "GenuineIntel",
>>>>      "class-name": "Skylake-Client-IBRS-x86_64-cpu",
>>>>      "model-id": "Intel Core Processor (Skylake, IBRS)"
>>>>    },
>>>>    "id": "libvirt-40"
>>>> }
>>>
>>> There's feels like there's a lot of conceptual overlap with the
>>> query-cpu-model-expansion command. That reports in a arch independant
>>> format, but IIUC the property data it returns can be mapped into
>>> CPUID leaf values. Is it not possible for you to use this existing
>>> command and maintain a mapping of property names -> CPUID leaves ?
>> As already stated in the use-case description above, having this method
>> around, helps us in a way that we can just take values and return them
>> to containers. QEMU code already does a great job, generating CPUID
>> responses, we don't want to do the same in our own code.
> 
> This is asking QEMU to maintain a new QAPI command which does not appear
> to have a use case / benefit for QEMU mgmt. It isn't clear to me that
> this should be considered in scope for QMP.
> 

Hmm. On the other hand,

1. The command just exports some information, like a lot of other qmp query- commands, it doesn't look as something alien in the QEMU interface.

2. We do have a use-case. Not a VM use-case, but a use-case of cpu handling subsystem.

Isn't it enough?

We want to handle cpu configurations in a compatible with QEMU way. The simplest thing for it is just generate needed information with help of QEMU. Note, that's not the only usage of QEMU binary for not-VM-running. QEMU binary may be used for different block-jobs and manipulating bitmaps in disk images (yes, now we also have qemu-storage-daemon, but still).

Do you have an idea how our task could be solved an a better way?

-- 
Best regards,
Vladimir

