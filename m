Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC933378DB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:11:45 +0100 (CET)
Received: from localhost ([::1]:45062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNua-0004uM-Oo
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:11:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKNmh-0002yT-7w
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:03:36 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKNmd-0004nu-79
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:03:34 -0500
Received: by mail-ej1-x633.google.com with SMTP id ci14so47129291ejc.7
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 08:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xIltOnOw0OhbOnQOlY5JdwnZyQr1khAI58+TcTygT0E=;
 b=fL2cVV+vEHecfg3Oz0EpxRxULpbLJRxLMIHEEQ0+uM92mbMjOOgrJUffJCtQWWtncO
 TPIeGyzkYrZvWf47Gl21NCvtgszj1UFXEFGt8CKGxcH3vz2f7x7kwEL5a6t9VYx9K9G8
 B9L0GUOBwJu+1Ub6/6Qaiqz+aThrRccZ9LCuqmPy1MU67HlVFbVPN+l1/JKJYQW5ZS+C
 wTcDWHVHGGjoEfVDyFpyVvOlsgqAjnsnrhKQ1ccZW3De3JnFRgaKX7CQCnf20JsGE9+v
 Dyb8p1nluprhiPIb1UZL9owCIrEQDB2qJ/hWsPW5CfAQw52X7uYL+4DhAyEO2jASrWbD
 TNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xIltOnOw0OhbOnQOlY5JdwnZyQr1khAI58+TcTygT0E=;
 b=j3m7pPtJWj330EPBFf9PpjNCAaJDTObYv1jcOj7WJcolDnIoyOu+dpP8mxGFa6EI0p
 wfY3RuZik8mVeKCnesE97bczNpEDmPkpKIyL+8uqvu5viOL5PxyS1k1P/QTAL7cEjtTs
 JGa4hvIfdFb0v6iKWL8n+O+D8XJrVL3mwFqOrWYfiwJKqdHxGlrDWY/QBhKZDFosIsHX
 jkBwIeLPmX838xQkQ+hpMQrdrazPr1qZNT8Yt4a3Dc+CMDusI0CxWzRYfIZf8jgvvscu
 Ng417ybv76yAnJA2dGO+SVttvHNhnZNaG03AAPT0vMK93Iz5BgizwcUe83ijZsu6KGa0
 kWVQ==
X-Gm-Message-State: AOAM532haot+P/RGr81r8uTY7SKYDpON90hn0Tg7ShB2JyNpNQOZYelV
 FMq/oUdknINQtYhgVVxelf7MVR9Xf/vFB9TVnMDOaA==
X-Google-Smtp-Source: ABdhPJxNsMaALr13Avj6H5m4Lq3HTet8Ed1sZ72o3VBfML1xEIwoZVyaP8eTgcDtO5qy6pONJ7NdAmdjANIuYOPU5Hg=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr3782681ejg.482.1615478608825; 
 Thu, 11 Mar 2021 08:03:28 -0800 (PST)
MIME-Version: 1.0
References: <20210311151512.22096-1-akihiko.odaki@gmail.com>
In-Reply-To: <20210311151512.22096-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 16:03:10 +0000
Message-ID: <CAFEAcA9_Oe0gsy-nazOF73Cxs0HC0b+gf2R1BxKbMh67ZK__pg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] coreaudio: Drop support for macOS older than 10.6
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Thu, 11 Mar 2021 at 15:56, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Mac OS X 10.6 was released in 2009.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  audio/coreaudio.c | 103 ----------------------------------------------
>  1 file changed, 103 deletions(-)

Yep. We already assume newer macOS versions than this in ui/cocoa.m.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

