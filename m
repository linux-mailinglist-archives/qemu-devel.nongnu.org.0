Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF7B5A39B7
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 21:22:41 +0200 (CEST)
Received: from localhost ([::1]:37324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oS1OD-00059s-0Y
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 15:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1oS1Ht-0006ML-8C
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 15:16:14 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33]:39607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1oS1Hr-0004nW-Lg
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 15:16:08 -0400
Received: by mail-vs1-xe33.google.com with SMTP id c3so4702051vsc.6
 for <qemu-devel@nongnu.org>; Sat, 27 Aug 2022 12:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=3aRwqBrB9OE8isjRZqg8S6JGxhtPg7KW2xeEy8uD94Q=;
 b=jz8aF4WmkNNb7s/Xek16clCwyWS09bjUGN+tZ5+skbEJrap3NPfovOcbWVOibh0OhJ
 TrlKozgQLZMDL+h5PwbM8Jooxd5FQKb7nCMPnEFdjj+BwzfeQWelypSjQ/x5teVqKk6H
 7hWQnqcDTcCl3FF3OB29fr6Ybj6ziNgP8ZW+55sy/Nd+k6u17mt6eoP5PaTU5GY3lHoM
 0uEZT29u8sRDj/0SKKPRxDx9Bdr0vskAlXuyVwwVfs+DOiP2SQdoEDHZGua9KRoQlQ/f
 YxWsJNtk7Ui+8EONDIFSNSvJJntCiNv/Po+JtW4fwg2vWOMoEFP4xtyqTuZdKmtmFB2h
 FU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=3aRwqBrB9OE8isjRZqg8S6JGxhtPg7KW2xeEy8uD94Q=;
 b=R67OmdJn0cGiCgxH5mcL4MYqVc4s0/FdjmSSTaVou2uK6pH/JejavRGfQ2IwrN/DAE
 xIlmoDtrAIABzpvja3yGMF/bU43f2XRQlrkVeBwd2qukWzgZvlSk2W4qRWUaClHHBMEa
 yw9BYLf0mivMscGuETYf0bTksicl1hssQK+nyamwBdJQeLswZQRyhz/KJgLdZNa81VmI
 ZEaTTYtQB+qPE07nFyoggkVfjKPbLltXfVYinCR5MP/NE3NQxcNxab307HBBnSUKaPHa
 QaJI4vsJL0wyCza7ttb54nNFX1otWuIjkA7T94Iz2t1f33ebfAwbt1gWt7jdVvQ+Rv4c
 hfiQ==
X-Gm-Message-State: ACgBeo0YCfMu9BF2xbPMqtNygmZHjb4WfhkqNmqDx6V+IZeNxlfkn/8g
 5LQ799P/VwYJbKAQdrvYI5/FxT6swPpulw6YeN0=
X-Google-Smtp-Source: AA6agR7g68cZrSBnTz7CKjt66UCPDD+L1Kh7CX7EoLcAybYwHTue6gKyMtzdMzxzFVv6c91V9F2HKKT25+8aFz6qTvM=
X-Received: by 2002:a05:6102:c8a:b0:390:232a:8f29 with SMTP id
 f10-20020a0561020c8a00b00390232a8f29mr1509319vst.81.1661627766829; Sat, 27
 Aug 2022 12:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220826205518.2339352-1-richard.henderson@linaro.org>
In-Reply-To: <20220826205518.2339352-1-richard.henderson@linaro.org>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Sat, 27 Aug 2022 22:15:30 +0300
Message-ID: <CAK4993gjK5ig_1UEQqdFbY2HBLUY44m6aH-R2Dx9q1+ea0AFnA@mail.gmail.com>
Subject: Re: [PATCH 0/3] target/avr: Fix skips vs interrupts
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ca795405e73ddcd1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=mrolnik@gmail.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ca795405e73ddcd1
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Michael Rolnik <mrolnik@gmail.com>

On Fri, Aug 26, 2022 at 11:55 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Fixes https://gitlab.com/qemu-project/qemu/-/issues/1118
>
> r~
>
> Richard Henderson (3):
>   target/avr: Call avr_cpu_do_interrupt directly
>   target/avr: Only execute one interrupt at a time
>   target/avr: Disable interrupts when env->skip set
>
>  target/avr/helper.c    | 23 ++++++++++++++---------
>  target/avr/translate.c | 26 ++++++++++++++++++++++----
>  2 files changed, 36 insertions(+), 13 deletions(-)
>
> --
> 2.34.1
>
>

-- 
Best Regards,
Michael Rolnik

--000000000000ca795405e73ddcd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@=
gmail.com">mrolnik@gmail.com</a>&gt;<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 26, 2022 at 11:55 PM Ri=
chard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard=
.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Fixes <a href=3D"https://gitlab.com/qemu-project/qemu/=
-/issues/1118" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu=
-project/qemu/-/issues/1118</a><br>
<br>
r~<br>
<br>
Richard Henderson (3):<br>
=C2=A0 target/avr: Call avr_cpu_do_interrupt directly<br>
=C2=A0 target/avr: Only execute one interrupt at a time<br>
=C2=A0 target/avr: Disable interrupts when env-&gt;skip set<br>
<br>
=C2=A0target/avr/helper.c=C2=A0 =C2=A0 | 23 ++++++++++++++---------<br>
=C2=A0target/avr/translate.c | 26 ++++++++++++++++++++++----<br>
=C2=A02 files changed, 36 insertions(+), 13 deletions(-)<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--000000000000ca795405e73ddcd1--

