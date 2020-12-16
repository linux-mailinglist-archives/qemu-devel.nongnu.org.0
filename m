Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D65C2DBE97
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 11:27:16 +0100 (CET)
Received: from localhost ([::1]:49268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpU1b-00036j-9v
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 05:27:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpTzb-00022o-1M; Wed, 16 Dec 2020 05:25:11 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:42326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpTzZ-0006L6-Eg; Wed, 16 Dec 2020 05:25:10 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id j17so21897173ybt.9;
 Wed, 16 Dec 2020 02:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MUSv24umSnnRdRbzXcaLRlCzlwMYxa9GG3xGLWSbhac=;
 b=vWjUtE4sW34P5bEZfzM0YshqXD/wtjb4q2rzYr/eMDm0jTex7BlWNaHZTj9FsjXq4Q
 cUMVJR/jAoSWheYngj0uVcq7p23j+8NtRy3mHbfmOqB3rylwd80KFWyx6rcMwcorfQKe
 8hMNBhzCWPrFRM9Fjq0ts5XIToHN/RghW8Sw6ZVd2/kWH9bHcb+mjFXzZcHzyrkGdLqX
 qGkZhAwT8Dd9PwCdoftF0jme6HTBDq+MeCTWeEsqzFxh2a9dubQHICI+XxnsaPsRi9Rk
 lk/WCyevvZtR0ijmzXiQKDdND0nvcwbAdfSx7oAyIzsNpzWOp1Z3O9oOEMy30Tbwpm8v
 O9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MUSv24umSnnRdRbzXcaLRlCzlwMYxa9GG3xGLWSbhac=;
 b=sIKFgvNB328XlB0avlPJGTthGC4AJDGknjRs0TsI7mEkjz2ZdUwoSGzBv8ysr49ReQ
 o5TkITAJCk43ZQADX2oB9vyNOOI6r1FqDt44JMfMMxRMFfotUU28nJWauPclmZ/grThO
 UBkcrj/kznGRToLG3xGV5R9CoPH9p5g2z6mfomo6Rl0DHuhs4vHjBoEG/0XhuZLYnY/J
 kId2XtLj2fNLaNebQBMprKp1hHM+cElmy7M39cNXroPuSgYdSgdCv8Jf6LlBkHSjOLpY
 dRxdImAQIXr0fc6RHbOsK5tXi32bRl5gYLxqpDqlMSOqz9mxxk/3nPg5KUj21x/6u/Pk
 vjIQ==
X-Gm-Message-State: AOAM531T9rLzwndb/FbILjZMtSFyWLREvCdwt/UnJOZtrmJ7WicfyqUN
 EYxbScRwGkNtGeZdQD5oIkx+kix4SmfdnkWDc5Q=
X-Google-Smtp-Source: ABdhPJwFzVHJFTvVpQf62Yv1h9DALisPZuVvfTV4AHN9PTmglZSGw7pFEC+Ox2tZA1y61pZ3Maw3LxQNEOYSw1h8cBM=
X-Received: by 2002:a25:aaee:: with SMTP id
 t101mr46677660ybi.517.1608114308154; 
 Wed, 16 Dec 2020 02:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20201202144523.24526-1-bmeng.cn@gmail.com>
In-Reply-To: <20201202144523.24526-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 16 Dec 2020 18:24:57 +0800
Message-ID: <CAEUhbmUtCvXCKoQGU9b6+UX1juChVfHkugODjo2psBnRw+7NTw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
To: Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Peter Chubb <peter.chubb@nicta.com.au>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alistair, Peter,

On Wed, Dec 2, 2020 at 10:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Avoid using a magic number (4) everywhere for the number of chip
> selects supported.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>
> (no changes since v1)
>
>  hw/ssi/imx_spi.c         | 4 ++--
>  include/hw/ssi/imx_spi.h | 5 ++++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
>

Ping, not sure who is going to pick up this series?

Regards,
Bin

