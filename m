Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AABB6A84B9
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 15:58:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXkMm-0006dj-D9; Thu, 02 Mar 2023 09:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pXkMk-0006dN-JI
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:57:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pXkMi-0002Kr-KN
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677769023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IPk+PhsfbF1foa4mpkPWBXqcx3VOd9wbv14JkcgEyRQ=;
 b=Rg0Rds8ePSAyz5FqOAJWCeb5aCphGS7lONqGjE0ID4Jkbi5oEeiO3ssMrY6d9B67fC7CYK
 Fb6fnV2vuawUj/PCWpCbskVVcdgL98w3ta8qbj7ItHAJHnus3NkKS7gmdeX/Wrzp6Lx/4D
 A6VH4hbrPcpGo5mG/fDiZXjeQe7t5b0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-182-5zsz5y9COnu8qLuZbXNacQ-1; Thu, 02 Mar 2023 09:57:02 -0500
X-MC-Unique: 5zsz5y9COnu8qLuZbXNacQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 x5-20020a05620a01e500b007428997e800so9686408qkn.10
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 06:57:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677769021;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IPk+PhsfbF1foa4mpkPWBXqcx3VOd9wbv14JkcgEyRQ=;
 b=JhuD5w4/h/KmmsAm1qIe+funsnqf/M2Tn9rr8oPrVaGNQ96qQqocFfLYgXtLfXflix
 5Su3LRKzBRWKhovw2SUwBl3evY+qA4Ot/ZBb9JYPoWO1qHNr8LK/EtDPM/8pMopTe46i
 MzWnf5EO2oENtzWQLZVf1SG17x7c44DhyDcAeJKnyqgbFuyTMjnd1Qxyh2/Z8UdHcdHR
 mG1vpLTafW9uTzoUcSKPhlhXv1uE5ePN0WlJDfd0RgdYbzTYCJpdG/KiI0d6j1L6cTb9
 xc2FOCLGXvhjMbrleno6d8uCpBUjzR7Yx4C1itQ1uHFA8G91KTIOe6Yfqd9DZcjMKwoc
 YbHw==
X-Gm-Message-State: AO0yUKWwaIGyomx1wtrtptqpFt9cgBPBC68jo3YFlUee+T6zhAGKZW2+
 74FfUS9fZw5OODdvJt27g5FI3KUTCNj9pNiB2u6CxYXBRrfRu/qrANkMkPRYEIXvYsnomaShh9P
 rv9zFRPJQ1Pve0Hw=
X-Received: by 2002:a0c:9c0e:0:b0:56e:89b9:9a92 with SMTP id
 v14-20020a0c9c0e000000b0056e89b99a92mr18294435qve.0.1677769021628; 
 Thu, 02 Mar 2023 06:57:01 -0800 (PST)
X-Google-Smtp-Source: AK7set/cOgomEDQYvgw1rZSm/PKgCZGQeCDMVxs2x1l2KZoaYxZXDx+pgyDcEMkDb/sOwZFkBgzwJw==
X-Received: by 2002:a0c:9c0e:0:b0:56e:89b9:9a92 with SMTP id
 v14-20020a0c9c0e000000b0056e89b99a92mr18294403qve.0.1677769021318; 
 Thu, 02 Mar 2023 06:57:01 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 a141-20020ae9e893000000b00742743dba2asm11232208qkg.39.2023.03.02.06.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 06:57:00 -0800 (PST)
Date: Thu, 2 Mar 2023 09:56:59 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Chuang Xu <xuchuangxclwt@bytedance.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH RFC 0/4] memory: Fix (/ Discuss) a few rcu issues
Message-ID: <ZAC5O1Ew9mP2Qqt6@x1n>
References: <20230225163141.1209368-1-peterx@redhat.com>
 <6c75e2e2-5ba9-bc52-2c6c-a0bfb5f5b56f@redhat.com>
 <ZAC2ccoQpFLa07ZK@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZAC2ccoQpFLa07ZK@x1n>
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

On Thu, Mar 02, 2023 at 09:45:35AM -0500, Peter Xu wrote:
> On Thu, Mar 02, 2023 at 10:46:56AM +0100, David Hildenbrand wrote:
> > On 25.02.23 17:31, Peter Xu wrote:
> > > [not for merging, but for discussion; this is something I found when
> > >   looking at another issue on Chuang's optimization for migration downtime]
> > > 
> > > Summary: we tried to access memory_listeners, address_spaces, etc. in RCU
> > > way.  However we didn't implement them with RCU-safety. This patchset is
> > > trying to do that; at least making it closer.
> > > 
> > > NOTE!  It's doing it wrongly for now, so please feel free to see this as a
> > > thread to start discussing this problem, as in subject.
> > > 
> > > The core problem here is how to make sure memory listeners will be freed in
> > > RCU ways, per when unlinking them from the global memory_listeners list.
> > 
> > Can you elaborate why we would want to do that? Is there a real reason we
> > cannot hold the BQL when unregistering a listener?
> 
> Yes afaict we must hold BQL when unregister any listener for now.  I added
> an explicit assert in patch 1 for that.
> 
> We want to do that because potentially we have RCU readers accessing these
> two lists, so here taking BQL only is not enough.  We need to release the
> objects after all users are gone.
> 
> We already do that for address spaces, but afaict the listener part was
> overlooked.  The challenge here is how to achieve the same for listeners.
> 
> > 
> > Or could we use any other, more fine-grained, lock to protect the memory
> > listeners?
> > 
> > Naive me would think that any interactions between someone updating the
> > memory listeners, and a listener getting removed, would require some careful
> > synchronization (to not rip a notifier out while someone else notifies --
> > what is the still registered notifier supposed to do with notifications
> > while it is already going away?), instead of doing it via RCU.
> > 
> > I'm all for using RCU if it improves performance and keeps things simple. If
> > RCU is neither required for performance reason and overcomplicates the
> > implementation, maybe using locking is the better choice.
> 
> For ASes, one major user RCU is memory_region_find_rcu().
> 
> For listeners, the only path that doesn't take BQL (afaict) is
> memory_region_clear_dirty_bitmap().  Maybe you'll have some points here on
> the side effect of taking it because it's in either virtio-mem or balloon
> path for page hinting iirc.

Ah I forgot the generic ram save migration also takes RCU here.  So it's
definitely even more challenging (we already hold RCU for ramblocks there,
though).

> 
> In short, so far I don't know whether it's possible to have all paths take
> BQL while not regress anything.
> 
> > 
> > TBH, so far I thought that any memory_listeners register/unregistering
> > *requires* the BQL, and everything else is a BUG.
> 
> Thanks,
> 
> -- 
> Peter Xu

-- 
Peter Xu


