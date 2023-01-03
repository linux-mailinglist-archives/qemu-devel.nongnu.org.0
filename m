Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCA965C544
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 18:44:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClK6-000631-Jp; Tue, 03 Jan 2023 12:43:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pClK4-00062q-Jp
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 12:43:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pClK2-0007or-PM
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 12:43:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672767814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XzGix9yjaWAOavAy/R8E8rSqTk1Df8t3cTV/+/l1jE8=;
 b=HSOaXL7ZthzNgbuSon8/tGbSasqjj7NiNIJp33Asv9hH4cGeGmq4dIzut+sGYx6MTNf4CR
 zo0csR/gQPw6hQXzHPppwMUa0TQdbpN/HnUvR+Woy0uqiIFwvL08Rp6ngABnk/ajXVR/Jv
 jcI1orsYUvemd4UlyQ2fuhI79fYIqg4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-Cq_6j-6rPbOV0Zs9JigaKg-1; Tue, 03 Jan 2023 12:43:30 -0500
X-MC-Unique: Cq_6j-6rPbOV0Zs9JigaKg-1
Received: by mail-qv1-f72.google.com with SMTP id
 mu2-20020a056214328200b00531cc0222faso2511119qvb.14
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 09:43:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XzGix9yjaWAOavAy/R8E8rSqTk1Df8t3cTV/+/l1jE8=;
 b=zDZdsp9aHMik7IZwwMmsCV35y8da6BlkxwOpyNybZIh/cC5ZywOcoVVNw31KuLbwx/
 P24gOLBOKymn6E0EBs/bEWcwsR/HJiFngzDwLjWuSfUsH3t2KyYtRLuufP4BRLnUnn15
 2Bxxh860y5Mq+cO48C6DI2BNNA2svqvqH729BfI2nMh+dj5RVX9pdHsR6zyB+N/XqSCR
 BPjZqWN2xhQCtOQM11p4BTg0TTMXGfnk1vFKNhOVDRIYkvkE6bikc0gqDmMMzkwhNPLK
 qqTZbGl/yb90J7qasaCZ2UKoM6qneY4PzGqlVKZ0G4XbfbDyJzsa3OHfUFan0WgcO2RR
 TTdA==
X-Gm-Message-State: AFqh2kqxKDNy9KUyXlrpSrM36r5moVccE44ysv4nB3EDx3txtskJ3bjE
 6+14r2TfzhfHJAky8HoO9OfhUmXVRemBEEhyuvTS6g6fliVBQwGZd5oSkihMw/QMNsuwGYwsWbh
 OjSyyAyCFTLBbWe4=
X-Received: by 2002:ac8:470e:0:b0:3a7:ea9e:566d with SMTP id
 f14-20020ac8470e000000b003a7ea9e566dmr50140424qtp.65.1672767809638; 
 Tue, 03 Jan 2023 09:43:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt/TeqEIEVnpBcgQGc9woz0ZWflhl1tIQBie3OOfDTS1UxVpVhnF3E+XOlUmRDW88qY2CjDPw==
X-Received: by 2002:ac8:470e:0:b0:3a7:ea9e:566d with SMTP id
 f14-20020ac8470e000000b003a7ea9e566dmr50140408qtp.65.1672767809434; 
 Tue, 03 Jan 2023 09:43:29 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-39-70-52-228-144.dsl.bell.ca.
 [70.52.228.144]) by smtp.gmail.com with ESMTPSA id
 c27-20020a05620a269b00b007054a238bf2sm5711222qkp.126.2023.01.03.09.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 09:43:28 -0800 (PST)
Date: Tue, 3 Jan 2023 12:43:27 -0500
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Chuang Xu <xuchuangxclwt@bytedance.com>,
 qemu-devel <qemu-devel@nongnu.org>, David Gilbert <dgilbert@redhat.com>,
 "Quintela, Juan" <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 zhouyibo@bytedance.com
Subject: Re: [RFC v4 2/3] memory: add depth assert in address_space_to_flatview
Message-ID: <Y7RpPwGd0WvrENlz@x1n>
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
 <20221223142307.1614945-3-xuchuangxclwt@bytedance.com>
 <05c4cb9e-0f41-c60f-6a68-cf5050ad7a02@redhat.com>
 <Y6XPRD4fSucgWZfT@x1n>
 <CABgObfa=i=9CZRFyX_EXBOSW===iDhcZoDO8Ju64F-tHUAXdRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABgObfa=i=9CZRFyX_EXBOSW===iDhcZoDO8Ju64F-tHUAXdRA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

Hi, Paolo,

On Wed, Dec 28, 2022 at 09:27:50AM +0100, Paolo Bonzini wrote:
> Il ven 23 dic 2022, 16:54 Peter Xu <peterx@redhat.com> ha scritto:
> 
> > > This is not valid because the transaction could happen in *another*
> > thread.
> > > In that case memory_region_transaction_depth() will be > 0, but RCU is
> > > needed.
> >
> > Do you mean the code is wrong, or the comment?  Note that the code has
> > checked rcu_read_locked() where introduced in patch 1, but maybe something
> > else was missed?
> >
> 
> The assertion is wrong. It will succeed even if RCU is unlocked in this
> thread but a transaction is in progress in another thread.

IIUC this is the case where the context:

  (1) doesn't have RCU read lock held, and,
  (2) doesn't have BQL held.

Is it safe at all to reference any flatview in such a context?  The thing
is I think the flatview pointer can be freed anytime if both locks are not
taken.

> Perhaps you can check (memory_region_transaction_depth() > 0 &&
> !qemu_mutex_iothread_locked()) || rcu_read_locked() instead?

What if one thread calls address_space_to_flatview() with BQL held but not
RCU read lock held?  I assume it's a legal operation, but it seems to be
able to trigger the assert already?

Thanks,

-- 
Peter Xu


