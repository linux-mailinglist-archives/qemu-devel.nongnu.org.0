Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC8940B07A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:21:33 +0200 (CEST)
Received: from localhost ([::1]:37856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9JV-00076w-1e
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ9Hs-0006C6-HU; Tue, 14 Sep 2021 10:19:52 -0400
Received: from mail-eopbgr80121.outbound.protection.outlook.com
 ([40.107.8.121]:33861 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ9Hp-00026F-Bv; Tue, 14 Sep 2021 10:19:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNgcZ/MLa9gb5uVFg5Nzl0bgumwf/rblJpSH4cBxdTwo3fJLoCqyg36Tq4JP56j3R4Nbs4AdJ+nOVtkg5vdnxlx4Nv7/4OYptogVA0HvPiYquDHe+A92YPzcJcdVOEZBwy4MgZt5l4UTAX2DWH6BXYbic4ng7pojao2M3vNRk5tKaX6cpm9DCCsCj3pt6cRGiqdS6Xm+/Iawmfb8e9zTiofbh4tZNsrzBtxMtvpDF8ZsnesYeIhB9Wwddah2GMkK25mgxHpcgyk0DAM2p/PwdRTPXoprfQH12kTKg242LbAT6uXQS9sLpZPnXMNXg8ezSbRx65D7HvjYm/Q9nbMBUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=CNIrQQawHUfnqZXOPihMNHKayJZpQDwH32YYr54xGkc=;
 b=SLWxC2Min3E346gNwaGKAUd4+oRsCkR66nU3Vy4SM+hk+9g7u4LmS8yFmMLs2QU9Yo7GfAymomYFq0lwKFvJ+Z+jOpQikfjWwWNR2uYcSurvdNTTvfXqb5ifi154XHhcb5BNy2gkB21yDL81tbZpVHDakUk3e/61P32uPO7p+x/CYb3JYl6TjwNYCUUh3GHglCDKtns/H2IhxA86YHeyT0P2ByZjjnzcKb+oO9iUdCKCFmk4RrKmjH4xucaTwbLSjUlje1L8KjSffhhva6rFBghd4pAp+73O8fHVAhcC2WM/P2YgCV5CuvmBhk5fvP+oQuBauixCkdZ8dv82F9R6gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNIrQQawHUfnqZXOPihMNHKayJZpQDwH32YYr54xGkc=;
 b=WvShlasP5Z8s/6j7xsqMPBgqK3gIPr59yuAgHPXwMdogtlEBmvIRHpRfYCw2jxUPVURr1DQ0e7g6cXepK7XTFMzdrdGB2gwNoTTNrX7x4qEotYipyXcHL8dXgZxUwaV5YF+ZqvcUWOwPszE8abVdSibexwDR7d8SnNZSihEvRP8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3960.eurprd08.prod.outlook.com (2603:10a6:20b:ad::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Tue, 14 Sep
 2021 14:19:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 14:19:44 +0000
Subject: Re: [PATCH] nbd/server: Allow LIST_META_CONTEXT without
 STRUCTURED_REPLY
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
References: <20210907173505.1499709-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9f559b6c-36ce-5078-4169-c61f2a21124b@virtuozzo.com>
Date: Tue, 14 Sep 2021 17:19:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210907173505.1499709-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0022.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM0PR02CA0022.eurprd02.prod.outlook.com (2603:10a6:208:3e::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 14:19:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75ef978d-3f3c-478c-f075-08d9778ab2c5
X-MS-TrafficTypeDiagnostic: AM6PR08MB3960:
X-Microsoft-Antispam-PRVS: <AM6PR08MB396002E4DAC07347A5A78DB3C1DA9@AM6PR08MB3960.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4j3nKONr5bhKuZv3IGL/JU6EA1gtNDDCFktqNSSnbSjUl2G6RWoyqnvUoZLphQNOw5xB4TgNdG2cxBe9VVDz1ShFnAS/I9AQE+P8XhKNHIpDZ/E4Q2htNGXY4fISkhT4m48m7qdSBhK6SoMLVOny1nzdSaayaF3+x+LqDbmeWCEUT+P+wqd2LYuEbltKofqqsgAPa8yDirIFqkn1UXjOrVo3rq5KSSp1TyIrFc6KFa+l44uuOJpXVeSyO5SiKtoXx5iVzOfwWNci9AEtmL99b6/QB6qNYjYD6sGG4KLQchKIE14Dc1RcjJhGua5nYwl0i7/N0ktxXtIOI/jy/eSi1O1dqzaAUEvXO9VPPk+TFRt6aH7BHb6bzZFqo7It1A5i9mYeyxrKrMJ6pzyNvxRxQo7YqO+z2fY263m/0BGCM2KRU1HQ7P9RcI1zC4aQwtaucuTk1M7ydhQgBf2f+KcO9xKZ013p4w0kKeM7dJWAjw4RQyenIZ+HXpuWKFpli2Js70aNxMeraELTkVermWRCmnuta3rVtlqiy/IFH4RKfSkKQ/4KlXcEVC5LGM8qAbUoYBXBi8AIqZy3BislkmI86QU8ClepHpE8Jvnm1wzS7F3ZyMRwmQGeoPkssu2sNHXaS+wssWnp2bATmUzgrJFjq2uajGWw6TksZHAOH9+DskHc+zZYUoQ+/P5sBg4Zs0SdI52Wwwzk3DoIagI6J+EgRAW0b/MRnvH90cukU86NibEtSrCa2nAJOTSrRg4rAbTFJae5kgduiKvgn8tPpaP8oFlJ2WF0b99L+xZlV70wKNFMk9BmFXspTgbRrBn4oN06pS95qFVlITID8yaIyCFZ7kb5LuK1piMT4FMpuxOOVGQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(956004)(2616005)(31696002)(38100700002)(66946007)(66476007)(66556008)(2906002)(966005)(86362001)(31686004)(36756003)(316002)(16576012)(4326008)(6486002)(5660300002)(186003)(26005)(8936002)(52116002)(8676002)(4744005)(38350700002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnlBcTVyZXowbjJXdDN3Zy9leHlLRTQ5eTdwWFpOU1N3b1V2VFE0SjlrNEpi?=
 =?utf-8?B?Y1lVTnVDZ1BvTDUrT2cxdXZPSGFIREYrWVVQQzAwWDQ2RWJLalM5M1JuKy9B?=
 =?utf-8?B?c25nbG1OdWdZd0ZsMGVRU0NZT1ppdVllb3Y3L0JKbTIvT3lHc0JLa2pDRk9w?=
 =?utf-8?B?MUQvTmVNeUpEdEJDU2g5WUU5TkRhblc3QnZQM1BmbzNvaUFMZnJNKzUrNHRn?=
 =?utf-8?B?ek9TMkJncWtEVjJtNzBwUyt6MUZ1ZUdFUGcyQUIyV0VsRGNoLytVSFdQOFoz?=
 =?utf-8?B?L0dtczJKa3dnNmUzSi84cVgzc085SVJydE95QzY5dDJRTGZnY1VYOGpJelpZ?=
 =?utf-8?B?R0loZjhCZ0xxTmRqS28vZDNCRkEvTXhHUUtob2l4S1BEVjQvTjN5ZUFUWmk3?=
 =?utf-8?B?NFpuRGg0d1cvOE53UTFKSVpuQjFWek5nOGNxSzdGZUlWc2JMRTRQN2JWdTkr?=
 =?utf-8?B?eXZ4YkNqZzZyOEtMdkZSK2Y5M3pSRXozUHBNQW00Ujh2cDU3aXVQMHlSZ01I?=
 =?utf-8?B?WDN4YnRSVWZNeWxJakR0UVRpZ3RFaSt5REUreDRqemFYNFBmeFc1amc4ejNs?=
 =?utf-8?B?ZDVIWERtdStVUzFXdXk4RzBiZExDT2VUWUR0eWNmTVhtNVFHSFhMeWVLOFFW?=
 =?utf-8?B?aWtCYTdCdVpsa3MwemtRdTZySnhoUUVBMlZURm5kelAzZENxMWtqRENaWUth?=
 =?utf-8?B?Q1ZiQ3FaS3JGRWdXZTVqNitNd29ycUJtclRUWmZWUFc4Uk15ajdLSkZIZHBl?=
 =?utf-8?B?WWVLRFBvTGQ4SEJNOGR0QnIvOUVFRTlPZE1CcEdsbDNpY2NUNjhNaWtvbmhk?=
 =?utf-8?B?emtGNmRCOTJMRXBWQzVVZ0tBb3c1RDVzVVIwL0dPTGVIMVR2QkZadEJpSmZh?=
 =?utf-8?B?QmJhWUl0d3orSFowUHIxcVI1emkySFB1amtKVHBwZzhHa1BTTUNXUG83ZlBB?=
 =?utf-8?B?OHA5SkVUMCtLREJnV0ZRRXhSOGozeUZJelBLc3lRTW9MMlFsc2RTUGo4Rm54?=
 =?utf-8?B?MmllMTJLN3hadVJEQU1mU1VxNEdZdGlXd0ZrNStCNEZOZU81ZWhjK0JYS1Ns?=
 =?utf-8?B?ZEJXQzhTZlVwK3NwbDdEWlpHTVllTEFJWk1HQWZsREJtQnkvcDc1WmxmMGNa?=
 =?utf-8?B?SFBYeGFXSjVUUXY3Qnozd0RQa1VVRHNRbGxGdkUwT2lRUHRmSDR3RlZUUEha?=
 =?utf-8?B?Rnp0L0RLaWxzV3VqVElHOEFZc2J2MmIyLzFBZkFFYkt4SlNOT09GYmhPbnkv?=
 =?utf-8?B?VFNhVXBpWTV2MTIzcyt1YXlOZWl0emt0MWVCNUhRbTNMVlVrMWIyR3M3bVR4?=
 =?utf-8?B?WWhBRTEzdnNaOEt2R1hlK2M0b3JRWHF4SC8yeVBQUTIrTERwRDM3WTZpZW82?=
 =?utf-8?B?elBuTUd6SThnYzBBMVpEZ2RBUUY1Q0Z4TTlnbXc2TG5QUFpOZGNEbEMvRXNj?=
 =?utf-8?B?WmllbFpPYzYrL0hyL0RTK21RcDhJWjFIdzFkQlc0TU5SR1FvMUkvLzUxbHds?=
 =?utf-8?B?N3JDT0t3ckttNWFMYnNOM215dWcvRGxJMXlpVnEvZC92ZDk2dFVDRFNUUzJv?=
 =?utf-8?B?SHZaYkg1NE1hMThSampJdm00cGFlSFhhQ3g4T3lPQ0NFLzA3TGFUTldQUmRB?=
 =?utf-8?B?cklIL1V1dG1EMGJoQVNTWDZldTJESm9hMlAvZlBib2NIMHU4Qm84UDl4QzVu?=
 =?utf-8?B?SW1sTEdWaUNOdHhDNVZGM2UvVG4zTWJtL3BETnJWR1E5VU16L0dYbUxhKzZB?=
 =?utf-8?Q?xJNOF1iRISPbN4Qq4HoJRWQ4bmKEOyTdx424B+9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ef978d-3f3c-478c-f075-08d9778ab2c5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 14:19:43.9767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FnSLoDATKSGYGq3qdH4hkDtQWOb0rXT8F+092IdCvwD+eCplqTQVq8wYJZue098eVb9zuz6Bk2UqiUCtP3JxTv4Sc73Asu1hR4ItZ9fbCCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3960
Received-SPF: pass client-ip=40.107.8.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_NONE=-0.0001,
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

07.09.2021 20:35, Eric Blake wrote:
> The NBD protocol just relaxed the requirements on
> NBD_OPT_LIST_META_CONTEXT:
> 
> https://github.com/NetworkBlockDevice/nbd/commit/13a4e33a87
> 
> Since listing is not stateful (unlike SET_META_CONTEXT), we don't care
> if a client asks for meta contexts without first requesting structured
> replies.  Well-behaved clients will still ask for structured reply
> first (if for no other reason than for back-compat to older servers),
> but that's no reason to avoid this change.
> 
> Signed-off-by: Eric Blake<eblake@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

