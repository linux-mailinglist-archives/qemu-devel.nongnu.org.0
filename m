Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BC0486658
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:53:42 +0100 (CET)
Received: from localhost ([::1]:54554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5U98-00076m-43
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:53:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5U4K-0008Is-He
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:48:44 -0500
Received: from [2a00:1450:4864:20::42c] (port=42956
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5U4F-0004dP-GG
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:48:40 -0500
Received: by mail-wr1-x42c.google.com with SMTP id w20so5222659wra.9
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 06:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kWNtg17y1dbyvtZ8kDz6YkHEIuVPqNEVgrQPBMKCYs4=;
 b=qv/9hWMMnA97jaLYHGxbA95PjxQ2dSKVp+Jms+ptNXNQHhF3oE5J9Wkw+LJV+ttlk3
 mXD95qXmwJ+4SEMAl0x5W+4mLx6Dxichw9CzO5QKvuLqTbyTHV5SSzv2/2GEyQgTiPeO
 eL7fMDB9Wz8R/GuM6rR8kHu075DKjlbJe6h0eM/Ce5AeKzyK8LAxEFXA6VbGxzym+bQy
 ApqtDafgmgHRiUnskNH2kES0XuWecrcz183BKdjSC+37cDfrUwe6BMI4LbI4uavu5fhj
 QZfr+tL5YOWC2kN3tDROVz+KcSnWRTsahPzc926wNzTMNCE+vaSEJ5SlqeNWXlnvyqgz
 pXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kWNtg17y1dbyvtZ8kDz6YkHEIuVPqNEVgrQPBMKCYs4=;
 b=xh2wP/cbQbvZjWvdjl2m5SG3bh11GgHFIfPIwCe7xinwgoS9KcHrDH/QVgoB3SMOIt
 A/ZgjbC9gBLtmZxYGb/GJt4KU/2UvtStFd7X74n6y0bNWelNKN5liQnq1mpZDp/xjIy2
 j2jQG11m/7VpnSv7+tTSyAFxR0oqjLEFtBQ+DDQs5Q6oSvxMlb6anXJt9m8bYWNrA8z2
 KF5TqqTKCXEgVXMTa5q8QqVMBW5kdVmdLR/yev0Pc8Iz9xvd8k93vKz+OqJYPI1G6Wtv
 +B3yAe60Z0avZfOKY1BNHKdsA54N2BLLxNUmvJYq5yF3e0oS4c7YwAbaDEcjRv7skZ5m
 7x0Q==
X-Gm-Message-State: AOAM533UEic9kZioOEHDTmL32dtzL1q3OP6L+YyIXP5D8YYYwaCzhPiA
 NHUMrID7XNkX973gAo/wVp9EidzCTZqILOPXYC6ZEA==
X-Google-Smtp-Source: ABdhPJzUfXFP0RBgMK9mvozH1hqFmKGMMtUbETa3BrqsDLwvaVQ48r7ZCXxFRGfjfkt86G+ftxnHvotxCIXtD7mlHHI=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr29627102wrv.521.1641480518284; 
 Thu, 06 Jan 2022 06:48:38 -0800 (PST)
MIME-Version: 1.0
References: <20211217233006.1466747-1-f4bug@amsat.org>
In-Reply-To: <20211217233006.1466747-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 14:48:27 +0000
Message-ID: <CAFEAcA-__Z06M-r9VhfkGh4QKxenFizcO+U+0EM+oPHJQho-Dg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] hw/net: Move MV88W8618 network device out of
 hw/arm/ directory
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 17 Dec 2021 at 23:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> This series simply extract the MV88W8618 device from the ARM
> machine in hw/arm/ and move it to hw/net/.
>
> Since v2:
> - declare MARVELL_88W8618 in hw/arm/Kconfig
> - use MARVELL_88W8618 Kconfig (rth)
>
> Since v1:
> - update (c) notice

Looks like the code-movement in this patchset has a clash with
your other series that's now in master that changed the signature
of dma_memory_read/dma_memory_write; could I ask you to respin,
please?

thanks
-- PMM

