Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0E13FABD6
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 15:21:53 +0200 (CEST)
Received: from localhost ([::1]:59974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKKky-0001xh-Ka
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 09:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKKjx-0001GM-Jp
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 09:20:49 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKKjw-0008Nw-1A
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 09:20:49 -0400
Received: by mail-ed1-x52e.google.com with SMTP id i6so17378463edu.1
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 06:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oobGl3fCn1XFnIgexGn4COkTfceanNK7J8aQ0oxJor4=;
 b=shkulshdouG0rfeF8DXzgvs5aqnqbGDf9KzmeDcaEAbgOdNSEfPDo4vqmOjPuj5qlC
 h2pabprk+k1bkui+DMnSAGb/2kLCBGkGnbce3ZsozzzEFNb+SzP7qsCvXjg2DrFfco0m
 loqgfUS9gBGurVX2UEsnmu3/IeKI9TeCYoDcmcmTQrZZtIbkPldFuf035fIUv1elYqjb
 XZ1nzjVKTfuqK6yZ6TBDz/cZEZBdRXypFgDBKyrJrI5Aug6KfcBH+BY6xbSnOtL0KUz9
 nrICUEpxcxBjArC5gP1UbikvlXBzuWn/1lCEGGwWJ0f16XLI/WDUEiWBF7rdJgLy10qN
 vGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oobGl3fCn1XFnIgexGn4COkTfceanNK7J8aQ0oxJor4=;
 b=Mu6NRDtq5it4ZQ7fSQbrIfddBEZaBUeOe5PKr9P0WoBQXV1CzONDjvOrfyb2GdmFWj
 kkCFBOgxPl6lmqKkMg/knzjSKXyvQBdSbg7biXR60258PYHMCac8fynq0oxDuSN9hL47
 G7ptonNSjWTw190xgvFrIApp7y63w8xP9diIgY+wE4RVvDH7Tl8bf28blBeLclvX45VF
 GhvCvdTabRaCp+qT+fqwwoqCFSIa+IFI/npOU3Q+gMfLs9aSrFn9EI5T+nnLSrFQ0cUE
 WWXB0IeD7vPGTcyOiRxkz6+MdNhg32d1B5D7nvrHZ7k5mdzmHxoaxsYd3eTezvdGrxNP
 wIBw==
X-Gm-Message-State: AOAM530lykjN1Vmp2Fq1ptaM8vuQTtQDY4/3OwpLTNx30H75KMW8A5UP
 lyX+KVjONiKau5UBEBqmjeUGdoTZu8wzKMzDleLKfg==
X-Google-Smtp-Source: ABdhPJwyzX2s/Kg0uPioOlIRgYFi6z+ESxF7wRQ07ruoCFmtyJge6R91DcigjJnOQk9HSM5eB97ntUAH6Nv74nZi060=
X-Received: by 2002:a05:6402:157:: with SMTP id
 s23mr19222294edu.36.1630243246602; 
 Sun, 29 Aug 2021 06:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210829100103.1950-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210829100103.1950-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 29 Aug 2021 14:19:58 +0100
Message-ID: <CAFEAcA8G-3rJfeeS3vM7DvazJqerFzkyNMckrABF=GNOByU4Bg@mail.gmail.com>
Subject: Re: [PATCH 0/3] escc: fix R_STATUS when SDLC mode is enabled
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 29 Aug 2021 at 11:05, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Here is another small set of ESCC fixes from my attempts to boot MacOS on the q800
> machine.
>
> When MacOS loads the OpenTransport extension on boot it attempts to enable
> SDLC mode on the ESCC. QEMU's emulation doesn't support SDLC mode, but without
> these fixes the active low STATUS_SYNC bit in R_STATUS is continually
> asserted causing the extension to hang on startup as it believe it is constantly
> receiving LocalTalk responses during its initial negotiation phase.

The ESCC data sheet is the first one I've ever encountered that includes
a multiple-choice test on features of the device ("ESCC Questions and Answers"
on pages 385/386: http://www.zilog.com/docs/serial/scc_escc_um.pdf ) :-)

-- PMM

