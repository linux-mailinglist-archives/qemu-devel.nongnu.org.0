Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A0F3FDF6B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:09:42 +0200 (CEST)
Received: from localhost ([::1]:36572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSo1-0008Do-Ao
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLS0i-0007dP-9T
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:18:45 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:41958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLS0c-0004oU-FM
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:18:43 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so1873036wmq.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 08:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tb6HEiyVd/5u3ii8Uge9IjekFOIs+PGhTVvVrj8+cHw=;
 b=n8fRNo688fGqHDUQPZm77F467U68h6G0K4eoc2O69+/NPLGDSns+I5obZ5xoPmVnQ/
 933uGLG4hFrDMxL2ICgRRU8RmO1q/gN421XksXGYvccQS+4SkaHMLiNZdpJYre8IH3IJ
 Ub/dihHW/e/cys08869QMt62vD2PU9j/cBpB5gfWOmekGwLIGWrJ7X8plt5fUMhWB25L
 hsLtWYbONcctE+u1dYE6FY6kWkp7WY42ryoCAcBSbgJpy7jGZX/6zMV0haZnGN6gK2kt
 6YGDi34hYHSVLQLgP/ocIYujLwQBXwT7ynone0MnQbIz6Ho4bwpBhW63xPwxtUSmadQk
 TBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tb6HEiyVd/5u3ii8Uge9IjekFOIs+PGhTVvVrj8+cHw=;
 b=eLI2O7LbmZ8WUqJWSlKZEZb6dETM8KjFhChZobowJBWSGFl0cmuU60N8gFJbLFwMd6
 cpBzQwb1ShpWyH5keoMcGP4ywOvJmvk8jz6T8wtucnosx0ojaqVrVyrIONRyFxi0g0ib
 bF+QxGzb10ucvX/G389yu7rX68oTy66luQxxdBw1mTXD8q9um1HB6NWLs5z71E2BVcYg
 Z3Rw0N2P43BA82dEDDDDvNbqf5jXWpejpsESL/N5/xNQuaA0piouSyi59kPV1KVBbtuR
 B4F6H3HoYmJq7TNvDLXckfg4AzKsDd1SzOFhnvzgJ9KwblUlGQZnz0kkflPHA2LNvnoK
 VjoQ==
X-Gm-Message-State: AOAM533GzPlz/SAlszyM+/m/Ymlei45Wv/yvpSyw53ReUzAmQXishp77
 Ww4NUPQl5wUfcjwIfNMGQa4CGn+5NH5/opWZ/IWZ2g==
X-Google-Smtp-Source: ABdhPJxMzqdA+NDH/73XRK55dVVqok8FnMKX6zbekm74COJ8X24PzSqHTlnGmnBlrLmAUI09TtLwSBhOJtJs0YkC2eQ=
X-Received: by 2002:a7b:c041:: with SMTP id u1mr10001668wmc.95.1630509516889; 
 Wed, 01 Sep 2021 08:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210901145229.4132606-1-philmd@redhat.com>
 <YS+UylEr3CJyksxt@redhat.com>
In-Reply-To: <YS+UylEr3CJyksxt@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Sep 2021 16:17:48 +0100
Message-ID: <CAFEAcA_gyZTfUTAAoKvrA-qyv-8dOvGjLSLmq2uaur8XYS6CuQ@mail.gmail.com>
Subject: Re: [PATCH] gitlab: Escape git-describe match pattern on Windows hosts
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Sept 2021 at 15:59, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Wed, Sep 01, 2021 at 04:52:29PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Properly escape git-describe 'match' pattern to avoid (MinGW):
> >
> >   $ if grep -q "EXESUF=3D.exe" config-host.mak; then make installer;
> >     version=3D"$(git describe --match v[0-9]*)";
> >     mv -v qemu-setup*.exe qemu-setup-${version}.exe; fi
> >   fatal: No names found, cannot describe anything.
> >   ERROR: Job failed: exit code 1
> >
> > Reported-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > Fixes: 8619b5ddb56 ("ci: build & store windows installer")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/591
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> >  .gitlab-ci.d/crossbuild-template.yml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossb=
uild-template.yml
> > index 10d22dcf6c1..62d33e6661d 100644
> > --- a/.gitlab-ci.d/crossbuild-template.yml
> > +++ b/.gitlab-ci.d/crossbuild-template.yml
> > @@ -14,7 +14,7 @@
> >      - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
> >      - if grep -q "EXESUF=3D.exe" config-host.mak;
> >        then make installer;
> > -      version=3D"$(git describe --match v[0-9]*)";
> > +      version=3D"$(git describe --match 'v[0-9]*')";
>
> Do you have a pointer to a pipeline showing this fix works ?
>
> It is a bit strange to me. AFAICT, the only difference would
> be if the unquoted  v[0-9]*  matched a filename in the
> current directory, but that doesn't seem like it is the
> case here.

We should quote the glob pattern anyway, to avoid possible
really confusing behaviour in the future if such a file ever
does turn up...

-- PMM

