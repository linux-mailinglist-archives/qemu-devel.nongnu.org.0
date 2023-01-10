Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE906645A5
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:10:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFFt1-0005Mj-5y; Tue, 10 Jan 2023 09:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pFFsf-0005Ez-BD
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 09:45:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pFFsd-0003sA-Me
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 09:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673361934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JDOfyuFJragfwMyanZnxrcJYme7TiX5Qul7RC23WBbI=;
 b=QaEGwG8JXo5vsIDQVXIibJFfYpC23r0Xq9GctYHhobu3kil0LIhIJ8d3AH7bzOhxXuLMbC
 G4qgNYChzfTv3CdxdVQQ7OJvcXNhhVw6ZDsD0qEvKT49arH3IF221Ch1NrVBq2FH2Sqvqb
 CX1wXn+9bbm9oBOR9cvKIGW57P5fDts=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-RyLs6UxgMs2KY6VYC8GX2g-1; Tue, 10 Jan 2023 09:45:33 -0500
X-MC-Unique: RyLs6UxgMs2KY6VYC8GX2g-1
Received: by mail-qk1-f198.google.com with SMTP id
 bj37-20020a05620a192500b00704dc44b050so8933822qkb.14
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 06:45:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JDOfyuFJragfwMyanZnxrcJYme7TiX5Qul7RC23WBbI=;
 b=y2sshbPcSLzMkocD3dKwTCezEmI6oEmOIfmh61AFSfuVFrjyvTStmZnUFUZjXcadeN
 238lgJlXuktORVULjkxs8p3m03AQcf1PHQ47gk7Wpp1PmaXrBrFkOUIuR3TxEBK6Rvk3
 q9XXGJdW9xJUO7nkRn6pEYK7jRnJ2ioJ0JinvKcT03oIjzHNuIA3dnD4bev1nZyJEf1B
 6GwoDDRv9b0vvtPN3/+yKb/ypvHBa1RLsQFvl1V4jiGDAUarSCg4yasaDF595KPLJISv
 A/I0AiIM2yU7i6ME5kCUMJY0+YafoPCjFRp7DizbG+XvWzvnt04EbgEa92lyGkgMmeJd
 RITg==
X-Gm-Message-State: AFqh2kqz/lv/YUcYFhYEDc6F/DYUYkTp/okQYbMGHa0W0DCkaurF4GPT
 LpeWHsFsyYmjCv9McwJaOe1DmL0gQrngkXr8uHF47sxoH2ZKpvEMN8UJkRXDRBcQhSCOEFrjDAM
 T047dBIdfIPpMf+c=
X-Received: by 2002:ac8:6f07:0:b0:3ab:c8c6:51c2 with SMTP id
 bs7-20020ac86f07000000b003abc8c651c2mr36833182qtb.62.1673361932592; 
 Tue, 10 Jan 2023 06:45:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv9Kxc34xYgzZvW9K6MNGCaxydKjDGohCt0wlKRo14iGndlw5MrghoPt+tE++/1trKbc9c5OQ==
X-Received: by 2002:ac8:6f07:0:b0:3ab:c8c6:51c2 with SMTP id
 bs7-20020ac86f07000000b003abc8c651c2mr36833143qtb.62.1673361932290; 
 Tue, 10 Jan 2023 06:45:32 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-39-70-52-228-144.dsl.bell.ca.
 [70.52.228.144]) by smtp.gmail.com with ESMTPSA id
 bi1-20020a05620a318100b006fb0e638f12sm7241474qkb.4.2023.01.10.06.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 06:45:31 -0800 (PST)
Date: Tue, 10 Jan 2023 09:45:30 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 David Gilbert <dgilbert@redhat.com>,
 "Quintela, Juan" <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 zhouyibo@bytedance.com
Subject: Re: [RFC v4 2/3] memory: add depth assert in address_space_to_flatview
Message-ID: <Y716CoJeHKZ6nP1x@x1n>
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
 <20221223142307.1614945-3-xuchuangxclwt@bytedance.com>
 <05c4cb9e-0f41-c60f-6a68-cf5050ad7a02@redhat.com>
 <Y6XPRD4fSucgWZfT@x1n>
 <CABgObfa=i=9CZRFyX_EXBOSW===iDhcZoDO8Ju64F-tHUAXdRA@mail.gmail.com>
 <Y7RpPwGd0WvrENlz@x1n>
 <CALophuvJ2g7D9idGHfQEK3Co7o06ab38ZK3CCGZX0tDdQX_+Tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALophuvJ2g7D9idGHfQEK3Co7o06ab38ZK3CCGZX0tDdQX_+Tg@mail.gmail.com>
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

