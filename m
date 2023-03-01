Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A5C6A7090
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 17:08:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXP04-0001z3-At; Wed, 01 Mar 2023 11:08:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pXP01-0001yP-NB
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 11:08:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pXOzz-0003sb-RO
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 11:08:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677686887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xtMNR/Fa8sxz+yQ8ERW7eBIuENAWWmSGQB38sP4IXBQ=;
 b=ToxwuKc1/5XXE4HbwvCwt4nY66HfpqKZDXeMcu8NkyqGgbpVf8aYW6rknC1xjUn1CwoChb
 W9Yg7IEtj0H2Br79I+b+zMXkDtOLKZwb+vOHDf93mTtzMu6nzC3/vqR7MPsdTm2KBQEOUI
 8wTYzE3ZHu6T2ut/GbqinG7OFUYewQI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-650-mxmLqTgCNFKsf_k2WxGbIA-1; Wed, 01 Mar 2023 11:08:05 -0500
X-MC-Unique: mxmLqTgCNFKsf_k2WxGbIA-1
Received: by mail-qt1-f197.google.com with SMTP id
 l12-20020ac84a8c000000b003bfe751a7fdso3314515qtq.1
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 08:08:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677686884;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xtMNR/Fa8sxz+yQ8ERW7eBIuENAWWmSGQB38sP4IXBQ=;
 b=qIbF2oPwW8X9vPM+OVtikN45rvr/T9n2YCMYrfPji0r3cL1AHRdLeC0JZvgzqIJmH+
 j6Z50kStYCQVum2qEpHzzcOy7UVl+SN2MS6pK+ZeBYc0/ie9tiAZzJLHGiTxuECcde7K
 kCi7muTnjLgWgeLt8Ole4PEVKeLxA2srYbnHSWd2I1BPld4SGqtvxd9tI2FTPooUQ+S4
 +yfYg+VQk+9HQYGr43qUaMcH0GB/kw54uP++JACFxJwIyj6wWqcrV4E6fXjp0p8Qd/z8
 qDMP4Co+1RPXtNpwQkCyUa/NSrOQfLUui7J3MSmgP1abJ7OENu7qmAdMiDfvtplQaCkT
 /DRw==
X-Gm-Message-State: AO0yUKUY3TO0B27xOXL33JMtjOMj2YgdR7Qm+5KCtuAAe8E7+cz2cQJy
 wSgIMNokcx3/jxboYI1prjlohZxvPByKUaZYxCFGcCyemXiCatJPJ6wZ+WksnrquziGp0HFU+Mj
 g4S1Fg796dCmxsHI=
X-Received: by 2002:a0c:9c0e:0:b0:56b:e73e:e925 with SMTP id
 v14-20020a0c9c0e000000b0056be73ee925mr10128524qve.0.1677686883824; 
 Wed, 01 Mar 2023 08:08:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/SVP12Y577l5UBfl68M+orF3Lo3TCLo+b+eQMAtWfiovvsh79cMKzsDA4DprhhJu+kUm4mlg==
X-Received: by 2002:a0c:9c0e:0:b0:56b:e73e:e925 with SMTP id
 v14-20020a0c9c0e000000b0056be73ee925mr10128491qve.0.1677686883509; 
 Wed, 01 Mar 2023 08:08:03 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 d25-20020a05620a205900b0073d873df3fesm9075826qka.30.2023.03.01.08.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 08:08:02 -0800 (PST)
Date: Wed, 1 Mar 2023 11:08:01 -0500
From: Peter Xu <peterx@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Chuang Xu <xuchuangxclwt@bytedance.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH RFC 0/4] memory: Fix (/ Discuss) a few rcu issues
Message-ID: <Y/94YfBFIqZhrplF@x1n>
References: <20230225163141.1209368-1-peterx@redhat.com>
 <Y/6X1buYOXDpaXO0@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y/6X1buYOXDpaXO0@fedora>
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

On Tue, Feb 28, 2023 at 07:09:57PM -0500, Stefan Hajnoczi wrote:
> On Sat, Feb 25, 2023 at 11:31:37AM -0500, Peter Xu wrote:
> > [not for merging, but for discussion; this is something I found when
> >  looking at another issue on Chuang's optimization for migration downtime]
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
> > 
> > The current patchset (in patch 1) did it with drain_call_rcu(), but of
> > course it's wrong, because of at least two things:
> > 
> >   (1) drain_call_rcu() will release BQL; currently there's no way to me to
> >       guarantee that releasing BQL is safe here.
> > 
> >   (2) memory_listener_unregister() can be called within a RCU read lock
> >       itself (we're so happy to take rcu read lock in many places but we
> >       don't think much on how long it'll be taken; at least not as strict
> >       as the kernel variance, so we're just less care about that fact yet).
> >       It means, drain_call_rcu() should deadlock there waiting for itself.
> >       For an example, see Appendix A.
> > 
> > Side question to Stefan / Maxim: why do we need drain_call_rcu() and what's
> > its difference from synchronize_rcu() in API level besides releasing and
> > retaking BQL when taken?
> 
> Hi,
> I haven't taken a look at the patches or thought about the larger
> problem you're tackling here, but I wanted to reply to this specific
> question.
> 
> It's been a long time since Maxim, Paolo, and I discussed this, but
> drain_call_rcu() and synchronize_rcu() do different things:
> - drain_call_rcu() is about waiting until the current thread's
>   call_rcu() callbacks have completed.
> - synchronize_rcu() is about waiting until there are no more readers in
>   the last grace period.
> 
> Calling synchronize_rcu() doesn't guarantee that call_rcu_thread() has
> completed pending call_rcu() callbacks. Therefore it's not appropriate
> for the existing drain_call_rcu() callers because they rely on previous
> call_rcu() callbacks to have finished.

Ah I missed that detail.

I was quickly thinking whether such a requirement can also be done with a
customized rcu callback that will simply kick a signal after the real
"free" is done, while the call_rcu() context can wait for the signal.  It's
just that assuming RCU callbacks will be executed in order is slightly
tricky.  But I guess it's also hard if the call_rcu() is deep in the stack
so drain_call_rcu() should avoid fiddling on the details.

Thanks Stefan!

-- 
Peter Xu


