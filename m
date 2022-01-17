Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E9A490369
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 09:04:17 +0100 (CET)
Received: from localhost ([::1]:44800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Mzw-0001pq-Oh
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 03:04:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9Mxx-0000vu-Ab; Mon, 17 Jan 2022 03:02:13 -0500
Received: from mail-db8eur05on2090.outbound.protection.outlook.com
 ([40.107.20.90]:17025 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9Mxt-0007Py-F1; Mon, 17 Jan 2022 03:02:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEdhbSreyivkuDtziYagkUbmum+rBKrko/meU7VpvPYJhG3UqNJEBNlnE05DvEkdHn8Nkj4e5GqhUJTpwH0KtC9ARQD+3b0Y2D5Vg8XozeUpY8fIRZkDFSTrcLe6+lUsmdYp3T62B5CWnNoPYbeLlmuZX5n/hiaTSs8I70Bz/ucVi2sqew7a+e3Ly0/mR8nrD3ZsgKCmFx+tzJfwIaDG6VL32N+XRCtdGglrCX5WMVheaMd3ZRAhCtwahy3wF+0EzMz4myPs1wJaFJ/mEBBiPqcrOFFYJ15bTsxGQRVSqeL7pUqza+Gekz8of35MF8zyQe1oAW/sx7ih3AS1trGr0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvy3XhN+qBN0jf8fWHRUOBYpu3aV32bfeBi8jWzo4FQ=;
 b=jmIotXhh2yGN4AevZSXW7nJx3QTvNjapsDGX6Br2M19k/qrSM4ZlJmOAdlZ8YANgYAYrUAPOEanpEmp5YHdqAGzsddWMGxj2Vw0UoG6JCZKW4DRrBGzKImHQhYW/xSbVajHf12E+7IlbkLse34kous77BNv83UfOo1kvkiZQLBSjcJNhRg/GyDSl/X+22TV+Z30vnaRsu6rXqPkKWnPoz9kIBMFjqYCtKa3S3thIeSGB/ATym7kR10k/BCwiI1DEppJggDigj93HBZivriewFA7SB3Lsem1KI89AaIh40SxQlnF8QZh92I7o37sRLrjwBRn5IxN96AAgxMxwMObZUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvy3XhN+qBN0jf8fWHRUOBYpu3aV32bfeBi8jWzo4FQ=;
 b=D6XRqKKSthgGFqG8wQgYQwor18Rix10/GOXGSFXReaB6eATtfL8J238YWUFXqJhfQkx01Q/viZX9BVDBP7KeVkCudcGfYyd7pLgcsRYR1erQcGueHQIOzHBf/I0XTh6bEvzpy1yJlv5zu+xVRh/ps2rFbYTwq/7Bc3qe7tC2vQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DBBPR08MB6137.eurprd08.prod.outlook.com (2603:10a6:10:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Mon, 17 Jan
 2022 08:02:04 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917%7]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 08:02:04 +0000
Message-ID: <8fe61f8b-bef8-1fde-6a7a-270a9b63b462@virtuozzo.com>
Date: Mon, 17 Jan 2022 11:02:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] simplebench: Fix Python syntax error (reported by LGTM)
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org
References: <20220107153019.504124-1-sw@weilnetz.de>
 <CAFn=p-ZYr+D54GzYKt5cxuJQQTARGQTvkkgVfhLGEeLczFt-Tw@mail.gmail.com>
 <42ac8990-8733-fa68-c4b4-c54a82ce43f9@weilnetz.de>
 <CAFn=p-bgXrmUj9NXM3uKfi9V_YSDQA1_b8e-yGXrN5=G8eyYyw@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <CAFn=p-bgXrmUj9NXM3uKfi9V_YSDQA1_b8e-yGXrN5=G8eyYyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89da6459-eeaa-472a-02c1-08d9d98fa61b
X-MS-TrafficTypeDiagnostic: DBBPR08MB6137:EE_
X-Microsoft-Antispam-PRVS: <DBBPR08MB6137782BA8614F012CCE6208C1579@DBBPR08MB6137.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7e0sB4uUNy8f0FqypZoZiSqLcj1vj54dln2nkfx55afHSBSb85ZEsHcJn2E7YOP1EC3LthhEkLXcskhwT3gHFJdlMWB1FL76kCB2JraFT0b+oYw0wZWAOdwrjhEt2yL9vkjA6a0st0EwjVgiwg6WpBeHKAKxK3hF43jWS/lPJPtJ+zy9usBzHScgk4qBR+r11DIfKmTiiNykUmTrdiaFibdSHmJDtNADM7PRaDKvV7AY21iMVNEt2FIlcg41fbFE0RdThuxJ8CYqzeeDRKHQHCT6PyixAoZcEuxJEbgOs/1dKaQzF+FJTsfir772x4v5ixe5R417/tfUK7LY+Jk1oi4mfod4scVurJKdOy8EHvBA9zo5MfgqgkGXzaIq8tKbQ5I0BuengUV64aDNoj1BBSUb874iSjGnrz0v2GWJUw/WzuPY7yfsRuNa4rPjFUTukOUVaOxHN4jiSDdtKxthfCfON0RDRvTMJvm+zX0rQQiXlzmFmzvIL+P3PoYE7muQL5t+b25lb0sR/Rz4Xzl6RgBlXYprxN69AAs3Uio515qhYdh5fNLCpamlpc2ovQc7N8sOFxaqduIapK8ZxX7juxg/Vpngg9EOKrPbxq9mZN3e8DXUINNtk3/YwAL9d6sMvc95WKwPdx/s7iJgBUYYo/SM4wOaQhQ+eeHvO0NEymxouSEjljAWR0fd6hu3+4gjUbf1qf6B2kSRrbGy/cHvc9yKaQwMU+B6iaDOBrJoA2QcyrTL1VnBEs57+wUqY5rCbSCM9Fw5/8RvyRGYgGONEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(31696002)(86362001)(6512007)(8936002)(4326008)(83380400001)(26005)(5660300002)(8676002)(6486002)(66556008)(66476007)(38350700002)(66946007)(38100700002)(316002)(6506007)(2906002)(186003)(31686004)(110136005)(508600001)(52116002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkVMRk1xUUpZTVlvU2hDR0lNVXdWbEVCSG5HY0ZlMXZ6VEFtVWpvUjZKQUkz?=
 =?utf-8?B?c0Q1SHp5S2JCbUthTTJDWmo3WTRXNXBxTjdtemdwdEhOcmhXRzE2eFpXZEpv?=
 =?utf-8?B?SVVmdUV5UHpSNVMyZUMzT3NEUTNqcW04aHphMlJpWVU2NHdQeDJIN29KalIz?=
 =?utf-8?B?Z0ErYzRydktQanRpQklwQ0o3b2o4aWt6N2lPMzlyZTV5cmpDTXBTRXgzeGp0?=
 =?utf-8?B?UlVGejZaOFVkM3FMc2E2L1FidTg3ZHoxUEF3NFdkVWFkTThKZ2QvZmNvVEc3?=
 =?utf-8?B?eDgvOFp0U3FsczhhdXZZSW9DbXM1UnVFM1FucWZHazJVeU1mRmE2RkJXSDVk?=
 =?utf-8?B?SlQ4ZTdEV2tDRUcxeEpjS21sWTljT21CTW41cE5JQ3Y0WGMzQW82VmNwVDNL?=
 =?utf-8?B?ang1S2oxT2xmOVJ5cTdFd3VqZXlTU2NUaW81bTVNdS93Qk5Oa1pPM3JPelZ0?=
 =?utf-8?B?dzY0eHNtTll1aVFvaUxnTXJlSFBpRkcwUTc3cWRySXQreFI0Z2czRkVTWWM4?=
 =?utf-8?B?VXJTVDNhWW1MNWR3ZitZRE5MaDBqRzhyM2sycjR5b0NIamlPbzRkWUgyNXFx?=
 =?utf-8?B?L2QybnBFSEtIeWZhZmh1bGNQdDFOUldJWWo3VDFwSStpSEJVVG9kZHN6cml1?=
 =?utf-8?B?aFh4T3JkTGwwUzdqR0lCNXRsSVFmMVVaOWc5RncweXRTQzVUOEJUT2xDcGhm?=
 =?utf-8?B?cGJHQlNDRTduSUFFdkpteDZiSzkrcHdHNEZlNXJpNVNwYndDRWQ4ak5BcnNo?=
 =?utf-8?B?TXpINTllRFBRNjFYb3VGeTN1UzRRWTJmSUNDNDZrOS9zZDV4UUMvN1hxQ1RK?=
 =?utf-8?B?NHd6Z1o5WSt0STMzOVduQzBSYjZFSVlVWkQ5d2dHRW1LamtBc3h3dCtLY2hj?=
 =?utf-8?B?b3VCT3BKNDk1ZUZDdE82VTBkeXZVRVcrbSsrVHpFR3BSMnE4ZjBTSHNiWGpQ?=
 =?utf-8?B?Q0poRnhuZ2Y5clZZSmxsM1UzQ201TE9vNWlPRFp1TTFJRk5RYStFcU92TVBK?=
 =?utf-8?B?eXU5VGNBQndPYmNPd05OZ2YxS0owbkRGUG1ORUdOd1MxNVpCSnRFVGthRDFm?=
 =?utf-8?B?Zzk2WEhlRUc4aGRETTRabDkzT1ViUUtRL2Z0aUFVYk9aM1U4azNwcHJJYlR4?=
 =?utf-8?B?VFp4aUZMSkdrcHVPMU5Jc2YySmFEelBoc1ptSHdJdjcwS1FESjNzOE0yZDdk?=
 =?utf-8?B?SFRCWm5XUVlBV3l6clkzZmp0MkpVY1VPSXVEVDVmdml0WVhDTUdFSVBSMnVY?=
 =?utf-8?B?OWRHdGNzTHdtNE5XSDdZb0xiZDVuby9jVXc1RjhVZ3ZCckxDemZJY1Rkc0p1?=
 =?utf-8?B?K3FuT0V3ZHZOMFRoUkd4emFPWHNOWFFmTUdCM2xOZjMveU54QURMZi9XZFZs?=
 =?utf-8?B?MVZBa2I0TWphRFhSdXlybW81TkRsWXNmeEZ0ZzJvV0xadkNJbEJDVFM2R1B6?=
 =?utf-8?B?Z0dER05qN2lCdTNlVzFjOEQveGJLSG5pVUhsNnhyZjBKbXFWM05NZi9LTUxY?=
 =?utf-8?B?bkJyZEZILytHYXY2RllwNFFXVHdTaS9YNmgyRnpVMm5Jc2lRc3UyZU0vUlNr?=
 =?utf-8?B?SGlvVVlkajR3c1lBakkwbUREaFo3NUUybEhCRjJKZ3FQQ0p4Sk9rSEhQNG5u?=
 =?utf-8?B?cFBnMExnZTgyL0wrQk9NbzVGbnJWU2NhbWhVS25jbDNMUzVjQ2F2S1V6SHRE?=
 =?utf-8?B?Z0dqTXVQcStzeXJnSVc3K0xxS2J0S0pZOWtPQmg5emRVYzMyNkI5Q0xjQWdz?=
 =?utf-8?B?cXNIWnNtM1pDQjk1OXJLWGF4MlNvdnVYVW1MUHdOcXRJUUxEelFXN0poTXBi?=
 =?utf-8?B?SHc4NlNoVU42eW12TXBiRjBVUXJsVWo4OWdCaktkaVQyaUtFb1MrczhDMUVY?=
 =?utf-8?B?RDJnNU8vNEh5MU5QL2tiSHIvb1RGMTJEaUhFUmhLSkp1dGw0bzRyZ3g2OHd5?=
 =?utf-8?B?MWt4OVBkWVd1K1lCRnBicnNXck5menRrTFFHWXhrMmdZZVg0RExQajA2ejh0?=
 =?utf-8?B?cEtoWUdqSHRhR1h6UEV4My8vRXAwOEtqcGlyZlhrb3BSQTB1b3VSY0pESTR5?=
 =?utf-8?B?VWZDem9IT0Q2YkZYeXBwUEovT0gxbEU1OWJlM09pd2oxRStrQ1U4UXlWU3hH?=
 =?utf-8?B?Z1Y5MnFHa2VCTnJXSm9tZ05pY1A3Vm9pQkw4TnNDVE01K04zSVlVdGUvcDVI?=
 =?utf-8?B?YlpEQjlMRi9NanFCMytwNVZZQ2EwdmROQXFXcmVBOExLU1dZdEdUK29MK3pm?=
 =?utf-8?B?MGFTSXAydTB6dzVydzFzWHorbk5nPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89da6459-eeaa-472a-02c1-08d9d98fa61b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 08:02:04.2942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dInCQZ7r8rKUmuHWTIAk7+t5ypmqlI/ZlEukYAhd3VrHnpmQSnypFVQ7EMTdma6MnPWeOAhYEYhxQShiE2nMKD0HQEAqiJ4UhXkyQ5yfTxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6137
Received-SPF: pass client-ip=40.107.20.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

10.01.2022 21:09, John Snow wrote:
> 
> 
> On Mon, Jan 10, 2022 at 12:57 PM Stefan Weil <sw@weilnetz.de <mailto:sw@weilnetz.de>> wrote:
> 
>     Am 10.01.22 um 18:08 schrieb John Snow:
> 
>>     On Fri, Jan 7, 2022 at 10:32 AM Stefan Weil <sw@weilnetz.de <mailto:sw@weilnetz.de>> wrote:
>>
>>         Signed-off-by: Stefan Weil <sw@weilnetz.de <mailto:sw@weilnetz.de>>
>>         ---
>>          scripts/simplebench/bench-example.py | 2 +-
>>          1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>         diff --git a/scripts/simplebench/bench-example.py b/scripts/simplebench/bench-example.py
>>         index 4864435f39..fc370691e0 100644
>>         --- a/scripts/simplebench/bench-example.py
>>         +++ b/scripts/simplebench/bench-example.py
>>         @@ -25,7 +25,7 @@
>>
>>          def bench_func(env, case):
>>              """ Handle one "cell" of benchmarking table. """
>>         -    return bench_block_copy(env['qemu_binary'], env['cmd'], {}
>>         +    return bench_block_copy(env['qemu_binary'], env['cmd'], {},
>>                                      case['source'], case['target'])
>>
>>
>>         -- 
>>         2.30.2
>>
>>
>>     Good spot. If it's not too late and not a hassle, can you add a fixes: commit-id in the commit message? No big deal if not.
>>
>>     Reviewed-by: John Snow <jsnow@redhat.com <mailto:jsnow@redhat.com>>
> 
> 
>     Maybe that can be added locally to avoid a V2 patch. Here it is:
> 
>     Fixes: b2fcb0c5754c2554b8406376e99a75e9e0a6b7bd
> 
>     Thanks,
> 
>     Stefan
> 
> 
> Got it. I just got back from holiday today, so there's still lots of mail to catch up on. If nobody else has staged this, I will do so as part of my python fixes this week. Thanks!
> 

It would be nice, thanks!


-- 
Best regards,
Vladimir

