Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74BA49064F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 11:57:29 +0100 (CET)
Received: from localhost ([::1]:42994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9PhX-00035T-Mh
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 05:57:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n9PcT-00013k-4v
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 05:52:14 -0500
Received: from mail-am6eur05on2114.outbound.protection.outlook.com
 ([40.107.22.114]:41133 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n9PcQ-00011N-I8
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 05:52:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cItgCRWyrib21p8oLeEW72y8SgSCIGfCP4FgjHFODHEL69Po1Eo1BpWSwWdWdawCUK9t5Qg+6u9KTxnFkE+atSCACUmDMizcjbLiSqIh6M+UYH4mwIMOj6bqnifdrb9KW8U89N3ipNuYpPwlNLsk+DMwg98Ye8HscLAG6gmi8SAdrE96rloAOKdED03bNTCdvr09c7zbeWOCTjtJ4mdwNKJB3AOkoi+1sTXvoxYoYZxpFUmrn9+GxOVP8l4ZRHC7BPNMnbiFEmevgKDeQ+gGaZ5wwpBl2cZwaUhFTRHNkAzMBGf/mzsmPLAO2nWXgL4P0X4aNxdUH28oBnhfqwrCDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HS09neHbvuLOh76I1iz+oZ+9so3O7jFS+TnJXSmNEk8=;
 b=JHKX/76X6yfpHU+6cUv0ZVk96ucR3uyPfLfJw/zBFrkVTXSoZKVTXrxgoqYq20yvVg+aMDoLVr+owJrbEOJjZwQWTHozaugUUlAHd25qPt4yUsCx6JR/OYHtrCQs/jPVHEhkudjeHrITS4YcxxRRRLk7B86sH0O0f8dKTiWX1n7nOZ5K6qN4uwSK8z9GLWnbrDeIl3RJqtN5qceF6CU8NMhXD44VF9uRKwWk2XlB+Y+OXjYogfyys6EszT9zT5EjEJbAZ4n1rByFSnar/+fLj8KDL5KB2gj2VW4Ystjg+gE/qQmxPF13hrl4KPHcC2MhcthJ0LUt7MxSQGoD+QxywQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HS09neHbvuLOh76I1iz+oZ+9so3O7jFS+TnJXSmNEk8=;
 b=T7OzBKGVeJnU7ezeYEr6XJ3uofUKlNtCGTIJhnmjm/JLZHF9peG8cwhbPpkYbTCaXL5pBVXTYmCJDB+qTFU0odnUVXOPoSr9xEQsdku1yi0VXRUJxJ3XyEYFu51oyTz190CIyKYqgWAvloVCHgRiG+dSVUXFZ3zsmC5rEZf80kI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com (2603:10a6:10:45::25)
 by AM6PR08MB5062.eurprd08.prod.outlook.com (2603:10a6:20b:e1::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Mon, 17 Jan
 2022 08:13:08 +0000
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::55e1:e502:c66f:7461]) by DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::55e1:e502:c66f:7461%5]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 08:13:08 +0000
Content-Type: multipart/alternative;
 boundary="------------boubyaLgMUq65X74OTrr2sdY"
Message-ID: <505310f1-8e93-ae2e-a36c-2b93bce6a4bd@virtuozzo.com>
Date: Mon, 17 Jan 2022 11:12:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/6] migration: Add ram-only capability
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 eblake@redhat.com, eduardo@habkost.net, crosa@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, vsementsov@virtuozzo.com, den@virtuozzo.com
References: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
 <20211224111148.345438-5-nikita.lapshin@virtuozzo.com>
 <87v8ym36l6.fsf@dusky.pond.sub.org>
