Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBDF6C2128
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 20:19:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peL2X-0007DC-2s; Mon, 20 Mar 2023 15:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1peL2U-0007Bo-QB
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 15:19:26 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1peL2T-0008Qv-2d
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 15:19:26 -0400
Received: by mail-ed1-x534.google.com with SMTP id x3so50956878edb.10
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 12:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679339963;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TA6rc1ZYHOhNpQ++4+sKLjUkK729vpKEBlyhhMg7zC8=;
 b=Nn/OuzbtmYYkzoCW1DVHDVGxyBE118U1gNhuXLbFwgjIphpDNRtPt661LfN3++daLt
 NyeIjYSLSVwk3Zc5DrQL1Jlohbn1GPqqcogIm67/U0I9chQRPQHuLEztz5287dbvA3cN
 +vTEKj+xR+xJ6zU2FqK+njWpjku+PmgzIUzws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679339963;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TA6rc1ZYHOhNpQ++4+sKLjUkK729vpKEBlyhhMg7zC8=;
 b=WTLb9InOyXWPwwpJWFHNwt/HwTQIAynFvKXXNtexPt3ACRuuRnN3UidyX7ki3HGWEU
 jg5pE+KIbjKe2sKZTmpNoTHp5md6vpuY2Ee+3/gczA3YouoG3Dq6bUpU3fo2LmURh09g
 MqqAcBuDQqtNf7EAwqRoXYM8My1dwSLgo+OQe8tzhzvmm4oamcqiP87z7BZL5+Bd3zF1
 B6i/5H492GnQgDoigbQfLbyGovfHnMqXWewQ1Y2kZkR8PFt7zOTV1tz8anRB5zEtsGX9
 UVCHagt3kOHMlx+rZ8gRCpA5WH5DA8qsRrQJPlNfouWRDqH67NPV98TDMjPtF1KJmHun
 RCpg==
X-Gm-Message-State: AO0yUKUup1Oo5AI/w2L0KZ8l0P5qNzyvChtN8xnFf5WMY5OefnVx08tW
 /kkCNwLMvzmo/TU13W0Qm83+0KC3UmVu89fFzmDzYg==
X-Google-Smtp-Source: AK7set8+DzXv9QjU1WeryjuV7gQYFjwteNKgVWbCHvfVo57JYrbkOSsNGrg3xoAuOmkwdRUSkYMGaIfApdeZJtSVzvA=
X-Received: by 2002:a17:906:7f8f:b0:932:4d97:a370 with SMTP id
 f15-20020a1709067f8f00b009324d97a370mr58282ejr.14.1679339962585; Mon, 20 Mar
 2023 12:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230309115714.906369-1-kraxel@redhat.com>
 <20230309115714.906369-3-kraxel@redhat.com>
 <CAPnjgZ3M4LCXJq6=V-zt3QiiP6PjcL5kUrBB-9OdZghC-sK12w@mail.gmail.com>
 <20230315154914.d2st3c6ioy62cku3@sirius.home.kraxel.org>
In-Reply-To: <20230315154914.d2st3c6ioy62cku3@sirius.home.kraxel.org>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Mar 2023 08:19:09 +1300
Message-ID: <CAPnjgZ2eFezH4JrtAU08o2BujZyfc+Do2bPVTOJUEtWevjdGZA@mail.gmail.com>
Subject: Re: [PULL 2/3] edk2: replace build scripts
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=sjg@google.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -92
X-Spam_score: -9.3
X-Spam_bar: ---------
X-Spam_report: (-9.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Gerd,

On Thu, 16 Mar 2023 at 04:49, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > The README should mention that you need to use
> >
> > . edk2setup.sh
> >
> > first.
>
> The script will do that if needed.
>
> > Also you need to be in the edk2 directory, I think.
>
> Or use the --core switch, or place the location in the config file in
> the [global] section.

That seems to be resolved with the latest script.

>
> > It would be good if the edk2-clone.sh script could deal with updating
> > an existing checkout so I don't need to remove the old ones each time.
>
> Updating is just "git pull && git submodules update".

Even more reason to put it in the script :-)

>
> > edk2-build.py -c ../edk2-build-config/kraxel/x64.platforms -j30 --silent
>
> That config file expects cwd being edk2-platforms and edk2 being placed
> next to it (../ekd2).  edk2-non-osi too.  See the [global] section at
> the start of the file.

OK I see.

>
> > BaseTools/BuildEnv: 160: Bad substitution
> > Using Pip Basetools
> > BaseTools/BuildEnv: 184: Bad substitution
> > BaseTools/BuildEnv: 202: -c: not found
>
> Ok, tried updated the script to use bash not sh for that.  Does this
> work better for you?

Yes, fixed.

>
> > Do I need to make -C BaseTools first?
>
> No, the script will do that.

Seems to work fine now.

>
> > > +import optparse
> >
> > I think this is obsolete and argparse should be used for new things.
> > The conversion is pretty easy.
>
> Done.
>

OK

> > Silent mode still produces output. Can you add a -s alias and also
> > make it fully silent?
>
> Well, silent means no output from the "build" command, so the console is
> not flooded with build logs (unless there are build errors), output is
> written to logfiles instead.

We have a different understanding of 'silent' ::-)

>
> > If the config file is not found, it seems to say nothing, but just
> > does not work. It should give an error.
>
> Fixed.

Works fine.

Thanks for the great script and the fixes.

Regards,
Simon

