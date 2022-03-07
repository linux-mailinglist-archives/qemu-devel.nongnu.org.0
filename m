Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B574D083B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 21:18:56 +0100 (CET)
Received: from localhost ([::1]:59386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJol-0005tH-Cv
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 15:18:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRJn7-0003p9-FP
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:17:13 -0500
Received: from [2607:f8b0:4864:20::b36] (port=34652
 helo=mail-yb1-xb36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRJn6-0007ck-0k
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:17:13 -0500
Received: by mail-yb1-xb36.google.com with SMTP id h126so33404439ybc.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 12:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4XwXC2WCaGlQ6EOIk/PvDuN2PnbCghZqme8J34+beVQ=;
 b=OVe4N88pvDS0U04vARflFXXyvmvpfktfU0dWrvJz7pg456oKYuRARsYNPzpfiKEuJc
 QowKNiAQ7jXi0Y1ccmJd98kKeC8uWB3DCt95OEyNlt/2ejG28L5nX5oAPksbRcXAxExV
 3uvXyFFiHJE9TosoODD6GtV/N+RxTR1V5Jw2WVW5dMYz0LoB2y74Rp0gVBjnzMrvBBot
 0N4NYOxRZTv9JMoI5fE1m/dHQFWW8eGmFt4IMgpXhEsDwbMuAeAsVcgsMAVNIooeSwY8
 Y5xQaxR8maiLyGKmo2M0M9y746n+dVtkxtzlmmlaUJee6Ks6ejj6TNjyH43Bp6PjUTFA
 yLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4XwXC2WCaGlQ6EOIk/PvDuN2PnbCghZqme8J34+beVQ=;
 b=fnHOSCX6xSwS8asQToSZo/DVRHBK1bmFe+GxDQJJ1EXj9gAqk0hriQFIsuVnSQID9w
 fZLAVx7H0zu52o4msPkj0BhJTZb6toN/fvTFmS588AVBF2PNzxenacjdVesrBcJlWcAJ
 EM4HgMpIRKN1wAgqG6by9yl+oJjhh8lCYiRPxxPe15MIvMJa+CoOZfZWBVqWZQnzl+N+
 s5ZyLs1irfRU2+mplIbcZB15iT10ciu7Ir9LBdGbAKIzyZ5nAtV0dMaq2MDaUuHH6oof
 m3ZGNwWwA3dm7nHxMSjG/9oo/fjylD+OHz610oFxspDVpoj02zVamOyeZPUCgwEKHb5K
 aJfg==
X-Gm-Message-State: AOAM5315nSRza4nwr4vGWGdQGcIvq8q93bNWc+JKAo5on+mhLmNX0GV3
 3VVgeQzUdWKvovP87xoMP8DAvFSD86oSu/zY2WguZgnRIesQ5g==
X-Google-Smtp-Source: ABdhPJxbUXzYIq7Jxczt1D58pTp0ByvQ1ODjsuJltuMbhROVMOW6VzPBaDkFmvOrPt8BEnppCtGLFqf82kQcdheC8x0=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr9193985ybp.39.1646684230995; Mon, 07
 Mar 2022 12:17:10 -0800 (PST)
MIME-Version: 1.0
References: <20220305105743.2384766-1-peter.maydell@linaro.org>
 <20220305105743.2384766-2-peter.maydell@linaro.org>
 <CAFn=p-a69z8v_rEBYLCsvMaOj_0uL0JOmUw+KZ7EgT-y3GBVjg@mail.gmail.com>
In-Reply-To: <CAFn=p-a69z8v_rEBYLCsvMaOj_0uL0JOmUw+KZ7EgT-y3GBVjg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Mar 2022 20:16:59 +0000
Message-ID: <CAFEAcA9nmvFEduSH_=jn84RJDwZRNmRPAevRNB+FOP0s_B1kbg@mail.gmail.com>
Subject: Re: [PATCH 1/3] nsis installer: List emulators in alphabetical order
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Mar 2022 at 19:25, John Snow <jsnow@redhat.com> wrote:
>
> On Sat, Mar 5, 2022 at 5:57 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > We currently list the emulators in the Windows installer's dialog
> > in an essentially random order (it's whatever glob.glob() returns
> > them to, which is filesystem-implementation-dependent). Add a
> > call to sorted() so they appear in alphabetical order.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  scripts/nsis.py | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/nsis.py b/scripts/nsis.py
> > index 5135a058316..383bef70332 100644
> > --- a/scripts/nsis.py
> > +++ b/scripts/nsis.py
> > @@ -34,9 +34,9 @@ def main():
> >          with open(
> >              os.path.join(destdir + args.prefix, "system-emulations.nsh"), "w"
> >          ) as nsh:
> > -            for exe in glob.glob(
> > +            for exe in sorted(glob.glob(
> >                  os.path.join(destdir + args.prefix, "qemu-system-*.exe")
> > -            ):
> > +            )):
> >                  exe = os.path.basename(exe)
> >                  arch = exe[12:-4]
> >                  nsh.write(
> > --
> > 2.25.1
> >
>
> Do you care if this order is dependent upon the locale settings of the
> host machine?

Everything we're sorting is lower-case letters only, so the locale
shouldn't matter.

-- PMM

