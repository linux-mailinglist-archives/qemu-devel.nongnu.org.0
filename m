Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A93132E473
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:14:37 +0100 (CET)
Received: from localhost ([::1]:50408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6Xc-00050m-5c
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lI6VM-00040U-Cr; Fri, 05 Mar 2021 04:12:16 -0500
Received: from mail-eopbgr70133.outbound.protection.outlook.com
 ([40.107.7.133]:51022 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lI6VI-0005rV-FO; Fri, 05 Mar 2021 04:12:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtyIL4QGLWliSqWwsL4KLyVVPgFF0LM/+KGhN7khl/j0dEtD5ZAbtgGCC6JCzo8fxzJ3vgG1yBh6i89MlM5dZgduxFy1ZdwniR01GSAkkhuTD46+Zxv7pw3YZO4bmxXhv2e+gSl7yhA+UntzWbWWf0JGg76AVmKuWidYkcnDXwZcQ7h5LwDyggHj9oNU93OgWzxEn7dsvLPaKCa0dSsiKGgVl4xX8YK1RP62w9kDXS5rOFMBBX1BGD2fqfPCMWpIJSeAKrjH1RXEJQAw4EORMMFjsoaJtVV7rwgCT3OOdcoXGiiEJh6YmRlJnMAVWvtcnJChA0Zpb0ZAV76Gs9l0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQcniM4Xl70unpEg3IS2rHeqENVQ1LlSQt1s4aw/d2c=;
 b=CKbcrVquih55qkhkTOpBS7zA/fp4GRmh0jG1kEewxzcVodhprftTx2BM+EoLFKTv2I0k98Vgrm8PsRLGdC3IoCuPPO/9ypSSI9b+ii7A2vQi7OD6PuNDCzb6YjkeM0nwK3dZqrIu8Tyk6qEs8AjXyFDMIc1g4cKi1DB+FyqYCfKPKEY+k6KxrVtmwF6wpBgtad6xM4DXHxoxdJ5a1Zlp6FFrGmODNZ7M/xwCKspYtFzBQFMgy1SMx1EUcRgEgSKz4KsC+o88Abwhg1gprFdmdd46jq4kNN4QP3Hkj4VqPZKTAAa0V1ZWeYlgP0Qr41hrQFz4TKEy9V2gMZ02fpreIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQcniM4Xl70unpEg3IS2rHeqENVQ1LlSQt1s4aw/d2c=;
 b=Mjm9HOXWNWtvGiarfRKE/XI5q9hSiHe+0yEJN16DaRmLGCW2WWqIBZmxdzaUxKsqn4GA8lQBYfisZMHjtg3LU4sHDGfZxDAafSOOHFOSjaQiuR+yA1+RXdKvK/8tNI2ePYmJJ3GGuVSIXG1g5f7E4yQC5P8TlWxA0c1yLE7slVY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3287.eurprd08.prod.outlook.com (2603:10a6:209:41::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Fri, 5 Mar
 2021 09:12:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.024; Fri, 5 Mar 2021
 09:12:00 +0000
Subject: Re: [PATCH v2 8/8] simplebench/bench_block_job: drop caches before
 test run
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, mreitz@redhat.com
References: <20210304101738.20248-1-vsementsov@virtuozzo.com>
 <20210304101738.20248-9-vsementsov@virtuozzo.com>
 <f7d24c40-eb01-4df6-52c7-5f48aa30656f@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c3c9571b-5999-378e-1915-88eaaf93b2de@virtuozzo.com>
Date: Fri, 5 Mar 2021 12:11:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <f7d24c40-eb01-4df6-52c7-5f48aa30656f@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: FRYP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::13)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 FRYP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.16 via Frontend Transport; Fri, 5 Mar 2021 09:11:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bec6bb1e-6ca8-4e03-750b-08d8dfb6bbe2
X-MS-TrafficTypeDiagnostic: AM6PR08MB3287:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB32876356D74467F163DBFD32C1969@AM6PR08MB3287.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:133;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pRJVyT779lhwW1YztXa0M2ahmOQm/YcRl09l5OkR/fyI4tBQIqQVXya230UPZ8fZJX5KuyZGA1DzFs3kSxQ/MMYdPcr3RVUQiC0M9GwNZPIffTxb7RSRzHC/THVQwIqYuBPQDhEszTU9NC3krTtJMbzcbmRz482GwQx6ixY7qq26saqudyiJqDGOMsI4adoYWVglc/DQW2IvOB10ao5zYft774QJAFfrGl6z0gFXBx8MGht15/u4QN0WyOTaJ2e0VcAEmmKVysncjk/x5oLVA5840oc6Xx9hiCtJdOE8m7ButUZwYTZwsBsslo0Qrl2OEIaDXh3tXV/fPrR6yJqUme+O9sr1wTIFrgCMQGtxFwoueMxuS37Znqde+YQvfYL+qDnS6NWxZKL0XGj1uSg7//lxbPkqZxICilUMyOC169IMd+l7C6cLduWV0xHORacltszs+ASuTYWOXlsCokAiqRHmcOOmb3VX0mQ6ZH1t/ngFo3V85V8jGDeJcPQaDNI29IAM3Dbv0XXBFKX8F1iVfNsezz2RUw1xi5cVtme4QiL3qUov0ceziKTHh9gm+r1t0DoITDU2aPLAEC3JyJowu8vnK0HKJeTRBQ8hDxD0B7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(136003)(39830400003)(346002)(2616005)(36756003)(316002)(86362001)(66556008)(83380400001)(31686004)(16526019)(52116002)(8676002)(4326008)(956004)(6486002)(66476007)(53546011)(186003)(8936002)(16576012)(26005)(2906002)(478600001)(31696002)(5660300002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cFFJdzh5NkJsYzNRaUtabTNSeG0ybklpRVhsWmFmSWNBYjRGdkxJSnRxeTJS?=
 =?utf-8?B?UFlJVmZ2eGZ4QkgwSmNzMHlFQWFUcTNLQzEyZkFSKzNNMHQ2VC9XWlk0WHZQ?=
 =?utf-8?B?OXAyT1JCOFZDeHluMVNNY1NoU0V4YmF4Rnd0WkZVZG1IeStoWDFvaXRrWEZD?=
 =?utf-8?B?aTVLYzM0N2hvL2paQXg0WGRNTktROFRMc1E5SU5Sd0UwWUsvdHRqRDhrMW11?=
 =?utf-8?B?WVlVdW1rcXpNQVV4dys3UzFhTEpJalJHbzRzMjBOcnlDbHpVN2w2a1hNQ0tE?=
 =?utf-8?B?U1oyNmxjK0NGY2dLQVRzRWtwZjF0aUZYKzhjMDhGZldDczNIYi82R1dydEx1?=
 =?utf-8?B?NDM1WjZtdXJ1d3lyVkRmZVlUZVQ1QTQ1TGRrY3lvU09jQTJMRVlOdHUxdWpH?=
 =?utf-8?B?RUFzTG4xWjVLREtaa3M4OWpITlh6Mk9CMldtTEhMUjBxNTdqT2U5RXJRMFVW?=
 =?utf-8?B?NlhRc1krRWplaHRrcnlibk0yNkVSZXM5eDk5MzQ0ZEl6M3R0N0kxcVJFWGRn?=
 =?utf-8?B?TGNUZlFMWGs4ak12UDM5dE9KRS9ubVlqeVVKR0k4SjdsQitRWFVMbWRObS9F?=
 =?utf-8?B?aUorTnB4WWxFNmRlLytxS0hyWGJJRE9JcVIzd0RYYStkMmp0d0RCbm1GM0o2?=
 =?utf-8?B?UW9kRjNmUlhrdnJudEhRT2lMTnV5cHZMbXhwN3pHRVNzTmpydUJaZUVwY0t1?=
 =?utf-8?B?SmFuMlVLTlhqdkdsVUJsRnp3RXAza3IxQjhwaGlmN0FBci84eXAxblF5cVpj?=
 =?utf-8?B?YitnaDUzRU9RRDdVZUd0NURqQi9kcGhXMmJRVjZYcDkrNVV6SEZlUGJlaWtx?=
 =?utf-8?B?Qk5JWDZzNFNVeXFhSDh5KzZPUVBPdlN5VDc4Q0krUmcrSVI2Ui9qT25kVEpG?=
 =?utf-8?B?bTFSTjFzd3F3VWwyeTBaM3NLNlE3KzRnMHNURHpzL1FsemVQdjEydnZwNFpi?=
 =?utf-8?B?OVUxdCtoMXd5L1ArUTduUHRUdHBZeXM5ajRZU09qcmhRa09jWW5PcFNGeElB?=
 =?utf-8?B?ZDFXeGVIckR1bUw1ekpmYkp1MTNYQTMwbk9YZzB5clV5MkMvaGxkRzFySGNy?=
 =?utf-8?B?OVgxTEx0TGtva1g5NjVsZGFSTGI5czNKSVArZXpJTlhZTkRKdHAyRXRVTjJy?=
 =?utf-8?B?d3R5T08vOU5RQjA1Z3p2NnAyNFRrMTY1d29jaExZOUdNWkdiQThmUWc0VHlB?=
 =?utf-8?B?QnFiaEszR0FCaFdTYlhuSDBtTUtQSXA4Z2I1R2hyMGR1M1doOGcwZHVtcVVZ?=
 =?utf-8?B?U08vV21aTitnc3NaQy9tUFBnb0RUZXJoRi92MzRzc3JOdTExczBRSVBnczZl?=
 =?utf-8?B?OGxNSldQVUltTVpYYXFtV213NEYyeTZ5YUNNcGYvSVZlRkJ3ajgvc0o0YlRY?=
 =?utf-8?B?eVJVdm5kZDUxRitvZjVoSTIrb00vVmVvanNUTkNJTkZiVkNPeVBveUJwL2tq?=
 =?utf-8?B?dkRGMWhmRXNJNVFqQUV2WnpSSVZEUjNJRXQyY2NLdUMvNUEzZ0M2TGxibHpq?=
 =?utf-8?B?bU41K0FEZDE4akRuZ2F4aHBIV0sxUVlwTzA1T1dSNXZYemFjMGp1MWVmWE92?=
 =?utf-8?B?VnhNTEVQUVZGT2NBR0VLT3ZGQmthTHM5UE43Qk1SbGtqb3JaSkZYOFdKZFMz?=
 =?utf-8?B?T01ua1l5Rldmcm4xZEdjNi9KM1RuNEhTdHZuNEJaNWJ2T0wvTlF4NjN0d3Zm?=
 =?utf-8?B?cXpPbEFDSHV0VTVTR1QybldQTlhaVmNEeVRhNC9VUGJsYlRNNjZOQWR6b1lY?=
 =?utf-8?Q?alnpK2DTIvuPlwv9eB39gvbkT673RU/UkCevIzP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec6bb1e-6ca8-4e03-750b-08d8dfb6bbe2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 09:12:00.2899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +uD7xyyfEFNM35DFZZYAMlKdgCxap/3JSxLPrC4CMYJ7XT3ZGqHKQCawSeX3hxk3zle7xBSPxJ88QYum/1XldoHVu+WNrCJah6JbuA5Ps9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3287
Received-SPF: pass client-ip=40.107.7.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

05.03.2021 04:30, John Snow wrote:
> On 3/4/21 5:17 AM, Vladimir Sementsov-Ogievskiy wrote:
>> It probably may improve reliability of results when testing in cached
>> mode.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   scripts/simplebench/bench_block_job.py | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
>> index 4f03c12169..fa45ad2655 100755
>> --- a/scripts/simplebench/bench_block_job.py
>> +++ b/scripts/simplebench/bench_block_job.py
>> @@ -53,6 +53,8 @@ def bench_block_job(cmd, cmd_args, qemu_args):
>>           return {'error': 'qemu failed: ' + str(vm.get_log())}
>>       try:
>> +        subprocess.run('sync; echo 3 > /proc/sys/vm/drop_caches', shell=True,
>> +                       check=True)
>>           res = vm.qmp(cmd, **cmd_args)
>>           if res != {'return': {}}:
>>               vm.shutdown()
>>
> 
> Worth adding a conditional to allow "hot" or "cold" runs? nah?
> 

You mean, make this addition optional? Make sense


-- 
Best regards,
Vladimir

