Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 229975FC459
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 13:36:45 +0200 (CEST)
Received: from localhost ([::1]:44220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oia2V-0007g4-KK
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 07:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oiZxc-0003sX-1A
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 07:31:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oiZxX-000862-Gt
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 07:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665574294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6b3xTPOwa9kc7Zg9yyuLlhSbWfbT406JCY+XnrlXpWI=;
 b=GmkZe6zseV9lvVEmUwW+60CYnXtW1BKsafUqGrwC1PvD/lBWLYRQ5J4jKLYvs67uimSbFm
 BWfaV60GsFX44DGck2cf3NCbYoanHNaECZDb1oUpphZimYs87YKtJYHSElNUd4hXMxA9Ri
 4mlkkkVbHlsulYD8bwrSA9dZNEVrEro=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-219-Iu6Ce-YbOPuVSXr76TQODg-1; Wed, 12 Oct 2022 07:31:33 -0400
X-MC-Unique: Iu6Ce-YbOPuVSXr76TQODg-1
Received: by mail-wr1-f69.google.com with SMTP id
 e11-20020adfa74b000000b0022e39e5c151so4834662wrd.3
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 04:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6b3xTPOwa9kc7Zg9yyuLlhSbWfbT406JCY+XnrlXpWI=;
 b=48YHmBm6ugmSiiliLwQXMtdxaOugOwXhKfQLK4u1WJoskiYXjDE0zhMdx3X438nHvv
 VCbsPZ3RSLmOeqjgk27H1mSQ5TZyfWLa2lpNAG0jj2ev/sYP595edNj7vg7XGFcjuPyk
 vmtVM2EmTb0k/UyFmCwBHOFLoT+r3HWI1Jv+NJy6vNCemq8RqnDOZTrwMnlXe+sUtBCS
 Z4Ve31Pu75t7CqVAF1uMhS72yJOXimAfB8wvJv+CJely4h/NNLYuuyF3WGxx0xG4vt/r
 j6aZNujYPdcnved6MdCKvrnOgv4a5Hi7RpTcB7E7MtyljWN2rTsNKjG7cHPj0VObEUxa
 UKyQ==
X-Gm-Message-State: ACrzQf19wWHeIh90Mfhw1Hw3DNOievNUhy7zZK4rXXgO3ZtuCsBuwe0Q
 PE2MUL8kNFmiXfdRfdvmo9RICq57P1L1KLw/3gXfuWBMhKtULhMPg+k4qr8sVnqWKs3Pi1TCZGP
 o57Q3+TJfw6SewXg=
X-Received: by 2002:a5d:6dca:0:b0:22c:c6f9:57d2 with SMTP id
 d10-20020a5d6dca000000b0022cc6f957d2mr17766332wrz.474.1665574291986; 
 Wed, 12 Oct 2022 04:31:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4+GMEWKuLT9+bAPq95vmIAUGEz2EnupFgkerRHJjeJKRjNVz85p4re3sbK7vpdssBNkQWhrg==
X-Received: by 2002:a5d:6dca:0:b0:22c:c6f9:57d2 with SMTP id
 d10-20020a5d6dca000000b0022cc6f957d2mr17766302wrz.474.1665574291653; 
 Wed, 12 Oct 2022 04:31:31 -0700 (PDT)
Received: from redhat.com ([2.54.162.123]) by smtp.gmail.com with ESMTPSA id
 g7-20020a056000118700b0022ac38fb20asm13507112wrx.111.2022.10.12.04.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 04:31:30 -0700 (PDT)
Date: Wed, 12 Oct 2022 07:31:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] gitmodules: recurse by default
Message-ID: <20221012073015-mutt-send-email-mst@kernel.org>
References: <20221006113906.179963-1-mst@redhat.com>
 <Yz8kfJcfbbTAnmuR@redhat.com>
 <20221006202250-mutt-send-email-mst@kernel.org>
 <Yz/eNaP994pc+P6Q@redhat.com>
 <20221007061037-mutt-send-email-mst@kernel.org>
 <Y0ADZAQbjIJMVzXp@redhat.com> <Y0AI9G66wl/+vVMB@redhat.com>
 <20221011183124-mutt-send-email-mst@kernel.org>
 <Y0ZyFwoERvefrrBp@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y0ZyFwoERvefrrBp@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 12, 2022 at 08:51:51AM +0100, Daniel P. Berrangé wrote:
