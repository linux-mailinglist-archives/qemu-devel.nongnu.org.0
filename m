Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA13358AE6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 19:09:30 +0200 (CEST)
Received: from localhost ([::1]:41240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUY9p-0006Xl-7O
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 13:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUY7r-0005H0-W0; Thu, 08 Apr 2021 13:07:29 -0400
Received: from mail-eopbgr150137.outbound.protection.outlook.com
 ([40.107.15.137]:30852 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUY7j-0004nf-Nz; Thu, 08 Apr 2021 13:07:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWbiAMN8ZGIh1pjbFjUtVDKBRYWXJRrL8eYtLFRP28mu81NQfEs+unJxkaXZsC106AB51tfRzpKpebU1MUjP9E7qm1KIRlgy/5zXPPg+vtBkyJkScgd/CxPIU055CdU6knxs+mFuMQ4PYzddWOMxEiL/Z/NJaiWodemkoE898FKNDFlMi7mFDTlD73EBuRRtH7PnQsXZPSI4+xqWmwTtB17dmefbZPP4OcmVNE/u2kB/zdTo1ApDS/Etlhth9v/eJBgh7nMLcKJtTX9BUnvwBVj2/mbqRZBVjXymU2Qki58y8Oc0vIIW+6XEfIgEsXPlZJYpxTqotTR3oEtN5mSyGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dkTVYp7UY9BbcXZYfW/d894IvQ2/Wseahj143TVT6s=;
 b=K8fXpado430WwPhDIVL8Qu5dBjItmmqjAS2q7g+AL+bb3cs43+FiT222Q617v1nTtCHWgwZ7DnUjXJDSU7oowuTtyKHQKZ4H08Q8LLUthZbeAqQjKCz+4+ywYX+9+g900R5HQ3A+qzhar29aY2Sa94cGSqPyPh4LqZ+jKDLesa3V9n+b8GvM6XRPFIJItcBPiZrrLUMJ9p6ZyzTqcJP70HXSDgtMPazXJDWS0bhvDbgkflg/hSe6rtlr1sQr3NCFdCWk8vI8ryTaE+vM5aZ/NC47OFgVr7QrSRKyZeIQ/IkK1JvYxTlCehLQB52NbHQ/DxITOqOmQC+48e6/mEww3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dkTVYp7UY9BbcXZYfW/d894IvQ2/Wseahj143TVT6s=;
 b=Rbkyo+XCjxCRtEz5YZS5hjuGWfYNcdBp1qIJ9geBZpQUSvPjBqWsQPS9ar52wYfTOpHgsilt+hBSuxqAxqJ3HS10UALngOc45RE0xHRVocAc8kUxM1J1KgR+fjsIXVLto8GmkGMAopq5qwZOHlFqWYqtnZfMheWHBXqH6ahc/g8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3447.eurprd08.prod.outlook.com (2603:10a6:20b:44::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 8 Apr
 2021 17:07:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 17:07:15 +0000
Subject: Re: [PATCH v2 10/10] nbd: move connection code from block/nbd to
 nbd/client-connection
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com
References: <20210408140827.332915-1-vsementsov@virtuozzo.com>
 <20210408140827.332915-11-vsementsov@virtuozzo.com>
 <YG83t4s9kYLFRqUC@rvkaganb.lan>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a7801f70-5a53-19ab-53c1-98cdad73e2e8@virtuozzo.com>
Date: Thu, 8 Apr 2021 20:07:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <YG83t4s9kYLFRqUC@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: AM3PR07CA0135.eurprd07.prod.outlook.com
 (2603:10a6:207:8::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.206) by
 AM3PR07CA0135.eurprd07.prod.outlook.com (2603:10a6:207:8::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.6 via Frontend Transport; Thu, 8 Apr 2021 17:07:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 029f3486-57f6-4c6c-cce9-08d8fab0c26c
X-MS-TrafficTypeDiagnostic: AM6PR08MB3447:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3447E3A42018820883CD4809C1749@AM6PR08MB3447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BKCKZ/i8oHlHq8yMR99pOGP7VM9RAeBacEHGGIaa/nVC2xN/i5Y2uCGTBbmDVh1grFmJnVv2A1DjwCYMGI2LyKS7OUcV30pMA/49o1euSa9BNgJBi8H8LnEhYPAqGGJ4OYLCzVb0Vbcoi7xhLfGqf9lqPUbDK5GJabAcbiV1qK0z/3Ye3GipBYNC4eJvuFqF3O0AIkMDbAzaLc0vUEklunYgNKqNbZ/QCwR0EVUHMlbLwyFRiFJPxkCojnEnHeHDznkoabM1sfmNEVhnDhZ7djkRcJw1gT142k6xdIgAX0ZEWVe5oIQdhbYK5Gb57rqYGmEt7Wt1ET4kvUdU2LSvXk5Unkb5tQLP9zJiCrnQlXg6GxqeiD/XZ9exTPYYvNggVRRtYVeWvDNbdV4hXbzMgR296kCzb2BQZeLf3fyFx01/D6V0feI7QG1z9ljTk6k9uC+6NTyazSFkXcmgXk94VfyvXjhual24lBPI0FVsxlR9kRxl+GbWKeQFanKl2w6kO+z+FafmPaXnZiOwhTR+cNzzqkAI1QY6UjVZmI1W8VNqs8S4lAZOsDzl2NT6ByPR16dnkoLoWvk+PQrUiITEPoEblgX8CfcmipGB/TwaJmLi54eX4yD7vkCdkkVbc/V5NFPu508drDsl54IY+CraxiLhDUtAtUsYn7lfyZXFXcvtJ+zZhV8OQf8kQxqf/fc9SWLZffvPOKQguBAgiej8zhinsN3AGltgPxsSmjLLEPs1n/fvixXUVe4lBoFC9UNP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(396003)(39830400003)(376002)(83380400001)(38350700001)(38100700001)(31686004)(16576012)(2906002)(86362001)(36756003)(186003)(16526019)(26005)(31696002)(66946007)(66476007)(8676002)(5660300002)(2616005)(956004)(66556008)(8936002)(478600001)(316002)(6486002)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NFVhRFhkWXdreFYvOUx2MjVUcHlYTDNVdG9Pa05uSFpHYzJzMllZQXNQaGds?=
 =?utf-8?B?eXhBS1AxR1pWRE1qMTZBRXdmclNmWmtPRFhZaG1qQUtDaW9QRTlFWXZaQWhC?=
 =?utf-8?B?V3JtbGdldzAzVEJJR1I0YjBPUWM0RnVIVUsrbUl2SUZXY3JJLzI2YzFVdWhE?=
 =?utf-8?B?VnYyK1IwU0dOckNuN2FodndnZDZkaVg3cWxkcVY3RFBPY2tuZ0FJTFkxT1FI?=
 =?utf-8?B?bXFkeWZ3c1BuV3dDQUE2Ylkzdzh0OXd5NGMrMlk5SGdqeURleE95OWY3R3Rq?=
 =?utf-8?B?K1RnZDdUdFF5Y3NjMjE0WG8xaThucUUyam5XOW9ublVMNktGV05hMFdTOFVQ?=
 =?utf-8?B?b09qQnV0TlR0d2RGbmthZnFQRGdhWGpRSkRFU2pNUnRvbEhFVERSSTFvY09V?=
 =?utf-8?B?bS9KcytOZ1QvNzFHTzFneHNkcjdpUTV0ZjFCVk5qN3kzWUdYNnNhb2Ezemgy?=
 =?utf-8?B?NTJIVGNuMHVsaHI3MXp1b1IrUUovMjF5dWhVYytHTEpsZEJzQTlsWGVGWWU3?=
 =?utf-8?B?WEo0MVRWenhHa2lCZm5LN2ZhOEQ4eTUxTDBDSnNmUm1DZmU1UlgzdG1CUm1C?=
 =?utf-8?B?cTYzc2FmeFlkUlViMkRBVDhYdEdUQ0Y1eTY4bURENC95bmdmSEpITlErM28z?=
 =?utf-8?B?TlNwWFZDeDFhckFxcVRyaDlJVTB2VGZ5amtIaHpvSGNUcVRNejBKaStubTcr?=
 =?utf-8?B?dCtiUU92K3BBaU5sY3lNZS90OHVXRUtUMjM4TVdtLzl0MWVIZ2pFL2xuYWFQ?=
 =?utf-8?B?M2JzSmZzSFdrM1JQR1phVTA4RU9WVjROMXBQWVROZGhLTm9MK1N3ekk0NVB2?=
 =?utf-8?B?ZC85bXgyUFUvemkzUG43SnJhY2pBOFFlZkRFM3FYOTRKeTEwa3NXVTZRMnN1?=
 =?utf-8?B?eGlidW43NHpTQUg5bEtBdGMzK1dpTTlXcVJOd1pxV25MYk80bnVCaC9LOTJy?=
 =?utf-8?B?RXRIWGExK25jd09wSGpYWTBodFBUTjhDMmlSQkNtb2JPTGFmeUZ6T1pkSFhU?=
 =?utf-8?B?ckltNW8zdmhZVVNMZVVHOUkyRENydm9YMFpvQWJWbGVsQmw1U1Q5M0xtOExJ?=
 =?utf-8?B?eVVweW1RUVBnQktqZzRVNG53M0VZcG1TVzdyL1k3TDIvb0pLR0pMVXd1Vk50?=
 =?utf-8?B?eWx1NVNva0xNcVY1ekRLZ2diT1dDa3RzMlYwRzhwK0pzdzJOY0N1SWthcjY0?=
 =?utf-8?B?L0g2UDZLS3VHVUNJN3FvbFNDU281RDIxMUpXTGtJbVY1ZTA3MGlVcEIydHBF?=
 =?utf-8?B?MVpvUjdxRjNOMFV0RkMyaS9kRkRYRHdUcTBGUFJWQ3huYlVWWW1rbzRqSm5S?=
 =?utf-8?B?NllUT3dVNHJrZmJoOE1KTkI1VC9FRUhOSkREd3BGR25ocEN2ZE4xWDhqbnha?=
 =?utf-8?B?S3BhYmswVzMwVjdMbjRUcWJFV1lXT2hIMnY5aXlSYzNKZi9sU3RYM1hpUkx6?=
 =?utf-8?B?TGF0N1NQakswbDlrU0UvN0h4elJPY2RhOU4zV1REcXI5aTNOdVZ1a2xjMkVp?=
 =?utf-8?B?SkRTcUtDOVpPT1FMTjVkSFA5WEdyQ0FYZDlab201Sll0cXhRTUV2QXk5SEcw?=
 =?utf-8?B?VTJZSmJ0aWNsQVJ5V1B4aVQzWTRuQjlmT2FqR3ZHS1ZyTE5yeVkxZnNqdVZB?=
 =?utf-8?B?UkxhaHJzTWNUeFVvM1BHUWxXUDJ3TGhBTlpUdGdWd2dWbDI4d2VwTHRyNTQ4?=
 =?utf-8?B?Mm4ySFByZUtTekhPemNOYTRBTTZzNk9XL2JEdElFWGttL1BnZWNrNU1JL1BZ?=
 =?utf-8?Q?9vnDA+bcgtWkQ4nqCUCIma6/05MprjeNKKgXP3d?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029f3486-57f6-4c6c-cce9-08d8fab0c26c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 17:07:15.7049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pt75DNCcz1no4LATqqfzai6VrDZaBNlmOYwaRTbcNwTfWgkBXXrvm0hG0D405hGc2ekveB+Tz54/tafujPHMlZZy7dcYxjmDc0E6TI2TiN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3447
Received-SPF: pass client-ip=40.107.15.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

08.04.2021 20:04, Roman Kagan wrote:
> On Thu, Apr 08, 2021 at 05:08:27PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> We now have bs-independent connection API, which consists of four
>> functions:
>>
>>    nbd_client_connection_new()
>>    nbd_client_connection_unref()
>>    nbd_co_establish_connection()
>>    nbd_co_establish_connection_cancel()
>>
>> Move them to a separate file together with NBDClientConnection
>> structure which becomes private to the new API.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>
>> Hmm. I keep only Virtuozzo's copyright in a new file, as actually I've
>> developed nbd-reconnection code. Still probably safer to save all
>> copyrights. Let me now if you think so and I'll add them.
> 
> Not my call.
> 
>>   include/block/nbd.h     |  11 +++
>>   block/nbd.c             | 167 ----------------------------------
>>   nbd/client-connection.c | 192 ++++++++++++++++++++++++++++++++++++++++
>>   nbd/meson.build         |   1 +
>>   4 files changed, 204 insertions(+), 167 deletions(-)
>>   create mode 100644 nbd/client-connection.c
> 
> Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
> 

Thanks a lot for reviewing!

-- 
Best regards,
Vladimir

