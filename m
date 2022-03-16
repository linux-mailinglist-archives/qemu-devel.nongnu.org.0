Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E804A4DB8E8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 20:37:11 +0100 (CET)
Received: from localhost ([::1]:34234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUZSI-0004Jv-Hk
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 15:37:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nUZQL-0002TO-82
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 15:35:09 -0400
Received: from [2a00:1450:4864:20::330] (port=44862
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nUZQJ-0006y5-DT
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 15:35:08 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so2010758wmb.3
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 12:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=yEdYgz2xv5UbmFc9ycC7WzCta6DzfAJB2bwKhIfwXNY=;
 b=dekd3rtrhtYE+q3QZKr70n+w3frmDQ46YFzGUM3XQ1aqK5jCJlqHpJ7rd8ecdfpysy
 HQZhp2vcUk5sprHdmxrqwAdeKCEOdkTsQw7VmiTuLq3Qo4pKYV/7Rx7X7kekpeLjOtAz
 SeBWP0X4LWicZYeQJHKoB8npdow9qG6l3c+vrkVJCfAiz4BlTUyKOLcO9MGPCCx36Ems
 8BjoY7zwaT+SNkLXaj6ww7zsupLiT8S26BlyuPhd1E2jOYv4YsZ+opq2Los9/l1MWJuf
 /+KOcCWkGb2m75kvyEgjbI2pHH/xBTGXPldV4ylm81sI2z0RjvJPFfz875b3H1XXj8Ix
 6wfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=yEdYgz2xv5UbmFc9ycC7WzCta6DzfAJB2bwKhIfwXNY=;
 b=gWIN8mSrCfFTj61XJNvmUC6DNsgSP/n5JnsW36cPZHLITF0GGWRYjtIql62pbwqCHT
 smdRviutt/UIAWyo5MG6mEww1LAqXkhhesi8TSxURZt4Z1IsT6Wjj/AItj+ks6ASkBwp
 XRpe/UH1iFlkeDhYL5enQ2Mz/a/UeI3T62Olfb8GXuQYWmEuVFw1b+f1cTa+MAV2yFuE
 6kqIgUks9dSQu6mZfDMJoFj0LFYY3kk4c+JqJN2gR7Yr/y86EqpHbDVewNmaM7FeMI6Z
 IiyI1lb71n17Rch8Erqz/phL7Xx5inCVgLqReNmhefE//Wp9nDG6h8trHKBDqFx4e+1l
 rTgQ==
X-Gm-Message-State: AOAM530k6owA+Az4Rd7y0xE7YBK4/3lzXc18Jw1hZlodFEgxriZdM+Lq
 R5ML4YCva1ymelS1+/Q4o2gAyw==
X-Google-Smtp-Source: ABdhPJz3rX3sT8WeZtmU13pbOkGPIRXg7saOmQXouPBxfaXCu46IFSExzrAhDp4x0UlqXhm4lV8s7A==
X-Received: by 2002:a1c:3587:0:b0:381:50ff:cbd with SMTP id
 c129-20020a1c3587000000b0038150ff0cbdmr8678174wma.140.1647459304790; 
 Wed, 16 Mar 2022 12:35:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a05600c198700b00389fb24f397sm5807726wmq.21.2022.03.16.12.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 12:35:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D75451FFB7;
 Wed, 16 Mar 2022 19:35:02 +0000 (GMT)
References: <20220316181412.1550044-1-cmuellner@linux.com>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Christoph Muellner <cmuellner@linux.com>
Subject: Re: [PATCH v3] docs/tcg-plugins: document QEMU_PLUGIN behaviour
Date: Wed, 16 Mar 2022 19:34:33 +0000
In-reply-to: <20220316181412.1550044-1-cmuellner@linux.com>
Message-ID: <875yod3d3t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
> As drive-by cleanup, this patch fixes the path to the plugins
> in the same section of the documentation.
>
> Signed-off-by: Christoph Muellner <cmuellner@linux.com>


Queued to for-7.0/misc-bits, thanks.

There where some minor typos but I've fixed them.

> ---
>  docs/devel/tcg-plugins.rst | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
> index f93ef4fe52..bf66c12885 100644
> --- a/docs/devel/tcg-plugins.rst
> +++ b/docs/devel/tcg-plugins.rst
> @@ -27,13 +27,18 @@ Once built a program can be run with multiple plugins=
 loaded each with
>  their own arguments::
>=20=20
>    $QEMU $OTHER_QEMU_ARGS \
> -      -plugin tests/plugin/libhowvec.so,inline=3Don,count=3Dhint \
> -      -plugin tests/plugin/libhotblocks.so
> +      -plugin contrib/plugin/libhowvec.so,inline=3Don,count=3Dhint \
> +      -plugin contrib/plugin/libhotblocks.so
>=20=20
>  Arguments are plugin specific and can be used to modify their
>  behaviour. In this case the howvec plugin is being asked to use inline
>  ops to count and break down the hint instructions by type.
>=20=20
> +Linux user-mode emulation also evaluates the environment variable
> +``QEMU_PLUGIN``::
> +
> +  QEMU_PLUGIN=3D"file=3Dcontrib/plugin/libhowec.so,inline=3Don,count=3Dh=
int" $QEMU
> +
>  Writing plugins
>  ---------------


--=20
Alex Benn=C3=A9e

