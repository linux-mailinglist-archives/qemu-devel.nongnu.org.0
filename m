Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6461A2CA144
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:27:13 +0100 (CET)
Received: from localhost ([::1]:47430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3oO-0001j6-Ci
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kk3le-0000y6-2O
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:24:24 -0500
Received: from mail-eopbgr10137.outbound.protection.outlook.com
 ([40.107.1.137]:53486 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kk3la-0004No-Or
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:24:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSPbxBQL3arZOqPvwLTc1jKpIk4uzxOJf6Xwyz3rdkcTMvOf+cNPdUoTy5lE4vg9ezhj8USRP8UTYMhCCMAkah8FdQAWb83wfstDc0iGBGSJzLZbMsfv0tEmZTbHNR7n4LmDGiKk7b5xIaP6FRLvDKb3LEwwCKPYNkbsiP83Rl3JEinDdG0+l1cXdhMHpl6W1nmNNI/bPQkKGvQrs0xA/V3Ncmp2uEaGegtbRs9RshsxW2f4H3cRBrUZ5Ng0lZ1Nw6ckKnYIy2Q9Xs6aQQeoYB+A/d0H6wJXwHHCv7eo6q75kxXdMrde9wnScdS+BDR5R3vOheXN4wIn10v7TIfiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H55MlqG86LwY3lqz0F6amP64GD/qcSH7KcBX1OeHSqo=;
 b=jAzCxidC97FMgt5zzxmJYjgVf/YHEALChJDV3YyFR0RwELZYj8qZor4d01ymNkar0uKcaAQblDbZNZFEEeksW4E+QU6Ze4XVWr38FH/BjglCsUSPAI27bwEO382WwanJkF8LPvrbAZLlrYyXOy01PlW/07gMWjdSUJJ4MK3bcm5T9Ka+q/XTY78W51ZovQY89PRtCzQ0I4Dao3E+nATxHgsJPeid//HrjRiJ45iP3YFMYahLYdhBvfG0MEWII0SYtNT9y9Aq9wELIhZR6OGLaTMh3btzcyRmdCvZNGgNbF/FbfGHe1R2we1/LUuD+awwrN5D+vsTbQLwDbs1euavrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H55MlqG86LwY3lqz0F6amP64GD/qcSH7KcBX1OeHSqo=;
 b=U3PNz1EzfD2LMiEZDvc2njd1LPzPkIM5peCJef475l0T7MaxUO4wUqqtSEusoaNjEUFMeiS9DDXgbPNrGRZaTub9OB/huFx43OQ0GWCMeHhcctwM5x1IkUNsGBmy4aHE0/YcU6MWvHA7rV+V5lZTFx/WS5+TuezJJAub8XCknLM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB5517.eurprd08.prod.outlook.com
 (2603:10a6:803:139::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 1 Dec
 2020 11:24:14 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 11:24:14 +0000
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
To: Peter Krempa <pkrempa@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201201070820.GO105758@angien.pipo.sk>
 <f9c53596-912a-0b52-adfe-68afff8799dc@virtuozzo.com>
 <20201201105300.GQ105758@angien.pipo.sk>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <d3b0c767-14d8-b7e7-345d-0314acb3d07e@virtuozzo.com>
Date: Tue, 1 Dec 2020 14:24:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201201105300.GQ105758@angien.pipo.sk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM4PR0701CA0029.eurprd07.prod.outlook.com
 (2603:10a6:200:42::39) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM4PR0701CA0029.eurprd07.prod.outlook.com (2603:10a6:200:42::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.6 via Frontend
 Transport; Tue, 1 Dec 2020 11:24:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dd7ba3d-8f70-4572-ff68-08d895eba233
X-MS-TrafficTypeDiagnostic: VI1PR08MB5517:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB5517F84FC66BFA5E21AAFC1C9FF40@VI1PR08MB5517.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bEauQdIosNxMJ2Szga3024TPd3IW9yJ+4rteXeiCMHnmhlW/mDi7VERXRoEqzjvMAohTC9iqON+eNxGDR9SXmLxfYRA3QanPAPKR20oFbADq0/q0Av+ESTy9frm9Q7YdOZ9qH3tt/6QkBHf4oXJ1kpvGPosIUaoZN/4KbdRiRK9wBj2CRg+BEjs9i+cexFHbqfSz/DW57QW5KM4BWpPl/zkQ+XzqOO2xxsOdOOFupTWSsVeFQdeGjyFMJ4hZxtc3GSUnaU/bGXQ0vQ0ygGAkRKymBtmJsKEwrp989IHNenK0HZYgMOIGtMiizMOV/6VdmAuHGNfTuncQucfHspccwByrnai2sfZiKFLPwfCP4WjAyx0PZ0A60TAMjI9yIR5r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(39840400004)(346002)(136003)(5660300002)(4326008)(86362001)(316002)(8676002)(16526019)(6486002)(66476007)(186003)(66556008)(66946007)(26005)(31686004)(2906002)(53546011)(8936002)(36756003)(52116002)(956004)(44832011)(6916009)(31696002)(2616005)(478600001)(16576012)(83380400001)(54906003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZG9vNHB4ejZzSjV0dHZndUxkZVExUi90TmVtZ1lOMlEwRmNJYkxndHZlK0xu?=
 =?utf-8?B?Mko1bUJhRGIyZjdLQ0xYdkFFUS8ybWFBSFk3cHpKWGh5WHN6NjU5SVRZeTU2?=
 =?utf-8?B?Y2FaWkFJR3Jjc0RLOUZEYUh3REp0Q0ZRRzNzUDZPdHpiNCtxRzZtSUsyYzk0?=
 =?utf-8?B?L2Q3YitzOFJSUklQb08ralFnNlNQWlJSMjRBT25XWUNZSnd1YXpxc3JiZ0NS?=
 =?utf-8?B?clQzbEJsMTUzbm5xWjJrSnpYd2ZwTnhNMFVaQzUybDU2WFZoUGkrZk5YRDA5?=
 =?utf-8?B?SVpqWXlneHloQTJlM0dkQW9pM2RMWDhDejVWdnMxN0dBNFd3TVRTWnZMNUd2?=
 =?utf-8?B?Qi9zQ2c4Z3hJcXViT3VyZEdOS0RZRzZvUGM1d282N0N2dHlWYWZINTFwMG9i?=
 =?utf-8?B?WkRGTXNlOXNmeWVCRFo4SXU0TEdZeWlZR0dqRG9YVVhlcUlDTVcwdi9SdWtX?=
 =?utf-8?B?QjJaSWtQSXhtYTQrL0VJWWtJRW1VSDcvdXZLbEpLU3RuREptRDlpdUcvVlZs?=
 =?utf-8?B?SG5jTml5a3d2c2pkMmx4VVNWQWVVTEV6VUVjR1hkUktuSWUxaXB5bHk5U3ly?=
 =?utf-8?B?V0xxYzBEL3BkNzJ2M0ViUitnWkFZeGs0bVpRMnZqL1ZSbnpVVGZ4SDlyVFF0?=
 =?utf-8?B?aHN5d0toeFlMWnh3d0JlMkNuWTdhVkU2RDRBM3dBZmNCTnpnaEhrYlExNXdM?=
 =?utf-8?B?R2tpTHlheEc1WDliQ2FxQmloVVp6ckxDc3ZRbjFmbjZnV0xmL2ozeEljOEpx?=
 =?utf-8?B?OENsd0hxdWVMUzQ2eXJJUGVzdnJET1NCZ0hqb09CZ0U1a3kzQUJYNkNQZ09L?=
 =?utf-8?B?dStrNVhOLzcxdVlWcTJyZFppZGQ3MWtObSs0SmlnVG5OcHlMMUdqL0JLZkNF?=
 =?utf-8?B?VEJweUtqQ3RCWFdWMVJxb3owSnN5bXFJYmZqcDlOZmZlUHFYSnptdlhYNHRr?=
 =?utf-8?B?cEZaRTBpT1psWS9nbC9tODdEMHcza0NEZzdZSldmSTF3eGRHMXBENnBaZG12?=
 =?utf-8?B?OXJlKzFKbEJtTlR4b2htYWRjTWJpVDZDbWhXaTFWZ0FkVXcyNk5wK1hxcFZM?=
 =?utf-8?B?ME0zelVuQk9qazB5QnpTWHgxVjJhelhZMXplUUt6SHpSdnhwQldSNjZGREFo?=
 =?utf-8?B?Q0ZhdzBSb21ZMHA5a0N3Mmxpd2lqYlhMZkVtNk85eURqNk1DZ3hiYlVtaWJE?=
 =?utf-8?B?Y0k2bkZ4SDhJTjdmZFlOQmZuK0VnOVkrM0JOWnJPaUYxMkIvTUNTWXJ2QzA1?=
 =?utf-8?B?TVdlUFlveXVjTlp6WGJQNkFLTlVTeWljbkRzaXN4YjRGdjl6akNBanRuU1Rs?=
 =?utf-8?Q?X+gsCLDbwowAI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd7ba3d-8f70-4572-ff68-08d895eba233
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 11:24:14.6124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Ay3p80GXJnOuv0Q7NCOVSMNIaOWAk4ZEgURT/RIwgGgN9s83DFtwBYoiAyEE0rMYvH5thTEyNx6N1X/0Eq7xo3GUsCvQf/2gTnucl5p/JY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5517
Received-SPF: pass client-ip=40.107.1.137;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

On 01.12.2020 13:53, Peter Krempa wrote:
> On Tue, Dec 01, 2020 at 11:42:18 +0300, Andrey Gruzdev wrote:
>> On 01.12.2020 10:08, Peter Krempa wrote:
>>> On Thu, Nov 26, 2020 at 18:17:28 +0300, Andrey Gruzdev via wrote:
>>>> This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
> 
> [...]
> 
>>> Note that in cases when qemu can't guarantee that the
>>> background_snapshot feature will work it should not advertise it. We
>>> need a way to check whether it's possible to use it, so we can replace
>>> the existing --live flag with it rather than adding a new one and
>>> shifting the problem of checking whether the feature works to the user.
>>>
>>
>> Hi,
>>
>> May be you are using hugetlbfs as memory backend?
> 
> Not exactly hugepages, but I had:
> 
>    <memoryBacking>
>      <access mode='shared'/>
>    </memoryBacking>
> 
> which resulted into the following commandline to instantiate memory:
> 
> -object memory-backend-file,id=pc.ram,mem-path=/var/lib/libvirt/qemu/ram/6-upstream-bj/pc.ram,share=yes,size=33554432000,host-nodes=0,policy=bind \
> 
> When I've removed it I got:
> 
> -object memory-backend-ram,id=pc.ram,size=33554432000,host-nodes=0,policy=bind \
> 
> And the migration didn't fail in my quick test. I'll have a more
> detailed look later, thanks for the pointer.
> 

Yep, seems that current userfaultfd supports hugetlbfs and shared memory 
for missing pages but not for wr-protected..

>> I totally agree that we need somehow check that kernel and VM memory backend
>> support the feature before one can enable the capability.
>> Need to think about that..
> 
> Definitely. Also note that memory backed by memory-backend-file will be
> more and more common, for cases such as virtiofs DAX sharing and
> similar.
> 

I see.. That needs support from kernel side, so far 
'background-snapshots' are incompatible with memory-backend-file sharing.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

