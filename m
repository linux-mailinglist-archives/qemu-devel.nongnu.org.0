Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16287671737
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 10:15:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI4XG-0008GR-G5; Wed, 18 Jan 2023 04:15:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pI4XE-0008GA-9M
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:15:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pI4XB-0007dy-Ul
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:15:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674033305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CZi7YQnNZCa43BWEEewNB07C8lKut+jdDQpF+6EcEuw=;
 b=GNDw+EOcJmVUl0c3S++WNBQHFZBcLuq15zn0VmWAI/gIEoUjHAOB1sL1W3doWw57sCADyF
 295C0ia7CTxdtxD8pSd7uvgzJs0xQozNE8n/4caM8z1rkCgVyJQAt1g1zEqyldAy893zk5
 gDoMtI3NxyB5dA2MQBAS7p3mlwGjdmU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-aVdBvW_NNnGKre5P54K2Lg-1; Wed, 18 Jan 2023 04:14:56 -0500
X-MC-Unique: aVdBvW_NNnGKre5P54K2Lg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B08C8181E3F4;
 Wed, 18 Jan 2023 09:14:55 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C393339DB3;
 Wed, 18 Jan 2023 09:14:53 +0000 (UTC)
Date: Wed, 18 Jan 2023 10:14:52 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Warner Losh <imp@bsdimp.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 2/3] bsd-user/mmap: use TSA_NO_TSA to suppress clang TSA
 warnings
Message-ID: <Y8e4jMqs3wR0lgpn@redhat.com>
References: <20230117135203.3049709-1-eesposit@redhat.com>
 <20230117135203.3049709-3-eesposit@redhat.com>
 <CANCZdfq=F9HJnjX9sGq6w9tzVx2C8e9jOfk2Lfer_mm2bDRP0A@mail.gmail.com>
 <Y8bMBZFqVP+EFzA8@redhat.com>
 <CANCZdfrg+S-EsjzcJe78aWr3pBaESv1+MUkLa-H6i=o-S0LaqQ@mail.gmail.com>
 <Y8bYI4RgV4F5b1ht@redhat.com>
 <CAJSP0QUedwNbm1cXdU90TSgCmdiV4=Fi0THXg7u6yVhDegtQEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QUedwNbm1cXdU90TSgCmdiV4=Fi0THXg7u6yVhDegtQEA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Am 17.01.2023 um 21:43 hat Stefan Hajnoczi geschrieben:
> On Tue, 17 Jan 2023 at 12:17, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > Am 17.01.2023 um 17:43 hat Warner Losh geschrieben:
> > > On Tue, Jan 17, 2023 at 9:25 AM Kevin Wolf <kwolf@redhat.com> wrote:
> > >
> > > > Am 17.01.2023 um 17:16 hat Warner Losh geschrieben:
> > > > > On Tue, Jan 17, 2023 at 6:52 AM Emanuele Giuseppe Esposito <
> > > > > eesposit@redhat.com> wrote:
> > > > >
> > > > > > QEMU does not compile when enabling clang's thread safety analysis
> > > > > > (TSA),
> > > > > > because some functions create wrappers for pthread mutexes but do
> > > > > > not use any TSA macro. Therefore the compiler fails.
> > > > > >
> > > > > > In order to make the compiler happy and avoid adding all the
> > > > > > necessary macros to all callers (lock functions should use
> > > > > > TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to allusers of
> > > > > > pthread_mutex_lock/pthread_mutex_unlock),
> > > > > > simply use TSA_NO_TSA to supppress such warnings.
> > > > >
> > > > > I'm not sure I understand this quite right. Maybe a clarifying question
> > > > > will help me understand: Why is this needed for bsd-user but not
> > > > > linux-user? How are they different here?
> > > >
> > > > FreeBSD's pthread headers include TSA annotations for some functions
> > > > that force us to do something about them (for now: suppress the warnings
> > > > in their callers) before we can enable -Wthread-safety for the purposes
> > > > where we really want it. Without this, calling functions like
> > > > pthread_mutex_lock() would cause compiler errors.
> > > >
> > > > glibc's headers don't contain such annotations, so the same is not
> > > > necessary on Linux
> > > >
> > >
> > > Thanks Kevin. With that explanation, these patches and their explanation
> > > make perfect sense now. Often when there's a patch to bsd-user but not
> > > linux-user, it's because bsd-user needs to do more in some way (which I try
> > > to keep up on).
> > >
> > > In this case, it's because FreeBSD's libc is a bit ahead of the curve. So I
> > > understand why it's needed, and what I need to do next (though I think that
> > > I may have to wait for the rest of qemu to be annotated)...
> >
> > I assume that the bsd-user part is actually sufficiently independent
> > that you could do proper annotations there if you want.
> >
> > However, be aware that TSA has some serious limitations with C, so you
> > can't express certain things, and it isn't as strict as it could be (in
> > particular, function pointers bypass it). As long as you have global
> > locks (as opposed to locks in structs), it kind of works, though.
> > Certainly better than nothing.
> 
> What are the limitations on locks in structs (a common case)?

TSA_GUARDED_BY() can't refer to a mutex in the same struct in C. You
would have to have something like 'this', but it just doesn't exist. (I
think in C++ you don't actually need 'this' because name resolution
automatically starts at the struct or something - I neither know C++
well enough nor TSA with it, so take this with a grain of salt.)

You can still annotate functions for such structs in C, because then you
have a name for the struct, like this:

void lock(Foo *foo) TSA_REQUIRES(foo->mutex);

Kevin


