Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF4D442056
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:53:14 +0100 (CET)
Received: from localhost ([::1]:46290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcQj-00018E-Kj
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbG3-0005wb-K2
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:38:07 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:55035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbG2-0004tD-6r
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:38:07 -0400
Received: by mail-wm1-x335.google.com with SMTP id 71so11554343wma.4
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=okFKJxfEIGVGgngTA6Lo4zgML9Fu17at0qBnc+vlT9E=;
 b=cVUEc1+2sIZF/UrUq3ABINu3A5nHbqgWqgl8S3w37QMCFT8EJrYpVObCQaOFkF1nFW
 21uy1NlR06kXjeKFcdcr2UKMl+YKX14vyFa04rG+C8K/Xq6mcIVEsLO7weJ97a0uxTYt
 Pf7zGtczJhixeghIxYDOVmO9wafRn+bNx3DjQ40Y9FM7fg5aei3Kw2rYSZ1JnOYqv9aE
 GlFNMavmOFdjfroT4yFK/WN0OEev9mV9xehWK61KIZJUDMafSVw09Y2vfh339eIUnSoh
 GjgoFb0FXKzGiDZ+OGIqr8S9Ft6XCN3fsVI9Q9hL5FGh/c8eD5v+bVvih2+tk8cyr0BS
 3Jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=okFKJxfEIGVGgngTA6Lo4zgML9Fu17at0qBnc+vlT9E=;
 b=byZUPF7m4Thep8oseYQpRIcTBIOGUPqsmMNj4ZVN4/TLYHWbCXnG6ocQ2ZgLY+B5md
 TLqOUI9h5RdRrr553a155UPY9/uaeyaIQ96vgECCzAJaLi07GbEDHsfvqT8QHsPwqYec
 aSL2YKC/vHS7jVbnttkEMfI9B/z5VfZEVBR4PxMA9BKN6bcOOVTx/quzynHKEn1gkR3h
 Ftm+aZ8M/3B/h0NBnQTsvARMN9BdBv5YS9cYmVrZDoot0GZYj310ja0THq9tIr3PZYok
 0t1chidUpn6GThxKiFRl89HCsqwuUSREiwzCTXjEpWROjjFE8eBuSyrqjUVNdEZrXFNU
 S8mQ==
X-Gm-Message-State: AOAM532fb9JyI0b1Xkbew5MSojKx10LJ5hvWYrY0QTj5JnMf/LNEH5jq
 ufUh4M22R1t0ycw6+IRqiL+H6gDWOlecWQeQu4q1Hg==
X-Google-Smtp-Source: ABdhPJwXcfsjQt9O2qwmdxaYNUJstWxRe8R8VNqD/oO6Ghabw2zRJ5ITNxgPpR9hMfNNAfMNhlZsKFfvRA32/CPln88=
X-Received: by 2002:a1c:a344:: with SMTP id m65mr378552wme.32.1635788284653;
 Mon, 01 Nov 2021 10:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
 <20211021183956.920822-5-wuhaotsh@google.com>
In-Reply-To: <20211021183956.920822-5-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 17:37:53 +0000
Message-ID: <CAFEAcA-Vq3J2a24_gRc_SUJ0Wg63iVfMi3OCzK7TRe4c9uHM_g@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] hw/adc: Make adci[*] R/W in NPCM7XX ADC
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Our sensor test requires both reading and writing from a sensor's
> QOM property. So we need to make the input of ADC module R/W instead
> of read only for that to work.

"instead of write only", I think ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

