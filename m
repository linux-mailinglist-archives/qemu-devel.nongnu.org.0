Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81E948EA9F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 14:26:59 +0100 (CET)
Received: from localhost ([::1]:38888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8MbZ-0000GR-TB
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 08:26:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8MVo-0005ws-IO
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:21:00 -0500
Received: from [2a00:1450:4864:20::334] (port=37599
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8MVn-0002fT-3c
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:21:00 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso7318836wmj.2
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 05:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3S3a7VZSa5E/IeRCSnQQDKJDEvgVGD/GAjWb0Gpgr2I=;
 b=XpWoT2f1KNwpRq+L+5zaaa5cWDOdMN06n9XRQC6JLFtxC18Eqr2AUWpXMILKsw6inc
 yAhx3oS/xJHJJVQiI1sCSr49s5Fg7Pf0ag4cVTuo2gsQUzsB313HTAK4HscRqlDSPHYH
 2ut3+H/5IiOn3PjXGK6Kx3+tgL5MaEJwU3Wr9K6pwf2GTUdODtQ5SnrdKx1sxvE3l43j
 kOR0daaBt0a/GNDJzIto9f9tr7jRnkcPggjoBWyXO64eWyLE7XZ26xa0Gin2CVV+evSW
 xiRxY4Fmjjzb6/29EjnErg4yIwS1xEHLZ6Ram32EDIzIt544g0rAUnBgJ92pMw0KBk/L
 MzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3S3a7VZSa5E/IeRCSnQQDKJDEvgVGD/GAjWb0Gpgr2I=;
 b=7D73ZDPpuEAdoUIFSFkzE0FoZ1yLdbzMRsFURJvEWpO7UifvFVLIvOVCZoLXE6dNNv
 3YlicQgqqm3vhtYA+xmKrtx/8tjmShR82bfUC96+hVGApKsE0KQQoTXQ4f4e+we8seRD
 srUw3J7XwQeKKOCtc2T4eSQ7TZhyXs2zws1nvYsg56CzGdN2gUteTL1TxcQzS19qw8Yx
 9wtPCzUIe9Fa7TUnJVzLfq69/K3elnx5m2YsGga1HrKWSjoUc8Nhi1PZFnjBr2v/ic29
 +0I5wkdKexCVmoA7orv26hi6zQ5kkjNhvaBkzATLuzZd+cve+OnnAiJKL3x60ERpao0N
 B5Wg==
X-Gm-Message-State: AOAM533sX5loDhYwjXmnY9VnNRZ8SRrWy9snJruiQq6R0U/dFMfJbU2n
 6hThK2y8RiQ9FXy0LGjYXBMEOHZ1FvdADqGzDT9M6Q==
X-Google-Smtp-Source: ABdhPJwWiHARTsh072ageF8tKY+axPu6xprBLcT+gQFgmeLZtjSpzunlyDocrjoLDgVurg4RgvYqnZDPu5m0dhmzElw=
X-Received: by 2002:a05:600c:154c:: with SMTP id
 f12mr11899500wmg.126.1642166457779; 
 Fri, 14 Jan 2022 05:20:57 -0800 (PST)
MIME-Version: 1.0
References: <20220113151916.17978-1-ppavlu@suse.cz>
In-Reply-To: <20220113151916.17978-1-ppavlu@suse.cz>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 13:20:47 +0000
Message-ID: <CAFEAcA8KwD6q0sv2WMCXCpiSXTSB0U_=AyeDCGW0h=y6d9iK2Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/intc/arm_gic: Allow reset of the running
 priority
To: Petr Pavlu <ppavlu@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, petr.pavlu@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Jan 2022 at 15:19, Petr Pavlu <ppavlu@suse.cz> wrote:
>
> Thank you Peter for review of the first version of the patch. v2 splits
> the changes into two commits and updates the code as suggested.
>


Applied to target-arm.next, thanks.

-- PMM

