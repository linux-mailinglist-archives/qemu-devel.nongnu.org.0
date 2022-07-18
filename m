Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AA45787B6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 18:46:27 +0200 (CEST)
Received: from localhost ([::1]:34814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDTt4-0004ME-HS
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 12:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDTlJ-0003Sf-Mz
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:38:27 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:44595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDTlH-000382-F1
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:38:24 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id h62so21716483ybb.11
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 09:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z6Whybz5Y8fygdrdOOcEzogtCM//dGMyGo/D28Y8WpE=;
 b=nHoCHwhO0xPvD8zSUmoKzv7eVKq21hwpUqkyJl+z1tLaUUXVD+vOCGFR61FJo5aKZn
 Vz1HkMtbrKlKddldZ7etg7ksodnGvgxsopJteVlXGqqdzv5fnzLdunoW1j6N0vbRTXya
 kvFbQCbjUFN0HT4ohYG3z7bEBgqolBL/L7exVA5IL1IVLJnv0TGW6FxrsMpaeC6Vi5yc
 ftm6kHjz8DBxI8Us+d1l/vjxFdW0kL0F9pSgc/+47OwPRgTdeuAnzz9/I2nQ02CThA3/
 7dxA7bxwh3RiqFGwpv+DxlTRh0k2C8dgpMRuKqNVsiBm42fbcDifyKYOPb9LfXE8tOB6
 TbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z6Whybz5Y8fygdrdOOcEzogtCM//dGMyGo/D28Y8WpE=;
 b=CBRFr/Iy7XvMhDpdVqntByGXMrYJnJech0Qj1XO9ls5tkTAKYZjPkdCp+u05UHa+VU
 XYfHVOhcexN+z+oMkxNkC/DStsIXcTOdPSA0Pd/fVMblG/CfEIdncnK1CmbcHQISj8dG
 ssWeSwtDut2UPKphBKYQL+1fsCAk5b0MZRyl8rMK0xVeeZgSU3HTKnuMpI7mDXi7IuRp
 srk+Dgh3m0e1LaszFGq/bfW+0YXtZDTgTWSjqRGrgrddYYa9wJOJeRD2CB/Dq6eYx0qL
 AQ0ojQFh/zY4GlmZ/j2qcfOZNnTIGfpg9batdS0WwpAShy/0jiXxIxtVNn4ya+JhgFH4
 3klA==
X-Gm-Message-State: AJIora8uxl3Ab9U9UnZMzXU9AB9XkyWMUTO738c8kU+4WPr5rho+ReLo
 aOjEG1bE2Be5YD1UAKEIchJH3JohAoHsXv7QdRgh/A==
X-Google-Smtp-Source: AGRyM1vIfAuyCzdmTF+eiD7pYVGv72YuEMPCGLZpY5kvE+08J4MqQ6jZp1eqYksGL84tlzxwCTYXQ1ImHlvKfQ5PFuM=
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr27069629ybf.67.1658162302274; Mon, 18
 Jul 2022 09:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <YtWLeE8C4uutvgwP@p100>
In-Reply-To: <YtWLeE8C4uutvgwP@p100>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 17:38:11 +0100
Message-ID: <CAFEAcA_M1b65_grO_f+k0gVEwNuZrwB7ZsiQYUkx9qZW6zMTYQ@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Unconditionally use pipe2() syscall
To: Helge Deller <deller@gmx.de>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Jul 2022 at 17:34, Helge Deller <deller@gmx.de> wrote:
>
> The pipe2() syscall is available on all Linux platforms since kernel
> 2.6.27, so use it unconditionally to emulate pipe() and pipe2().
>
> Signed-off-by: Helge Deller <deller@gmx.de>
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

