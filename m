Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB31848C7A5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:53:57 +0100 (CET)
Received: from localhost ([::1]:50420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7fwi-0002ns-Iw
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:53:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7fsZ-0007zl-De
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:49:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7fsX-0006ip-4Z
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:49:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642002576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyRglFq0p8dYTRwHHhRB1Ak3Jezn2GVWuRRmjUXp3Sk=;
 b=Wj0qbcV9x/GjixjOayQSYslO4B+0w20Q3AvDdiqZb6FfKZmW10FWniCZ3JAh4wNvjUyF9Z
 bzj/JkSNHsqd7zjb8Q98ULpT+2aGdNbyunMwDjdvIgH2XXaS1vxywz5pLLlzS4DWalgskC
 EvQd0MXU3wvuNtCMAP9sukG6owaoEYA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-qKWF0UchPka2w_-pqpSIgA-1; Wed, 12 Jan 2022 10:49:35 -0500
X-MC-Unique: qKWF0UchPka2w_-pqpSIgA-1
Received: by mail-ed1-f70.google.com with SMTP id
 i9-20020a05640242c900b003fe97faab62so2613111edc.9
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 07:49:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cyRglFq0p8dYTRwHHhRB1Ak3Jezn2GVWuRRmjUXp3Sk=;
 b=pLphJAPoVVtC2yoLfr8/mPN9vF0832m2EjFjUdF7XGjgAS93ZJYeshAuJBsR8u4D8H
 0IXMCRkYXRdt46fdWEzpvrnWpxNnxrK3nC1yeMZX7YVkz/UCunYBEu+2QGwBKWET3nz0
 wwl6qiE0PE/0FTb6VgNlSskCsmYQ+a3zgwoq5OQTjf8iBJSJ/R0hmmh1lOHu2xWgyVxZ
 F8A+IEt0eSyCoiOWbeOUVDsBKYEm5NhwCls/ykzxmgOUMnuuOWZW8Reehy+79aZmHKnJ
 MbIcuD+7PCS+yd4B2MWbHmbtm/AvgxDg5LZU3IDKgNzRsMfJOo/5gTpSx9ACEVsoHGks
 nIUA==
X-Gm-Message-State: AOAM532vVi4+hnK87fCq6ZmWq1LNO2peIcCEep6iQFTSwYxQTRsi96WC
 cyyQmHlQRMjfdxpTpnaD9czJ+vDOTibUFPIP9qE3UV0979ukM0oKU23zSbbA0GRUDr9QnV/yrsv
 8P4Q8P7kkKuncjJE=
X-Received: by 2002:a17:906:16d5:: with SMTP id
 t21mr251788ejd.547.1642002574015; 
 Wed, 12 Jan 2022 07:49:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/KJYR0cOu7m1x1gBO/B7t3pA8lJv11H+it/xksfwPZErlonaI5rG2AksDb0x8R4alE14WcA==
X-Received: by 2002:a17:906:16d5:: with SMTP id
 t21mr251779ejd.547.1642002573842; 
 Wed, 12 Jan 2022 07:49:33 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:4700:e25f:39eb:3cb8:1dec?
 (p200300cbc7024700e25f39eb3cb81dec.dip0.t-ipconnect.de.
 [2003:cb:c702:4700:e25f:39eb:3cb8:1dec])
 by smtp.gmail.com with ESMTPSA id j21sm26536ejj.133.2022.01.12.07.49.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 07:49:33 -0800 (PST)
Message-ID: <d0fc0d8e-fe38-1ab2-2d56-23345de783e7@redhat.com>
Date: Wed, 12 Jan 2022 16:49:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC] virtio_pmem: enable live migration support
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
References: <20211231120127.22394-1-pankaj.gupta.linux@gmail.com>
 <625c92c6-3618-fbaa-aea6-0ed86df872d3@redhat.com>
 <CAM9Jb+hvCZoXLx4_xx8KTq4oBts7MCe-ozp5ZuX2yPW6=tyLGQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAM9Jb+hvCZoXLx4_xx8KTq4oBts7MCe-ozp5ZuX2yPW6=tyLGQ@mail.gmail.com>
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
Cc: Pankaj Gupta <pankaj.gupta@ionos.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Rik van Riel <riel@surriel.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>
>> I mean, that would be fundamentally broken, because the fsync() would
>> corrupt the file. So I assume in a sane environment, the dst could only
>> have stale clean pagecache pages. And we'd have to get rid of these to
>> re-read everything from file.
> 
> In case of write back cache mode, we could still have stale dirty
> pages at the destination
> host and destination fsync is not the right thing to do. We need to
> invalidate these pages
> (Can we invalidate dirty pages resident in page cache with
> POSIX_FADV_DONTNEED as
> well?) man pages say, we cannot (unless i misunderstood it).
> 

I think you'd have to fsync + POSIX_FADV_DONTNEED. But I am still
confused how we could end up with dirty pagecache pages on the
destination. In my opinion, there should only be clean pagecache pages
-- can someone enlighten me? :)

>>
>> IIRC, an existing mmap of the file on the dst should not really be
>> problematic *as long as* we didn't actually access file content that way
>> and faulted in the pages. So *maybe*, if we do the POSIX_FADV_DONTNEED
>> on the dst before accessing file content via the mmap, there shouldn't
>> be an issue. Unless the mmap itself is already problematic.
> 
> mmap with shared=ON, might result in stale dirty page cache pages?

But only if actually accessing memory, especially writing to it, no?

> 
>>
>> I think we can assume that once QEMU starts on the dst and wants to mmap
>> the file that it's not mapped into any other process yet. vhost-user
>> will only mmap *after* being told from QEMU about the mmap region and
>> the location in GPA.
> 
> maybe we have an old stale dirty page cache page even if there no mmap process
> alive before mmaping virtio-pmem backend file in destination?

But how could that happen in a sane environment? As I said, any
writeback on that file from the destination would actually corrupt the
file that has been used+modified on the source in the meantime, no?


-- 
Thanks,

David / dhildenb


