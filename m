Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E4A4D9F72
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 16:58:06 +0100 (CET)
Received: from localhost ([::1]:51634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU9Yi-0005gT-BR
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 11:58:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nU9We-000440-DN
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:55:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nU9Wa-0005EO-Ee
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:55:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647359751;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=a6LIvxTlue7BV3YvQIcQUHsm1Q5Rqt2Ts0fkDY6cDJM=;
 b=ZIPi2I7ZuPplmgB1kje1o/V+kX4q/FUb6KybecXLXHM12gpIRMq4Gt9Z5OwP31qxKC9Kmt
 OG8GW+j6vonllDedJccgGY5bz2/N7vO1FYcWEK2UGg92oXs3cIRs/SbmJrfrDlqDbAgc6v
 XUi/P2A0/QojtOwTtmWql9kllDL6aGQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-pKiVS_CfOheJQ6zxgslIpQ-1; Tue, 15 Mar 2022 11:55:46 -0400
X-MC-Unique: pKiVS_CfOheJQ6zxgslIpQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 121253C163EC;
 Tue, 15 Mar 2022 15:55:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03CCC111C4BD;
 Tue, 15 Mar 2022 15:55:38 +0000 (UTC)
Date: Tue, 15 Mar 2022 15:55:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Message-ID: <YjC2+F2SkNEDOXTe@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
 <YjCdKfbQsgfsw76N@stefanha-x1.localdomain>
 <YjCnss5W5MhZK1Hw@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YjCnss5W5MhZK1Hw@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, hreitz@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 03:50:26PM +0100, Kevin Wolf wrote:
> Am 15.03.2022 um 15:05 hat Stefan Hajnoczi geschrieben:
> > On Mon, Mar 14, 2022 at 05:21:22PM +0100, Paolo Bonzini wrote:
> > > On 3/14/22 15:07, Stefan Hajnoczi wrote:
> > > > If we can reach a consensus about C++ language usage in QEMU then I'm in
> > > > favor of using C++ coroutines. It's probably not realistic to think we
> > > > can limit C++ language usage to just coroutines forever. Someone finds
> > > > another C++ feature they absolutely need and over time the codebase
> > > > becomes C++ - with both its advantages and disadvantages.
> > > > 
> > > > [...] although you can write C in C++, it's not idiomatic modern C++.
> > > > The language lends itself to a different style of programming that
> > > > some will embrace while others will not.
> > > 
> > > Yes, this is an important aspect to discuss.  I think coroutines provide a
> > > good blueprint for how QEMU might use C++.
> > > 
> > > I totally agree that, if we go this way, the genie is out of the bottle and
> > > other uses of C++ will pop up with 100% probability.  But the important
> > > thing to note is that our dialect of C is already not standard C, and that
> > > some of our or GLib's "innovations" are actually based on experience with
> > > C++.  We can keep on writing "QEMU's C" if we think of C++ as a supercharged
> > > way of writing these quality-of-life improvements that we already write.  In
> > > some sense coroutines are an extreme example of this idea.
> > > 
> > > In fact, a C API would have to remain unless all source files are changed to
> > > C++, so QEMU would remain mostly a C project with C idioms, but that doesn't
> > > prevent _abstracting_ the use of C++ features (written in modern, idiomatic
> > > C++) behind an API that C programmers have no problems learning.  Again,
> > > coroutines are an example of this of keeping the familiar create/enter/yield
> > > API and hiding the "magic" of C++ coroutines (and when they don't, that had
> > > better be an improvement).
> > > 
> > > In the end, C++ is a tool that you can use if it leads to better code. For
> > > example, I don't see much use of C++ for devices for example, and the
> > > storage devices in particular do not even need coroutines because they use
> > > the callback-based interface.  But perhaps someone will try to use templates
> > > to replace repeated inclusion (which is common in hw/display) and others
> > > will follow suit.  Or perhaps not.
> > > 
> > > One example that was brought up on IRC is type-safe operations on things
> > > such as hwaddr (i.e. hwaddr+int is allowed but hwaddr-hwaddr gives back an
> > > int64_t and might even check for overflow).  These would be opt in (you get
> > > them just by changing a file from .c to .cc), but the actual C++ code would
> > > still look very much like C code that uses hwaddr with no type checking.
> > > All the operator overloading gunk would be in include/.
> > > 
> > > A different topic is what would happen if all of QEMU could be compiled as
> > > C++, and could inform our selection of C++ idioms even long before we get
> > > there.  For example, I'm fine with GLib and our type-safe intrusive lists,
> > > so I don't have much interest in STL containers and I would prefer _not_ to
> > > use STL containers even in .cc files[1].  However, perhaps QEMU's home-grown
> > > lock guard might be replaced by something that uses C++ destructors instead
> > > of g_autoptr, so perhaps we should consider using std::lock_guard<>, or
> > > something like that, instead of QEMU_LOCK_GUARD.  It may be interesting to
> > > pass down lock_guards as arguments to enforce "this lock is taken"
> > > invariants.
> > > 
> > > But really, coroutines would be enough work so my dish would be full for
> > > some time and I wouldn't really have time to look at any of this. :)
> > 
> > I think it will be necessary to compile QEMU with a C++ compiler quite
> > soon. It is possible to provide C APIs like in the case of coroutines,
> > but sometimes C++ features need to be exposed to the caller (like the
> > lock guards you mentioned).
> 
> I'm not sure what the C++ lock guards offer that our current lock guards
> don't? Passing down lock guards makes sense to me, but why can't you do
> that with QemuLockable? (Hm, or can the C++ version somehow check at
> compile time that it's the _right_ lock that is held rather than just
> any lock? It didn't look like it at the first sight.)



> 
> But I do see the benefit of a compiler checked CoroutineFn<> return type
> compared to the coroutine_fn markers we have today. On the other hand...
> 
> > Also, once C++ is available people will start submitting C++ patches
> > simply because they are more comfortable with C++ (especially
> > one-time/infrequent contributors).
> 
> ...using C++ in coroutine code means that all of the block layer would
> suddenly become C++ and would be most affected by this effect. I'm not
> sure if that's something I would like to see, at least until there is a
> clear tree-wide policy (that preferably limits it to a subset that I
> understand).

Expecting maintainers to enforce a subset during code review feels
like it would be a tedious burden, that will inevitably let stuff
through because humans are fallible, especially when presented
with uninspiring, tedious, repetitive tasks.

Restricting ourselves to a subset is only viable if we have
an automated tool that can reliably enforce that subset. I'm not
sure that any such tool exists, and not convinced our time is
best served by trying to write & maintainer one either.

IOW, I fear one we allow C++ in any level, it won't be practical
to constrain it as much we desire. I fear us turning QEMU into
even more of a monster like other big C++ apps I see which take
all hours to compile while using all available RAM in Fedora RPM
build hosts.


My other question is whether adoption of C++ would complicate any
desire to make more use of Rust in QEMU ? I know Rust came out of
work by the Mozilla Firefox crew, and Firefox was C++, but I don't
have any idea how they integrated use of Rust with Firefox, so
whether there are any gotcha's for us or not ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


