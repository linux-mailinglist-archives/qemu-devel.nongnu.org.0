Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44005EE5BA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 21:32:04 +0200 (CEST)
Received: from localhost ([::1]:51944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odcmq-000657-2a
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 15:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1odck0-0004Hx-DJ
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 15:29:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1odcju-0005dz-7g
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 15:29:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664393339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tvGYl8KTYI8SAHOapQ6UWhvV5of/8RwKJm0VKfIye4A=;
 b=RERvyY+CR81r/nN5fSDoiO6fu6ZSPhE2DP3L17Rz/S3yvcqm2xa3LMXK+j4/snBsIrLjJz
 JwQ+63AuN07FX4u4aGeV92wN16wFpMC261HqZIopQCbR6PnLltl0bM0ciRIFtmby9Blu4L
 c0MFTnJSOkzC56VaqiSUgKIc5UTVSJw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-O_Gv9EjqMJ2FnqmwrpDjbg-1; Wed, 28 Sep 2022 15:28:57 -0400
X-MC-Unique: O_Gv9EjqMJ2FnqmwrpDjbg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C42673825784;
 Wed, 28 Sep 2022 19:28:56 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.9.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A55B249BB60;
 Wed, 28 Sep 2022 19:28:56 +0000 (UTC)
Received: by fedora.redhat.com (Postfix, from userid 1000)
 id 4BAA44ACDF; Wed, 28 Sep 2022 15:28:56 -0400 (EDT)
Date: Wed, 28 Sep 2022 15:28:56 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Colin Walters <walters@verbum.org>,
 virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Virtio-fs] virtiofsd: Any reason why there's not an "openat2"
 sandbox mode?
Message-ID: <YzSgeDdpHOw1hTM0@redhat.com>
References: <4362261a-c762-4666-84e2-03c9daa6c4d9@www.fastmail.com>
 <YzMmu3xfOtQwuFUx@redhat.com> <YzMrYAJQeSP2hDSs@redhat.com>
 <CAJh=p+5rQDBJJC8VNGL10KYgDeq-Hg5WK7avONCti03eJGH+ow@mail.gmail.com>
 <798fe353-9537-44fe-a76a-819e8c93abb5@www.fastmail.com>
 <YzNZnPiUqySu6sGh@fedora>
 <20220928083340.eyizwu6mm3cc3bxu@mhamilton>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928083340.eyizwu6mm3cc3bxu@mhamilton>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 28, 2022 at 10:33:40AM +0200, Sergio Lopez wrote:
> On Tue, Sep 27, 2022 at 04:14:20PM -0400, Stefan Hajnoczi wrote:
> > On Tue, Sep 27, 2022 at 01:51:41PM -0400, Colin Walters wrote:
> > > 
> > > 
> > > On Tue, Sep 27, 2022, at 1:27 PM, German Maglione wrote:
> > > >
> > > >> > Now all the development has moved to rust virtiofsd.
> > > 
> > > Oh, awesome!!  The code there looks great.
> > > 
> > > > I could work on this for the next major version and see if anything breaks.
> > > > But I prefer to add this as a compilation feature, instead of a command line
> > > > option that we will then have to maintain for a while.
> > > 
> > > Hmm, what would be the issue with having the code there by default?  I think rather than any new command line option, we automatically use `openat2+RESOLVE_IN_ROOT` if the process is run as a nonzero uid.
> > > 
> > > > Also, I don't see it as a sandbox feature, as Stefan mentioned, a compromised
> > > > process can call openat2() without RESOLVE_IN_ROOT. 
> > > 
> > > I'm a bit skeptical honestly about how secure the existing namespace code is against a compromised virtiofsd process.  The primary worry is guest filesystem traversals, right?  openat2+RESOLVE_IN_ROOT addresses that.  Plus being in Rust makes this dramatically safer.
> > > 
> > > > I did some test with
> > > > Landlock to lock virtiofsd inside the shared directory, but IIRC it requires a
> > > > kernel 5.13
> > > 
> > > But yes, landlock and other things make sense, I just don't see these things as strongly linked.  IOW we shouldn't in my opinion block unprivileged virtiofsd on more sandboxing than openat2 already gives us.
> > 
> > I think openat2(RESOLVE_IN_ROOT) support should be added unless there is
> > another unprivileged mechanism that is stronger.
> > 
> > The security implications need to be covered in the user documentation
> > so people can decide whether using this mode is appropriate.
> > 
> > We should continue to explain the difference between a voluntary
> > mechanism like openat2(RESOLVE_IN_ROOT) and a mandatory mechanism like
> > mount namespaces with pivot_root(2). Rust programs are not immune to
> > arbitrary code execution, but it's less likely than with a C program.
> 
> I agree. Perhaps we could modify the "none" sandbox mode to use
> openat2, if available, and add an "openat2" mode which does basically
> the same thing, but bailing out if openat2 is not available.

Sounds reasonable. In fact, we could probably do someting similar
for "landlock" as well. 

Vivek

> 
> And explain this clearly in the docs, of course.
> 
> Sergio.



