Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9014194A5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 14:52:18 +0200 (CEST)
Received: from localhost ([::1]:55630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUq7F-00077W-6H
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 08:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mUq40-00053b-0f; Mon, 27 Sep 2021 08:48:56 -0400
Received: from mail-db8eur05on2102.outbound.protection.outlook.com
 ([40.107.20.102]:64992 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mUq3v-0007zM-F4; Mon, 27 Sep 2021 08:48:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqlsHkTnrykz7HeZ6M57hBBCYewWpDzmiShytIKrdExuT73ePSwtqp/fAJy4l1QQrwc6w67V1B0rVL8ABI3ZZ47JZH/QLlgfExkzfXEATpUmvPAqoRg7flsUIRczgwEFMLe0sgzPBxd0onc2plHKASy5QQHhHs+wPw3M9D63o09eDUAapVdTAhgK/B9SDyIqWA6RF3R80fhJfZU9vaBj6QqhKlfbVDeLl4VUKbMwptbCe+k4uI56840bBNfv3nKnUkkCikYE6x1iTtG5M90h7WREfJiBd40VuMlDvIdgTOPd3+1C3LP+tkPlL+/9vnWdnRhRyMRZkkgmQqdXnatorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=rATB73x+V+CjyBYoRZ27uPqT0gHmAKshJwtQcedLdRk=;
 b=MBZ4Ij+qVFx/e7O9+tG/BQ0y/7plwdAPHMVdxH75xHLB/C85pnbbJPIR+Eu1XXpZHAV4ukmNRKWXmDrKJUE8zRsjJlrOydgHGfF/67Mfvjm2eqoXm1b3IjtJclV/6JqPPMvyf1CLO3ZhSknvuj0VBeShatlIiccuaYU6hRWz5TFTfVx5ZlCMlVsXuO4QHAcrurDlDc9TlGWK5EErimqLIB7eyR+TXi6JN6Qjcu1QrOu+KYp/Sd0MgfjNTIgUG3UvlxyP1eTg3d8yB7vvlwfxdoKuKE3tF9y2znCH+lXcphrYzPAztl68PlmN+QvX9NePwwilLtbdvqkVEE/0vniT/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rATB73x+V+CjyBYoRZ27uPqT0gHmAKshJwtQcedLdRk=;
 b=PzgVZmwyES7S2yELlQ6ZL9PrmdNCIV+0n+bfaVQWrVKqd/TyfKZhw2rF5emMRqm27wIun1n/3oNOty7OEKoyKBHqOdO/84jZ74rttI9ZeP5G7HsWLLATt2NNHrVrqsr6empP7hQfduD4pgMOj9sQLiP+J4K8SUT0GbGQLHYuteQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.20; Mon, 27 Sep
 2021 12:48:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 12:48:46 +0000
Subject: Re: [PATCH v2] nbd/server: Add --selinux-label option
To: Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20210723103303.1731437-1-rjones@redhat.com>
 <20210723103303.1731437-2-rjones@redhat.com> <YPrr72N494WKnJA5@redhat.com>
 <YPrwbgY9Q4e1ORP1@redhat.com> <20210825193504.d6ka3xzmpd54x2fq@redhat.com>
 <20210924192313.ulfa4wxjtliqdppd@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bb85d9f4-0bf3-8cce-3331-33375ef1da04@virtuozzo.com>
Date: Mon, 27 Sep 2021 15:48:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210924192313.ulfa4wxjtliqdppd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.13] (185.215.60.205) by
 FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.8 via Frontend Transport; Mon, 27 Sep 2021 12:48:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c17d945-74c5-45cc-81ee-08d981b52559
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-Microsoft-Antispam-PRVS: <AS8PR08MB637420B0BECB210F4870B736C1A79@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TmVsJrrOIiEZ3169fQHWcy2E8AcIN/IsdyTnvfwEGcS+atU0RtbSfBmCdC7qGkuswv6X7ofrOrwrQ8fLNuKnlj/u37Mac5MDE0JdV1vQrsh/yM1U5aZtXz/ePlK3LtKZIv+mlEd3B5UtxGamMvLjjW+2kvAp3dteAgygSSALQOlosAIJCAW1PAbbtLWWNnYnf6SaHSLIsRRPlZUz4niE/rYgG60iHxRQ9BsCOQiBpcGezyhUOT1I95rV8xOBXTJF8VM6ZYFh/f/dL3V5B5s8RKq5RPIgskq0oBTwicJpQRkOc3EE4E7jgKBA6J3pT02+EQY9x59/oFqHBcIwom/6Q2Lig+b2q0HTlXpGYmyt4hZXDmvcDxA+lbYlkWaEWGXWwuRIhVwtU1xxwj9JvV8G9wmz0Dbil0ep380EmySKg2jYWLc3jJ3m4p77y/LVsHSwvbkHvfDlzStxbWvjp2Os7tjrqnxrOyYP+Ui9XTXSMcg+BsWN6250OoomQQBo5iKwboTXI33q3hUwTNv1fTA+WHU1PN+B2udnVyeI6dtQqkgyFapYZAp5u9s1JqBLR29IfnrvbSzQxUdnd9p2tsnzvzMkfB6PaRALlOejk1Zc96muFxfk1CfhBdAtU6fwdlWgxIYpK3VbnX6WBkFHcSO4JjEmhYaVVbykzbT7i09HfeM+oZG6pIwDv9+dCFcQ3XugvCSNTuMzbUevf2ZlTih1KEkh20M+dkfqtHLUmQk2oSj4TkjdUwLeQwjoUa8UyxLR/jXPaghhFYV8iFY7lHM3YcBDRe8q5+gao1cTrq6UKb2qWM1a6zSdBAi93ANpM64VX44+h3o6xYEMeZdenupuSMWM9YibfiFbno3cK2S/Y5M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(966005)(8936002)(5660300002)(316002)(16576012)(52116002)(4326008)(110136005)(508600001)(2906002)(86362001)(31696002)(8676002)(66476007)(66556008)(6486002)(66946007)(38100700002)(38350700002)(31686004)(2616005)(26005)(186003)(956004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1bG2ccn8Pee0CXhF0/CTyRpVRNrNSQop4VkbudsbfvSebyoIvvOl+yXOC09GFMO4KkEv+Fo1pQBw5U8zkVKUOGmhxVy3rBQtxX6Uak49Iv+VP1VIftf+cFG0gejF4Th8J7qvzMjpdC9mVhV6ZPKG+mKIGlxc3q9unmeJAeXlrY7GMRXfHwIyKDBtvs09k15pHZry/r3kMiloG977Il5ID0mKwK0HTRBXLu68iVyqoQI4RWCrYkehzSPoeeaWrG0xh3fy7myY7lTSQQPcIME0G01F5lhyCRLZL306a16J5xGUaZpqMyuwIpAEU1qJI1Ieby9AOSBxBEvVkrIFmk7z6uNiQfsIMGIrtNB/TyzwEpT561m8Tau2zvFQgWOuLK/Qk5eyAPIgrIWRvlpd9Tu9mDlgZnRX9z7Lsy05DzAqN5bOxS17zv+n1pi2t/xAiThjWmmjSmCsHRWpy2uoX1c0AmcPInvVoESmSJryDwjApLQh9fLWnmCiNNKOJrCy7Nh47dhge5f/j2/sh4AhjPlLOpq8dppl1e3P6lu+PNpkha1+OHZIdLIDJXA6h/E1fNI4RAFAExQY6eZJS1Q+92pmxn8IhTSdki47KRImwBOY/ocOhYpD8b0hbcrlIY71IkVaoLW6yXCKZf960Ums4klCuaOPi5VAILEgvMDg/9fwpRVO7KIb4p9QzEXS/Aq97qZEKqzklyhDdQ1cqkLfJmKVvXlZsdBxdakJdV1zTz+5Yz8YYEnPjpg561Q6xMW83y2r
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c17d945-74c5-45cc-81ee-08d981b52559
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 12:48:46.6268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbJJWHzG9eSKZu+QBiGmMzrprxoRCag9Sd9CHBEZEhgNs/87c5+HOywQpZ84SDQGbVjeGvTLQ/OwT/pFJQYq/arp7LzuO3s01RnBucwwD7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.20.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_NONE=-0.0001,
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

24.09.2021 22:23, Eric Blake wrote:
> Ping
> 
> On Wed, Aug 25, 2021 at 02:35:04PM -0500, Eric Blake wrote:
>> On Fri, Jul 23, 2021 at 05:38:06PM +0100, Daniel P. Berrangé wrote:
>>> On Fri, Jul 23, 2021 at 06:18:55PM +0200, Kevin Wolf wrote:
>>>> Am 23.07.2021 um 12:33 hat Richard W.M. Jones geschrieben:
>>>>> Under SELinux, Unix domain sockets have two labels.  One is on the
>>>>> disk and can be set with commands such as chcon(1).  There is a
>>>>> different label stored in memory (called the process label).  This can
>>>>> only be set by the process creating the socket.  When using SELinux +
>>>>> SVirt and wanting qemu to be able to connect to a qemu-nbd instance,
>>>>> you must set both labels correctly first.
>>>>>
>>>>> For qemu-nbd the options to set the second label are awkward.  You can
>>>>> create the socket in a wrapper program and then exec into qemu-nbd.
>>>>> Or you could try something with LD_PRELOAD.
>>>>>
>>>>> This commit adds the ability to set the label straightforwardly on the
>>>>> command line, via the new --selinux-label flag.  (The name of the flag
>>>>> is the same as the equivalent nbdkit option.)
>>>>>
>>>>> A worked example showing how to use the new option can be found in
>>>>> this bug: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
>>>>>
>>>>> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
>>>>> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
>>>>
>>>> I suppose this would also be relevant for the built-in NBD server,
>>>> especially in the context of qemu-storage-daemon?
>>>
>>> It depends on the usage scenario really. nbdkit / qemu-nbd are
>>> not commonly run under any SELinux policy, so then end up being
>>> unconfined_t. A QEMU NBD client can't connect to an unconfined_t
>>> socket, so we need to override it with this arg.
>>>
>>> In the case of qemu system emulator, under libvirt, it will
>>> already have a svirt_t type, so in that case there is no need
>>> to override the type for the socket.
>>>
>>> For qsd there's not really any strong practice established
>>> but i expect most current usage is unconfined_t too and
>>> would benefit from setting label.
>>>
>>>> If so, is this something specific to NBD sockets, or would it actually
>>>> make sense to have it as a generic option in UnixSocketAddress?
>>>
>>> It is applicable to inet sockets too in fact.

If so, should patch at least be changed to call setsockcreatecon_raw() for inet sockets as well?

With current code selinux_label is silently ignored in that case.

>>
>> So now that 6.2 is open, should I queue the patch as is, or wait for a
>> v3 that makes the option more generic to all socket usage?
>>
> 

-- 
Best regards,
Vladimir

