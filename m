Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B37330D78D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 11:30:59 +0100 (CET)
Received: from localhost ([::1]:39948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7FR4-0001gh-Kr
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 05:30:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1l7FPM-0000Zk-Ay; Wed, 03 Feb 2021 05:29:12 -0500
Received: from mail-eopbgr40111.outbound.protection.outlook.com
 ([40.107.4.111]:52702 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1l7FPI-0000Cn-Mi; Wed, 03 Feb 2021 05:29:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FanDP7G9Y57rUgbbhcshPsto3lJH52WemZnGEhRGhN2AMOoeTutNXd1D45JspYpCXD/Kt4Eidq9pBx65VtzK4aaTTa0Vm7YCO2deCKq2DvpFvKJN6lGdph8P1Z1fiWiv6a9dPfZrXq5sm/5xTc4n6V5d2dFLvyirOsHmB+rDblTYxM8XBSNOLff6bl5TxSMdB4ZUgFaEN58m/BBKPlpyWnnDOaScKGrUXkzStjjgOUYQDeT8N/xkLWw4viB0EnlmK5PZNTzhnUWrL9D4gile8rUI/Runc/+J2cEi0NXx+leeGkt/CnY3yZ2z56lTfxfcmqylRbeuAYrELeF6aFT+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRi1lcyHBJVeuINb2DZmj76D6dbeEs92G+F0eU2wLsI=;
 b=iixzzP+639ZNFOg7v+Ca/dUX3b1ZND8iXvcvqWknXZ4GfEqoNOYsQDNJFOK06uGmLwytVXHpk10SqjHoIEfWxeevYSJKIMY/bQbNpAXTlxUIOgJqEkV32m7vlq9m/+BZ+0V6f0e+Aerio7liyIvg/92HmKBWvqoYm96zexyx+Fr+21PtqlTMnYjjoqN3a8L2sZ+EsyE4pF17jgqTBVDmPe8NdRZRuQ2rURwkyLMhzZuiEHgypQ3b0Z3cIyErN6H/XjAgylfhxQgRJkc2Z3qnwLXcqdxXdqS7XMHth0ATNe93H/SoBKEsob3YveUhCz/5hLXgybhKE7XKU/4vg5cMIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRi1lcyHBJVeuINb2DZmj76D6dbeEs92G+F0eU2wLsI=;
 b=XFPcEzVlOYacmxNlZ9AwnzUvsFjgMOdW+uDuG/oaWeg90nmGsfVr5VHi1J+cKPCBcVJmX0dNVr3gVeASmyD3C5767uteVqx1rQIZZKvjK69G/jA6WYcXqtStzXkDXDxFGALrt9BXxpN8GUbgQUd9w1yjckXNRIbrD+vnpgJOnNI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AS8PR08MB6470.eurprd08.prod.outlook.com (2603:10a6:20b:33a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.23; Wed, 3 Feb
 2021 10:29:05 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb%6]) with mapi id 15.20.3805.028; Wed, 3 Feb 2021
 10:29:05 +0000
Subject: Re: [PATCH 1/1] docs: fix mistake in dirty bitmap feature description
To: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20210128171313.2210947-1-den@openvz.org>
 <a88ad335-05b1-b720-5689-1c477bd55d1f@virtuozzo.com>
 <ccc0020d-ae27-6e8a-d76e-55615c74befb@redhat.com>
 <80bb1b27-4bb3-de85-713b-a88c8019a14f@openvz.org>
 <cbfdf78b-57ff-3482-3adc-f2eb3e65237e@redhat.com>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <5bc4c2ef-e1dd-f0bc-12f1-62c1a11a9fe4@openvz.org>
Date: Wed, 3 Feb 2021 13:29:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <cbfdf78b-57ff-3482-3adc-f2eb3e65237e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [31.148.204.195]
X-ClientProxiedBy: AM9P191CA0007.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::12) To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.40] (31.148.204.195) by
 AM9P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.18 via Frontend Transport; Wed, 3 Feb 2021 10:29:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fa75bf7-a395-4b20-046c-08d8c82e87f2
