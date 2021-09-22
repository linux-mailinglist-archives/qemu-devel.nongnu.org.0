Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6664142ED
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 09:53:58 +0200 (CEST)
Received: from localhost ([::1]:34778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSx4n-0006eM-AP
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 03:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSx0c-0003u7-U5; Wed, 22 Sep 2021 03:49:40 -0400
Received: from mail-eopbgr60094.outbound.protection.outlook.com
 ([40.107.6.94]:47446 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSx0Z-0006Ea-HD; Wed, 22 Sep 2021 03:49:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cq/hK+kXbEkL69mZm4SCtzWz2q9IS1XXTqLfPdgWXiTGw41sskSwfvEudQR4Wmewzm4eLy6AtWG2WRUjgIxGKq7fNqxO1yjuvYAupdu+T3zGCn0wsJ/Aa0SpswCQcUrPH/M1N3FaKUsQTRa+69nPIO2MGDPwOZEPmBUdTFgy6n44wP2R3faKsL9cZo8sJlCqh1EcylQp+ACdhdkwpnkU33fYzlu5mjdx0xDn/eIb6dJ37ypz45uU5sxqm3PQDvIoI/AAQBDZNU9SBaxTXicGA8521tbrl7XfAmeMLLs2MlaXPelp4ba/y+g7tKG0m96bQwPOlSVZFFcQ2Zw9M4/kcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Hx4qXiEGHtMZgEbdwhQ5LGySD6T417oEDRddrGvuNq0=;
 b=U9u+IHpMTxGrUToAIlsd2+trLlyUj1o2dh9KeOA27NKkKJTQwxAEIAxWPrpCv3ZBIm3/K64P5Ps1+xFjr+YM0WJ+flm57c++0O1YmL2vNmZt/OijjJ/V4GqN8Xxw4F8XDlSHn1n2DfNHEJuYbSWrvQDxM9HtGwA+WIoUd8K85Ld1tgof+AnQ53HhZlKsgDhsgtHDJOSMFz7ddrXchkd84ZNbrWqFWNwWot//TBXD7bRx9tUWHDLmZL44SGksx5fQSeHr+dOYnwQ5GqYBhF4a/Ebn+W5sYs3kDnDXRznGi9boRLuG4VgqEsdrpBN3BUmnMBfPvQZOsndaAcRUBnTk1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hx4qXiEGHtMZgEbdwhQ5LGySD6T417oEDRddrGvuNq0=;
 b=ixx7+4+s1Q2dBfw9Hio79GIb6WLgKbpmOLrE43WSuODxoAkiDE2L069HBcwlFU3Ry8H+StFd7nxFV8KbJ+XFr8R6dMesHSkap/6GBUGGMazB5aNmX/gD0J6xBFIxlbWgtl10JYxBSjpupx+jnY2HbjroU1fm54YIaM2U3lt/koc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4166.eurprd08.prod.outlook.com (2603:10a6:20b:a6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 07:49:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 07:49:32 +0000
Subject: Re: [PATCH v2] block: drop BLK_PERM_GRAPH_MOD
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com, eblake@redhat.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com
References: <20210902093754.2352-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <74a856ff-961e-fb05-7ebe-e681b0d06a87@virtuozzo.com>
Date: Wed, 22 Sep 2021 10:49:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210902093754.2352-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0002.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::14)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 PR2P264CA0002.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 07:49:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0eada45-6ef3-4f44-698a-08d97d9d83a3
X-MS-TrafficTypeDiagnostic: AM6PR08MB4166:
X-Microsoft-Antispam-PRVS: <AM6PR08MB41668D2E9BEC4A44ED45E743C1A29@AM6PR08MB4166.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 86mlUQlo/vQtb0whlr7/+B7nGzHX4RmuntqlrutG9wSJc+e5pTgLiDtfx7PyTXIuPkaw5nYyA0m3mvEJgsmE4+13N167u58V4aAJ9k4qLWgS/+wx9wRWP2/RUknGlAR0PrHB+x/7nHJeXCPrV3hyyAju5kbJFiZX3Gf65g0DcSjsqZ6sxmUhwfcBxRiGBw52xMBAmcAVQeJnPaRp5FLk+7GYAmDkSEOmommzgkzYs6A4I/LFXNIGQu5RFf5PFmCwyt+NTCoiXav8NZlQzdtPRvAH0jOMvfCZyWTEA7WBJ9dz0ZVSxuB2Qd3If7STVDMJc1/O4ZnicZLlxBtXxnTaZJGljc+RPBn8IAfxzRXayy1AiyQt5Ox3J/Z3dxVSTrqaV4BVgp7/X1GX5LrOmPxQyR3h11Srb9QjKd0uqApLaW4cjRGvEyLQulioxuEA8Yiy6S+smv+Yd3YFfcfrHL5ccF2H+IkO9xyl/JUkQpmkVjw4RcunYTpg3eAAJjQ+LGgst9oy2YCv5Tn3L/t2VYU8I3ZllxezdiXBOQNxD3JdlZg9hyvDqo2zq00XB8GEaZ28B5PqgWwFcYqMCqsRpNB3BExgU/hqKTPAi0EPuZ+T8M/0Lg4Iyma8lXl+xMeF6is3+j7vKglvPIeCjLP27u5TpGr/Xw9MBIa7RBFVNFz32vc8fGp4mv9XLlYM2quzbitMtfsF8ld1PWxFRN0PUS6SRfUdbvmFPvd1SffnIHVieBx4JN7OPRnQGvUuGm8hX5LB2qUQNW6j38r4VVwARxxoag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(38100700002)(6916009)(86362001)(38350700002)(16576012)(52116002)(66946007)(2906002)(31696002)(26005)(6486002)(508600001)(83380400001)(66556008)(316002)(2616005)(5660300002)(31686004)(8676002)(186003)(36756003)(66476007)(4326008)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkdPN3lCNDYyRUtQRW12a2htay9ockNQV1BISW9obmwwR3R1TmlYR1hSRFpI?=
 =?utf-8?B?ZitMR1RtYXY3MEhYZ0E2dGVMM2wrNWRuSENkUGNMZnhPRWpOZTMyZk1QRnFE?=
 =?utf-8?B?M1ZncUNOTm5wZ3NNMEFWc3lUcDlBQUhVVE9aTlVGVUFzZ1FzTnZHWitFVHJu?=
 =?utf-8?B?d3lwT1BqRUlQNUExYUQrUjIxMDFaNTNZaXZvSGVqWHliR1VMbjhOT2lGdVE0?=
 =?utf-8?B?bjBWMVRTdDBBY1V1SnFXK04rbDVSVU5iVFkyNUVCbVlvRFRCNkRWVGIza3RQ?=
 =?utf-8?B?cWVtMzRCbVZDTTIyanRnMVZDQzZrTU9tMjFPc1BYMmJQUkpjZ24vbXBaYWNt?=
 =?utf-8?B?M3JPSnBRSE5XMDFOMjNCUklYekt1Yk5KeVhlbVUvZW1kLzN3VUx1bEM1S0U2?=
 =?utf-8?B?ZlhDS2R2L00zd2pxRk44MXJMZVBpWTBBNzdaV3dzenllUVp0eG0xcldKbUU3?=
 =?utf-8?B?cktNcUUvYi94TUZNTGpkcCtuQVZLcHVhM3RRUWRMcFpEU3hRZm1jRU1yOU81?=
 =?utf-8?B?d1F2NmlCc0xuT0NpWFIrZTFYVGZYSzBmVUdlLzhDcjFqWHZQWlFNQUt5WEs0?=
 =?utf-8?B?a0xhU3NDYmtYTXZDZXNDMWxTck5CMEhHQTBmRTZ3TEFpbnRvN0N2aVZ4ZEhn?=
 =?utf-8?B?Wlh5NWpvNU5td2hNdG5KR1ZVRm5vZjhEZmpXako5ZGFPMDM3YXFWUXFZV1Zi?=
 =?utf-8?B?bnJuSlJmbnBIYjFka0dyb2xHeWhpUDdWWjFtV05wa2tqMzBrYU03T2pUbkFV?=
 =?utf-8?B?WDNGYVMxdDdWWE5HdHRLUW80MC9XREVNNTNaZk5CM2ozMkcyQmZBWVlVc09U?=
 =?utf-8?B?bkJHVm8xRVVqUmdBQ0xwcUJud1NxMWRrRjdEMWtYUWhGYnZTWStOdTRTbE9X?=
 =?utf-8?B?czRWanhJdGplWGJzVXBnUkZyUUN0MkdWRkFUSWhpa01UR3gzSzN3cFVrditX?=
 =?utf-8?B?b3RHL1RLL1NPV3FWdVhXYVphZk11WDI3T05kNk8yTDB5dFc0Q09jK2hEcWp5?=
 =?utf-8?B?dmhiMEIwdjdONWMwa2FRejg3TDhhMG01Tkh4WHFCS3Q5WFV3ajlDV0pxZng3?=
 =?utf-8?B?dmt5Nm92UnJWRVlWQWl0WWdOZlRZTGZoNDJNUXovN3ozdWdJblB1Um5mMGEw?=
 =?utf-8?B?eUVId1pQZnFxTy9JYlRZeFVqQjRUMzM3UWo1alZ4Qm5maUUrQWNFcnQ1MzVl?=
 =?utf-8?B?ZlllZ2g4dHRTMnJPUXpJeTd6UnpJeFppc2dOUzAvVHFSeUt3cEhNVUJrUVdF?=
 =?utf-8?B?STgwUERKelZ6VzVlNG9kY3NlMTdzT2FkamZiRHhHYTREeHNsMHA0aExHNzlL?=
 =?utf-8?B?Z2FSd25qV2NyT0E4UTV6ZHRkRWJNZE9heTRac0NiT0pabXBNRnBQc01oYktt?=
 =?utf-8?B?Qis2UGlHQ3JJOXVlOExCT01LTVZ5djVpYVloR0dORktkM2Y5SGs1SVR5djJw?=
 =?utf-8?B?bG9IcEpnZVM5OFVsejVpZEpsZDRzVVdyQ2Z4Yk96dWQ0dEhrcFNtRVFvNXRJ?=
 =?utf-8?B?WTdTcG0vaFA1VStYbjc1N2g4YmZLV2R1ZEN0eXVYbHZhRzdUSGUxOGdobXZE?=
 =?utf-8?B?T3hNQno4TkFsY1FTUFZlV2dHRm5oZ2dXYktWZWxGT2lnckc1N3gxOUlvNTlS?=
 =?utf-8?B?THI5WVFibkRMM2VDWTRpWm44MkpJekJtbytNRGcrYTllRkxGNmJNQ2V4WEpH?=
 =?utf-8?B?TWxXOVZQSWtzdzFhWWhHdzBoSEN0czJKRXd2NzJWMFFrdXJyWmpWUTluakMr?=
 =?utf-8?Q?TZZ0BUmQy1CrMnPpiRa+1/8JAKBgrrLtOpeMT61?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0eada45-6ef3-4f44-698a-08d97d9d83a3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 07:49:32.3389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGId0VvnS72LYkDsXx/UROlcBA1ycrt7OZeIlHif7pj3nTYVS69l5rrkR447Tkvif2DHA5x5VDDAHQzhY35enZrdeUHIYtPniMEclAc97/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4166
Received-SPF: pass client-ip=40.107.6.94;
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

Ping)

Patch is reviewed.

02.09.2021 12:37, Vladimir Sementsov-Ogievskiy wrote:
> First, this permission never protected a node from being changed, as
> generic child-replacing functions don't check it.
> 
> Second, it's a strange thing: it presents a permission of parent node
> to change its child. But generally, children are replaced by different
> mechanisms, like jobs or qmp commands, not by nodes.
> 
> Graph-mod permission is hard to understand. All other permissions
> describe operations which done by parent node on its child: read,
> write, resize. Graph modification operations are something completely
> different.
> 
> The only place where BLK_PERM_GRAPH_MOD is used as "perm" (not shared
> perm) is mirror_start_job, for s->target. Still modern code should use
> bdrv_freeze_backing_chain() to protect from graph modification, if we
> don't do it somewhere it may be considered as a bug. So, it's a bit
> risky to drop GRAPH_MOD, and analyzing of possible loss of protection
> is hard. But one day we should do it, let's do it now.
> 
> One more bit of information is that locking the corresponding byte in
> file-posix doesn't make sense at all.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

