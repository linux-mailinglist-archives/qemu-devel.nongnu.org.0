Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742A2304310
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:54:37 +0100 (CET)
Received: from localhost ([::1]:40512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Qfs-0004wM-9N
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:54:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l4QeN-0004SI-Gy; Tue, 26 Jan 2021 10:53:03 -0500
Received: from mail-eopbgr130098.outbound.protection.outlook.com
 ([40.107.13.98]:10500 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l4QeJ-0003zf-MF; Tue, 26 Jan 2021 10:53:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F50j5bZ485/rBgmYEGy8MT8f7cpWkeP5/xGR2Q34JFIgq9WXusvB96kDnotuJSSt3sZGgsXu+E8V7pdbZPraADmqUok9M0Ywq6gTYGUFh1KA7UKxi1+Zb1iE+9ffDxTqnxVDv9YwL+aYMLilooBtheOkeNQDsvBYwd3znsZN4gVranQ5sIoaVL49CQLrPJ10As7MvOR+rmeB6xWBXuYbE3JYOjkygfbZikuGtNI7eJdeuM7trYkSsPkNR2Dlf42H5lpZlz32eTAAR4kDdk5G70aCF7QyyEsLsZkBelbG+zO7O6qlpOYVGu5qUImrMT82FiBHSW9wVNbAEU2g5BmBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rygymu8iSnV5dHVnMS+7eXOETtVVt66bTyaaiVYUYIg=;
 b=VGQ/PX9s/FZ5Zb45l9NGDstwhEEpU5JubrS0vhSzFGwQ1i9KJr/dNJJriMhIZjo6Gd6AguMruo89fQDofYcQ5T5okvvtenjWIGuCwxhJvU4/BGV0+v5YAKpgl7eS0rd0n9U++D9p+jPahRvbcbof5Nsum8NA+CKQOdYrFeSWQhK4NmTdTuZrpIyE3UChivQ8u4wgt821amXQIUTOukQn6KHn/QjvBIn1OCML5mQ8frf9mhIibH2t9KX7vsuG1EqdfGHINQPGBdgKWpLoKQpK1GP0x52Z8jT2hcWBlTukEkWip7iIo+NYcEPN15Wm4vGAEiYKvG0LL4QHpgOvZU/wIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rygymu8iSnV5dHVnMS+7eXOETtVVt66bTyaaiVYUYIg=;
 b=Yop/X6QMhfLQ2YIpXRKstPRL2b82I08Ynbv7LJ/eW2Jz/InGqyAVKBzE3ybDR3L+lBaT29Q45Ub0yP09iZebyFX0qcLUKQYzuRFmqBx/5RX9pAIPftD/K84QDwlODSjdu5oFI7bbD9SnlbAuqxhxCDEnhFBhQ1fANHP7yaU4fD4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6294.eurprd08.prod.outlook.com (2603:10a6:20b:29a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Tue, 26 Jan
 2021 15:52:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 15:52:55 +0000
Subject: Re: [PATCH v9 0/6] Rework iotests/check
To: Kevin Wolf <kwolf@redhat.com>
References: <20210125185056.129513-1-vsementsov@virtuozzo.com>
 <20210126125301.GE4385@merkur.fritz.box>
 <2628b158-cc41-908e-550f-ec4fe726a31f@virtuozzo.com>
 <20210126150750.GH4385@merkur.fritz.box>
 <5bb6d3fd-2a2c-91a4-f12a-5e195627a7fb@virtuozzo.com>
 <20210126153637.GI4385@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <99233780-7d44-fff0-23d0-4f230998317b@virtuozzo.com>
Date: Tue, 26 Jan 2021 18:52:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210126153637.GI4385@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.100]
X-ClientProxiedBy: AM0PR08CA0002.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.100) by
 AM0PR08CA0002.eurprd08.prod.outlook.com (2603:10a6:208:d2::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Tue, 26 Jan 2021 15:52:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16081619-523d-4082-94ff-08d8c21271ec
X-MS-TrafficTypeDiagnostic: AS8PR08MB6294:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6294A3A97E88FA7CD064725EC1BC0@AS8PR08MB6294.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7xIBUsLgudbr39HRYpjwbDMbVZkt2LPbg2vFMsekeDvHZtbsPkqIqasjAElMoymeyEUZXQXcYHy/68osRjOSol4PcTzfZ2Gqbvmv4o/r+QNkXU58dgyZdZF9SXet0Lf4pXTdDUGP68gaQuRlqXxAwkyE+IanMoiniYDcHSKYqcRUQxhlEXlPusk3rPP0fRaRQtDNE/dJ16Bs//kf5GrUUUm/v6wpSdvSOirHF9G5L7Ejd4TOpVYcPuMtiq6x/xUk1ufzJo1dPUGUR5WS3PSdx3yUOPftsMt/uN43e6rioZEgcG/hj70imaNk/DcnHFPEq4mUZd0AfHG1uDmFt/X2LHMmZ+4k4Fepl05KpVhSjvu3tsF7fWK7vrR0E4TAHYiXZFAcjHQf2CesPfutuh4UPVCMnLWD2AjgkV6JWG8e7D/pSxzsSOFQ+aA3OsGkoBqloC7I4EKziZjSau/vr1JB7J8mnDNubo1O/gWQeZuVYAuDC9CE+o9bue9ijMaTQDZCXTLswkTjLzT+3CAY+HadH1mLSQRS/tkQU/cHORflcQriF0hb7zYpUyoTiH+nY1DU8j5G6le8Jse8WOuEWmY5AGVV8k1a8DqbymI2LHr68Jg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(396003)(39850400004)(346002)(4326008)(316002)(8936002)(66946007)(4744005)(36756003)(2906002)(5660300002)(478600001)(16576012)(66556008)(83380400001)(52116002)(956004)(6916009)(66476007)(6486002)(26005)(2616005)(16526019)(186003)(86362001)(31686004)(31696002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y0gycFpxMUpCMWRCL3EvbjdxTVZLZXdXVFMzcTNlL293R3FFcHF6MGJWK2JG?=
 =?utf-8?B?aW82SFNRNGQ4NUFDK1JIbHVRK3dZNDRQd293dnFLeHIwR0k5ejR6bk1ZWWNh?=
 =?utf-8?B?ZHZwd1dLVTNMajN6WVJKemovTzdMM29iWWRtYWZob1BIT2VBT3FDNjhvUldi?=
 =?utf-8?B?VmhUaW4xa05MVkQrV3hJR2NmZ3lKazZ3d0dqbEVBWjF4aUNVMElhSVpCeUs0?=
 =?utf-8?B?VzM5V1V2alBmVDN2RE1Lek1WVXF3eVhpMVBvSWs2T3U0NEZHMUlCK0MvenQ0?=
 =?utf-8?B?eW8wd2xySW9wZTV3YytQQ052citLTDdKZVpPUzJXNUNzbnBzTXd1SjIwMlh0?=
 =?utf-8?B?QktvbXpna1pob3hKbG9lODF0aTNpQzFKbWszTTFuNGhhT1J1TUw1LzBjbEdY?=
 =?utf-8?B?OUJ4WkFUZWFEQlBhYUd5c0NmaWhhRGtUTWxWZnZQb0pvT25WZks1dmY1dUZE?=
 =?utf-8?B?UDI1aHVFSVZTNGhPdVFZM1ExUUVhVk9kbTFYbFcrSnkvT3QzbXZNVHlHV0pU?=
 =?utf-8?B?U2E1RmtiRFNWZ3Y4ZFRER1VVK2lhWDNDRk1lbUdWcUkyVlh5ZklFbi9oVThU?=
 =?utf-8?B?eW9UNE9yTzcvWHFIYTNrUEI3WEcwZGFwZHU4STBPdUZMaWEvVnJkRThDTU5E?=
 =?utf-8?B?cTd0L21Jd29lWUhVNFRjRlhUSmZpTGI0S0VBcTA0UXZ1SEdmWlhteWFQNzZa?=
 =?utf-8?B?ZXc3NlNWT0k1Ky9JbG5aR0lyb0pnY0l0YVBSeGFzSjRpV0lrN2pOYUxsNWVk?=
 =?utf-8?B?TG8wSDNWa1k1VGdyT1RVclVnbTRQOGVnN1llUE5xRFJNSm1jaGVGOTd5NnNW?=
 =?utf-8?B?bEJTc0ovWlZyVmpzUlZIREZlV29CQ2h4bXAyWXc0YWI5OEZlalVJaG9nZTFB?=
 =?utf-8?B?VXVzWGYxMUhFeEc4V2xxdkdKbHhxUTNjNFlrVW5QS0U5UzFlRUErNytoL0Zj?=
 =?utf-8?B?NGIyenB0aERlQU1VRVBKdWZxWm1kQjVEZVVoc0FZWVlmYmxJUTBpaC9PelIw?=
 =?utf-8?B?cUh3dlcyd3RWb1VmQ2E4UFBkelZJZDlrWENHNmM3S2RQZUR3VXd2a242MzZ2?=
 =?utf-8?B?YWpUUUVrVW5LOFlOSkI4Vlhyb21CQTNQZWVPRC9OUCs0OVVFQ0lrTDhGTE9a?=
 =?utf-8?B?bjFJSUpZNGd5ZloyQjMvbW8yUzB0dHZsN1JkZ0VqbkdYVjVmdlIvbXpneTFx?=
 =?utf-8?B?Mm1YZkVpQnRnNFRma1V2SkpUbTByQjlBVDhjZ1YxMkxJdS9GM25MQk00c1NR?=
 =?utf-8?B?Y0lPQkJBYXhpMWNyc1cvbEk3N3hWT1Z6R2tjQXFUWVJkTFVPNG1renkyb3FB?=
 =?utf-8?B?YzM1T0dISXQyclV6ODFFM25tcHR0aFpoT2NleGVOQUhhN0pVeEJQLzlKakdE?=
 =?utf-8?B?NUxoRlo1dVhZU0VhdDNsOGRDWXI1dnhKZGZvaHNuMHJBVXpBdTd6SmJuL3F1?=
 =?utf-8?B?dVRhcjNBa0I5aDdEd1pnU09iWUtvQmN4YmdkZFlnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16081619-523d-4082-94ff-08d8c21271ec
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 15:52:55.0420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NVatLNqPlJ5P3IxmMlLlohkSJyZy8rm5hR9uuUMNVpckjYdNYIBKz4YvkjW90DFw8ByFNtd0ZRAczviWFkz9nUXQW4BtIZSqLEsDLyqFjS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6294
Received-SPF: pass client-ip=40.107.13.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
Cc: qemu-block@nongnu.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

26.01.2021 18:36, Kevin Wolf wrote:
> Am 26.01.2021 um 16:15 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> OK, thanks for handling it!
> 
> You're welcome.
> 
> Only problem now: Max sent a conflicting pull request that touches
> 'group'. He suggested that we could split the deletion of 'group' from
> the 'check' rewrite and merge it only later when nobody touches 'group'
> any more (because it's unused).

I think it's OK.. Nothing really wrong in forgetting to remove unused file, and remove it later :)

> 
> The other option is that I wait a bit or speculatively merge his tree
> (with a lot more patches) before doing my pull request in the hope that
> it doesn't fail.
> 
>> When will we move to python 3.7?
> 
> I seem to remember that 3.6 is used by more or less all of the current
> enterprise distributions, so I'm afraid it will be a while.
> 
> Kevin
> 


-- 
Best regards,
Vladimir

