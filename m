Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CF22C7F87
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 09:12:51 +0100 (CET)
Received: from localhost ([::1]:36232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjeIk-0002bg-6V
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 03:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kjeH3-0001bv-Tn
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 03:11:05 -0500
Received: from mail-eopbgr80138.outbound.protection.outlook.com
 ([40.107.8.138]:34693 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kjeH2-0008OW-AB
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 03:11:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5TVhSgNlQL8E4/52E/SEyc54U0FHD7C9HvdkX74wYp/25qpFcd9Z04Uwx6TaucwEi2vpX+AEjIlDt/N1s/q4fcj17lChwJuHHbAqqfigzlrYBuQMO7g19u9LkoddKSW9TgcK5bi8WLjVbz5hrdhm+tI07PLzXqh728F5YbJL0WFTcTWWLTA+zFRbEKXSO6eX0HvNG44wbjamAY5nP1IbvSIQTCJ1W4Na1NZ4lP6gQNO64j1xbw3ZKABadQJFPf3A0fsb5z3z393g3FquYLmPd1pvCbpVj75BEmF4LjzBAoKlSftXXF513Ha4ZOcrOzv6t0W/nCnv/PJIi3hxr26jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uxk6Y3lQxPe/nT3pupiCgM7Bq2jEP4WPsN3XK7AJxEI=;
 b=etdEw5IwNdbzFt7KF/uqVVv9o5Upu9KmFthES95+kQ3BRbJgJREb7tvnJoQ7kX0QQOqtNhyJzaMt+023nrhVwgmV0HNfqceQmQ5/jYtlpxa26d5AQW2Nr+5DvvCu+Gjwov+IzJBpgbyvu4ivGOAiG69JxqYKyaameDRyA4iZi39vcTE28ISS/LsjtDmUkZpeUQCIvAwVBFsYd8jeLns6Qm5Pcsxvo5AYQUsUgXKH+YnYxclSlTEN9FZXI2Tthw4xx/LOKZCukX4noiOqF/Br8sZBKoVR8oh6HX6yR/BvkrbDfAGvUFV8VkmRilo+/t02B600vJJsv/Vcfm1N7pcqbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uxk6Y3lQxPe/nT3pupiCgM7Bq2jEP4WPsN3XK7AJxEI=;
 b=Kwwly7hHck+EFcuHvxv7Epvk4lA6jpSvTuyRTZ2nBITcKXUzhsk+V5CHraiJJrx0Eb5clYa7AjW9iUof8tyM5jdYpSV2+Qb5yfGFjt5B8voZssxgRbvW1F+XuRtQY/EZSIKAwPMgtnaWMbtt3VhqAfE1N5Ytq958dBARWkuir44=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR0802MB2271.eurprd08.prod.outlook.com
 (2603:10a6:800:a0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Mon, 30 Nov
 2020 08:11:01 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3611.025; Mon, 30 Nov
 2020 08:11:01 +0000
Subject: Re: [PATCH v4 6/6] introduce simple linear scan rate limiting
 mechanism
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126151734.743849-7-andrey.gruzdev@virtuozzo.com>
 <20201127222811.GJ6573@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <ab27e287-b737-25a7-cfed-2d70e0042537@virtuozzo.com>
Date: Mon, 30 Nov 2020 11:11:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201127222811.GJ6573@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR01CA0111.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::16) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR01CA0111.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Mon, 30 Nov 2020 08:11:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80cb2df0-a946-4e3d-890f-08d8950779fb
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2271:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2271AE5DD344C188D082DB5E9FF50@VI1PR0802MB2271.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aEqM3QaHM0OBfpJo9/gOBS+EQasGOtdG/skfQYbNYWLFKHlpG+9cOGhyzraolZ3v+1nfUAmsHF7yCJBI4LkxIWQUeEKRCrA+H/VIcY3wEHPQRTEUhumjzUGv7LkcZT8XMfCQPBmjmYEjYiyi0neeIfkaftBeES/vMkOKf68CyWUqH1AMZk88Wp/Mupz3nBl8NW0IelOlmu6RL3ZBTHnBe2VJdBcRhJrKM8gTGzQcb8ivQNuSAGrol3IdiI06TCoLIrChHJo/eS1YMWsuZWsqO+YhU/olw4YL1qF7ld772oUi8IsYW4o8Zw8bc4TjqIdm0NsXKkKC5qiizIA2UMbjd6n1efsc+m6L0AG02i9aWw54rTK3VppDQHbZZvZZREAk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39840400004)(396003)(366004)(376002)(16526019)(186003)(316002)(83380400001)(6916009)(8936002)(66476007)(31686004)(66556008)(66946007)(6486002)(53546011)(956004)(4744005)(44832011)(86362001)(36756003)(54906003)(2616005)(4326008)(52116002)(31696002)(5660300002)(16576012)(26005)(2906002)(8676002)(478600001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RXR5T1JKbENGbDQ5Yk1uOHJSQ0todE9CS0h1ejVIYnk1N0QvT3pDeEUxbmZw?=
 =?utf-8?B?a0daVThuN3dzYmcra1lYek9iRzR5S3VPeWNmbzJiSG4rUHBYYmNvUjRpZklj?=
 =?utf-8?B?d0c4R1RqWFNsYjRneHZZSHkwR2J2bk1keUZxME90WkMyZ2J2RlpPeGZjdFJ4?=
 =?utf-8?B?UHB4YjRZZGtnV2J6eXBGVGJpWkQ1bWlmRW1mNnpKNkVDMzJoK21LNUFldkxV?=
 =?utf-8?B?ZU9rTWM0QWdoOXVFZHNjcVhmbUllMDFYVkF2YkZJNDQ1aC91YXB6aFRoLzVV?=
 =?utf-8?B?NW5ud1BPY3pndTlvNWZIUXl2bGY1aUlSN2lYa0dzL3kwN2F5Q3ZWcjJteXRw?=
 =?utf-8?B?WWYvdkhDN081M2xDa1VESUpyT1FqOXJtWjFNdnR5a003V0krQ3Zlb0hSay9T?=
 =?utf-8?B?TEhhRmhESDd3TFpQTnBxNmcwZzVuQkpEWGk3c1NBRjZTNUVJT3N0MmZuQU5p?=
 =?utf-8?B?NzF3S2Z6NUVWdVpVMW0wVE1GOWVkVFZuUjU0ZklNcGpXYnFEM3Y1YVhNdVoz?=
 =?utf-8?B?TG1GdDdTTUZhelk0TURiVE9qTXBOZkliOGZ3blpSeGNURjBNMXlRckptUElG?=
 =?utf-8?B?cjdPTXRkTk5lTnJDcjM5L3BrMmcrQWxoL25tSFBKMXR5Y2dtMDB0T2FNNk1y?=
 =?utf-8?B?NGlSK3M0SUt3a2IwUmNRczNVb3p1MjBYaEhlWjRGZnE0NWJkWENkbXBzc1po?=
 =?utf-8?B?VWJYS2ovN29YTXhtSFBvNlBiWG82bnBNRVU5dVZqREJ1RExVaEhGdTBmRkRs?=
 =?utf-8?B?MXFzUG9JMGZlVjN2S0JUV2xKQTBzbnUza1NvMzJxb080RktKQzRSQ1p6NWZN?=
 =?utf-8?B?YzdZVGJkRmQyU0ZCOHZOME41Yk55WnowQlNEZkNnYnQxUUM1VmpuTy91OWJ5?=
 =?utf-8?B?YVVRS2JjZi9RekdJTzlBNXRuNitweXR0NUlMa2d6ckQ4M3FEOGtySDB6bEh5?=
 =?utf-8?B?dXhMVFQyMWc2Q3dveXpsczJ0dkFNbkNCSEdMWUIxYS9IQ0VaMEtIN1JTQXFO?=
 =?utf-8?B?UEVROVBtZHZydFl2Qjh2cDNUMHQ2MEFKNXQrajhDTWtReTNtNUNSZTFSM2lK?=
 =?utf-8?B?bHNjV1IzSFBjcGFRVjdNb1JRRzlvbVJzZ3hFUFRRK25IMERPUG1YWlo1T2Ex?=
 =?utf-8?B?S2IvS0F6biswUnV4SXBiYnVXbHFrUFhPZGpQSE1PYkNsRiszcmkzbXh3bW9w?=
 =?utf-8?B?dXRZdEVFWDlvenViZHZkWmM0dm1Kc2RSSmhsamUvckdZdHc0SnlVb0U3ZkJF?=
 =?utf-8?B?RzduQW1pV2kwM0FNb0NQV3FDWXZicG96aVFHUzErWHBxaTYyZTdGZkx0Y0Jz?=
 =?utf-8?Q?WLLb2rplFvVIc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80cb2df0-a946-4e3d-890f-08d8950779fb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 08:11:01.7942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYQvnHVYY/NRkOk9T571tzGT1Av1cuN3/3XEVLFiAc/tc+oOJKVSxMzPBNlyVBL0c9qhcctmoVVymUfYpOq99c2VyWkZuxsgKD8PqZvVuLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2271
Received-SPF: pass client-ip=40.107.8.138;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

On 28.11.2020 01:28, Peter Xu wrote:
> On Thu, Nov 26, 2020 at 06:17:34PM +0300, Andrey Gruzdev wrote:
>> Since reading UFFD events and saving paged data are performed
>> from the same thread, write fault latencies are sensitive to
>> migration stream stalls. Limiting total page saving rate is a
>> method to reduce amount of noticiable fault resolution latencies.
>>
>> Migration bandwidth limiting is achieved via noticing cases of
>> out-of-threshold write fault latencies and temporarily disabling
>> (strictly speaking, severely throttling) saving non-faulting pages.
> 
> So have you done any measurements out of it, as we've talked in previous
> version?  Thanks,
> 

Sorry, not done yet.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

