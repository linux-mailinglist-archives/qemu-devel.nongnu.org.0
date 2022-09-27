Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AA25ECF3B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 23:23:24 +0200 (CEST)
Received: from localhost ([::1]:52212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odI2z-0000O1-R2
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 17:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odHyD-0004eh-2z
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 17:18:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odHy8-0004Hk-Pp
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 17:18:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664313497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=upOhGlEZlzdK76BDBNOa7A7cm7ZtNyI84ftCZWG9fXw=;
 b=Sbsq5yW+eDANk2PP9Q+4a7cHSOBgz97s6lyinBQvpPG7xIIimT8QnT/45+h0nJZmuuj+2I
 qbbojsA7BhGCq/mz/+lS6JtyRnjJp7hGxJlXy/k4GFXTBrdMnHxVfpPqvJvfJ0l/7p7GGf
 LabaLlYfMVeR+It8KmA87SgI4LY61xY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-NEVu-TGROdmWwNiqAa4SpQ-1; Tue, 27 Sep 2022 17:18:16 -0400
X-MC-Unique: NEVu-TGROdmWwNiqAa4SpQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 h133-20020a1c218b000000b003b3263d477eso6086414wmh.8
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 14:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=upOhGlEZlzdK76BDBNOa7A7cm7ZtNyI84ftCZWG9fXw=;
 b=DNhmDWPMbUrfEnpTMi6/GjGaoNKstsrLJX4oVXCKAd8Mjk6D+/gnBEBxTtSdzWy5bJ
 bt5gwIcp2MEsNtXxDuL74leyMZTlfnGaRw9hrx1jdYnwShCD/mQTbDfX5E8Xk0y/dlFB
 q3LsJBMF+oYitjgYLZYCtmw+3jH1AV9KSOrynSz9iNTCu4eOkcbryx6JLi+GXpJyXpta
 fKM9qZOZLtHuV3U+NH/ZnKK0ra4bt/AQvQeS1cohXTeMAffXJJWQXAYVIX6DZ2DvLp8L
 WS+Q6dtF1kDxghVTUJMvvA3NL+IPCbEmdAZe+4x/f7caip9R6Mlp0NR6AT84Dsd/eSs+
 PJNg==
X-Gm-Message-State: ACrzQf1RXb21LBZzpmr/4wx6/QvMXWjaisaAxF0uK5koi4DsdygFTrBo
 Knba9TIcNkHF11RYgaH45fEdZx8nQEIqTk1LOQyTTTeiVPtCddwnu4skSEc+yYEdUIEaGfuJWaH
 2RVty0cSSz0RlbrM=
X-Received: by 2002:a1c:7c03:0:b0:3b4:7647:ccd8 with SMTP id
 x3-20020a1c7c03000000b003b47647ccd8mr4264593wmc.10.1664313495272; 
 Tue, 27 Sep 2022 14:18:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM78HxMq0ONwkOfnblr7Fjw0oJXEaBCrqFQ5QdG0/rd/bT4gDulSvCL/L6Jwk5of5c6GDycGkw==
X-Received: by 2002:a1c:7c03:0:b0:3b4:7647:ccd8 with SMTP id
 x3-20020a1c7c03000000b003b47647ccd8mr4264574wmc.10.1664313494992; 
 Tue, 27 Sep 2022 14:18:14 -0700 (PDT)
Received: from redhat.com ([2.55.47.213]) by smtp.gmail.com with ESMTPSA id
 d6-20020a05600c34c600b003b49ab8ff53sm2884243wmq.8.2022.09.27.14.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 14:18:14 -0700 (PDT)
Date: Tue, 27 Sep 2022 17:18:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, jsnow@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, thuth@redhat.com
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <20220927171601-mutt-send-email-mst@kernel.org>
References: <alpine.DEB.2.22.394.2207150929020.2162493@anisinha-lenovo>
 <20220715015941-mutt-send-email-mst@kernel.org>
 <CAARzgwwjXMmbRQ-ETPPqHP5eq5jtrGMSh2GeBh5fLS9Pcsut+A@mail.gmail.com>
 <20220716112943-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207251100590.87138@anisinha-lenovo>
 <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
 <CAARzgwwpy6yUJfuxxfM2vAUDqh+RyxjLqd+1xARiazqwTLbN9A@mail.gmail.com>
 <20220917162606-mutt-send-email-mst@kernel.org>
 <CAARzgwxoy_E-vkwo-mKo0tbG31Y3E3r9FB6v3H3hgPYW4fb6sA@mail.gmail.com>
 <YzK1VzoU05vnlxY4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YzK1VzoU05vnlxY4@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Sep 27, 2022 at 09:33:27AM +0100, Daniel P. Berrangé wrote:
> On Tue, Sep 27, 2022 at 01:43:15PM +0530, Ani Sinha wrote:
> > On Sun, Sep 18, 2022 at 1:58 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Fri, Sep 16, 2022 at 09:30:42PM +0530, Ani Sinha wrote:
> > > > On Thu, Jul 28, 2022 at 12:08 AM Ani Sinha <ani@anisinha.ca> wrote:
> > > > >
> > > > >
> > > > >
> > > > > On Mon, 25 Jul 2022, Ani Sinha wrote:
> > > > >
> > > > > >
> > > > > >
> > > > > > On Sat, 16 Jul 2022, Michael S. Tsirkin wrote:
> > > > > >
> > > > > > > On Sat, Jul 16, 2022 at 12:06:00PM +0530, Ani Sinha wrote:
> > > > > > > >
> > > > > > > >
> > > > > > > > On Fri, Jul 15, 2022 at 11:20 Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > >
> > > > > > > >     On Fri, Jul 15, 2022 at 09:47:27AM +0530, Ani Sinha wrote:
> > > > > > > >     > > Instead of all this mess, can't we just spawn e.g. "git clone --depth
> > > > > > > >     1"?
> > > > > > > >     > > And if the directory exists I would fetch and checkout.
> > > > > > > >     >
> > > > > > > >     > There are two reasons I can think of why I do not like this idea:
> > > > > > > >     >
> > > > > > > >     > (a) a git clone of a whole directory would download all versions of the
> > > > > > > >     > binary whereas we want only a specific version.
> > > > > > > >
> > > > > > > >     You mention shallow clone yourself, and I used --depth 1 above.
> > > > > > > >
> > > > > > > >     > Downloading a single file
> > > > > > > >     > by shallow cloning or creating a git archive is overkill IMHO when a wget
> > > > > > > >     > style retrieval works just fine.
> > > > > > > >
> > > > > > > >     However, it does not provide for versioning, tagging etc so you have
> > > > > > > >     to implement your own schema.
> > > > > > > >
> > > > > > > >
> > > > > > > > Hmm I’m not sure if we need all that. Bits has its own versioning mechanism and
> > > > > > > > I think all we need to do is maintain the same versioning logic and maintain
> > > > > > > > binaries of different  versions. Do we really need the power of git/version
> > > > > > > > control here? Dunno.
> > > > > > >
> > > > > > > Well we need some schema. Given we are not using official bits releases
> > > > > > > I don't think we can reuse theirs.
> > > > > >
> > > > > > OK fine. Lets figuire out how to push bits somewhere in git.qemu.org and
> > > > > > the binaries in some other repo first. Everything else hinges on that. We
> > > > > > can fix the rest of the bits later incrementally.
> > > > >
> > > > > DanPB, any thoughts on putting bits on git.qemu.org or where and how to
> > > > > keep the binaries?
> > > >
> > > > Can we please conclude on this?
> > > > Peter, can you please fork the repo? I have tried many times to reach
> > > > you on IRC but failed.
> > >
> > > Probably because of travel around KVM forum.
> > >
> > > I think given our CI is under pressure again due to gitlab free tier
> > > limits, tying binaries to CI isn't a great idea at this stage.
> > > Can Ani just upload binaies to qemu.org for now?
> > 
> > I agree with Michael here. Having a full ci/cd job for this is
> > overkill IMHO. We should create a repo just for the binaries, have a
> > README there to explain how we generate them and check in new versions
> > as and when needed (it won't be frequent).
> > How about biosbits-bin repo?
> 
> If QEMU is hosting binaries, where any part contains GPL code, then we
> need to be providing the full and corresponding source and the build
> scripts needed to re-create the binary. Once we have such scripts it
> should be trivial to trigger that from a CI job. If it isn't then
> we're doing something wrong.  The CI quota is not an issue, because
> this is not a job that we need to run continuously. It can be triggered
> manually as & when we decide we need to refresh the binary, so would
> be a small one-off CI quota hit.
> 
> Also note that gitlab is intending to start enforcing storage quota
> on projects in the not too distant future. This makes it unappealing
> to store binaries in git repos, unless we genuinely need the ability
> to access historical versions of the binary. I don't believe we need
> that for biosbits.
> 
> The binary can be published as a CI artifact and accessed directly
> from the latest artifact download link. This ensures we only consume
> quota for the most recently published binary artifact. So I don't see
> a compelling reason to upload binaries into git.
> 
> With regards,
> Daniel

I don't really care where we upload them but only having the
latest version is just going to break anything expecting
the old binary.



> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