From: Nikta Lapshin <nikita.lapshin@virtuozzo.com>
In-Reply-To: <87v8ym36l6.fsf@dusky.pond.sub.org>
X-ClientProxiedBy: AM5PR0601CA0045.eurprd06.prod.outlook.com
 (2603:10a6:203:68::31) To DB7PR08MB3484.eurprd08.prod.outlook.com
 (2603:10a6:10:45::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6acf8870-c7a7-4181-8557-08d9d9913198
X-MS-TrafficTypeDiagnostic: AM6PR08MB5062:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB50620CEA3D362F2E8399A39086579@AM6PR08MB5062.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FZVuE5rCTv/4FB8dnmY9jY3UxobalBPeSJL/6opO0zvDiHaHpdd3ZBLgaQawyLkKHCmdsN8LwEKhNQKkqYhGhY/SwzuW5Fa2Bl9ngNZMhX0sJqnKogj/VH48JgSwKcPggIyc0IUAuymm6gD4z8izbWhAhhwTgl2o6tr5Y0orASu34HJSRj4uQ9vHLtJuKB7FN+fksowsDBP1jJFtFjqEV6RXTV+FYwWG6+NDky7xzNdRi3oLT1s0P6keAr/1tH+fkwMulGtLfTAvWgIHr17HSqT/Jnelj7CCHrVbyaxxyqeZCSUP3g1wdGXkf3vkow1YQl7vwO7vscQem6g/mHyvsWnENYRzYWXxVuvVy2HjnBNY3AJLCU8AvB+M2OXjTvB1sUvFqUyIxCvXUxvv10aUEbaNOmaQrN8jWttFnZVhBw+Zk0cZDxl5zX7OYTdVKZdhay/+uenrGxzxjA5ocVU9Tvs9z4ZROA07cGSnbFHlocV4b1DFkiuCD0dwBuRmi2jlqftdHEvmsSZFIx8DJKtrxrFodBByt99jeipyKd4Kl3JxQmPqWQvG9wq7cPtjjRD8Ecs84c6emJg7Fv7k71BaUYhxsEjARfPv/6o2RC8fjssFOD3UbIocRxScL3RdjnpUxUfKC4XmiXwWOOZtRcQq9Pwd8ChqDcDfAqIPsw8uakRX+5s8JSmXpF+TxhROT6xTtOCwEUAO43+MlKYXBSLELzXFFZE5ENzrL4HkbsACbPibXewwzmHqRqsNsann4o0TN/DpOv+0qySFC2zjTuFNQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR08MB3484.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(86362001)(31696002)(5660300002)(2616005)(53546011)(6916009)(107886003)(66946007)(33964004)(52116002)(8936002)(4326008)(66476007)(26005)(186003)(66556008)(31686004)(38350700002)(38100700002)(508600001)(8676002)(83380400001)(6512007)(316002)(6666004)(2906002)(6506007)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE43Ty90eDkyaExCbzRLTHd3R0Jtd1dmLzAvdCs0TkVzN2dPV1lqRGpTYXRz?=
 =?utf-8?B?SndUU2RSemV4UU5oTjRaVENVdkJGa04vM3Z4YjM1NFpWZlN1WGVMeFVJQ2lV?=
 =?utf-8?B?WnAxQjU1SDV1SU1hajI4ZWowQ3FYa0lTbk5Kb1lmZHhKbHFROHdmSG1RUXpP?=
 =?utf-8?B?cGFSTFZjUldCOURuTUhEc1QxOTFra2tna2hEREx0VjBVN05VQ21iTkd4QVFi?=
 =?utf-8?B?SGFnVkFuQlNxYTNhUjdYT1ZiRHlZQU5HaGFmZ2JSSW16Tmk1b284aHhBUElm?=
 =?utf-8?B?WE9DaGcwcXk0QjB6M3ltZzRMVGUyZUYvUkE2WmR0Zm1ZOTlyZFRjSXFmSFVj?=
 =?utf-8?B?VE5IUHduUHg3ekNwbGw1d3ZzOURXUVdvWGU5czhRWmVlR1M1SEZWT2diUThP?=
 =?utf-8?B?UmtURW5SM2QzNHMvanRYMXdHQWxFUnIyYU9acW9tUGlKRGhIMGZHL3BON1V1?=
 =?utf-8?B?VXljbFduMk5qcnpoZFVWRnQvRHBBUWJTS0lVZmY5WjlRRmJ4NjUwdGpsTDBM?=
 =?utf-8?B?UjA4U0JSZTJSUjFkKzNxS2ZMRjh4NmpjZ0dscFJKZ0xVS0l6MDNmZWx2Tmd3?=
 =?utf-8?B?RzRuY1BKek5ZWnF6SGZiakF6QmQ5Vm9OV2NCVlVtT3lLcUZBSkRlcDFoS1Nu?=
 =?utf-8?B?Y0tQMWtvZm9ENFRGbjhVcGFGREdhdW5pQW11b0xNN1dBWE44R2RsbTFpQXls?=
 =?utf-8?B?Z0wrcjNEcEE0Q0J1V0hpY01PWnAxRTFoVWViMzhicGlOMFNyN1FESEVHMm5l?=
 =?utf-8?B?eVBVTXhBR09FUG53QWR5Sk1Uc3lqV2VwQ3ZSNnBPZVl3WmVjTVR1b25sOFcr?=
 =?utf-8?B?dVpKMjNFUGZiQ2cxOTdtUjZ4R2o2TThYaktpbzlGVGdZN1hSSEpoemNCL2xS?=
 =?utf-8?B?YlpGeDhya2hIMWYzRFZKc1MzVzdZcjlsR1c0NXZWdWIyWkV3cUVaM3RYNkVI?=
 =?utf-8?B?a1ExS0duM0xzaW01TVk0TmdlYjJYT2NkKy9sZ1NrejJGUVcvcWU0cEtGYmNL?=
 =?utf-8?B?T0pXbWw0OHFGUGhhUTd5QjNsTVR5eFptUUVhQllGMGpreUdncks1Z2VmKysw?=
 =?utf-8?B?b3dlanUwWWNOWlhvZXFjekdJMTFDQXBFbU5OeXFPNG96QjRqSEErdkpWRGFZ?=
 =?utf-8?B?MUdnT25qRHpnY3RUVlJBZnBra3FudFJxZTlySVpkaG1UZ3E4djZxWlpzSG03?=
 =?utf-8?B?YmhFU0hwdHpoMHlaUDB5VVRFZE1xblhXdURnamJiVnJUWS96Y0J0YUI0Qm5F?=
 =?utf-8?B?UzJVY1l5K3c1cHlSOXVPODlrVVJlMG82WmdVVE5OaHVjdHM5Q2dkc1dza1VB?=
 =?utf-8?B?L1ZwcGx3WmlTYzRqdmdyRmQzeDZmbHYvUkU4ajJHMmxZVDRTTmtydDlFZE53?=
 =?utf-8?B?cjQxTjhQS1FGaCtULzZ1VzdFMXNycTNNM3ZsNEpIeUIvcWRhSzh3RlBabjBn?=
 =?utf-8?B?d2lhSXMvQkE5MHYrQW1HUmZZeEkzT0hYam84VnppYzhWekJpMGVLVURSZVNK?=
 =?utf-8?B?ZStRcWdxR3EwRUpLT05ycmF5Y2VTcHlYUllwWG9Jdk5JRTdBR0U2MGpNaXNT?=
 =?utf-8?B?ZGRCQytYekExdEpQamF5UnRSazVVQUNhdGZWZlY4TEFKeDhiWVlZbTU4S2oz?=
 =?utf-8?B?aTBJb1RkaitKKzQ5enRZT1lrNWV5OTNSK2NNZXlhREdzVUVUNksvOENCS1R6?=
 =?utf-8?B?ZzlDVXFldGJ2c1lHM1p2ODdDWmEwajlGd3BnbWVqbjZaOGFvMDdzWVU5VmdH?=
 =?utf-8?B?dDg4VUwwa3lJdUdzTXdhRHc3MmhBVFZoMmszdkdHbkhjUUV3SUx4NTQ4bWFB?=
 =?utf-8?B?MU9FOXNvSEJzb0NRUUJnSHU3TzNDOFNwU3dDdXVHUkJtTGU3NHRWbDUvZFUr?=
 =?utf-8?B?eUx1WXBremhxMkljdytMdVRRb0xEMHNZZmhRZlFQWTVWWlBkYk1MMmhoc2gx?=
 =?utf-8?B?Vnlpa3lHM0ZrRzA1YTdkOVlXbXlvUUVmOTR2WWVGcTdxeWlaR1dFYTBUK2xy?=
 =?utf-8?B?ejNYVDlYOXdKNnVxNUJycFM2NVduL3lnbnJUTGNqanE4cGRFUFh0Z0hLR0tI?=
 =?utf-8?B?SmtlZ0N3ZEFKeTRXb2xaWVZJNFlYaGxVTnRVam1UMlQrcy9Fb3hIblNCYU1Y?=
 =?utf-8?B?blBOaDFWOVV4MlMxNUZ1c3g5OUhEbVhVeFhraEhOb0hnOStNK1NHbXgzMkdJ?=
 =?utf-8?B?NzdDdjBUUDBLSEpreHhxczBEUnhITHgvdFBmTXNtd0s5aE5CWENmeWdCbS9v?=
 =?utf-8?B?VTRpd2wrR0RpbVlRZStWKzNiUDNRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acf8870-c7a7-4181-8557-08d9d9913198
X-MS-Exchange-CrossTenant-AuthSource: DB7PR08MB3484.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 08:13:07.9198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezvo9TawlDcdTquOtneg8qZ6fHITsIAcsQgqY/zUxNK5bYtRxnJpmqDi7SNCS0lUizN8xEEYHtJUUQb1ggS3k2YxWsy6bQchB4UE0CHJn5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5062
Received-SPF: pass client-ip=40.107.22.114;
 envelope-from=nikita.lapshin@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--------------boubyaLgMUq65X74OTrr2sdY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/14/22 14:22, Markus Armbruster wrote:
> Nikita Lapshin<nikita.lapshin@virtuozzo.com>  writes:
>
>> If this capability is enabled migration stream
>> will have RAM section only.
>>
>> Signed-off-by: Nikita Lapshin<nikita.lapshin@virtuozzo.com>
> [...]
>
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index d53956852c..626fc59d14 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -454,6 +454,8 @@
>>   #
>>   # @no-ram: If enabled, migration stream won't contain any ram in it. (since 7.0)
>>   #
>> +# @ram-only: If enabled, only RAM sections will be sent. (since 7.0)
>> +#
> What happens when I ask for 'no-ram': true, 'ram-only': true?


migrate_caps_check() will return false and print error message that these
capabilities are not compatible.


>
>>   # Features:
>>   # @unstable: Members @x-colo and @x-ignore-shared are experimental.
>>   #
>> @@ -467,7 +469,7 @@
>>              'block', 'return-path', 'pause-before-switchover', 'multifd',
>>              'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>>              { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
>> -           'validate-uuid', 'background-snapshot', 'no-ram'] }
>> +           'validate-uuid', 'background-snapshot', 'no-ram', 'ram-only'] }
>>   ##
>>   # @MigrationCapabilityStatus:
>>   #
>> @@ -521,7 +523,8 @@
>>   #       {"state": true, "capability": "events"},
>>   #       {"state": false, "capability": "postcopy-ram"},
>>   #       {"state": false, "capability": "x-colo"},
>> -#       {"state": false, "capability": "no-ram"}
>> +#       {"state": false, "capability": "no-ram"},
>> +#       {"state": false, "capability": "ram-only"}
>>   #    ]}
>>   #
>>   ##
--------------boubyaLgMUq65X74OTrr2sdY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/14/22 14:22, Markus Armbruster
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87v8ym36l6.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">Nikita Lapshin <a class="moz-txt-link-rfc2396E" href="mailto:nikita.lapshin@virtuozzo.com">&lt;nikita.lapshin@virtuozzo.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">If this capability is enabled migration stream
will have RAM section only.