> On Tue, Oct 11, 2022 at 06:32:40PM -0400, Michael S. Tsirkin wrote:
> > On Fri, Oct 07, 2022 at 12:09:40PM +0100, Daniel P. Berrangé wrote:
> > > On Fri, Oct 07, 2022 at 11:45:56AM +0100, Daniel P. Berrangé wrote:
> > > > On Fri, Oct 07, 2022 at 06:11:25AM -0400, Michael S. Tsirkin wrote:
> > > > > On Fri, Oct 07, 2022 at 09:07:17AM +0100, Daniel P. Berrangé wrote:
> > > > > > On Thu, Oct 06, 2022 at 08:24:01PM -0400, Michael S. Tsirkin wrote:
> > > > > > > On Thu, Oct 06, 2022 at 07:54:52PM +0100, Daniel P. Berrangé wrote:
> > > > > > > > On Thu, Oct 06, 2022 at 07:39:07AM -0400, Michael S. Tsirkin wrote:
> > > > > > > > > The most commmon complaint about submodules is that
> > > > > > > > > they don't follow when one switches branches in the
> > > > > > > > > main repo. Enable recursing into submodules by default
> > > > > > > > > to address that.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > ---
> > > > > > > > >  .gitmodules | 23 +++++++++++++++++++++++
> > > > > > > > >  1 file changed, 23 insertions(+)
> > > 
> > > snip
> > > 
> > > > > I just retested and it's not working for me either :(
> > > > > I was sure it worked but I guess the testing wasn't done properly.
> > > > > Back to the drawing board sorry.
> > > > 
> > > > I think the problem is that this setting doesn't apply in the context
> > > > of .gitmodules. Various commands take a '--recurse-submodules' parameter,
> > > > and like many params this can be set in the .git/config file. The
> > > > problem is .git/config isn't a file we can influence automatically,
> > > > it is upto the dev to set things for every clone they do :-(
> > > 
> > > With the correct setting in my .git/config, I've just discovered
> > > an unexpected & undesirable consequence of using recurse=true.
> > > It affects the 'push' command. If your submodule contains a hash
> > > that is not present in the upstream of the submodule, then when
> > > you try to push, it will also try to push the submodule change.
> > > 
> > > eg, I have a qemu.git branch 'work' and i made a change to
> > > ui/keycodemapdb. If I try to push to my gitlab fork, whose
> > > remote I called 'gitlab', then it will also try to push
> > > ui/keycodemapdb to a fork called 'gitlab'.  Except I don't
> > > have any such fork existing, so my attempt to push my qemu.git
> > > changes fails because of the submodule.
> > > 
> > > This is going to be annoying to people who are working on branches
> > > with updates to the git submodules if we were to set recurse=true
> > > by default, as they'll have to also setup remotes for submodules
> > > they work on.
> > > 
> > 
> > Well this seems like a reasonable thing to do, no?
> > 
> > If you push qemu commit referring to hash 0xABC, you want
> > that 0xABC to be available in the remote, no?
> > Otherwise how will people fetching your tree check it out?
> 
> Don't assume I'm making it available for other people. I push to
> remotes simply for moving code around for myself between machines.
> I still have the submodule code I need elsewhere, so forcing me
> to push the submodule & main repos so the same named remote is
> getting in the way. 
> 
> With regards,
> Daniel

So you are pushing this main tree but the submodule won't be
needed there? Sounds like an unusual enough thing that
it's reasonable to ask user to tweak config to enable it.

> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


