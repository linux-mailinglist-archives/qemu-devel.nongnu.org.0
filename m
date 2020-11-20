Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FA32BA83B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 12:06:18 +0100 (CET)
Received: from localhost ([::1]:43202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg4F7-0006gz-Fh
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 06:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg4Dn-0006AJ-Tp
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 06:04:55 -0500
Received: from mail-eopbgr50109.outbound.protection.outlook.com
 ([40.107.5.109]:2990 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg4Dk-0007Jw-DD
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 06:04:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QN+IsnFF79mbwcC1IV3/KuducOktEEJP5dUNPD+OjtLYtCmzgq1EXzwNJlHpE3Z2jvdEL4JYNW7roJtboDAi64jNGhhD7ULRrdu77pQWmcBq2HRAkG7lHcSnlc2XN8BwL9lgW602e7NzWQ1g78wQPgXVXk2+pOEtq6YzD6EplvPZFxHh/oYSsygIwYNW6iWLyNnfzuPdPpDmLEURLXRSvouywLjlKMO7YF7lhwhWPhgufU+tf4TfzgqSoXHaqV2FQG0d/VmFDuZGYutBNQV/J0zdUxgaA91axaOHuHwgsTit39eudC/ncgZgvDZ4B3nHabK+kd3/D8IoFjB3giFcpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BU66VIqKvTHThK+unRy0obIe5KXYksxc0HQ5N7WWx4U=;
 b=WovVgk0N01ww62y73ktxNHu1LMTPzgb9APF2tP3Of8MmK9srszRVeVtFNf1lNNEHfoPtr5V5XZC+yKz79fCDlRPPZyg3lAzgPGpKXhMlkcOb+FuTYASvJC1ReY4sN8iCjZO0/vBlK+BqkvwpTCvp/rZkeEH6iWvROdezO2Foo/iq5yA4vptXK3G/pRa/WkCd7qFQlvJIVOm5LxkzRw6eBU04H/ZDfI63cHdqEMoyd8A6kw6mJSa4MAFuexV/UID4TtcowbIFGh6c1Nw2QSs7EKPjKyhQDCu+iStgSPTjLlZc+UaSAhQVWdWn5/WKI3IveBYmWVhFWbU1aVDnQVuYVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BU66VIqKvTHThK+unRy0obIe5KXYksxc0HQ5N7WWx4U=;
 b=tDsRyxVEQS8RqkoIdBvpKZum1CuuqkdKPwrNW//zvG1iscVwc6iKjtVCmihuDm0Dxvg/WreVvXvk0LGhMbnsfg1QwBe8tJhnRM8NZfsNpUsW8k6BoilR+lwpaom6J5mbPTp4RSFrnw3+3udHRUADkOmk6MTDudDKTia0q2gBLEY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VE1PR08MB4719.eurprd08.prod.outlook.com
 (2603:10a6:802:a6::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Fri, 20 Nov
 2020 11:04:48 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.020; Fri, 20 Nov 2020
 11:04:48 +0000
Subject: Re: [PATCH v3 2/7] introduce UFFD-WP low-level interface helpers
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-3-andrey.gruzdev@virtuozzo.com>
 <20201119183902.GC6538@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <8eb862a9-90d3-e3ea-5bdf-50287ce2226f@virtuozzo.com>
Date: Fri, 20 Nov 2020 14:04:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201119183902.GC6538@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR06CA0127.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::32) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR06CA0127.eurprd06.prod.outlook.com (2603:10a6:208:ab::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 11:04:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f0bad3d-f5f2-4115-7187-08d88d44187e
X-MS-TrafficTypeDiagnostic: VE1PR08MB4719:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB47197A8C271E4D6281D550C19FFF0@VE1PR08MB4719.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rFb3UxHnuLbxVAX82GWBJDQpCyW+n1ollfk34hImNnqdgVY3A1JNN5dZjk0L2k4dQ5/LEd3J5mHmmxfsXdZgWxoG8TnBLjNq5QYDaNxRY0tTF/rs3JqdBPZfPRJan6FI/lV8lEln9xU3bqqocH+sKRSbMS+LiCnVkF1wHHo+RWUIxVhZhnAYE5xUA1RbSWGGv7AlBXRaJIckl0wmNpPAy8wNRWmZjlOzUdsJThsO1Ls3xakuHq3OTH9avYg1y8scl6l1TjWh00KmeI9Mw7qSzu1Pl1wPZgnVoJXiRe8g2bcAtwRXXv99spOHZUnOr8wy3jUgCJQe8TMHnkIVBaI7TchGt/koKdZx1a/2QjNWdov7jw1W2VojCluaJgffARJP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39830400003)(366004)(346002)(136003)(4326008)(31696002)(5660300002)(52116002)(8936002)(83380400001)(2906002)(956004)(6916009)(2616005)(44832011)(66556008)(66476007)(26005)(54906003)(53546011)(316002)(66946007)(8676002)(478600001)(16576012)(31686004)(36756003)(86362001)(16526019)(186003)(6486002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: GXbzAceYfwc66iOYzY+BW2L3ipeqFhMMLroXIOwnVUAHLDRad4ETjEJ1xwO6hj3+lIVVRssmq2t+QdDB8CA0pg6yAYIlGOGNDAqjkeDjX1ejpJICM5HtJ19LKnzLGPTWm0nX+M72UUeh9JmIXA7R7SiHLVvgHycuJoniLOknKZlLz6KZ0LDJlcSFEnc5zznZuCMSsV9RK2DXWR43jvrnoEHlunHflsyKjW9pwCnOrsfTLs04GGKup0D0ZqcBiCPeKdgMAjbt+4zBMQx8zdJY2dGqTfXbW3J2Q9o1WBwo0wwenOtG/03L4r7KZusGSFQB97PjQZCBJ+pMkTwIu3J7AczPySfO+JiUJk73GbjYzurppCLopwGZp8vP10AgayQiCCFlY/qQ10lVVdaYreYk9YPu4l0mRBAAdsGoUlyRNsxJPOg2DYqMvSYA9CMdgjMtPDzDc5IYjb9yJbsQhjKAqGyqu4j123KOLl2al4pR+JBNPdjtMvQlyGdegraeQQI5g8yzaknmPzTVwSlYSGA4WT8GNhj6I5pEy5OGHn3fYX2tHSGn1cFR5oCqIXNWnb/5T8OPISE3tnbHnKn8WrSsXGhZaYju7gYgRASgCS3N+tbDlVCgPfKJAn9EPAuPdIx1cipJyveENwL8kKmS6hdm/Q==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0bad3d-f5f2-4115-7187-08d88d44187e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 11:04:48.2986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8YC0JCZOdcP4Mke7J+r9XiJZBc8xLvMg98TcnBKGg59jZLo3tBmBc5WVufJk+VEozPPyoXXjZLYVGZqnUM1sEz9wAAX3xkGLcwItQyJ1cA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4719
Received-SPF: pass client-ip=40.107.5.109;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

On 19.11.2020 21:39, Peter Xu wrote:
> On Thu, Nov 19, 2020 at 03:59:35PM +0300, Andrey Gruzdev via wrote:
>> +/**
>> + * uffd_register_memory: register memory range with UFFD
>> + *
>> + * Returns 0 in case of success, negative value on error
>> + *
>> + * @uffd: UFFD file descriptor
>> + * @start: starting virtual address of memory range
>> + * @length: length of memory range
>> + * @track_missing: generate events on missing-page faults
>> + * @track_wp: generate events on write-protected-page faults
>> + */
>> +static int uffd_register_memory(int uffd, hwaddr start, hwaddr length,
>> +        bool track_missing, bool track_wp)
>> +{
>> +    struct uffdio_register uffd_register;
>> +
>> +    uffd_register.range.start = start;
>> +    uffd_register.range.len = length;
>> +    uffd_register.mode = (track_missing ? UFFDIO_REGISTER_MODE_MISSING : 0) |
>> +                         (track_wp ? UFFDIO_REGISTER_MODE_WP : 0);
>> +
>> +    if (ioctl(uffd, UFFDIO_REGISTER, &uffd_register)) {
>> +        error_report("uffd_register_memory() failed: "
>> +                "start=%0"PRIx64" len=%"PRIu64" mode=%llu errno=%i",
>> +                start, length, uffd_register.mode, errno);
>> +        return -1;
>> +    }
>> +
>> +    return 0;
>> +}
> 
> These functions look good; we should even be able to refactor the existing
> ones, e.g., ram_block_enable_notify(), but we can also do that later.  As a
> start, we can move these helpers into some common files under util/.
> 
> [...]
> 

Yep, agree.

>> +/**
>> + * ram_write_tracking_start: start UFFD-WP memory tracking
>> + *
>> + * Returns 0 for success or negative value in case of error
>> + *
>> + */
>> +int ram_write_tracking_start(void)
>> +{
> 
> Need to be slightly careful on unwind on this function, because if it fails
> somehow we don't want to crash the existing running good vm... more below.
> 
>> +    int uffd;
>> +    RAMState *rs = ram_state;
>> +    RAMBlock *bs;
>> +
>> +    /* Open UFFD file descriptor */
>> +    uffd = uffd_create_fd();
>> +    if (uffd < 0) {
>> +        return uffd;
>> +    }
>> +    rs->uffdio_fd = uffd;
>> +
>> +    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
>> +        /* Nothing to do with read-only and MMIO-writable regions */
>> +        if (bs->mr->readonly || bs->mr->rom_device) {
>> +            continue;
>> +        }
>> +
>> +        /* Register block memory with UFFD to track writes */
>> +        if (uffd_register_memory(rs->uffdio_fd, (hwaddr) bs->host,
>> +                bs->max_length, false, true)) {
>> +            goto fail;
>> +        }
>> +        /* Apply UFFD write protection to the block memory range */
>> +        if (uffd_protect_memory(rs->uffdio_fd, (hwaddr) bs->host,
>> +                bs->max_length, true)) {
> 
> Here logically we need to undo the previous register first, however userfaultfd
> will auto-clean these when close(fd), so it's ok.  However still better to
> unwind the protection of pages, I think.  So...
> 

It should auto-clean, but as an additional safety measure - yes.

>> +            goto fail;
>> +        }
>> +        bs->flags |= RAM_UF_WRITEPROTECT;
>> +
>> +        info_report("UFFD-WP write-tracking enabled: "
>> +                "block_id=%s page_size=%zu start=%p length=%lu "
>> +                "romd_mode=%i ram=%i readonly=%i nonvolatile=%i rom_device=%i",
>> +                bs->idstr, bs->page_size, bs->host, bs->max_length,
>> +                bs->mr->romd_mode, bs->mr->ram, bs->mr->readonly,
>> +                bs->mr->nonvolatile, bs->mr->rom_device);
>> +    }
>> +
>> +    return 0;
>> +
>> +fail:
>> +    uffd_close_fd(uffd);
> 
> ... maybe do the unprotect here together, that as long as any of the above step
> failed, we need to remember to unprotect all the protected pages (or just
> unprotect everything).  And also the RAM_UF_WRITEPROTECT flags being set.
> 

Not resetting RAM_UF_WRITEPROTECT is certainly a bug here.

But it seems that simply calling close() on UFFD file descriptor does 
all the rest cleanup for us - unprotect registered memory regions, 
remove all extra state from kernel etc. I never had a problem with 
simple close(uffd) to cleanup.. But maybe really more safe to do 
unprotect/unregister explicitly.

>> +    rs->uffdio_fd = -1;
>> +    return -1;
>> +}
>> +
>> +/**
>> + * ram_write_tracking_stop: stop UFFD-WP memory tracking and remove protection
> 
> Didn't remove protections, yet?
> 
> We should remove those.  For a succeeded snapshot we can avoid that (if we want
> such optimization), or imho we'd better unprotect all just in case the user
> interrupted the snapshot.
> 

Seems that closing UFFD descriptor does unprotect for us implicitly..
Am I wrong?

>> + */
>> +void ram_write_tracking_stop(void)
>> +{
>> +    RAMState *rs = ram_state;
>> +    RAMBlock *bs;
>> +    assert(rs->uffdio_fd >= 0);
>> +
>> +    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
>> +        if ((bs->flags & RAM_UF_WRITEPROTECT) == 0) {
>> +            continue;
>> +        }
>> +        info_report("UFFD-WP write-tracking disabled: "
>> +                "block_id=%s page_size=%zu start=%p length=%lu "
>> +                "romd_mode=%i ram=%i readonly=%i nonvolatile=%i rom_device=%i",
>> +                bs->idstr, bs->page_size, bs->host, bs->max_length,
>> +                bs->mr->romd_mode, bs->mr->ram, bs->mr->readonly,
>> +                bs->mr->nonvolatile, bs->mr->rom_device);
>> +        /* Cleanup flags */
>> +        bs->flags &= ~RAM_UF_WRITEPROTECT;
>> +    }
>> +
>> +    /*
>> +     * Close UFFD file descriptor to remove protection,
>> +     * release registered memory regions and flush wait queues
>> +     */
>> +    uffd_close_fd(rs->uffdio_fd);
>> +    rs->uffdio_fd = -1;
>> +}
> 


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

