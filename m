Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC74452C99
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 09:22:27 +0100 (CET)
Received: from localhost ([::1]:53722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmtjW-00013j-9p
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 03:22:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mmti7-0007xA-GR; Tue, 16 Nov 2021 03:21:01 -0500
Received: from mail-eopbgr80113.outbound.protection.outlook.com
 ([40.107.8.113]:8083 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mmti4-0004zK-1Q; Tue, 16 Nov 2021 03:20:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTrnIR3NLNfKVmauoN/wf/B7W0g61E9LHMMxNsMD3mLAZt/mJUTmj7hyIYl/dUpDzSsnu/QIOR8v4rM3F1tPqrfbJpY/aRQdmdBa62TW/ayWKwfqzDSLT4sfaVsAOOx3T5mEwFPW1eQmj+mMcBGKOYPmYeL/AqLsuaMyD3NcAPpohLV4H4q0drfIZbRZw/zN9QkrLi0ObmQxdMkaugHp4dT4ARwxGYu1xoF85diGQiz/78QlHQcwJxLThtqZKvKgH+NZvW39qeYL3C1BOWjconMZXUvGwciDZa8mf6huROwQXX+4GxrKTYo+ZbtjOApKOPKsmS9onZ1zbwSgE6t4AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dI4mOUlweN3spkF4SZpydH4Ma8vhsenXLt5TGcBTrnw=;
 b=UfWj/VDUQxVRW2XGRLxUZSh48i2Q7yPR+hYBBrfxMWMFAS3+PC2Sv2yGc4bpR5aEO5rTcrv6W14FrhhpM/K5qHiwUlEP5bj21y+nDS97n/G/7Gs3cPI8y/Q1zboOzhEMGbO0MDKFwlDdFOAOwdtWIHrQ6HW7KUoQ6OfNixUDkdRtZTI7X6M4dppAA92f+3VzUlugTSxd4o4X57F25Dn35pk8nT2UAwxfZyZV4FAr88t1eSKq3gNvWiuW7TUExqaBZtwy4Aemv6Md0OX7f45XKKzX1AKWw0LphKqpAOwE4lNjCvHSfXU/KjHkjfVgeIvS8JehCG5yjB8AlYuI7jykUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dI4mOUlweN3spkF4SZpydH4Ma8vhsenXLt5TGcBTrnw=;
 b=hRadANQo1ISy98bhprPl7nBkn68p4Q4WsRjS5plygHgeoKCJQ7yw8MrsGTklHl8fyVInUeFz9GaPILtNxyWieSFZ6ZfeQOpJAY6kYqYjn8qYCuswbjgC60by4Y0KA/gbYifendRci76e4j8nR5kdGTyHBnJ2u9OFqYBm0GtHpzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB2993.eurprd08.prod.outlook.com (2603:10a6:208:5d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.18; Tue, 16 Nov
 2021 08:20:51 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.022; Tue, 16 Nov 2021
 08:20:50 +0000
Message-ID: <acc6f14d-c321-4793-c647-d8208ff29f61@virtuozzo.com>
Date: Tue, 16 Nov 2021 11:20:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 10/10] iotests/030: Unthrottle parallel jobs in reverse
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20211111120829.81329-1-hreitz@redhat.com>
 <20211111120829.81329-11-hreitz@redhat.com>
 <243c7e9a-88e4-ded3-721a-5f040aee36d5@virtuozzo.com>
 <c5a9a63e-e859-f6fe-d694-2ad4134d8bdc@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <c5a9a63e-e859-f6fe-d694-2ad4134d8bdc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0224.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::21) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.233) by
 AS9PR06CA0224.eurprd06.prod.outlook.com (2603:10a6:20b:45e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 16 Nov 2021 08:20:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 220ecc60-fdbb-4744-7f66-08d9a8d9fffe
X-MS-TrafficTypeDiagnostic: AM0PR08MB2993:
X-Microsoft-Antispam-PRVS: <AM0PR08MB2993FA6E404B1C202F7E9D86C1999@AM0PR08MB2993.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hj+HK4x50AJta83k4FhfhE70sudU8kg80aRyDVixNw4urVy4t71Cg7zZzJ9KUApJfC14jPAHe21J0CQ3MOCo6FzOe7W0MhrzU+zvL1sYjytPBXGOrVKSQOL4GMpr5zRC57PEk4BN6/gq8ZAcL8FRhmaF3kdVNq28UaDWbvFsD2oaht0BSlehMmn6e1bR1/qcF240FBoAecXUm1gf3Etx4uiUqOfVhl8CticfTc9GiMauEhLJJ5rn5qK1zh+er1/Segqa8mU4t9ip+7xMo5IyEpJ1MvC0+gzfzZvH0u5/5+7MVbLZfpdFeXYv/IJz8wgfilDC+Pz8Vcqq4IAYwhYLLL4IkTdUov0mPLL1sF3zg8riPbmFNfMpgdyR36EMbnRGdyoOF7JaFWz1TD7QdCxvk190yOh6eg2YMkCqDtL2fu5kEE/EImPRi1y4e9xcdlUX6rjU3Av7XPbkkNwn56xhvkrIT9/A0rhilovSMCw5gfNh13FE09Ua7iurGmrOClH55XoD50aZxUutAzLA3FGulgcXJEdrZBI8uSVQqjDof+C0UrYrtiklhmB7dEU4wczC/P2Zfx4nlND852WwSQsmrJVJrzC8GWs5TMyVbqOVPZIfxK3mGr+i3fwZ6JnU1eCEx0N2yhLKd0ZVU1ko1FIr2Ae0jMWN6MHr5qkLY6jQWDUvIlVzC3U2UvcuwsIQcUCb2A9fqGMvizw4RVOMJtH1NNfp84toiAOrxSoHRTdUF6jxKk21d3F1IlWnq1gF6M0tmzovA7NVCDqkN6qNi8V1Zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(16576012)(86362001)(53546011)(6486002)(52116002)(316002)(31686004)(2906002)(38100700002)(38350700002)(4326008)(8676002)(8936002)(508600001)(26005)(31696002)(66946007)(5660300002)(36756003)(2616005)(186003)(66556008)(66476007)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFFFRHVPYTh3ZE13dSt1WGpXZ2FoSzE3U00xeGI0WHNLay9XT1I5TFFxQlpI?=
 =?utf-8?B?enJpRVF4dms4bk5pNmFtNnhDY2NpbE0zVXVkNW96MFpnMUJDb01reFZKYU1J?=
 =?utf-8?B?T0Fzc3NkRnA4d1dMWXRFRzhmVGF6bUE5MTFmdktJWUxCSEFBU2pJSGFZWnZG?=
 =?utf-8?B?TU16QzdaUERjMGFxMXpUcWRmZm1hNWVlVjdGcm80eUhHa2pFN0llSmJxV21i?=
 =?utf-8?B?ZjdPTU56MDlxRDNkTDJVT3lhOFRuYTE5SUNkK1paeEQ3K1phOFpuaE1PcjRs?=
 =?utf-8?B?UytsbytGMmJ1VXFzRVVpcFJiKzR4d1hrTm1Gejl5Q3dtek5jZCswZURHUHJC?=
 =?utf-8?B?VkM4b2diejErVXJXMGhGTUZGWUJKU2xKZS9UWm5lRzFLcXBpQXRXTkovemx6?=
 =?utf-8?B?M1FrRElsa3JqbE9FRG5SSkhrdEllZUxDSUpuOWlGMzdyUWFpdC96MU9lME1z?=
 =?utf-8?B?V3gzWDUyRGdoM1gvUmE5dkNJRkpORExXQlg1WlZrKzhvYkdRNEV4bVNxSWJ0?=
 =?utf-8?B?eDVLN1d5cDRRdWp0ZXFoT1hWY1U0RDl5WHI4ZThvcnk2bHltYU9LbUFFM1dP?=
 =?utf-8?B?NkJlM3pieVZpVFdKMWZJdWd0WlpISGs0RUdoNGl1aUtPZDJ5ZEd5NFhxOWsx?=
 =?utf-8?B?QXVBUG9JS0p4OGdWYWpraWhJRWF6VC9PM1JKdEJWVCtBUnFjMFJZaFlMWHN3?=
 =?utf-8?B?eTdUOENmVTEyQkpabUg2VnB5NFgzZ0RXdDRLcEE0dzBGS0dHcDV0eERVWDJk?=
 =?utf-8?B?T3lCaEx6TVJzRkhBQlpSQnRPYXVWSmpzK25INmR3UEZ2NnNUaENmVEZGcGxv?=
 =?utf-8?B?dGFreHFUYXN1N0M3S2pyNms4eE00QnhUaW1EajlwSE94cERFMHZBdkRVaTRa?=
 =?utf-8?B?TmxBQ1lod0hOUytQR0tWWlJMTWNSU0pVV2lwZFVWR21paDRxRThiYnRrTm94?=
 =?utf-8?B?ZGVvcTdXU3NiUXFETXYxdk55Yml5c2p4ZENaUzhUODdTeWt1QkJYYnNWd3ZF?=
 =?utf-8?B?UzBieUNvYm9TYzV1WnZiSlhyMVRJMXdreGRubFQ3b3NyaUpNSGIzNGZpTEFR?=
 =?utf-8?B?R2dWVHZIdEZab1luMm1YSTMyTEtsbkQxSm1hdG5MOTh2a1ZTNXlOQUFIZWNS?=
 =?utf-8?B?LzRxT3lFM28vODZxWE42Y085RDVjOE5IdTQ3bXhkRllUbmxvaHhkRUxGbTlB?=
 =?utf-8?B?cGFXU3U1NWdBUW5NL3VqNHZTQUVKZ1Vtd2xkaFFxUjcwcEV3L3pnMzNNOG91?=
 =?utf-8?B?QVUybCtBRVZES0tla2poeHZVNWc1WjM3eFVPS044dGtycmowWjNzTHpucFF0?=
 =?utf-8?B?bjl4R01seUo5aWJCWHdaVWdPUWJBajY5NnVrN2Fsck1CMVFSVm1zNXBwRnph?=
 =?utf-8?B?dlVyd2xZOTdvOVpFZWhnaG5BcFBCVlRhQkQ3My9qUitFUVBvRGhUK3hjWk13?=
 =?utf-8?B?SFJZWTFXK2wyaFVFL3JubjlERWNONFVlZnZoRHFtQTl0Rzg5UC9qSWRTNkFR?=
 =?utf-8?B?Wit4cFk2dEtzaEFlSlZ6NmlhZEtPMXVQd0VsUVpodjlvM1d3Z3NGKzZuZEFC?=
 =?utf-8?B?TW9NaHdsOFlPa05Yay83MkpSUWsvOUQzZVU2RzAxcERETWc2VTFyb21kYUky?=
 =?utf-8?B?NG9YMjhuaDc1eHhHTUFjL0ZzVmZQU21UNitQUlFQS0ZpMGx6WWlJUVBDUThU?=
 =?utf-8?B?RzZFdGNIaDRFTXoyL3hIeUl2eGN5L29YYmo3cGtLUXliTFhycG1HQitjS2lt?=
 =?utf-8?B?N0FWK2tKcU5nVzFpL3JrSG1UWXh5TFd4WFZsd2hUdUlYeTBITGRVMWNzUDZs?=
 =?utf-8?B?eWxPVGlkcUMrRzVoUTdQNWxEdms1UWJGM0NOdWhieVY2OHJpS25kWTdDY2Nv?=
 =?utf-8?B?aTEvQzl4NlE4MFVSc00zTWFpdGNjYktCU0RQTk9mSU1TTWNpd0hTRlBBV2d4?=
 =?utf-8?B?aUpiTG9ySXVVQlpVUlRCOW5RZUt0VDhTd0ZYRGxua1Q1dzlkVWdDWjVRa1FR?=
 =?utf-8?B?dk12VWM5cGFZSzB1NWtYd0dqYnZ3dlJacWpTeUl1Z0JkSHVEREwvYUpHc2ta?=
 =?utf-8?B?QVc4OHp0cGFaT0dmRmlCMURvbWdvNGJYcDg2M08zTlBjczV3SnA5aVo5VTFm?=
 =?utf-8?B?MXdMaVlSSTBkSWxSNURSMzBEZUpCeHI3c1V6SWZYV1V6eUlqMk1FTHVTb2hh?=
 =?utf-8?B?SVc1NE1KaS9wOWRrOEdMRTJvekUwaS9neEIvRVgyZjNWTXBvdml4d3Y0MHBJ?=
 =?utf-8?Q?WyaxrrwjARmyjPno5zfijZVNj0Lm3FpqHpgsLDp69c=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 220ecc60-fdbb-4744-7f66-08d9a8d9fffe
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 08:20:50.6949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/vy1sg9WCRmf2l0zMreOD6vjkGrmKBF82bc058+7X+nO0IEJrzQTNf5rQqGX9vAWKBJZCaGcS8L4EUf/pAZMhqgT1P6yjlhm2tdzTPPyUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2993
Received-SPF: pass client-ip=40.107.8.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_NONE=-0.0001,
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

15.11.2021 16:56, Hanna Reitz wrote:
> On 12.11.21 17:25, Vladimir Sementsov-Ogievskiy wrote:
>> 11.11.2021 15:08, Hanna Reitz wrote:
>>> See the comment for why this is necessary.
>>>
>>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>>> ---
>>>   tests/qemu-iotests/030 | 11 ++++++++++-
>>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
>>> index 5fb65b4bef..567bf1da67 100755
>>> --- a/tests/qemu-iotests/030
>>> +++ b/tests/qemu-iotests/030
>>> @@ -251,7 +251,16 @@ class TestParallelOps(iotests.QMPTestCase):
>>>                                    speed=1024)
>>>               self.assert_qmp(result, 'return', {})
>>>   -        for job in pending_jobs:
>>> +        # Do this in reverse: After unthrottling them, some jobs may finish
>>> +        # before we have unthrottled all of them.  This will drain their
>>> +        # subgraph, and this will make jobs above them advance (despite those
>>> +        # jobs on top being throttled).  In the worst case, all jobs below the
>>> +        # top one are finished before we can unthrottle it, and this makes it
>>> +        # advance so far that it completes before we can unthrottle it - which
>>> +        # results in an error.
>>> +        # Starting from the top (i.e. in reverse) does not have this problem:
>>> +        # When a job finishes, the ones below it are not advanced.
>>
>> Hmm, interesting why only jobs above the finished job may advance in the situation..
>>
>> Looks like something may change and this workaround will stop working.
>>
>> Isn't it better just handle the error, and don't care if job was just finished?
>>
>> Something like
>>
>> if result['return'] != {}:
>>    # Job was finished during drain caused by finish of already unthrottled job
>>    self.assert_qmp(result, 'error/class', 'DeviceNotActive')
> 
> Well.  My explanation (excuse) is that I felt like this was the hack-ish solution that I could have gone for from the start without understanding what the issue is (and in fact it was the solution I used while debugging the other problems).  I went with `reversed()`, because that really addresses the problem.
> 
> You’re right in that it only addresses the problem for now and there’s a chance it might reappear.  If we want to go with ignoring DeviceNotActive errors, then I think we should at least query all block jobs before the unthrottle loop and see that at least at one point they were all running simultaneously.
> 
> I don’t really have a strong opinion.  We can exchange this patch now (though I’d rather not hold up the rest of the series for it), or have a patch on top later, or, well, just keep it for now.  I think the least stressful option would be to just fix it up later.
> 

OK, I agree


-- 
Best regards,
Vladimir

