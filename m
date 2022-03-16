Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA37D4DB425
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 16:08:58 +0100 (CET)
Received: from localhost ([::1]:55420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUVGj-0001Cu-Rg
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 11:08:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nUV9f-0004pu-Sl
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 11:01:39 -0400
Received: from [2a00:1450:4864:20::62d] (port=37730
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nUV9d-0004nM-Tr
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 11:01:39 -0400
Received: by mail-ej1-x62d.google.com with SMTP id bg10so4804218ejb.4
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ST4+HFxQ9kCHFFiKAAZgg03/l1v0JfrGkprvPJdwnAo=;
 b=BG1FqWCMwlNE6n1MKSHEjOKlIgPF0+RWl1qo6WTnkUTjID4csMBKNxPl2rN0g49/MW
 pJjWJICuvSpvS0FuPVzaru/4/1ybGxUTP9hMGvvTnrl9hSzvieXKTXoO72uFO1cQFp9s
 KVy7D2fimFZ4CqYefWEYvIQ8tNlMtmcxMYMNT7VeYvhyoeKHoxfull9nwRSTd5XKJQBz
 qgC6wMv8XTreLbgYXaOrALeaYcjQfaC0vO/+TFauZjRET+DwJXqCZFOKB15K7x8Ncaet
 arY0Oc0HW4OZ7mZJvZHcfGo2FS1jmmXVHuJDHcCIyjlisGljvzxkpnh211MsfC53uUdb
 pkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ST4+HFxQ9kCHFFiKAAZgg03/l1v0JfrGkprvPJdwnAo=;
 b=IQ4cAgv4QiLo5IqKmIXmM0P9viYDnIgqgiQ5wq4H1PQvatt8kGjbc1gbfd3at9bKec
 k0Q9zjRPX9uRfesNQg2XxTrbCQK1FVwiXUbxljooPCRhviTalylKyB0VPJfI3iNFJHDf
 xFnwiksFaB82eWterux9YfgtLJMEo6ZrHlIX+q/RfUeae08oeJ34zyOgTmik17k/GGKz
 CMma8QOr9vFEIWs8JQGL1AqRG0mTJW0m6uikf15VB6WyRtrn2AQURgFHwL8PpXVikvTw
 lByFkZOGdZs3eou40lgUevLHdAIgfLTC+8/iKjEGm6OZwcrj2oOsFhJYqObEgx2q7iTW
 UTNA==
X-Gm-Message-State: AOAM533YpzYW6eqvGOHaGkV/7Wid9fMJFT2OnknGjfeQzgILy1TJ8TKu
 GXDix1hNkhaqxKqNal82+cIwZQ==
X-Google-Smtp-Source: ABdhPJxu54gOS+gnjj/XHxp5dIZukP+1HrZvlGUswrIiJPa/RAvQEtE7vGfhV8jisk7WfVCvaqubaQ==
X-Received: by 2002:a17:907:6e8d:b0:6d7:1261:d468 with SMTP id
 sh13-20020a1709076e8d00b006d71261d468mr351618ejc.390.1647442895066; 
 Wed, 16 Mar 2022 08:01:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 bd12-20020a056402206c00b00418c9bf71cbsm1065507edb.68.2022.03.16.08.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 08:01:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 61E671FFB7;
 Wed, 16 Mar 2022 15:01:33 +0000 (GMT)
References: <20220316124012.1413954-1-cmuellner@linux.com>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Christoph Muellner <cmuellner@linux.com>
Subject: Re: [PATCH] docs/tcg-plugins: document QEMU_PLUGIN behaviour
Date: Wed, 16 Mar 2022 15:00:10 +0000
In-reply-to: <20220316124012.1413954-1-cmuellner@linux.com>
Message-ID: <87sfri2b76.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Christoph Muellner <cmuellner@linux.com> writes:

> QEMU plugins can be loaded via command line arguments or via
> the QEMU_PLUGIN environment variable. Currently, only the first method
> is documented. Let's document QEMU_PLUGIN.
>
> Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> ---
>  docs/devel/tcg-plugins.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
> index f93ef4fe52..ba48be18d0 100644
> --- a/docs/devel/tcg-plugins.rst
> +++ b/docs/devel/tcg-plugins.rst
> @@ -34,6 +34,10 @@ Arguments are plugin specific and can be used to modif=
y their
>  behaviour. In this case the howvec plugin is being asked to use inline
>  ops to count and break down the hint instructions by type.
>=20=20
> +QEMU also evaluates the environment variable ``QEMU_PLUGIN``::

You should also make it clear this only works for *-user builds of QEMU.
For system emulation you still need to use the CLI interface.=20

> +
> +  QEMU_PLUGIN=3D"file=3Dtests/plugin/libhowec.so,inline=3Don,count=3Dhin=
t" $QEMU
> +
>  Writing plugins
>  ---------------


--=20
Alex Benn=C3=A9e

