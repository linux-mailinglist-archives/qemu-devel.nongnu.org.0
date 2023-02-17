Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D2669AFA3
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:39:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2nw-00033H-3R; Fri, 17 Feb 2023 10:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pT2nr-000312-5S
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:37:39 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pT2np-0000Ti-LH
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:37:38 -0500
Received: by mail-pf1-x42a.google.com with SMTP id fd29so682760pfb.6
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 07:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PrcJbSbT+b3N+Wka3JUObeUxeitOe8KC3eH1DznGwcU=;
 b=mc+RmrBhgMBv9QGnHNTZBJTkGQVuGfbVic5XflxHkX9lyS6/4+WrnaaHLoNIlaZZzO
 yWd8dh2Bfb31stqoyTVnSKl0McdSjhj1B0UBsoR+8efYCm7nSaSk/VqWZZ7zGmo6sGaF
 95HLy99VAhsb9gMp9DaCV8qALAIwVQMudKMNTGyvy4XlE5kezXDultRXVQE8z2oZliG4
 28dLwysbgOxAWe7tMs5ObDxjPggX3Al+A9SaNJpBirJmVSeP5IXM8m0yiqgG7dvbt/Gz
 W8uondeKXsI/EiWqo7nGdI8x7KyOXGMBqQJYXGa1kteb30lC51wqQdVBo9BDynxIz4Bn
 5gng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PrcJbSbT+b3N+Wka3JUObeUxeitOe8KC3eH1DznGwcU=;
 b=4itE+zxZahHq1yHlT2d7TG9hL4NBt+YP04f4wXVOHrq/s+7ZiPb4DX3/UoERV2NpfO
 GmexduTF/a38fqVxHaj4jTrCY68ndcwz37dfoh9HN2WOHbSmEXDnRlNdN6nFzSAb0fX/
 7djsHQLICQTOhMZ4rsblfXN5s1oHA/kYzmpyzjGjKGDzoS+6Z3zrQw71Gbw4SZ3Nb29x
 6vPySqpkGZAX4iGGg63XIw0nJkUcieFc361GAtNHl8DpAn2hldqVu26yPQqNymW7Id/x
 cwIzAA9BvoBOQtVbcRTBsN3di5l70AgS/d8wiMtDgn2D/iUVN954edEW3ImYb4UayrCV
 tiYw==
X-Gm-Message-State: AO0yUKVRmYUQMwm82ThI2Qt7QgkBmx4JA6XnjeNELex0Fg3u2XO05ViX
 RjWCETWJOizX18JujLqBA6Vqm3/eQk5CzwzPzaQKkg==
X-Google-Smtp-Source: AK7set8PEYiO2NcRYbuZwC9DRuld0A3jcDbsoJ9aTe9YLC7R0ZrFgdPWjT3RVJREJjDhcjuyG88ZcAtT55uCaaiOOmE=
X-Received: by 2002:a63:3687:0:b0:4ff:6f63:2bb3 with SMTP id
 d129-20020a633687000000b004ff6f632bb3mr69182pga.6.1676648247351; Fri, 17 Feb
 2023 07:37:27 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <87v8k2ycjb.fsf@pond.sub.org>
 <a2783906-cad2-2d47-5bbb-66d799b2a4b8@redhat.com>
 <87zg9cirti.fsf@pond.sub.org>
 <331ac041-254e-8db8-33f3-23b36e6a431c@redhat.com>
In-Reply-To: <331ac041-254e-8db8-33f3-23b36e6a431c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Feb 2023 15:37:16 +0000
Message-ID: <CAFEAcA-JbjSSjR05_zA-g+L7G_Y2QjvEL2COxKD407y0=nUNrg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Python: Drop support for Python 3.6
To: Thomas Huth <thuth@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 17 Feb 2023 at 09:56, Thomas Huth <thuth@redhat.com> wrote:
>
> On 17/02/2023 10.06, Markus Armbruster wrote:
> > Thomas Huth <thuth@redhat.com> writes:
> ...
> > My view on all this is a bit more pragmatic.
> >
> > For a human developer, the difference between "dnf install
> > python-sphinx" and "pip install sphinx" is, in my opinion, close to
> > negligible.  Really no comparison to "git-clone GCC and bootstap it".
> > You seem to disagree with that.
>
> Honestly, being a Python ignorant, I completely messed up my system with
> "pip" already a couple of times, especially if the instructions forgot to
> tell me to use the "--user" switch. So yes, I tend to disagree ;-)

Seconded. I trust my distro package manager and I know how it works,
and I know how to uninstall a package later if I want to revert what
I've done. I do not know or trust what the heck pip is doing or where it's
trying to install anything, because it's not a tool I habitually
use. I can't remember if I've managed to mess up the system with it,
but I've definitely had the experience of "install stuff with pip,
do a distro upgrade later, the pip installed stuff is all busted".

> > For automated builds in general, and distro packaging in particular, the
> > difference is real, and could even be a show stopper.  But who's
> > packaging bleeding edge QEMU on CentOS 8?  I suspect the only automated
> > builds are our own CI, where the difference is real, but hardly a show
> > stopper.
>
> If we've got the feeling that nobody out there really builds QEMU on older
> long-term distros anymore, then why the heck are we still trying to support
> this according to our support statement?

I don't think anybody is *packaging* new QEMU on an old distro.
I do think we have users who do ad-hoc from-source builds.

thanks
-- PMM

