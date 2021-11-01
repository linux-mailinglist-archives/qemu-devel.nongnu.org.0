Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6103B442068
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:00:19 +0100 (CET)
Received: from localhost ([::1]:39270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcXa-00075W-EN
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbDd-00009B-TN
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:35:37 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:40853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbDZ-00030i-Od
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:35:37 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 j128-20020a1c2386000000b003301a98dd62so9357703wmj.5
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FpqrVMnRaGIkQcaIVW1lMhgLocr72K8h0lyU/MtbS50=;
 b=NDU8F3gwxuiPraiv7NQOdaM+aaPpPi2lYo5QnIGHFJeuSJNFrzi4A2isXsizUYZCbc
 KeCxon4qHLvGoDx764RQPL3DVT8heVUt844zUNIO2kd0sLlEisTMUW/6UrPLrU7RJcvm
 d77jR1z3gEknXjRwh7P6112fyLieqaGE6giTioCJgch5c3up12z57WAuFZme0hmzqMWB
 in6OdlFFKy7Z+aYankcYW7prjklPLmJKJZFeA7cBgLP6A8n5XGSAuhRcr36KiTH8sq8c
 01o/6Us4gI8USZlmozXRw70ZPc5Q/LSneUg9rDlT7+ddrsr3i3vR2PIB+1qeuYK/AXD2
 GbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FpqrVMnRaGIkQcaIVW1lMhgLocr72K8h0lyU/MtbS50=;
 b=mi1xTCu5onbN//JpvuYc6vKARMy5ak7QvgEeCvetUykefIG7vwX74xi6OtNXGTN1wK
 mttcqJH7i9GAEL8aThMBD2+74HbxiyLR8gZEVckvmOejSuYInYbpQCIneL9YuL2J3Hu9
 6++684I1nBytsCnU7XfUxMcYNKamV+702odt8QrPFjU1HSdXeJCiUBOp9ZEpuSFQNqbr
 tGbJy2oK1tqkgB4V3V7cIAcGvxASlPSvTv/Vrdol2QsI17g1btORh4vtzN87E6DbZf04
 +c4tZ4WXaXz9bLIP9axPntQ2Q8icfrc3/XBxFbxhZ6CpJWhzPmyoCkcqoo64pjIJP7dx
 Spew==
X-Gm-Message-State: AOAM530UKgysteFKk0zNarrr2SPiQsyPgtWWtyqDAmSwIhy+hjXAaWeI
 9vsydEy3TSTi0bxnXq/hB4zOK2ifq8MD6h60z+zUoayWvpY=
X-Google-Smtp-Source: ABdhPJwrrmQ+Mh/LFwTHjPcyguLIBxZIDW2WJTpjkHmRHhhfVF91/l7fq4AqL8IPcIUR5m/hmzsarbgWaln2ahlwU1g=
X-Received: by 2002:a7b:c389:: with SMTP id s9mr303206wmj.133.1635788132250;
 Mon, 01 Nov 2021 10:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
 <20211021183956.920822-2-wuhaotsh@google.com>
In-Reply-To: <20211021183956.920822-2-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 17:35:21 +0000
Message-ID: <CAFEAcA-junQQFRkge=7mRtKev5gpDgYeCuas_ooZAJZbo4QWgw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] hw/i2c: Clear ACK bit in NPCM7xx SMBus module
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Titus Rwantare <titusr@google.com>, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Oct 2021 at 19:40, Hao Wu <wuhaotsh@google.com> wrote:
>
> The ACK bit in NPCM7XX SMBus module should be cleared each time it
> sends out a NACK signal. This patch fixes the bug that it fails to
> do so.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

