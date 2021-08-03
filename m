Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952B73DF4DA
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 20:39:07 +0200 (CEST)
Received: from localhost ([::1]:35248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAzJi-0005JD-Ld
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 14:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAzG9-00080X-Is
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:35:26 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:36782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAzG7-00016d-VE
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:35:25 -0400
Received: by mail-ed1-x52e.google.com with SMTP id b7so327355edu.3
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 11:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3h0fdLNPM1dEey5JLwy/XFLh2gvXbItFWv3/ztsAUY0=;
 b=DfP/aX5hQZZWFq2AxSsw4WRsiQYI4TP8YlEl/6CCUOkv4ZiZ7W6rmmegWsyAF5CuY1
 ll/BLzpdXf79quIdJpnuz/IQObL0o+IjR5zCtxETZyTZjowhKCtQnPkHDmMwc5RS64DB
 /nK6nQYNqGG/ao6EFXKc3civV1/0HT7GxZQvZ+RUk0TQDzM6iUhktf2NXI26sTj8c95v
 nKa88FjpVTk6IR9RQwNQ0CDul0sP4GPk16T8qyKEsCBPO4/j4Bkhx3J2aKPeI8tmBu+j
 CKjmPHDqlKkIi6HIKg0DDAoS2ISReqLEjQ/dM4zOQBEWg88kGZ9HhiLtrJ/hFbfGfCPn
 dskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3h0fdLNPM1dEey5JLwy/XFLh2gvXbItFWv3/ztsAUY0=;
 b=nqXV8S/ozzpFPhjftT9dq16FlsHV4BoJTLzaNBuYlwPipaJShzqlvX5aLV6uBtpnKo
 Inidi3dOEYoFkVnD/hWgP5TSAUtF104Y5aheyVJY+kazpaw1WrebTSGv2Vge3suwqlgC
 8T3wiInxKIw+dyOXvIKBZBqGtHtdvVzGTB7pHC2QwQoNG0iSBWHVelmDmBM8pFc48uF4
 OUeoGx3BzNR2sFMRssurr/SsZ2MHzLKirlUVLactpagDqKN+ctBlwvl/iB5LjMOlUlpp
 BbyQHUWC12cRErJ5XWbKiP0HHtl7nHuH4BYJFDME9GjfpuP7p9l5vJWj8kAoYHih2oJ7
 t0Fg==
X-Gm-Message-State: AOAM530SZPhhurhOBMdNqwHf+6eVRCeluMcM9adr5eqqNOmR7oHQu50L
 iqLwOxciLAsHf691d6nYrSh4ZRr/jrVL55EepNtlxw==
X-Google-Smtp-Source: ABdhPJwrrWZv3GOTqqW/0mZ7J2YXa4cRa+R+xI8hGstQwjhbYOwmClaxQrBS5jh6twkNTeGoOL5xST3691GYXz8U+fA=
X-Received: by 2002:aa7:d30e:: with SMTP id p14mr26949894edq.204.1628015721679; 
 Tue, 03 Aug 2021 11:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210803172013.148446-1-iii@linux.ibm.com>
In-Reply-To: <20210803172013.148446-1-iii@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Aug 2021 19:34:38 +0100
Message-ID: <CAFEAcA8J1odq1mcg4mKD--EbNj2d01JwqP8DnK-_c6Oz2y157A@mail.gmail.com>
Subject: Re: [PATCH] linux-user/elfload: byteswap i386 registers when dumping
 core
To: Ilya Leoshkevich <iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Andreas Krebbel <krebbel@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Aug 2021 at 18:21, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
>
> Core dumps from emulating x86_64 on big-endian hosts contain incorrect
> register values.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>


Looks like these two were the only two guest arch versions of this
function that were missing the tswapreg calls...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

