Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DC14A82C7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 11:58:21 +0100 (CET)
Received: from localhost ([::1]:57878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFZoi-0001K5-NN
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 05:58:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nFZnR-0008IH-VT
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:57:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nFZnN-0006px-7J
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643885816;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=DKQCMXbNKm8uQa3Ay77/MSVcCuHALysj0d/QRFIjAco=;
 b=FEvRTEz7NGFvWTXbWoCdUTazH7LnkEqO1LGOJwgICbuKZ3PVFPIt0Q1cGU2+63+pn+h1Bl
 3xTwxNUHXwnQ449TNE/jcbsfqLWoUyGeH3c4fMmqGGU5HrZ9eeLNpZVgiHK6N9ChRfOkFI
 Xcstg6YmY/xWfSy1Z1aCirP7zYsmPak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-pKfJ6ER5OPS6YD1epNtRBg-1; Thu, 03 Feb 2022 05:56:55 -0500
X-MC-Unique: pKfJ6ER5OPS6YD1epNtRBg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C4871091DA7;
 Thu,  3 Feb 2022 10:56:54 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73F9578C1E;
 Thu,  3 Feb 2022 10:56:52 +0000 (UTC)
Date: Thu, 3 Feb 2022 10:56:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC] thread-pool: Add option to fix the pool size
Message-ID: <Yfu08bAJKnRC3eFD@redhat.com>
References: <20220202175234.656711-1-nsaenzju@redhat.com>
 <Yfu0E5LwZ/x0EZrl@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <Yfu0E5LwZ/x0EZrl@stefanha-x1.localdomain>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mtosatti@redhat.com,
 qemu-devel@nongnu.org, hreitz@redhat.com, pbonzini@redhat.com,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 03, 2022 at 10:53:07AM +0000, Stefan Hajnoczi wrote:
> On Wed, Feb 02, 2022 at 06:52:34PM +0100, Nicolas Saenz Julienne wrote:
> > The thread pool regulates itself: when idle, it kills threads until
> > empty, when in demand, it creates new threads until full. This behaviour
> > doesn't play well with latency sensitive workloads where the price of
> > creating a new thread is too high. For example, when paired with qemu's
> > '-mlock', or using safety features like SafeStack, creating a new thread
> > has been measured take multiple milliseconds.
> > 
> > In order to mitigate this let's introduce a new option to set a fixed
> > pool size. The threads will be created during the pool's initialization,
> > remain available during its lifetime regardless of demand, and destroyed
> > upon freeing it. A properly characterized workload will then be able to
> > configure the pool to avoid any latency spike.
> > 
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
> > 
> > ---
> > 
> > The fix I propose here works for my specific use-case, but I'm pretty
> > sure it'll need to be a bit more versatile to accommodate other
> > use-cases.
> > 
> > Some questions:
> > 
> > - Is unanimously setting these parameters for any pool instance too
> >   limiting? It'd make sense to move the options into the AioContext the
> >   pool belongs to. IIUC, for the general block use-case, this would be
> >   'qemu_aio_context' as initialized in qemu_init_main_loop().
> 
> Yes, qemu_aio_context is the main loop's AioContext. It's used unless
> IOThreads are configured.
> 
> It's nice to have global settings that affect all AioContexts, so I
> think this patch is fine for now.
> 
> In the future IOThread-specific parameters could be added if individual
> IOThread AioContexts need tuning (similar to how poll-max-ns works
> today).
> 
> > - Currently I'm setting two pool properties through a single qemu
> >   option. The pool's size and dynamic behaviour, or lack thereof. I
> >   think it'd be better to split them into separate options. I thought of
> >   different ways of expressing this (min/max-size where static happens
> >   when min-size=max-size, size and static/dynamic, etc..), but you might
> >   have ideas on what could be useful to other use-cases.
> 
> Yes, "min" and "max" is more flexible than fixed-size=n. fixed-size=n is
> equivalent to min=n,max=n. The current default policy is min=0,max=64.
> If you want more threads you could do min=0,max=128. If you want to
> reserve 1 thread all the time use min=1,max=64.
> 
> I would go with min and max.

This commit also exposes this as a new top level command line
argument. Given our aim to eliminate QemuOpts and use QAPI/QOM
properties for everything I think we need a different approach.

I'm not sure which exisiting QAPI/QOM option it most appropriate
to graft these tunables onto ?  -machine ?  -accel ?  Or is there
no good fit yet ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


