Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749D948DEDB
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:25:43 +0100 (CET)
Received: from localhost ([::1]:43004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86fG-0001bZ-BN
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:25:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n86aj-0003qg-Eu
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:21:01 -0500
Received: from [2a00:1450:4864:20::429] (port=33357
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n86ag-0004LZ-8K
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:21:01 -0500
Received: by mail-wr1-x429.google.com with SMTP id d19so12327875wrb.0
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 12:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nWzMoFMr4Pgyu/ZOEFNoONjbBKbc+bTU4qgq9FDibvw=;
 b=WhXgQ/5eBc4IXH8U5xFwe3LZpBZxNPO99ocgB0TJJ3Cvyxlru1D5GW6AQPykvrxHHk
 JXncYDpD6pmnagrDSwyjW1lQYeY9RX0LvGp896xnQ2sFgeBP/r85lStaolf7HFMbdzBM
 BUq24dLDr5qmN6ejUKSaxn8sdEJxGJTbgjKbmyc4+g4RqsKyC2s+hkYjq4JfV4mbnl4G
 eCjCfIDmFuYit167ajEvFl+33HIYqAL8qmZ1XiWb22uVORc44mjhPARbwC5pR6GpYIN6
 Px8uDGVZocN9RYE7wGbdW3l6PC4TzkUwg+RISv8ufjJe6VfIKhBOzFccBryHKALtwOGP
 cC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nWzMoFMr4Pgyu/ZOEFNoONjbBKbc+bTU4qgq9FDibvw=;
 b=rxAvzKfRd++nSVcxvI6WNy+Muz3we7Pkw0F145sQ8INniedKuJ4WBhSYXY7lTJfhHj
 Wxgju+laFaXagJMAwjT4dP+TBugcMteq2gp4P2Ro0tYnP9bjwT1BSfNroXqskCxaJ+jg
 Uxtj42BUJixvXLSvKYczao8ynUBNBXb7HN7JN6TgFw2ECwBLO/JqMmLoRLDxQWStfj+E
 F8iDzLT1RTdfC9bcmMk/TF1fV5ILRLH/DRfh2dtgbCgLsi/16y+S5x5RVify+ZiS82RS
 u8fzXG8DYtZ7S2rzA7xeyk2OnF64nPecb89rt1x01ITMna3SMHY+C+yed29nUiQYKsZA
 OQ/Q==
X-Gm-Message-State: AOAM533mdX/X8Y5AZfLwN8zaVJB2JAlOdIu63LiI36glCu8eVtkTVi4X
 EKbGw/wzVVUbiJ6YelBEjm489qQ1A6HgebOWTzETMA==
X-Google-Smtp-Source: ABdhPJymDW72JCOzRqjJ+RD6f+k6Lo/9a3x2wNQSQCAwowQfOKR3Jz9j3RM5A1+EGU8QXZIl5F/4sI6VnSU30Tiin6M=
X-Received: by 2002:adf:ee0e:: with SMTP id y14mr5587418wrn.172.1642105256614; 
 Thu, 13 Jan 2022 12:20:56 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-20-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-20-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 20:20:45 +0000
Message-ID: <CAFEAcA-a80otDAdPgei=BJgXmX1g8wkKZGY6EvXQVVj8G88cAw@mail.gmail.com>
Subject: Re: [PATCH 19/30] bsd-user/strace.c: print_taken_signal
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 9 Jan 2022 at 16:46, Warner Losh <imp@bsdimp.com> wrote:
>
> print_taken_signal() prints signals when we're tracing signals.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

