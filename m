Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ACE5F723D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 02:26:55 +0200 (CEST)
Received: from localhost ([::1]:57656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogbCX-0004Cl-TT
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 20:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogb9y-0002Tp-JU
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 20:24:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogb9u-0004R2-Je
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 20:24:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665102248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WpKfVZPEjU0QgtpjaksQJhahJLfWzgX3P41MRchxopw=;
 b=A71glvvzsQzO/iu7nv1V1vZmynmcuxG2xiMjq7J+mk5Wf11eL/CYmEcdfrErwQNOVM0Id6
 hHyZRth4Z/76E4aSKkLnNieNpm8/ZT1B75rpSjJqOaFaq/Z3g4pot+bz9KTK01EhAkBT5a
 Cq0iTw8Lo+HmLquctJKdrqzJMzLIpAw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-218-uwdtQbdNOfecYqG-K5Z6gA-1; Thu, 06 Oct 2022 20:24:07 -0400
X-MC-Unique: uwdtQbdNOfecYqG-K5Z6gA-1
Received: by mail-wr1-f72.google.com with SMTP id
 e11-20020adfa74b000000b0022e39e5c151so939745wrd.3
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 17:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WpKfVZPEjU0QgtpjaksQJhahJLfWzgX3P41MRchxopw=;
 b=FyAV7SKHWmsTuoxLaSMUhDcj3/IJ0AI7+kGEEehYSS1JZ2rl+OQ/QH0GdNp1ucyrwh
 Ixac7QOhtwz2SGFbo/crJxWzjFVkB1yuRq9i2JTXMH+4Qf5tZra984vzc9UZS2/KDSlA
 P4IzbBoTOspMN+63Z13pXtOm0MAscRP/dOKEiaMdjdj1nXfsv5XPNB7TLTtt9Sb82jfI
 CpeYtzr8K2upn87YRjASixr8SnaKVvpOhIHBEG2f7Rd0vBtP283Bau3tnTY4Fzle165W
 lmY1baBJhM3Krc3+lZ1dzzwDY1LlJTAFd0R21n71UwjOja9QZNH4t1boePQbagHFBENM
 mVrQ==
X-Gm-Message-State: ACrzQf1pwbqtVEn9hu5FuP3lk5ItrUO4BsEUSiPQw6lFv7Qalsxwhqci
 8hhTAVpECF/SnzXnzPGpv2bGc69JRX/GevT6PQBsaTts55Xoq/9qcPzC9O1tPuKuOpQ6ZoXdgyK
 VXECVRRXK2er71Gk=
X-Received: by 2002:a05:6000:1f09:b0:22c:c6d9:5f42 with SMTP id
 bv9-20020a0560001f0900b0022cc6d95f42mr1489472wrb.84.1665102245646; 
 Thu, 06 Oct 2022 17:24:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ZcAtyqUsQicPv7hsLn0wrB4NuwPtNZHsmAV+/ycDtIxLVH7x4/QlXahte0978exXBh1048w==
X-Received: by 2002:a05:6000:1f09:b0:22c:c6d9:5f42 with SMTP id
 bv9-20020a0560001f0900b0022cc6d95f42mr1489459wrb.84.1665102245378; 
 Thu, 06 Oct 2022 17:24:05 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 x21-20020a05600c179500b003b339438733sm687987wmo.19.2022.10.06.17.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 17:24:04 -0700 (PDT)
Date: Thu, 6 Oct 2022 20:24:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] gitmodules: recurse by default
Message-ID: <20221006202250-mutt-send-email-mst@kernel.org>
References: <20221006113906.179963-1-mst@redhat.com>
 <Yz8kfJcfbbTAnmuR@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yz8kfJcfbbTAnmuR@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Thu, Oct 06, 2022 at 07:54:52PM +0100, Daniel P. Berrangé wrote:
> On Thu, Oct 06, 2022 at 07:39:07AM -0400, Michael S. Tsirkin wrote:
> > The most commmon complaint about submodules is that
> > they don't follow when one switches branches in the
> > main repo. Enable recursing into submodules by default
> > to address that.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  .gitmodules | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> 
> What am I missing, as I tried something equiv to this change
> with one submodule and it didn't appear to have any effect.
> I started from a clean slate:
> 
> $ git submodule  deinit --all --force
> 
> The .gitmodules config has 'recurse = true' for the ui/keycodemapdb
> module:
> 
> $ grep keycodemap --after 1 .gitmodules 
> [submodule "ui/keycodemapdb"]
> 	path = ui/keycodemapdb
> 	url = https://gitlab.com/qemu-project/keycodemapdb.git
> 	recurse = true
> 
> I have a change on master setting the submodule commit:
> 
> $ git show master | grep +Sub
> +Subproject commit 7381b9bfadd31c4c9e9a10b5bb5032f9189d4352
> 
> and check it out:
> 
> $ git submodule update --init ui/keycodemapdb
> Submodule 'ui/keycodemapdb' (https://gitlab.com/qemu-project/keycodemapdb.git) registered for path 'ui/keycodemapdb'
> Submodule path 'ui/keycodemapdb': checked out '7381b9bfadd31c4c9e9a10b5bb5032f9189d4352'
> 
> 
> In another branch I have a different commit:
> 
> $ git show sub-foo  | grep +Sub
> +Subproject commit 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae
> 
> 
> Now I switch branches and nothing happens, the submodule
> is marked as dirty:
> 
> $ git checkout sub-foo
> M	ui/keycodemapdb
> Switched to branch 'sub-foo'
> 
> $ (cd ui/keycodemapdb && git show | head -1)
> commit 7381b9bfadd31c4c9e9a10b5bb5032f9189d4352
> 
> 
> >From your description (and indeed that of the man page) it
> sounded like ui/keycodemapdb should have got updated to
> commit 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae when I did
> 'git checkout', but that didn't happen

I think .gitmodules got overwritten when you checked out the branch.
Possible?

> 
> > 
> > diff --git a/.gitmodules b/.gitmodules
> > index aedd9a03d4..5f32332aff 100644
> > --- a/.gitmodules
> > +++ b/.gitmodules
> > @@ -1,69 +1,92 @@
> >  [submodule "roms/seabios"]
> >  	path = roms/seabios
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/seabios.git/
> >  [submodule "roms/SLOF"]
> >  	path = roms/SLOF
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/SLOF.git
> >  [submodule "roms/ipxe"]
> >  	path = roms/ipxe
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/ipxe.git
> >  [submodule "roms/openbios"]
> >  	path = roms/openbios
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/openbios.git
> >  [submodule "roms/qemu-palcode"]
> >  	path = roms/qemu-palcode
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/qemu-palcode.git
> >  [submodule "roms/sgabios"]
> >  	path = roms/sgabios
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/sgabios.git
> >  [submodule "dtc"]
> >  	path = dtc
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/dtc.git
> >  [submodule "roms/u-boot"]
> >  	path = roms/u-boot
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/u-boot.git
> >  [submodule "roms/skiboot"]
> >  	path = roms/skiboot
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/skiboot.git
> >  [submodule "roms/QemuMacDrivers"]
> >  	path = roms/QemuMacDrivers
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/QemuMacDrivers.git
> >  [submodule "ui/keycodemapdb"]
> >  	path = ui/keycodemapdb
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/keycodemapdb.git
> >  [submodule "roms/seabios-hppa"]
> >  	path = roms/seabios-hppa
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/seabios-hppa.git
> >  [submodule "roms/u-boot-sam460ex"]
> >  	path = roms/u-boot-sam460ex
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/u-boot-sam460ex.git
> >  [submodule "tests/fp/berkeley-testfloat-3"]
> >  	path = tests/fp/berkeley-testfloat-3
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/berkeley-testfloat-3.git
> >  [submodule "tests/fp/berkeley-softfloat-3"]
> >  	path = tests/fp/berkeley-softfloat-3
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/berkeley-softfloat-3.git
> >  [submodule "roms/edk2"]
> >  	path = roms/edk2
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/edk2.git
> >  [submodule "slirp"]
> >  	path = slirp
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/libslirp.git
> >  [submodule "roms/opensbi"]
> >  	path = roms/opensbi
> > +	recurse = true
> >  	url = 	https://gitlab.com/qemu-project/opensbi.git
> >  [submodule "roms/qboot"]
> >  	path = roms/qboot
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/qboot.git
> >  [submodule "meson"]
> >  	path = meson
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/meson.git
> >  [submodule "roms/vbootrom"]
> >  	path = roms/vbootrom
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/vbootrom.git
> >  [submodule "tests/lcitool/libvirt-ci"]
> >  	path = tests/lcitool/libvirt-ci
> > +	recurse = true
> >  	url = https://gitlab.com/libvirt/libvirt-ci.git
> >  [submodule "subprojects/libvfio-user"]
> >  	path = subprojects/libvfio-user
> > +	recurse = true
> >  	url = https://gitlab.com/qemu-project/libvfio-user.git
> > -- 
> > MST
> > 
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


