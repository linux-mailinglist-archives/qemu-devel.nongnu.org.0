Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2793B2F361A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 17:48:08 +0100 (CET)
Received: from localhost ([::1]:40422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzMpz-0001PU-7p
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 11:48:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMkU-0005xB-VT
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:42:27 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMkP-0001Z5-L1
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:42:26 -0500
Received: by mail-ej1-x629.google.com with SMTP id 6so4446529ejz.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UIVbbQFttvN17seLXDfAzo2rnf6D0gitn3FMp5UU6xM=;
 b=jPVSko+4ckOv3/9tkxconkkJ8fZU9v66to2XRq08CCjjzMinT1e2MKdjl/Tcx6GuTR
 Wb0D/NcLiPvqxVZGkG+Kz+UQTc5ArBW5npr+yhBcAs9FYB++Gv/tbVOVoO+21LanD0Tt
 Zj6ebsHM3D1r9/6dEFv+qBI4fJQb3QRgLbKLa4j/F+J1oOP/ziw/PRtRsoaDc+IUXY3B
 BIHQ8ux+k39SYgbUuaVelCB07h9nRSf5XbfpyuJRaSDKJWc8qOrXCHTRWGePImDA2lkD
 M0RVckp2d94UqdLjMkIvCeP1r+gUTef+rvQLuhiU1AptYBCLfc+I8Gnmoe+fRzU3Bcgh
 H9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UIVbbQFttvN17seLXDfAzo2rnf6D0gitn3FMp5UU6xM=;
 b=syXiyvDqo0jQUgJeg5Vhyv7LLO0IFVw9dU1H6MhnjDPsw+tKwDK6BXe441qiQB7fpJ
 20+BOzCiY+Ly88Acu/ZY4PXoSXeLmW8KZ2LVtVx1IEs0ox+H7eps/V46bkSCvSQZQ8UO
 5m6l8nK8kOd05IF4AXcCEQ00DZQdjkwDifhdTBHNnSF8NrRVuSEdLoCEzXl1jdFLcsPT
 mfqKgc+GZzxKEght0DdRAECZjv4BaDWa6Km7vvPA8Ct5UePVPH/szSI3mhhj5r/s8HOo
 iUeNt65/N1exGIUBDWDaeKcrnOq5HuiTBRbKBbYvyCqpSdi5aNLR28G1vQNAU/1+AFG8
 2WnA==
X-Gm-Message-State: AOAM530elb5tWaall9xSCwSfpWESzQvf9w5bbbqkTWvKN6ZPatlLo60n
 J/ZMgp3IQnCwdyrXtRejmYc8ljh/9Sjl0z5M7m6BLw==
X-Google-Smtp-Source: ABdhPJzm+wQviwzcL6ioULEfRt8w/EiTe61whI+b0LsCMUzrXdrQN8zrSIbdy/gqIdMmqZyIy84AWk5LttdKrFu4B2g=
X-Received: by 2002:a17:906:e250:: with SMTP id
 gq16mr3685036ejb.382.1610469739747; 
 Tue, 12 Jan 2021 08:42:19 -0800 (PST)
MIME-Version: 1.0
References: <20210112112705.380534-1-ganqixin@huawei.com>
 <20210112112705.380534-2-ganqixin@huawei.com>
In-Reply-To: <20210112112705.380534-2-ganqixin@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 16:42:08 +0000
Message-ID: <CAFEAcA_AG77gJySKNRcKFrGsmhn2uNZMyB4aNynD6w5rFTz=7g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] pl031: Use timer_free() in the finalize function
 to avoid memleaks
To: Gan Qixin <ganqixin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Euler Robot <euler.robot@huawei.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Jan 2021 at 11:29, Gan Qixin <ganqixin@huawei.com> wrote:
>
> When running device-introspect-test, a memory leak occurred in the pl031_init
> function, this patch use timer_free() in the finalize function to fix it.
>
> ASAN shows memory leak stack:
>
> Direct leak of 48 byte(s) in 1 object(s) allocated from:
>     #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
>     #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
>     #2 0xaaabf5621cfc in timer_new_full qemu/include/qemu/timer.h:523
>     #3 0xaaabf5621cfc in timer_new qemu/include/qemu/timer.h:544
>     #4 0xaaabf5621cfc in timer_new_ns qemu/include/qemu/timer.h:562
>     #5 0xaaabf5621cfc in pl031_init qemu/hw/rtc/pl031.c:194
>     #6 0xaaabf6339f6c in object_initialize_with_type qemu/qom/object.c:515
>     #7 0xaaabf633a1e0 in object_new_with_type qemu/qom/object.c:729
>     #8 0xaaabf6375e40 in qmp_device_list_properties qemu/qom/qom-qmp-cmds.c:153
>     #9 0xaaabf5a95540 in qdev_device_help qemu/softmmu/qdev-monitor.c:283
>     #10 0xaaabf5a96940 in qmp_device_add qemu/softmmu/qdev-monitor.c:801
>     #11 0xaaabf5a96e70 in hmp_device_add qemu/softmmu/qdev-monitor.c:916
>     #12 0xaaabf5ac0a2c in handle_hmp_command qemu/monitor/hmp.c:1100
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

