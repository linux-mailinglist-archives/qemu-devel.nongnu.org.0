Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6923A2E80
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:45:01 +0200 (CEST)
Received: from localhost ([::1]:56838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLvY-0003ub-T0
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrLtr-0001f5-M5; Thu, 10 Jun 2021 10:43:17 -0400
Received: from mail-he1eur04on0715.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::715]:29984
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrLtm-0007cY-Nt; Thu, 10 Jun 2021 10:43:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNpY4AqexlDwGQRCD9y84/A+aypsiCR85fJSO5SDBPPR4zKUQrWoJwe6Nc89NvN7BZB7l/3BYuoz5JTguS0UYRyzT4wYqaSHn9Oy+KxTShe6D/w4giNeA65vGqw0F3aQi2GX6ObsxhFq/RETDgxqvnkmQHcJhfqJN92fKqYB518mnIa6NlEMg2tC27P+VN/skW/iwGv12UjEPjU3wLEk0I29Z0Uv3nWbEdcJ2K8bX5b43w6GdaWKFyQzcB32xNB62UzfUcpyosOrx7QHCoUugWZTj2XM4UthpNOhOMj7G5MyJp7Amq+JUlfcpYFqoek9sSCkwvgAQq200Qplh1rR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDVdw8xDmqWBj7VcPKjFx9LB6DbWuyG9HmcM9m+2LXk=;
 b=bhIlzKpS+jrmbu6AXHrAcn51hZ+uoL1PekNrjlVR2WHA4EaVxeOnQO3E01xKHg93T9o/cOBHJx3gZGAlUBAFj6I0AVZ0WoJVlihadCvqipOQeaQiIsAHMmjc7zXmjbQfWcbgAlNV5/FsRdYKUn4C1+AX3u42v3bbj7mDq4q6smRLlTMuxV07OyilYcN1bs9Xv+JaMw8e61A5CjMB078h9XRj0txuAZ7z2q688XqwCyvu3+ghLAJbAvqJ7X2LAvWboBoKWzGPh6yTg/V2m6VFFHCq6EQykgEv7Ug8WtMN8H32c/9899H7OiWnBZht/TbD7EU8WklaLP6oQ/iup00FfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDVdw8xDmqWBj7VcPKjFx9LB6DbWuyG9HmcM9m+2LXk=;
 b=uf2mVx5OfnVa7YzUZ+DjzHOdgt4Ti02fARFpUh05YCY3n8Lwh5dKsqBsBkPVJKn0A6kNrcWpqnwCEFyxbqw0eN8roDvsyU5NjFg6QTJFsqixYKIALB2jQbOQwqbH7g37o7pUEVKoYx7RyjSM/7QSKh35W1Pa/CetmXqR7iQAbGU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Thu, 10 Jun
 2021 14:43:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 14:43:07 +0000
Subject: Re: [PATCH 2/2] nbd: Add new qemu:joint-allocation metadata context
To: Eric Blake <eblake@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 libguestfs@redhat.com
References: <20210609180118.1003774-1-eblake@redhat.com>
 <20210609180118.1003774-3-eblake@redhat.com>
 <CAMRbyyuyK5r11bxDD4Gyy8ru-RBPB_WufmSFktnXQ+G-Hxg3nw@mail.gmail.com>
 <CAMRbyys9kwJyg3AiowZwFg8uK1pHVPcKOJNckX0h0KUmNQZaMg@mail.gmail.com>
 <20210610140400.s5bprikdunfkc5uh@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c43863ed-9638-53f6-10d0-e3754f803a8e@virtuozzo.com>
