Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987716678DA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:15:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFzHL-0002qq-UX; Thu, 12 Jan 2023 10:14:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pFzHE-0002qA-Mg
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 10:14:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pFzHC-00015x-Qi
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 10:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673536436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fTkXx0RtBTTCbiO4h8C/YAQiwH6lLE7VD+A3F6rMODI=;
 b=apz7E2X8M3mW7piLYXJObbt4TGOAFMnO4YQx0lbJZC3G30aDOOzf/vBPGjijLlIrnOPQ+S
 nhCXli2G7gqaeRDA0Id6pWWBHXX1y2yLrIM1R1PfNY6SkX4QbSo34EYb+o6bYPnBAtbMA3
 RiJQ+ug0pCR/PFvNZPo+/h8mJuvcet0=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-604-OYZQfs1YMhGV3jL_4cruPw-1; Thu, 12 Jan 2023 10:13:54 -0500
X-MC-Unique: OYZQfs1YMhGV3jL_4cruPw-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-4bdeb1bbeafso195192317b3.4
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 07:13:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fTkXx0RtBTTCbiO4h8C/YAQiwH6lLE7VD+A3F6rMODI=;
 b=xn3nJIZIZSl62JH7qfaXWNr1UG9kEpBNz3qej+6c/phG0xbp7pP8FHJnvGPrqNRNac
 bZ5JtvyAV81Hgvq7rtq1aUItk6pqjRbKBLRKUtQ7Z3YdFYQxanIJUman3kvCPvr4e5YL
 HEgVIkc1Rk3ZLcM0nxSew/IabxPKkFSVZ+bNGl6rsu5v4dy2O/g4tRR+PS5SKOzoMagA
 91Alw63OiLlEz6i4gm7lTWbUir41wApHl0V9uKEdDl+v5X25aV8ADT7jYkdRU3uoL0b+
 9vC1jFo4tzB+zgD6gUQ69culhgiTZmewRoGkqfvRsjgrZXoGjUUySUbtAojYrpS6zz5M
 KtFQ==
X-Gm-Message-State: AFqh2kqxNm6ZD3XUl+Q7BkWgO4pV8O5XIM4T7E+XXfkTpCX3NURIPy4e
 rely2uh6+8PqiDGuJbOFw76N/bcfHKLRqrpbbAO380iRLoLoA3dyoN9Djkr9JEGDRD184qO2185
 KOwq5kQEkOzBvFk8=
X-Received: by 2002:a81:6c57:0:b0:3d4:32f:7ef9 with SMTP id
 h84-20020a816c57000000b003d4032f7ef9mr23283469ywc.0.1673536434209; 
 Thu, 12 Jan 2023 07:13:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtWQkRvmp4uC/nNRy0SOU0wNXStnJwEKnnh2WE0+1f1tIDq+2MWDeK58e3Q++CSB1kBHNA44A==
X-Received: by 2002:a81:6c57:0:b0:3d4:32f:7ef9 with SMTP id
 h84-20020a816c57000000b003d4032f7ef9mr23283440ywc.0.1673536433897; 
 Thu, 12 Jan 2023 07:13:53 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 f8-20020a05620a408800b006b5cc25535fsm11157621qko.99.2023.01.12.07.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 07:13:53 -0800 (PST)
Date: Thu, 12 Jan 2023 10:13:51 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 David Gilbert <dgilbert@redhat.com>,
 "Quintela, Juan" <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 zhouyibo@bytedance.com
Subject: Re: [RFC v4 2/3] memory: add depth assert in address_space_to_flatview
Message-ID: <Y8Ajr3ef5oRJ9+Qx@x1n>
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
 <20221223142307.1614945-3-xuchuangxclwt@bytedance.com>
 <05c4cb9e-0f41-c60f-6a68-cf5050ad7a02@redhat.com>
 <Y6XPRD4fSucgWZfT@x1n>
 <CABgObfa=i=9CZRFyX_EXBOSW===iDhcZoDO8Ju64F-tHUAXdRA@mail.gmail.com>
 <Y7RpPwGd0WvrENlz@x1n>
 <CALophuvJ2g7D9idGHfQEK3Co7o06ab38ZK3CCGZX0tDdQX_+Tg@mail.gmail.com>
 <Y716CoJeHKZ6nP1x@x1n>
 <ad0c804b-5ba3-511b-2516-64172565c20b@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad0c804b-5ba3-511b-2516-64172565c20b@bytedance.com>
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

On Thu, Jan 12, 2023 at 03:59:55PM +0800, Chuang Xu wrote:
> Hi, Peter, Paolo,

Chuang,

