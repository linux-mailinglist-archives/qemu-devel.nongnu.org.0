Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AFB2C7F82
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 09:09:35 +0100 (CET)
Received: from localhost ([::1]:59094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjeFZ-0000Fu-Tm
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 03:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kjeE6-0007zD-6m
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 03:08:02 -0500
Received: from mail-eopbgr80091.outbound.protection.outlook.com
 ([40.107.8.91]:9216 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kjeE2-0007Lv-KI
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 03:08:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJlbUOlcf3tpdhtr3NoN7iD8R02LwyV2IvNvFC+S74rFbhVuCJBoGsJ2KExumzC6d8C30dQM5Xi0U8qr35F10Sk85tDngRWZ1JVf49uEyiCNtzeRu6+cV2oEUQTQ6HayJ98OXAylyM7d4tCw1HiRC9WC3nPyvPizmwqtWXeM+9k1cL4OKnC6KTh072SO6eJTO4odx7tC6XdG7hkVIoJaOlDCuk3uBnP3oYsw90cYtOJ7SLH9dHoUx3KqJGM5ZFpvjUJJatW/OYLF6+EVpGRvo2zFapb+irlCP94v1knym4dAMSPugplAQ/Wqv4w4sYBLlw8FrX35FdjBV1SVrwR4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iche/982rQiHEtSDishV3KGtpreAQzPRvt5qDNelKac=;
 b=KwXLuIgdx9H3iZQX3JCRK80PxGbe0n4cfof7b836Ok2EpgXHsk3wGbipGRTQMk6+zMX3eUwe8CPAWqK5VP3wJDgUmh9ARcEdwJbay+spIsmTAtGWCBGDCrmagHyMu6UKU0k2R4AQtwGWXXCF9vxanLPeTpcbrVe2kkmbW4c4gno6N+/Qj8AHEq53RiKRRxpiiMbhw0zEhQscmZ3giI41mh11dzFfujELqwGT5nXVCrl42bTzPFd8FaUTbqh9PwhialWlJ5oCOKgBa4zQKaoKqZKTSx+vFlh8qVuKD+pa+AqBJl+YBhpquxEVO7IKc0ry5mj7WoImYUublEsRWM/4mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iche/982rQiHEtSDishV3KGtpreAQzPRvt5qDNelKac=;
 b=m6kPNlRtPuA56wO7juelmjmz2BkpSuPW+8wFjj/fGe7suaYx5BtHm7Jpv6MoqzSTithZF93ztUNaQgTh1ZxBQfSZrCzRnWCLCHE2Pbg1jsJvwCtixpFrHTwLK2X1a8iCGR2AWeSm8WY59Ntv5tF1M+CJjFTgeF4M1PhxvDUqnV8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR0802MB2271.eurprd08.prod.outlook.com
 (2603:10a6:800:a0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Mon, 30 Nov
 2020 08:07:53 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3611.025; Mon, 30 Nov
 2020 08:07:53 +0000
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201127220416.GH6573@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <c4d635b1-5806-a51a-2b9f-5b6e9b8f2de4@virtuozzo.com>
Date: Mon, 30 Nov 2020 11:07:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201127220416.GH6573@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM3PR05CA0102.eurprd05.prod.outlook.com
 (2603:10a6:207:1::28) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM3PR05CA0102.eurprd05.prod.outlook.com (2603:10a6:207:1::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 08:07:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77d20de5-7883-4e71-93dd-08d8950709b5
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2271:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2271B50B9765375B2D4E08969FF50@VI1PR0802MB2271.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0mpG9di37KkN/GxvtrcnUKJuGGMtwTiNkaiKENSj/fcSH+Klx50gZOs1rZiTOpHuauhAUPsOcbrnD0JC81VsnWfF8tf1r72VFm39eXS2WuBoq/5usIRsxgbDl+kn642tWybxSQqJd/Cq+YNYpUgBIc8Aaz0RlJPKmEQb2z6AEmio4vxFs6SFBuP1ao1aDoLckpFW60pnWJ/ydzi57THqOPVapLGltTHZbAfyLnpRC42kC/hfoxYGqJhLItZsrbVLh2QKiI/3YzfgBCdrQ18NcIxHyoX8oQ2FI+g0SgbMCKr8tn/T+X0TKmA2me6CQCbn1rcuqaBAhe9Ix3HoJW+yTM2XJot/mE9dnub+ARQoxIqFQBgPWzxGvlsFZn7m88Ps
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39830400003)(396003)(366004)(376002)(16526019)(186003)(316002)(83380400001)(6916009)(8936002)(66476007)(31686004)(66556008)(66946007)(6486002)(53546011)(956004)(44832011)(86362001)(36756003)(54906003)(2616005)(4326008)(52116002)(31696002)(5660300002)(16576012)(26005)(2906002)(8676002)(478600001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NnlQMW5lL3BBdDNYSThZYkJPTldvbDNQdkRVdUdEcFNaT2NLbEZkZkdWeTU5?=
 =?utf-8?B?QkJzMStWUlVNclRMcW1hNHRXVkttTE8yWHpIN2pIb2ZxQ3dNSU1wRFJ3bFMx?=
 =?utf-8?B?UmlUTDhlSFhQdHNSeWJWUDFzVkxSQlVuejJnTHpZb2pWemZVTkF1VDFXNVgv?=
 =?utf-8?B?YXJRcWNNM1RaSW9yZ3hSNWxKTk5NZGZpUTB1dFQ1NHR0bVJ0SXA2RzAybUY2?=
 =?utf-8?B?TkJpbG1zVU5lS3J4U2hYZ0EzWHZ5aXh5ZnJtUXRDSnJ1OWEvQnp4U1Fyc1VI?=
 =?utf-8?B?djUvV3NUb3NjWkw1S1RrS2YycW4yWVhZYlZPY1dxTTBjVEZTaHlpS25rQlUv?=
 =?utf-8?B?Q1UzL2FCSWh0RHdIMG52TGNJZmpHQ3lZYnd6bU1aL2F3NGx4YzBsQWwwRldJ?=
 =?utf-8?B?TUM0QzIvUU5PRGlhdWJQM3VpV2lhY3dFaVM4Y2ZISEd3am1pUWk1Zml2czV6?=
 =?utf-8?B?ZDRqMnhjazRBQndqbmRyQ083bmtpc3dzZEZlSmMyT1hlbFVCcUFjL01pVVJp?=
 =?utf-8?B?c3MvcjQvZXN4My8zUmd3eCtFdU5STlNNSURaUjNEcUUrMlVKT1JjeWlvamE4?=
 =?utf-8?B?UW1aT1JKZjlhaTVvSWNBRWJtOWtkT01uQkpxeHJEUndLazg1M3Y4djZGM1Ro?=
 =?utf-8?B?Z1hBMmFtSHB3OHBtaVBSMzQ3Mm9pSE85d2Z6UFZHUXdjaXdwMUpsaCtNY3dV?=
 =?utf-8?B?YXFBQUpQZWU1MUxEb2ZnQ09LbWxCcTNHazJPRm8rRkFsbS8yYitlbm1zc1hW?=
 =?utf-8?B?MmJyU2M0REVqN1hVUnRBOGhCMENQTCsxMExvaW41WFh4d004d092aGtJZ3RD?=
 =?utf-8?B?Y3ZEZzdMemtjY3IraGk2TUxTTkZETmh6MVorZFFPTTJuUGpmTi8zUG5adkty?=
 =?utf-8?B?QyszQncwUkF4RGRBQjIxc1hUQ1pFWEpkQUJ0YW51UnpkZWk0OTFuR2xXREpx?=
 =?utf-8?B?c01mUmExNnkxZEJ3YWdEdlUzU1JIQThxUWVJR2dYcUN5VE5KUXJTZG9MMEVI?=
 =?utf-8?B?RTBGOFpYWlZEQnRwNTJHRnNOUmRnZVlab1hXdU1oYnc2NTl3MUhIQ1hJT1Y2?=
 =?utf-8?B?aE15QmdKL1phOFRLaUdJQTY3bXNCbVhYQzVDNUs0ZGF6OFEyZi9Uc2cvVnpS?=
 =?utf-8?B?ZVIzK3B0SGw3aks5VVlKTk5Yb2YvTHZaTmkzMkJnZG5FRGN0aE0weHVIZEsv?=
 =?utf-8?B?KysxeGRqZzZEVWt1Y3p0OHE0V24xbTRwL2FqS0F4L2pQcUFwZkNoK3NFTE91?=
 =?utf-8?B?MlF0cGtVQ091c2dQZ1hlc2prSHJTeUlWR1N0OEFtV0NDY3NkZVA0OW9CQzdY?=
 =?utf-8?Q?u0NFG6EcvIQ6U=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d20de5-7883-4e71-93dd-08d8950709b5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 08:07:53.4748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKIafb8Y1e4Wmz5WF1c/3x08QZ6eIHytOlVu5v3EA4uoUpH6qKern8P1VXxzb1tGgPfgfTdWa4D7u7MlOqTufN74Tn7l+OCOxFDp1PzHtjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2271
Received-SPF: pass client-ip=40.107.8.91;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

On 28.11.2020 01:04, Peter Xu wrote:
> On Thu, Nov 26, 2020 at 06:17:28PM +0300, Andrey Gruzdev wrote:
>> Changes v3->v4:
>>
>> * 1. Renamed migrate capability 'track-writes-ram'->'background-snapshot'.
>> * 2. Use array of incompatible caps to replace bulky 'if' constructs.
>> * 3. Moved UFFD low-level code to the separate module ('util/userfaultfd.c').
>> * 4. Always do UFFD wr-unprotect on cleanup; just closing file descriptor
>> *    won't cleanup PTEs anyhow, it will release registration ranges, wait
>> *    queues etc. but won't cleanup process MM context on MMU level.
>> * 5. Allow to enable 'background-snapshot' capability on Linux-only hosts.
>> * 6. Put UFFD code usage under '#ifdef CONFIG_LINUX' prerequisite.
>> * 7. Removed 'wt_' from RAMState struct.
>> * 8. Refactored ram_find_and_save_block() to make more clean - poll UFFD
>> *    wr-fault events in get_queued_page(), use ram_save_host_page_pre(),
>> *    ram_save_host_page_post() notifiers around ram_save_host_page()
>> *    instead of bulky inline write-unprotect code.
> 
> One thing I mentioned previously but it seems still got lost is that we don't
> need dirty tracking for live snapshot.
> 
> A few pointers for reference:
> 
>    memory_global_dirty_log_start()
>    migration_bitmap_sync_precopy()
>    memory_region_clear_dirty_bitmap()
>    ...
> 
> These should not be needed.  But this can also be done on top.
> 
> Thanks,
> 

Yes, all off this is really not needed. At least it seems that enabled 
dirty page logging in KVM makes not too much overhead and 
migration_bitmap_sync_precopy() is called only once. Let's do it on top.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

