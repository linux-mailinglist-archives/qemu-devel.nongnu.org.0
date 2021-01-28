Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D01C3079A3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:27:27 +0100 (CET)
Received: from localhost ([::1]:58088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59Cg-0002M1-7b
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l59B9-0000pk-AQ
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:25:51 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:40129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l59B6-0006Nd-Dy
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:25:51 -0500
Received: by mail-ej1-x629.google.com with SMTP id gx5so8338655ejb.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 07:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QNOFr2XLQaGiWnEvDCyuI1miJPyjLHa9wt1opfeIiGc=;
 b=MSYic5N0IJ+1yzPrOUZW2CJAl6ldGT4d+ZG1ovmZyt6lC5sK1VlKknuvgyo/+rW5C3
 b5FzVs8zLnex/GdSqbkCW3ti8sQhCwLeN5jj8fKoJxjfBcsvGdQF9k35elBuJghtvDYJ
 yi2eGhDSjasZP+4VBL6wljbf1JABF1EX9ybxtNuwOxmxFS0uwLfHJ/CsPRjn6q4LluKS
 0F+nDtT5UwGhhlHFCllvtIzQ5qrEiek8t/XC/DaHdnmdbLM7FzfsU35xf8M9bH9c3tIb
 JZJ27lXqWfA6F0ngSMuz932diraWU+PnW6iR1/NpKIweykNDbmRfFepU0AhoIW6l7S/D
 FvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QNOFr2XLQaGiWnEvDCyuI1miJPyjLHa9wt1opfeIiGc=;
 b=HX4tv3M3xTvvX7+VRIIoRwu/NBNWWgD1RnmRHutgZTtowH6NUl4ksZscuN80IbmsmD
 6IE8lX7/diAQVmSKum9c4WFO3+Wpay6K/tN4X6wX7FvgH25woobVR+lu7ad3wtJwhLMA
 Uf6Bj/bk3FOzY7sJQ7fGmueufdaOCch0+MuX3gRCdRLc8ES9vFTgSsmP8bbq7sxQKz27
 KAs1o6jUfxXqMjNw6qVi/qpxfrqWhRwL7et1CRFmppS5zj2CfxMl7ztq1e7h06TsFhkk
 wSev0aIvSuceMPJhgT5sc6fIS3wbIZ6qP4kfWEuKSfBA+LvTB2HqThIsMJXX+A++Ebe8
 nbBA==
X-Gm-Message-State: AOAM530v/mBoW80Z/8rlI5pIvYuR5EvkogNFrlvuIaj0tZ3ev6ww4od3
 J6wZyFStb/5scKTim1EK71JcAYAzp+1bN3kPoSdE3lO6GEI=
X-Google-Smtp-Source: ABdhPJx7Wi2zZmBCdmPIfi1xeTYmF7NNbpRrVNqI2/6S01juJ7nHrbSvp+AXVtwHG39qUg2t5X/KgTG/ZHVjb1HO5e4=
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr11254978ejb.382.1611847546052; 
 Thu, 28 Jan 2021 07:25:46 -0800 (PST)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-6-agraf@csgraf.de>
In-Reply-To: <20210120224444.71840-6-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 15:25:34 +0000
Message-ID: <CAFEAcA8hxS1WFUpiE1nyHPXst9oaBSk1Qo4rxKicX0qFaNH4Ag@mail.gmail.com>
Subject: Re: [PATCH v6 05/11] arm: Set PSCI to 0.2 for HVF
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
>
> In Hypervisor.framework, we just pass PSCI calls straight on to the QEMU emulation
> of it. That means, if TCG is compatible with PSCI 0.2, so are we. Let's transpose
> that fact in code too.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