> 
> On 2023/1/10 下午10:45, Peter Xu wrote:
> > On Tue, Jan 10, 2023 at 12:09:41AM -0800, Chuang Xu wrote:
> > > Hi, Peter and Paolo,
> > Hi, Chuang, Paolo,
> > 
> > > I'm sorry I didn't reply to your email in time. I was infected with
> > > COVID-19 two weeks ago, so I couldn't think about the problems discussed
> > > in your email for a long time.😷
> > > 
> > > On 2023/1/4 上午1:43, Peter Xu wrote:
> > > > Hi, Paolo,
> > > > 
> > > > On Wed, Dec 28, 2022 at 09:27:50AM +0100, Paolo Bonzini wrote:
> > > > > Il ven 23 dic 2022, 16:54 Peter Xu ha scritto:
> > > > > 
> > > > > > > This is not valid because the transaction could happen in *another*
> > > > > > thread.
> > > > > > > In that case memory_region_transaction_depth() will be > 0, but RCU is
> > > > > > > needed.
> > > > > > Do you mean the code is wrong, or the comment? Note that the code has
> > > > > > checked rcu_read_locked() where introduced in patch 1, but maybe
> > > something
> > > > > > else was missed?
> > > > > > 
> > > > > The assertion is wrong. It will succeed even if RCU is unlocked in this
> > > > > thread but a transaction is in progress in another thread.
> > > > IIUC this is the case where the context:
> > > > 
> > > > (1) doesn't have RCU read lock held, and,
> > > > (2) doesn't have BQL held.
> > > > 
> > > > Is it safe at all to reference any flatview in such a context? The thing
> > > > is I think the flatview pointer can be freed anytime if both locks are
> > > not
> > > > taken.
> > > > 
> > > > > Perhaps you can check (memory_region_transaction_depth() > 0 &&
> > > > > !qemu_mutex_iothread_locked()) || rcu_read_locked() instead?
> > > > What if one thread calls address_space_to_flatview() with BQL held but
> > > not
> > > > RCU read lock held? I assume it's a legal operation, but it seems to be
> > > > able to trigger the assert already?
> > > > 
> > > > Thanks,
> > > > 
> > > I'm not sure whether I understand the content of your discussion correctly,
> > > so here I want to explain my understanding firstly.
> > > 
> > >  From my perspective, Paolo thinks that when thread 1 is in a transaction,
> > > thread 2 will trigger the assertion when accessing the flatview without
> > > holding RCU read lock, although sometimes the thread 2's access to flatview
> > > is legal. So Paolo suggests checking (memory_region_transaction_depth() > 0
> > > && !qemu_mutex_iothread_locked()) || rcu_read_locked() instead.
> > > 
> > > And Peter thinks that as long as no thread holds the BQL or RCU read lock,
> > > the old flatview can be released (actually executed by the rcu thread with
> > > BQL held). When thread 1 is in a transaction, if thread 2 access the
> > > flatview
> > > with BQL held but not RCU read lock held, it's a legal operation. In this
> > > legal case, it seems that both my code and Paolo's code will trigger
> > > assertion.
> > IIUC your original patch is fine in this case (BQL held, RCU not held), as
> > long as depth==0.  IMHO what we want to trap here is when BQL held (while
> > RCU is not) and depth>0 which can cause unpredictable side effect of using
> > obsolete flatview.
> 
> I don't quite understand the side effects of depth>0 when BQL is held (while
> RCU is not).

We wanted to capture outliers when you apply the follow up patch to vm load
procedure.

That will make depth>0 for the whole process of vm load during migration,
and we wanted to make sure it's safe, hence this patch, right?

> 
> In my perspective, both BQL and RCU can ensure that the flatview will not be
> released when the worker thread accesses the flatview, because before the rcu
> thread releases the flatview, it will make sure itself holding BQL and the
> worker thread not holding RCU. So, whether the depth is 0 or not, as long as
> BQL or RCU is held, the worker thread will not access the obsolete flatview
> (IIUC 'obsolete' means that flatview is released).
> 
> > 
> > To summarize, the original check didn't consider BQL, and if to consider
> > BQL I think it should be something like:
> > 
> >    /* Guarantees valid access to the flatview, either lock works */
> >    assert(BQL_HELD() || RCU_HELD());
> > 
> >    /*
> >     * Guarantees any BQL holder is not reading obsolete flatview (e.g. when
> >     * during vm load)
> >     */
> >    if (BQL_HELD())
> >        assert(depth==0);
> > 
> > IIUC it can be merged into:
> > 
> >    assert((BQL_HELD() && depth==0) || RCU_HELD());
> 
> IMHO assert(BQL_HELD() || RCU_HELD()) is enough..

Yes, but IMHO this will guarantee safe use of flatview only if _before_
your follow up patch.

Before that patch, the depth==0 should always stand (when BQL_HELD()
stands) I think.

After that patch, since depth will be increased at the entry of vm load
there's risk that we can overlook code that will be referencing flatview
during vm load and that can reference an obsolete flatview.  Since the
whole process of qemu_loadvm_state_main() will have BQL held we won't hit
the assertion if only to check "BQL_HELD() || RCU_HELD()" because BQL_HELD
always satisfies.

> 
> Or you think that once a mr transaction is in progress, the old flatview has
> been obsolete? If we regard flatview as obsolete when a mr transaction is in
> progress, How can RCU ensure that flatview is not obsolete?

AFAIU RCU cannot guarantee that.  So IIUC any RCU lock user need to be able
to tolerant obsolete flatviews being referenced and it should not harm the
system.  If it needs the latest update, it should take care of that
separately.

For example, the virtio code we're looking at in this series uses RCU lock
to build address space cache for the device vrings which is based on the
current flatview of mem.  It's safe to reference obsolete flatview in this
case (it means the flatview can be during an update when virtio is
establishing the address space cache), IMHO that's fine because the address
space cache will be updated again in virtio_memory_listener_commit() so
it'll be consistent at last.  The intermediate phase of inconsistency
should be fine in this case just like any DMA happens during a memory
hotplug.

For this specific patch, IMHO the core is to check depth>0 reference, and
we need RCU_HELD to mask out where the obsolete references are fine.

Thanks,

> 
> What does Paolo think of this check?
> 
> Thanks!
> 
> > > I'm not sure if I have a good understanding of your emails? I think
> > > checking(memory_region_transaction_get_depth() == 0 || rcu_read_locked() ||
> > > qemu_mutex_iothread_locked()) should cover the case you discussed.
> > This seems still problematic too?  Since the assert can pass even if
> > neither BQL nor RCU is held (as long as depth==0).
> > 
> > Thanks,
> > 
> 

-- 
Peter Xu


