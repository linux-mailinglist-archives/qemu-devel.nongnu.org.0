Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83428607EC6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 21:11:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olxOL-0003lT-HP; Fri, 21 Oct 2022 15:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olvGW-0002xZ-Kh
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:53:00 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olvGB-00088c-J6
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:53:00 -0400
Received: by mail-wr1-x42a.google.com with SMTP id bu30so5870511wrb.8
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 09:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yLEcE8O44JrkvO7cla+PVTgQr9rK4WWaCp53Xny/2Mc=;
 b=sP5jtVQzQCWlRmf17PlSC2HU45+qEY5TX+iV/rtg0uV7X8Fw/jQCw+Zjg2L4uYLFgm
 xChQHU+w6fOZESlxOglKwZFKmnmMm50n5KkOKt2/vp06ubm1dKKbGftt1dVD2nKZWsh/
 6xghy6MjVFVroTBR7iuUC8gr8nbLKh0CYMtSj6WnUYYtftf24iXXshRczHqcsT+CvyQj
 ilgvvxyI82kYnqij//4JzGbEKKqe6NTnPBxKsvrPNMUU/Xhhcje/OV6AoHBorWF88qVm
 72SRK5UOprZ7WM3UFJ9XfsX2bQRhBSF3XFCF9KUxGSZCzEPjJgChu+I5xTU1BLeT+8vv
 fPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yLEcE8O44JrkvO7cla+PVTgQr9rK4WWaCp53Xny/2Mc=;
 b=YglTaQ4fcEYY+4TdUDlBmHJIJbpRq8nb8o/O8Cecld/vtBLC4GgLsmVQNJkm9Hzktv
 No9q8M+QWgPxsWHNKLNI8XNgCyptBwtaq7Hv4ZmE970LFnAtE32+xlBCDiDwdfOXM8SX
 vyAtomnQnjZx2HhSz5VojCvoJTY3vT431JikqvimiO7EC8XSfExqbXIsLTnLBUyvU/GL
 yZBdCmeqBOo3x2ZIhycMD2HGznlhcS9lBofgAgmSVP3tzhPw0u6LV98Io2yvtOcLVaU8
 DYPcfbn68hNU8z1Wfb95lrm+jWhFaDo1iqJMRg0XfAYuM0LzOEBBrkQ6/HpNKLCaXksC
 D/FA==
X-Gm-Message-State: ACrzQf1mgg0yzpH0YMzy+1KiuxRbFgB0dmLNxeBnP0tQDKMfbDw5yW0O
 YVKuNuW7rcQBVSe6XGdamKU0Dw==
X-Google-Smtp-Source: AMsMyM5UXocUlkwrkvSP6QBjGqgmPYf2gAL0iXPFiH3ueMk2C+w1vP9iuuxC9sUuXYEo6kHcJocolw==
X-Received: by 2002:a5d:650f:0:b0:22e:6597:fdd0 with SMTP id
 x15-20020a5d650f000000b0022e6597fdd0mr12370940wru.127.1666371157563; 
 Fri, 21 Oct 2022 09:52:37 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a5d6290000000b0022ae4f8395dsm18745022wru.96.2022.10.21.09.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:52:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 958D61FFB7;
 Fri, 21 Oct 2022 17:52:36 +0100 (BST)
References: <20221004093206.652431-1-berrange@redhat.com>
 <20221004093206.652431-4-berrange@redhat.com>
 <d51ca4c0-6115-7ed3-a6be-dec67bdbfdb0@vivier.eu>
 <CAFEAcA-GSKzEwPnjzBw0tn4G6+uRHRL1dDmvAiiYUb1YVo8T4Q@mail.gmail.com>
 <Y1Kxv6djOygcZCuk@redhat.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, Richard
 Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 3/4] meson: enforce a minimum Linux kernel headers
 version >= 4.18
Date: Fri, 21 Oct 2022 17:50:24 +0100
In-reply-to: <Y1Kxv6djOygcZCuk@redhat.com>
Message-ID: <87h6zx5dbf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, Oct 21, 2022 at 03:38:38PM +0100, Peter Maydell wrote:
>> On Fri, 21 Oct 2022 at 15:30, Laurent Vivier <laurent@vivier.eu> wrote:
>> >
>> > Le 04/10/2022 =C3=A0 11:32, Daniel P. Berrang=C3=A9 a =C3=A9crit :
>> > > Various areas of QEMU have a dependency on Linux kernel header
>> > > definitions. This falls under the scope of our supported platforms
>> > > matrix, but historically we've not checked for a minimum kernel
>> > > headers version. This has made it unclear when we can drop support
>> > > for older kernel headers.
>> > >
>> > >    * Alpine 3.14: 5.10
>> > >    * CentOS 8: 4.18
>> > >    * CentOS 9: 5.14
>> > >    * Debian 10: 4.19
>> > >    * Debian 11: 5.10
>> > >    * Fedora 35: 5.19
>> > >    * Fedora 36: 5.19
>> > >    * OpenSUSE 15.3: 5.3.0
>> > >    * Ubuntu 20.04: 5.4
>> > >    * Ubuntu 22.04: 5.15
>> > >
>> > > The above ignores the 3rd version digit since distros update their
>> > > packages periodically and such updates don't generally affect public
>> > > APIs to the extent that it matters for our build time check.
>> > >
>> > > Overall, we can set the baseline to 4.18 currently.
>> >
>> > As this change affects entire QEMU build, I'd prefer to have some "Ack=
ed-by" before merging it via
>> > linux-user branch.
>>=20
>> I still think we should be more conservative about kernel header
>> requirements than we are for other dependencies.
>
> How much more though ?  What other distros do we want to target that
> we don't already cover with our targetted platforms  ?

Well purely selfishly the big build box I have access to is still on
18.04 which is currently running 4.15.0-191-generic. It will hopefully
get upgraded before 18.04 goes out of support from Canonical. From a
practical point of view it will be a pain if I can't bisect on it in the
meantime.

>
>
> With regards,
> Daniel


--=20
Alex Benn=C3=A9e

