Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CEF3B025A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 13:06:46 +0200 (CEST)
Received: from localhost ([::1]:45680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lveEv-0000U8-Ak
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 07:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lveCh-0007y2-9i
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:04:27 -0400
Received: from mail-eopbgr60123.outbound.protection.outlook.com
 ([40.107.6.123]:54852 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lveCe-0002Mc-1G
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:04:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ea6s3FFIJV0gRDk8jVvvaKUt1gghxnEiSCKgo6DkHVFvGEZzL0pmLqQOBpLofkgNSnAoRlTH2SEkySQGuROElhMbtK/cgaMQ/zKhhSAPNBFRUbIKOlbAjsBMBgY7aoyThQf2b0Ach1EUfFok1P8DmsqXo+Dm+QcphXn8fJtzfGwsups+nhrv6x7xsiE0rOog0fDnVBALEfGR6Tfkai70sD0lc1om7m9SIKqv5o41I3ONC/q1i6XnApTeEOsuoGi6keRK/tik6BT1adr56IoN2XHdTLNEMA0s6JawrJVHSrNxPxjb+MEKfCYPEH4CWR20Ka9v6QGTj2El7czjNTmSSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDcSoiQKm2sPhdvf19a9ZOPJfaMwP6oqceb4EIqiSX4=;
 b=oEW6ZREgPy2t/+2TbVnWoIhQ2BJQTxzb/BTsnPKuN2qk2BDNcXHGtOIqJ/2uhLaWcfUMR3ilDTyR6/1fngXW/79/rIA6EcE/DhufWZrkvZKMpf764KnGUn2FJTBcP1I8GJfWxzZ86+SQnaWo4bPmB9MdrFO6J5g06G+k5SOfD2kjhEWMzhn0u99hs1lD/r9pR3ynCTmPwMalL8DMcLTkNAHajAFjHXQFu1+5o41g3m7Q59lQ3tDf12GfwMA4eHdkFrPagI3S7Ewo3UFhDuBlGWK9X6AZRJ4ppmaoHoJNsZ6oriwki/zosivoqdjwQJM7BDGygybl2IngdWJyftB3QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDcSoiQKm2sPhdvf19a9ZOPJfaMwP6oqceb4EIqiSX4=;
 b=t/95A8V5ECECQsAN/B3ap0fJfA0ilMQQLbSw61eVCQOrf+2mXZxYN1FsB9zw3kkaTKujelE08wMsPFMarFX+vM6m+ttHm9KvmbbI14aVGV0eVVOpxdBfJsudTDQVOJUjrLBfYf/ltAKmgrftdSJsWSDGjaiueanWa4KitoPa8wA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6053.eurprd08.prod.outlook.com (2603:10a6:20b:292::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 11:04:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 11:04:19 +0000
Subject: Re: RFC: Implementation of QMP documentation retrieval command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: "Niteesh G. S." <niteesh.gs@gmail.com>, kwolf@redhat.com,
 ehabkost@redhat.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, armbru@redhat.com, wainersm@redhat.com,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
References: <CAN6ztm8D4VMf7p-trHNHoOA+1kAXXufTTaHpbyNXZ5qO2_uuPg@mail.gmail.com>
 <6fb6d9d7-3af2-c487-a1d4-aa1140c5a54d@redhat.com>
 <CAN6ztm8bjVnFf_X-vEzYOmTdw09bcoQSkVH9h6BdPFr-PEsP_A@mail.gmail.com>
 <YNGu80s+NHMGw6jf@stefanha-x1.localdomain> <YNG6uec4cS+hD+Y4@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d155d82a-9f5e-1656-197a-48eff5762b86@virtuozzo.com>
Date: Tue, 22 Jun 2021 14:04:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YNG6uec4cS+hD+Y4@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0501CA0041.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::51) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR0501CA0041.eurprd05.prod.outlook.com (2603:10a6:3:1a::51) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Tue, 22 Jun 2021 11:04:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 620e081f-1f68-4f78-16f5-08d9356d7bf2
X-MS-TrafficTypeDiagnostic: AS8PR08MB6053:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6053E1DDBA75898D4708323AC1099@AS8PR08MB6053.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r1PmFlEdcCB7Q3JMngNdTObpZw2H23za1e7kfzy1n3Rw0q/oA5uGy7VFVuXvr+7CtjefiWVo5CqXcY156rq7UJVekO6dWj3W/4vOoEBlwi8ERr4CTQpLbXWHuYE6XUSnYOsFVC4HdlVdQx5CK+73need0ItOr1Kmh6gCn3FKnvkCo7oU8ilDUjHOl6PfNgANLwPgzIpK6db/qeuAbsHmoci/lBmFDR9Oa171MlXUhbuGYwN9hgrt45TgO1Vhl8tFnJAB7l60Q/hS/7SVsUGx4emKcVcX3X+aJOkmh+YkOtYOt2PbrdAyqC/m4bXAvIR/AoTbhxxuHQ/LMhzp72d5FPLXMDQCr8HibpG243fxcc7lTeqvlpBVCLv4GkXszDrHwNrzmXw4ykXOqpZTGFzbQhMXmOvBGrnXCWWaQF/+w1N5oAeEcj4hEnAVEvnt6uwuT4zJMN2iG7jDY+/YCZXdW7no+VG8mpmuo9KUY6uCAh3I4wtJbGYr/wFx14O2MxhV596HLKHkJWrdXot7NjVni0/K6/Kpa2X1JtUUWHO8baeuVHfA6prtxbyhlt6Ydujko3pMU5NWBW+uDKYtkFN3GI6+rpBAk/pH8D+MzMFDjW0Pj1NHoJDsNLsGnyUETRqZsdmYpFcj2Uqmf8V/X8u47iuiQ+gu2KIHqK7bjgkoJpewqeXIrRKia4dUGln2yqDR+Mk7V49x5Euwg07eqCQtfxZdPHVaZh0aB6sYQWSc1zdIlE6pRZWII+vMdMV4yGaDfxERc12CVkKybKyPf8JDiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39840400004)(376002)(346002)(956004)(54906003)(8936002)(186003)(110136005)(66476007)(26005)(2616005)(2906002)(86362001)(38350700002)(83380400001)(478600001)(5660300002)(16526019)(38100700002)(16576012)(6486002)(66556008)(316002)(66946007)(36756003)(7416002)(52116002)(8676002)(4326008)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFRnNTZTa3huVnZaeDY3Z1dYajVkQVYxNTFiRXpNaGhuNEdYRkZ6WEVYWVVJ?=
 =?utf-8?B?QUVYMC90RU40eGNIWjI5YTZvRTluY2hXMHZpQTdYeVJ4eGVCVm5KTUhBVWdr?=
 =?utf-8?B?L2VRbEFOMHFmNjNFOVdlSDhiOXdhL250RzMyaEZKcXc2T0NGcUZ3SzcvYk5K?=
 =?utf-8?B?UlRmWk1MbFJoUStWTEdrQ28zdFZtN3BlMk14ck8ra1RvZ0lxNitwQ3RjNWRC?=
 =?utf-8?B?UGM3WGpXd3ZIS0NKYjM0WHpSU1dEdFA3YnNSRGJmb2hjUnNaOFpSNEQvSlRW?=
 =?utf-8?B?ZDlGWFZLT2U3enNNWWIwUzJlMHB4OG51dmwvSERnSTFSSWRib1BBZFN5Nk9C?=
 =?utf-8?B?OXl5N2pEOU1UTkNBc1dhU0paeFZvM1Z6ZU5SbTE0QnVDd01GK01uYlVhVUtT?=
 =?utf-8?B?UVVXeEFvTll2ZGFYLytvVTBzaVNQenF2ZzlwNWFQaHhaK25Ka0ZUS0w2YThY?=
 =?utf-8?B?ZFdkZm84MGNLZVJPN095bnljQlFlVkYxNks5azZvQmFkTStYWnBzMERvOHVX?=
 =?utf-8?B?SVg5aXVWVzIra1d6Z0VwZ1dMUzM0T1l5ekw4VFk5NUI0a0VUVlJZaFVUZ0Zw?=
 =?utf-8?B?VUp4L2QzUHFIbXlaVkZLWHV0VFRuUnNPRUtKL21sb05JM3lsQUlwYld4Slkw?=
 =?utf-8?B?c3pIM2dyQjF6cnY5TSt3T0RmT3hZZzdmN2ZlQ3lncS9lalBDK2t2ellzWDFQ?=
 =?utf-8?B?UGtpWVZnK3BIMUdzc3VrZ0l6NHJQdXY1aE1PVXppVlU1b21JTi9tWFRFc2d0?=
 =?utf-8?B?aDl2bFNtS2JnZ1RTRXdoSkN6dHRaT3I3RFI2RmJpd28rNVU2ZWlLbkQvM1FN?=
 =?utf-8?B?TCsvVC9IdGhnRWNWK210ZzZtcWJXSTlOOUFlZE5kUWozZmtqd1VGMEpaTm1k?=
 =?utf-8?B?REJDN0k4bmhjVXpWakFNRjRBQ2llMVlhdHNkVjBlTjZ0MlRGTjVhU3AybGNT?=
 =?utf-8?B?VW5DdGRHK0hURlY1aU4waUYrL2g2a3R3OFNMbWpFQ0VoWXNmMm1GRWNCOHlH?=
 =?utf-8?B?NjZYVDR4MC92cEVwR1c3T0hJVXVCTUwraDUrUS9EU2RLMVgzR0JBRjZGVzBK?=
 =?utf-8?B?Y1RRRkNiN1d6RlhxY1RGZ3JGY1R6WnRJN3FMTVNIek8rQTBnMnRlSEk5Vm5G?=
 =?utf-8?B?S0RIb05FTGJwVHZqV1RjaGluNDVOdHZVMkQ2V0lVNFMyK1l5Wjk3MVkwbFJq?=
 =?utf-8?B?RW5KTzVTRXFySytvd0RnbmtiSjBIVTQzQ2Y5VnZpSENuRkwwT2pDNnNYMFM4?=
 =?utf-8?B?VDEvSGxaVFJ5MkNsVGt4OXFKT3djdy9ycjhjOE9kUTZtUW0vNktlTnRxWDNH?=
 =?utf-8?B?V01MOFJJaFJtVTM1SFlERVpZdlVyYkRIZTM5ZEJsWkYwMEdxeUhPZ1RnWlph?=
 =?utf-8?B?R1N5MWpEL2pVYU1wUGlEeTVuSk90N00yZDJOUXdxWUlNa2JGYmw4K203RU40?=
 =?utf-8?B?MVdEZWwvazJkVldDZUNDRDNPd2pOamNGakVaNUxJM1ZlRklkcEpSSlVkZ05T?=
 =?utf-8?B?dXM1SjZwNmF0NC84OHVOcGg2a2QvR3h6UlE5aGtmeFhBbnZhMmpQZUhXU212?=
 =?utf-8?B?ckFIMWlibFNKSHRmcXFmNENlMnhTb3FiSjZES3VKNjNJTWFxazdNZW1JdXlV?=
 =?utf-8?B?VjhMMUdJblFFUm82cTZSTFZUVlBTUVg5Y20vcktwNnM3MGlZUlF0MVhIc2Ew?=
 =?utf-8?B?b1FzNDJvcDJSUG1FNE9Od2ZkVFgxQTl6VGVzNCttelpZNUdhSDB1TFNKZW02?=
 =?utf-8?Q?oBIb6SH7wEVRdgjCzGLO5p2eyEG0irUrYONPATU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 620e081f-1f68-4f78-16f5-08d9356d7bf2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 11:04:19.7831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1OaYpbc0ZQh/tuDqnnItL/A86UOzvrbsRl/UDMh0zJl4WA0Kcb6Sxu59Kr4IQh5ZgFIfdsm3SeBmsTd4+PW9zXG5j55QGF+0DihBmQTC5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6053
Received-SPF: pass client-ip=40.107.6.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

22.06.2021 13:26, Daniel P. Berrangé wrote:
> There's a more fundamental question about structure here too.
> The documentation is not a arbitrary block of text. It contains
> specific data items for individual parameters, and return
> type, along with version number annotation too.
> 
> If we're returning a single string, then the caller needs to
> know how to parser the current docs structure we're using
> for commands. Right now that's an internal only format, and
> I'm not sure we want to expose that as an ABI to consumers
> of QEMU. So quite possibly we need to return structured
> data instead
> 
> eg potentially we need
> 
>     { 'struct': 'CommandDocumentation',
>       'data': {'name': 'str',
>                'summary': 'str'
>                'description: 'str'
> 	      'parameters': ['str'],
> 	      'return': str,
> 	      'since': str,
> 	      'notes': str,
> 	      'example':str,
> 	     } }


If make 'since' a separate field, it make sense to report appropriate 'since' for each parameter, so parameters would not be a simple list of strings.. Not saying of types of parameters.

-- 
Best regards,
Vladimir

