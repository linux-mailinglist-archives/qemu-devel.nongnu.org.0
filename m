Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FCC6A845C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 15:46:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXkBm-0000N6-5j; Thu, 02 Mar 2023 09:45:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pXkBk-0000Mh-CQ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:45:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pXkBh-0007Qn-9B
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677768340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e+570caFwB4prWyCHXA+anOt5MYk86Ng89ex8ZtVSF0=;
 b=fpJfUTZmLrVlWDayjoz91X/NZDWSRnEz0YLcDo8UxiKmRsnf58cLmsPWHXaGSBkDmcDLbW
 QkRfgoFCwrP4zOsiO0jNeQ+VwwP+ZG/3zqoyof6SsEd0XxcsUF94hvEbY/6M8MYSo92Bmj
 EUfo5BRM0921euS8+7VWBlcLEWKoRyM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-442-_6AdB6WxMQ23zQ63sMfZSw-1; Thu, 02 Mar 2023 09:45:39 -0500
X-MC-Unique: _6AdB6WxMQ23zQ63sMfZSw-1
Received: by mail-qv1-f70.google.com with SMTP id
 pz4-20020ad45504000000b0056f060452adso8814806qvb.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 06:45:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677768338;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e+570caFwB4prWyCHXA+anOt5MYk86Ng89ex8ZtVSF0=;
 b=cCeq5oa7jd0tKxTs5l4vGGc61InjNWQpZzkDd5AJz7fUHKDZPRzV0FWxTKYTaRIjvq
 O7ykdhqQ4mo5IUpUHoiN6wpWS7KptZ185JQvlBTlw92ALZr3DXiFErmP+dcSuq+UvoJE
 UmyJWO5CaWl91u3bpid98nctS/b0MY8nto29BVsCB1TPK+/KhKHfgXWjV40weJeeg3C2
 YoJPcodSqJP9Z0kOcHNazgpJN1B80I3Kk9wzhvC6ncyJSZfjwTp3/LFzDfw3qR8aNrct
 9ctD9qGNMFjUxIJJ+W7J+iC92qMJOUUv6XSKGrcy8sb7aVH55ZUzB9UeXeo6rclD84Y3
 8qWw==
X-Gm-Message-State: AO0yUKVN9gstBMnenzXJizASdFAh/moCU6aFAxW6dVc+0VHrnNnFXJE6
 aVajwHhp1FpBtauQss2Rjpu1r/rbAsFjWmd7V3nAyFsZeSAQq4b9koffjRGzJj0gBFZVMy1vMic
 ER4BBSmCRwuoch9g=
X-Received: by 2002:a0c:f251:0:b0:56e:f542:628 with SMTP id
 z17-20020a0cf251000000b0056ef5420628mr14461403qvl.3.1677768338623; 
 Thu, 02 Mar 2023 06:45:38 -0800 (PST)
X-Google-Smtp-Source: AK7set/y8Y1Rtf0EG231uhAphiM298KZ/AKhnlNrsGTndKb4gffs3Pb7uE4EPqI3fpzcHj/vkdwduw==
X-Received: by 2002:a0c:f251:0:b0:56e:f542:628 with SMTP id
 z17-20020a0cf251000000b0056ef5420628mr14461369qvl.3.1677768338326; 
 Thu, 02 Mar 2023 06:45:38 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 m67-20020a375846000000b00725d8d6983asm10906023qkb.61.2023.03.02.06.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 06:45:37 -0800 (PST)
Date: Thu, 2 Mar 2023 09:45:35 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Chuang Xu <xuchuangxclwt@bytedance.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH RFC 0/4] memory: Fix (/ Discuss) a few rcu issues
Message-ID: <ZAC2ccoQpFLa07ZK@x1n>
References: <20230225163141.1209368-1-peterx@redhat.com>
 <6c75e2e2-5ba9-bc52-2c6c-a0bfb5f5b56f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6c75e2e2-5ba9-bc52-2c6c-a0bfb5f5b56f@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 02, 2023 at 10:46:56AM +0100, David Hildenbrand wrote:
> On 25.02.23 17:31, Peter Xu wrote:
> > [not for merging, but for discussion; this is something I found when
> >   looking at another issue on Chuang's optimization for migration downtime]
> > 
> > Summary: we tried to access memory_listeners, address_spaces, etc. in RCU
> > way.  However we didn't implement them with RCU-safety. This patchset is
> > trying to do that; at least making it closer.
> > 
> > NOTE!  It's doing it wrongly for now, so please feel free to see this as a
> > thread to start discussing this problem, as in subject.
> > 
> > The core problem here is how to make sure memory listeners will be freed in
> > RCU ways, per when unlinking them from the global memory_listeners list.
> 
> Can you elaborate why we would want to do that? Is there a real reason we
> cannot hold the BQL when unregistering a listener?

Yes afaict we must hold BQL when unregister any listener for now.  I added
an explicit assert in patch 1 for that.

We want to do that because potentially we have RCU readers accessing these
two lists, so here taking BQL only is not enough.  We need to release the
objects after all users are gone.

We already do that for address spaces, but afaict the listener part was
overlooked.  The challenge here is how to achieve the same for listeners.

> 
> Or could we use any other, more fine-grained, lock to protect the memory
> listeners?
> 
> Naive me would think that any interactions between someone updating the
> memory listeners, and a listener getting removed, would require some careful
> synchronization (to not rip a notifier out while someone else notifies --
> what is the still registered notifier supposed to do with notifications
> while it is already going away?), instead of doing it via RCU.
> 
> I'm all for using RCU if it improves performance and keeps things simple. If
> RCU is neither required for performance reason and overcomplicates the
> implementation, maybe using locking is the better choice.

For ASes, one major user RCU is memory_region_find_rcu().

For listeners, the only path that doesn't take BQL (afaict) is
memory_region_clear_dirty_bitmap().  Maybe you'll have some points here on
the side effect of taking it because it's in either virtio-mem or balloon
path for page hinting iirc.

In short, so far I don't know whether it's possible to have all paths take
BQL while not regress anything.

> 
> TBH, so far I thought that any memory_listeners register/unregistering
> *requires* the BQL, and everything else is a BUG.

Thanks,

-- 
Peter Xu


