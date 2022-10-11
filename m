Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489E75FBDE1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:34:55 +0200 (CEST)
Received: from localhost ([::1]:41612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNpt-0007bK-TQ
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oiNo3-0005yo-5g
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 18:32:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oiNns-0000EW-3q
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 18:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665527567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sZvFQHt2ff9TL0skezgV22Q346FNkHVg+Duha76Bk3c=;
 b=K5pZcAGghza9FlnfocOch260tAgHUT0Vuwqwbw6MGAMhXRK84YBC0xNnIWdVQpSlGzitns
 3O63zGOC04/NW87OwajWEjv/FyqaRpYqOI7Xfx059KBqrMGJVDw8tJ1Tt0iePDnf2Eo/+7
 ON7WsycqvOhU/mmyRkCkcAlclTuXFVY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-jC5NEJVYMNaAUIY-8WN_WA-1; Tue, 11 Oct 2022 18:32:46 -0400
X-MC-Unique: jC5NEJVYMNaAUIY-8WN_WA-1
Received: by mail-wr1-f71.google.com with SMTP id
 s4-20020adfbc04000000b0022e03fc10a9so4310341wrg.15
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 15:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sZvFQHt2ff9TL0skezgV22Q346FNkHVg+Duha76Bk3c=;
 b=jGhBT4Yza6D2MwMBWy97Y+9pnjpcDJAa3I4HtlKA0gnHTJHY/7aPvULZD4VYn6iZld
 0Jb0eYTye17zA8McPUMdVsqEcsrZIWITmDvhh+QnaicoJR/gX5BjdIs7bLNF7ZNYF9G/
 8S7sok30efhdac6bthjCvdWugDvCF8QjxI+FC72NtAZbcvXzW/cDpKzySSULZw2dLO15
 GlzpSoJmdMT9VfKNNiz6My5T5xSKfr8g6pafyaDULBySHL46lVq/69+ZSlHBnpxZDcrg
 /Tyt1bScgT6uYJm9ziYkGEjvSUEFRXW+i7jAyqkvyZ03KxWrgzIlTUJ6hxJHUC//St1a
 5jbw==
X-Gm-Message-State: ACrzQf048TdyHZTBVD0t823Z/mOmuvhRUMElyGZFgGZ/WatPGEero5mj
 C/2Oo0dmRuZq3zsPpXTDLnhVX9r729VyI4zXDemQK0XANhjieiCiZdSiic6X78KhtOFZvdjbCpZ
 44uYgKx9Fnb9rCwM=
X-Received: by 2002:a5d:47c5:0:b0:22e:6573:5621 with SMTP id
 o5-20020a5d47c5000000b0022e65735621mr16344231wrc.478.1665527564923; 
 Tue, 11 Oct 2022 15:32:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6HmQEqQQOAUmlTGN9IwWh1cJbM5T3MbzIYSdum85yCGRJR83Vpa1a/C/RuzDkuzVYANAiewg==
X-Received: by 2002:a5d:47c5:0:b0:22e:6573:5621 with SMTP id
 o5-20020a5d47c5000000b0022e65735621mr16344220wrc.478.1665527564689; 
 Tue, 11 Oct 2022 15:32:44 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 q65-20020a1c4344000000b003a8434530bbsm202195wma.13.2022.10.11.15.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 15:32:43 -0700 (PDT)
Date: Tue, 11 Oct 2022 18:32:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] gitmodules: recurse by default
Message-ID: <20221011183124-mutt-send-email-mst@kernel.org>
References: <20221006113906.179963-1-mst@redhat.com>
 <Yz8kfJcfbbTAnmuR@redhat.com>
 <20221006202250-mutt-send-email-mst@kernel.org>
 <Yz/eNaP994pc+P6Q@redhat.com>
 <20221007061037-mutt-send-email-mst@kernel.org>
 <Y0ADZAQbjIJMVzXp@redhat.com> <Y0AI9G66wl/+vVMB@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y0AI9G66wl/+vVMB@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Oct 07, 2022 at 12:09:40PM +0100, Daniel P. Berrangé wrote:
> On Fri, Oct 07, 2022 at 11:45:56AM +0100, Daniel P. Berrangé wrote:
> > On Fri, Oct 07, 2022 at 06:11:25AM -0400, Michael S. Tsirkin wrote:
> > > On Fri, Oct 07, 2022 at 09:07:17AM +0100, Daniel P. Berrangé wrote:
> > > > On Thu, Oct 06, 2022 at 08:24:01PM -0400, Michael S. Tsirkin wrote:
> > > > > On Thu, Oct 06, 2022 at 07:54:52PM +0100, Daniel P. Berrangé wrote:
> > > > > > On Thu, Oct 06, 2022 at 07:39:07AM -0400, Michael S. Tsirkin wrote:
> > > > > > > The most commmon complaint about submodules is that
> > > > > > > they don't follow when one switches branches in the
> > > > > > > main repo. Enable recursing into submodules by default
> > > > > > > to address that.
> > > > > > > 
> > > > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > ---
> > > > > > >  .gitmodules | 23 +++++++++++++++++++++++
> > > > > > >  1 file changed, 23 insertions(+)
> 
> snip
> 
> > > I just retested and it's not working for me either :(
> > > I was sure it worked but I guess the testing wasn't done properly.
> > > Back to the drawing board sorry.
> > 
> > I think the problem is that this setting doesn't apply in the context
> > of .gitmodules. Various commands take a '--recurse-submodules' parameter,
> > and like many params this can be set in the .git/config file. The
> > problem is .git/config isn't a file we can influence automatically,
> > it is upto the dev to set things for every clone they do :-(
> 
> With the correct setting in my .git/config, I've just discovered
> an unexpected & undesirable consequence of using recurse=true.
> It affects the 'push' command. If your submodule contains a hash
> that is not present in the upstream of the submodule, then when
> you try to push, it will also try to push the submodule change.
> 
> eg, I have a qemu.git branch 'work' and i made a change to
> ui/keycodemapdb. If I try to push to my gitlab fork, whose
> remote I called 'gitlab', then it will also try to push
> ui/keycodemapdb to a fork called 'gitlab'.  Except I don't
> have any such fork existing, so my attempt to push my qemu.git
> changes fails because of the submodule.
> 
> This is going to be annoying to people who are working on branches
> with updates to the git submodules if we were to set recurse=true
> by default, as they'll have to also setup remotes for submodules
> they work on.
> 
> With regards,
> Daniel


Well this seems like a reasonable thing to do, no?

If you push qemu commit referring to hash 0xABC, you want
that 0xABC to be available in the remote, no?
Otherwise how will people fetching your tree check it out?


> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


