Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8046E4AC881
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 19:27:48 +0100 (CET)
Received: from localhost ([::1]:53800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH8jr-0000qK-LE
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 13:27:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nH87N-0004Ph-90
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:48:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nH87I-0001W8-Bz
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:47:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644256071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AUGB0QmStsnca+wc3bCbhc9x9GChGyTcODHRirdgdmk=;
 b=Y/rk0TpJ5gFurLiO3hWktt4PJpo6Sm+OATd8PhopkPd4jNeSE3FUu2e9BNvTNghUaKzgq7
 hjd+fYmibOWZ7mPe0ZvGix3oKM8sSQygnlHG7hxc+eyyVxVY1FagXIVa/1y9K888klHolg
 oDv4oggPT4b4lgO8jci03G7ryulgLcI=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-q4J9kzLPM3SmBTztm3YbJw-1; Mon, 07 Feb 2022 12:47:45 -0500
X-MC-Unique: q4J9kzLPM3SmBTztm3YbJw-1
Received: by mail-oo1-f70.google.com with SMTP id
 t12-20020a4ab58c000000b002dcbee240efso9403787ooo.10
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 09:47:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t6dqe63WZpgpqfgRQcCEzfBAlnJ+vc8SbIl0qG9o3aw=;
 b=asWST49PP2iQ/bFHys/MswqhWzm+ArX+AHkv9Evyqpmj3MXPIXtu/x+6qlmhhHJX/F
 mWzd0TMrtuPzy0pEjjxE6AnSMCAhW/3rwtMKMtVI8+PRLdJWb3w6C86Lv9ruWTeTg6hH
 p4xAu5R3RmIsr++yi4ui0dZnA2TWSh0uGY7RYOHf/EUhOfNlcnC4S9fVzZiI7ZEyPuDt
 q++OTrDIOBCE0Q+Yqj8kxZTGQetXIvzje9Jqe3p61iCao+Hco6WiaMLnqNMnYHwViyhp
 K3kYLRJ+bPC7vHG3oDhoUNyGSBmX30hGRKGEWHyGOdDS8oErRhqdqmZo93nrKM8mxFfS
 7pHg==
X-Gm-Message-State: AOAM533aQtEjKzJsCJwxlRpbl54jx68ZzGcI11qyMO0tLu0GCF0ReSCh
 5PzURSjSwuG/gbbBUltPy9m5RyzkTSKzMi/qHXbPyYnsX536keB1O3LNY6zMPlRQUYPOD78oQx+
 5IiMTMp0g6N26/o8=
X-Received: by 2002:a05:6830:34a3:: with SMTP id
 c35mr391028otu.113.1644256064384; 
 Mon, 07 Feb 2022 09:47:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpNe4yhHnCl9/WY25Eadxk15o8KxIvSawJv3Jln2R4pZe2cxSNq4k7TpvWb7yGUDrqlehRng==
X-Received: by 2002:a05:6830:34a3:: with SMTP id
 c35mr391012otu.113.1644256063835; 
 Mon, 07 Feb 2022 09:47:43 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id z17sm4116290otk.62.2022.02.07.09.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 09:47:43 -0800 (PST)
Date: Mon, 7 Feb 2022 10:47:42 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PULL 0/2] VFIO fixes 2022-02-03
Message-ID: <20220207104742.73a904d7.alex.williamson@redhat.com>
In-Reply-To: <20220207095459.6fb4b716.alex.williamson@redhat.com>
References: <164392758602.1683127.4327439310436541025.stgit@omen>
 <CAFEAcA-CX6hPOEEr_Yjcd1=4AHfkYgnkQ_ruUJ4mFwBYz1fLQA@mail.gmail.com>
 <20220207085045.1de46df1.alex.williamson@redhat.com>
 <9ee51368-df12-1f9f-70e4-1fbad90f43ae@amsat.org>
 <20220207095459.6fb4b716.alex.williamson@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Feb 2022 09:54:59 -0700
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Mon, 7 Feb 2022 17:08:01 +0100
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
>=20
> > On 7/2/22 16:50, Alex Williamson wrote: =20
> > > On Sat, 5 Feb 2022 10:49:35 +0000
> > > Peter Maydell <peter.maydell@linaro.org> wrote:   =20
> >  =20
> > >> Hi; this has a format-string issue that means it doesn't build
> > >> on 32-bit systems:
> > >>
> > >> https://gitlab.com/qemu-project/qemu/-/jobs/2057116569
> > >>
> > >> ../hw/vfio/common.c: In function 'vfio_listener_region_add':
> > >> ../hw/vfio/common.c:893:26: error: format '%llx' expects argument of
> > >> type 'long long unsigned int', but argument 6 has type 'intptr_t' {a=
ka
> > >> 'int'} [-Werror=3Dformat=3D]
> > >> error_report("%s received unaligned region %s iova=3D0x%"PRIx64
> > >> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >> ../hw/vfio/common.c:899:26:
> > >> qemu_real_host_page_mask);
> > >> ~~~~~~~~~~~~~~~~~~~~~~~~
> > >>
> > >> For intptr_t you want PRIxPTR.   =20
> > >=20
> > > Darn.  Well, let me use this opportunity to ask, how are folks doing
> > > 32-bit cross builds on Fedora?  I used to keep an i686 PAE VM for thi=
s
> > > purpose, but I was eventually no longer able to maintain the build
> > > dependencies.  Looks like this failed on a mipsel cross build, but I
> > > don't see such a cross compiler in Fedora.  I do mingw32/64 cross
> > > builds, but they leave a lot to be desired for code coverage.  Thanks=
,   =20
> >=20
> > You can use docker images:
> > https://wiki.qemu.org/Testing/DockerBuild =20
>=20
> Hmm, not ideal...
>=20
> Clean git clone, HEAD 55ef0b702bc2 ("Merge remote-tracking branch 'remote=
s/lvivier-gitlab/tags/linux-user-for-7.0-pull-request' into staging")
>=20
> $ make docker-test-quick@debian-mips64el-cross J=3D16

Accidentally selected the mips64el, but tests failing seems to be
common.  I can reproduce the build issue with either the mipsel or
fedora-i386-cross, so I'll include some flavor of the test-build in my
build script.  Thanks,

Alex


