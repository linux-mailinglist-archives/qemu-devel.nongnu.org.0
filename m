Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9766A6D1DAC
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 12:12:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piBjU-0007Lf-CF; Fri, 31 Mar 2023 06:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piBjS-0007LV-CO
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 06:11:42 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piBjQ-0004UI-DB
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 06:11:41 -0400
Received: by mail-ed1-x52b.google.com with SMTP id h8so87580252ede.8
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 03:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680257498;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dhRwvzGuPc0LA38LVLDlGZ7o0wD05j/ZYckfzk0lw/I=;
 b=rxkQU4dmM5I+05L7suzxWgUfmOKczvc0dOryEgKnMSgowcJg9RBAXBENWu+MZReZTt
 8gXs1dQpJdYRPhP1b6Hb9vR7RM2ctci0JA5Nly+5vHgxMlrgpLG/y306cGShqWUzg4uV
 aIo0cKESRIP76nlj/3TOjrrnI5tgf7reRgQTG5Yxn1Wum8lswcCjBdVgIxZ3oRMt7nn1
 1egQhmvgKv7AEP+cBmHd2elTa8dMS6xCEeNPQ1y/nW8LJAxBFlRX7uD9KYKppcceAkQQ
 I9ve9jl83d0cCZb8QhHDsfGKSKJ0DjVoMmb41bFRlqDE+nV/e9gpcfoXWkoFWYAH2nCU
 /M6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680257498;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dhRwvzGuPc0LA38LVLDlGZ7o0wD05j/ZYckfzk0lw/I=;
 b=P+bCLov0abF3tbB5f2CWX0BqCPsF6ism+kvhV1mOcgokIWuMyovBi9ViXdCA5sqtDo
 zMfgIaH0pooHmG/AWc10IsiADttgRR15N6o0hBJLgBopXu1TrZcAVKCNMQR/Yv/U+xBW
 2XhB068N6Qi3TBnW7QepMHEiN34Sk2tMr+RsceGoafhpA8+1/wBbSJfmrwLkYHiZVYA9
 dy84EQwgsTpBK2Dh9OHI+5STGxxip5M3tIHeBE+Cm4ZG3o+jNzvtUSzUMd8U1w5w7Fao
 PqxMZyEzRqCInXJKBjfn7ilGbwBs9P+lV/PKIIxNeGFpC/psmaZTCnPn+knO/hwHUHw6
 /zgg==
X-Gm-Message-State: AAQBX9fiIKE9MkoA6jQyc2qbsaB+ttRr52+Rjojm9QfnPdmoDZUlVyXD
 MnjdKxPeTR5nlTYZIept3faxAEXPHbuKII70aQjQ4Q==
X-Google-Smtp-Source: AKy350bO7VwGJDqandT0geY2mY+MsbYV2epW7wanDkChNJxoqQLRT47ml9YE51l979v93JbQ7cNwMgCz3bxK7FmG9Og=
X-Received: by 2002:a17:906:8683:b0:939:a51a:dc30 with SMTP id
 g3-20020a170906868300b00939a51adc30mr4416996ejx.2.1680257498700; Fri, 31 Mar
 2023 03:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230323182811.2641044-1-crauer@google.com>
 <CAJy5ezqP50f3frM0tBNOHo4-4PaeaMA7-YXAd8G_w+iRqu2cjw@mail.gmail.com>
In-Reply-To: <CAJy5ezqP50f3frM0tBNOHo4-4PaeaMA7-YXAd8G_w+iRqu2cjw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Mar 2023 11:11:28 +0100
Message-ID: <CAFEAcA8F=GHxNx6S60WPjnk6PgS5a6A19OOeb6GHjo2Rz1i-MQ@mail.gmail.com>
Subject: Re: [PATCH] hw/ssi: Fix Linux driver init issue with xilinx_spi
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Chris Rauer <crauer@google.com>, alistair@alistair23.me,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 31 Mar 2023 at 11:09, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
>
> On Thu, Mar 23, 2023 at 7:29=E2=80=AFPM Chris Rauer <crauer@google.com> w=
rote:
>>
>> The problem is that the Linux driver expects the master transaction inhi=
bit
>> bit(R_SPICR_MTI) to be set during driver initialization so that it can
>> detect the fifo size but QEMU defaults it to zero out of reset.  The
>> datasheet indicates this bit is active on reset.
>>
>> See page 25, SPI Control Register section:
>> https://www.xilinx.com/content/dam/xilinx/support/documents/ip_documenta=
tion/axi_quad_spi/v3_2/pg153-axi-quad-spi.pdf
>>
>
> Yes, MTI should be set when the device comes out of reset.
>
> Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>

Thanks; applied to target-arm.next for 8.0.

-- PMM