Signed-off-by: Nikita Lapshin <a class="moz-txt-link-rfc2396E" href="mailto:nikita.lapshin@virtuozzo.com">&lt;nikita.lapshin@virtuozzo.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
[...]

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/qapi/migration.json b/qapi/migration.json
index d53956852c..626fc59d14 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -454,6 +454,8 @@
 #
 # @no-ram: If enabled, migration stream won't contain any ram in it. (since 7.0)
 #
+# @ram-only: If enabled, only RAM sections will be sent. (since 7.0)
+#
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What happens when I ask for 'no-ram': true, 'ram-only': true?</pre>
    </blockquote>
    <p><br>
    </p>
    <pre>migrate_caps_check() will return false and print error message that these
capabilities are not compatible.
</pre>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:87v8ym36l6.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> # Features:
 # @unstable: Members @x-colo and @x-ignore-shared are experimental.
 #
@@ -467,7 +469,7 @@
            'block', 'return-path', 'pause-before-switchover', 'multifd',
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
            { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
-           'validate-uuid', 'background-snapshot', 'no-ram'] }
+           'validate-uuid', 'background-snapshot', 'no-ram', 'ram-only'] }
 ##
 # @MigrationCapabilityStatus:
 #
@@ -521,7 +523,8 @@
 #       {&quot;state&quot;: true, &quot;capability&quot;: &quot;events&quot;},
 #       {&quot;state&quot;: false, &quot;capability&quot;: &quot;postcopy-ram&quot;},
 #       {&quot;state&quot;: false, &quot;capability&quot;: &quot;x-colo&quot;},
-#       {&quot;state&quot;: false, &quot;capability&quot;: &quot;no-ram&quot;}
+#       {&quot;state&quot;: false, &quot;capability&quot;: &quot;no-ram&quot;},
+#       {&quot;state&quot;: false, &quot;capability&quot;: &quot;ram-only&quot;}
 #    ]}
 #
 ##
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>
--------------boubyaLgMUq65X74OTrr2sdY--

