Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB0B49B2C5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 12:15:20 +0100 (CET)
Received: from localhost ([::1]:40058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJnC-00075k-RV
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 06:15:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCJln-0005Ri-7W
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:13:51 -0500
Received: from [2a01:111:f400:7e1b::706] (port=31875
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCJlk-0007Nj-FC
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:13:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gg36FhahbFKf45vbVGiQtx/VTjASZG/DqRTC6Wm189EM7ivBz45afbZKHD/6ocAoax91KMCQXioI8j9dFUPoNF4xqT3aY/BxefJmAy5PoO9b8eCod1/f21tnbg6u943BAMcYsxwL+nGMQiXJtvVaVeaxrueorURUixJxGD+X9Qfz3KoSONhUlIUQphVdoIXV3VtygVMqpxspElT2dS+UUNRlnTl8xuQnDSymlxB4XWZzpE+yPScgdTXQZOMffaoYwDLGZU8c2VAnNBZC8VM6LkK9cabOf67MEw+UHVhwkJqevwtWvXt/B/VWBM2a3vUD27GeQy2EB4WuOMQgqukoSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNsQGu4LnV/LMyKAxperJirYC/Ndojb9wJeBqeComCw=;
 b=DB20co4/IVUJ4F3F2BXuDlHvykv10MTZVpOxtq6Q3rIz7qK2CPAseOrlxlQHcpzj32CcYWbv++mB1f/iMCmh2fOrH1AcuHcKLj1c/E0Ftq4R9YPfIqEAYt0pYX4sWQqOGPs3ZPiJUDVwKFdCdVN48A2Xv+1eK4uj5w6EkN9slP9iLsfNjP5Z0kD2i3fSL4GT8OA5EVdLZsNQrZpKM+H2YcbhVoYMVVjteasw7CtyOyODFq2X7AdYMN3CnLUwfU771ZQMU4UKbwBSNXt3NhspNZl07HIvi7PO9RZV7pbQIymN3iwGRvb6ruMdvDyPfSHVwTindIEd46W8dGOkge1wow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNsQGu4LnV/LMyKAxperJirYC/Ndojb9wJeBqeComCw=;
 b=gjzCvVkT1eHcButAeX6agZaGCcpnaTLetxoTzND0xHwW221QcZX45Qff3Px0bUaIQNQ/ciM8zrpG6k4UQS+hHd5hr49uA5IcNcRn8kZIyVGQ4jlcCz1oFaopvDMcMukOH7li/HKm0MV/7dYI2y0UY14VKUYGu16f5Ip1fWAjLas=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB6370.eurprd08.prod.outlook.com (2603:10a6:20b:361::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Tue, 25 Jan
 2022 11:13:42 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 11:13:42 +0000
Message-ID: <87cfc19e-5eaf-4c1b-59c0-29870c063939@virtuozzo.com>
Date: Tue, 25 Jan 2022 14:13:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 3/3] meson: generate trace events for qmp commands
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, michael.roth@amd.com,
 jsnow@redhat.com, hreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
References: <20220121162234.2707906-1-vsementsov@virtuozzo.com>
 <20220121162234.2707906-4-vsementsov@virtuozzo.com>
 <87ilu82jtk.fsf@dusky.pond.sub.org>
 <fd9a18be-1add-89c2-3da3-fa72c5419d44@virtuozzo.com>
In-Reply-To: <fd9a18be-1add-89c2-3da3-fa72c5419d44@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 371fa9c0-5577-46ef-8a67-08d9dff3bf17
X-MS-TrafficTypeDiagnostic: AM8PR08MB6370:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB6370977C2F853090BC4C6201C15F9@AM8PR08MB6370.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vW9L5/j/Q+yzwVhmsS24nPEAu9DAtoRcBABt3WJ1lX5q2OZj7jlnEpNG67+9TWwN3VVLYTIlvuhqOb8047ZRkk1+AUo8Sw+1bVRr2k+xJ3+p9z7Jg2D9ipWE0hy//BtGehPFUI3WwMv+X3eTZbd1CXQIJn+xvdSwacS9MF+DAVmWlXBg556a2Ft3jVDhSJZgqnpyEs6mGPPpkIQtWM8k6GeV78btkWdpz4PngKhQ0+THxa5CKG3Bi4HeGgZmqHAX/Hd1J3gFWR4XeG0hOdJ3Jy37VlMUjDY7z4T0cA/6zs1gxAHv8coUmaO986ko5dGWGoJUYZ7nWum+N3vhspGRtIQra8wLn4GfVYzT+bo/MZdTpCQPzjxthnKCXZGYGqmKQATuuybEdTZjc59iQQVXIIcKAACszukJWldCOVUFxjx/0Blz0XsSbaPuxhOwr6Qj/RYxV5HbbycCkm5jcL4E65sP+1PsSDLHRWVjH6RlQY2YVHha9vVnxohCZlHGQ8A1rgY+PdHDBdyCVosjp+695lgxeSUjGlnKlHop9ETk5xra27hhdOLH5WXoQmFCevvJCCW1iIqlhzV8nXk6FGdzqKP1x5gGAZtS1H8RpfmG5dJaRThCifYAigKlSNMkUGm/W9eAglMwJ7ym9ZfjQ0cTQOJC9A3d9EAaQVG+bDyWtaa0FYsszplDR0abgRLpSVSv65H08/XoP5R+qWdNNuCo+XGIcOqWSNvQWF7OraRQjPh1PNX9FWO+BPj496t88n35zSfcHrhN2FHSRICiz1S7nw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(36756003)(6512007)(52116002)(8936002)(2616005)(4326008)(66946007)(2906002)(6916009)(38100700002)(38350700002)(508600001)(66476007)(6506007)(186003)(316002)(6486002)(5660300002)(86362001)(31696002)(26005)(66556008)(8676002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXdRZEtSV2xZVXpvK2RDRklpVHkzV0VWUW5HQVpuZ2JWMWQ2emZtOW1wVTQ2?=
 =?utf-8?B?SUhFMVNnNHZkSEdPSkY1bWFuMVlxOTdldm5sUEtiWFZEVWdoUDM0K3NoNXo2?=
 =?utf-8?B?cjdwd1Y5VjduV3JRbWE4a3dPTkJhTXF5TXJmdHZRSy9QQTlxUzMySXlDekQw?=
 =?utf-8?B?Qk9pNWVJT1FGZjJzWERmME5ZazJsK1JxSXoraFMxMXRHdnFvRU91d3FKTGh6?=
 =?utf-8?B?UjVzdjBiT1R2SUx3Ty9hQk1TMnBESG9tblBHellkUG44YlgweGhoclJSKzVu?=
 =?utf-8?B?ei9PZ3ZtMG01TlR2aC9mMTZHRmcxRmJSVkQ4bEpzamFGc0hWSGE1bWhIbnVm?=
 =?utf-8?B?V2tWMmhqRnZzbnVqVDYrZkY2S2dJU2lvdnVWTVZHSGJPeDMwWDhQLytldGRp?=
 =?utf-8?B?QWF1NVdlRmRyQ2ZyU2hkV2EwVU9sU0FrS3grTExWQlN5R2NyV0pXbU1tQUFp?=
 =?utf-8?B?aHhZeU9RL0dLbndENDc1OWt4bEVkWDFnRkhMbnJ5QzNYSDA0elkwT2FhQVBF?=
 =?utf-8?B?TGF1c2JYeVZ6SVpLbmZMbVEycTEvQ2NnSUs5ZEpXWER6SkZUR2QrL1NlUXhG?=
 =?utf-8?B?YUxhd0tMV0hwYmMwWWpoS0E0VmY4V0dueTdKZkFWVUVkdFA3VDFkVVdGTXNx?=
 =?utf-8?B?dGs0cXJJUlRDKzBsNUVtejN4TVBvWVJpanJlbVdaem1DbmdFeW16TW90LzVa?=
 =?utf-8?B?M0ROL0d5UGtna1Y0ZTdxRkxZL2FUZ052V3plTEwzbzk5SXljRi9iSWhqWU12?=
 =?utf-8?B?WUxsWU5UbC9TVHE1YjdWcDNlL1Y1YmU5enhHWGhJVHE1b2RiUm1STFZQc0Fx?=
 =?utf-8?B?dDUrV0M0QlBNaW1Bc01BcWtxVjdqeDZXMVJqSzE2TStDNTQxNm50TUhIejJR?=
 =?utf-8?B?dFBTRFJSOWVhOUkvNUFMemhyRUE3TEtKd2NMaFVPOWIwa2JibzVEdVFRQ1hW?=
 =?utf-8?B?K3VLK2xjVFJYaXpIZ1RnVldlTVh0WmpyYURxNHA4QkoxYXVsQ0dvbFhtMTRS?=
 =?utf-8?B?bmxUeTJOcHkwZktMaUlOV3V5SWVadk5aMS96WnF3UzExc2RuTW5TeHhibmc4?=
 =?utf-8?B?VzIxMERWNDlGRTd6Y25weEFWY3YyVmdJeVhQNlNuWG03dHVBWm5nNG1ueDlU?=
 =?utf-8?B?UFIxT1doTXVMVVNsaU54UWV5SE1NelFYQzBUVG5MQmppaVk1MkNGVWFyMEg5?=
 =?utf-8?B?MmRMejdaVUVySUJya3JrN1hPKzJWY1BmNkhWNm1rVFZwYWZZWVVXem9oOHFT?=
 =?utf-8?B?WEJsREZzQWt6NGZ3L29ydHQ4U0w4NlMxSmpFMC9vaTcweGdQYnpsaDZHT3hO?=
 =?utf-8?B?U05pd1oybEVrQVZPSVdsRDdQcnlDazhZejU3QjNITW42SmlIMW1xWVZmT1Ro?=
 =?utf-8?B?b0JEVW5CcnlOSGdnbEpic01uSmJRbVVOWVl6a0duUHZpVjZqc0ZrcG81bWtC?=
 =?utf-8?B?SGlpVk1wRGU2cm51OXBGY1Q5d1ZLWWN0ZWxoMGE3RzhyU2hqZGhScC9WWkgr?=
 =?utf-8?B?WUdHRktTdkZ4NmNuUHpVTlRCVXBQalBNS0VhaWxNK0l5ckswVC8rclV2MmRq?=
 =?utf-8?B?b2U0WExuOExUTTY5em0xc1hWMUhzUnNLQzhqSHJuVTQrcFI4d3lXeXA3aDZh?=
 =?utf-8?B?WXI2aVlSdURWN1RRYS82VmN0czMxTHJ3UVNWR2VxWmc5Y0htd2xKK3dWWnlv?=
 =?utf-8?B?NVl1a0piSVVkVThHenhPUkJTZks5ajFLdHZsSXpmWWNiWkUva0RmOFU2N1hH?=
 =?utf-8?B?bTVIL2YrWVFNK1gvZDRFTUdJdTduZDYrM1grdUxpRFZOaEVSYnNPWURCN00w?=
 =?utf-8?B?c0R5L0hkd3dXQzhkU1pIZUZzRUdZRWw4QkdJZkwra2UvdjVpbjR1TStreDRU?=
 =?utf-8?B?aDQ4bUloWjZncW9ialFFaHlIYVhlR0IwZlFGU1B1d1JUOEsyZWpCd0U4QXhr?=
 =?utf-8?B?Z1V1RUgvMnpXN0RmNXF3MzZMK3dkY2dyNW9hZGw3bFpJNm5WWWxwZ3ZFbVZE?=
 =?utf-8?B?UnRpNk9hWmdTbzB1TUlOYXdrSDdrMUk2YkpTK2lzYnM1SGZpbHE1OTZndisw?=
 =?utf-8?B?VUF6NkEyWG5laTR4THF4UFVmY3N2V0lMTlQ3WUJ5Ly8wM0NyYTYzallFdlhQ?=
 =?utf-8?B?TWpvTExXVGR3YVNqTVE2QllyYWcxRnBILzF1eUZ3cEs0Y1ltMGsxVzNzdU83?=
 =?utf-8?B?UkZ1c0x0aGtlNVRyYkU1V0Y4TmMrNllOTkJmaDZxN1BkMHkrTVk5M3lRektB?=
 =?utf-8?Q?3yLf8hMZ7gOmapfM01bjxtyUJNZKUVtkbtBBbsVGU8=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 371fa9c0-5577-46ef-8a67-08d9dff3bf17
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 11:13:42.7079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHFHEJ3Wxm9RSZyxAnH5koHPIfc+2LXtYtKs294t+lGSRfOg2WTDJ+p+oX6hplJ3IHvsATRuOsgCTLZT25AbfDFGAsB7KNapb+O9cy8YsYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6370
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::706
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::706;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

25.01.2022 14:03, Vladimir Sementsov-Ogievskiy wrote:
> 25.01.2022 13:25, Markus Armbruster wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>>
>>> 1. Add --no-trace-events to suppress trace events generation in some
>>>     cases, and make trace events be generated by default.
>>> 2. Add corresponding .trace-events files as outputs in qapi_files
>>>     custom target
>>> 3. Define global qapi_trace_events list of .trace-events file targets,
>>>     to fill in trace/qapi.build and to use in trace/meson.build
>>> 4. In trace/meson.build use the new array as an additional source of
>>>     .trace_events files to be processed
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   docs/devel/qapi-code-gen.rst | 23 +++++++++++++++++++++--
>>
>> The doc update isn't mentioned in the commit message.
>>
>>>   meson.build                  |  3 +++
>>>   qapi/meson.build             |  7 +++++++
>>>   qga/meson.build              | 11 ++++++++++-
>>>   scripts/qapi/main.py         | 10 +++++++---
>>>   tests/meson.build            | 11 ++++++++++-
>>>   trace/meson.build            | 11 ++++++++---
>>>   7 files changed, 66 insertions(+), 10 deletions(-)
>>
>> This commit consists of a small QAPI code generator change, build system
>> work to put it to use, and QAPI documentation update for the series'
>> feature.
>>
>> I'd reshuffle as follows:
>>
>> * Squash the main.py change into the previous commit.
>>
>> * Split off the doc update into its own commit.
>>
>> This way, build system experts can provide an R-by in good conscience
>> without reviewing the doc update, and vice versa.
>>
> 
> But I think this way build will fail on previous commit. Or we should still keep trace-generation disabled in previous commit, and enable it only together with meson changes.
> 

May be keep positive option --gen-trace-events in previous commit, like in my previous version? This way meson-changing commit becomes self-sufficient. And then in additional commit change the default and drop --gen-trace-events option and add --no-trace-events instead.

-- 
Best regards,
Vladimir

