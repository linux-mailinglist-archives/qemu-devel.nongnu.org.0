Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F37B523A66
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 18:34:01 +0200 (CEST)
Received: from localhost ([::1]:54944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nopHj-0000vw-S2
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 12:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nopG5-0000Ep-2b
 for qemu-devel@nongnu.org; Wed, 11 May 2022 12:32:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nopG1-00015r-QN
 for qemu-devel@nongnu.org; Wed, 11 May 2022 12:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652286732;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=320EZiwka2d8lnwj59ys+EM4iUYo1xmwUxNUvjlLf5o=;
 b=ajpElyaRntF/f0h2RhpwZCkpG27gsb9kJPqG7etsl4CEdGSlWfX6z1KEG1PziEXxM+dd1N
 br2wP9wf4p1SWGbyOsgIvA/LWdmQabX16+VYAgJOLzIbr2KeOTdBfeqiBYEjce9y6gZTO0
 B6UI8G3gq09y7QdbGIftQ/pBoqz0DPk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-5cnCkiq5NWSGkQLi7q-PBw-1; Wed, 11 May 2022 12:32:08 -0400
X-MC-Unique: 5cnCkiq5NWSGkQLi7q-PBw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 998BB3C32313
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 16:32:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5983DC28125;
 Wed, 11 May 2022 16:32:07 +0000 (UTC)
Date: Wed, 11 May 2022 17:32:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Victor Toso <victortoso@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <YnvlBH8klyBERnlU@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
 <87lev9mw7j.fsf@pond.sub.org> <YnpbuzKo681VwDkn@redhat.com>
 <YnpfuYvBu56CCi7b@redhat.com>
 <CABJz62M2XtbHubdEjiSf-mzEiHbnd=bSotgUBVhtaZFPOtzE7g@mail.gmail.com>
 <YnvbS7psaEjkrN65@redhat.com>
 <CABJz62PdyKGfSge4kQd9gCZFGBaH+K53nYSYb+_xrkeXz=tXyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABJz62PdyKGfSge4kQd9gCZFGBaH+K53nYSYb+_xrkeXz=tXyw@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 11, 2022 at 09:22:36AM -0700, Andrea Bolognani wrote:
> On Wed, May 11, 2022 at 04:50:35PM +0100, Daniel P. Berrangé wrote:
> > This would lead to a situation where every struct is duplicated
> > for every version, even though 90% of the time they'll be identical
> > across multiple versions. This is not very ammenable to the desire
> > to be able to dynamically choose per-command which version you
> > want based on which version of QEMU you're connected to.
> >
> > ie
> >
> >      var cmd Command
> >      if qmp.HasVersion(qemu.Version(7, 0, 0)) {
> >         cmd = BlockResizeArguments{
> >            V700: &BlockResizeArguments700{
> >              NodeName: node,
> >              Size: 1 * GiB
> > 	   }
> >          }
> >      } else {
> >         cmd = BlockResizeArguments{
> >            V520: &BlockResizeArguments520{
> >              Device: dev,
> >              Size: 1 * GiB
> > 	   }
> >          }
> >      }
> >
> > And of course the HasVersion check is going to be different
> > for each command that matters.
> >
> > Having said that, this perhaps shows the nested structs are
> > overkill. We could have
> >
> >      var cmd Command
> >      if qmp.HasVersion(qemu.Version(7, 0, 0)) {
> >          cmd = &BlockResizeArguments700{
> >              NodeName: node,
> >              Size: 1 * GiB
> >          }
> >      } else {
> >         cmd = &BlockResizeArguments520{
> >              Device: dev,
> >              Size: 1 * GiB
> >          }
> >      }
> 
> Right, making the decision at the import level would require adding a
> level of indirection and make this kind of dynamic logic awkward.
> 
> We shouldn't force users to sprinkle version numbers everywhere
> though, especially since different commands will change at different
> points in time. It should be possible to do something like
> 
>   if !qmp.HasAPI(600) {
>       panic("update QEMU")
>   }
> 
>   cmd := &BlockResizeArguments600{ // really BlockResizeArguments520
>       Device: device,
>       Size:   size,
>   }
> 
> or even
> 
>   if !qmp.HasAPI(qmp.API.Latest) {
>       panic("update QEMU")
>   }
> 
>   cmd := &BlockResizeArguments{
>       NodeName: nodeName,
>       Size:     size,
>   }
> 
> Should be easy enough to achieve with type aliases.

I guess we would have a single package which does

   typedef BlockResizeArguments520 BlockResizeArguments;
   ...for each type...

The interaction with API versioning will be tedious though. For the
versioned structs we'll be forever back compatible, due to the
append-only nature of the versioned struct approach. For the type
aliases, we'll be forever breaking compat as at least 1 struct
alias is likely to need changing every QEMU release.

Might suggest having 2 distinct go modules. A base module which
is versioned as a stable API with semver (forever v1.xxx), and
an add-on module that depends on base module, which is versioned
as an unstable API with semver (forever v0.xxx)


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


