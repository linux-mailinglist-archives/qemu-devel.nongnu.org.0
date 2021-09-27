Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731B1419577
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 15:55:56 +0200 (CEST)
Received: from localhost ([::1]:33706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUr6p-00052B-HS
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 09:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUqit-0005hW-6F
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:31:12 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUqiq-0002Qs-LX
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:31:10 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t8so52056956wrq.4
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 06:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xv9d4STRP6teJmmUFE71E7z4I2+VG5EJaOGZy4Ws60U=;
 b=QqJfumt3E9LPMNDpglXxn79fgeHnZ28GcjqKCN5Lvxhm8Xax+1fJ2TfXR5MBPpwElM
 eWT9L0kHHem08JY2mhA/nJV5Rn1QW/y564IJTzSDTsjE6WbvUmi2VrxTbM0Jg7CPVj5S
 pT/I2QuzdkQotClJnLsk3XXS8UV1dL6M36389lnrm1Gx5FUJK6x/WWdbYU9fObkmmYqK
 kU5wvdowzL9neyIIUG6XVwXP/qczN2+iz+b9t9OWLNdIV2y7cQaC2K7u6hihrVOpPAEF
 XJNFT5vDOWzSk/IRcrbzroobKlFljqTiBDTMaNYBTg8LbGi9njLXYEgX8jn++n55IFml
 7ILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xv9d4STRP6teJmmUFE71E7z4I2+VG5EJaOGZy4Ws60U=;
 b=O/wjdc7MGcs0iay6ulVFIJGbvS7lL/81kjqOjEhtJ9zc14m+dUWz2RYYBFYmkWQC8y
 2zDDWg/vR8YJsvXxHPVdT1+r/+FaQ0TT7ye1Yjm7Y3NXLAiAK+traOlajIBUicQL4nVq
 gTW3rVcXzoUuZVF1zsqxAjddJ9iaWDpXkk48Ul/1r7W2Mlt3qz5Lc51vbNKA2NhUcrP5
 bBkj2O3nVEYPGVg0tL9tAFYfYxkuwz6whChfQ31nzA8v/Ig64moT5pbi36KTNBSLnr8u
 tS4idUj0kW5NltA5lV5bJ/AMOioKDb4TYuLctdEHqRJPxi1aHB1Z4oAtxzx9onJ4vBzh
 Ci9w==
X-Gm-Message-State: AOAM531KkQTSz/s/OcuOgRQxjcjGNgvpeO1Nn/6IVVWcajCqNSQDXTi0
 oAESKalBmh5nXcnbor+IbF4/k4JuTmbfDu3C21V9DA==
X-Google-Smtp-Source: ABdhPJxUQACWZfBzKSLm44FlXQwlm1j9vKU+bdgeM+Cn2Ns6hpfNrktd9yGO4yXdLrKNmBFoObYA9ts2ycwDxpTNGZg=
X-Received: by 2002:adf:f185:: with SMTP id h5mr28679562wro.302.1632749467299; 
 Mon, 27 Sep 2021 06:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210924165926.752809-1-richard.henderson@linaro.org>
 <20210924165926.752809-26-richard.henderson@linaro.org>
In-Reply-To: <20210924165926.752809-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 14:30:14 +0100
Message-ID: <CAFEAcA9gn-MMTV6f5xpzp4KkZ6U5rZu599+9fdQDOEbZu_6VkQ@mail.gmail.com>
Subject: Re: [PATCH v3 25/27] linux-user/sparc: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Sept 2021 at 17:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create and record the two signal trampolines.
> Use them when the guest does not use SA_RESTORER.
>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

