Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3425BFFB1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 16:13:55 +0200 (CEST)
Received: from localhost ([::1]:48594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob0U6-0003WR-Gy
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 10:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob0Ip-0006lg-Mv
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:02:21 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob0Ik-000478-T1
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:02:12 -0400
Received: by mail-wr1-x42d.google.com with SMTP id s14so8063053wro.0
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 07:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=VpKOF+mcXTP/LpM796iq9Vl+HBFQw1vL6eED9I3MPjg=;
 b=ZFrLGYJM+WF724QesO5L70QZ+wjcSq0tQmV52c1oFPKgZAbyoFH9nNAmYMEKjQ5fKC
 +WQWE3Ub6PaBKP+yNbjVDZt9qDSVZ5mX1UuZNgR+YULLwiF3aG8KCsNCHGLTfaMrPJ4m
 km5B5mNKljpNaO82GMvmgRGwmPi8UIw8ek06FDqm9lqdPm85EGN9DfPgZ2ho/cMur/t/
 hg6rzTr0h/Xj1Vy/Gmdmll2uNzAVW5GZDkwobZxQyE3TrCIeslzpY1WpRSOeDA6+1NiX
 G18/pMIQGW591cki/ripnjCAOOs9OKR9x+3YqB/nhhKVTMyhcSwdTHhwE9DWLKkWHYZ6
 6mMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=VpKOF+mcXTP/LpM796iq9Vl+HBFQw1vL6eED9I3MPjg=;
 b=WJMHylMw7dT4vig8drKeHVM/PE2GGNByvtXhjjwUL3WPGCynQxGHXbdpN9NnvPrPXT
 ltjCvaMUoqE0yApzmi4D3b1u5Fg3ZcdHeATebT0HVli8+CP/lJez4AWbM4uw/3LL1/N0
 Upmy8d6eJdsT6aJjFWtecoL0EeKf2L6o7UZOmoqHGKwhU01ELSJB/Q2kG0H9SCtybKKc
 XqPko57u7kvN46miXGFKxRJ0PHY+Za8PjpWchuiieIlGEUa3uDF33S9IH6NAWqNooipF
 bLEMW/+9sVLXwIT8hFRt2KqYGjZ6E8ourNqLBhy/qD1+yDIeDcpRiivXTHzCZ12Mzs2p
 tH1g==
X-Gm-Message-State: ACrzQf2uAuW7xIyh9DAc05VjkWHcBCUgeELQB08FYx9mjBrcuGc1vvcI
 nUlI+JTZlVuGsSnqTIkk1S+Z8g==
X-Google-Smtp-Source: AMsMyM6ncR25N/LuKjMfDgX6XJAVB01312A5rngX6GIIrrUk5K0zrVyb35jagJ59xOdNofRCGeijuw==
X-Received: by 2002:adf:e9d2:0:b0:22a:e4e2:37f1 with SMTP id
 l18-20020adfe9d2000000b0022ae4e237f1mr15322931wrn.339.1663768928989; 
 Wed, 21 Sep 2022 07:02:08 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c358800b003b47e8a5d22sm3448570wmq.23.2022.09.21.07.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 07:02:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 57FEB1FFB7;
 Wed, 21 Sep 2022 15:02:07 +0100 (BST)
References: <20220901182734.2987337-1-fasano@mit.edu>
 <20220901182734.2987337-3-fasano@mit.edu>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Fasano <fasano@mit.edu>
Cc: qemu-devel@nongnu.org, erdnaxe@crans.org, ma.mandourr@gmail.com
Subject: Re: [RFC 2/4] tcg/plugins: Automatically define CURRENT_PLUGIN
Date: Wed, 21 Sep 2022 15:00:18 +0100
In-reply-to: <20220901182734.2987337-3-fasano@mit.edu>
Message-ID: <87a66s7rmo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Andrew Fasano <fasano@mit.edu> writes:

> Use plugin filenames to set the preprocessor variable CURRENT_PLUGIN
> as a string during plugin compilation.
>
> Signed-off-by: Andrew Fasano <fasano@mit.edu>
> ---
>  contrib/plugins/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
> index df3499f4f2..b7720fea0f 100644
> --- a/contrib/plugins/Makefile
> +++ b/contrib/plugins/Makefile
> @@ -34,7 +34,7 @@ CFLAGS +=3D -I$(SRC_PATH)/include/qemu
>  all: $(SONAMES)
>=20=20
>  %.o: %.c
> -	$(CC) $(CFLAGS) -c -o $@ $<
> +	$(CC) $(CFLAGS) -DCURRENT_PLUGIN=3D\"$(basename $@)\" -c -o $@ $<

While all plugins are currently single files this seems a little clumsy.

We can already check exported plugin symbols in loader.c (see
qemu_plugin_version) so maybe it would be better to declare an API
update and mandate any plugin object also needs to define a
qemu_plugin_name with a null terminated string?

>=20=20
>  lib%.so: %.o
>  	$(CC) -shared -Wl,-soname,$@ -o $@ $^ $(LDLIBS)


--=20
Alex Benn=C3=A9e

