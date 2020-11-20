Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF9F2BAB84
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 14:49:43 +0100 (CET)
Received: from localhost ([::1]:32932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg6nG-0000Ra-9n
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 08:49:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg6ij-0005HF-Mj
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:45:01 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg6ig-0006ux-VK
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:45:01 -0500
Received: by mail-ed1-x534.google.com with SMTP id a15so9589102edy.1
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 05:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=N7WKqA9zpurRykd5uLpJ/XSo1eU6mxFHkZEw4VajoEc=;
 b=QOClg52iF0nwGZIy3gsVbpWmiJT8GG+ivktoYqDALIbMwzV9yy3NrSHTouacSMb8he
 Q1oZUvuH1771PF6SUuQ0lgsntcZx0MJTievS+dYlEXpvFg5C92W2rVHou6NYwsh3jSU5
 kh4viuvxA1FLMK+9Sc28Tmt4kLPK8hj3VE3uz5t2be/Nbj5YPMp4dS7svQUFLKuSmxJD
 RvmM1p+fAhRV1ftLXLvWIWZzyi96oUacTM0sOt9tN2eB48as38ASLfEMdNEzaSqkGGGu
 ulywVDRPucsDaP/Ds9vL6Qe2hyDz3Ro/ZJJG52ZePxLery9ohOqKICpp0OAJNZ0PMXLC
 PtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N7WKqA9zpurRykd5uLpJ/XSo1eU6mxFHkZEw4VajoEc=;
 b=c/E5AXS5iGh1oq/efmWvGhkhEUDUUzKM2+bDJOqvJccTCnpv9ynoEaXKM/bKbLW8o1
 2hWW6j7NFORB8OaNpSMjJxsp/qMYyZl7O3bbD98zn8dDz5Fg9LKTZmL4V/TYaBUEEqxx
 8OwdAyC/iqFQmSRfR6lFNWZI/zRORmhbEVbiZ7of0YI9co9pEhBj96tYypF7Noy5o1es
 6Bq8RewjSzI3Ze8MsvIHPDuCokpwB3hgbsndvcfP4CANyFRyqzUjnb2hj2AzayLb3B3m
 saX8qQ2cNL3IBjhV4AFBQpcKB9qD2sZIBAx/khepnKo27QvAmrRWnBGHng3RX5EraIZu
 BcNg==
X-Gm-Message-State: AOAM533TAwNApoDzjrxz9sEmYZhzcshfh9jA1pKn4CQoT825kAkVSiku
 +myS2Fi88vUABZVArwmY2Gt5n7qfp5ZI/0LZkcaZ0g==
X-Google-Smtp-Source: ABdhPJzwGyLnhHJp5o4F6qzfvB+0fE7Qlfv77WE89mwYGtRr41Um0ig0iUG1hr1nOk5G7sGx9TOVPfGQtEmUWi6AJlI=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr36449418edb.100.1605879897277; 
 Fri, 20 Nov 2020 05:44:57 -0800 (PST)
MIME-Version: 1.0
References: <20201111141733.2358800-1-kuhn.chenqun@huawei.com>
In-Reply-To: <20201111141733.2358800-1-kuhn.chenqun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2020 13:44:45 +0000
Message-ID: <CAFEAcA_BSYrq87it7UXWJUDvUuA8L8U1Y8mxkyZdwzb3n_sSiA@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 v2] hw/intc: fix heap-buffer-overflow in
 rxicu_realize()
To: Chen Qun <kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gan Qixin <ganqixin@huawei.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Nov 2020 at 14:18, Chen Qun <kuhn.chenqun@huawei.com> wrote:
>
> When 'j =3D icu->nr_sense =E2=80=93 1', the 'j < icu->nr_sense' condition=
 is true,
> then 'j =3D icu->nr_sense', the'icu->init_sense[j]' has out-of-bounds acc=
ess.
>
> The asan showed stack:
> ERROR: AddressSanitizer: heap-buffer-overflow on address 0x604000004d7d a=
t pc 0x55852cd26a76 bp 0x7ffe39f26200 sp 0x7ffe39f261f0
> READ of size 1 at 0x604000004d7d thread T0
>     #0 0x55852cd26a75 in rxicu_realize ../hw/intc/rx_icu.c:311
>     #1 0x55852cf075f7 in device_set_realized ../hw/core/qdev.c:886
>     #2 0x55852cd4a32f in property_set_bool ../qom/object.c:2251
>     #3 0x55852cd4f9bb in object_property_set ../qom/object.c:1398
>     #4 0x55852cd54f3f in object_property_set_qobject ../qom/qom-qobject.c=
:28
>     #5 0x55852cd4fc3f in object_property_set_bool ../qom/object.c:1465
>     #6 0x55852cbf0b27 in register_icu ../hw/rx/rx62n.c:156
>     #7 0x55852cbf12a6 in rx62n_realize ../hw/rx/rx62n.c:261
>     #8 0x55852cf075f7 in device_set_realized ../hw/core/qdev.c:886
>     #9 0x55852cd4a32f in property_set_bool ../qom/object.c:2251
>     #10 0x55852cd4f9bb in object_property_set ../qom/object.c:1398
>     #11 0x55852cd54f3f in object_property_set_qobject ../qom/qom-qobject.=
c:28
>     #12 0x55852cd4fc3f in object_property_set_bool ../qom/object.c:1465
>     #13 0x55852cbf1a85 in rx_gdbsim_init ../hw/rx/rx-gdbsim.c:109
>     #14 0x55852cd22de0 in qemu_init ../softmmu/vl.c:4380
>     #15 0x55852ca57088 in main ../softmmu/main.c:49
>     #16 0x7feefafa5d42 in __libc_start_main (/lib64/libc.so.6+0x26d42)
>
> Add the 'ice->src[i].sense' initialize to the default value, and then
> process init_sense array to identify which irqs should be level-triggered=
.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

