Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E27F46C833A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 18:21:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfl5B-0002AT-OI; Fri, 24 Mar 2023 13:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pfl51-00029u-6Z
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:19:55 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pfl4y-0003MB-4z
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:19:53 -0400
Received: by mail-wm1-x32d.google.com with SMTP id n19so1589455wms.0
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 10:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679678390;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dlroYhnHzOmuUQKomh0xfwK+9hDCG+jWKAbA6mgW2X0=;
 b=lPiXcYxRcyHnznkuRmIXAYdFYtzOwoS4fa1TVicraIxiWk0aiBNqUmeTt9k2k5WX07
 h56IR6YHeRUPOqxmpgCuD7qrG6FUKcOZjVxn9JX0VUoFVmZ8fxjLd6LOf11GJ71Vr9aD
 HEjmEyZsBj+mhn2JPmHR0UfihqWGVnrn+SIM2jxyl1eMPv6kG+bkXlMfu1wWRYqOWg7j
 Pc3gD22JQ6G3ogEXXpxIvsgf2ldhJIl46DmA+7BfDLu0f66mAkgBr6DoY18mLGZtbGat
 gIaE2hIK5e+eMKjjL6fAyxL4X+2GQ+W5zGlBMxowtqwaenjEIqB02bg8mv4WWbA+TxfM
 TotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679678390;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dlroYhnHzOmuUQKomh0xfwK+9hDCG+jWKAbA6mgW2X0=;
 b=nkhzXr+/oLu/b3oFDTzXER3ALDreD0fw0tKHKtpmqeZeBq2gupGGuBO69aGYI/GH+X
 kaeHCPjn7ZnU0c3dy0I4T0Wl0EwAeGFh0kZc1+fboJGtnY28ykqCeK4tDwAE5rjPSXje
 eF2xFCq+8TN6Os56AjJH6aG596xQ7JzbpgURHaVEzdXDliIyHhOPeA4iBbL4/E1Xn+2P
 IH4lU3hG7eCzjmuzdYk1P80r8912pXuAUfypWLn1Qq92sgnZJvgTxd/yCJbjHOszviEn
 w3d4gQngq1lVBGgIfwEU28I9LgqhQEe9hmWZ44/LN7jWY5GC2GDise4q92clJT+HHPjx
 2t9g==
X-Gm-Message-State: AO0yUKVI9qne5wuljhc+Ylc0mdH7eWykcHUr8gp8PBvXeHoxMlXwV/mo
 Btqjmix8mGHLdqlXHte4XBdTIA==
X-Google-Smtp-Source: AK7set8DYy4sa8VObtL5duLeoyPco8HCxiQTcaDX/o1ZOOKK6q4x4GeN17MuXnbohkMKR3r2zVqRdw==
X-Received: by 2002:a7b:ce87:0:b0:3ed:2eb5:c2e8 with SMTP id
 q7-20020a7bce87000000b003ed2eb5c2e8mr2967679wmj.10.1679678390621; 
 Fri, 24 Mar 2023 10:19:50 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 14-20020a05600c024e00b003ed2384566fsm5400820wmj.21.2023.03.24.10.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 10:19:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B7E411FFB7;
 Fri, 24 Mar 2023 17:19:49 +0000 (GMT)
References: <87h6ua4dkw.fsf@linaro.org>
 <CANJfhHe-E-+F_P_=+ww46Szp_To=C4QWxKG5hdeCriwQr821jg@mail.gmail.com>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Remi Duraffort <remi.duraffort@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>, David Woodhouse
 <dwmw2@infradead.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: Adding default config options to the tuxrun baseline kernels
 and enabling sshd
Date: Fri, 24 Mar 2023 17:11:25 +0000
In-reply-to: <CANJfhHe-E-+F_P_=+ww46Szp_To=C4QWxKG5hdeCriwQr821jg@mail.gmail.com>
Message-ID: <878rfm3w3u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Remi Duraffort <remi.duraffort@linaro.org> writes:

> Hello Alex,
>
> Le ven. 24 mars 2023 =C3=A0 12:02, Alex Benn=C3=A9e <alex.bennee@linaro.o=
rg> a =C3=A9crit :
>
>  Hi guys,
>
>  I've been working with David on adding testing for the new KVM Xen guest
>  functionality and had a couple of questions. His original test is based
>  on fedora and is fairly comprehensive:

Just mentioning I posted an RFC:

  Subject: [RFC PATCH] tests/avocado: Test Xen guest support under KVM
  Date: Fri, 24 Mar 2023 16:07:19 +0000
  Message-Id: <20230324160719.1790792-1-alex.bennee@linaro.org>

which uses a custom kernel + hand built rootfs for now.

>  The other nice thing about his original tests where using ssh which
>  avoids a) avoids some of the flakeness of using the serial port and b)
>  has an explicit success/fail for each command without having to scrape
>  pass/fail from the log.
>
>  So two questions:
>
>    - is there a process for adding kernel options to the baseline kernels
>      or should we build our own and store them somewhere?
>
>    - what would it take to get dropbear added to the baseline ext4 images
>      so we can enable sshd?
>
> The kernels and rootfs are built by this gitlab project:
> https://gitlab.com/LinaroLtd/tuxsuite.com/tuxtest/tuxtest-buildroot
> using buildroot.

Erm that gives me a 404. I can see various tux* projects under:

  https://gitlab.com/Linaro

but nothing related to tuxtest-buildroot.

> So for sure we can add sshd support quickly.

I enabled dropbear and the following overlay:

  https://gitlab.com/stsquad/buildroot-overlays/-/tree/main/noauth-serial-a=
nd-ssh

Obviously this drops any pretence of security but I think the root has
no password anyway so adding /etc/dropbear/defaults with:

  # Allow empty password login
  DROPBEAR_ARGS=3D-B

is enough. Once pointed at the right place I shall have a go at tweaking
the build.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

