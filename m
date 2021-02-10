Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB09316E05
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 19:09:19 +0100 (CET)
Received: from localhost ([::1]:33552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9tvS-0000GR-8i
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 13:09:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9tp7-0003nc-Td
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 13:02:49 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9tow-0005Kl-Df
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 13:02:45 -0500
Received: by mail-ed1-x530.google.com with SMTP id c6so4103065ede.0
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 10:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=Mr/GYDU/gCtPFzv71SqwdZgnAPSyfR3TyCypfVPXY10=;
 b=J1oRp+pfT7qDgZWXnAm8QSaQNOcFIkZlYO+Az2Yol/fAWYg4OCjxOM5A8jSTJIcueQ
 WxRGG3QWjmggQNGYlVAYUIswNG1JbzQLSOS5CuAeq5MqWghMli3gsRf4Yof2wD3+tj62
 i7pDMDcwIe1AnlNXUUlqs0F5NajLpQIECSTWAwWyENCZTj3uGTpvZF9+OYqzuxndxkFM
 RqFebrsuFovfHZ6q9r9yK771u6bk0irvaL9rgolbHzVpF2mhfltXrEx5KTByBEooTBgV
 n+xFjHn3Qcabp0weeLsFOi2g5bFBwJ1nSH0KFxqVXnt0CWYgb22tqad+BRDKdT10Xqa3
 6+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Mr/GYDU/gCtPFzv71SqwdZgnAPSyfR3TyCypfVPXY10=;
 b=jPjMth2OvZROujNGz/UMfYi6z8ajs4BRe9sylLyU1qhE1dNhKsaNFWqC6Eadz5Uqfn
 n0bGZCqImb7LGdCtSv9ikNVlwdzPSDJxOvSMgVF8/LppO33zI7YbI+sHh9NZof8fhZen
 FV6zYY4QgczG679sUIgZ7ncziMyA4xk63wpqnuEFpz6cQLT/KlRfHFfXObMde2KPly/C
 KAPfHQ8i8lj6I9giOvJfmvXK07q3BGY9O0zyYdiBuvxfGdI9v24RtRXitzxaUIS8PaSW
 zFsqQnob3PHmjG4sIpvcG9zBXMsw9dKi6c5D3EYDKxfZeUgWrk8E07AH8a+UM/pLHCui
 WIJg==
X-Gm-Message-State: AOAM530ZgEPZf6S1oP3IGQhqCwbCBr+UZcBN5iPdrc5Lf2sjMbw5NYNe
 i7LO0GY4Pl0jM+sbmZSXKySLVFGx2WumHmY/0xbNxNcgBGY=
X-Google-Smtp-Source: ABdhPJzldmhZgem0NJXtwaPZmEhH/sApVoSu2gPiO5bbO+Xm2zWvMSwdhDHTAXnCbB5qiIj0BchTX3f8BkyfoW5SO58=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr4344628edd.52.1612980151470; 
 Wed, 10 Feb 2021 10:02:31 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Feb 2021 18:02:20 +0000
Message-ID: <CAFEAcA-DZJDe+DziaT9boPObnpnqyLj+-4-S+1ikFbqr_U-SDA@mail.gmail.com>
Subject: can surface_bits_per_pixel() for the console surface ever return
 anything other than 32 ?
To: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; I was doing a bit of cleanup of one or two of the older
display devices based on a note in BiteSizedTasks about removing
dead code that tries to support bit depths other than 32 for the
console display surface.

I notice that as well as handling surface_bits_per_pixel()
possibly returning 8, 15, 16, 24, these devices also seem to
check for the possibility it returns 0 (presumably meaning
"no surface" or "no surface yet" ?).

Is it still possible that surface_bits_per_pixel() could return 0
here, either transiently during system initialization or more
generally, eg for '-display none' ? Or is the 'case 0' code also
entirely dead ?

thanks
-- PMM

