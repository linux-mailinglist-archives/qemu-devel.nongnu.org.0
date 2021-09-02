Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410C13FF070
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 17:46:10 +0200 (CEST)
Received: from localhost ([::1]:38656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLoun-0000qY-AU
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 11:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLos9-0006Tx-KM
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:43:25 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLos4-0006Bn-FQ
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:43:25 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t15so3667629wrg.7
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 08:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LeF1K3osuMTBKiXDw7r//xClb3Uyr/dnaVjzcfliZXs=;
 b=vU4QJRsjTl0lzMLp+gI8KmvEw8/FgS/BG5Y54BvvDy2bfHvQoiznhvY9CFljobgqLv
 mnn2lUiPtVDYVp3RhIR901u9XpLn7K+gkeSVw/7jNPm1Jfmndj7qborLgLM7Zw0UmCbl
 UQQvcFCy8s90F6aODKuJ7UpqCMiFq0W0NSpO/2+B+gsWz5QWeLMGWlrFiUAbuzbtMAgE
 PxKlVFrtZHcA9ZVh6SVgn5MP4kuriyj+g1zzwakMLVHvgyCQt/q6Kl31lMM6GcDLCfZn
 3xrSPlPL6H1bsTvo7oANG8lrVRNRA8818gIH6F6wf/G09sNnnbvcgNf6dyEB+l5Ob5zw
 uZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LeF1K3osuMTBKiXDw7r//xClb3Uyr/dnaVjzcfliZXs=;
 b=oZyigSGKNkLzTBbaWqx1VgfB/dowSCsM264DPUNxEKxDPIihE4/fwCQIVd+SBa4z3w
 PZ39n4S1Uy4Pl8yYbH/Odtl1Fb72ZldHxC9tBhPraAZ5jhulMF9KkS/6F7iF9w/ThLrt
 ptIQnkOez182+pTHj9mjAZq8/S8BHmCE7FtfK5tBG9wi6vkQceCezvUYv2N50Z7x8LRe
 oMj3/HsRVsSe8V6wRB21Z+bzhfp20ESrakHJxpm4gbWdivYFsQ1GPPKpNLJlYHLFq7ps
 bpmUsQP1N+K+EGDafWz5lDGRZwg8fHlggFQMTZnPtqvTox0XbXrIahZAaUymwjD6fJlh
 HwmQ==
X-Gm-Message-State: AOAM5338V0XFjAyCtqZjAlkll0Uw92z/MNsx3Whe7uYIi6kXjC0Yu4tL
 rFS6MEVbeGebjky7CczyRymTEN586xj0UauMe9ZpjQ==
X-Google-Smtp-Source: ABdhPJw4iypolbQmCgratPkowqxyCsdSy9ERy84QBW/Al4rg6IuoklILZ/ceFpOuoTxpKH/bBg/rQr/BW2GLj1E3gEY=
X-Received: by 2002:adf:ebd2:: with SMTP id v18mr4754567wrn.248.1630597398911; 
 Thu, 02 Sep 2021 08:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210902102205.7554-1-mark.cave-ayland@ilande.co.uk>
 <20210902102205.7554-5-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210902102205.7554-5-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Sep 2021 16:42:30 +0100
Message-ID: <CAFEAcA9hr6r-QpGQL_JmDrcCHJkTJdD8ZWKYuf8U+2VA0jSCPw@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] escc: introduce escc_hard_reset_chn() for hardware
 reset
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

On Thu, 2 Sept 2021 at 11:33, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This new hardware reset function is to be called for both channels when the
> hardware reset bit is written to register WR9. Its initial implementation is
> the same as the existing escc_reset_chn() function used for device reset.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


The datasheet says the only differences between hard and soft
reset are for registers W9, W10, W11 and W14. I wasn't expecting
the functions to be completely separated out like this.

-- PMM

