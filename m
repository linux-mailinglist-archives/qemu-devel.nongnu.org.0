Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB992BA7AC
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 11:46:10 +0100 (CET)
Received: from localhost ([::1]:35978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg3vd-0002C0-4Q
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 05:46:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg3uZ-0001kP-7o
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 05:45:03 -0500
Received: from mail-eopbgr10112.outbound.protection.outlook.com
 ([40.107.1.112]:55146 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg3uW-0000OD-6W
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 05:45:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9QYPNY3FNEqxvBR3FBoYeyWHGvNrKz1XbJ4Qn+hTtLKigAMC8fMbAnqQjKJeyutiq3I9eNJCWg4YVKTwhiJwRe7d74VlqnOtrae3UldNvqJoFsu9NOxELZkdibM2iXTB/57fpp7faEMKxeQApzVs15PTEcd6LW5aAcTLk5GbPuatPntIkR3hs73wJf4SVZgxEmLb5Xy1Zn+HHfuDSdLUko8zJs5uqGVYOi7VgmEqhhxwgARbC0rYxJu5tCcPknLYvPOEtKqbWHQsDwajfgz8DWpt2HZC/BP8admtElYSiaKdnRrEQV97QIUXT6iTnHA10bgltY7UxkblLkHDPQqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QKpbKbIG5VzbF40CQ9o6bcoFOz+lGpR5qp+rL/M2TY=;
 b=Lu+rR6p1J98QcklR0QewF6m6iFffFKdpeonH+zuQxHocJKkhsofKiqMIrN9DyFSXxpSrVZ9umYMLWnzc2z0AOyyoQtTWBtcoNPbZXdOona1sex0lCw/GldyF2MwtAwGQtEWHESu+CTQU+WMWRpbkPgd139fctjhNKmypLV4GdNmTzV9rHVL9YDg3G9e6LO/cYWjxau04cesJPjnNS8IcjiBrcweOvk/HGGryCPFSt/31vVoeyUbWFC5SdJ4TKWjT8CezR2f43gfLLX4TfzuAoMwxo04hXqo1krAkXXjwyG4qHFjF7gMGtjIRroRjbl6Qd0H42vLEU9330wBSXS9YSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QKpbKbIG5VzbF40CQ9o6bcoFOz+lGpR5qp+rL/M2TY=;
 b=DMTNkiaeQAOVbgrXHrTQnXl4c9HeTFj6sXFxZv1vjwmZEI5mz0r3CPaT4qgMrEFoCHFJrlfPRfpLB1r3RKv4LPZy254mQpber75IPuNLLpQcLjIq9LQwHaTmUqE/OygutZzntGIAVKshlqfbw/mh/EB81xZkOdDMC17Sqt7QVHU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VE1PR08MB5582.eurprd08.prod.outlook.com
 (2603:10a6:800:1a5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Fri, 20 Nov
 2020 10:44:56 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.020; Fri, 20 Nov 2020
 10:44:56 +0000
Subject: Re: [PATCH v3 3/7] support UFFD write fault processing in
 ram_save_iterate()
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-4-andrey.gruzdev@virtuozzo.com>
 <20201119182516.GB6538@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <1e35a550-a6a0-fbe2-ac8d-6844ce23b3fb@virtuozzo.com>
Date: Fri, 20 Nov 2020 13:44:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201119182516.GB6538@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR03CA0011.eurprd03.prod.outlook.com
 (2603:10a6:208:14::24) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR03CA0011.eurprd03.prod.outlook.com (2603:10a6:208:14::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 10:44:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2ab7833-e7e7-482f-5e02-08d88d4151c4
X-MS-TrafficTypeDiagnostic: VE1PR08MB5582:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB5582B932F20E6549BEF392129FFF0@VE1PR08MB5582.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PTWYF8JoKTcwUVW6XsNclp6LSwDI4C7v7hZ0ZgY+d5W2LVnxck2plPSj6fjV4YoeomM4wkPyZBn5P/8V8pPRjZ9lQhTEP8WWCA59QNPyBzn7eiK+ls9ScXJXJa8I8fvI/1QwihSmjrVp+snu0yGfqhWTxdNqcEC63oh2aOegBD54BFtXAQmgu+1CLSFOfV+VVyER/elaQrheq3WkEXZaGGlS/w2vGWr6uFCfFFPzY8JkhHbuhCISXe0i5DyBOR0gtS/17ebV212jb11w8+Xquok4rFRLAoW3xlq89YIYxC8sKifWUmUmESGgYpGxAOPwVh330hghhq3xd/ZcrtMciJfLb2KO/bKJw16PsEeK9DhqQRYxDRV33K9ZuRH0f0dk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39830400003)(396003)(366004)(136003)(5660300002)(66476007)(4326008)(66556008)(316002)(26005)(956004)(6486002)(8936002)(54906003)(186003)(53546011)(86362001)(8676002)(66946007)(16576012)(36756003)(16526019)(44832011)(2616005)(83380400001)(2906002)(478600001)(6916009)(31686004)(52116002)(31696002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: aGBeemgxnbBog+sqdFEyI5nZoXrmDfutImN4U/N5pYhTS1LVdRh0/UEY34sVCJ8m615Uvgh53IbnuTocqYf/K0Oy7r9O6ED2R1ify67WysY+Cv+68soAuZU7yG+ehMilmmQA5poKTrjo7CXM4NgF05F8DJUv4B4yowXvmqzriXltBLxuDZL+UUN8fSrKckbLaKJLtjxXf7RNiU6ODo+IZox475UHp8xKW6MBOsG/afuExK4UBye7duXUyrAeEzVoQ8pSTy0oKzgohQeCQeaIncKuA7A7BjDkixv/zdoZB0VXhpM7AsaYD0Ahc6EKOWxuu/WtukO0Uyu3d4FWbAus5BkBZJRCVRvbUb+RgG2RNcfSRMtIzbHIPOaVCOnUiVo8xEF7Z5RNp3Q+Q541c8WeAKxcH12nsAAMCwVH8RR9dVLfdOzu0wbzN70mOE2GlbpqvuPt34uu4mScQYJYqZBjlkzOw5QoNw3btb2YCI91t+sOOH5BkYlNpoM3Bw14EsKlT2SGthFK1BM9a63YzLnt8SzUICih4EYoYDppdkQXq75e3piWR3sOjpG1WTu3ayheRQll6GthM/vMVP6NIXC+glGFCQov82s5xV78eybCSAy/3bTnGSEVowGk4hG8q+Xg3YisbHLRM0HkA9OZ/Ed3DQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ab7833-e7e7-482f-5e02-08d88d4151c4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 10:44:55.9518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJX2anywjYZRCeLL7MHPO4vllhVx5ymwGI20mQP8xR81JHPKCztn3fPGJrROURTJ7KF1vDXk0lVQh6YOTgkjdHQYdFw76/m/T1wALWlB1Jc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5582
Received-SPF: pass client-ip=40.107.1.112;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

On 19.11.2020 21:25, Peter Xu wrote:
> On Thu, Nov 19, 2020 at 03:59:36PM +0300, Andrey Gruzdev via wrote:
> 
> [...]
> 
>> +/**
>> + * ram_find_block_by_host_address: find RAM block containing host page
>> + *
>> + * Returns true if RAM block is found and pss->block/page are
>> + * pointing to the given host page, false in case of an error
>> + *
>> + * @rs: current RAM state
>> + * @pss: page-search-status structure
>> + */
>> +static bool ram_find_block_by_host_address(RAMState *rs, PageSearchStatus *pss,
>> +        hwaddr page_address)
>> +{
>> +    bool found = false;
>> +
>> +    pss->block = rs->last_seen_block;
>> +    do {
>> +        if (page_address >= (hwaddr) pss->block->host &&
>> +            (page_address + TARGET_PAGE_SIZE) <=
>> +                    ((hwaddr) pss->block->host + pss->block->used_length)) {
>> +            pss->page = (unsigned long)
>> +                    ((page_address - (hwaddr) pss->block->host) >> TARGET_PAGE_BITS);
>> +            found = true;
>> +            break;
>> +        }
>> +
>> +        pss->block = QLIST_NEXT_RCU(pss->block, next);
>> +        if (!pss->block) {
>> +            /* Hit the end of the list */
>> +            pss->block = QLIST_FIRST_RCU(&ram_list.blocks);
>> +        }
>> +    } while (pss->block != rs->last_seen_block);
>> +
>> +    rs->last_seen_block = pss->block;
>> +    /*
>> +     * Since we are in the same loop with ram_find_and_save_block(),
>> +     * need to reset pss->complete_round after switching to
>> +     * other block/page in pss.
>> +     */
>> +    pss->complete_round = false;
>> +
>> +    return found;
>> +}
> 
> I forgot whether Denis and I have discussed this, but I'll try anyways... do
> you think we can avoid touching PageSearchStatus at all?
> 
> PageSearchStatus is used to track a single migration iteration for precopy, so
> that we scan from the 1st ramblock until the last one.  Then we finish one
> iteration.
> 

Yes, my first idea also was to separate normal iteration from 
write-fault page source completely and leave pss for normal scan.. But, 
the other idea is to keep some locality in respect to last write fault. 
I mean it seems to be more optimal to re-start normal scan on the page 
that is next to faulting one. In this case we can save and un-protect
the neighborhood faster and prevent many write faults.

> Snapshot is really something, imho, that can easily leverage this structure
> without touching it - basically we want to do two things:
> 
>    - Do the 1st iteration of precopy (when ram_bulk_stage==true), and do that
>      only.  We never need the 2nd, 3rd, ... iterations because we're snapshoting.
> 
>    - Leverage the postcopy queue mechanism so that when some page got written,
>      queue that page.  We should have this queue higher priority than the
>      precopy scanning mentioned above.
> 
> As long as we follow above rules, then after the above 1st round precopy, we're
> simply done...  If that works, the whole logic of precopy and PageSearchStatus
> does not need to be touched, iiuc.
> 
> [...]
> 

It's quite good alternative and I thought about using postcopy page 
queue, but this implementation won't consider the locality of writes..

What do you think?

>> @@ -2086,7 +2191,8 @@ static void ram_state_reset(RAMState *rs)
>>       rs->last_sent_block = NULL;
>>       rs->last_page = 0;
>>       rs->last_version = ram_list.version;
>> -    rs->ram_bulk_stage = true;
>> +    rs->ram_wt_enabled = migrate_track_writes_ram();
> 
> Maybe we don't need ram_wt_enabled, but just call migrate_track_writes_ram()
> anywhere needed (actually, only in get_fault_page, once).
> 
> Thanks,
> 

Yes, think you are right, we can avoid this additional field.

Thanks,

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

