Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847B73ADB5D
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:34:09 +0200 (CEST)
Received: from localhost ([::1]:59212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufnD-0006EN-QA
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lufkm-0003Tz-Dy; Sat, 19 Jun 2021 14:31:36 -0400
Received: from mail-eopbgr00100.outbound.protection.outlook.com
 ([40.107.0.100]:53827 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lufki-0003hO-3j; Sat, 19 Jun 2021 14:31:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wg+EHrL3B+nwVKxIRV7v6S8pWzm+O/KY9SYzw06M76Km0ijRGA+Db69c076fZiiXHByqc/GMFjR/1QiPUvL45xgKi5JIsbPsBXHgmdYNFJpk+AmGtqCmwqiM4V8kHySXnSzzo1ErlQerDKlq0n2iyNsFJoti1GFyLzIWygxNYGpIaWCIMj27ZIRp6dC1jmDp0MwGRwf1a2UDqiLommTn5HuU2q/h5MmLtxvKLaThtISQK7RMDdH8mqHVUVI0/6NB4wvDRafiZf2xNzqXDjl/n9Zn+B0I9cSJ5fd6nh/9M+h3jJGPAoYOS2tId8tuD4S4Eo48+FHgKGvftSphOw5UEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=st4FgVcTc5ItMXQqGcQDNQ5PMKPgh1j7u2dO6Yqsvo8=;
 b=TO7jqjFMQE61WcgMuUf0Dsl1RqYbaQ+erehc3hLW7776ZXvrKaEjSY86crmR2flPEQqR6qdEi8NLze9kUzf/a097DJg6Nyra8Lg1EcQ41PghPrTvAZy0mOiKIMiIHgKH+KyAbAw8rJhhTuZreP+7O0fgaPyjoHg9sYI7jsVeKMWwzYdHWQcEIN0UkDNwjImxGKcOTlQJ7XNgumRTChVE4SrFPhggg1TnAfgR/rXkpSMQeCttcpT9YpgEiYo+WhEoOE1Yh5fKYq/IV5hoJqpP/Lr3IbdkihuOT+4ZxVCqq0CD8aRg0euyzzzGfNZ25kWZpnbIPLqrGlAQ3gOVWCXpRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=st4FgVcTc5ItMXQqGcQDNQ5PMKPgh1j7u2dO6Yqsvo8=;
 b=nBTH8HpP6ss7zPqHz2ohD5XmvnSZR961aenfN/drrjwNrQRd0fcTyh8IfdleS/YmiFWz13vQDgu3NL4EWsYROro720DcoCOaYrDDUG8NM5ZvJmaVV9yUbPRgaGzbeu6pwf9iQHmC6hheVBQFcg+lVN+mYHLT06tnGMg1+npQDqs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4342.eurprd08.prod.outlook.com (2603:10a6:20b:b4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Sat, 19 Jun
 2021 18:31:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 18:31:21 +0000
Subject: Re: [PATCH v4 3/6] block-copy: improve comments of BlockCopyTask and
 BlockCopyState types and functions
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-4-eesposit@redhat.com>
 <3ac5e749-2a8b-e2d2-f1a2-04452b4277a0@virtuozzo.com>
Message-ID: <554f05bf-4ecf-e00e-e50a-ff2450e74b00@virtuozzo.com>
Date: Sat, 19 Jun 2021 21:31:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <3ac5e749-2a8b-e2d2-f1a2-04452b4277a0@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0701CA0047.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR0701CA0047.eurprd07.prod.outlook.com (2603:10a6:3:9e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Sat, 19 Jun 2021 18:31:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e24cb588-9a08-4cac-ec89-08d933506feb
X-MS-TrafficTypeDiagnostic: AM6PR08MB4342:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4342D34C2905AE98679B5FD9C10C9@AM6PR08MB4342.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 989jD+fuRuXufSVPD5rIhHEBV3pnyAcyPajzEysc5ThTopYLO1M7cUN9B8BHAUrVOXKsH2r4JydQ1plYAXqq2v84GyeB2jP4LxMZa5bRgWHC8ZVEOBm9Gpyrs3Workfz/7dgleHojTFNnCVHXhGu0Sq8N36pJ1Mw32zR5/OkqAnl8U6m9k+jb3dMqZlyIvAutUXz7VJ77bkW22VxWSZe3INeEKe6ZkMTuTQvDzL+IPAuB5UB10n/j+MmPESc4HYA3JKqN81F2bCkyLRjxiWIz9eA5B0s74NZUyZOT9totm/b1REErjaRp8q42rhDjXBOGhxQCBRiFfAdquvq4Yu5WVY3ZKHWrcTfd80+A33o4vxN4pdE6D+cvE5+e2m10MxV2ZBfAR1U6OGwivKXCscwoTdaxqoTinzoqrC0a2EkGkfh5Ppc2jU2+gpP8gyT/qqNWvEcLJQn3ZfV7+FTWgaUxsQW/oOid6yWMHJ48EhgZ0EjF5RtVMeLM3C3OTjwjqwZpg1bxhX8+tNnqAU+f9l8apgkLR8XBoi4g404w6nTy/tYKC6T5e9OLa1mzk/THuOMvTB1ESimsho2bmrbdNBQNfDqxRzlPmEOnyRYOPkugO0FawXSefH+aMlcj+ihKvPakgeebMVaCbAmS87uYa7dLBVCGeBk3UMo3hfZNHe3gm568K1rTE3rTJgB4JyLP3ZcKFrh3pU8+DiNUZ1pHmjrqYIZlZzlQkQ++RXM5bKWqwg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39840400004)(346002)(376002)(38100700002)(38350700002)(2616005)(16526019)(186003)(66556008)(2906002)(66476007)(4744005)(4326008)(5660300002)(66946007)(956004)(31696002)(86362001)(52116002)(83380400001)(316002)(8936002)(54906003)(26005)(6486002)(16576012)(8676002)(36756003)(478600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3hmcCtWZWIzVmJBaFZyUzdNakc1TzVNMEtFaDJpVUxrbmtlZk1KV0tURkky?=
 =?utf-8?B?cVdpTVVBSEZxQU9ZYVFuTTUvWWlDY3JxTjlXUFpxRHpyNWNYU0tpMHk2SEFh?=
 =?utf-8?B?Ymx4bnFnaXdKMitNMUttVUJSS2ROTE9zcGUveFE0dGdXLzdSMDgwNDFqUDNZ?=
 =?utf-8?B?NnBBb1BKUkFiUzNKejNzWDFuRDZGa2swQWN3VkJ2WE9jTTF1MVdZV2RsaWlC?=
 =?utf-8?B?UXJ0Q2hMM2gvUndBME9aa0hIeXh1MXhTK1haaHQ4UlhWcHN3ODExS0MzUk9K?=
 =?utf-8?B?UVh1UVpvV3U4V3NXd25HdkoyR0pRVVFIaTUxVzJDUnEyd0c2dkpJbXUyZDJk?=
 =?utf-8?B?YlpVT0YxU2E3SlNZa1VkUndOZ2N4QldIUytuQjJCMVFUOEU3Z0R3UDJZVTZm?=
 =?utf-8?B?aFNSTUVPNHN4L2huaTk2bHl4aVJKUTN6VmNlSmZPU0drZ1RwVVRkb2NHbXIy?=
 =?utf-8?B?REMrWnE5SHRJYmozUFBJNllPeFpQMHRYMmtNdWdMS1hXeHFGbTgwSUpsd3Ru?=
 =?utf-8?B?ZGQwRmM0aDRLYWkwcUFqOTNDRHFOMFFDV0FNUXRkZkhGeWw2THo3Vyt3UFor?=
 =?utf-8?B?R29NaEh3SUdtTjM1N3c1TG1nTmVmVmh4SCtTdFNsK04rK1cxcHVOeVMrTnpQ?=
 =?utf-8?B?NHJUUkRmeEJQL1VONFc5enNreVU2cFNYRXB6WmtwQllsVDUyM2VXWnFoa0p1?=
 =?utf-8?B?MUEwMkNTWEVSQmZDVjc0dGtYbHlLZEUyc1p1S21PQ2FkYlAxUDNsS2lHZlJj?=
 =?utf-8?B?bUJiZ254NXYvMUtnOTk4a2RwM3NOQnVNKzRTdUl6S3FkTllUN1k1ZjRYQW43?=
 =?utf-8?B?azE5WmViTTdoZWVLbHhHeWE4WUI1Z0lYRXpKQjNRLzVmbWE2MkFvR0FNY0RK?=
 =?utf-8?B?a3pPQ3NuTGJhdDk2UU5yVU9IVFU1cS95OGg4aEU1Q3NwbklnVk1PR2JOVVlD?=
 =?utf-8?B?SmU5SW5LeUdSN2FrRWdDdFFuakM5dW1SbmdwaS9GNER6aHUyekExaG9PeUdY?=
 =?utf-8?B?VStsY0txZnFNcEJ5clZiVG5vVjRZaTlyZUIxdWpMQ0lSY0dFNGFodXJvZ013?=
 =?utf-8?B?VWxUaURmZDB5Wjhlb2NsVGNqQWl2MDdycUlVdWJQNVZtMnVVZ3lOeldnQnRh?=
 =?utf-8?B?eEw0M1IreWlMRG03dlNSTGNHZDRuWTRERlZQZ0Via3BFTVZhUkNzNEcvOWV3?=
 =?utf-8?B?Sy9BcUJLcm9jeFRIaGJDME5FNFc0UHRMRmNMYlpUempLSFZMTlA2cXFyN3pv?=
 =?utf-8?B?ZEJIL1VBQ1k3a014QThoV21PbWZ6RlZiNSswNW9qN2JkTHk2bXY4ZVhXUWRO?=
 =?utf-8?B?ZTE2b3VvR3ZSKzFKV05VM25yUVloS0ZuQW1WMnhRQnVhUTBNYW9SMlhiWVY5?=
 =?utf-8?B?R1RpY2FTdi80dUpqamczVm94WWxjZmdlenRDZGNreFUrZjJ6NTB3b0RDVHdK?=
 =?utf-8?B?eDhaR0NhZWh2UG1FaCtDenJmbXh4ZVFrYTRkT3F1RXdKUXNmQ0plbi9rdXNh?=
 =?utf-8?B?Szh5cXRzZzdrMjdMMUlPRFhMUm5jMTY3alQ0dFRzNHVPRnFtS0ZRSFhnZHlv?=
 =?utf-8?B?Z2NJN0dPajRmd2h0MlhZR2RhZ2FOVWRVWGdnMzFCMDcvaFJ0aHVocUZ2REhG?=
 =?utf-8?B?ZjVLRitNQzZodENKN3p5dk5zUGRiVEdZV0p5Y3FYdlV5WlExdDZwaDZkeTNM?=
 =?utf-8?B?U1R5Sk5XeVZFdTJ1djVhUnYwZHp6c1RHRDNXU0F1L25HckhZUmpKdUlSMW1D?=
 =?utf-8?Q?G6hz9RyIOXj4wL4ayTLrm8fjL6+5dw0f8UuxqLw?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e24cb588-9a08-4cac-ec89-08d933506feb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 18:31:21.8485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rrDQTwRhPI62PSKpEgNib95d/vt9AAkTZ34PtZzsoTIFRF6uFvkSKGXvHxxefqU7UpPx/bXCwJFRC6J1M6/0gQfV1ZknJhmQwPbrKVd8Ee8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4342
Received-SPF: pass client-ip=40.107.0.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_LOW=-0.7,
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

19.06.2021 18:23, Vladimir Sementsov-Ogievskiy wrote:
>>   typedef struct BlockCopyTask {
>>       AioTask task;
>> +    /*
>> +     * IN parameters. Initialized in block_copy_task_create()
>> +     * and never changed.
>> +     */
> 
> That's just not true for method field :(

I think, we just need to document that @method is never accessed concurrently

-- 
Best regards,
Vladimir

