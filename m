Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1DE5518E1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 14:28:55 +0200 (CEST)
Received: from localhost ([::1]:54930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3GWU-0000Sp-9U
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 08:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3GUK-00085P-NG
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:26:40 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:41674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3GUG-0000QR-HP
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:26:38 -0400
Received: by mail-yb1-xb32.google.com with SMTP id 23so18663049ybe.8
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 05:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EeBK/uAYUItsxJotbQxV1mCakwWSeN0wMlVpCt51krY=;
 b=Nr9A2aW+x5gnxDB5bjeM6bVZiE9RPwD0U4av+HzrOThmT9VSUOSpXj0+hDCozWUPHr
 r2vmV2dsHD6FEg019nB1fpI88q89tJRla/pa2xR/nsm5VD7wdB1NkxYKMlE/gV/OBKSD
 EOJjFI+uPVmd3VeKMduh028iisSRxpJAQsKqEAaZ0bcWX0Hihnn/4PRQ84nIOOqmfxIB
 Nx1Y+M0P6XYmOaQY2Uabm1Jbd/mF2UnMBLhG12JvG9InFSjl2RzsqxcLgrME559VyN9e
 DG5TwfKfQbQ4BWMgFHtBY5gd0oBQHjAphKY6eAITVFc6yqW0Ss05AdUIIYyd3Q++c3Pw
 2y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EeBK/uAYUItsxJotbQxV1mCakwWSeN0wMlVpCt51krY=;
 b=STWcgOi1sFJpT4qv7L9AiP8SfwtYT3xr/TOmOXlroP6X/5gYW0x4XF4VYsmR3pb4Bt
 F/JgotSFe8t8hPH34AZ3eRsykZQVnEcPZvn8Z9RVmkbNvjwRSRCd3LkfG3eI8QUogryP
 czKUp4UBqkULHrYtHVsYxsmH0XBYJMnIHoo0mteKaNN8kxxBKiDqRhzLXR22BTtbN2kp
 h2i2XR58QNq+orT8ROWEyKpAbHAmBm/cTLJwfJSBkB263LSwlxQwPPrpD+nbLlrauhTR
 bssthxgLO01DqPA8sc9HwfVIUcnx54y3xJUbpSqdXQdAcl41A804kUOZ1b8xG0S+2ewg
 QG8g==
X-Gm-Message-State: AJIora9WfYLET+X/PzMdkgur/weHfTnToe9hlJMBrZoZvaPf1oecg5i1
 PXCTOHijlktfBpT42lZpTJhlZLMB4IITHNczZWCY3Q==
X-Google-Smtp-Source: AGRyM1ukc5hpU/B0j/n7CiTmzjNEfm++TPMCar3FW74TvsNC8FFHOREesNQ5tyXp7Jwqddes+XM3vkNaO2kUTA+cNM8=
X-Received: by 2002:a25:907:0:b0:668:afc1:65e6 with SMTP id
 7-20020a250907000000b00668afc165e6mr19712936ybj.85.1655727988822; Mon, 20 Jun
 2022 05:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220614211909.94060-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220614211909.94060-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jun 2022 13:26:17 +0100
Message-ID: <CAFEAcA8NS_fWpeKd2-c446ETJM2jRr7_bZ5ABOXr75A9TpnxSA@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Take refresh rate into account
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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

On Tue, 14 Jun 2022 at 22:19, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Hi; generally all commits should have some useful description
in the commit message body. In this case, it would be useful
to describe the motivation for the patch: is it fixing a bug?
What goes wrong with the current code?

thanks
-- PMM

