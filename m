Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB66C32F2A1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:33:41 +0100 (CET)
Received: from localhost ([::1]:43092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFGe-0004ff-OL
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIEdv-0002k9-DX
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:53:39 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:43315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIEds-0002Uo-SW
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:53:39 -0500
Received: by mail-ej1-x62b.google.com with SMTP id p8so5101403ejb.10
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vysBonPrXb5Wgm4xQHtIBUk1r0Bsj2mWreOcrRZnrb0=;
 b=nLw9VGwkvkD5nPVR1WOw8h6rxvIlaxhcxjswjUtu1TZUlnj0nYEBplUJqX3nLg4Inm
 vsLEBgnlsFh78wrzgvJElj81Tm0vb9ynxoq+e1jHuD5THRthjANZXqB9ug6yLwutQPxs
 LvJU4mv+tG+2TJhNshm/HhPabr9UBc75UEsqoWOQiLP8QAjJYw9pQGUYaiy2jFtGZejl
 n9YjDiyucnrAbUgPD4slAOIH56LpYPYUNHH75VgK8w8WHXXMaECGm0zOCs+zegVfP7Zm
 e6PtcIfa4N2rSSbFRZaA8g5PNT5gJQMLfMNFNgJ1Kgjn8b2dz5DRQEzI9oHJQyC0e8xD
 RfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vysBonPrXb5Wgm4xQHtIBUk1r0Bsj2mWreOcrRZnrb0=;
 b=Y7QpFodSkbj1BFXKF/zpZl1rruI4Rs+hOR3lXdVRjIpdi4JPMjczyyQsxFivxjRrrO
 sOnUuAMX7UlbtEgck68ip+7EdkYFfBVWLVSTkg532UlmFvt43aRxI01jy8OgTryF8pnG
 YkuCuDEnvn4Ba0orcQ+Dzviww/MtJ9HmwooAqO3yq93GU8nU1yfAQTOSkD2WhTwRuMib
 RqNLlMulT4mhA3c5+k8p2H2dKr10fP2crJkPygFXtCyGyAX4QuGC5wfvT3dWyt+BiWkq
 AIDH16buIZ6+is67df3Pxwym6RAsqa1S/zOOlEZ0uo/XyZXFwo6lJ259g3Z3eWpLG3cn
 af5g==
X-Gm-Message-State: AOAM531JH0IHwal0wn/WzFZMAphQ30MVZZZtGyYBPa4Om3FYUXkmX+Q5
 BY8m9Lbi+AdkAiqgH3H4k5ngFkaxTDHltXu7Ap4J3UqTiQU=
X-Google-Smtp-Source: ABdhPJzNu+S8zdcwtsSmbK3xbXXZ+CNknWjidqNCcD/qA7+GCb4nSYayhu7oHt9drOLUuFGOH3fm5URWOtrYcADhitg=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr3428819ejb.56.1614966815412; 
 Fri, 05 Mar 2021 09:53:35 -0800 (PST)
MIME-Version: 1.0
References: <27dfe8eb-adce-8db4-f28b-c42858b086db@msgid.tls.msk.ru>
In-Reply-To: <27dfe8eb-adce-8db4-f28b-c42858b086db@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 17:53:19 +0000
Message-ID: <CAFEAcA-d811Ou-Ks_c_j4kPnD2DrUSfvUYwfsOgonazj16RokA@mail.gmail.com>
Subject: Re: RFC: linux-user: preserving argv[0] of the original binary in
 context of binfmt-misc
To: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <Laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 14 Feb 2021 at 15:34, Michael Tokarev <mjt@tls.msk.ru> wrote:
> As known for a long time, qemu's linux-user, when invoked in context of binfmt-misc mechanism,
> does not preserve the original argv[0] element, so some software which relies on argv[0] is
> not functioning under qemu-user.  When run this way, argv[0] of the program being run under
> qemu-user points to this qemu-user binary, instead of being what has been used to spawn the
> original binary.
>
> There's an interpreter flag in binfmt handling in recent kernels, P, or preserve, which meant
> to pass 3 extra first arguments to the binfmt interpeter, - namely, the path to interpreter
> itself, the argv[0] as used when spawning the original binary, and the actual path of the
> said binary. But qemu-user/main does not handle this situation, - it should be prepared for
> this unusual way of being invoked.
>
> There are several hackish solutions exists on this theme used by downstreams, which introduces
> a wrapper program especially for binfmt registration and nothing else, uses this P flag, and
> uses -argv0 qemu-user argument to pass all the necessary information to qemu-user.
>
> But these wrappers introduce a different issue: since the wrapper executes the qemu binary,
> we can't use F binfmt-misc flag anymore without copying the qemu-user binary inside any
> foreign chroot being used with it.
>
> So the possible solution is to made qemu-user aware of this in-kernel binfmt mechanism,
> which I implemented for Debian for now, as a guinea pig :)

I've always felt that the fundamental problem is that the kernel has never
provided any way for the binfmt handler to know in what way it is being
invoked. So you can't have a handler that backwards-compatibly says "if the
user/distro/whatever installed me with the P flag then I should expect my
arguments like this, but if it didn't then I should do the other thing".

> Since the original problem is the proper handling of programs which depend on their own
> name in argv[0], the proposed solution is also based on the program name, - this time
> it is the name under which qemu-user binary is called.
>
> I introduced a special name for qemu-user binaries to be used _only_ for binfmt registration.
> This is, in my case, /usr/libexec/qemu-binfmt/foo-binfmt-P - where "foo" is the architecture
> name, and "-binfmt-P" is the literal suffix. This name is just a (sym)link to /usr/bin/qemu-foo,
> - just an alternative name for qemu-foo, nothing more.

Mmm, you can work around the kernel's missing feature by using a particular
naming convention. I guess that's better than nothing but I think that if
we want to go this route we should try to get buy-in from more than one
distro that this is the right way to do it...

Alternatively, if anybody has a bright idea for how to get the kernel
to tell us how it's invoking us (ELF auxv entry???) maybe we could make
a proposal to the kernel folks.

thanks
-- PMM

