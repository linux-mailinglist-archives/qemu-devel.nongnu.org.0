Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACB538CA6A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 17:50:59 +0200 (CEST)
Received: from localhost ([::1]:60810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk7QQ-0002KH-3l
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 11:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk7OE-00080T-AT; Fri, 21 May 2021 11:48:42 -0400
Received: from mail-eopbgr10124.outbound.protection.outlook.com
 ([40.107.1.124]:65152 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk7OA-0002c9-AD; Fri, 21 May 2021 11:48:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+imWTv3x7zznuTyV5AfHQf8T5PV/e54zAwAX/+Ar8ulboWf7NhEckxIfbtyCPMzwLLgThP5qQaAa5g1+pYaFSIb8MsUnMVpH1VNQKIuBiG2sxvtgk6vEWBHFkncr9vipIqrL5AyW7xq+C5C1AIhy5JrVqSp/ZaN+uW8DwW2UQf2STU0hazbgR/Ub6i9Amk8kAdnBtLQC6ueT6r0YoneYVrsWhh5vp+TxpIy53NWE5wdEsCyKaXsiweYOejGZljNUvFI4a9j38qsmqlV9/raLFzfpnt8y2G5u2Qx4qnjYQxd+sjPhCfW/KaSZVDbFHAKrpTE+U4qKvTH1Y/LdzWs5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9m2IdG9GpnNk+y8bj9jh7YQv6xAHSTcqczgQuWZeMU=;
 b=Snqe+PBhL7B+bTjnJPpQWuvjgC5z6aRszj4fJBUkB4ZwlCthQkXpCklGOcLZKup/XC/p6XM8ccwZUvWukPvcTibFZAc+JgHOpMZawkOSzR7aojURRlcU7bZw9ayUnIWVJ5vuEivCAn069RFlfU1ffxA0YBSshSVecl5y5uHy4eMpQqhohPTr42PX/PGH4GUcrryJGpi+JryGNNARh4Rq/LSjJmQcKu9KJ3uh5/lWZoRBlJN0TR8b0kSRRAP3nv+VEWVXMuDLcwhCeTRXzln3FVQ0ncOqh9dROCH/BuOAfAkK7adiGICu0DKsL3I2dYXe6W+cZR+ESDgF1O1yaxO1rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9m2IdG9GpnNk+y8bj9jh7YQv6xAHSTcqczgQuWZeMU=;
 b=XJwmmSTx8Mpa/KSHSWxtFhZwVfsXJo8A82qnN8hKb1aXZU/NFdic0G4pgOAsjcUGwLVTVyNk+BhSYussE8CKX9Ui+lsg2KXxYo/Xu0GfROtzNR4Ot6eOKUI/+OOJAX61EgSPZAg1OrIC94r0mnsDdl3vS0Xe6mHJvekxplDihKo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1716.eurprd08.prod.outlook.com (2603:10a6:203:39::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Fri, 21 May
 2021 15:48:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.025; Fri, 21 May 2021
 15:48:34 +0000
Subject: Re: [PATCH v2 1/7] block-copy: streamline choice of copy_range vs.
 read/write
To: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-2-eesposit@redhat.com>
 <f5069a9d-cd23-26cf-c1cb-6f4f5774e48d@virtuozzo.com>
 <5a4cc9ae-f419-ab40-cd7a-d30e39f91e54@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5f93d053-0370-a179-0c81-27434430fd43@virtuozzo.com>
Date: Fri, 21 May 2021 18:48:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <5a4cc9ae-f419-ab40-cd7a-d30e39f91e54@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.197) by
 FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.12 via Frontend Transport; Fri, 21 May 2021 15:48:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b37a1135-3e63-4a14-65bc-08d91c6fe3eb
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1716:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17160AB5967753BC20FFD2B5C1299@AM5PR0801MB1716.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V6Aut6QmQz8dpLXF1lRYlwmWPLvJZWT5o8vFJKicNmQU/gWGdO4+l479m7mdBDxcI2Fh344zDOWpF4xy1sznMTCdKLaOzOmzPKrpawQjH3i7b2nKDSsa74aQirFEeqfYawggsg7JVBBuXRd9NasW9s/nAiXRE4Omcf43VMY/pp5MHrQA5bkW3DMjBv6cuOGP35dSbaKqg43vzql7XZMRxJ3wc6bjvKXng/cPpUbF+Bl0J//Phjtv+WqGpQA9Hain/Ak6rZwW0gYLhpWxqPsWb96UYGgc+sxWrZMuU0kogicyfZFIpYn48ejvCINSw12Munqg9nJ9ZpEOSnSlHWWdirfT8MkEZhkHNOQLjUrZlA9oVcWNUMmFeQzzIe0HunkP/YgOTYLaBHKj4wZqEOxRBylIpfXT0HlPqUakSeWAqh6E20IbQLsjULChg63wiV01yxT3nvbcEodK6Ss7PvnzQXaA+GrnD8/2D4mEHQ1kWCM/Aubr56sJrbsLqNAm9v4PBYNCX0zJ9xeNEk6l4uVKNPGk10qJn1VYRcAarB20lujomnqpr5Y9Y/K/NFeXc9fwmx8CcoPH+xsGlwY2R/gE4nYz4lI2QXeYIaXa2UQxhdqeNejscY/w4p73gxbm72Ax2aCaUSMWd/rakjptZwOdGEISefrlLd6youUDHNct+O0r7dOEB1U/l552yJPWbx/amD8/lGoGwnsfMEftGT0vRzs2t9+AaS0ba3KJFkahGOM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(39830400003)(396003)(36756003)(478600001)(53546011)(16526019)(186003)(4326008)(8936002)(5660300002)(6486002)(26005)(956004)(2616005)(8676002)(31696002)(52116002)(31686004)(38100700002)(2906002)(110136005)(66476007)(38350700002)(66556008)(66946007)(316002)(54906003)(16576012)(86362001)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ajBSNkJGQ2J3N29UR0NzVXlVS0VWQW5qU3Z4ejliWExXaUUxRlFNd0l4RndU?=
 =?utf-8?B?RGRFZUE0M3pLZXNQU29sVmwwaW03VDM2VnE4NnJweENLWFlnRGlRM3pJTWFz?=
 =?utf-8?B?TWRCR0ZOUis3bEZ4VDNkanZNTGxyVHd0bmtNSXB5akZVQkhXdU1xMHBrUkJH?=
 =?utf-8?B?dG8zaHhTYlBnNGpWOUVVVHpWdU5SU3RuUU01TGRXRklLK2o1UkFtSFY3OVB6?=
 =?utf-8?B?Y0U5VUR1Y05Sd2w4aWJJNHluNGxiZVhSdnV3RVpBVnY4aWxNYUd5MXgxVW0v?=
 =?utf-8?B?RU5xOUdHdzJtaTdGdTRjdCtiTWw1dmphcm9wMzlTVGovY2tkdDJMb0dMZkpN?=
 =?utf-8?B?M0t6aVBIQnQwL3VzQUlYRzdZNWNuZmdLbGxYYUJxczBRRG52OFRDVzNxUTFl?=
 =?utf-8?B?TG1VdDFLUHk1c3dDazFBT0FBWEdBa3p1NHpSQStjdUliTGJmeXpXSU1pZkx4?=
 =?utf-8?B?anN3UXQ0M09zV1NLbGt6Z1lGWjBNN1JhMzRnYnVONitmVjZMc0FUckhQNUM5?=
 =?utf-8?B?YU54L2hDTnZCczdRbjJncDN2YXcwTjdBaXE0Qm50dVMxc09JcjY5Z0o1RTE5?=
 =?utf-8?B?M0hKaDJ4aGZWdWpraExqc2loOE51Q1BPaHBPb29ZMlF6VGFzdENUUXhMZ3Bv?=
 =?utf-8?B?eUU3VUcrOHZ5NlB0STlRQUEvOG40QXFkajZWMFJDdlBWNG1ZUWdpWlVPUzc0?=
 =?utf-8?B?WmlmcWRHL0tLdHo1eGVCaG5BNGhvMTNUczc0UzBGdGExL1VXM3NCTk5vZW5G?=
 =?utf-8?B?bldLVU50bXFIVkxPaVJ1YlJJblR6eWQwemhzN2JVd0pUME81SXFHd3haZVNV?=
 =?utf-8?B?RUlIQjVQa3F2dlpnMVlqVUFoTDg4QzZEVW9qUXFsU2NpZ296SnlNMzN6eE5G?=
 =?utf-8?B?bE1EYXhoU1lTcnV4UUxlK2hxYnZQbzdNRFpYQm94OXZKTmtkUVpzNndTMmVh?=
 =?utf-8?B?aHNRdDE5TUtYTzZyVnY0QlMwNWpMb2V6KzFJUFpjVzM1TzZSbkRvYjVZME9O?=
 =?utf-8?B?N0s0Wmh1dzNoeUkyNjJVbGhYQmlVZWt0MnFGQTJjRWU4NXZTVlFYSm9MMFVx?=
 =?utf-8?B?UGh2a01YVFVIUlVNUG90K2lVMWxvQzhucXRRakg4bnJxU1llNDV3bktaK2Fq?=
 =?utf-8?B?eVVZYmNHeCs4Z1NiOFRTWG82Qmt3bVRzQjhPajVIWUdsZUREZjhVSm40UDE0?=
 =?utf-8?B?dVhTZStvTVhrVlNLWEphVDR1eWhBZi83YzFCV2thNGFyMGRpTXUvVVRtRU1l?=
 =?utf-8?B?TE1RcDVkb0J3ZEJkL0FYSjlUZ0dCQnZzOG1yZGtUV2IyRmk2Q25YcXdWR253?=
 =?utf-8?B?akVLejZ1dVFDWU4vWWd5cVBvdTJOTEdza0swcGdpQXJ6SFViclhHZHdZTTA3?=
 =?utf-8?B?Slk1d2ZZV3Qzb0lRV01xMXJ4dWZ1RVJONlAwd1RucFFvTUpIeUVxSjNWV293?=
 =?utf-8?B?eG5ic09EaXU2VStnM3FWUi9QQm5SNEFxNUdPc0FqZmpUT0svSkNRVW9nUExj?=
 =?utf-8?B?Zm5wdHhJcEc1UzE2bVFHK3Bla040cXVVenhCK285bWpSMmhybWhoQUE3cUFr?=
 =?utf-8?B?TWdRODN6dWZRVjBlcTNDRHFEOGxnWGxRdFUwdnVNc2EwVS9pZDVDTk05NUhN?=
 =?utf-8?B?VGJHamltcUNGNGQ4bzRUQStYTVc0a1FuMDFHc3lQUE1YdG4ybk9vV1JDdmVX?=
 =?utf-8?B?SCtLaTZUNERYSXk4OG9iU3luVHIwbzlIaVhuL2NNZ1dYRHVZSFlNQkhLMVYz?=
 =?utf-8?Q?hfhJU3+cKnX6Vs5HGSqjoLGXFp5ufGpAaQpnuAx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b37a1135-3e63-4a14-65bc-08d91c6fe3eb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 15:48:34.1543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UmbFFaMz3GdPhQlqGbB7f+FuwzjHpqMq/IUQ1WkjGY+NrFpUVGQZlLCdaVKYKbiL4x604iqaKBJV0j1jzockqj+0C5wt1Z3If+IFlntDQRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1716
Received-SPF: pass client-ip=40.107.1.124;
 envelope-from=vsementsov@virtuozzo.com;
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

21.05.2021 18:10, Paolo Bonzini wrote:
> On 20/05/21 16:42, Vladimir Sementsov-Ogievskiy wrote:
>> 18.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
>>> From: Paolo Bonzini <pbonzini@redhat.com>
>>>
>>> Put the logic to determine the copy size in a separate function, so
>>> that there is a simple state machine for the possible methods of
>>> copying data from one BlockDriverState to the other.
>>
>> Honestly, for me 4-state state-maching + function to determine copy-size doesn't seem better than two simple variables copy_size and use_copy_range.
> 
> There were six states before (2 for s->use_copy_range, three for s->copy_size),
> of which two were unused.  The heuristics for going between copy and read/write
> were quite illegible.
> 
>> What's the benefit of it?
> 
> Less duplication here, for example:
> 
> +    if (s->max_transfer < cluster_size) {
>            /*
>             * copy_range does not respect max_transfer. We don't want to bother
>             * with requests smaller than block-copy cluster size, so fallback to
>             * buffered copying (read and write respect max_transfer on their
>             * behalf).
>             */
> -        s->use_copy_range = false;
> -        s->copy_size = cluster_size;
> +        s->method = COPY_READ_WRITE_CLUSTER;
>        } else if (write_flags & BDRV_REQ_WRITE_COMPRESSED) {
>            /* Compression supports only cluster-size writes and no copy-range. */
> -        s->use_copy_range = false;
> -        s->copy_size = cluster_size;
> +        s->method = COPY_READ_WRITE_CLUSTER;
> 
> and here:
> 
>                trace_block_copy_copy_range_fail(s, offset, ret);
> -            s->use_copy_range = false;
> -            s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
> +            s->method = COPY_READ_WRITE;
> ...
>            /*
>             * We enable copy-range, but keep small copy_size, until first
>             * successful copy_range (look at block_copy_do_copy).
>             */
> -        s->use_copy_range = use_copy_range;
> -        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
> +        s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;
> 
> where it's not obvious that the two assignments to copy_size should be
> the same (and they're suboptimal, too, since they don't obey max_transfer).
> 
> ... plus...
> 
>>> While at it, store the common computation of block_copy_max_transfer
>>> into a new field of BlockCopyState, and make sure that we always
>>> obey max_transfer; that's more efficient even for the
>>> COPY_RANGE_READ_WRITE case.
> 
> having a function makes it easier to spot slight differences that are
> just bugs, such as this one.
> 
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> ---
>>>   block/block-copy.c | 59 ++++++++++++++++++++++++++++++----------------
>>
>> stats agree with me, that its' not a simplification.
> 
> Stats don't say everything.  Not having something like this:
> 
>                  s->copy_size =
>                          MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
>                              QEMU_ALIGN_DOWN(block_copy_max_transfer(s->source,
>                                                                      s->target),
>                                              s->cluster_size));
> 
> in the inner loop is already worth the extra lines for the
> function declaration, for example.


After my "[PATCH v2 00/33] block: publish backup-top filter" copy_range path becomes unused. I keep it thinking about further moving qemu-img convert to block-copy. But I don't even have a plan when to start this work. So, if we want to do something around copy_range here to prepare for thread-safety, let's just drop it for now as unused on top of "[PATCH v2 00/33] block: publish backup-top filter" (you can take one patch that drop copy_range support in backup to your series to not make a dependency). It's not difficult to reimplement it later.


-- 
Best regards,
Vladimir