On Tue, Jan 10, 2023 at 12:09:41AM -0800, Chuang Xu wrote:
> Hi, Peter and Paolo,

Hi, Chuang, Paolo,

> I'm sorry I didn't reply to your email in time. I was infected with
> COVID-19 two weeks ago, so I couldn't think about the problems discussed
> in your email for a long time.😷
> 
> On 2023/1/4 上午1:43, Peter Xu wrote:
> > Hi, Paolo,
> >
> > On Wed, Dec 28, 2022 at 09:27:50AM +0100, Paolo Bonzini wrote:
> >> Il ven 23 dic 2022, 16:54 Peter Xu ha scritto:
> >>
> >>>> This is not valid because the transaction could happen in *another*
> >>> thread.
> >>>> In that case memory_region_transaction_depth() will be > 0, but RCU is
> >>>> needed.
> >>> Do you mean the code is wrong, or the comment? Note that the code has
> >>> checked rcu_read_locked() where introduced in patch 1, but maybe
> something
> >>> else was missed?
> >>>
> >> The assertion is wrong. It will succeed even if RCU is unlocked in this
> >> thread but a transaction is in progress in another thread.
> > IIUC this is the case where the context:
> >
> > (1) doesn't have RCU read lock held, and,
> > (2) doesn't have BQL held.
> >
> > Is it safe at all to reference any flatview in such a context? The thing
> > is I think the flatview pointer can be freed anytime if both locks are
> not
> > taken.
> >
> >> Perhaps you can check (memory_region_transaction_depth() > 0 &&
> >> !qemu_mutex_iothread_locked()) || rcu_read_locked() instead?
> > What if one thread calls address_space_to_flatview() with BQL held but
> not
> > RCU read lock held? I assume it's a legal operation, but it seems to be
> > able to trigger the assert already?
> >
> > Thanks,
> >
> I'm not sure whether I understand the content of your discussion correctly,
> so here I want to explain my understanding firstly.
> 
> From my perspective, Paolo thinks that when thread 1 is in a transaction,
> thread 2 will trigger the assertion when accessing the flatview without
> holding RCU read lock, although sometimes the thread 2's access to flatview
> is legal. So Paolo suggests checking (memory_region_transaction_depth() > 0
> && !qemu_mutex_iothread_locked()) || rcu_read_locked() instead.
> 
> And Peter thinks that as long as no thread holds the BQL or RCU read lock,
> the old flatview can be released (actually executed by the rcu thread with
> BQL held). When thread 1 is in a transaction, if thread 2 access the
> flatview
> with BQL held but not RCU read lock held, it's a legal operation. In this
> legal case, it seems that both my code and Paolo's code will trigger
> assertion.

IIUC your original patch is fine in this case (BQL held, RCU not held), as
long as depth==0.  IMHO what we want to trap here is when BQL held (while
RCU is not) and depth>0 which can cause unpredictable side effect of using
obsolete flatview.

To summarize, the original check didn't consider BQL, and if to consider
BQL I think it should be something like:

  /* Guarantees valid access to the flatview, either lock works */
  assert(BQL_HELD() || RCU_HELD());

  /*
   * Guarantees any BQL holder is not reading obsolete flatview (e.g. when
   * during vm load)
   */
  if (BQL_HELD())
      assert(depth==0);

IIUC it can be merged into:

  assert((BQL_HELD() && depth==0) || RCU_HELD());

> 
> I'm not sure if I have a good understanding of your emails? I think
> checking(memory_region_transaction_get_depth() == 0 || rcu_read_locked() ||
> qemu_mutex_iothread_locked()) should cover the case you discussed.

This seems still problematic too?  Since the assert can pass even if
neither BQL nor RCU is held (as long as depth==0).

Thanks,

-- 
Peter Xu


