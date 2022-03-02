Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE23A4CA64A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:49:36 +0100 (CET)
Received: from localhost ([::1]:48726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPMF-0007DW-VX
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:49:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPO7E-0000TN-Ap
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:30:00 -0500
Received: from [2607:f8b0:4864:20::b36] (port=42812
 helo=mail-yb1-xb36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPO7C-00016v-Mv
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:29:59 -0500
Received: by mail-yb1-xb36.google.com with SMTP id f5so2983322ybg.9
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Nhm9oD3n5qmfahefXmVTgi6LkffTknx2hqFEXijf4a4=;
 b=QE0s2qcNyO1UmhydFEn/J8buLTqtB3PRwXSzhNq0pqKXzaf3fxGlilBDlfUSsl5q9v
 d+JP4roaF1R6p+h+LGg0BD0j/X9hIyWNF0He2pxtG36zceT7csgngInWtgvTZejLojGY
 3nu6aIooA10WGWdg6lGGjLbEs21dblILsRP86Vacj3qo+8Q4mYeEx2u025NVG99OM56O
 kq+EMSBCraun6aRp8fifxlyyxAm+Lh9TDv/SXJRzzUgyWkIUUfFUfdnM3HD+7WdIz9kV
 3BBOwJ8ovB1Rmvp4EZSEApmHGJbqCq6lafJNst43Trw8vU+plPs6MQzCcV48LEwOb75i
 X95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nhm9oD3n5qmfahefXmVTgi6LkffTknx2hqFEXijf4a4=;
 b=ceW/zh8vLpHJtnTWPociJjB/xUP+l/BLrtaZkz4se8DInkmCUqP9gNN33uwlyjeC/X
 Hlyx4Dyl1wfWfke5dc7NCOxEuGJH0nt5RjacKxutZuLpIJrD3jHOJIF3bA2meQk42lnb
 bATesHJpmQGLBk+3wiIDfFcrynKB1E7jLXwkZJvYRgTdWCwc4OQWuSRowyEn9CmNpP+4
 wPZc7z0Z+CDKI3uP/+hxk2h3dJ3M3e3azdnR6A6MYim8ChsWTfWnW8qX4GWX4EgBsFmi
 j0I8v6NII+190OXpUw/GCZRvyeixguzXry9IkICIQB/BD2hO9HKs6ZrKH706ucPWkYBE
 v3wA==
X-Gm-Message-State: AOAM533c8bQGklPJBIf0Q5ArKllulbja9uw3Lzhbm6nM+edeIZE5G5Bw
 b+z/phojpQC0/atHdVulgkGhq5J4KRYPZBUcKl7Ogw==
X-Google-Smtp-Source: ABdhPJzYGr19ZlraWZuZTtN94KQ54o3uUyLrQXWeEwfvkDD+zUCGaQaovqTK5FkG7Z/GUP1qfM0rNwzRyB/Hzb019ls=
X-Received: by 2002:a25:6e84:0:b0:628:97de:9430 with SMTP id
 j126-20020a256e84000000b0062897de9430mr4111637ybc.288.1646224197848; Wed, 02
 Mar 2022 04:29:57 -0800 (PST)
MIME-Version: 1.0
References: <20220302083308.820072-1-clg@kaod.org>
In-Reply-To: <20220302083308.820072-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2022 12:29:46 +0000
Message-ID: <CAFEAcA8V+Jc4eXF+CYay_OoSrZPj7yTGFiGL0omt7+0D-0GQ8w@mail.gmail.com>
Subject: Re: [PATCH] aspeed: Fix a potential memory leak bug in
 write_boot_rom()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
Cc: Wentao_Liang <Wentao_Liang_g@163.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 08:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Wentao_Liang <Wentao_Liang_g@163.com>
>
> A memory chunk is allocated with g_new0() and assigned to the variable
> 'storage'. However, if the branch takes true, there will be only an
> error report but not a free operation for 'storage' before function
> returns. As a result, a memory leak bug is triggered.
>
> Use g_autofree to fix the issue.
>
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Wentao_Liang <Wentao_Liang_g@163.com>
> [ clg: reworked the commit log ]
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

