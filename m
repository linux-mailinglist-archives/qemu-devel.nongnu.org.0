Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62966F713F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:40:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoN-0006xh-5q; Thu, 04 May 2023 13:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puYmx-0004wB-FR
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:14:27 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puYmv-0003LZ-J2
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:14:27 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50bdd7b229cso935440a12.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 06:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683206063; x=1685798063;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+OS+rvaT18gIBkWTRu4k13YKFqh5DlPQJy3gxBZUzZQ=;
 b=OXUYBgJCquolzNHvj7+Ej3ODY/dMMMFlSL6SIphtkQfNIh36wvqstFjL/um2UU8Rgj
 BSByDFXnVcZQMiazsmKv2V2ZWbAdSEtKu8DNn2jnaM56+9VKNwKO+hjCe0wDpAlSmGTg
 Hy5V6XM+nX1PvhWSQ/Ryhva4G9qQRk5OGOjrlaNfear8PfLwWuShdkfF1w7epzR7FWBR
 kkzLgWVRpLklZWtU14SR654+WSEm8Z8YP1Sy0ReBdvmBkAMXzNqDtpYGe2vl3BAPzMj4
 7JKARj7a4kv64a70qpDzjnUKjeb8ADEQ3q92/IK9us1WNZqj2186rUyDyTbLL73m3Vuf
 ddHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683206063; x=1685798063;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+OS+rvaT18gIBkWTRu4k13YKFqh5DlPQJy3gxBZUzZQ=;
 b=B/kSHh+A9+EWwF5TiyfsVfXlkCNnS/1jfSx7YD5ZN6+5X3uE/5K8yWfzmSzPrIL2HO
 VfEm9UbqNnn32+hMGiqCTGce4epmBPxkizjalmCm3A60wVkMHMWaFeVIGnoD/2cZhydH
 CfbvcbHnOud6LUf6cgYHpXbd4kZLZ8J5G/UQ9L4KNBdAXqkUrGRmYhTqlhgPMCAvhA3z
 P02nv+lrLRMMLZ1f1UpQvUKKCgqTgsJodEfE16qqEQWeCkpHmpM9wYPA9FO47KpucL6p
 egEMs9m0o2TcmDT/NOtGxkDcBUYg+pTR8xMV/ah6H8e5PtunU6w844bYUgfGZlGU46jR
 5oYA==
X-Gm-Message-State: AC+VfDx57AELD8+YkgO+Qx1x1YGCMtz2adPePRnxJZ4OurBIA6X6m12w
 PQ0aNzP+S27iMVZIsYmUrZapOxFFOCtreRjBLlxat5tdthVLikRy
X-Google-Smtp-Source: ACHHUZ4wPLecyfHppdLOBj9p0rsNKShzOWipZofe6mGwoBqAZ7E/xFxj62s0EZSu2i0DpfqgeF8gQ2DopQdtiNzb33o=
X-Received: by 2002:a50:ed18:0:b0:50b:f7b2:79d0 with SMTP id
 j24-20020a50ed18000000b0050bf7b279d0mr1451542eds.31.1683206063033; Thu, 04
 May 2023 06:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230503203947.3417-1-farosas@suse.de>
 <20230503203947.3417-3-farosas@suse.de>
 <CAFEAcA-QU0qs=P8GLPcngt96TiOHQTaRUnuyfadyut=fo5ymwA@mail.gmail.com>
 <87fs8ccncq.fsf@suse.de>
In-Reply-To: <87fs8ccncq.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 May 2023 14:14:12 +0100
Message-ID: <CAFEAcA94F2upWrYnd+B2s5URP4nWKJ68KK9Ey8-rodaYHh_Ruw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] meson: Deserialize the man pages and html builds
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 4 May 2023 at 13:06, Fabiano Rosas <farosas@suse.de> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Wed, 3 May 2023 at 21:39, Fabiano Rosas <farosas@suse.de> wrote:
> >> Since they can now run in parallel, separate the Sphinx cache
> >> directory of the two builds. We need this not only for data
> >> consistency but also because Sphinx writes builder-dependent
> >> environment information to the cache directory (see notes under
> >> smartquotes_excludes in sphinx docs [1]).
> >
> > The sphinx-build manpage disagrees about that last part.
> > https://www.sphinx-doc.org/en/master/man/sphinx-build.html
> > says about -d:
> > "with this option you can select a different cache directory
> >  (the doctrees can be shared between all builders)"
> >
>
> The issue I had is that sphinx by default uses smart quotes for html
> builders, but not for man builders. But whichever builder runs first
> gets to set the smartquotes option and that sticks for the next
> builder. That causes our man pages to come up with fancy curly quotes
> instead of ' which is probably not an issue, but I didn't want to
> produce different output from what we already have today.
>
> I ended up conflating the cache directory (-d) with the environment
> (-E), so it is possible that we can reuse the cache but not the
> environment (where I assume the smartquotes option is stored). Well, I
> better go read the sphinx code and figure that out.
>
> > If we don't share the cache directory, presumably Sphinx
> > now ends up parsing all the input files twice, once per
> > builder, rather than being able to share them?
> >
>
> Yes, but having it run in parallel from the ninja level is still
> faster. Of course, if we could reuse the cache, this could potentially
> be even faster. I'll try to determine if it is really safe to do so.

Yeah, I wouldn't be surprised if we need the caches separate
for concurrency reasons, so this may just be a "commit message
might need tweaking" nit.

-- PMM

