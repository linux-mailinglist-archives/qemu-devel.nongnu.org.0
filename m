Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70629320D33
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 20:37:03 +0100 (CET)
Received: from localhost ([::1]:51704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDuXO-0007fj-I1
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 14:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDuVk-0006c0-HF
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 14:35:20 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDuVi-0003ZG-Uj
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 14:35:20 -0500
Received: by mail-ed1-x52a.google.com with SMTP id g3so19222804edb.11
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 11:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NsfVXJPHjYVcjYBoQx7Un3Z+oQFrsFn1tzRzBLdjfpE=;
 b=rkcqHaSLNj/eUiWmbvnzwxfoqE1A4exNxFwbvHtdm8iEGwFQXbJZbtKx1YXkm1n/vc
 E1T0lMeYHJGeCGQBs/+JzdESkf17fPH3+gi0PnFCP//kk+gzXNfDMP28fjks9vH1NWx3
 iOIBZtUeMrZaR5h3uA2IRVR3BJi7pE1tKvxktV934fB4joq416eiePUSuBh7YrZ2EHaO
 Oniyzp3VcAQNZWH1g7kfxlaEuNNClrl4rjm4eZgjUBFvDIwJyhBOKGzBAueM/vj0v7lt
 0AndJ9qZ1xTtXKFmo5syuRo9JBfl5U46i5a3/IiCdKp3wWPznRnPrj3InpoGIe/h+dTi
 guCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NsfVXJPHjYVcjYBoQx7Un3Z+oQFrsFn1tzRzBLdjfpE=;
 b=hDf2zLP2nEOqXMMHu7O+mYMyxhNjMsRiMq/AfboST6YH2DdbmBw2YnP8WeV2/1TlXl
 +L2bg24jUHXBxMIu6rRTsk+2Qt7fh+/1OOUkeyybSuTjxFf/sjNblzbJshZ1FzdzqliJ
 xg9PeWbmbE7YLXE0L/ZZ0PatLKybP9+jJvp/rTHqxHLVpkDOoDR7AjKXU7wGcxr2cto7
 JoPc5TTikhyZORU2PlY75SNiHCBIdP1uSBTVght+K5t1N1kp3uw8j4n4gzHz7mBmmx3G
 CIPfkbQ8inId2FuqeQ8zwPfOIMPm6/cPtde26fB/OvIaw3Jkn/I6Bw79sUbIKrXvG7lq
 K6Ag==
X-Gm-Message-State: AOAM533fhjz1Sbl69TXnEZcMyTS5KZ9eSmUYscWVqxH06qz97woHy8GZ
 FbHZtlzvB+n010I6nflYkQCa+EirFxaJC/hvZDXqDA==
X-Google-Smtp-Source: ABdhPJzOoCuAAKSamd7k+U/rSAeyNzsc94lYHvKthXVGfLuHJzLRYpOBkIDBa8KTlGopipZtk7rcuksh5NhlPCIVu5U=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr18802404edd.100.1613936117509; 
 Sun, 21 Feb 2021 11:35:17 -0800 (PST)
MIME-Version: 1.0
References: <20210221173059.43498-1-akihiko.odaki@gmail.com>
In-Reply-To: <20210221173059.43498-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 19:35:06 +0000
Message-ID: <CAFEAcA9E73_a0hEMV+jFm6YbcOz=hFR-NyYKa_Roisw_MR_cNg@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Fix stride resolution of pixman image
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Feb 2021 at 17:31, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

In what situations does this change make a difference?
Obviously most of the time it works fine, or we'd have noticed
before now.

(This is the kind of detail that it's useful to provide in
the commit message.)

thanks
-- PMM

