Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA5A578E73
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 01:47:13 +0200 (CEST)
Received: from localhost ([::1]:35070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDaSG-0005m6-IM
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 19:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oDaPP-0003sL-2J
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 19:44:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oDaPK-0002Mm-6M
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 19:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658187846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=coZega9o0fMioOUj+1cb0UMpaDq6OYfuXETdheFHsUw=;
 b=U5buBk1ydk5MH49YzioxNOp9RwJ3I+WkMoZQMN3hZJBsuO0aKxt0upmBJQ6woTg70xMpWe
 1zTPwQXaQ6BUsNYthYwiT30dIfmBU1OTaScUV8KrQjr8p3l71D9ksfZyt8dvxSUMNsFRZo
 9jJ5akyDLU6+zk2FtGtvpF3q4XyLGy4=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-3nwwWZ8UNYOl-Us_DvObgA-1; Mon, 18 Jul 2022 19:44:05 -0400
X-MC-Unique: 3nwwWZ8UNYOl-Us_DvObgA-1
Received: by mail-ua1-f70.google.com with SMTP id
 o43-20020ab0596e000000b0038421e4c7deso250014uad.19
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 16:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=coZega9o0fMioOUj+1cb0UMpaDq6OYfuXETdheFHsUw=;
 b=FD7DnfOSI00c8pHr/cMBX54mozsJ0VetFSaDdAqbv1eouSILbGTgBi3RS+LW2wEYKL
 ApuhYyayd1LOpBRhClBQEsEw9hbOBR9Zxk+1LBopXhCvS2M0gY8dJmx6qGxYYDww1UfR
 E44K6nyWtxNYBNDKqpkm3c4vHDiM6IlJThJvuhUXoUy24TzHMeJ7QEEmmgfBywmk9IOH
 UOBTiRFCQkEAcS3luxcgenbiW05aLyAQ09R++TMAZ1uSJCO0MyUs3PSgOZ9NQa975xo+
 A51Q0oKFMODdI/C101olnm022da2ENJe1hEWObLH4NUykjMATIqAupLAdMlB5I+lp8i5
 sr6Q==
X-Gm-Message-State: AJIora8V5eRcCFmU0qDyk+lQ6XcbXAiW6WTYTbESNZCI4CWHPCyxNxJN
 Vm+Gj2cDqRn+h0R5/xprtxJ2KSTWjDekX4kJxMyV7d2P5PLTfMdpcGUMkLKoCaAmwZuTkAe4jk+
 mRYt2irc8TiNvm5+cwLLRWU+Rkd9pqrs=
X-Received: by 2002:a67:f4d1:0:b0:357:2c70:79b1 with SMTP id
 s17-20020a67f4d1000000b003572c7079b1mr11331255vsn.11.1658187844691; 
 Mon, 18 Jul 2022 16:44:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u4Q4dym2lubDM3TXPUEcbfetM4/8ClHz0ELbRCe7tnQMeUVmXu+Q651NTX7K54Il3CjAkyRmpTYilFoJbbVG8=
X-Received: by 2002:a67:f4d1:0:b0:357:2c70:79b1 with SMTP id
 s17-20020a67f4d1000000b003572c7079b1mr11331244vsn.11.1658187844450; Mon, 18
 Jul 2022 16:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220708153503.18864-1-jsnow@redhat.com>
 <07a62298-89e9-2d11-3d3b-441c4b7a96bc@redhat.com>
In-Reply-To: <07a62298-89e9-2d11-3d3b-441c4b7a96bc@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 18 Jul 2022 19:43:54 -0400
Message-ID: <CAFn=p-beQzWPhZ11zpeuqZ8XWabOSLZ1sF8_w2n=xRnPBZ3n1A@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] Improve reliability of VM tests
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Daniel Berrange <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, Jul 18, 2022 at 4:17 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 08/07/2022 17.34, John Snow wrote:
> > Note: patches 10-12 are included for testing simplicity, they shouldn't
> > be merged. They will be included in a forthcoming block PR.
> >
> > V4:
> >
> > - Addressed concern by Marc-Andre in patch 01.
> > - Squashed Ubuntu patches (rth)
> >
> > This patch series attempts to improve the reliability of several of the
> > VM test targets. In particular, both CentOS 8 tests are non-functional
> > because CentOS 8 was EOL at the beginning of this calendar year, with
> > repositories and mirrors going offline.
> >
> > I also remove the ubuntu.i386 test because we no longer support Ubuntu
> > 18.04 nor do we have explicit need of an i386 build test.
> >
> > After this series, I am able to successfully run every VM target on an
> > x86_64 host, except:
> >
> > - ubuntu.aarch64: Hangs often during testing, see below.
> > - centos.aarch64: Hangs often during testing, see below.
> > - haiku.x86_64: Build failures not addressed by this series, see
> >    https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg02103.html
> >
> > The unit tests that I see fail most often under aarch64 are:
> >
> > - virtio-net-failover: Seems to like to hang on openbsd
> > - migration-test: Tends to hang under aarch64 tcg
> >
> > Future work (next version? next series?);
> >
> > - Try to get centos.aarch64 working reliably under TCG
> > - Upgrade ubuntu.aarch64 to 20.04 after fixing centos.aarch64
> > - Fix the Haiku build test, if possible.
> > - Ensure I can reliably run and pass "make vm-build-all".
> >    (Remove VMs from this recipe if necessary.)
>
> Not sure whether it's related to your patches, but when testing these I just
> got an error while running 'vm-build-openbsd' :
>
>      VM-BUILD openbsd
> fatal: not a valid object name:
> failed to archive qemu
> Failed to prepare guest environment
> Traceback (most recent call last):
>    File "/home/thuth/devel/qemu/tests/vm/basevm.py", line 641, in main
>      vm.add_source_dir(args.build_qemu)
>    File "/home/thuth/devel/qemu/tests/vm/basevm.py", line 277, in add_source_dir
>      stdout=self._stdout, stderr=self._stderr)
>    File "/usr/lib64/python3.6/subprocess.py", line 311, in check_call
>      raise CalledProcessError(retcode, cmd)
> subprocess.CalledProcessError: Command '['./scripts/archive-source.sh',
> '/home/thuth/tmp/qemu-build/vm-test-rm_z92hq.tmp/data-44e42.tar']' returned
> non-zero exit status 1.
>
> The error did not occur again when running the command again, though.
>
>   Thomas
>

I haven't seen this one before, admittedly. Looks like
scripts/archive-source.sh L52 choked?

git archive --format tar "$(tree_ish)" > "$tar_file"

I'm not sure what "fatal: not a valid object name:" might be referring
to. Maybe tree_ish picked up something that tasted bad? I really don't
know.


