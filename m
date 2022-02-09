Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752B14AF2D0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 14:34:20 +0100 (CET)
Received: from localhost ([::1]:44508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHn6x-000081-1q
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 08:34:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHmwn-00042A-M0
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 08:23:50 -0500
Received: from [2a00:1450:4864:20::531] (port=34728
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHmwl-00048U-Gb
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 08:23:49 -0500
Received: by mail-ed1-x531.google.com with SMTP id co28so5116108edb.1
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 05:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=m+JneOQOsl7he5tIhV/N5VFfVvDi2ZRUF0JXh1kgP6s=;
 b=Lw6w1XbxB7emnZIGkpC9/7VwZaI72mMYVzUot72xo+I8TYZdSlNQDOvwYkKoWC7hWM
 IkWR1tyOu7S1Q9v2RHby5UqtUG5sJoydgUHAhHX++jFbAl8vi+zYNoPA4PPZwYRUnhmW
 v9e7xO2ceqaSc2y06nvQkyvTz07b7G0VCJUaIKuhCTumplYNmWM4ppKsWhaxNgv9Xi/O
 XgoVjmieevbhvM3b6ixP8p0Zcl4EN5NCyHMaNuFViDvlHqPJZmUic5U7KRO/QV8Wcmwx
 VtQcAQgWAAZlPeDCb6Jujj5xJnZc21PPqO5Udfk7yrZsjmWassROdOL2WpHBehpiEx+o
 5scA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=m+JneOQOsl7he5tIhV/N5VFfVvDi2ZRUF0JXh1kgP6s=;
 b=Ryv/X8trLTBg0JCdnc8Gio96WSlcJoodj7kwWvou0q4CC/EJq8BDIt35RSkX1WLH07
 OMUY7xlNnWuuMuLYfMot4+CZKUskWaUJM4OhvST4QRxUoxQdM3R9bjBPgTU+dPPwThId
 /46MipT3iQRJI3KNL7wvoCw/vYf6WQKrlBZc22v4lLhdmjhoeiU2Alh5rAC3RbRsU1FS
 l/V2+MpiFtTDywQdQVyOPSSyOEylyLZARHxmPBx6K35oj2i56T8V9GK0cfZV41IUu6Kh
 l/beWIBj5+0IacsKynisWg9wxnNi1SyViIUB3dvtvkNAc4SuPU72+ZyYBNH4CeDJF6fy
 P12w==
X-Gm-Message-State: AOAM533tX1c40PLH/y6DZPvM5m0FncYaf+cut0G0md02ZwHsK26g0Dz2
 W9WFuzk974ME4+k0DNXJnAH7tQ==
X-Google-Smtp-Source: ABdhPJzLTDI/P1g8Bz23ItGYSnCgCgLZ1DXiADTjDEB94fMwytk2BsFa3U8OWJZpBNbgyp8njRhIPQ==
X-Received: by 2002:a05:6402:b06:: with SMTP id
 bm6mr2397128edb.390.1644413024908; 
 Wed, 09 Feb 2022 05:23:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g2sm8254004edt.44.2022.02.09.05.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 05:23:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 18A4D1FFB7;
 Wed,  9 Feb 2022 13:23:43 +0000 (GMT)
References: <20220209112207.3368139-1-alex.bennee@linaro.org>
 <CAFEAcA8QSX9mfc_vAR6iXKYoPksb8Q3m9=nY97DpcKbT_nJYJA@mail.gmail.com>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] linux-user: trap internal SIGABRT's
Date: Wed, 09 Feb 2022 13:12:38 +0000
In-reply-to: <CAFEAcA8QSX9mfc_vAR6iXKYoPksb8Q3m9=nY97DpcKbT_nJYJA@mail.gmail.com>
Message-ID: <871r0cfa1s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Laurent Vivier <Laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 9 Feb 2022 at 11:35, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>> linux-user wants to trap all signals in case they are related to the
>> guest. This however results in less than helpful core dumps when the
>> error is internal to QEMU. We can detect when an assert failure is in
>> progress by examining __glib_assert_msg and fall through to
>> cpu_abort() which will pretty print something before restoring the
>> default SIGABRT behaviour and dumping core.
>
> There is definitely a problem here that it would be nice to
> fix, but __glib_assert_msg is as far as I can tell not a
> documented public-facing glib API,

Yeah it's in an odd position - it is explicitly exported but not
documented as an API but for use by crash tools:

  https://gitlab.gnome.org/GNOME/glib/-/issues/712

> and in any case it won't
> catch assertions via plain old assert() or abort() or for

libc does provide an a private __abort_msg but that is explicitly
private and I guess would break against a non-gnu libc (do we support
that?).

Explicit aborts() in linux-user code should probably be converted to
cpu_abort as it does the right thing. asserts() can be converted to
g_assert() given as glib is a absolute requirement for building.

> that matter SIGSEGVs and other kinds of crash in QEMU's own code.

There is some checking in the host_signal_handler that could be a bit
cleverer. We currently check for h2g_valid(host_addr) but we could
expand that to cover QEMU's own address space and behave appropriately.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

