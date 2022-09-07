Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A3C5B0B7A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 19:29:53 +0200 (CEST)
Received: from localhost ([::1]:38630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVys4-0004s2-5L
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 13:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oVyoO-0008V7-Ua; Wed, 07 Sep 2022 13:26:05 -0400
Received: from mail-vi1eur05on2128.outbound.protection.outlook.com
 ([40.107.21.128]:34752 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oVyoN-0002fc-BR; Wed, 07 Sep 2022 13:26:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8lsPdl+IB/ohjZzSM6zBZ0mKe1v5CHxCoqMUNpWF87cSnzpWNKgiGPrCQl+cDO+6FAGGCCqEGj5c4waQq+odwq40Mi6sg4ls1SYb8PT2AT61eMGO6UYlA7xwz9EoAm2yoCmUkzSss3eIIeZkzfhXrq0xgxTkD7dmH/0fHG467WLfvxrkH6KJj19eSMOSaMnwHuDaoZsNICm/SFTtlpGEQbYL+f3t2NLy+xYcpFJX52t/ZDi9CXbFeaMmNy73VcKJ6PaXKql+qzpVkjwKGSEuG0FrWkh+1ls/Ze2xPc9FQb1U8oGXBYgL6h16qpB16wYRP9Tr+45WTXRu7nfyFfjRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjX3F8pLm7AsQqIHXhBvl+3oNTmXDNDwNZSiJUg5KUI=;
 b=kiGCPbDXlYLDHDA5vgCEzPQtNxuhCjA9gn1LawIZyxQXSDTdxXpw58A2BtSfTo+BNowAvs4MYMJSklQU8sIhxfN2igqQLZ6KvRsJw+9IuDPADJrSzQ+yGT7tqjYX3lKsdBLHKniHPQTVOi0zRxwrOm0z59uRUBe/zRsGk+uzycAhhfrpfB6IOsdzBm+qk0qR1n8N9M7MbFUdLKBM5Cjw5WoSV7WYl0JNKlSnEjTdwM2NlH0v9sLHw3XvEbC4PBjOvAgQoc6FaOILVMFrH8hJbrjFEcSxT6QhqsHUJPBYsHDiq9VdC8qKmb+Dp39EqXUucvvUE30O85Jt6J7F+c5WSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjX3F8pLm7AsQqIHXhBvl+3oNTmXDNDwNZSiJUg5KUI=;
 b=T7gJqLF0POceSlrIya8DnJkqJqF8saNQlb6aJUB6A3AxjN0lIwWXQj9Byh3dPHrB9z6BQyC8CHHuKXI4F6oB9s+X8uPXMsrNJO+I+j4ij/xihD5fzF+Aw7IB1pHh9TAHj6Z+W8eFvNQnBVuBTtM7xiSFVp3+gV1EqyZDMSdH5w82AS2xE7my83piDufWLvjNVBqJglY/CW1AVs194zIdAw1XdFQVw+qev/KCS827cc4mZ5WVaYFq5qlR3iwSsWVckbjsgm/wVrnrFOtbiGlBySZdmdL1AdvlGh4nNhIMpYkq2EBC7pYczKhvja91OIpXHq9Ipa95kDcJFXK1yLuaEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DB4PR08MB9335.eurprd08.prod.outlook.com (2603:10a6:10:3f4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 17:25:59 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6%4]) with mapi id 15.20.5588.016; Wed, 7 Sep 2022
 17:25:59 +0000
Message-ID: <3812f98f-9afc-9e0f-9839-916b083cfc77@virtuozzo.com>
Date: Wed, 7 Sep 2022 19:25:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 0/2] block: add missed block_acct_setup with new block
 device init procedure
