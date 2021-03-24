Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CEF3472CA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 08:38:18 +0100 (CET)
Received: from localhost ([::1]:58784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOy5p-0003Jf-HB
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 03:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOy40-0001ZT-HN; Wed, 24 Mar 2021 03:36:24 -0400
Received: from mail-vi1eur05on2117.outbound.protection.outlook.com
 ([40.107.21.117]:51169 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOy3y-0007Uw-EF; Wed, 24 Mar 2021 03:36:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkLXCEd9M1M28nENgC8znmWJKmQwUNPTHdc/5ZSE98WoiuyUqn62OozWjJnNqbnuyx8QREkD/v/AUyfrEkBFDz3yEePvUasHvv/CIDrtiA9Q6IoAQtwKKrdX6647DC1F+Pr0WrqH2Gu0wXr2YaJIOhFmuL+uLJuBJicQdyJ52BKOOGPYa8K+RG0RhbHBljgzMGK99H1mwFXJBNj1lRcpRX1yyRwpBO5Tt6gYmHTnTx2vNGyIQecT1nq9dG2C80koXRkHYidHhFwXZVeSpnoIen3IPQQjIvtcj1dh/SiECxbCDLPQRbW+xFzvN+A4Z3pgePwhFSyaMmLOa6qqhsXZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1e7Kk4s5DRA6MJiSo2af/XYaqOiENyvCe7ZjzGDyyUU=;
 b=kAK2wT3uDYXQoeKkuOSIRMOLp4smLCC89I/VRSd8wxzROHPTLG5WJnsC80Pjdbjp+eSrS+kTw7sFLAwfiOXerPm4sNXw90h1pILnAcn6yg8Y8QAgvjxb4BaDb3f9rs8pV4a944ucFS/xrWXpHGuj3Cn+Ld37ALHz97NFNb4eteOGkwkcoXqxpo0CsF0iroAjJRJaSahJrVdz4Qzvcva7TBpiSB4H+TrIVv5DOwYlko5T15h1Y0psxYqmpTfiYV6jYSpuVviMcwU3madgCT9lKo4q2ub2HALjk5ZbfT3jcs61pSLyJxbUXDOK2NBzucH89Y2uNR8+zL8aC8TyWC7wPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1e7Kk4s5DRA6MJiSo2af/XYaqOiENyvCe7ZjzGDyyUU=;
 b=gxSj+45THL/D5OJXX8PabcDP/weyekhktnBFTjLPpH7Hq9RizW3gmTkrQaBaSrMKcYfNPmfOWWRHdW617flsoTxfoKdvX0mLL/rKXaB3WTgea7mIImZLGeZmY5jfFKok/nMrc9C6RpEP7Iekp+9f+3i5ELwZaA6KT3Uz3NQ+Tsk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5990.eurprd08.prod.outlook.com (2603:10a6:20b:296::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 07:36:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 07:36:19 +0000
Subject: Re: [PATCH v2 4/5] qemu-iotests: let "check" spawn an arbitrary test
 command
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, qemu-block@nongnu.org, kwolf@redhat.com,
 mreitz@redhat.com
References: <20210323181928.311862-1-pbonzini@redhat.com>
 <20210323181928.311862-5-pbonzini@redhat.com>
 <5ba856d3-8325-dc28-4806-7f5cce4d5522@virtuozzo.com>
 <a19c681e-94ee-f69d-53b0-14239bdc5d01@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <412a521a-c902-1596-9fc2-0d55425a6d2e@virtuozzo.com>
Date: Wed, 24 Mar 2021 10:36:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <a19c681e-94ee-f69d-53b0-14239bdc5d01@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR04CA0070.eurprd04.prod.outlook.com
 (2603:10a6:208:1::47) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR04CA0070.eurprd04.prod.outlook.com (2603:10a6:208:1::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 07:36:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eaa999b6-786e-48e8-a568-08d8ee9783ba
X-MS-TrafficTypeDiagnostic: AS8PR08MB5990:
X-Microsoft-Antispam-PRVS: <AS8PR08MB59904FD83783741987BE3AA7C1639@AS8PR08MB5990.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jZsav+grj+60AQakql1MC1AVHlplJCgubOkf+zozxgxBehyuagm1sTXHQuds/CaZqa6A45UWYpkGIHdgP3xF4R2+34ZnAu/m4uP+DM/KAJbvVkP15UZQTtDawSKFoCDAabwUvzwgm0C2KktanHGM/Y9fhmIxi4+9eIcgN3y3EwGcOaHTOj4b8mweWO6m2sChepHw/o6JqMOOCXCKyN8ecIVJcCXsXxEKXiq6BU7MlEEO2PukJCZf663buTo03Fgc1sSint2ydKIMBln/b4qxCwdfbIzudRUOKCI9jLYJWZJPi0LTnWYsz5YGw6chpGJySJTK++rw0KgTfJwIoGC7DTV9+1sc610W9/5HeemAh5HQ/Eyy8waO5WoqihZveC+OyBfT2kIqt37NKCARuJBB/2KqKo6ojnait4WUX21eavPYsH3TeimiIb+zPO1Gn7NyXXsJNz8goVHWvGOy/s3vgZNLrxF2Havwxpj2jfI5OqwqvREJj028zgtJGarC1VrA6TV6P7eK6BM7qoxvMpUs0aTB7IqoupJ2B2IosfIFlS6YIqMHkIvUw8bhOVGryf9RX2OHwrkV5rURRSk2gkCeKhCrI3pzVLu7DQEo9bygZTo3qceA+EG9UH9JDutIaCZsK43piL1eI5ywQJt2by9bJt2U7stXSikw0Tg7IaSW3BrwfqD82zTfEjmVYXJKtwx1B6s8TfUyA8G/gbqOay/FXPeYlv3GmtQHL5hVUVIYwig=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39840400004)(136003)(396003)(66556008)(478600001)(31696002)(2906002)(66476007)(36756003)(5660300002)(8676002)(31686004)(86362001)(4326008)(4744005)(66946007)(2616005)(6486002)(186003)(16576012)(52116002)(316002)(16526019)(8936002)(53546011)(26005)(956004)(38100700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L0JpVHMyT3F3NVBpS2F6SEh3aGhpcit4WjRMUnFZMUhiLzBVc2lpMEdXYXlq?=
 =?utf-8?B?bTVXL3VKUVFyaDJMbjMvNzFjeThRb2owRlZuSFVCWGlkUzFyRnZoZ3VFMXNP?=
 =?utf-8?B?Q2tLN29JUnZheFJ3a00rVXlZWEx6d1J5U1NjUmZHWkxqSy9aeXlWR0JkT0tJ?=
 =?utf-8?B?RVlEVlpobERtTGxYRTI3NEdRWW9rdXVKZWxheDd1UUtvQWpsK05CaU9Xa0sx?=
 =?utf-8?B?VEIzZXpCOGFjanJWRmQwYU40amdCenV6cVZFLzFIMzNKZElRYUNXOUpBSFNQ?=
 =?utf-8?B?L0JleHNvQld2R1U3ZXQzdGhQS3Z6V3c2S2xhaGUzTlFkY0FBZTZuNGpaZ1VG?=
 =?utf-8?B?VHU4YzlXbHFHM2JqOUtnQVJpUHp1QXdpekNzRmQ3YkJOQ1JHdE9LbDgzVmQz?=
 =?utf-8?B?SXdRWmhWbUdudnlXbjZVQlVBZVcvOTluOGhQTVFxcWNpNmdWNUxCUUhtQ0xU?=
 =?utf-8?B?Q0lhdkZGckV2T2ZMcWlIK29mZU1LNi9OWG1IdnRFczRBVFpabXBxa2JadTls?=
 =?utf-8?B?aHh1NnlKSXE3SlNOOHhDSmdQS2hGdW9DMnV1L05uUjhJRWdLUzBtVEZCRXNC?=
 =?utf-8?B?TWdrSXJWUmM5WHFMNlQ1VTlJWnJHUmQ2cit0NGw1Wlh3MXFQRDAvckhwS1NE?=
 =?utf-8?B?N0ZVaEtkV1hDazlnOSt6UDliNmNmVXZMWHQzMTlFUmZUVy9zRUp6NlNvbmJP?=
 =?utf-8?B?enBzZkNEbDIxalRja2k4Y1pSOExGV1NFdDFKZWx4NW9PM2JncWhKQi9PWWhn?=
 =?utf-8?B?b1BRTC9DTGhmeFpXL2I1ZXJxRmpaaUFjbXNqNjlSTzVhNWtneEJ4b0swamkx?=
 =?utf-8?B?RWNmaTVYVEF2NElGRkJIUThES2VSdjJ3QjFvckNLbGlLNkhHTGw1bkxOYkI0?=
 =?utf-8?B?VUIxU0xYRXRET1dhbXZVWDFjSW5LWTd4bTlsdGlCNGNvSDliRWdLNEc4OWJq?=
 =?utf-8?B?bHBtUEtYaWQzUFYvVW1LUE1hemxTK0FmRE9Mbk03ZkNsak5RZWx4VzFLUTBq?=
 =?utf-8?B?eEI4N0oydUx5TWUvRU9HRWl3SklPVkwwcGxYS3kydVJuYloxcFU4N0Y1c3la?=
 =?utf-8?B?ZzA2czM3M2ZtQ0Znb0hzQ0l1bEcrQnpPV1lUU045akVwbWMreXBhb2h4RWpn?=
 =?utf-8?B?TFRnbU51bVMxREs3MnluWXRRUXdSVS8wa0IyVjlDeVhjNDAzUzlFenFpN2pW?=
 =?utf-8?B?UGpFaFBldTFnY3RucHRwRG04U0k5cm12SHFFcCtkUzU3dDF1Zml3SVpxWnYr?=
 =?utf-8?B?eVQwWjVhSFFaU2FXaXhBK09zRTQ0OWk3cDlXWmltaFR4NTZUaVJKbFI0RlRJ?=
 =?utf-8?B?Rlo5K0VzQ1U0eWErMk9EanQwcThQZXVka2FwcVJDd2VGM1RVOVQzUXdCWG0r?=
 =?utf-8?B?Uk14bzVBYmFTNkRKZlAwSWNKaUp3Z0VNenF2Mlc4UDY3NzJJTDFxU0pUbEVz?=
 =?utf-8?B?SlNjZHIweGNaVTRLTG9lbEFzRTRUak5SZEFUVUo4Ukt3U0pWZHdBSUxUdWY5?=
 =?utf-8?B?V0hGU09sOCtVMGxTeUM5eGo3bkpGMDgvd2dHNk5SSVpVR2tYKy9yL0V3RWEw?=
 =?utf-8?B?SU5XWHFlNHVjUWEzOU92ZHo2dDkvRlJONXI3cEpCY1hKQTBPai9qNzN1eTlm?=
 =?utf-8?B?YnAwTU9jRnpsRVRLak1OU0o1Q09wUFpZeWhGZm1VZ2VjWnVaM2JMQW13dEpM?=
 =?utf-8?B?N0c2OW1kWmpBUkJFZ3dZdCtnQWFaTE1ReWJ2RnBrRDJMbnhPRVJ0QmlGdlE2?=
 =?utf-8?Q?r1SMChDuUIHAYWxzy5G97Ni+NaNCZ8kgNO4Iebj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa999b6-786e-48e8-a568-08d8ee9783ba
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 07:36:19.1659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: atVRrDdTrinZdjw31d+HAPvYDSBHFi99+lNe7I/T24Npz7Jdmz7GqY1VSEe2xNbXY4QL/x4iTbX6rJTpsUTqeUjxzIIB4MfnFR4QTyKloro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5990
Received-SPF: pass client-ip=40.107.21.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

24.03.2021 00:20, Paolo Bonzini wrote:
> On 23/03/21 20:12, Vladimir Sementsov-Ogievskiy wrote:
>>>
>>>
>>> Move the trailing empty line to print_env(), since it always looks better
>>> and one caller was not adding it.
>>
>> Seems you've moved this fix from one unrelated commit to another.. And it touches two extra files. I'd just make it a separate commit. Nitpicking. Separate or as is:
> 
> Well, now I add the third caller

Ah yes. So it's related.

> 
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 


-- 
Best regards,
Vladimir

