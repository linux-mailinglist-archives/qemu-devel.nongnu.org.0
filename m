Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4DF6A9B96
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:21:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY89M-0002eC-LR; Fri, 03 Mar 2023 11:20:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pY89K-0002ds-AY
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:20:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pY89I-0001Di-Pv
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677860448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1rlI+GxjRUNpxls9dTK5YpyTrI1x+702fenhJeye3qk=;
 b=Yg9Jr9F5NjnWUkjvTWwWsGiVN3oKleop6T+t44YWgRWnowa2CXPlsmmgob2W3wimaiqvs1
 GpuWQ/EKQX639otseBcnssASzw9Ex4MJKyUkdIvWUTwuWccmyVpk7tnGv1vPUDTPeK7GqG
 83FaJoF9M3xXh76y4Bjd8cm++/AF8kQ=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-mBYHnPZNOdS9R4qppaal-w-1; Fri, 03 Mar 2023 11:20:44 -0500
X-MC-Unique: mBYHnPZNOdS9R4qppaal-w-1
Received: by mail-ua1-f70.google.com with SMTP id
 cd11-20020a056130108b00b00657d8cfac32so1401176uab.8
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:20:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677860444;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1rlI+GxjRUNpxls9dTK5YpyTrI1x+702fenhJeye3qk=;
 b=AfQubBy222DebVXfPrxY4SHrHOPSyLv7+M9pR+KX//tjjIz2tNKeEsVBp4pXUMyOeA
 aUzyPL3qyBmx95GzuDg8MWOKAqA8VMHRGXzW0O42PFC4FOKYp/55Y6GpMmr9PSGZY83z
 6EsCQVtQflOh04yJxfjEgOi2hHjJ6duSurZlRRK0uX5L1C+OpYo5nr+GBkhFgyzZc30q
 S7zYKprc1Kue6cA6ICL/sJMT71yPCna4lLEwf0XXa2vIoVUqWCGrASQEPabTDWfV1zAV
 iVoiR9dgQQOw8B8RxnaQkQGunV+TkF+D+4P1rbD64SOTQgP0AOv2MZMdLV3Ke5ujRCIt
 YBHw==
X-Gm-Message-State: AO0yUKV+ADtRaAg+POJ0KGwguKsJffKNL2Bfi7GwNQSzk+QOXxqhUxQK
 MQo1H6c8QEUNfo3wxcEfKJ8Y78r/2he1cVxY0qD6LC+xD0AILCvmGFHE8WSlmOvBlvlOxL6DoiK
 etVJ7oG9kitExrjc=
X-Received: by 2002:a05:6122:1808:b0:3e1:7586:c382 with SMTP id
 ay8-20020a056122180800b003e17586c382mr1328932vkb.1.1677860444206; 
 Fri, 03 Mar 2023 08:20:44 -0800 (PST)
X-Google-Smtp-Source: AK7set/rvDgY+Wk25SUodg/+ogsHNG7seRA1uqu/yTOEH5gKOJhN6wgJ78nBysnf8iS20GN8XqS7+Q==
X-Received: by 2002:a05:6122:1808:b0:3e1:7586:c382 with SMTP id
 ay8-20020a056122180800b003e17586c382mr1328920vkb.1.1677860443913; 
 Fri, 03 Mar 2023 08:20:43 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 c2-20020a05620a0ce200b00739f84a6c23sm1956098qkj.113.2023.03.03.08.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 08:20:43 -0800 (PST)
Date: Fri, 3 Mar 2023 11:20:42 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Chuang Xu <xuchuangxclwt@bytedance.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH RFC 0/4] memory: Fix (/ Discuss) a few rcu issues
Message-ID: <ZAIeWjRX08C8MRF0@x1n>
References: <20230225163141.1209368-1-peterx@redhat.com>
 <6c75e2e2-5ba9-bc52-2c6c-a0bfb5f5b56f@redhat.com>
 <ZAC2ccoQpFLa07ZK@x1n>
 <4f130497-1200-8c42-7d48-cadf54f3f6a4@redhat.com>
 <ZAEaO7Yqw2F8hbbV@x1n>
 <c4b70513-7cbc-a858-58ed-537c8fe7795e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c4b70513-7cbc-a858-58ed-537c8fe7795e@redhat.com>
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

On Fri, Mar 03, 2023 at 10:10:12AM +0100, David Hildenbrand wrote:
> On 02.03.23 22:50, Peter Xu wrote:
> > On Thu, Mar 02, 2023 at 04:11:56PM +0100, David Hildenbrand wrote:
> > > I guess the main concern here would be overhead from gabbing/releasing the
> > > BQL very often, and blocking the BQL while we're eventually in the kernel,
> > > clearing bitmaps, correct?
> > 
> > More or less yes.  I think it's pretty clear we move on with RCU unless
> > extremely necessary (which I don't think..), then it's about how to fix the
> > bug so rcu safety guaranteed.
> 
> What about an additional simple lock?
> 
> Like:
> 
> * register/unregister requires that new notifier lock + BQL
> * traversing notifiers requires either that new lock or the BQL

This will work, but this will also brings us backstep a bit.

I think we shouldn't allow concurrency for notifiers, more below.  It's
more about sometimes QEMU walking the two lists has nothing to do with
notifiers (like memory_region_find_rcu), that's the major uncertainty to
me.  Also on the future plans of using more RCU in QEMU code.

> We simply take the new lock in that problematic function. That would work as
> long as we don't require traversal of the notifiers concurrently -- and as
> long as we have a lot of bouncing back and forth (I don't think we have,
> even in the migration context, or am I wrong?).
> 
> That way we also make sure that each notifier is only called once. I'm not
> 100% sure if all notifiers would expect to be called concurrently.

Yes I think so.  AFAIU most of the notifiers should only be called with BQL
then they'll already be serialized (and hooks normally has yet another
layer of protection like kvm).

Clear log is something special. Afaik it's protected by RAMState's
bitmap_mutex so far, but not always..

The unaccuracy is because clear log can also be triggered outside migration
where there's no context of bitmap_mutex.

But AFAICT concurrent clear log is also fine because it was (somehow
tailored...) for kvm, so it'll anyway be serialized at kvm_slots_lock().
We'll need to be careful when growing log_clear support, though.

-- 
Peter Xu


