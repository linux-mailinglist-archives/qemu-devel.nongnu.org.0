Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D472DDEA9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:36:49 +0100 (CET)
Received: from localhost ([::1]:52194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq9Ng-00009R-Eu
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kq938-0002ys-I5; Fri, 18 Dec 2020 01:15:34 -0500
Received: from mail-eopbgr60122.outbound.protection.outlook.com
 ([40.107.6.122]:5704 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kq935-000711-T2; Fri, 18 Dec 2020 01:15:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DsfxRLTkpeyTYOWjMoBDaFnqmKvucQWrD5kfH55nygYy+x2jDGJr5PiNbnKKRYe/NmTb3vJkVKq4IGRc38C0eXYu50aFmga1vqbhAAa0Gr6nCQMupE2412GfQFz4W54aWzUCsYvohsDz/c9NTOCKFlhXsrdYk4krXCW0yGs5OFJYOpqme4LY57a1DFXUmTlwhS5Vit2VeNTM336aX5FaLN44S8QuH5pe5MHUJCxJLjwni50vo8BcNetQE9gA20qAHeKT8MQ5Cfn2tjk/RWH9UtT3QtoUBtvVtWENRuNqf4yO/95eveag9E/vk0lN8yofPLOgFAvTzagHlakaNyciAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEnU3q2C368wntWhJx1MJfSsrzPNQCMIX4Qxfpe4upM=;
 b=L/td45+ImyEeqfAeqNWM5t8eCknvSvojzGlKfeujiTbYllzOJOGpjpbSqd//zzTgBYv/xoh+UTGdo78JvJ3fhhVpjC17PuIQBJ5KgahCVnOA+cjOM1qpXJM7QqgBUyG2cnjBpYsJfdSUxNQXd9VvUMDOoZFvHnuqtmePymuCG0st6hMxLT2WipCmuDgMlCg2+7K05T+cLRRnCRvjjbbNSUp9800DAroqUym3pEhF2IWRVnkhzZoWw4z+4Gxv3R1l8vmDR7DH0elZdTDGJRdsXevfwS7fHxLxA5BuK4NoKAyvZRiAH/xI/lHbP2PV1lcS+dfXg1ajBatuhvlX7ay+cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEnU3q2C368wntWhJx1MJfSsrzPNQCMIX4Qxfpe4upM=;
 b=LZDE4KRGRsBcXSaF++sAwt2eLBZxAIRIELygQraNynzFebKqujA2pAirUAyoSCh6cYELyucTGUxCiwPP8rpBUpeM5ltVqkduP6Nv+9Oy56uT/+ULPT3QtYjOzWKzv6EztQu3j2JcdhHgOcDMp9+2aOpPjO/bZHhFQvLXqCoB0c8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4949.eurprd08.prod.outlook.com (2603:10a6:20b:ee::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 18 Dec
 2020 06:15:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.026; Fri, 18 Dec 2020
 06:15:28 +0000
Subject: Re: [PATCH v6 3/3] block: qcow2: remove the created file on
 initialization error
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20201217170904.946013-1-mlevitsk@redhat.com>
 <20201217170904.946013-4-mlevitsk@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ffecf2a6-046d-18cf-7cec-3a6f60018c01@virtuozzo.com>
Date: Fri, 18 Dec 2020 09:15:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201217170904.946013-4-mlevitsk@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR10CA0122.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::39) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.92) by
 AM0PR10CA0122.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 18 Dec 2020 06:15:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10016364-5384-438a-9fe7-08d8a31c511a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4949:
X-Microsoft-Antispam-PRVS: <AM6PR08MB494990662149B60061D55ECBC1C30@AM6PR08MB4949.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jnkek/eDh5HANyrbmBogICU8Ug2zqK6rhxGdz1fu68gxmX/ndiA6rDQouZkrps3m32tsNiHDF7J6+dwbwcvwlG39VO8A7dleO/lWQuR6c70z5FDK0Fv8Zb6Vu7cQwnPEamCA50SNo9/crKbQA0zbwzCPkk3MvMEfvc9/cJISU0oVKkrALcxWB16gU3xgF4SYWkYw/xRlAievk5iqHsJxnL+cSE/0RYmOkrMD7dnFxFn0RcSbHV8UVmiVpvgSzfARdGnF96q4nLXqnDPeH3UOF3nqPXyUUXqi2NNcN40G0hZ/ZNj1M84HAtR55gM6IGVFEUTe1NFTrNXZ+xKVWIEHmGQaqpb66m3ci18Z4PjqcHL0YcNTg3erkj2S8/OVcrJLQwvfHQFrk5gtzVKbekTqxj9gTuqkbw13fcswigX2u7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(39830400003)(346002)(396003)(31686004)(66946007)(52116002)(31696002)(66476007)(54906003)(316002)(5660300002)(4326008)(2616005)(6486002)(186003)(66556008)(2906002)(86362001)(8936002)(26005)(36756003)(4744005)(8676002)(956004)(16576012)(478600001)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cU9KUmhzMW4veHI4eDJMMVJVTHJSK0x3Uk5Edndkamc2YU5ENjZVcktzN3pR?=
 =?utf-8?B?U3l0aU1sT0xnTkJ2UzcvSSt2aEdjR2FXS1dnS1lWWHdTNjl5ekFwWndobXNm?=
 =?utf-8?B?TlBkMzM5SDNGVWNXTWZLMzAyRnM2RDQzVTZQZ3p3aFhMNHN1TjZZTGF4OUo5?=
 =?utf-8?B?UDRvREkwclIzdFJYSmZBNTlnMUgyS0xOOGZMNjVsRUM0MjJhT0k5eS9KQVph?=
 =?utf-8?B?ZVllT29PMkMyajZPamVFSTdXcUg3Y1Btek9KWW5jS0FBWTh1N1JhN3NOUU1H?=
 =?utf-8?B?ajJ2dkJTekVVY3JUSXZHc3ZpN2pJTjhWSnJoMzMyTFplWXpyRTczYU9GNzln?=
 =?utf-8?B?V3FxRURNVDJ6c2NlcTJBMFByZ2pxOTBaUlVaMExtTW5sVytqRDA3bDJ2aVo4?=
 =?utf-8?B?YklwZGxINzExQmlIT1Z3QlBUVVRNVzc3S0pnQnhJUXV2WGROb3dUV2hkalha?=
 =?utf-8?B?c0NEa3ZUQkNIZTdNaDBYRmpkSm5EYTEzaW1FajBqVUlOUGkzcmh1bEtHMDlM?=
 =?utf-8?B?WDZ1aXM3c1hTOGpPNzZiT2Q2Z3E2RURHWGdYeUtXUUNyV1ppZFlWMVBybWp6?=
 =?utf-8?B?L0FLaHpXbG9wWGpabXd3R09CY2M1WDNIUGZUY3owRThId2ZMd01EeldpT1hT?=
 =?utf-8?B?bWREcnZLeCtRZDkzR3llTDRyMDlzd3dVbUdTcHppVnRlQ1RsUFRKaFdKaWdi?=
 =?utf-8?B?VWRZMytjODY0VGVHVUdGcFBuWEJ3alMvZUE4MUZ2VnR5bS8xRXV2Y1U5ZEg0?=
 =?utf-8?B?dHBpalYyaHNOYmhVZFd2VElhaDdKZDVXd2RQZEd1MzBYdm5JQjVDTlhoS284?=
 =?utf-8?B?Nkt6Nm5LOEg0N3cwRStEUlZqTXNjNXVHczU3SG5GVGhtVGVxTTZSVXNha3Ex?=
 =?utf-8?B?LzMrRHBtcFl1VlJ0bkswTlRPWnd4MFN3enYwbXlOQU1mR29KWVEreFVQazlK?=
 =?utf-8?B?QnhrQlF2TjE3RjdtMGdGUE5hSFJyZnpnQSttR2M2cDBiTDVTclU1WXMrUnBo?=
 =?utf-8?B?bS9UcnhveitISThwTmFBY21sT2pVZ3ZIK2pvL0d4bWhTWXM2VlhHYWk3dFdX?=
 =?utf-8?B?RWNXV01BQkQwcm5BRlhIWnVxNENQckp6aU12a2dmM25ocjRoYS9ERWNDL0Fi?=
 =?utf-8?B?M29uajhseXFoWHNCMUp0RXY5bkF1Y29rQXhhcTg0YnJEZFpoOWE1dENWSkVB?=
 =?utf-8?B?VlljM0VtSjZVWEtFaHhxcTlVdSs2RGpJbWVSM1BhQ2tQQlU1NGgyd2txb2pB?=
 =?utf-8?B?YWgvVlRkRXV4Z3l5UW56QTM0UGJOOUh3NmtndmFUUS9iUnJSMmloQzJRYVNt?=
 =?utf-8?Q?/52EWBlaVCAlTEKwXVM5srHPK+TitKGCcp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 06:15:28.6791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 10016364-5384-438a-9fe7-08d8a31c511a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ESHUa40Niq/x2QMAqk1TWCXUkG/OtznUx2JC/cEkqqyxfIsEKJLAbJk+I4v8vNC679YHqYoZbqJIRRG8sXV2olpK9wSUw+AH5GFd4P272iY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4949
Received-SPF: pass client-ip=40.107.6.122;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

17.12.2020 20:09, Maxim Levitsky wrote:
> If the qcow initialization fails, we should remove the file if it was
> already created, to avoid leaving stale files around.
> 
> We already do this for luks raw images.
> 
> Signed-off-by: Maxim Levitsky<mlevitsk@redhat.com>
> Reviewed-by: Alberto Garcia<berto@igalia.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

