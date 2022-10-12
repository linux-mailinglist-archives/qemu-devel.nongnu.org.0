Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8A35FC182
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 09:54:55 +0200 (CEST)
Received: from localhost ([::1]:36140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiWZp-0008Gl-NM
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 03:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oiWX6-0005ia-Op
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 03:52:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oiWX3-0006Xc-L0
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 03:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665561119;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FMRlvF21iXdlXDvJAp11J4uRP9gU/nDvje2tWT4DfJ0=;
 b=hiiSxrGEfnfIjCUJ4A3Qf3G3c0wEXF255UjShr0Jz7TPKmoNEWn6grHnem0XqRwa3iloX3
 WmFsldIQCKCFhRM4iYSoFXfAUUYsamKrzKMx8rJwUo4rUiEGaVbmtIRm0qx+WIQAUD+0pK
 4AA9V+hoZ/jVC2auJy8hu27XSyLsXuk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-EmBX0E5FPxOQIAo2MVv_cQ-1; Wed, 12 Oct 2022 03:51:56 -0400
X-MC-Unique: EmBX0E5FPxOQIAo2MVv_cQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF624101A52A;
 Wed, 12 Oct 2022 07:51:55 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEEA42166B2F;
 Wed, 12 Oct 2022 07:51:54 +0000 (UTC)
Date: Wed, 12 Oct 2022 08:51:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] gitmodules: recurse by default
Message-ID: <Y0ZyFwoERvefrrBp@redhat.com>
References: <20221006113906.179963-1-mst@redhat.com>
 <Yz8kfJcfbbTAnmuR@redhat.com>
 <20221006202250-mutt-send-email-mst@kernel.org>
 <Yz/eNaP994pc+P6Q@redhat.com>
 <20221007061037-mutt-send-email-mst@kernel.org>
 <Y0ADZAQbjIJMVzXp@redhat.com> <Y0AI9G66wl/+vVMB@redhat.com>
 <20221011183124-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221011183124-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 11, 2022 at 06:32:40PM -0400, Michael S. Tsirkin wrote:
> On Fri, Oct 07, 2022 at 12:09:40PM +0100, Daniel P. Berrangé wrote:
> > On Fri, Oct 07, 2022 at 11:45:56AM +0100, Daniel P. Berrangé wrote:
> > > On Fri, Oct 07, 2022 at 06:11:25AM -0400, Michael S. Tsirkin wrote:
> > > > On Fri, Oct 07, 2022 at 09:07:17AM +0100, Daniel P. Berrangé wrote:
> > > > > On Thu, Oct 06, 2022 at 08:24:01PM -0400, Michael S. Tsirkin wrote:
> > > > > > On Thu, Oct 06, 2022 at 07:54:52PM +0100, Daniel P. Berrangé wrote:
> > > > > > > On Thu, Oct 06, 2022 at 07:39:07AM -0400, Michael S. Tsirkin wrote:
> > > > > > > > The most commmon complaint about submodules is that
> > > > > > > > they don't follow when one switches branches in the
> > > > > > > > main repo. Enable recursing into submodules by default
> > > > > > > > to address that.
> > > > > > > > 
> > > > > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > ---
> > > > > > > >  .gitmodules | 23 +++++++++++++++++++++++
> > > > > > > >  1 file changed, 23 insertions(+)
> > 
> > snip
> > 
> > > > I just retested and it's not working for me either :(
> > > > I was sure it worked but I guess the testing wasn't done properly.
> > > > Back to the drawing board sorry.
> > > 
> > > I think the problem is that this setting doesn't apply in the context
> > > of .gitmodules. Various commands take a '--recurse-submodules' parameter,
> > > and like many params this can be set in the .git/config file. The
> > > problem is .git/config isn't a file we can influence automatically,
> > > it is upto the dev to set things for every clone they do :-(
> > 
> > With the correct setting in my .git/config, I've just discovered
> > an unexpected & undesirable consequence of using recurse=true.
> > It affects the 'push' command. If your submodule contains a hash
> > that is not present in the upstream of the submodule, then when
> > you try to push, it will also try to push the submodule change.
> > 
> > eg, I have a qemu.git branch 'work' and i made a change to
> > ui/keycodemapdb. If I try to push to my gitlab fork, whose
> > remote I called 'gitlab', then it will also try to push
> > ui/keycodemapdb to a fork called 'gitlab'.  Except I don't
> > have any such fork existing, so my attempt to push my qemu.git
> > changes fails because of the submodule.
> > 
> > This is going to be annoying to people who are working on branches
> > with updates to the git submodules if we were to set recurse=true
> > by default, as they'll have to also setup remotes for submodules
> > they work on.
> > 
> 
> Well this seems like a reasonable thing to do, no?
> 
> If you push qemu commit referring to hash 0xABC, you want
> that 0xABC to be available in the remote, no?
> Otherwise how will people fetching your tree check it out?

Don't assume I'm making it available for other people. I push to
remotes simply for moving code around for myself between machines.
I still have the submodule code I need elsewhere, so forcing me
to push the submodule & main repos so the same named remote is
getting in the way. 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