Content-Language: en-US
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Peter Krempa <pkrempa@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
References: <20220824095044.166009-1-den@openvz.org>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220824095044.166009-1-den@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0024.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::37) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 801f589a-14f1-4b9a-f27f-08da90f60792
X-MS-TrafficTypeDiagnostic: DB4PR08MB9335:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SQz6TOzAscpxYGNExNXJYjFR6KC/24D8KKHfJJZk1pjfjFdoV0xCeBi2NFywY4X5kmn3xxXfsWp4WmXDe8KjhZcaktSI5YiU6yxdUjRPLtuwxZN8XbGG0pldrzxpDUoUQPBfW9C6xzH19f8j857KKEQk4nZejOtH+SWg3TRr3H1PDuwL9qucIHwyGCa+IXRY6lf1Oe77TYlX6lwfaKJgATo7IyCsgETn1wi370Qfp6BYx+wISCqliQN99KNyaxKorsLGc6aPTbtlrZv4iNluSf8qfUYDZzsHtuzd0jbvRX5DwZXOpLEBTODXUBLhvi2EAaw28kPQpk0zEuwfkTF24+civIOAm8YXDDr2X81U3bdG1eaWUmIlX0scXEDNd94HJwMAtjrIXOiUqNJ5epPg6Semvcy7xqlRmQQ3S8R54RCtQOPbVcYzsooDpQVcgB26GIA4OEvgxstP2qxxyxB+3qO1yMEOf7vJWvI2c5dvzFdShiBOCS005aNW4YJTyG/V8DM01kF+Keid9WEfEvK3ioikr+3xFVyzr/ld6tGJaq6aXw3GK4lZ6fj0+IB71ESyCTo/xqUzAKPz4seQRnWNBKCNbuZlGOkid9ikALISIRvzg2mdCmfZ033EZBbsNLOp5Q8D+8sLjmpL11EAw5YhVma9TIhM7QvmJ2bKAOPmPgvbEeVn+PLL7c1kxBd9XdkZF/+Hw5KVqftiIS66XzVWT8OMgWaPsXP+fX4YUmOfpCy6XVfS1dcGI5XqhdbSXr/k6Vq7E4JQHyAli6TRSkmaoJfyv7GF8eNmf0mZmh/BLc6azAifNxAwdDafhSPI4IOaQ47OmrBQ3m7h8ak+fvskbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(136003)(39850400004)(346002)(376002)(6512007)(31696002)(66946007)(8936002)(26005)(5660300002)(41300700001)(38100700002)(2906002)(52116002)(53546011)(6506007)(86362001)(38350700002)(186003)(2616005)(4326008)(83380400001)(478600001)(54906003)(6486002)(66476007)(66556008)(8676002)(36756003)(31686004)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXBWUklBdUNJbjlNZU56TWR6TFF4R3YrWkdid0pENzFIckZOeURrRE0wZkdL?=
 =?utf-8?B?cWhDdmdJUyswTDZmNHBtSzdRVFp3cDlWdWdDQ2tnRGRNdVpsL01LN3VaTTZJ?=
 =?utf-8?B?ZlNmWmJPRFV6ZG4rYzRuNmxycGJIeW1NR0dhSldpQkdURk1yd2xybk9xcFg1?=
 =?utf-8?B?MG8yeEdhMmgrTndJTVBhS0djV1A3bzlHQldWRGo1ZWR4V2hWTUMwRWZpaW9u?=
 =?utf-8?B?MTRxTmVFOWxabGp1YUpCamZQVXNSNUZiRTNrcm9hRUhpMTl5d05OQm1uZ09S?=
 =?utf-8?B?UG00UWpXSjd0dUFjL0F6cVVxSzR3OEtNOWwvY0M4OTNXbVl0S1VOQmtpRDZz?=
 =?utf-8?B?V0ZvMmI1ODBZNWxEbURBcFFTL2wyZVhqSzJmV3B5UFk4VDRjc1orNWJ4SzBt?=
 =?utf-8?B?aGJZM3gySlZENWpWL0dtUlk1MG5mQXhHRDFmUkxlSHB1ektIOThpWnJwVXYy?=
 =?utf-8?B?R0N6RC91M3ZSQ1d2ZmpTQ3ZSK0EzUlpic3ZQZ0F6cGZoenNFUXpzNU5BY3hz?=
 =?utf-8?B?aCtOeXlseFJVeHFhVlhlVmNRa2FlNDE4WWVrbGZxNnNmanBMSm1QVTV2WUFY?=
 =?utf-8?B?UmFGemEzTC9wcVBlUysxcnlBNy9XR3kzWFoyZERRbjZUZDF2WHFHU3NwdkY2?=
 =?utf-8?B?dFNMa1Y3R3VyRmlwM1ZOOVZ2NFF4NkN3eTNEMm5xWUFKWklHK1A3c1JvV2VY?=
 =?utf-8?B?OUdYanA0ajlnTGFXZU0wLzViclRkdFhmazFMK2hxT0JqaWtTTDl1TUQwZ0xy?=
 =?utf-8?B?TXg4NE5OMHBtazBTVE9pb3VrdGoxWURvK3ZhMnZ3VFNwbFFFUnBLa0NOajF0?=
 =?utf-8?B?R2pLcHI1bkhGOWxKb3BwMC8zSEtibEJzZkZ5OUg1c3NRaXhUS1pPek1MNlFP?=
 =?utf-8?B?bUxTYldjRThVUzgxUVBzZGsya0hIbHVLby9mcmg0UDc5MjFrYUxFK1VCMzkv?=
 =?utf-8?B?MjY4ZGYwUmpTRWZ5dlcwZlc3RUMrd2F1eThFSjhjcmNMSDNnWkFGYVNKSGJt?=
 =?utf-8?B?cVRJb1hCZGpQbFBQbU9RaTZyMmk5V2VWcG5RelV0aWJUS3RCUTF4YnhXOHMr?=
 =?utf-8?B?YlVBeXJpMWlDTXpQcEVJMW5FTjZLV0daaGlodmVPZzZCTEJTYTg1MnROUzB2?=
 =?utf-8?B?Tk5nYUJ1NEV5RzF3c1FrWWNaM2ZDM1BSdWE5VE1pQ2QxVjg4TVNsNGt4dUlP?=
 =?utf-8?B?VG1EakVVUXBRdVhscWNaK0RtRzgvbFp2UVBqOXlVbDMwdlJDQ3Y4V1Z6Y0Ex?=
 =?utf-8?B?UHl5SG9BcHlLSVZVWmp6YjNWY2EvTlhVZjF2bk5FdVJIWURUSXMvazFZVUs4?=
 =?utf-8?B?aTI3WVliR2pmSXFaNVRwbzNqdUlwcU1Pazc0NEw1OUI5eVhEazNSMTJQcGQv?=
 =?utf-8?B?MUNpdzQwekNpOHpuVEl6WG1JUFJKNzh0REViSjJnWG0wanhicWNWUjJqUjUw?=
 =?utf-8?B?R2hERDNtVzc5a21jVU9QVytsSktvTmR5MmM3ZmlSaEdzVEFDUXlzYkhnTUVM?=
 =?utf-8?B?eFl4VlMwMUFEUS9KZGZ1UXpaZCt5cFFKZ2dMZGlyMVFmUE8xczVIMWpOdjVK?=
 =?utf-8?B?ZlpZSUlqWm9NRW15TUJFVFFOYkw1N2h0UUdBQXdDNFNjbE4xbXhMNFBFT2tJ?=
 =?utf-8?B?d1QrempxUlA1Nmk2aTdCYUd2ZFdLVC9zTGN2T0JEWWpxZ2NVNGR5UVM3aTJK?=
 =?utf-8?B?NFQ3SVpxaUpyYnp5bWd4eTJVSnRINjFsSmdERWdpM2RhU0N6NnR4L1hiTU95?=
 =?utf-8?B?Skt0VWdHcFFraFFzcU91TFBoZXNrSTNYNS9LRTBGUmxpem1FK0xwcEdGcHZz?=
 =?utf-8?B?MkNYQW9TcWRud1BCRm44L2xwM1lDdWtMc01nLzlkSEpCWnFFZnVUcmU5bDFC?=
 =?utf-8?B?LzQzT3BnbHVwU2c2OTVlaENYNzhTempXMExKMmhrcXg4L09UUHE5YVB3U0hx?=
 =?utf-8?B?dFNWRWpoQWxIVHFrc0FYUXA5aFNJQUxtZFJsa1cvVXhFU2xVWC9kUjBuZXg0?=
 =?utf-8?B?NC9rclNjeVZKQ0hsVnAwS2pKT1VhUnlTajQyQW5SanVBVmd2SHBEZjYxck5G?=
 =?utf-8?B?TDAyVjRpTXZFejVTeGlhMU03eWpEVXdKNEYwRVFwS2JQTE9DSEZUaHpMdjNr?=
 =?utf-8?Q?Nc6c91UhO2LY1gFUlUAhY4s5Q?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 801f589a-14f1-4b9a-f27f-08da90f60792
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 17:25:59.1021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RABGD1thnGkUSYFP+ayn51nrhIiRZ4CYKW4bmBGX30PExsLcxgmCgw7pTatkSh1a+SOW5/7BpvV7DLdd7H8nqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9335
Received-SPF: pass client-ip=40.107.21.128; envelope-from=den@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 8/24/22 11:50, Denis V. Lunev wrote:
> Commit 5f76a7aac156ca75680dad5df4a385fd0b58f6b1 is looking harmless from
> the first glance, but it has changed things a lot. 'libvirt' uses it to
> detect that it should follow new initialization way and this changes
> things considerably. With this procedure followed, blockdev_init() is
> not called anymore and thus block_acct_setup() helper is not called.
>
> This means in particular that defaults for block accounting statistics
> are changed and account_invalid/account_failed are actually initialized
> as false instead of true originally.
>
> This commit changes things to match original world. There are the following
> constraints:
> * new default value in block_acct_init() is set to true
> * block_acct_setup() inside blockdev_init() is called before
>    blkconf_apply_backend_options()
> * thus newly created option in block device properties has precedence if
>    specified
>
> Changes from v4:
> * removed hunk to QAPI which was used to test old initialization path
> * added R-b: Vladimir
>
> Changes from v3:
> * fixed accidentally wrong submission. Contains changes which should be
>    sent as v3
>
> Changes from v2:
> * called bool_from_onoffauto(account_..., true) in the first patch to
>    preserve original semantics before patch 2
>
> Changes from v1:
> * set account_invalid/account_failed to true by default
> * pass OnOffAuto to block_acct_init() to handle double initialization (patch 1)
> * changed properties on BLK device to OnOffAuto
>
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: Peter Krempa <pkrempa@redhat.com>
> CC: Markus Armbruster <armbru@redhat.com>
> CC: John Snow <jsnow@redhat.com>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>
>
ping

