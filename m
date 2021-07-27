Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC68D3D78CC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 16:48:33 +0200 (CEST)
Received: from localhost ([::1]:42970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8ONk-00058p-WC
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 10:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8OMa-00040W-0q; Tue, 27 Jul 2021 10:47:20 -0400
Received: from mail-he1eur02on0701.outbound.protection.outlook.com
 ([2a01:111:f400:fe05::701]:43748
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8OMX-0000nJ-OX; Tue, 27 Jul 2021 10:47:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FB1kLUbPSZwzqmJAV8+h27hjnDilamCq+kB31SyA+SBrjdT9F2cK07HDShPw17m8oKqSPDxq81S/8MY8j15UJX2zDnlyoBu5aS/evhvorWNo4RL+qQj4HwesxHwxbB/0WD5WWGGbgegzhOIzHmoB5Xne/KsbiUawE4yUNOKukfJOLPh1TccndLlVfcBFwJn0EjyMzbRsRWxTfisWCToJenYrFiVrJO+VrbGTlxFR9FPe5ZzqsshktSxQgZT9fN1GQulEqHPqiGkYwHTFSWMNFqowwEMrDJ+uy7nS/Loc6YJ2nnuw7CqiMz9C1va6RzdxEI4guk8JHCrI8t1ThkITbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkA2yREVKMT5jSvIrqn3KWnrwj8HG/XoyzuQOSXIbWI=;
 b=Jws4eAr6he5oe0cYwgL0QpYz8hWTld567dNOydZi4BlEXaQ+ZH4ErPo7P9tVUPuOHP3bZlR7Eh4T8I2XaJgY0WCjOtd/ZpD8KnYKKuR/GaCcA44yLhJLJevPtdw2fvX7T9trtpsKKqLW6hPEwePv7oyPVdHrSxIodgsYzojefajGCV0G0LZKAVYe8oZSO1rRIoh9c2ly9hAjBFeCnSrMET9+v6qrPmwrQDiW4BVvaodzFNon/X75iqXE/5dGx51DNB9c+oMKN6WsFwiVERwiFWwJJrGiM76BzUpVhkC8NlGn5lIjpXrT1rtuDdHZuJtGVY+waK2Dzm25n1wtvbwsjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkA2yREVKMT5jSvIrqn3KWnrwj8HG/XoyzuQOSXIbWI=;
 b=D9M3b0FPzckTA/BXqG/rTyRFX5DMbr1MvcsmLQeO/dI0AHWFaFdme0Ixaflp60T2TUsRqXj2Zy3Rh/Qtec4l5032k6ZhvRzyKjCWzelu/U6NLpCvNdVLb2IYZmkQairbj2Tf1yK+Fm0rNWyIzErkWjq1z0X+i34XwmVisbalDvE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6948.eurprd08.prod.outlook.com (2603:10a6:20b:347::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17; Tue, 27 Jul
 2021 14:47:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 14:47:13 +0000
Subject: Re: [PATCH for-6.1? 4/6] job: Add job_cancel_requested()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210722122627.29605-1-mreitz@redhat.com>
 <20210722122627.29605-5-mreitz@redhat.com>
 <a6a675f1-4ca3-a657-9fe0-35b73a6f441a@virtuozzo.com>
 <32463d65-834c-64ba-aab4-36f1810ddb43@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bd4d225d-0bcd-9a38-9813-af229d8fbe4f@virtuozzo.com>
Date: Tue, 27 Jul 2021 17:47:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <32463d65-834c-64ba-aab4-36f1810ddb43@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0091.eurprd04.prod.outlook.com
 (2603:10a6:208:be::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 AM0PR04CA0091.eurprd04.prod.outlook.com (2603:10a6:208:be::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26 via Frontend Transport; Tue, 27 Jul 2021 14:47:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0902821b-c612-4b5c-4d42-08d9510d6bf2
X-MS-TrafficTypeDiagnostic: AS8PR08MB6948:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6948F04F08E2E74CFD752E43C1E99@AS8PR08MB6948.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8yLWnQLQ8VOicCsFkBLI2PfIm6/9k6ATAPYMypGF9IvnxeQ5pC/Bf5GnrPTujL2VQW0o4xN6elOjBTG/imdRAZbHY7GZgIdrxZWRmVkSdxqiGEEEOoJMW50ShuUW0/B3+yRxWjed0QftUZQjHVFgy+LDR8T9daLLGlEIM9XK478u1SVo4QudHL9TtAXfJog/AHI8J7QJ1hsZp9XQm+MFAxDSL6eQ10ZLEJK+AQpt/I37mDm7BlyIOQr7D6SidZlKsUq3Cp/OZ+bBcSSGFqoKskaUR0fV0kwmc4uVKr9DSCQHqOovYMIVwTyrUmWEX77wInqCTEtVtlChm5hu94sajdDErq0dzQdW5n30u1Ec5tHiQCnWk6cKWLFeylfhpi2/cAFstpjCAhQtaazjdF09lXJxxdtMyXsP3As9u9a9H54+HP60twSFzb/FSoIdSihlxBnPqbcKBK01RmwpO2MJnYq71hiCutm5OV0eHzVZYJaICXUZbEMK/qd0OXkX1m+sw/BjDgFMWUkCc2/iZUJX+FbvC6ZmvIv9hAWfHxuqq5BC7edI7RdPm3VN0wNn15R9P6MLIjYTOF+SrwF7lVlvWBQaBoVMKb4B2fgRjTTSpViPdn+4dqHhARIiPbEIAjtB3mDuGMZePYDuu4ARPagroq+HJBsUXroGApwZJpcHElKSByrtfLsn72kxFPmMMzgN60D+/QBQIto7DLUPTFodg2FUfokY3JBc76JKbrC8iGr3GEmYz2Pie5xLZj+HsKEejQnyRHjZtPMvYdDd3ASjAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(956004)(38350700002)(8676002)(8936002)(36756003)(508600001)(66946007)(6486002)(66476007)(2616005)(83380400001)(38100700002)(52116002)(26005)(2906002)(86362001)(31686004)(5660300002)(16576012)(316002)(186003)(4744005)(31696002)(4326008)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emV1Vm1FVUloN1JVbHFSM3JOSTdGd2hHejJhUVdYK3RIU1pKeHdaVnJsMUFT?=
 =?utf-8?B?Y29hQVdweTRGMEdLcjAvM3llZDl6RHMxQlRKUnpzOXhxZkpRbFJyL2ZLaEZQ?=
 =?utf-8?B?Vjk2U2hkc1F2RVorY2dmbXA0ZlNrTkR1V1FXUW5PMFZ4R1JlYVRmd2VWRXNq?=
 =?utf-8?B?V1B2d1JrNmhaa0dZMTRPRFJqZEU1ZEt0elY4OFVYYTl1UWhJZjdHRlBiMFNj?=
 =?utf-8?B?Wmd1dnlMR21VckNiRk81N3JTWENxQTN0cElsZnBsN3NTWElNRHlUZ05LWWJ2?=
 =?utf-8?B?aFZWWVA5WlZ2SVlYVDdTQ0djR0F4U3Y4Z2lsZy9FR0psV3VSVU5aaHNmZ3RT?=
 =?utf-8?B?OEx6NmQ2UExRT0R5L0JxSG85YjczM3lQM0VxbWU5WER5ZlREY0Y3MUx1Qk15?=
 =?utf-8?B?a3RtVlZYcDJQbzFuTTE1MjYyNzhSOVFtSXIrS1VFbzh5VjVRczRNdEUvdmJz?=
 =?utf-8?B?ODBhWHhRMTlSdXVFM3Jqd1BjK3Y5QzhWSkJxZjlmU1pvY21QK25CUVFreW8y?=
 =?utf-8?B?M05UeCtzVS9vbjgwVTlOYlJCNGl4dVhBSEl2TWFGalhwSHEzcEszUzJ3TmUv?=
 =?utf-8?B?Rjg5R0hIM2hLc0s5VkJReHJIeENSNkl0dGdLOWlnYWRsNjE4OWt1QkY1anpI?=
 =?utf-8?B?QWtLVkRheUVhSG5XTnhBeTAyVGhITnFzZkIzK25xdVJhMFVYZUUrZUoza21R?=
 =?utf-8?B?cE95N1pReXM2NlA0Z1pXaUw1RDF3Mm9icUZ4UENCRVZGdDMzazN2VkZOQk1u?=
 =?utf-8?B?NWVCZzYxaVllT3UydGQzb2hQckx1RGE4RnpTYlBqaHhqZFhOaUpwQVNQZWxC?=
 =?utf-8?B?Mk5ueW04ZGhUZ1UvM002Qmk4R1pkOHA0N3BqMkx0VlZrTlYwOFV5OVR4S1NT?=
 =?utf-8?B?ckxnV1BGc1lqQlZKU2YrYjJxeks0eHZ5SER4UWNQeUpXdWR6Rkt2VTVyRWNh?=
 =?utf-8?B?OWhhbnBKYUJVRW9TQW83dFp2YkRtKzBIVlZuWFNiTUt5VlRlUVErYm1xd016?=
 =?utf-8?B?aGdxY0dFMm15Wmc3cms2NE1yOGswZzAvMTlCd1pxeFJSYm0xZnYvZ21tNkIy?=
 =?utf-8?B?N2pPRmtkNVBzVUNuYlZIdWpMOFVmdjRjdHNUZW90bWswaFlGNXFyeXZ3bWl4?=
 =?utf-8?B?YlJQek1mNnJHU3I5RHVRZWhTTUM0TXJvQlZmbmE2RldVL1d6cWlDQ1BQZFFw?=
 =?utf-8?B?Mmx5VjVCWmZJY0hnRjQzOWFoTmIyQ1ZUYno0NWtJSFhFd2RrNmlXcUs1TnZn?=
 =?utf-8?B?ZG5PVmhYSEJtQ0pRc2F0QzBXYTZNZjU1UndubWc1M1hLSEN1eWd0OGlkVVRr?=
 =?utf-8?B?R04rdnphbXllZG41NnhHRE1rcWFwOEpCekY2Nmo1MkJPUXdBRklZTlcwdnJS?=
 =?utf-8?B?K0dxU1huZFVXYjF4K1E0dDR5VVNxRDJ3T1czTXBGYmdQNmUwd0o4dGpWaVlR?=
 =?utf-8?B?Nk5GVDlWcUFwTjhscGVFdDNOS3Z2N1VFOU5YcGlLQk9Ja1djUC9JMDFKQTBy?=
 =?utf-8?B?U1FnZ3pqbnNUMzlML3hvaUd3VDNXajB0OHhLVkxmTEZZQ01PbUhtdVVSc09a?=
 =?utf-8?B?Q3JGeFBGTzB5SlVmWkdiQ1NsMXA3cHEvc3NwbGFuYmtuK09TM0tlT0RaQm5O?=
 =?utf-8?B?Q2s4UGE3UnRZMHNkaytIMjVhY0h6K1dNNG1hZ3dlNHdaUUJ2OHF1MGU0VU5X?=
 =?utf-8?B?c1hENGxFUGJwTEZlcE1KLzRscXo5bEdWL0N2b2xGeDFaRHh1TzVxa01pdThQ?=
 =?utf-8?Q?pgOt9YJMMsjvOF+vrmfME07a5kjEGDiJhyEQAqk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0902821b-c612-4b5c-4d42-08d9510d6bf2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 14:47:13.8565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BuxLUa8Tp1Rmj1ZQkCfu75Cziw4yY9ONOGhL/D/Yk8AFaDEUZ/D1jexHqvXxISIH26vyJWv8NI7UEOKUu7a9H+kTlu9PGtnPqTq83828h4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6948
Received-SPF: pass client-ip=2a01:111:f400:fe05::701;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.438, SPF_HELO_PASS=-0.001,
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

26.07.2021 10:09, Max Reitz wrote:
> 
>>>           job->ret = -ECANCELED;
>>>       }
>>>       if (job->ret) {
>>> @@ -704,7 +709,7 @@ static int job_finalize_single(Job *job)
>>>         /* Emit events only if we actually started */
>>>       if (job_started(job)) {
>>> -        if (job_is_cancelled(job)) {
>>> +        if (job_cancel_requested(job)) {
>>>               job_event_cancelled(job);
>>
>> Same question here.. Shouldn't mirror report COMPLETED event in case of not-force cancelled in READY state?
> 
> Same here, I thought this is user-visible, nothing internal, so I should leave it as-is.
> 
> Now I see that cancelling mirror post-READY indeed should result in a COMPLETED event.  So I’m actually not exactly sure how mirror does that, despite this code here


Hmm. Now looking at mirror code, I see that it does "s->common.job.cancelled = false"

-- 
Best regards,
Vladimir

