Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE194DB0D3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:16:21 +0100 (CET)
Received: from localhost ([::1]:52608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTVk-0006Fc-6Q
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:16:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUTLz-0000bd-NP
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:06:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUTLv-0001J0-Cw
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:06:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647435970;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ws+GoVs3tI0RKwu+vn0QrLnVXD9I7gDKcHLeyStbPbs=;
 b=Zy8CCGLd5WvrmJFWAAYv10n56tNBVxBLrnmd2mScAZ6rfmk7VQiUPONxfosqOFdZqw1XOX
 0gy8BCJLmXrrGOj30zrNk/OOCZAoQOY6/HEyY9zAXW82fP7Wh8yl3s5Ck7Gg+p1RdliY6v
 9iM9pTUpKdszSl3ymo2KCPMIPN+On6I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-8sO3Nz9pM-K45KKSmK4ARg-1; Wed, 16 Mar 2022 09:06:06 -0400
X-MC-Unique: 8sO3Nz9pM-K45KKSmK4ARg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 735C7185A7BA;
 Wed, 16 Mar 2022 13:06:06 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1FB64029D4;
 Wed, 16 Mar 2022 13:06:04 +0000 (UTC)
Date: Wed, 16 Mar 2022 13:06:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Message-ID: <YjHgugc8rBKaCjur@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
 <YjCdKfbQsgfsw76N@stefanha-x1.localdomain>
 <CAFEAcA8zongmSfDAgorr=RfKK6Qsgyi1xNz5KBzdB0RGeSBSWA@mail.gmail.com>
 <dca7d15b-2f24-cfb2-9a31-47b5ffd9c3d5@redhat.com>
 <YjHY8GA52MzjBxLK@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YjHY8GA52MzjBxLK@stefanha-x1.localdomain>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 12:32:48PM +0000, Stefan Hajnoczi wrote:
> On Tue, Mar 15, 2022 at 06:29:50PM +0100, Paolo Bonzini wrote:
> > On 3/15/22 15:24, Peter Maydell wrote:
> > > On Tue, 15 Mar 2022 at 14:09, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > > > Also, once C++ is available people will
> > > > start submitting C++ patches simply because they are more comfortable
> > > > with C++ (especially one-time/infrequent contributors).
> > > 
> > > This to my mind is the major argument against using C++
> > > for coroutines...
> > 
> > I agree on the need for a policy, but _what_ C++ are they going to be
> > contributing that we should be scared of?  We're talking about:
> > 
> > * major features contributed by one-time/infrequent participants (which is
> > already a once-in-a-year thing or so, at least for me)
> > 
> > * ... in an area where there are no examples of using C++ in the tree (or
> > presumably the maintainer would be comfortable reviewing it)
> > 
> > * ... but yet C++ offer killer features (right now there's only C++
> > coroutines and fpu/)
> 
> You are assuming people only choose C++ only when it offers features not
> available in C. I think they might simply be more comfortable in C++.
> 
> In other words, if an existing file is compiled using a C++ compiler or
> they are adding a new file, they don't need a reason to use C++, they
> can just use it.
> 
> You can define rules and a way to enforce a subset of C++, but I think
> over time the code will be C++. A policy that is complicated discourages
> contributors.
> 
> For these reasons I think that if code runs through a C++ compiler we
> should just allow C++. Either way, it will take time but that way no one
> will feel betrayed when C++ creeps in.
> 
> That said, I hope we find an option that doesn't involve C++.

The real show stopper with our current coroutine impl IIUC, is the
undefined behaviour when we yield and restore across different threads.

Is there any relastic hope that we can change QEMU's usage, such that
each coroutine is confined to a single thread, to avoid the undefined
behaviour ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