Date: Thu, 10 Jun 2021 17:43:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210610140400.s5bprikdunfkc5uh@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM0PR04CA0106.eurprd04.prod.outlook.com
 (2603:10a6:208:be::47) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0PR04CA0106.eurprd04.prod.outlook.com (2603:10a6:208:be::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 14:43:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b68ac41-e192-496d-b830-08d92c1e0f61
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652DB069CCBC6A51C1D1D3AC1359@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7DK6cfPoBDlEDd/9Yx5iJrYd8fFYA/+wc27UGyLzYkoOJCbe47AEfoZIGX67BP6fw6ll3Pt6hB1XQlX2hFKd2w251E3IxAcm1LJwSRZNXFLFxqzBQor0VFaeEkMytNs35S08iyZsAm7e3K5bSLNEV/P+bHUEDg969IAVB4c4pNvJnIffkx+TEGvBpc/n9saihBlTzVW3usSU9gzhCb0bzhUuGOssEUV/hwIS0MQvaHsr3J1GRQGNlvwq5rVPf/qnKbFNTDS0JYVyoNyBhvUlxH6Le2z8ANm3GPM4Stk1rtE8Khu7Ijn9yPPpTAOjqXIJw0lKy/WqU09gXx+E0rQd9OdLdI+R2wYvUflIKYapCW/5aie5KGEdR/i2zfxRFWI3JWKpCnSSKpTYKKlHcqoIsMI4Nhduu9vQZq9ElerhNW3ln3C2bMsdpQl0EfrvjOI4Q5ToVhAYPjFfrZC6BHrRIJIKEmxmeO43YFZUPIm9LEX85/842Njp/A0VdKAU+dZu/RYym7xMbkJ7C46gbZAGEnd2HavX4AxQKxVDJwy6wGrBfJHjbwWITatAKFRRAbO1eaextAdZZNT1tSpBgZI2A9cjwHryxOLN5+ATbS653hU2u8mGjJmq8jCYwGN2zEn7pFZHGOR7bWKNpzJd4/06+0KWHIKPCYPzNDxZeaQ8qF9uyYLZxPS6vc5HjGXfOWBPdVInB3usB5ONevtPM/kvyyOscvbR+0BTdcfR56OUFCI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(376002)(366004)(136003)(346002)(54906003)(316002)(8676002)(83380400001)(110136005)(2906002)(4326008)(16576012)(36756003)(8936002)(38100700002)(38350700002)(26005)(2616005)(956004)(66946007)(5660300002)(6486002)(31696002)(16526019)(52116002)(66556008)(66476007)(86362001)(31686004)(478600001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OW55aGwwZnFZcGQ1TnhOaXFPeVRocTJNQzE2RUg3TnU0RkFtQ1hNanREZXN0?=
 =?utf-8?B?bjU0dEZSelhENnpCV2xEMGQ3MTAxcnZSQkxjK0FOdUhxY2R3eXRtK3FZNTU4?=
 =?utf-8?B?QkZIYmMyWU90YWIxdGdmVnpiUExaN1pkS2J5bk8xekdSc0plSjc2dm5YalFr?=
 =?utf-8?B?K0R0c1hvUzNGWldWNUNRa1lzQ3VBTlhWWVRuOXZBdmE5SHhZS1plNXJlSE1U?=
 =?utf-8?B?OHpQTkFXbndndW1ZRTJHWEl6TnlleHZCSXcrVkpFNE5aVTFiaS84Vy9peTA4?=
 =?utf-8?B?TWlwSnhWVmlKdGVydTRoVkFuVGhnNGlqckhZMTBPOUpjblpsTTFuQnM5TytG?=
 =?utf-8?B?MkpXSENwdHpQS0xOWjNIR2xobkxCQi9RZy9CVlVpMjcxV2ZEdDRuS2t2SW95?=
 =?utf-8?B?V2E5bExNeDR4OVdCREtIL2h6T1pEZ1doODVkTlRHVUZDU1kwZXFOQzdvMTdu?=
 =?utf-8?B?SHQzcktjeGdhcVB5N20wbXNVYlZDVXFOTDdtTm9vUmV1QmIzMGt2Uy9DWll3?=
 =?utf-8?B?andHbW1kNVhuL09ZOVV2NHl2Nmp4VllmazJjSmlsSXhxUkRrVFVyQThzTk9y?=
 =?utf-8?B?T2lZN1VlQjUydUR2NGQ1Y0QvTjJhMEU1aGFMK2ErWFNEOUFLblNCVjBQSXpH?=
 =?utf-8?B?TEVvU0ZGZDYyWDI2MnI0SDJ1NmF2M3NJYm1mSUpFaThGeUxXbkFjWDZXLzFT?=
 =?utf-8?B?Y2pESnR1ZDBiKzUzcjdjd0k4WWI4dVZOU05OQ0R1aXZzU0pLZnh4NStPSlJo?=
 =?utf-8?B?SVZIMDVUV2k1eFdvYUVqc3E4emE2VEtJNlJWdEVlR0NEc1M4MTJSTGphaC8w?=
 =?utf-8?B?aGNzd3lUUjRQMkNMeHBPTldsZTc4cDdWVXltdUNkeWZLWjRaRFUrcWxITDF5?=
 =?utf-8?B?K0x5QmIweWprSkNQY2JmcDIxWG5sRXJDRU5QMSt0TW1kR1cvazdoVS9vNWNV?=
 =?utf-8?B?eFpNWXV1b29wbFliWjk2UENGdS9xbmw2Z25HdjU5bE9RNUpOVVVhejZYQXVW?=
 =?utf-8?B?cS85RWE1eXd1dHlqay9Nc00rTFdhY1V0S2dFT24wZmdwc0dFc0hwU3hheVh3?=
 =?utf-8?B?UEFsNElMUFo2WVEyRFB2T3luSFR6azVtQVVNb0J1Tm1WYkpUQ0VPYlpOc1Bo?=
 =?utf-8?B?RGdVZTN5Rjc1c0NOcTJmYUNyKzBYbU9rNDh0OWhkWE5YZjZhOUd3K0Z4alZw?=
 =?utf-8?B?ZkNXdkdXcGczdFFlZE8ycUx6cGJyNnlrVWhTYlEvTFpzTVJsSzlmeFVtZU01?=
 =?utf-8?B?TFoydjh0bnBKVGtCUHhJcE81MEFLZ1lCSmFUTWY3NUtoemhHUFdRM01DQ0ow?=
 =?utf-8?B?UDRpeW1XeFA0YkFvZGNzdkJMZVFNRG50SFpISS84cjRGeC9RcHBjeEtBWEpq?=
 =?utf-8?B?aFRib0NJSCt6TG5vNHJwL2lXRDhialEra0FwUkxUSzJxelhSbzA3Tnh5QVV5?=
 =?utf-8?B?SjVsMTdWeEhTMVZQQmJrVXpIdjBFY3kzUVNrR2lrd24wUy9zVklXQmJQTGhR?=
 =?utf-8?B?MzhzTWswbkV5VkZ6VDRrUUp6em85dkpUQUFXUGJtem03Sm10dnZmdUkxQTQ2?=
 =?utf-8?B?SG41d3AveksrRnVqcWZMNWhkK0FNUUt6bzNGT3psdmE1blVtWlcxZVJFSm9L?=
 =?utf-8?B?Z0RKZ0NFRndMSmRDVjR6ajd0dWEzUkNCOVJGOXRZTll3N3U0TXJhdmxSQ3VF?=
 =?utf-8?B?Mk9paUZKL3NueXYyL1o5d2pJN2VQeS9HcUFnaHJzbERITUFUdVJETTNKMDJi?=
 =?utf-8?Q?VS2vfHDIu9//OA1XtZ7t7qGklQNClulCpvAyTpl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b68ac41-e192-496d-b830-08d92c1e0f61
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 14:43:06.9464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/d9IUcj/gtr2OlvEvd23YFjyDNpBxN52LQpa+QTyu239TnZw1GmzPr9AwWg3GV+qgGqUWxguP0fH8pqjHJzeXVkS7FdVgxhD5K1DYwwqFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=2a01:111:f400:fe0d::715;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

10.06.2021 17:04, Eric Blake wrote:
> Maybe the thing to do is improve the documentation and try to avoid
> ambiguous terminalogy; in qemu:allocation-depth, a return of depth 0
> should be called "absent", not "unallocated".  And in libnbd, a
> base:allocation of 0 should be "data" or "normal", not "allocated".

Interesting, how many problems, misunderstanding and confusion we have for years because of that terminology :)

Funny, that we try to imagine how to call these thing in general, but actually in 99.99% cases we are saying about only 5 simple things:

file-posix data
file-posix hole
qcow2 DATA
qcow2 ZERO
qcow2 UNALLOCATED

And all our problems comes from our trying to divide these thing into two categories: allocated/unallocated. But it never worked.

I'd divide like this:

DATA
   examples:
   - data cluster in qcow2
   - data region in file-posix
   properties:
   - data actually occupies space on disk
   - io operations are handled by this layer, backing is shadowed
   - write should not increase disk occupation

GO_TO_BACKING
   examples:
   - "unallocated" cluster in qcow2
   properties
   - read from backing image (if no backing, read zeroes)
   - disk occupation status is known only by backing image (if no backing, disk is not occupied)
   - write will allocate new cluster in top image, which will increase disk occupation

ZERO
   examples:
   - zero cluster in qcow2, no space is occupied (most probably), reads as zeroes
   - file-posix hole, no space is occupied (most probably), reads as zeroes
   properties:
   - read zeroes
   - io operations are handled by this layer, backing is shadowed
   - no space is occupied (most probably)
   - write should not increase disk occupation (most probably)


We can consider qcow2 ALLOCATED_ZERO also, and maybe SCSI unallocated which means that nothing is occupied but read doesn't guarantee zeroes.. But that doesn't really matter. What does matter is that trying to describe qcow2 backing files in usual block terms allocated/unallocated zero/data never worked good. So in a good documentation (and good code) we should describe (and handle) qcow2 backing chains as qcow2 backing chains and don't try to shadow them under usual terminology.

-- 
Best regards,
Vladimir

