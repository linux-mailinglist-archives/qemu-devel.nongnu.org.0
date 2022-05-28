Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2FB536E04
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 20:07:03 +0200 (CEST)
Received: from localhost ([::1]:45522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nv0q6-0004Ha-Dw
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 14:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nv0oz-0003Xs-Og
 for qemu-devel@nongnu.org; Sat, 28 May 2022 14:05:53 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nv0ox-0000Pf-Mb
 for qemu-devel@nongnu.org; Sat, 28 May 2022 14:05:53 -0400
Received: by mail-pf1-x431.google.com with SMTP id b135so7017591pfb.12
 for <qemu-devel@nongnu.org>; Sat, 28 May 2022 11:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sViST7Lt2k7cDt+yPnJ7DGhFpThOWEX4mk/6T9Ca3No=;
 b=QmDe8r40uUmie8W76jb3FfaPtIo5dbz4oeaCQcD9KVaoEqJuOAlmCvIgYG9ozT7SrH
 NzAAgi/bpJRSWUKamv0+SIfi/AC6uy39Bd2of123DWDPNW46UtcRg3f6aTyKV1Jihof+
 N96gYAqd6ILGNlGi3d42umujOz0QsKKUyvIkL3XtgL3v+gystwSJmK3b24RKDLGQLULb
 0+FNppDvlfepPExqTGuMoN/vDqnvNJaPsq8Kvav1rUjsr05zVVlfGNLZW8FC1LdbglAt
 PAcxu0jZjaWwjqxZOlANQsn81DwZyD+li2JzfcOwZsmbGHrbm3qxWO/XVWqyxTGA/y4/
 TTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sViST7Lt2k7cDt+yPnJ7DGhFpThOWEX4mk/6T9Ca3No=;
 b=CCGI8ThD6v2PxZrv9PUqW1iOBBvcvvBQajTh0+h2/sXSJ/2+Wq1rF8qWkMHig7vKpB
 PyMWHFijaEcme9dxKMoTZkjd9W/lkRDXu4/z/MQgwU8oLyPXNYJAaHlvqAUM+CXk5Xk7
 xB3lWH2b4WnWV3Nv94B6xlDX5bIco+NKDKB/5ZO04IkaV83LVEeSbJd1wrVX78Aqu4vP
 0WsPZt4Nn3G0O/9HaY52n6XDjwKqdx7T2lUlKsRMyU6Qd8uYAYBxPdjQ7RQvOQjd+c1l
 nqAcJoduZIkxS7DNECL1ozP+vHzyVCZoBocBpn8TGeZTUnn8hLJwuJIu4Pgn/TdnbFyv
 xpHA==
X-Gm-Message-State: AOAM532DrqJbF38j5fmTAsSi/aDOdYeavmP42c/q/T+utpd0beLMZ55R
 7aOdA1gH/F5DFjVYgGLKysgDyA==
X-Google-Smtp-Source: ABdhPJzDJ4kF8PYKDJ2gnSp40sm/p7EK0Y1wPSmuS9aQEmGMjkhbWbJL1NYIJTuNroFK1WTC/RJHRQ==
X-Received: by 2002:a63:5f43:0:b0:3f6:3a45:d4ca with SMTP id
 t64-20020a635f43000000b003f63a45d4camr41557180pgb.344.1653761149341; 
 Sat, 28 May 2022 11:05:49 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:ebef:c1ac:bb3f:d84c?
 ([2602:ae:1547:e101:ebef:c1ac:bb3f:d84c])
 by smtp.gmail.com with ESMTPSA id
 io17-20020a17090312d100b0015e8d4eb285sm5910545plb.207.2022.05.28.11.05.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 May 2022 11:05:48 -0700 (PDT)
Message-ID: <b6dbc4b2-7904-dfbe-d3b5-e578cf62d73b@linaro.org>
Date: Sat, 28 May 2022 11:05:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 0/3] Hppa serial fix patches
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
Cc: Sven Schnelle <svens@stackframe.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20220528102819.21983-1-deller@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220528102819.21983-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/28/22 03:28, Helge Deller wrote:
> The following changes since commit 58b53669e87fed0d70903e05cd42079fbbdbc195:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-05-25 13:46:29 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/hdeller/qemu-hppa.git tags/hppa-serial-fix-pull-request
> 
> for you to fetch changes up to 5079892df5f113c7f2b77f53bf7663f6c7bc6be9:
> 
>    hppa: Fix serial port assignments and pass-through (2022-05-28 12:25:42 +0200)
> 
> ----------------------------------------------------------------
> hppa: Fix serial port pass-through
> 
> This series fixes the SeaBIOS-hppa firmware and the serial ports setup code in
> qemu so that it reflects the real hardware and allows serial port pass-through
> from the host to guests.
> 
> Tested with Linux guests.
> 
> v2: Changes suggested by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> - Split out hppa_hardware.h restoration to an own patch
> - Drop unneccesary checks for serial_hd(x)
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Helge Deller (3):
>    New SeaBIOS-hppa version 6
>    hppa: Sync contents of hppa_hardware.h header file with SeaBIOS-hppa
>    hppa: Fix serial port assignments and pass-through
> 
>   hw/hppa/hppa_hardware.h   |  10 ++++++++--
>   hw/hppa/machine.c         |  22 ++++++++--------------
>   pc-bios/hppa-firmware.img | Bin 719040 -> 719368 bytes
>   roms/seabios-hppa         |   2 +-
>   4 files changed, 17 insertions(+), 17 deletions(-)
> 
> --
> 2.35.3
> 


