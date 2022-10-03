Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB09A5F3295
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 17:35:08 +0200 (CEST)
Received: from localhost ([::1]:58962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofNTH-0004lq-AR
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 11:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofNQl-0002zH-6w
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 11:32:31 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofNQi-0001rb-HR
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 11:32:29 -0400
Received: by mail-wr1-x433.google.com with SMTP id b4so10341304wrs.1
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 08:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=/0v7n1PoiTpk8mgsABps2v1LJxPgrA23kAYYLY19KeE=;
 b=aEWVOCdt3/8HrZ47NTRA/LALmi+vZhBSSstQbmnXNPs+5c6ZJo28GjpKsAtIBMTm1+
 jHMONhYo/1v/b9YnXr+WSnNj8Y+VSVjdK9jnN7r0wTopxtAAABPNNM839wILcBL20+m9
 DHQsMO/KjQ51DrBY1I8xD5mhpQDwQI0B8VyJjSr9sguJhykBXGlVjov+mstP/X6CuB6q
 IIMb57ykjQ0sExqyXvRSx1kdhnze2/ZKb8To5XIsseH4ISCzZ3TDQuplqg230P4MEFkq
 5bQyvdc3iAfaPsF9hF4vsxdrzKagIDaZCdJHVXbyWaEYAVRq2KK686+5vPedzSz7sRSZ
 3TBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=/0v7n1PoiTpk8mgsABps2v1LJxPgrA23kAYYLY19KeE=;
 b=q+mIAGb8ETlLS1QEnzTsxE8eTaymwgEHwh3b3qkAv91nyDvn9DxtQ/vDiplgO6r+QW
 hrMQ88kSwp2D/AMgQ8IlsfPwjLcRhjyYwjub9Ox0POc49nfwaZ9XvGNZ/FkiQV1zrrLJ
 0SFkEwawZNwCabYL7Nevm3pRzPm/cR2cErCBrtP29siyM090r7E2j+eiGIIPwQ+QCVEd
 Wh55sXB3Gla7KOGtH7MstWHaPgEeHI3MGI9Vg5hWrldPd6ahcQeYvnBoHRM0HIFTBa8Z
 +YuWRRGTjF2qn6plKIr33yMeog5Igsxli16eA2s8Lyn58Gl47i70KzRH7v8TbLW1GzAc
 RqWA==
X-Gm-Message-State: ACrzQf29xLcWKw9qVhEVoajGv9w5WnkMlf1rHxKF1itE7QRtl1o90eHt
 QUzuvkocObN9G4T0JwNhdRVWwg==
X-Google-Smtp-Source: AMsMyM5XSmc6Cr0AwWSAJalD2+Yd4OEm1Qdh2X/HJv1Pc6pORLeYsdv53eU4G5IsVQ4SqrMw5nRuVg==
X-Received: by 2002:a5d:4b8b:0:b0:22e:4185:bcc7 with SMTP id
 b11-20020a5d4b8b000000b0022e4185bcc7mr2378395wrt.174.1664811146264; 
 Mon, 03 Oct 2022 08:32:26 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a05600c490f00b003a2e92edeccsm16099873wmp.46.2022.10.03.08.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 08:32:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BEFEB1FFB7;
 Mon,  3 Oct 2022 16:32:24 +0100 (BST)
References: <20221001195224.2453581-1-peter.maydell@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/avocado: Add missing require_netdev('user') checks
Date: Mon, 03 Oct 2022 16:32:08 +0100
In-reply-to: <20221001195224.2453581-1-peter.maydell@linaro.org>
Message-ID: <87pmf8ncs7.fsf@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Some avocado tests fail if QEMU was built without libslirp. Add
> require_netdev('user') checks where necessary:
>
> These tests try to ping 10.0.2.2 and expect it to succeed:
>   boot_linux_console.py:BootLinuxConsole.test_arm_emcraft_sf2
>   boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd
>   ppc_bamboo.py:BambooMachine.test_ppc_bamboo
>
> These tests run a commandline that includes '-net user':
>   machine_aspeed.py:AST2x00Machine.test_arm_ast2500_evb_builroot
>   (and others that use the do_test_arm_aspeed_buidroot_start()
>   or do_test_arm_aspeed_sdk_start() helper functions)
>
> These changes seem to be sufficient for 'make check-avocado'
> to not fail on a --disable-slirp build.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

I was just about to write such a patch myself ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

