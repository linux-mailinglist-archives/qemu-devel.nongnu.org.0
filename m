Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50FD4AF00D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 12:45:06 +0100 (CET)
Received: from localhost ([::1]:41772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHlPF-0002Rc-Vw
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 06:45:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHlJg-0007eE-Kc
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:39:20 -0500
Received: from [2a00:1450:4864:20::42c] (port=46802
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHlJf-00023q-0w
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 06:39:20 -0500
Received: by mail-wr1-x42c.google.com with SMTP id q7so3440539wrc.13
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 03:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OPAC9e1APmgXVnMmAPszGZOswHSCbyzNs7Jky8jNi+E=;
 b=pud6DW/pvIu77/f07W0DKw1LxbuSYIqRbtBCMR5VZqNM9OL678xen7sZXDgrY3iaZr
 47OtKGuGZ07L1wiOt0gWccLjaFRmAvGFtzjx40YmvfDATcL1S9VvHiFfV4oQpWUDO5Kx
 03Ozrj3g24Z/Z5LceHSoDQCEljtinaAqxsJPO1Jx3r5js9d2OZZ6t87iycp4LUjqs2wp
 pKofaJFjcJFZeDaYnDCm0jJ3hdNvgAoLN/i0sWxSV+m0Zq0zrHVp87ZZgDcu2hhKwOSL
 G6yVcJagXce+S2KsU0frelhCDJPRGsVtwxDki+XkCECcRQpJgP4k1Y7Vnkcrqy73CkSj
 bIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OPAC9e1APmgXVnMmAPszGZOswHSCbyzNs7Jky8jNi+E=;
 b=klkcr/PXRF5oY7kV9O09YKSGVGMAEZMvVEQNgVei61r49oFaakqOWXR4FZVMMkRbN5
 fj2FsoOjW+2ovxwzw+WP2/WwBXKJLJdRpA/zNcRDa10Pu5X7s9VJZiZFhb9Wmvr+6IAz
 9WoyvAC9tQnR1G7B2idsMDzmHF13KHvk1hVr28Lr8rSJt8V4Bj4go4BDLF/+cqkDRUHr
 7yBQWrIu/jvqFfWo6QuCTd3jAb071B1aLQMqDbz1OJjNwO9nT2x2jNaZfEYG2DBCxpae
 RomBGlj+HEeG/BkkA0LQWSBR9qEFsDI8hO9Y6uhPNDza5vJWQugSa1eKYPVcGXSdKnhq
 d9Ug==
X-Gm-Message-State: AOAM531XIkwgk2v+xXk+jAPu5GtXJJBms2o0dNwPPG0+XOXV21GL7Wuu
 qyBITuIVHHRklS8Al5j2Q5agJ9JasJb2G6RwWFLV7g==
X-Google-Smtp-Source: ABdhPJxfsfhQCJaP70a0QcrcHrDVNOzmuZsiLSsg3pbUnxaLiM4QZQk4RBx0ZjGEEwiMiq4xHhfv4Q+mlrHDfVZjDvs=
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr1699557wrs.295.1644406747172; 
 Wed, 09 Feb 2022 03:39:07 -0800 (PST)
MIME-Version: 1.0
References: <20220209112207.3368139-1-alex.bennee@linaro.org>
In-Reply-To: <20220209112207.3368139-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Feb 2022 11:38:56 +0000
Message-ID: <CAFEAcA8QSX9mfc_vAR6iXKYoPksb8Q3m9=nY97DpcKbT_nJYJA@mail.gmail.com>
Subject: Re: [RFC PATCH] linux-user: trap internal SIGABRT's
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

On Wed, 9 Feb 2022 at 11:35, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> linux-user wants to trap all signals in case they are related to the
> guest. This however results in less than helpful core dumps when the
> error is internal to QEMU. We can detect when an assert failure is in
> progress by examining __glib_assert_msg and fall through to
> cpu_abort() which will pretty print something before restoring the
> default SIGABRT behaviour and dumping core.

There is definitely a problem here that it would be nice to
fix, but __glib_assert_msg is as far as I can tell not a
documented public-facing glib API, and in any case it won't
catch assertions via plain old assert() or abort() or for
that matter SIGSEGVs and other kinds of crash in QEMU's own code.

thanks
-- PMM

