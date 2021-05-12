Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C5937B6C6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 09:20:55 +0200 (CEST)
Received: from localhost ([::1]:38798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgjAs-0003up-8z
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 03:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lgj9f-000372-Ci; Wed, 12 May 2021 03:19:39 -0400
Received: from mail-eopbgr60107.outbound.protection.outlook.com
 ([40.107.6.107]:15961 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lgj9d-0002WB-Oj; Wed, 12 May 2021 03:19:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S38dk21v1+Rlrt6ELQJK2rcgq6oeXCP/rh/J5uoHPlwp0CywCbUL3L8c0iyRwkTh1Zct3zKLzzXSHbsv3eSLjQkytrV4C8UtsLzkxp0oSIzlE6737xE65JghPD//4Kv/rrl15n1jPakPi996oPn5CKxj9RbrQgv4fn+9pLVcdiMoBLyAGCdd+MqdA/2ZH0DmP7v4WvnHp8bXsJFpJyeB1cRKTtRED/Jc4KXCnrkqm/XyEHZehuNiGx3j9DL5zlwQjzjND/OXshMCtOxXY+Y3gyIjkk1oLCKRE6hpqOFchIhpYmzzVP8Ll6IauFv/21TwwOtNkJHHzUwUWmq2580t9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pynb7/wxTZ3a+fMKoyzJbh0i8xZbJ7dKH8qvGSCZD1I=;
 b=J4wMtu7ctz7JRNstL86z3eJtSja6HeIi6q2qzPg8Y17I0bsVfIO0DSpu2q07daZqs5P26ShXeuVbqcwgueuBoOqRuwKBGOgVjYH7XMjog+455cGCxD3IY1iLFtnSd6jL2Gs/5qe3j9MobX7V/d3le6nbu67vf0uIh4qE7x6OZn0lvI9zutyJByXFUJRyl4j9+LijPd+9q1rAgmk0q+N6OKoB88nVZtyw4vtse1Vk0wicA/3qRCymjHVfeaDzUThlSu4wRqEw3Yz7RfzEMbIH+tohY7J7z4IJgyq+5hCYLlNM/bOyNfDFDl0V6K9WbAgODBwPk3T9qPUicMy0EXieQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pynb7/wxTZ3a+fMKoyzJbh0i8xZbJ7dKH8qvGSCZD1I=;
 b=qMb8z5D7ZutZwo0Y6nfVAgu3sWIilgoVm9D1ceCabUS+YKqEzp73paDTiYCuGbqh7ILxyYuUU5xZof/SVoeeySXArfnphk6sKYJAAo/JI3n0+0XOJdIJORet2XYqQaJrK26wkj/qjPPxa/TB2qL2WxkRgsazD5ih/75WMN6+Qos=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6152.eurprd08.prod.outlook.com (2603:10a6:20b:298::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 12 May
 2021 07:19:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Wed, 12 May 2021
 07:19:34 +0000
Subject: Re: [PATCH v3 31/33] block/nbd: add nbd_clinent_connected() helper
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-32-vsementsov@virtuozzo.com>
 <5ebc87b7-d76a-6cca-b389-3965b97002b4@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <8dc03859-9116-057b-ffb0-f2f92f48b2a1@virtuozzo.com>
Date: Wed, 12 May 2021 10:19:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <5ebc87b7-d76a-6cca-b389-3965b97002b4@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: AM4PR0501CA0056.eurprd05.prod.outlook.com
 (2603:10a6:200:68::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 AM4PR0501CA0056.eurprd05.prod.outlook.com (2603:10a6:200:68::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.50 via Frontend
 Transport; Wed, 12 May 2021 07:19:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46519f04-4fa5-4191-7e32-08d915164aee
X-MS-TrafficTypeDiagnostic: AS8PR08MB6152:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6152F823875906E54C1E1193C1529@AS8PR08MB6152.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ARMgeDs407voLhBMKC6NMCXfDmQ26r7+mmJXwMrmau0h1R1is6IRMGsO1a5GnUwHi3FWeghaS70lnjrzLtpTwIOk2eZcH+YtAf64ctg4ao//GucpSf+67V270iaRGjHswtcezst3JS75ISz8oWeY12a4AUnA06xl/GYhBUWd8PQ9HqV06hYnEOE2yz+P+GONF2TptUjVp5hbZ4hRGq2pKg6zZhSR0/7HglS5xmy/YSlwaQnNQ3yK8f5LLn2krmiBrLtvxsP/OykLtaKc2geNxDslJRuwvt6porvzu7+rDaLIYja0IkMqGnVIa/uqs+kTxUsL9sIRZXZugiu1x//aYsIzHyOqO1KI6gCYdSAWViZvwZjCuyEK1tASbMWWI+F7FWdxVYESeADjp5badykAjUInGMRVPg8SMvi0nCC23rlwPQL6h+mY0M5chOT4kvFPb/CL9Pj7Qb8B3TQaaZzskHMMu1mSCcwgXXR/Eh81Ejz+kzML895kr7H2i+2THVUd3vClgmjAUZYx4Deq2wabRmkaDu7tpHkz+eqkrGb+37iQYbB+/ITzkaUtkK5vcfY9T6Jlh8Yf9R5i3coztLihSdKqA1ePbRN1R2Nf18BzyfyYjfbaWkVey50Y5tjXI+GtLbrEh6fFzg9iHb7uxaN+1r2TvV6YyGL3uCa13DxS6u+adE21eZka6a0M/x5mZQW2uD58MjbPOnq9y+9n09YS0f7zEo756wZqYvcx1efQZbM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39840400004)(376002)(136003)(366004)(16526019)(5660300002)(2616005)(31686004)(2906002)(31696002)(66946007)(53546011)(107886003)(186003)(8936002)(26005)(6486002)(478600001)(66476007)(36756003)(8676002)(52116002)(66556008)(38350700002)(16576012)(4744005)(86362001)(4326008)(38100700002)(956004)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SDJDVldObkJRT1kxM3lOWTlnSmpycWtXejk4YXNyNFlpUitmTzFzZWhRVWFy?=
 =?utf-8?B?WCtubDJWNGVsSlJPZkdsM2pQc1hwaTByZHFxUXFETjNOS3FUdVJjTVl1eXJk?=
 =?utf-8?B?YkZ3RzN1aUZVdFZEcDhoN0psZjd2TnA5RUdhWnVaWFI4bnpvMTJBNFV4ajFL?=
 =?utf-8?B?SERFTE0ycUF4VENhVHA0cFBGVzhhYmtGZlNkN1FKOHpRZklNQVVlbzNlNjRE?=
 =?utf-8?B?azQwSllLYVlnZWoxdUZxSFlnMmlkaE1Iam9UMFlQbGdLMnVmTHEyREZBV2dJ?=
 =?utf-8?B?Z0RkTTRpdFl2ckZodHB5Y2ozcHZvNVdpMzV5QVNxMHZsTktzdGVJdHg2ZVVZ?=
 =?utf-8?B?QTNpQWlOVExXTC9McEd5SlBlUE53SjVZM3BJU2RZTnpYRDhlL3hUeDY3dmFo?=
 =?utf-8?B?YzE0WXJSYjlWRWJXbEc3djBRSForYmhCYTJiRVJPZzc0TVJub0VmVzJOdUhl?=
 =?utf-8?B?cUtpdnpsQzYrNFQ1ZUcxY1NsOFdsT2FOK3ZuZjFmak1RUGVTVXBkcWdOcjQ2?=
 =?utf-8?B?VXRnMmVlS28zUE1lVWlsWlJvRDBkdjlFMlhmREZ2TDVWNXRpdEQrSDgxQnp3?=
 =?utf-8?B?YzRLRndieDd0NjVGUjFaTGJyZVhocVRDTmM4b3c3UkJjNTVxUTBVTEdqTUF0?=
 =?utf-8?B?akhuWU9GWG9mZ2N4N0NJMkJKTzgxVjc3TEl0OXBLMm5jdGwvY0pBM2hUVE1w?=
 =?utf-8?B?ei9vbmt6UHlwZWMxVThKMGVEKzJIU0tZSU5nK3BQbFhHcGFtZUVqVjJTK1hL?=
 =?utf-8?B?bTZSbk9senVPb2g4dkRaYlJJeFZ0aEk1OUZnVWJYbksxb3JJclE4bjdWUVFw?=
 =?utf-8?B?MVd5QXFlT0pOVVdJcEpTY0FxYUFoVjIyekZkOUVqMzZxUlhWZFN3cDF5clVJ?=
 =?utf-8?B?MDlsOUtJSFhIWTNxUWEvMG9ad1plUTZpd2xNanhjZWczWG1SRG1CQkR2TTVG?=
 =?utf-8?B?T00xMEt6MWF4WEpFM09wdmMyOUxDQ012dWd3T1BnUlJMMDNvM0ZqK0xNTGp2?=
 =?utf-8?B?cGZoQmRFMXJjRjU3YmpUM0Q5VlJYU1oxc3cwR3hFMFR4cGFnRWRZRkNNd05T?=
 =?utf-8?B?Y2NLRmo1M2NwMHJJenNRdXM5alpKaGsxV2NNUXJObzBIalJubGpsMzBBdHFD?=
 =?utf-8?B?cVlkczJUdjJOQURHZXF4S3dIeFFNUmV5bExoR094QjRVcmQvdzNXeVhPUzdR?=
 =?utf-8?B?RWFOaXlQWGMyNGgwMWI5TXhiRmRoQk9qRk9UY0xWU1ZBNVV2S3pmQU5hVCt4?=
 =?utf-8?B?TWFSYThLdEg5SVNIeWEweVdEN2ZIN3JUaVZWb08vSHNhYVBVWE5Ba1lKbEVI?=
 =?utf-8?B?c2QyRTEyVXhaSDRTd29ReE1hUlFralN2Y1pxcUluemU1VU5OdHFnL3dIczdo?=
 =?utf-8?B?TjZuUkNadFNiVTFsN29QVXF5R0JjQWUzTVc5R25aRVVqeEpMNWpxVFRlUFJ2?=
 =?utf-8?B?QVUzcmFaYU4vYTRTUkN3UW8rNEtBZXA5NVMyNWJxbjMwenRzMGdneERtaVVz?=
 =?utf-8?B?ZTZXbTA3UDF6MDlmbGd3UTlrT2dBMXhHRVdUejJkdStWL3huNHBmaWNNTy9i?=
 =?utf-8?B?NjFXVVU5bzhFangvNkM1OFpTUjNvVElmTzRzb3RoRnJoZEd4M00wb0VZc2V1?=
 =?utf-8?B?Wkc1YklOOWtGdzFGR0J4UHBXT0V6RGNYWXptNGZtWXA3SUxrcjlSZk9YY0ZU?=
 =?utf-8?B?WGZNanlTazNGM3pVRlgwRjdZWDZRcW12NVZXcVgxWHFwLzJtYm44NjNNRWow?=
 =?utf-8?Q?90nEdS0g+Ov1js8qyqaVmDeFsQQHUNecsb7TOjw?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46519f04-4fa5-4191-7e32-08d915164aee
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 07:19:34.1239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLyb6vuoVGE+438z/9gv8J0OwTjPx8YohUvkYLYsfGL8NTDUk07i85IGnMkOwSBZknaMfBovxi/abrYZpPQaj2+CPipS+jyHFSysVgDoTIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6152
Received-SPF: pass client-ip=40.107.6.107;
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

12.05.2021 10:06, Paolo Bonzini wrote:
> On 16/04/21 10:09, Vladimir Sementsov-Ogievskiy wrote:
>> We already have two similar helpers for other state. Let's add another
>> one for convenience.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> 
> The whole usage of load-acquire for the connected state is completely meaningless, but that's not your fault. :)  For now let's keep it as is, and we'll clean it up later.
> 

It would be nice, thanks!


-- 
Best regards,
Vladimir

