Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F762BB11B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:03:04 +0100 (CET)
Received: from localhost ([::1]:56224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9oM-0002fA-VV
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg9fL-0005nT-Mn
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:53:46 -0500
Received: from mail-eopbgr20126.outbound.protection.outlook.com
 ([40.107.2.126]:42404 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg9fI-0003gI-9L
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:53:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4+3YLR/78Vs26RLM+tLSzXSbfClKjVAFPM29bQwhg1jIIOLOkoAjROeNmCjXrbjqy3x5r8gkxbYGEzzqsJ93/Pj10i+UbBSIS4JnLN0hrn///NM5ISIyZ0BWs1KEjRgO9kc9+dLCf7m2No+fTp8IsLgWmnI20uM4YTYCPhVBzf2jB8eHUXa/n8kTqXk25I7UAE+Sb/bEn5tCqmSvpKqVznnxLpKsGgUnlKKT0cRT70D2mCpYN/NvzdGqRmY37sg+G53rEP/deKOWoFj/Rjxj+VQZuuOfUZETF06PqVns277rLeW4CYtvRH2E0G4+DNiCuSfkE4+Qk2PjRQUGyxx+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yW+4v5xmi8hBa6YqmRAA+DyhKz0GQS/MwBm85W4bjEA=;
 b=humOVR7zZELBdCDe7LeflfJea/tpbpjpO/06G+KcCvzHs/UIiK0BL707UHnPZgs+XjYaPWSO5qr1gOfLijUS6Ls6TCV2MZFSF299pJaHTVbphNews+htFjR/FAj4b6FzOPyiCVjFOGYUy9hOghb9fKptFfb7t0GOTPPdsmk8zlijdcU4l2RFf7D81dG+j9yXgUfl0clPssKTyTnG1b2Nki7rKJrEhquoIHubvQQlhwOzTNhK+aWIIZ9PrkIpbmNfi9zkEaZwg5H6UJE1xNYty4NK4FnVU14bppSnRWOKpXuWBGbEJEPKC+YMOXiEi8L9j9o7GsZQBtxLjH1TojHrvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yW+4v5xmi8hBa6YqmRAA+DyhKz0GQS/MwBm85W4bjEA=;
 b=cY8gZbYaDzwFwcuD5Rvm9dQNhYrQNSXt6wO7QouQlXzP13c/EUR9QQTeBrdNyDyNXB2TwBzN8F7Pud5b6W35Y3PcUAf0LRArnNMoucaoCWrkRa3n3mSt1FfRh2BUyMHdAFmd6BZw5wYM05bmjL2GJD2cRBpk3XQHpDNN9BqgMi4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB3901.eurprd08.prod.outlook.com
 (2603:10a6:803:c3::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Fri, 20 Nov
 2020 16:53:36 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.020; Fri, 20 Nov 2020
 16:53:36 +0000
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
 <1e35a550-a6a0-fbe2-ac8d-6844ce23b3fb@virtuozzo.com>
 <20201120150703.GE32525@xz-x1>
 <2797b4b6-b083-750f-385b-f0aa09730251@virtuozzo.com>
 <20201120164316.GC60522@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <c222b7ca-9368-3adc-00fd-5261216f7df1@virtuozzo.com>
Date: Fri, 20 Nov 2020 19:53:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201120164316.GC60522@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM4PR0202CA0003.eurprd02.prod.outlook.com
 (2603:10a6:200:89::13) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM4PR0202CA0003.eurprd02.prod.outlook.com (2603:10a6:200:89::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Fri, 20 Nov 2020 16:53:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9f53898-1f57-4462-4020-08d88d74d261
X-MS-TrafficTypeDiagnostic: VI1PR08MB3901:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3901F3AE68AB193A5690CCFB9FFF0@VI1PR08MB3901.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:363;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UQf6a6uDA2jDc0o+OtqIcmPtwvmg3dDaKpOt28+bVwa8+UvJLuI2f2GQsLNmHakty080lOUUbVfl2GFuKudJWf76peHq6WdlIIwXcCMjjXOllJpaoWb7T2EaJd+2cwg8yERMO5dq3nzLChQPfmeyVjo77UbPbEbiK4Bu0r/tZj8TOJogRKQ0su72MwwBEBiYChYAU5tJgMQ66Yg3k/rGmm1EI1B4zz8DylILjrLuYhACEcdQ+UoJX97QxGY+mHQFGK2jgS7/8f3Gn9n139FG+VwWppz9XlhQaujuiSKENhaHDpyduWWhFgiHuFgyYvNutI3WAwSQmw3jwnY9nsyLksSUS4tlVN8ne09LAPOfYaFH89P3UEyE4wirSliCcmzZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39840400004)(8936002)(36756003)(2906002)(53546011)(31686004)(8676002)(52116002)(5660300002)(86362001)(66476007)(66556008)(66946007)(956004)(44832011)(31696002)(316002)(16526019)(54906003)(26005)(16576012)(6486002)(186003)(478600001)(6916009)(83380400001)(4326008)(2616005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: AyVRh+b3Har4viOqMWtR2xPYsN6Vs0pLSb37dGI2Bj7sQpviL50LR6f8zmzk9jV99vifWiXI11rFGWi5to/CW+NsIi3wRsYOoY+8LUeb8u3JmAdePBZs+/Yu1aB21f8FPLLlxlZ5OHqy6tY45VNBIAftvGOImE6V52mhiMi7BFcIA7epevzWQmb+RAK1+z0duGjghg6ylYpyY3Vjm1eGWIY0nzlU1uU1fytoLOQAsUf6VFs5t0uKO/eUobSa+g9BAsWptY4cfh8R8/9t4Go9c6casz3Y6qBjECb30dMk6nr99YrkUc4ZXAVHvW4VWmWzbNmnidNoa9HMUWRlDjD8O4XNS3j0XO8mv+bjri1P/oKbq5R1m7N9YPbVGy4Bjh1J5yY6UX+lVGo3MtD18NmTtuytsfy3V9dfNs6dUM/nPutd/S3Sme+eaPc5Xaru5Dj4f+byF1y/BXQ9EVH2H01OQFGpA1BaAXS1t9G58nmFHRsEiDjRmZhv4muqKsB0+IruPVupf8afjpvw8DV52i36e/QL9SqM2gyC3yUOYV8PuTMEYLtu6p1TQSp2sMq2RmxrrNiL/MnPfJYn6bx3KlguDS2vIsYXmF9FTIT7u2Wl6GNYLUgCZV4ad6f+2/OfFDEX5YFfZ/Mpvc0Sv+y/qGBqwMWIr6PWPU8b68XQHMT1o4iKK5HtaOd/GOPcutPRCV4orE/mrHhTZLvdeA7lcBPqRPCUIC6zILmMxwVI9eiCVquBgSuTT4Dc0JM83Lpwqp5kCVVPTsldBF2rLV3z+fnGo2pXk5FdCZzFs/AmW6w9p2cswvZPkChJJq4Lw3vzRARMSU2vo6Yjw9ihCRefs2DYbV8JfwLwBTn9w8iLqVM4KGPrP8crHw4Fy7qvYhdD4VOZOOOsWTE9Yma2mt5Il9baFQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f53898-1f57-4462-4020-08d88d74d261
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 16:53:35.9955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 520B98D5QAx7eJQha0uK6RSpswHWVLwj6PipRpcGBki9CwmXi9d7klEr797U4nfH8+xXnyzaCrRcoaTgJAL0fO//Q2Gh+ljU+0iH8qPaxJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3901
Received-SPF: pass client-ip=40.107.2.126;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=no autolearn_force=no
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

On 20.11.2020 19:43, Peter Xu wrote:
> On Fri, Nov 20, 2020 at 07:15:07PM +0300, Andrey Gruzdev wrote:
>> Yeah, I think we can re-use the postcopy queue code for faulting pages. I'm
>> worring a little about some additional overhead dealing with urgent request
>> semaphore. Also, the code won't change a lot, something like:
>>
>> [...]
>>          /* In case of 'write-tracking' migration we first try
>>           * to poll UFFD and sse if we have write page fault event */
>>          poll_fault_page(rs);
>>
>>          again = true;
>>          found = get_queued_page(rs, &pss);
>>
>>          if (!found) {
>>              /* priority queue empty, so just search for something dirty */
>>              found = find_dirty_block(rs, &pss, &again);
>>          }
>> [...]
> 
> Could I ask what's the "urgent request semaphore"?  Thanks,
> 

These function use it (the correct name is 'rate_limit_sem'):

void migration_make_urgent_request(void)
{
     qemu_sem_post(&migrate_get_current()->rate_limit_sem);
}

void migration_consume_urgent_request(void)
{
     qemu_sem_wait(&migrate_get_current()->rate_limit_sem);
}

They are called from ram_save_queue_pages and unqueue_page, accordingly, 
to control migration rate limiter.

bool migration_rate_limit(void)
{
[...]
         /*
          * Wait for a delay to do rate limiting OR
          * something urgent to post the semaphore.
          */
         int ms = s->iteration_start_time + BUFFER_DELAY - now;
         trace_migration_rate_limit_pre(ms);
         if (qemu_sem_timedwait(&s->rate_limit_sem, ms) == 0) {
             /*
              * We were woken by one or more urgent things but
              * the timedwait will have consumed one of them.
              * The service routine for the urgent wake will dec
              * the semaphore itself for each item it consumes,
              * so add this one we just eat back.
              */
             qemu_sem_post(&s->rate_limit_sem);
             urgent = true;
         }
[...]
}

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

