Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE92F6B63DE
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 09:52:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbHPd-0000e7-0j; Sun, 12 Mar 2023 04:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pbHPa-0000du-R4
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 04:50:38 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pbHPZ-0000Cg-1v
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 04:50:38 -0400
Received: by mail-wr1-x433.google.com with SMTP id q16so8704685wrw.2
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 00:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678611034;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oOoqhzhF+/KoUJKepIpTlPAStPWtK8KAlJD9ewMPx9E=;
 b=ZXo71sV6747RQ64xj7irDqR2b7Lj2aaTugSg5rk39H/i36T30EQ3fHUC2fZx4HEQFB
 I3Uy/yz1WdeINeQtWgrN+j05ZccPW1/88FISXNcsWQhqmoEx4tlbF/WwcEphhu4vQyPh
 DmvNqYwX0bsQ41o+VRKXXlQBDQjz8GDLJhsTukDiliMVnC9YOGZhEA3R9Eg/Sam89Q15
 YTEF8bqRQ2coyWzPL0QPI0JZf3Mmuxa16e8RVWSrFWwDvOWebvawOekDS2T/6bfe4p8l
 RsktNu6Z+zVKV163iuv4rLqwXgrIjdnv3sdYSRJeVpADelwt/fcCRi/Z9cr4VUwne1Mj
 iZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678611034;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oOoqhzhF+/KoUJKepIpTlPAStPWtK8KAlJD9ewMPx9E=;
 b=c3Zh1Btv80pdrdbtgEbCzB9TXwAxaP4dbOzOi+ILQk4oOwdTUIlsg/BzvSp69e891P
 dwAWEwCS/jvhwR2Pz7HwO+TdM9dGIH6//YhA7bhVm264zngBh08r/blcr78VvRRiOcYR
 hNMw4KrONUFPYseVdLkuoZuoxAhz5BvJbUxH540yNozRIy9VqOIjTQGZQAEY+kXrq/O9
 V+KumcXivkkUXORYmt56FuFZzmjLWlAOAjhNg0gJfM4WetEnI+1OSi5CiGfYt4wwLUTq
 76MQ14eC7bQ57kPZ4e52EXNn+WlWgVb1KMU1SUDFebFzowKkeca2bzEqm2DPkwwjW80K
 HQGg==
X-Gm-Message-State: AO0yUKXfxMs9+bhHZbsQxhuVMRPOIYGF3jKmywuXpNdR4/BAQzI9/I6J
 t5Hh3/UbKdzPC+qPJeoyQNZp0w==
X-Google-Smtp-Source: AK7set8hQyOEAaHk4LO56o1kL3G12pJnBC8bDHlLci+oi7z1LnFnmLbYRVvpe3AvC+GiyCb2mRcuiw==
X-Received: by 2002:a05:6000:181a:b0:2ce:adda:f45a with SMTP id
 m26-20020a056000181a00b002ceaddaf45amr458733wrh.62.1678611034682; 
 Sun, 12 Mar 2023 00:50:34 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f13-20020adff44d000000b002ceaeb24c0asm370129wrp.58.2023.03.12.00.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 00:50:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CD5C31FFB7;
 Sun, 12 Mar 2023 08:50:33 +0000 (GMT)
References: <20230310155726.2222233-1-alex.bennee@linaro.org>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: Re: [PULL 0/5] gitdm updates
Date: Sun, 12 Mar 2023 08:49:44 +0000
In-reply-to: <20230310155726.2222233-1-alex.bennee@linaro.org>
Message-ID: <87lek2z73a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> The following changes since commit ee59483267de29056b5b2ee2421ef3844e5c99=
32:
>
>   Merge tag 'qemu-openbios-20230307' of https://github.com/mcayland/qemu =
into staging (2023-03-09 16:55:03 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stsquad/qemu.git tags/pull-gitdm-100323-1
>
> for you to fetch changes up to 0194e846c43f0ee18e0384c0c1f35757760e04ec:
>
>   contrib/gitdm: add Idan to IBM's group map (2023-03-10 15:54:43 +0000)
>
> ----------------------------------------------------------------
> gitdm updates for:
>
>   - IBM
>   - Facebook
>   - Individual contributors
>   - Ventana

I realise I should have scrubbed some of the questioning commments give
the r-b/a-b tags. I'll re-spin a v2 of this.

>
> ----------------------------------------------------------------
> Alex Benn=C3=A9e (5):
>       contrib/gitdm: Add VRULL to the domain map
>       contrib/gitdm: Add Ventana Micro Systems to the domain map
>       contrib/gitdm: add Tsukasa as an individual contributor
>       contrib/gitdm: Add Facebook the domain map
>       contrib/gitdm: add Idan to IBM's group map
>
>  contrib/gitdm/domain-map            | 3 +++
>  contrib/gitdm/group-map-facebook    | 5 +++++
>  contrib/gitdm/group-map-ibm         | 1 +
>  contrib/gitdm/group-map-individuals | 1 +
>  gitdm.config                        | 1 +
>  5 files changed, 11 insertions(+)
>  create mode 100644 contrib/gitdm/group-map-facebook


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

