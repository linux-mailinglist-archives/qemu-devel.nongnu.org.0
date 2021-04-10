Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9FE35ABF2
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 10:41:01 +0200 (CEST)
Received: from localhost ([::1]:57394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lV9Ap-0006RX-No
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 04:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lV98x-0005te-OF; Sat, 10 Apr 2021 04:39:03 -0400
Received: from mail-eopbgr70102.outbound.protection.outlook.com
 ([40.107.7.102]:17728 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lV98s-0006jQ-B8; Sat, 10 Apr 2021 04:39:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6TebJd57UUdBAEyNmKQqVhRtIe7bj7CtkE+ledJPQyY/5GL88LztobTa+sWvStcwOcDxkXVyg+6quRHjlixBdDgiEWBhVHB3Mt3+CAb5ALT2Php/vUjDWsSWf6TH2Apoe43Dlty4aYnkN3oR2U1f5Y2hFIRk15a/smhYQS7HT0axyVRjD+zo1B9dSgn6bbBZiCTOxlZ5xf70MFwp0eIbYy81JcaoYBrrlsBz5BWGzepa2IHsbxcg4ckf2rnh1wZQC9iCGulQbzAozFTeZJLhyDB/0mJ+t1m/sYpQermSsiBVF5aBVh2PbQ8r5HgMiUnU22Kbo2+GJ/UZM6YWw3tFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/FPfH/E+ZBdnmGRTFNxwb2h2xEOqbY0NM6A4LG4D2Y=;
 b=mA+3CHhi7wXrAbbx7xrm30I9rmjTY5NRsb8AkAo6MCUhUfyK2iMIi3YThhRoLS6hB+88h4NNMXky7oIKyDoAdK03aodcqlkMxlH+X6GD4EkV3hH4+p5i8wnTvk1KVX0dVn6LVT6ehB9k43DIBByLDFWYewHDTEVQpPlRhsVx1zamGNKfN0a2B/vLGH0RKfYaHgYds2P4obxSxFNBkr/kSkZRFYMAd9QdsJtbTxWuJTAE5lgamns8r+4DtVRlwt2PYAfiCuoicXq6JnB6on6bvbwsjxHDS/3aSxO51t9XOXZMUsfmSKd9mbvzw3qyrJ/xHgwObd1GlVfeKZmYLlEzag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/FPfH/E+ZBdnmGRTFNxwb2h2xEOqbY0NM6A4LG4D2Y=;
 b=lptJnvOMkXea/nYhkZAKvql4LaFPQk5ykHaA0GeHvzsx5IVGdk8jlrp8YNJk+qfVpa/b7ygp0nkL7pmCaMyLy5cFrAZohUNS0FotuHAdMF54fSxx+InypBo0HCQvRf8blxKPh0/Usptj7DFcuodUh31dnu+U6J3PswI6g9cG6Ts=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6423.eurprd08.prod.outlook.com (2603:10a6:20b:318::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Sat, 10 Apr
 2021 08:38:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.022; Sat, 10 Apr 2021
 08:38:54 +0000
Subject: Re: [PATCH for-6.0 2/2] block/nbd: ensure ->connection_thread is
 always valid
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, yc-core@yandex-team.ru,
 Eric Blake <eblake@redhat.com>
References: <20210409160406.1800272-1-rvkagan@yandex-team.ru>
 <20210409160406.1800272-3-rvkagan@yandex-team.ru>
 <fa2034b1-137e-017a-90df-6d5014b85a72@virtuozzo.com>
Message-ID: <0d115e55-1727-31b8-0aff-b1ca5e8e49ff@virtuozzo.com>
Date: Sat, 10 Apr 2021 11:38:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <fa2034b1-137e-017a-90df-6d5014b85a72@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.198]
X-ClientProxiedBy: PR0P264CA0051.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.198) by
 PR0P264CA0051.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Sat, 10 Apr 2021 08:38:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7a851f4-6df0-4e8e-5335-08d8fbfc12e5
X-MS-TrafficTypeDiagnostic: AS8PR08MB6423:
X-Microsoft-Antispam-PRVS: <AS8PR08MB642325FC6A06449272A1E39CC1729@AS8PR08MB6423.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iSpRR7ykObIuE6JPBc21A3eLrKq9NHXuKTpxhmIoIoMkBnGPyICf0pjSORI8qaR+HQKMFARX/p/KMXcYJ8+3T02z72qhN29xkt2N89QfibCUnYDtwjk/MMvSNAfmuDu90Dusdpko0a7pdqAXFLD6ViUcADWUqUlopoy4MDEmM+hpiDbWWKOMaMO2CRZjbrg7+GDmT+Y8V00afFljgeWigUZuaOpxgfnPma+tJhrf56IEIZFMUs+a+YoQc+X8ZvG5BMS/Uh2NPuuuwXJi8j/Hsgb5ecsmkVDvppm4TeQepooqmzqEPjew93gHlLJ7hUdQ8OrrJDUfY3pBk0FTGq5J/VeOyGdxkc47d4yaJ8LpxbEV3YSVNT+HKcCwCWF/jSxKSHbg8UUnlJxqh/y3M/UL9Ltky7WxdIck0sKUVjKU02ya7EhqacCtkh1bDfJWQS8ela7EXDU0v2RKGr2stsOUWi5Nnnt7fVrTSl7QL2vsUWkNqV7gRDgWqRJsKD5vwugiOY2/kpRlPDBirYQDVd0rCZnDYuKwzulo1m7CVUYVf1TIFAcvypogaHDriyBHfogq1fk6dMGHi02AKyW5vkqghf3Jnce7RLudOlXjiKeDJ8QmEyjefqYa9Que8kDAyX8lqvGyLBVBCi8QP7OYoPUmA75qJVJlYeP7FBLV4dlN/EHWSyRfUks1ZuDV2dMlf8g691IJalesht1IEeAA0vDwgY6TG9I5ZfvS0nSMNbHbmNg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(376002)(346002)(366004)(396003)(136003)(26005)(4326008)(316002)(6486002)(31686004)(36756003)(54906003)(38350700002)(38100700002)(16526019)(186003)(52116002)(16576012)(83380400001)(478600001)(8676002)(66476007)(2616005)(956004)(31696002)(86362001)(5660300002)(8936002)(4744005)(66556008)(2906002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dHp5MjNkK0dRZm9tV2xtUkxDUk82R2w4cXpSOG1FWVkxeWVzbHJnaDNLQUwr?=
 =?utf-8?B?eDA2UVJIcStOSDd5RGNCeXVUNGljSmxLSlloRE03eGhJWUNjMGxJMndjNW1P?=
 =?utf-8?B?MGozRlNWU1NkQUMwTi9ENGRjcXlRandubHg5Qys3QStiSTJvSkhHMzcwWHVC?=
 =?utf-8?B?YU40MmRKTHROUXNqWUNKL1Bnd1hqd0Z2ZCsrUlJiL1d1SFlkeHhwQ2pTRmor?=
 =?utf-8?B?SUxmbkl5WXdVVTBrd1h4MmpaU0dJSlZOSkdhZld1WWlyNEJMSEVLUDhSb0dv?=
 =?utf-8?B?WU94ZXN2Q1BCYXVFb2lzWTEvZE1UcjBFdjVqSllkUDR5SVdUZWFNZFNDcjRP?=
 =?utf-8?B?cGplUzZoNktwRjJwdEMwQTYxTy81YVJ2QzdZNTdkdlZJTDNvZHg0NXEwZG51?=
 =?utf-8?B?VmJXK1pQWFRuSkF1SnRBYllwcDA3aXZYbHlRQld6a01ONllzcWluMGJhN3k1?=
 =?utf-8?B?MHd3NnV6TEVJOGZOSm41dk1tcjBEMnlJaUVhVU92TnhqeW1UejR1ZkRmcWs3?=
 =?utf-8?B?bEI2aVZGYjZxTURyUTFJK1hLdFpzTDdGU0FFWWluUi9CNDRxMjNvK1hacEJm?=
 =?utf-8?B?OWdxVG1rRnhDQm5lTzNQOTB2TGVRMVFGb2YzUVdsOTJqMndJWk90c3NjRGdu?=
 =?utf-8?B?d2V1VkRWbHZYRU16VnJIN0FPN3FVWllNcHRRU096ZjRUWHNob1F5VjhqZlh5?=
 =?utf-8?B?Yk5HcTFGWkk2WWo5M1Z4c09yWUc2Y2s0VmFwbXN3NURIdzNWMENUMUJFWWFr?=
 =?utf-8?B?UHk4Q1VLM2txUGM0ejBvU2FTOE9PZU40TlJESFBFb01RRERBeXhwV0lZWS9H?=
 =?utf-8?B?dzczdmFrY0FxSjl6OEVKYVBNNDQxRkdKZ2F4d3kwR0FoQmJ0S2pyczJRcTl5?=
 =?utf-8?B?d1RVcExCYWxFN2hxekhsNGM2N0FQZTVIZ1gvLyt3MlhJMzRSZmF4eUdFTHdF?=
 =?utf-8?B?L3Y0ZnVBSU9qT1VkLzF3Q3V6OTNXZzYrUnl6dHJkT0xVaDNKdXVwU2MxRzlv?=
 =?utf-8?B?aHZZWkJQbVFGbjJFckpIeGNqSkx5d3VHS3lRZ0xyTmxxRy84by9HYnd6dXdr?=
 =?utf-8?B?cjdQRm1nKzZBbnFqR0wrRkpRdWdxQ0ExS3ozeWtJN1h4ZXBuSjlnNXJxMmo2?=
 =?utf-8?B?RDhPOGVEb09DZVRYc01uaEMzc3FpdWpxUE1ScVgybWg0TUV0TUg3aE9Rbm5m?=
 =?utf-8?B?ZEhUdUxLaXJYSjd1MjArNTN6UnFDTXozcTN1ZWRQVHN5eEEwS21NMnk2dXdP?=
 =?utf-8?B?RVVPblB1NHUzeVNzU0pKalpBaHRqa2QvV3VTWTZ5K29UUVZwcXpxQmZHZkdB?=
 =?utf-8?B?bHE2QVoyZ1hOK0cwQTJSNDJDVkwyR2xvSjI1WFlOZDlBbG95L0MxUkJWekJM?=
 =?utf-8?B?cUFJU3l6dW4zQ3N2MzRwRTJuZ0VCdHZUamM5REoycTVwRkVOQVhEcmxrcHJj?=
 =?utf-8?B?SEVFbE1wQVYxeHpBYThPeG8wT2Z6M3lEdEozNWV3MnovQ1YyQWF2eHBtdDdY?=
 =?utf-8?B?TGVBdUIyZmZWWEhyckNDQnJDWFJIZFlFaFF2NE5XRHo2NGU4ekhZNHE5aUlZ?=
 =?utf-8?B?M1pudjJYME8xS1lBUERrVmU0dmVBZ3lCTGN1SHBaZzZpSHlHQjA1TFM0Q09F?=
 =?utf-8?B?RmZYQTVZK1p5NHNDeThpdGhJVFJRK0hzVDBTOEdna3dDMEZQQnBuTXBnbkNK?=
 =?utf-8?B?bFAzMVJMNnUzSXpQVnROcXZUc0VvRlhlcTNYSTU4cU5TdWdhcGZlSUxzN1ZB?=
 =?utf-8?Q?AllDjzler5BbWNNp2GWdsaMJWDuy9FelraH2DAu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a851f4-6df0-4e8e-5335-08d8fbfc12e5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2021 08:38:54.1280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w13f+Q411CyenHIxkoyCDF1j3EjBIJn1ZmZ/4YnkpmbYils/ePqCJK7l72jf7Uop0p7XkneGON+OnIgx9XLa/U5V1w0/QT8wrAM9eqssY8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6423
Received-SPF: pass client-ip=40.107.7.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

10.04.2021 11:06, Vladimir Sementsov-Ogievskiy wrote:
> 09.04.2021 19:04, Roman Kagan wrote:
>> Simplify lifetime management of BDRVNBDState->connection_thread by
>> delaying the possible cleanup of it until the BDRVNBDState itself goes
>> away.
>>
>> This also fixes possible use-after-free in nbd_co_establish_connection
>> when it races with nbd_co_establish_connection_cancel.
>>
>> Signed-off-by: Roman Kagan<rvkagan@yandex-team.ru>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 

Ha stop, it crashes iotest 51, as nbd_clear_bdrvstate is called also from nbd_process_options.

And this shows that we also do wrong thing when simply return from two ifs pre-patch (and one after-patch). Yes, after successful nbd_process options we should call nbd_clear_bdrvstate() on failure path.

-- 
Best regards,
Vladimir

