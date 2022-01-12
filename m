Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE55448C269
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 11:39:02 +0100 (CET)
Received: from localhost ([::1]:38162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7b1x-0008AC-Mj
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 05:39:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7b04-0006E7-1V
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:37:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7b01-0004MP-HE
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:37:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641983821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GFuGnQUjf7hs+jo3XxneJKkqCN6hoG4TbCjdwduUcig=;
 b=WikIlMic1Gy2lbvlTD53hZh/Xe+VeAeze/kwsJn1lw3xxSJtlFTNFMwGmcggTcXhl1jg5U
 2AogJO9a+nIOTLnKkXOmCNqDhsZVRjvmsbAKcdZVi5rMtvoMo7vZgqPWkzdi8Q2wII+ZLG
 8OhwvdjAqOPgl71yzOCUdhcxtSDpri8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-qMkZK636M-aHOJtBmMBBOA-1; Wed, 12 Jan 2022 05:36:59 -0500
X-MC-Unique: qMkZK636M-aHOJtBmMBBOA-1
Received: by mail-ed1-f69.google.com with SMTP id
 g11-20020a056402090b00b003f8fd1ac475so1919210edz.1
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 02:36:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=GFuGnQUjf7hs+jo3XxneJKkqCN6hoG4TbCjdwduUcig=;
 b=CpYGjME+SUURq16S7dnnpWUIUyekS6foB8AcOQtjkSufanJ69fOgkPAqi9NVBKPhxb
 7IW3SkLUniwtBqeZzSaGDXy5WLIOLOkM8WairGNfZ34z5l67VyZl7Sdoeb0sgwUafe8M
 6byYxdD415ed0NjiVComI9isfXFUk7Seg1Gb/k64gJr2cPmVMecYqB5TOnFmd8P/Xn52
 qL8r8HMlcljgOJHOF1LB+CTgVULlyXNOgXcjmV6ZI+fM1THJL9ksZM/PvC0m5VzmxyeA
 SbRcXvTHNt/CXHEFHiTQF4z+13WtRbI8Qv1hVUfUlgD6zVSxkKgq+nzCtOAoHM/D4gXG
 z1Qg==
X-Gm-Message-State: AOAM530WauZQzhSjyX12FCv/bjylWo1/xB6dLslYetKDn+GvmbDI3cR8
 UYuDX+KNA6mWleMHBQil6fiLUvV5KL4ZlrIOtBw1JsnNTiqX4Nqf3pQbftY8ivk58PifHcEkJ4C
 qCb1zH/Hr31Emp94=
X-Received: by 2002:a17:906:5042:: with SMTP id
 e2mr7510364ejk.647.1641983818734; 
 Wed, 12 Jan 2022 02:36:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMzukLD4c72HqMh3gmiL7JEVc8A3KKnkabRU+OdYMeSJtSqcOioz80xlmCJMitbUEJlNHjFg==
X-Received: by 2002:a17:906:5042:: with SMTP id
 e2mr7510349ejk.647.1641983818455; 
 Wed, 12 Jan 2022 02:36:58 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:4700:e25f:39eb:3cb8:1dec?
 (p200300cbc7024700e25f39eb3cb81dec.dip0.t-ipconnect.de.
 [2003:cb:c702:4700:e25f:39eb:3cb8:1dec])
 by smtp.gmail.com with ESMTPSA id p3sm4351897ejo.61.2022.01.12.02.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 02:36:58 -0800 (PST)
Message-ID: <625c92c6-3618-fbaa-aea6-0ed86df872d3@redhat.com>
Date: Wed, 12 Jan 2022 11:36:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org
References: <20211231120127.22394-1-pankaj.gupta.linux@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC] virtio_pmem: enable live migration support
In-Reply-To: <20211231120127.22394-1-pankaj.gupta.linux@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mst@redhat.com, riel@surriel.com, pankaj.gupta@ionos.com,
 dgilbert@redhat.com, stefanha@redhat.com, dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31.12.21 13:01, Pankaj Gupta wrote:
> From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>>
> 
> Enable live migration support for virtio-pmem device.
> Tested this: with live migration on same host.
> 
> Need suggestion on below points to support virtio-pmem live migration
> between two separate host systems:

I assume emulated NVDIMMs would have the exact same issue, right?

There are two cases to consider I think:

1) Backing storage is migrated manually to the destination (i.e., a file
that is copied/moved/transmitted during migration)

2) Backing storage is located on a shared network storage (i.e., a file
that is not copied during migration)

IIRC you're concerned about 2).

> 
> - There is still possibility of stale page cache page at the
>   destination host which we cannot invalidate currently as done in 1]
>   for write-back mode because virtio-pmem memory backend file is mmaped
>   in guest address space and invalidating corresponding page cache pages
>   would also fault all the other userspace process mappings on the same file.
>   Or we make it strict no other process would mmap this backing file?

I'd have assume that a simple fsync on the src once migration is about
to switch over (e.g., pre_save/post_save handler) should be enough to
trigger writeback to the backing storage, at which point the dst can
take over. So handling the src is easy.

So is the issue that the dst might still have stale pagecache
information, because it already accessed some of that file previously,
correct?

> 
>   -- In commit 1] we first fsync and then invalidate all the pages from destination
>      page cache. fsync would sync the stale dirty page cache page, Is this the right
>      thing to do as we might end up in data discrepency?

It would be weird if

a) The src used/modified the file and fsync'ed the modifications back to
   backing storage
b) The dst has stale dirty pagecache pages that would result in a
   modification of backing storage during fsync()

I mean, that would be fundamentally broken, because the fsync() would
corrupt the file. So I assume in a sane environment, the dst could only
have stale clean pagecache pages. And we'd have to get rid of these to
re-read everything from file.

IIRC, an existing mmap of the file on the dst should not really be
problematic *as long as* we didn't actually access file content that way
and faulted in the pages. So *maybe*, if we do the POSIX_FADV_DONTNEED
on the dst before accessing file content via the mmap, there shouldn't
be an issue. Unless the mmap itself is already problematic.

I think we can assume that once QEMU starts on the dst and wants to mmap
the file that it's not mapped into any other process yet. vhost-user
will only mmap *after* being told from QEMU about the mmap region and
the location in GPA.

So if the existing QEMU mmap is not problematic, it should be easy, just
do the POSIX_FADV_DONTNEED on the destination when initializing
virtio-pmem. If we have to POSIX_FADV_DONTNEED *before* performing the
mmap, we might need a way to tell QEMU to POSIX_FADV_DONTNEED before
doing the mmap. The could be a parameter for memory-backend-file like
"flush=on", or doing that implicitly when we're told that we expect an
incoming migration.

-- 
Thanks,

David / dhildenb


