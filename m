Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EE632ED4A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:40:14 +0100 (CET)
Received: from localhost ([::1]:37840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIBcj-00078O-EC
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:40:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIBbd-0006a5-JT
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:39:05 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIBbb-0002hX-J1
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:39:05 -0500
Received: by mail-ed1-x532.google.com with SMTP id b7so2885288edz.8
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 06:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8zaXYg+sUzoi1UNr67+F/l8Gy4fjxJVV/88AKDfy/2E=;
 b=zewmcyj7CUUEd0M6+Xb3ZP7LWgaNYzrGV6wuj7QIeI9ALCYGS1FeHm1i6JpOkEZDA1
 8iz4gZopDzb7BBin29vOLw219g2OwSTEx2LogYnS0S7oVHpBjE2dV6WN5j6JOpQq1nof
 1lwQi42BG6g8HrjGWHgGxdBGHFnle7Fw/Q9iDjcUl5sSTBlKurBP244gPG3suIYHIdXh
 Ezfs7lTnpUEv2zj5LW8UvQvHug+fiQU4XpoeriDGwOtd1MxTry9qFm4CttEmsOJb1rZn
 LPxQf5BNz26FnGLnj8bRbcDdPTgCXUZyWMmAcT2NLvWPvBO249UoqUZiYZc6w8kerWcB
 gYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8zaXYg+sUzoi1UNr67+F/l8Gy4fjxJVV/88AKDfy/2E=;
 b=nmPziUnD8urn17GY4pXG8MgNrfW/W1hmq+XbL3l6lX0MQIp/7xhBIDMYqP17GMq01b
 YsHiWZmpBl6KxZmOabvGvcT85PFnyEqYOHGOZ8/wZoR5l+mHKsVNvca4jcqtUFi+3hnt
 cHsq250Tt+9bvO6racyJEkAX+xVJS0Y3S2PUV0iuOVO2kvW9Q0wjA/Wl+Sc1emWugfnC
 fI2b5GX98mRjEmNZhXACtwIzvCr8gaTIyk+y5h/dNk6kwnMIk3fEqWWnEptwirKWEZTA
 H5fdJIfMQOfH6ex4hpiWpj2oFeb6GhRAUUPFTjT9XrMIWnPqd+bd/rqC3ZsYjIyZ+uAJ
 +7zg==
X-Gm-Message-State: AOAM5334/VSFePjj5mtaHLrRXvh8uPMoOmR35wDTy0g8DmRW1Ubjyp4W
 dfH6PsxzCDfPhnwGbL7zYE4HxzN5fM1cGYApf7LqPQ==
X-Google-Smtp-Source: ABdhPJy1mxGPf3OVcetZjmkot3JjksguqybL9Bjdv4TgpEARs8HAzxDgcQMbGX/Sz9kf68rS3tbNC302iB1BTKMbIcU=
X-Received: by 2002:a05:6402:17e7:: with SMTP id
 t7mr9275816edy.44.1614955141720; 
 Fri, 05 Mar 2021 06:39:01 -0800 (PST)
MIME-Version: 1.0
References: <20210221222617.2579610-1-f4bug@amsat.org>
In-Reply-To: <20210221222617.2579610-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 14:38:46 +0000
Message-ID: <CAFEAcA9ZJA3hQq65Rg_bxty0_xcgqnErj41mOcfOtkw8uqFc9Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] target/arm: Restrict v7A TCG cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Feb 2021 at 22:26, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> KVM requires the target cpu to be at least ARMv8 architecture.
>
> Restrict the last ARMv7 CPUs (A-profile) to TCG.
>
> Series almost fully reviewed (missing review is trivial code style).
>
> Since v1: Only include patches which don't depends on  previous series
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   target/arm: Restrict v8M IDAU to TCG
>   target/arm/cpu: Update coding style to make checkpatch.pl happy
>   target/arm: Restrict v7A TCG cpus to TCG accel

I've applied patches 1 and 2 to target-arm.next, but patch 3 doesn't
apply (maybe a conflict with something else I've already queued in
target-arm.next). Could you rebase patch 3 once I've sent out/merged the
next arm pullreq and resend, please?

thanks
-- PMM

