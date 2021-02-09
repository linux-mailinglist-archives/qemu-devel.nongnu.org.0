Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981D131569A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:17:43 +0100 (CET)
Received: from localhost ([::1]:39912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9YW6-000428-JV
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:17:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9YLv-0004oU-6w
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:07:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9YLt-0002j5-6P
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:07:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612897628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xFn11qytX+o2kA2GZDLsPXGne2EH90J6j+onP/MyXQA=;
 b=hO3mWxV8DE4Z8Rn5zss+1p1KGtSEmWXQav87T1+U2eURHu2cT6Y6k60MSD9F3c+4cFiDEC
 4KDZuySBGNvINrqyHLoNZEGg/MHc6w6spnPO6XEzIyWrVwWFu1jM/vOcU/Rmv5pBH910/E
 Ku/Mwrq9t25r7ZrUwYB0AEpvWmK6LxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-kze17vCkNtO6AW8ggzqFKg-1; Tue, 09 Feb 2021 14:07:05 -0500
X-MC-Unique: kze17vCkNtO6AW8ggzqFKg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23EFF79EC0;
 Tue,  9 Feb 2021 19:07:04 +0000 (UTC)
Received: from [10.36.113.141] (ovpn-113-141.ams2.redhat.com [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D53B19C78;
 Tue,  9 Feb 2021 19:06:59 +0000 (UTC)
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, qemu-devel@nongnu.org
References: <20210121152458.193248-1-andrey.gruzdev@virtuozzo.com>
 <a88cb0b2-86a1-04b4-3ed1-d032850040df@redhat.com>
 <5d01402e-273a-53cf-b78b-b4b7f50340bc@virtuozzo.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Message-ID: <0e155a86-6cae-8ce4-676c-a06ee87b6f43@redhat.com>
Date: Tue, 9 Feb 2021 20:06:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <5d01402e-273a-53cf-b78b-b4b7f50340bc@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------9FA5D4C22DA60D09B05CC585"
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------9FA5D4C22DA60D09B05CC585
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

>> Hi,
>>
>> just stumbled over this, quick question:
>>
>> I recently played with UFFD_WP and notices that write protection is
>> only effective on pages/ranges that have already pages populated (IOW:
>> !pte_none() in the kernel).
>>
>> In case memory was never populated (or was discarded using e.g.,
>> madvice(DONTNEED)), write-protection will be skipped silently and you
>> won't get WP events for applicable pages.
>>
>> So if someone writes to a yet unpoupulated page ("zero"), you won't
>> get WP events.
>>
>> I can spot that you do a single uffd_change_protection() on the whole
>> RAMBlock.
>>
>> How are you handling that scenario, or why don't you have to handle
>> that scenario?
>>
> Hi David,
> 
> I really wonder if such a problem exists.. If we are talking about a

I immediately ran into this issue with my simplest test cases. :)

> write to an unpopulated page, we should get first page fault on
> non-present page and populate it with protection bits from respective vma.
> For UFFD_WP vma's  page will be populated non-writable. So we'll get
> another page fault on present but read-only page and go to handle_userfault.

See the attached test program. Triggers for me on 5.11.0-rc6+ and 
5.9.13-200.fc33

gcc -lpthread uffdio_wp.c -o uffdio_wp
./uffdio_wp
WP did not fire

Uncomment the placement of the zeropage just before registering to make 
the WP actually trigger. If there is no PTE, there is nothing to protect.


And it makes sense: How should the fault handler know which ranges you 
wp-ed, if there is no place to store that information (the PTEs!). The 
VMA cannot tell that story, it only knows that someone registered 
UFFD_WP to selectively wp some parts.

You might have to register also for MISSING faults and place zero pages.

-- 
Thanks,

David / dhildenb

--------------9FA5D4C22DA60D09B05CC585
Content-Type: text/x-csrc; charset=UTF-8;
 name="uffdio_wp.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="uffdio_wp.c"

#include <string.h>
#include <stdbool.h>
#include <stdint.h>
#include <sys/types.h>
#include <stdio.h>
#include <pthread.h>
#include <errno.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <poll.h>
#include <linux/userfaultfd.h>
#include <sys/mman.h>
#include <sys/syscall.h>
#include <sys/ioctl.h>

static int page_size;
volatile bool wp_fired;

static void *fault_handler_thread(void *arg)
{
    const long uffd =3D (long) arg;
    struct pollfd pollfd =3D {
        .fd =3D uffd,
        .events =3D POLLIN,
    };
    int ret;

    while (true) {
        struct uffdio_writeprotect wp;
        struct uffd_msg msg;
        ssize_t nread;

        if (poll(&pollfd, 1, -1) =3D=3D -1) {
            fprintf(stderr, "POLL failed: %s\n", strerror(errno));
            exit(-1);
        }
        if (read(uffd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
            fprintf(stderr, "READ failed\n");
            exit(-1);
        }
        if (msg.event =3D=3D UFFD_EVENT_REMOVE) {
            continue;
        }
        if (msg.event !=3D UFFD_EVENT_PAGEFAULT) {
            fprintf(stderr, "Not UFFD_EVENT_PAGEFAULT\n");
            exit(-1);
        }

        wp_fired =3D true;

        /* Simply unprotect and wake */
        wp.range.start =3D msg.arg.pagefault.address;
        wp.range.len =3D page_size;
        wp.mode =3D 0;
        if (ioctl(uffd, UFFDIO_WRITEPROTECT, &wp) =3D=3D -1) {
            fprintf(stderr, "UFFDIO_WRITEPROTECT failed: %s\n", strerror(er=
rno));
            exit(-1);
        }
    }
}

int main(void)
{
    struct uffdio_writeprotect wp;
    struct uffdio_zeropage zeropage;
    struct uffdio_register reg;
    struct uffdio_api api =3D {
        .api =3D UFFD_API,
        .features =3D UFFD_FEATURE_EVENT_REMOVE,
    };
    pthread_t fault, discard;
    long uffd;
    char *area;

    page_size =3D sysconf(_SC_PAGE_SIZE);

    uffd =3D syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
    if (uffd =3D=3D -1) {
        fprintf(stderr, "Could not create uffd: %s\n", strerror(errno));
        exit(-1);
    }
    if (ioctl(uffd, UFFDIO_API, &api) =3D=3D -1) {
        fprintf(stderr, "UFFDIO_API failed: %s\n", strerror(errno));
        exit(-1);
    }

    area =3D mmap(NULL, page_size, PROT_READ | PROT_WRITE,
                MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (area =3D=3D MAP_FAILED) {
        fprintf(stderr, "Could not allocate memory");
        exit(-1);
    }

    /* make sure the area is empty */
    if (madvise(area, page_size, MADV_DONTNEED)) {
        fprintf(stderr, "MADV_DONTNEED failed:%s\n", strerror(errno));
        exit(-1);
    }

    /* register a WP handler */
    reg.range.start =3D (uint64_t) area;
    reg.range.len =3D page_size,
    reg.mode =3D UFFDIO_REGISTER_MODE_WP;
    if (ioctl(uffd, UFFDIO_REGISTER, &reg) =3D=3D -1) {
        fprintf(stderr, "UFFDIO_REGISTER failed: %s\n", strerror(errno));
        exit(-1);
    }

    /*
     * comment this out to make the wp actually fire
    zeropage.range =3D reg.range;
    zeropage.mode =3D UFFDIO_ZEROPAGE_MODE_DONTWAKE;
    if (ioctl(uffd, UFFDIO_ZEROPAGE, &zeropage) =3D=3D -1) {
        fprintf(stderr, "UFFDIO_ZEROPAGE failed: %s\n", strerror(errno));
        exit(-1);
    }
    */

    /* protect the page */
    wp.range =3D reg.range;
    wp.mode =3D UFFDIO_WRITEPROTECT_MODE_WP;
    if (ioctl(uffd, UFFDIO_WRITEPROTECT, &wp) =3D=3D -1) {
        fprintf(stderr, "UFFDIO_WRITEPROTECT failed: %s\n", strerror(errno)=
);
        exit(-1);
    }

    if (pthread_create(&fault, NULL, fault_handler_thread,
                       (void *) uffd)) {
        fprintf(stderr, "Could not create fault handing thread");
        exit(-1);
    }

    *area =3D 0;
    if (wp_fired) {
        printf("WP fired\n");
        return 0;
    }
    printf("WP did not fire\n");
    return -1;
}


--------------9FA5D4C22DA60D09B05CC585--


