Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28354AC93E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 20:14:17 +0100 (CET)
Received: from localhost ([::1]:51652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH9Sq-0004TW-E4
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 14:14:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH95d-0003bF-No
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 13:50:21 -0500
Received: from [2a00:1450:4864:20::42a] (port=38456
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH95b-0004Hn-3w
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 13:50:17 -0500
Received: by mail-wr1-x42a.google.com with SMTP id s10so23935527wra.5
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 10:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P2FC6R/qncYnzfDtFi14toHL0QsggYnEdnGfwN4yeEo=;
 b=sAGtAUmGXFinGlJF/K5qJlHp3tARYzXF6XDvitXixq9G4N/eaNcEGBQGRm2vfTHMYi
 gTO6dmhUYjs20cRHXkwbG0ze1vJJmfxj7jUuaf33EM8M5hnd1UMnB7+yOJxMunty/uqu
 AO6kVgoVK9y1iw48w+3/JR4kv1uGqVeAD3Ju+8UjK9q6ihXw7ldSL0Ilpu2iqpEPlHQ5
 JWzOaoLEMaJ3uIEAWY4LKbdj6mVSQOd0l7kn+tnbPxHI4L3lFz4sJyO9tIkn3ScNsoGP
 elkYWf4D0zueYIuPqxaUbXiCC/h8RipFbAB2L8USrNDYE+wlmUY9U564PF6lETLFCUH9
 2Kqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P2FC6R/qncYnzfDtFi14toHL0QsggYnEdnGfwN4yeEo=;
 b=a4fxRh+UUBuYjwKVyaODbPATjrRvDXyUOzRHwuj5FBjKFXGkVYfAWQGZUGQmqIUCZ/
 09B5rmO9rjoRbimLBn86JmLrIgcCb0aMIFED0k9+7Bw6ZyhQjnvl2EaFQ2wUUqOBU++l
 UqEHpZikZGBaBkAaHoF1wCBSec/5vZNPIhp79NbrGIYsUHzGu+gClZIUMzTCPPrJQDDZ
 t8vaqAJIicojMZ+97wc2Jz80+g+O07jY6tl+J/VohhJxhhplSgc02xilVzF5ZmoFIo/G
 sUFQCqKHt7kG9MUF1bhPFM2w6QRBbTViv1JHJei4unb2t0g/0uZyQgpcLAXe4wimCRt+
 j8BQ==
X-Gm-Message-State: AOAM533Qb61FkK148cQKenEN4sbA0GFZ7hHyVhpdVy6Zm5qcfTsCbEpm
 cTSOQ/ndGqdfUOgqoZRMffHaOV01rwDGAUpW/PeBIw==
X-Google-Smtp-Source: ABdhPJyYKz9tesRwJ0CzIrDpU7/5FZViFRwe/p+AgmKKC02CekqtgknFFxPqOhGwAxofpH5cMCU5yWvBiAHVQvX9Cng=
X-Received: by 2002:adf:e18d:: with SMTP id az13mr649289wrb.521.1644259810838; 
 Mon, 07 Feb 2022 10:50:10 -0800 (PST)
MIME-Version: 1.0
References: <20220130095032.35392-1-kevin.townsend@linaro.org>
In-Reply-To: <20220130095032.35392-1-kevin.townsend@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 18:50:00 +0000
Message-ID: <CAFEAcA_zKc-BCkW8nXJaavNak-tpE6mYzAYPobBLkCb6ZGgYLQ@mail.gmail.com>
Subject: Re: [PATCH v4] hw/sensor: Add lsm303dlhc magnetometer device
To: Kevin Townsend <kevin.townsend@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 30 Jan 2022 at 09:53, Kevin Townsend <kevin.townsend@linaro.org> wrote:
>
> This commit adds emulation of the magnetometer on the LSM303DLHC.
> It allows the magnetometer's X, Y and Z outputs to be set via the
> mag-x, mag-y and mag-z properties, as well as the 12-bit
> temperature output via the temperature property. Sensor can be
> enabled with 'CONFIG_LSM303DLHC_MAG=y'.
>
> Signed-off-by: Kevin Townsend <kevin.townsend@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

