Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7CF4029B2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:27:30 +0200 (CEST)
Received: from localhost ([::1]:54842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNb8L-0002fn-3A
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNaic-00072F-W4
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:00:55 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNaib-0005AK-CQ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:00:54 -0400
Received: by mail-wr1-x429.google.com with SMTP id b6so14323299wrh.10
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 06:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R3eYbZNXwn4mNxMrolgxJrWbLePzrDji+56X/IC7ZdM=;
 b=HRZUyo7SePrbiM2v9PrAFWev4/SP7gO91VFjpjdsshM4gxop8NNh7AzwnyP7+d61lB
 BCFwnAYTa4sH1Sf4CIjyoYILU6XHnn4bprTVQ0pT7A9uXhdIoaezPML1D5qdydDEJeCL
 q3pynLTkC2HH34BjRUWVzCnTmMEEviqUCq80M1fBqH0pzVqH96Ixd0MPT9JRUOcARhHz
 gZEW6Uvcm+POCeOSRRr9YZizElhiu3xYWCa1txJeizYXbZbTtglb8eFV1pHMAO0ty/BG
 ubyqsjk8dQaGAVP582lsvzzi4ihSDCZ+X/7FL/Gw6F0vIAfTZWD6IWkmUdN8oO3xmJh3
 CRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R3eYbZNXwn4mNxMrolgxJrWbLePzrDji+56X/IC7ZdM=;
 b=PVMiJGoawOYt/YO8ITjkMWImaAA/S3ONayk4gedmBWDabbyVoKtsPx66FtLX4UsOBs
 kHjP/4SMmXHYxjMKnolz5RdrHWpj9QXLeFNoCdNltIwVDPlRFuuXqnRN3NiIIA4uwrkB
 d3gC8e1Llbj47dgrtsKqNwoMIaXjz5/R2hkLSxrjchD1nDDk62Oerj0+WsQRrpYhVwhP
 F5xuB60ckrGovREsPQCnW54Etc1tkJ5B9vsi41voL6Sw+qVf7QgagRqlMUC+9DRKdpdf
 OjTRLzzxesDntbOsXEG0KZWjqVbNV5o9vKW5CI04+X+hqtBlbU68MNXuflks/VDcThwf
 P2TA==
X-Gm-Message-State: AOAM53133K1MMUTNhrVyOBhnvELg9IlrvVdLkW7TB4q0FEOX017m2dxT
 Q2hwXSHp7nFx/N/vDro7K6M7+LNz/mc5n7P403FEAw==
X-Google-Smtp-Source: ABdhPJyvCeKbHBG2O44FVIGjNgFMCjrObmoCahhJKoOexo+ZnT/wHeZtTaImrr4h4pdB/o3/iyE5MYO5UYNhvK4PPys=
X-Received: by 2002:a5d:6cae:: with SMTP id a14mr19161825wra.275.1631019651724; 
 Tue, 07 Sep 2021 06:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210903113223.19551-1-mark.cave-ayland@ilande.co.uk>
 <20210903113223.19551-4-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210903113223.19551-4-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 14:00:02 +0100
Message-ID: <CAFEAcA8Fzx0hz+kTzZEMXHx1=46Ryv2NwD-jH9fumyszKO0veQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] escc: introduce escc_soft_reset_chn() for software
 reset
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

On Fri, 3 Sept 2021 at 13:01, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This new software reset function is to be called when the appropriate channel
> software reset bit is written to register WR9. Its initial implementation is
> the same as the existing escc_reset_chn() function used for device reset.
>
> Add a new trace event when the guest initiates a soft reset via the WR9 register
> to help diagnose guest reset issues.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/char/escc.c       | 40 ++++++++++++++++++++++++++++++++++++++--
>  hw/char/trace-events |  1 +
>  2 files changed, 39 insertions(+), 2 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

