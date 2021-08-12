Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FD43EA77C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 17:25:21 +0200 (CEST)
Received: from localhost ([::1]:45614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mECa8-0004Sf-2e
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 11:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mECZ9-0002tb-QX
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 11:24:19 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mECZ8-0003Mn-7o
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 11:24:19 -0400
Received: by mail-wm1-x330.google.com with SMTP id f10so1675301wml.2
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=iWO/8fBupg3zWsLFRus4HfAH3y+LCg/9xyQFGKFT6Eg=;
 b=bITspaQlOLRNCb2KQMFI+5r4KxMz+HmPN0S0By67AyjFEvkyOoO7DX4Nhgp+Dw38vh
 j0iMiQcQeetJuQ1Rj+BI6B+kR/PjtGK9RGcStmfWuByrXI1UnmwaL2Jug6SmZp/BRFMC
 W+FyViZoTpgbKrjy6W0zVOX3gtjHZ3WS/9yJ0LROZZLaFtFjioO+9NXYwp4bEz11slBq
 ub9UG0upelMZUVw+l/NmoLp4Hy4CrTym8dUxvIzpSd8IrQR1+h/UAAKm1Q9usJJj81ln
 MI8ajntW3OVNbWyv/dpqHAYphzk6q27Fr/F4wTWOPTz1jfvtOUmHV37EXz/vmYJasYWG
 Guuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=iWO/8fBupg3zWsLFRus4HfAH3y+LCg/9xyQFGKFT6Eg=;
 b=ojEBd1I4c+yGfJQ0G9wfLuFQqZZ6IXn+whO1uMluov5dfLYaqyl/I/FQ8COUYaDhRt
 Qj+hJmsJ1fQNhRrIBhjHkup6KIKIIL89rqCv1yMcYdL5xlEZVC1ZRXsWUfPw4DFYmQOd
 LAVCnDccxrL2dj/q1Upl7u7Nl7pZALvn/L3UvbrV+5RMWdDPnUljlgbPg3qxHeRsKDX2
 /MAFxpm6/GylXojwOuchD3dGiWM3L42tRGpad3HWMbKn+hoIq1B2X2aRTMoncQjZyUsy
 gbePOi86cAkDXrDOMO7XAUw9G96glSpN3qNiA8rg/B14n0u504yyJt41OXd712AvsXcs
 3Lrg==
X-Gm-Message-State: AOAM5327Iq0Cnbp9T2ha4UkOGnhw0iBbptWbttQ00aX5YPYEe5tlKYk9
 QzNDnn8U1lJ+VCqJnnZ6NyzxOw==
X-Google-Smtp-Source: ABdhPJyTkVP/ycMLS0e+oQidVJIVp3UZsWCcoaPLq2c5mHtUCGlH+tGZ5nLSnnNr9caPpxWoG3FZ1Q==
X-Received: by 2002:a7b:c922:: with SMTP id h2mr9671735wml.186.1628781856746; 
 Thu, 12 Aug 2021 08:24:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l12sm2808117wms.24.2021.08.12.08.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 08:24:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DA2051FF96;
 Thu, 12 Aug 2021 16:24:14 +0100 (BST)
References: <20210811100550.54714-1-pbonzini@redhat.com>
 <875ywb6lxu.fsf@linaro.org>
 <CABgObfYW2acs4upbm7mjfhGhvK+sSLKNPC4LJUNQF9OGi8xM7g@mail.gmail.com>
User-agent: mu4e 1.6.2; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for 6.1] plugins: do not limit exported symbols if
 modules are active
Date: Thu, 12 Aug 2021 16:19:16 +0100
In-reply-to: <CABgObfYW2acs4upbm7mjfhGhvK+sSLKNPC4LJUNQF9OGi8xM7g@mail.gmail.com>
Message-ID: <87r1eyznxd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: "Maydell, Peter" <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> Il gio 12 ago 2021, 11:40 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha sc=
ritto:
>
>    ERROR: glib-2.56 gmodule-noexport-2.0 is required to compile QEMU
>
>  Should it be gmodule-no-export? Hopefully the different distros aren't
>  packaging different .pc files.
>
> My bad. :( It's correct with the dash.

I've patched it locally and it's sitting in my PR branch:

  https://gitlab.com/stsquad/qemu/-/commits/pr/120821-for-6.1-rc4-1

but it looks like it will have to go via stable unless there is a more
compelling reason to cut an rc4.

>  Does this mean --enable-modules would allow plugins to access more of
>  the API space than we intended in the first place?
>
> Yes, but before it would do so even without --enable-modules due to
> using gmodule and not gmodule-no-export.

OK so it's better now. I wonder if this helps with the Windows usage of
modules?

  Subject: [PATCH v6 0/5] Enable plugin support on msys2/mingw
  Date: Tue, 13 Oct 2020 08:28:01 +0800
  Message-Id: <20201013002806.1447-1-luoyonggang@gmail.com>

I really want to avoid the hand hacking of Youngang's proposed changes
so was surprised that glib hadn't papered over the POSIX/Windows cracks.
However like MacOS I don't have easy access to a Windows developer
system to experiment with.

--=20
Alex Benn=C3=A9e

