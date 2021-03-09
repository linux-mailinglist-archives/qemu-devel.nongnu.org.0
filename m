Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AD233240C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:29:22 +0100 (CET)
Received: from localhost ([::1]:48114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJaYE-0003xF-16
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJaUc-0000uH-PA
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:25:39 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJaUK-0003wd-Qt
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:25:36 -0500
Received: by mail-ej1-x636.google.com with SMTP id ci14so26593943ejc.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 03:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qu8LIywYOIzZvDt78SEgDHp7jlWYi1fBVEwwas25u6E=;
 b=pN0iwa733fBAKqQLh21ER4+WGnhQHFJ6jQTPUR3m1cd1REid6b4ixOzaPPFP0Bp0a3
 HPc2dHFVn+gmGX156766dWJDV1R6871Jw1XR3HbXV5+YHIl6cE6Kh+elQ0Y94hRiWsG1
 dYYFbV26LAme2gUexTf5BoSr0R0bVboMYDg4D6XrYKSD/yMnxqeTF36+ZW7JkyEGYX9K
 EG/C+e+lum/PrJDVjKFJD4nQeWfgORF0LhiOjq71UHCW0PsJWZynoibSB38KLZaUPHKL
 SB8uJe7e9ELkHE7EzOVXvtTpCBIqQYF8lesQz4pnS4gaaVpI4JvoH5kBW3xliocv+1L7
 O35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qu8LIywYOIzZvDt78SEgDHp7jlWYi1fBVEwwas25u6E=;
 b=Q3CsXHPudEcQ1M5PVcRmXZBXAZLbViJc7MWQCGhRZFW4dA9264DJC6CIWIi7rSa1pV
 d+6OH2ngrslwyhUYREyMQfb97dLo0zvsTjN4aVfyaW2E5kUjw2XXb7oz7giPSvlZIVjq
 9vBmZ6Xg7njqDK6Y2jTNhOs/VBO6E2UAWvBO/BjtQ31Dv7Dtuef05vn/XxC5M1CIFOzE
 +t0ybu+h4vsr+JhvB4c4XuQq4rmG1PY0zvqVsEwxdIpiowDo7m2hLJcJNOAOby2XVCja
 5NM1tUVE/MsK7hX09E4MKjmowaVbzD51rk+VyIoVuLcRytj3t4KqRQpiZs90XrZmMxZt
 nyfw==
X-Gm-Message-State: AOAM532F5XYs76W3DTzFXe8WpcQe83OioadHZ6Q/ocsaKzSR/7B8Tjea
 6YG8TlvjRv7O+vQ+LOZ6aD13OxcYM6FmBdC87G8HtQ==
X-Google-Smtp-Source: ABdhPJwHY8z7bheCNwVm5EJNJR+d0VsdOO6vC4Yi5g7uasHcLB0hgKIWsSgQGe5DMQOgv5EeQHfckGAJmuHqbSjUmkA=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr19994132ejg.482.1615289118062; 
 Tue, 09 Mar 2021 03:25:18 -0800 (PST)
MIME-Version: 1.0
References: <20210309002741.85057-1-j@getutm.app>
 <20210309002741.85057-3-j@getutm.app>
In-Reply-To: <20210309002741.85057-3-j@getutm.app>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Mar 2021 11:25:01 +0000
Message-ID: <CAFEAcA-VRVS2Yy3YW8A73MqjE=vCGfW_wZwCg9mBW2w1QDtNiQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] block: check for sys/disk.h
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 00:31, Joelle van Dyne <j@getutm.app> wrote:
>
> Some BSD platforms do not have this header.
>
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

