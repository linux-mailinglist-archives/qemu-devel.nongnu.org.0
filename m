Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBC9345037
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 20:47:37 +0100 (CET)
Received: from localhost ([::1]:40888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOQWW-0006Sv-41
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 15:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOQUl-0005VI-Mc
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 15:45:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOQUg-0007oy-80
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 15:45:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616442339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DI/RT1yLgQOTl9Th/SB5vifBpMsaiyIamvkBbFSBY4U=;
 b=c2twu4/hWws/RGyaFHIJCVS9UaS37SG1XXA3G+VMIIGZS0EWtJUdkXZIpxliWuZ4dHDT0I
 h6qTzWXrYcjT7M58Kyk6Kncpbo3/e83y6QkoZW1wYjIh8hPDkdvCI8CYh4qMyWvq8Feyk3
 NfslJLVjUBkjfL+j2CeHav1YHIn0jz0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-fgy6Mc4WNfSnGWaGIU8Rmg-1; Mon, 22 Mar 2021 15:45:36 -0400
X-MC-Unique: fgy6Mc4WNfSnGWaGIU8Rmg-1
Received: by mail-qv1-f69.google.com with SMTP id dz17so160258qvb.14
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 12:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DI/RT1yLgQOTl9Th/SB5vifBpMsaiyIamvkBbFSBY4U=;
 b=ilWnXXkSjhb9FtY0nGJv0rqqvCGK3OLYEXnQs3kiBaY1TWVa7gmrvMi+FVZX/YhYkD
 LOt90jbfQvobM6f1hnQ8y1vlnmZCESplsK2zs3vDNm14iFZa+0TQhiIUDkLS65Lvd2n+
 PfSGq2w8KwJgpcrMWOLgw+82hsUgdfDYPtVc6VhDv9xsXuRuvdz/nGlnhmcDXXVVArtL
 OAw62tmLwXxKHg4vTV9lzP4uPqgFX73JNw0gJ6oLGdXPYRMwS7gm9Oe6KLuaoMXBv/U2
 80GPRflRTJgVdL4Ndzi2H32n8Egfju3OxfqkaB8Paprc39ppEHSajl0lqMvm3x08zJBa
 1gHg==
X-Gm-Message-State: AOAM533Ph3HqfCrxL2L+dOoD80ck1212px3gZSZxwLQzvyxLAT+eRtmz
 XohFw882qlQJMWvc2VAvnVPAqOQbCB1r3EODuQ2rqif2HrGIqY9+ftfNzwqgzzIHkFvXOcETEwX
 c6t0qJ19D3eYbmzE=
X-Received: by 2002:a37:d202:: with SMTP id f2mr1730001qkj.273.1616442336088; 
 Mon, 22 Mar 2021 12:45:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTpD4wqVhTyJQ0Xwd/GGS7mFXB2zmpP4k6qPO575PnTqYgXiUO0hppBc35YzX4XbEYb2qp8Q==
X-Received: by 2002:a37:d202:: with SMTP id f2mr1729974qkj.273.1616442335740; 
 Mon, 22 Mar 2021 12:45:35 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id m3sm11489340qkk.15.2021.03.22.12.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 12:45:35 -0700 (PDT)
Date: Mon, 22 Mar 2021 15:45:33 -0400
From: Peter Xu <peterx@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH v5 00/10] KVM: Dirty ring support (QEMU part)
Message-ID: <20210322194533.GE16645@xz-x1>
References: <20210310203301.194842-1-peterx@redhat.com>
 <2e057323-8102-7bfc-051b-cd3950c93875@huawei.com>
MIME-Version: 1.0
In-Reply-To: <2e057323-8102-7bfc-051b-cd3950c93875@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 10:02:38PM +0800, Keqian Zhu wrote:
> Hi Peter,

Hi, Keqian,

[...]

> You emphasize that dirty ring is a "Thread-local buffers", but dirty bitmap is global,
> but I don't see it has optimization about "locking" compared to dirty bitmap.
> 
> The thread-local means that vCPU can flush hardware buffer into dirty ring without
> locking, but for bitmap, vCPU can also use atomic set to mark dirty without locking.
> Maybe I miss something?

Yes, the atomic ops guaranteed locking as you said, but afaiu atomics are
expensive already, since at least on x86 I think it needs to lock the memory
bus.  IIUC that'll become even slower as cores grow, as long as the cores share
the memory bus.

KVM dirty ring is per-vcpu, it means its metadata can be modified locally
without atomicity at all (but still, we'll need READ_ONCE/WRITE_ONCE to
guarantee ordering of memory accesses).  It should scale better especially with
hosts who have lots of cores.

> 
> The second question is that you observed longer migration time (55s->73s) when guest
> has 24G ram and dirty rate is 800M/s. I am not clear about the reason. As with dirty
> ring enabled, Qemu can get dirty info faster which means it handles dirty page more
> quick, and guest can be throttled which means dirty page is generated slower. What's
> the rationale for the longer migration time?

Because dirty ring is more sensitive to dirty rate, while dirty bitmap is more
sensitive to memory footprint.  In above 24G mem + 800MB/s dirty rate
condition, dirty bitmap seems to be more efficient, say, collecting dirty
bitmap of 24G mem (24G/4K/8=0.75MB) for each migration cycle is fast enough.

Not to mention that current implementation of dirty ring in QEMU is not
complete - we still have two more layers of dirty bitmap, so it's actually a
mixture of dirty bitmap and dirty ring.  This series is more like a POC on
dirty ring interface, so as to let QEMU be able to run on KVM dirty ring.
E.g., we won't have hang issue when getting dirty pages since it's totally
async, however we'll still have some legacy dirty bitmap issues e.g. memory
consumption of userspace dirty bitmaps are still linear to memory footprint.

Moreover, IMHO another important feature that dirty ring provided is actually
the full-exit, where we can pause a vcpu when it dirties too fast, while other
vcpus won't be affected.  That's something I really wanted to POC too but I
don't have enough time.  I think it's a worth project in the future to really
make the full-exit throttle vcpus, then ideally we'll remove all the dirty
bitmaps in QEMU as long as dirty ring is on.

So I'd say the number I got at that time is not really helping a lot - as you
can see for small VMs it won't make things faster.  Maybe a bit more efficient?
I can't tell.  From design-wise it looks actually still better.  However dirty
logging still has the reasoning to be the default interface we use for small
vms, imho.

> 
> PS: As the dirty ring is still converted into dirty_bitmap of kvm_slot, so the
> "get dirty info faster" maybe not true. :-(

We can get dirty info faster even now, I think, because previously we only do
KVM_GET_DIRTY_LOG once per migration iteration, which could be tens of seconds
for a VM mentioned above with 24G and 800MB/s dirty rate.  Dirty ring is fully
async, we'll get that after the reaper thread timeout.  However I must also
confess "get dirty info faster" doesn't help us a lot on anything yet, afaict,
comparing to a full-featured dirty logging where clear dirty log and so on.

Hope above helps.

Thanks,

-- 
Peter Xu