X-MS-TrafficTypeDiagnostic: AS8PR08MB6470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6470A388363337CCE7D39B15B6B49@AS8PR08MB6470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DK8W8KkXm95a2iuQv7ZeVR8ys1vzw3s9LjeydL0oIMDJGXX9V5hxmwQbgL34DbKpZwV27IWW+bu8MBwRJEsHRUtwpHoFg/TEGoXpSimRTX5Puvv6AnSffsrl6ysNggCpirKzL/MhWDFcbnkZIh3KP4Se7DXHo390LnBYSTYhFoNUBkGnI1Jw9RAw9MMbg8RkRAUVe3KZJYWDjaDXpysCy47JUAM72YJmeFM4bwRtow7HWkSi+Ih+JMOnGCyVMnaRccOIwf7L7K6iEfWDcZBvaKZCQPR618uZz+7NxCOTecSbBT9lBMg3wfuMGMhIygrEINPVB7X5HQtranW22dVW6O4hBemCafTAO4QiK8e5a4R2C1OG9lFoDwKT3vAg7hmDpPXTAuc5Tt/DY6RaIKSN/dIiG0w37CxVG3hAPSoIMO+2N7qKAQAJSd9hvX8ZyH/OAJtCzAsfGrJunjqtKSEgRrKOxLO8GQAA7FSCG9yYjQL8kO6Jb4b+LQ2kbZNYPFXwoV9LFrFQgvwWOTwcKzP+f2pJjHn0iFbnHjzZCgZrI3pO0vcTkC7injC0vJAldtjlRZXqHQtLBmLw2OBFG3K4NKE2P0q1cEuYpwhIaIKgjxRVYWBwrMu/Bx5Wgc8gsdgp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39830400003)(346002)(366004)(396003)(136003)(2616005)(66556008)(66476007)(956004)(66946007)(6486002)(316002)(4326008)(42882007)(8676002)(110136005)(16576012)(31696002)(2906002)(36756003)(31686004)(52116002)(83170400001)(478600001)(26005)(8936002)(186003)(53546011)(5660300002)(16526019)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NjBzR1pUREtWM3J0Nyt1WVdIenRKK3lESVpBenBCbjVGYUpUa0NFKzlDRUpy?=
 =?utf-8?B?WnAzWDlWUWRqeDdrZldZdm1lM1duSW1DOXAxbDBSL2plQndUYVNKV3V4S3hM?=
 =?utf-8?B?SVFOSDVqSkZCc1NvUllibDNhQ1FjNU81MDFocWUrNXQzakMwVUhicXJpdUx6?=
 =?utf-8?B?bnhmMStRTjh1bGFLT3BkZ2tHc3BscFhyc1I3ZENUVmdET2hXSGJWbUlqNGxE?=
 =?utf-8?B?WlJVVmdhcklldnlGNjFURElCTU04SWlTWjBnT2tiWURHNFduenB2VnloZXRF?=
 =?utf-8?B?Z2tRcmRYWnVnd3pQWG5pNFhIR2NxcnBzRTZkNHFERkF1ZlZSN2xXOGpOWldt?=
 =?utf-8?B?SVk3UU5VTThkQjEyMk5OY0JaU3FHdTB0MkhPV0pTQkRacGpDWVBtTHZ0TzM5?=
 =?utf-8?B?bFg0K0NFZElDN3JTM1d2UDZQL0grWkxEK3RvblI1U0V6cnA1eWtuK2hWT0hn?=
 =?utf-8?B?NFBwUG1sZDNtejlUYXF3NlVzZTk0dXd3bEJFVE9oZS90aCtsN0pOVFZic3NI?=
 =?utf-8?B?b09tOFJoZlRrVXlMdTFTNnVzdHJsT2R2WEN5b0g4YjNTRWxyOHpXK2xXcmJS?=
 =?utf-8?B?S095NGdoenM5cGFwVEwzOWNLUUhtTWhnMkRSbW5TekZUNXF2dVc5aDdBZVZN?=
 =?utf-8?B?RmJtMmFHZEZFdmh4L0dpaUpvM3lVMktGaFRhd1ZkTEFWK1FKSWx0aForRm9Q?=
 =?utf-8?B?M1FHT0pGUWFMSVN1eURMR3V3WmpTMlVBbWF6YUtxMThITWU0V3JkNmRhb3FY?=
 =?utf-8?B?V1ZQUysvbVBtL21BSlRNQ0dweXZRU1hUSjIvR21kMVhLZlJiT2x1d3pqMzBI?=
 =?utf-8?B?K05qeGRkOUltRkpmWUhqQXlGdmtyVzNpTngzc3h4ZjhiY3N3YmZhL2Ura2to?=
 =?utf-8?B?QWNWUXRqbUlnVFl0empsem5MOXhFdFhpcUxsRS9BRkFWbERnLzl3dEsyNy9Q?=
 =?utf-8?B?Um5RbzFXcU1SajBhRWgwWWp2ZXlXU3BqMkI3b2JrbU5ES0xhdm44ZENtczNX?=
 =?utf-8?B?MkNTaDRjWStOakJ6U1orOW02U0ZQM1NRKzg5NDRkaGlwUUFwYUYxRkdXSTVS?=
 =?utf-8?B?T2NhTnA0QkJ5d3RTM2Z6bW1ZQ2hLMzNlb3FXdFd1VFBIZjU2b1MyL01DV2dB?=
 =?utf-8?B?TUFaNG9seks2ZFlMM3ZpS054RWlqYzU2Y1BJV21zb005TWQyMWQ4NFVMMkZT?=
 =?utf-8?B?YU9uTlJSWG1GeTJ6d2lDM2lRWm9NWWh6MWVtcTF3cHBvUnQzSkNxU0I5VEpG?=
 =?utf-8?B?M0x0dXZNa0R2ZFY2NkdlY0VuTUo5aFFCV1BiUFp2RGRnckxYUGFlSEZxZWsy?=
 =?utf-8?B?L051VkFqWFRGSnRkaFFFRUJsRkNITWgweG1ieDBUcTZ5b2h1R2padktmMzlK?=
 =?utf-8?B?NGo1MnE4NXMxaTFtM0RUUkxvWW1pSEoxWkl6eUJUZUFiWlZzcjhUNFR0c2t1?=
 =?utf-8?B?OTVJVXIvMGFJSDVPOTV2ZS95RjdVSGRlVWRNUkxnPT0=?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa75bf7-a395-4b20-046c-08d8c82e87f2
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 10:29:05.1728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCZ6YDhftMRO0Q56t5ySpvgvxBp+pLxHinhMgXxR/auItWOeqVshdpwekXNZFwpRS+Im9985Arbx1BhsCilOrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6470
Received-SPF: pass client-ip=40.107.4.111; envelope-from=den@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 2:08 AM, Eric Blake wrote:
> On 2/2/21 4:50 PM, Denis V. Lunev wrote:
>> On 2/3/21 1:15 AM, Eric Blake wrote:
>>> On 1/28/21 11:21 AM, Vladimir Sementsov-Ogievskiy wrote:
>>>> 28.01.2021 20:13, Denis V. Lunev wrote:
>>>>> Original specification says that l1 table size if 64 * l1_size, which
>>>>> is obviously wrong. The size of the l1 entry is 64 _bits_, not bytes.
>>>>> Thus 64 is to be replaces with 8 as specification says about bytes.
>>>>>
>>>>> There is also minor tweak, field name is renamed from l1 to l1_table,
>>>>> which matches with the later text.
>>>>>
>>>>> Signed-off-by: Denis V. Lunev <den@openvz.org>
>>>>> CC: Stefan Hajnoczi <stefanha@redhat.com>
>>>>> CC: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>>
>>> I saw the subject "dirty bitmap", and assumed it would go through my
>>> dirty bitmap tree.  In reality, it's unrelated to the dirty bitmap code.
>>>  Would an improved subject line help?
>> hmm. Actually this is about "how the dirty bitmaps are stored in the
>> Parallels Image format". The section is called "dirty bitmap feature".
>>
>> What I can propose? :)
>>
>> "docs: fix mistake in Parallels Image "dirty bitmap" feature description"
>>
>> Will this work for you?
> That feels a bit long; maybe just:
>
> docs: fix Parallels Image "dirty bitmap" section
>
>

looks great to me. Should I resend?

Den

