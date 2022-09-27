Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656715ECF42
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 23:25:33 +0200 (CEST)
Received: from localhost ([::1]:55484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odI56-0003Eh-EN
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 17:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odI1g-0007Ib-7W
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 17:22:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odI1e-0004ta-1Z
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 17:21:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664313717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OMUwNXtQogbP2lQdNjm7xo5EvrV13oiZROjaoyQmDxw=;
 b=ckx7NL3A+1eiWGrlOTW38sftByF//cs54tT5K5paNnVN9JVa9WUGghBRDM/RjDQooI0guo
 SLduDBK1dkUjfpWsMTcM8tvfCY2HvBX4pakXRrbdZ98/W1ncSVfBBn7d8f77hlu5E2ZAeD
 YG4BywPK5UnnU+wgcSiXOe/9tkSPzcA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-ja4VaavuNuWSubJ5L6Epug-1; Tue, 27 Sep 2022 17:21:56 -0400
X-MC-Unique: ja4VaavuNuWSubJ5L6Epug-1
Received: by mail-wm1-f69.google.com with SMTP id
 7-20020a05600c020700b003b4ce6e6b12so3205844wmi.0
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 14:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=OMUwNXtQogbP2lQdNjm7xo5EvrV13oiZROjaoyQmDxw=;
 b=YT2vZd2XEx5TTHeAl0RUl0S4kdV/DKcqSNrfUcvDPgB6ui1RnO5L2syIlUTVaF7r03
 Ovl/TqingguNzK7mr9Fv9r5s5hhWyvpuHHPGFjKv2Tl7vsxdheI6Xbnet0WtgJv269Lh
 U7z4Xtnxri3MxubkoSMFGZ2oUO3StOtyKDZG7TtjUpNgnvjyUsxy+KyPr2m9AegcEYr6
 M0CMLW+Bt9+MSkNk7kMJghYmvC/KEBzNNgNgIzZQyOXSSMCJt9uOKJXHq/ZLY1EZOKWs
 4OesVY1xmqGU+mLAKh/jhmgHGcLp4AwJAC2FXyXSQJF6WoIfwCTLVC9ycNQwc6hnsf+8
 3zaw==
X-Gm-Message-State: ACrzQf2dUoB/khb9JLbe2hQsp187UKR+kw/Xcb+7VH27m0yNRXls8FXl
 LBIr3WaKeJSTLbMfZaHPfeCf44JyCgTF1qDuukFyV61Fk/YzgEjozWOb0qMjcJgNdLeHzWx0tpr
 6TYvUkzDXpy1k5vc=
X-Received: by 2002:a5d:598c:0:b0:22b:100f:c2d2 with SMTP id
 n12-20020a5d598c000000b0022b100fc2d2mr17587577wri.263.1664313713637; 
 Tue, 27 Sep 2022 14:21:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Re3+dt+bv7A10ietNhZYzaA4SFbXFm8IVtAaD50f+tAKbWN7i8jLBmDHX8vupySUZNP4+Ag==
X-Received: by 2002:a5d:598c:0:b0:22b:100f:c2d2 with SMTP id
 n12-20020a5d598c000000b0022b100fc2d2mr17587558wri.263.1664313713301; 
 Tue, 27 Sep 2022 14:21:53 -0700 (PDT)
Received: from redhat.com ([2.55.17.78]) by smtp.gmail.com with ESMTPSA id
 r21-20020a05600c425500b003b47e8a5d22sm14574864wmm.23.2022.09.27.14.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 14:21:52 -0700 (PDT)
Date: Tue, 27 Sep 2022 17:21:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, jsnow@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, thuth@redhat.com
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <20220927172044-mutt-send-email-mst@kernel.org>
References: <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
 <CAARzgwwpy6yUJfuxxfM2vAUDqh+RyxjLqd+1xARiazqwTLbN9A@mail.gmail.com>
 <20220917162606-mutt-send-email-mst@kernel.org>
 <CAARzgwxoy_E-vkwo-mKo0tbG31Y3E3r9FB6v3H3hgPYW4fb6sA@mail.gmail.com>
 <YzK1VzoU05vnlxY4@redhat.com>
 <CAARzgwxpm-tF3OwK95gHe+9_6qBebiqPFLug-59RUt85aCnuZQ@mail.gmail.com>
 <YzLN3Y1pNO8SVn9M@redhat.com>
 <CAARzgwx+ZitnYKvmkDGA1+Aq3_yPQFSs5GfTvGaAeNmHxUSNOQ@mail.gmail.com>
 <CAARzgwwLXp9rDkQ4OTW2TUgnp_XDyMTXf6OhsKE9qAL1HTuMRQ@mail.gmail.com>
 <YzMahUpNtsas18rN@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YzMahUpNtsas18rN@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Tue, Sep 27, 2022 at 04:45:09PM +0100, Daniel P. Berrangé wrote:
> On Tue, Sep 27, 2022 at 07:35:13PM +0530, Ani Sinha wrote:
> > On Tue, Sep 27, 2022 at 5:12 PM Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > On Tue, Sep 27, 2022 at 3:48 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > >
> > > > On Tue, Sep 27, 2022 at 03:37:39PM +0530, Ani Sinha wrote:
> > > > > > > > > > >
> > > > > > > > > > > OK fine. Lets figuire out how to push bits somewhere in git.qemu.org and
> > > > > > > > > > > the binaries in some other repo first. Everything else hinges on that. We
> > > > > > > > > > > can fix the rest of the bits later incrementally.
> > > > > > > > > >
> > > > > > > > > > DanPB, any thoughts on putting bits on git.qemu.org or where and how to
> > > > > > > > > > keep the binaries?
> > > > > > > > >
> > > > > > > > > Can we please conclude on this?
> > > > > > > > > Peter, can you please fork the repo? I have tried many times to reach
> > > > > > > > > you on IRC but failed.
> > > > > > > >
> > > > > > > > Probably because of travel around KVM forum.
> > > > > > > >
> > > > > > > > I think given our CI is under pressure again due to gitlab free tier
> > > > > > > > limits, tying binaries to CI isn't a great idea at this stage.
> > > > > > > > Can Ani just upload binaies to qemu.org for now?
> > > > > > >
> > > > > > > I agree with Michael here. Having a full ci/cd job for this is
> > > > > > > overkill IMHO. We should create a repo just for the binaries, have a
> > > > > > > README there to explain how we generate them and check in new versions
> > > > > > > as and when needed (it won't be frequent).
> > > > > > > How about biosbits-bin repo?
> > > > > >
> > > > > > If QEMU is hosting binaries, where any part contains GPL code, then we
> > > > > > need to be providing the full and corresponding source and the build
> > > > > > scripts needed to re-create the binary. Once we have such scripts it
> > > > > > should be trivial to trigger that from a CI job. If it isn't then
> > > > > > we're doing something wrong.
> > > > >
> > > > > I was thinking of commiting the build scripts in a branch of
> > > > > https://gitlab.com/qemu-project/biosbits-bits.
> > > > > This would separate them from the main source. The scripts would build
> > > > > a version of qemu-bits based on the version information passed to it
> > > > > from the environment.
> > > > > Before I committed the scripts, I wanted to check whether we would
> > > > > want to do that or have a separate repo containing the binaries and
> > > > > the build scripts.
> > > > > Seems we want the former.
> > > > >
> > > > > As for the gitlab-ci, I looked at the yaml file and the qemu ones
> > > > > looks quite complicated. Can someone help me generate one based on the
> > > > > build script here?
> > > > > https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifacts.sh
> > > >
> > > > Yes, QEMU's rules aren't a good place to start if you're trying
> > > > to learn gitlab CI, as they're very advanced.
> > > >
> > > > The simple case though is quite simple.
> > > >
> > > >   * You need a container image to act as the build env
> > > >   * In 'before_script'  install any packages you need on top of the
> > > >     base container image for build deps
> > > >   * In 'script'  run whatever shell commands you need in order
> > > >     to build the project
> > > >   * Add an 'artifacts' section to publish one (or more) files/dirs
> > > >     as output
> > > >
> > > > The simplest example would be something like
> > > >
> > > >    mybuild:
> > > >      image: fedora:36
> > > >      before_script:
> > > >        - dnf install -y gcc
> > > >      script:
> > > >        - gcc -o myapp myapp.c
> > > >      artifacts
> > > >        paths:
> > > >          - myapp
> > > >
> > >
> > > How does this look?
> > > https://pastebin.com/0YyLFmi3
> > 
> > Alright, .gitlab-ci.yml is produced and the pipeline succeeds.
> > However, the question still remains, where do we keep the generated
> > artifacts?
> 
> The following link will always reflect the published artifacts from
> the most recently fully successful CI pipeline, on the 'qemu-bits'
> branch, and 'qemu-bits-build' CI job:
> 
> https://gitlab.com/qemu-project/biosbits-bits/-/jobs/artifacts/qemu-bits/download?job=qemu-bits-build
> 
> Tweak as needed if you push the CI to master branch instead. This
> link can be considered the permanent home of the artifact. I'd just
> suggest that the QEMU job automatically skip if it fails to download
> the artifact, as occassionally transient infra errors can impact
> it.
> 
> With regards,
> Daniel

This just means once we change the test old qemu source can no longer use it.
Why is this a good idea? Are we so short on disk space? I thought CPU
is the limiting factor?

> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


