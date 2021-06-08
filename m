Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8073639F181
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 10:56:38 +0200 (CEST)
Received: from localhost ([::1]:41940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqXXJ-0001Lu-Jl
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 04:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqXVD-0000FK-MI
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:54:27 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqXVA-0006XJ-Hu
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:54:27 -0400
Received: by mail-ej1-x62e.google.com with SMTP id ho18so20371833ejc.8
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 01:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qKhC1xdQZxu/wqVr9+1ycTV5AZ4UVpfJX8gynD47n9w=;
 b=W4wr1mkCYUdwTkIWmdhl8fm/dWUnMyCnuU6r4bgya72bfudTmL9n75VGrzE9sD3SLz
 ooh9/v244lRP63jOIlckxgWhHrRIj14ZK47oQbykyXIy30QGXzZF3eCofOWDCRj6k4LL
 LkGSTi+mXEEKZpHO4Z32X1GjU0Own/kXrMCtz8pxCM9xZZutWqAH1mD1IOwqgbHIXABu
 OmeGWqACXMqJtiyYrpG15xdyu9IY3eanWilPyDM1GayOj7s03S/csnsU9QIYSvG3ppLT
 V1yIIjYqWJy9BWriUkECn3EQTS5Qjx67c2uEGYi6cgQtuLFUH7OupterOh4j3r/tcPlL
 4l4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qKhC1xdQZxu/wqVr9+1ycTV5AZ4UVpfJX8gynD47n9w=;
 b=kb+nLf7w+7LO/HHMRw5T21UCX88H3VqLqRb0BXXqxseSOaefAk0gIEoZ7uTPc3W5t2
 BaWxjWLShU16UNgcYlw8iZt31H5g/xNkq1sN6Mg78PhGw8mIlkQRUfimqowdwbBFUNK2
 UWW7krYtOhRqjjHoUXb3ds8CJNDTtJpcb4m8kiTHs3e6IJOJn/5v7ScrdydUJdHbcmd1
 Uc47WcwKGJvRgrexw2MFj+HzYbnHFz4lb/W+tDPa0l1mW4/2TXmr98iFAy5GwFF5S9Qg
 4ixEUoLEo1R6rtPQj0nkTJXOhY+JWwMXf5CXNx5L+R9Wgx9nNAjbGV2Y+lXox4Uv4wF6
 R19A==
X-Gm-Message-State: AOAM531n0bwN7XhdXVET0v1WuaUen6e3MRWY4oGvpK5jtQtMWnU0KuJa
 EE2YfKu0HvbhgE+xWopXFGdTGfCGiqXv7rQDfk5APQ==
X-Google-Smtp-Source: ABdhPJzYsiwOCRwzKT/QNkMnvx0xJngYqpTk39d5yikWfWb0tq2KvmEOnsm8m+vfufgYuccFjc18xcl1v41c3f7aEmk=
X-Received: by 2002:a17:906:4109:: with SMTP id
 j9mr22831066ejk.250.1623142461679; 
 Tue, 08 Jun 2021 01:54:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210604130352.1887560-1-jean-philippe@linaro.org>
In-Reply-To: <20210604130352.1887560-1-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 09:53:48 +0100
Message-ID: <CAFEAcA9q+xoDbgGQooKX+YPdtd-uiSixgD4-eFeWwAWPQ91DQg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Jun 2021 at 14:07, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Commit 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access
> check logic") added an assert_not_reached() if the guest writes the EOIR
> register while no interrupt is active.
>
> It turns out some software does this: EDK2, in
> GicV3ExitBootServicesEvent(), unconditionally write EOIR for all
> interrupts that it manages. This now causes QEMU to abort when running
> UEFI on a VM with GICv3. Although it is UNPREDICTABLE behavior and EDK2
> does need fixing, the punishment seems a little harsh, especially since
> icc_eoir_write() already tolerates writes of nonexistent interrupt
> numbers. Display a guest error and tolerate spurious EOIR writes.
>
> Fixes: 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> v2: Added qemu_log_mask() (so I didn't keep the Reviewed-by tag)
> v1: https://lore.kernel.org/qemu-devel/20210603110012.1182530-1-jean-philippe@linaro.org/



Applied to target-arm.next, thanks.

-- PMM

