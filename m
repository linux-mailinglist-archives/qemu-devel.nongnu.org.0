Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F48125032B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 18:40:27 +0200 (CEST)
Received: from localhost ([::1]:35292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAFWE-0003hH-82
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 12:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAFVU-0003Ad-2L
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 12:39:40 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAFVS-0007lb-Im
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 12:39:39 -0400
Received: by mail-ej1-x62b.google.com with SMTP id md23so12000823ejb.6
 for <qemu-devel@nongnu.org>; Mon, 24 Aug 2020 09:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KUC5lQUeddxNURzwEfpyNte4kdBhJoq871krNkhUnvE=;
 b=iJQrFbsrvKACOJhPS0KLuglagXanIhT7Q3T/Z53ANU08keJFePwzublDmOi0HDwRl+
 l635nVJNw8ntx3C76yte14dqsfRHK1Xk9+cqFIgBkOrxLEA1u1mCa12dST6d23Rv42Bn
 8+wiarJFreVZW8Udn18ZapD6+ckbWkHW0gSekkRAM952J5IaEAy50p+/OxuCIk2KdH8C
 ymNtuITGtiVekb4r+i7uu6vvRRCwOxeb7MWSeRrfoC/avkYm8ijWbDC4APURY+cTMwkf
 hTS5zuIkf29GHeLVirmtxc58qlNcQUmz1veFKNKRohxGQj5S7SSsIfps2dROmiLnA8M9
 P0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KUC5lQUeddxNURzwEfpyNte4kdBhJoq871krNkhUnvE=;
 b=dlVlPMrcZdCoD5Q0SDsO64tI8brX9fcVmhxeYYW+CpUGB3pvz8T/mV1RiL5y/22mP0
 DwyvxXd11I7iCsJs3p5zE2VnRTpJI2DzCDIQYgkLrO53IMFXlx8yEn79pMRQI0am4gQi
 bpns8wYNV4LaDXiOG5v1NPC+QmyqtbniraXhsRmx/2UT83mATJ9RtMQAZDwCqk/4wjnE
 U8eA2Bp9o0qbFBjFUKW07w3QpMPTF5VFTupOb6j01Ki9TV10cTGqOIyW+ywZjNS6/8aL
 +gQiFC3ILwPbN2jDnVKndsWrwxf8Ok492vmHM0jFxINowwZt9YZT2gaBm5+OWGjcHBxh
 AeLw==
X-Gm-Message-State: AOAM5327mW0MnTn0RA4qQrYZVnvr9i7sUHzTphJM/uA/utjDbHtN8E7w
 yHqeM0VypkWBVdk93ERJoGqMvxtdKmP/7mjnm+4Glg==
X-Google-Smtp-Source: ABdhPJxFSs05zvK/TxaoLPwfoARfIHM4C2M2Q7NZABkdipfYK00iXCkvDpvWRu8TAnBL9R4NEp/NSG+OHwntNBlPj84=
X-Received: by 2002:a17:906:d8ca:: with SMTP id
 re10mr6116139ejb.382.1598287176846; 
 Mon, 24 Aug 2020 09:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200803105647.22223-1-f4bug@amsat.org>
In-Reply-To: <20200803105647.22223-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2020 17:39:25 +0100
Message-ID: <CAFEAcA-r5_iZQnj3JmWRYhUwuD6cr=PmJQKcUvbAiHm--ymWiQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.1? 0/4] hw/arm/xilinx_zynq: Call
 qdev_connect_clock_in() before DeviceRealize
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 Aug 2020 at 11:56, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> This is not a critical issue, but still annoying if you use tracing.
>
> Maybe it is worth fixing for forks that are based on release tags,
> else consider it 5.2 material.
>
> Anyway we can still discuss if qdev_connect_clock_in() is supposed to
> be callable *after* DeviceRealize.
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   hw/arm/xilinx_zynq: Uninline cadence_uart_create()
>   hw/arm/xilinx_zynq: Call qdev_connect_clock_in() before DeviceRealize
>   hw/qdev-clock: Uninline qdev_connect_clock_in()
>   hw/qdev-clock: Avoid calling qdev_connect_clock_in after DeviceRealize
>


Applied to target-arm.next, thanks.

-- PMM

