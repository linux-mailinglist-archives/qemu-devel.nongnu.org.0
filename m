Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C66932F069
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:53:41 +0100 (CET)
Received: from localhost ([::1]:35626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDhr-0004a1-Q8
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIDeg-0003wi-Qn; Fri, 05 Mar 2021 11:50:22 -0500
Received: from mail-eopbgr150138.outbound.protection.outlook.com
 ([40.107.15.138]:45890 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIDeb-0004e7-56; Fri, 05 Mar 2021 11:50:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpDOYC5CLq+Kcj35vCvrW3kUOTC1B5w7Z8nqqq5GioFDn4ijy+ao0ovZxLHpjvEz2PWvTLkPabTJi00a36Phb5g/FxpBYv+aY9JKFHwVBenmupffMSJxbX4UPPexm8mT8Fo72KXBdcu/pCPkN3PAFBgnBYCPrrCGcR1c6cI9ii7tlp+p4TopLZ+wHVU5ofrtLGBdslBMgFl3qARm7SCxA2YJe71fUJgEeBqJ3qTwdpDKYlO4kJbyhCTLeLVO1cWK8kgwsFI9jcAYd0m2Chz0kGdaWtwK8mvXfLaeF19gNl9D8DgcEBS/dFbDRTeow+wzuRGdshwP21cV2heV+e+o0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eug6J25JWrI67JAh7vguuIUyGGtVqMusdmUo7CVhU8A=;
 b=c/qck+7YsyL5qXioMWZKg79gewVnjUknLP+nn9JqyxCEKxUxLT8X/jcSY4x71jktXmqGSVghnaj/TPHFXaZ7bV4pVcmxiUns4EX0aUqqaaft4yfoSmEt9YqdwhLkr6cjBwZjLaBQdxutj0Shaa8JSe8axn1UyHdJtZ7W48XmMaKsQ65cpbQIvzAb1agH02h8vJCewRcs5+Tpn1zNFG5/vTKa3fmHtQicpPhuNzBus6M2WHZmgOhC+KN2/c589GShnTmVxS/N2ijghb1YRdGZ4uM6OWoiozuGIqtPFPxf7IXgI0juGWLv5PgE2zlvUYyVwdqfO7//EzudZzLxvUKASQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eug6J25JWrI67JAh7vguuIUyGGtVqMusdmUo7CVhU8A=;
 b=n3IoIRAZUq0AtqAtvafq2wgMjUzHxv4YkdODJn24OutX7RLDYRHxgXNoNTaKzH9mBjnwQ7DeRICeMpYcXn0DGt8fS/Doepmf6v3plWgLuZASsNlnYXLfnWjOvlgge+a23hCmTE7Qsm5oGrVYMvPTdriFuPO1WWW/GL2j4wJY65I=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1843.eurprd08.prod.outlook.com (2603:10a6:203:3a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Fri, 5 Mar
 2021 16:50:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.024; Fri, 5 Mar 2021
 16:50:12 +0000
Subject: Re: [PATCH v2 8/8] simplebench/bench_block_job: drop caches before
 test run
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, mreitz@redhat.com
References: <20210304101738.20248-1-vsementsov@virtuozzo.com>
 <20210304101738.20248-9-vsementsov@virtuozzo.com>
 <f7d24c40-eb01-4df6-52c7-5f48aa30656f@redhat.com>
 <c3c9571b-5999-378e-1915-88eaaf93b2de@virtuozzo.com>
 <efe7e17b-1edd-7db7-174e-c0ed1bf80001@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <809a11de-6633-87f1-07fd-7544c06cdd0c@virtuozzo.com>
Date: Fri, 5 Mar 2021 19:50:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <efe7e17b-1edd-7db7-174e-c0ed1bf80001@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR03CA0050.eurprd03.prod.outlook.com (2603:10a6:208::27)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR03CA0050.eurprd03.prod.outlook.com (2603:10a6:208::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 16:50:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9f2ab03-cf78-4bff-67bc-08d8dff6be60
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1843:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB18436CA39E746F5D14E2CF88C1969@AM5PR0801MB1843.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i6Tw719ji8CjC7lRwpaqLYAHJ1hadlu2VRqFKj/WA8kcTzV4dlIOE4EI3T+U32G+u1HFHtY+Tf5XM9oHw6uhBbdR4fioU1FfTSFAWF3TWn/wPOBAxybOyG1xnvnN6H65aTu9DgRf1+Q/uswPYOCAGB7trOatg/VG3qKI9Yv33QqA5f4P7K86bDqHhrCo6ThPRweFdx9RJ/eXav8uV8U9B1aIGvtm+nhipxJ/SiqcSAMeA8WSwCHvMjHXSRcn8mVkUVQGOvfzU6oAN+yZ3entYTwELopnUDRCEv+59M2u9UVybVjcyQRIitS4ns+pOQneQhxf1l7u4O5mTRN9CI0OFJh6CinMf2cfdzuEheQ1xtWzdoVHibUWT85AUR7AYd6n8tP2dRq82/ukesvSmApVTQ0kdbO4/D+x+je64D8J/sLdf0HfQFEJp9sO1A82PijrqSoQFJlCfi1ycUx34V7FycPqPDlDDVteuUvWg7VpdbKoPWfBZxK/HU/DjhISReJEgH4gtQInGS1o6NPi4iEaCuLF6fcWcudBM7gzMu5rxqh4a+hRcrpfimcim5YKOCEQZUPoMKQJJ7DmDmewwB/qnsu2WiwHgyndjU58ul6TvYs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39850400004)(66556008)(31696002)(8936002)(66946007)(4326008)(66476007)(83380400001)(86362001)(478600001)(8676002)(2906002)(316002)(52116002)(16576012)(36756003)(5660300002)(6486002)(2616005)(31686004)(186003)(26005)(16526019)(53546011)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eklVQ3gyU1dKTHh4dWUwU3ozUXpCUnd5ekg4TW9pUmNxUmZDYU9Md054dzVm?=
 =?utf-8?B?b01WWWE3d1JVbzJKaUtudFJRMVJoTDRWUTBhcldybXhwQkJvU1d4UGh0ZkEz?=
 =?utf-8?B?WEtyUC90OWF2aTRhS2hWWEwrdWo5cVVYMEhKMTJUSloxbkp0ZDFPVG9oUmJE?=
 =?utf-8?B?cFRSSG8yVzJmMzZQcHVFdHgrSWlkU3lkVkNoeWx2L2dqeElGREZmQkFnZHha?=
 =?utf-8?B?UjhyWjJnTmRLTEJJY1NaKzBERU1KZ0dhYWYvRE5IUVBKN2dveXVvSzRvTU9l?=
 =?utf-8?B?cjI4V1B6Q2dGQ1JhSVQybC9Wb2NMT3V3aDBPdFhGc0MrTnI3WVgyVHVMRjNB?=
 =?utf-8?B?UWlEZEZqWmliK1hzOUtxbVF2TDZuRWJHVmtSL1RINTNqSTk5cWhtK0R5Nm00?=
 =?utf-8?B?d2dNaTBiTmdJaTQ0VHhYR1pUTXJhT0RYSEp1LzUyaEIzNnJBR2JmYnF2RVda?=
 =?utf-8?B?ald3VnlwZE9IbDR2ZGlMRklsU0cwRTJ6MXUwNkFtT3FTd3JrQXRxZDhnNnoy?=
 =?utf-8?B?K0RDQVp3N2NuY08vZE1PckdLMUFZTkhMQWdjMzRaTWVkSFQwY3dJa3dwSUhK?=
 =?utf-8?B?c2hta3RxcnFFUDNzSDR4N1N4Qlh2M05EVlNXand1a0FZU1R2dVA1cUE0b3BV?=
 =?utf-8?B?VXdxNy9FMHN3VGsyVEZTSTU5ZDFZaTBJcnczYldHblgwNFZkb2ZrWlpHYzBJ?=
 =?utf-8?B?UmhEaG4zYjJwQmY1cTZxV09rTlVzVmxmRlVPS0pmdFRNL09RdFM5enRsRWFW?=
 =?utf-8?B?TC9VclF3V1llZWZicHJGNWJIb04xK3F4TVAzZ3UwQVFVYjBJZmVXemt5YU1O?=
 =?utf-8?B?NVc1ck82clQ1Si9aY2lkU3Rha3o2YVU3alR6SXc3aWNDMHlubWpORjg1T3Q3?=
 =?utf-8?B?ZFEvUkw1c2FFTG9hWHRGbUpJaHhKRUQ2VDRMMjVFUXhyNXFON3hJSGZIWWJq?=
 =?utf-8?B?OUhBU0JVeHJyWGt5Z01mMzhkMjJZNlVpVXZSTCtIK2xBZ2pLYnprL0FGdk1W?=
 =?utf-8?B?amJYWEFWZ2hmODhPL3lLWmU2a1dhZWtDcHhqM2ViUi81by9NRFJ1NUhsUE4r?=
 =?utf-8?B?bHZZMWNIZ29yTXN0OTNjWmtWWGtzenl2bEpadzdGeVl5YmhnejA2QUxXT1ZR?=
 =?utf-8?B?VDhyV0tIbkp5bGxaL0xiSkRveDNPS3BwcXRBN1dzQXFINWZ0ZXlhYmlBd0Zt?=
 =?utf-8?B?TzRCR1EwMVZPUG5zYlYxRFN3cElsa2VpdVdTMWZ2THRVcCtqOHdhRVJOOFJL?=
 =?utf-8?B?UW5oR3RwM2tpdFlEckdaRlo1dnBiUHpIYXk3QU1CTlBxMGhyKzUyNHpESEFi?=
 =?utf-8?B?enlUam5RSE9HN2lWMHJIK1poZ0Y0MVlnbDdmdDJDcEZXUVZaLzlxUisxdGFU?=
 =?utf-8?B?SXc3V2FCdXNpS2FrMElWaVJDMk1YdE5kL0hXN1dFWmJqTW1mWGNNYzR3SXNP?=
 =?utf-8?B?MUE1VENJTnE2QU5OYjd4VFdEdllwZEcrUCt4MkNweldzQ2FiTFRxNDU5VEVq?=
 =?utf-8?B?NEpSREM1eUwzVFdhRFAwSCsyN3Uza1dFRG1CaWd6MnVwb1hEUisyU211aVB3?=
 =?utf-8?B?K3h5L0VPVmhsWG9xQTFna2R4T1hUZGRJVC9Wb1puNjVMVEU1dDZwL3plNndw?=
 =?utf-8?B?VUtPQnFybEFEOVZadGtDMU1IeHBoNlNXTW56N25tZkVoV0hKR0JRS01DdGtE?=
 =?utf-8?B?aWlHWS9SbzRGQW5rWHVER3EvTGN5WDU5NWt3d2hxdVpRUG5oTDhjTVlUbVBx?=
 =?utf-8?Q?ksYSdc46c0mM8MsRBPSKdAUkvNL2/WN7ZK+taEY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f2ab03-cf78-4bff-67bc-08d8dff6be60
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 16:50:12.3212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KsNt2bFilcesIWgWlA0fIdL0501rGQhz9M1pshRLGZqOrV+vfNDgbmSDY2IM0KR0uUpTwsLSmpktq8CpWNp8+i04bxYOFhMxmqtQCawZqYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1843
Received-SPF: pass client-ip=40.107.15.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

05.03.2021 19:30, John Snow wrote:
> On 3/5/21 4:11 AM, Vladimir Sementsov-Ogievskiy wrote:
>> 05.03.2021 04:30, John Snow wrote:
>>> On 3/4/21 5:17 AM, Vladimir Sementsov-Ogievskiy wrote:
>>>> It probably may improve reliability of results when testing in cached
>>>> mode.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>   scripts/simplebench/bench_block_job.py | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
>>>> index 4f03c12169..fa45ad2655 100755
>>>> --- a/scripts/simplebench/bench_block_job.py
>>>> +++ b/scripts/simplebench/bench_block_job.py
>>>> @@ -53,6 +53,8 @@ def bench_block_job(cmd, cmd_args, qemu_args):
>>>>           return {'error': 'qemu failed: ' + str(vm.get_log())}
>>>>       try:
>>>> +        subprocess.run('sync; echo 3 > /proc/sys/vm/drop_caches', shell=True,
>>>> +                       check=True)
>>>>           res = vm.qmp(cmd, **cmd_args)
>>>>           if res != {'return': {}}:
>>>>               vm.shutdown()
>>>>
>>>
>>> Worth adding a conditional to allow "hot" or "cold" runs? nah?
>>>
>>
>> You mean, make this addition optional? Make sense
>>
>>
> 
> I was thinking (along the lines of allowing both old and new behavior, in case anyone except you used these scripts) of this sort of thing:
> 
> def bench_block_job(cmd, cmd_args, qemu_args, drop_cache=True): ...
> 
> I don't insist on it; I was just earnestly wondering if it had any utility. If it doesn't, don't respin on my account.
> 

Ok, thanks a lot for reviewing! Still, I think, I'll resend

-- 
Best regards,
Vladimir

