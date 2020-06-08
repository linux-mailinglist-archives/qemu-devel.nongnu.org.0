Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD941F18B8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 14:28:13 +0200 (CEST)
Received: from localhost ([::1]:35422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiGsu-0002vd-1W
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 08:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jiGrK-0001nC-OW
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 08:26:34 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jiGrK-000328-3W
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 08:26:34 -0400
Received: by mail-ot1-x342.google.com with SMTP id n70so976267ota.5
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 05:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h5roUSMtNRKPasYu9gHcSMFWr8D6wdYeu2hUrSBiw9E=;
 b=DzUpul/fzhinjZSjllkFwAGtaHoXPzwyWdQyVH8CzQl5SdW/B4A+2rB0vzy7R58Z1F
 p2fQeC3B9eBjVYjIT/3zwK7+sNIFGwUvl/g8KqVX0oBJiRw32ux36Dv28DZceVkcxwr5
 rUmEgNoRLDgk6krx7oE2o7daxe8GT64Uz0NRm9kDxVdzYVADU7xBitkqb2mrcsWV2qCe
 vl0LPLEe6gbUZ+yOYEbnOEPtFmWyooJk+iKfcLOeWy8HTAWU88oyIftMt1SUqHxzLbnF
 rZIZ7l3BgBNdOxM1wcpp3QSd1GiAlBjQ5NcUDiaX4S9a9Fk9Do9hg3or6TJfUBS+ypWc
 J2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h5roUSMtNRKPasYu9gHcSMFWr8D6wdYeu2hUrSBiw9E=;
 b=p3O7NI/y9m/V4CefRxUMTAmR3I/2J9TxbyCOI363s6YcpShqDEOf1yB344nhL2CzLv
 zFrL1vhmcQJPNag2t1LUyKyczH5OskXaH6hsoLRjcb5M3HrIdSwN1RcI1XiCt3PPwp8h
 ihMfyBw5EvK+oiOZw3z1pe8/IbTlPrw1eoipoMEGAwR8ixHZ1cb8v7Dv9NKb2gtDuC3U
 pZCARNUYDVRenHQFPWNFWwM9HnXWVRzjOgmhhUbJVAA0fCXvWwr9T7a+JSe9pL036MZ0
 A026htBaQn/VzcIVZRHZRt5kDRa7GvClnVmr/3nQkv9tASpV5fILw/d6L5r7ivwrp/h0
 Abpw==
X-Gm-Message-State: AOAM5317SwONPZMWVGqwqAma3Nd3Co53XCrYy++ZYauZGuk2CK1wiOip
 IxETrxQrZevtDQbGxAh3rfSrL28xvmmAt+OVjRMNCQ==
X-Google-Smtp-Source: ABdhPJwQQaggUmneiRdkHYPaFecYRtBMEOubQcShjsXIrYylf3jERdtHNwq6sQP4fnAYwv+tGnCwFqpjrMIlAPMSpeU=
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr17842999ote.135.1591619192920; 
 Mon, 08 Jun 2020 05:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200608114028.25345-1-leif@nuviainc.com>
 <20200608114028.25345-3-leif@nuviainc.com>
In-Reply-To: <20200608114028.25345-3-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2020 13:26:22 +0100
Message-ID: <CAFEAcA-a1U4AnMpN31Ea1TJsufexTGVtd2LoB-ZW+zgpwTYK9A@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] target/arm: move cpu64 cortex processor common
 init settings to function
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Jun 2020 at 12:40, Leif Lindholm <leif@nuviainc.com> wrote:
>
> Move the id register initializations identical between the platforms in
> this file into a standalone helper function, and change the cpu-specific
>
> The value of mmfr0 set for a57 and a53 violates the ARM architecture
> reference manual, but matches the values set in actual hardware r1p0 a57
> and r0p4 a53. The function sets the architectually correct value, and the
> a57/a53 init functions override it after the fact.

...and pulling out the ID register value settings into
a common function is definitely not something we want to
do. Any new CPU should set all the ID register values and
we want to be able to easily compare those settings against
the TRM.

thanks
-- PMM

