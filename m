Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3E94029C0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:32:45 +0200 (CEST)
Received: from localhost ([::1]:43478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbDR-0005iH-2v
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNas8-0007QO-5D
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:10:44 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNas6-0000dv-JU
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:10:43 -0400
Received: by mail-wr1-x436.google.com with SMTP id d6so13732023wrc.11
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 06:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MA2/LHlrjgpYGL2VEl8jEL7bAgpZnnITD6f0TrRFjQs=;
 b=cyHyq/BFgkRwbaGUZLwMb2ApBFcwfHvGCWeagHSXEvcAJnXp3f7NufN8O7pDYh4fx3
 O94Wpfm3N665Z5EoI2T1tm/jBB7Kd1+cZNUOwSlI6IlFGLTjKEypNDi2T3GPlUEXdauC
 8RBMCuCm99tsHc3FsMElTIvFDAaelrA5nNHlMRZQJNrcwZeLzDdqieIghe3oqHczob6X
 ILcCpIb7w8K51nkAbE0qx5uPt8VgwVflfyrueG6yLUkhGTW/p6WOiO4jeCiyr6F1kjWH
 0oNIKk5VJdQsPgAyj9HweTMjKTPosTcre+iT4Vx4YwFn+vdmYOgVmq/07es7UD+DSGjN
 Assw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MA2/LHlrjgpYGL2VEl8jEL7bAgpZnnITD6f0TrRFjQs=;
 b=XtrXcTt67yi8Yqij9F6gsiAOauSDMO7ExNK9tRPLB24J8Dj2Y/t8TgzqPwsxoKq+If
 ztTJVDmMnJ/zFZzfu3KBwGzYj6NLyBQYBsgNwy8A1oV1E7NIc7qVSZTPFz33q3wUFSil
 hYwRYUAl2obWhMZIgzeAW8mgIk1t0ZYSGjlSbnUCkrXnB7yQiN1t6P7LtPyu0819ciLh
 FgWq8Mr57nVVsJjfqX9YCrSGTXHZFj+UwW8hcSh+DhmBqfWcNSuuaUO5XYYQCdFxrrqa
 IQK7IArnnKR30zyN7zeIGghK7VDtfzMYUTb8uMy0qf1BZbgQ8UM3ZCO9qtA0sAvHpxPP
 Yq+w==
X-Gm-Message-State: AOAM532vF4s/CARSkWs8FK1g42Eiy9/I6F7wYA2ROtYTcNDcwxTHZL0S
 Arhw3dQPlConk7yYAQC3f5zd56PMv8Ttivn5z1AiUQ==
X-Google-Smtp-Source: ABdhPJxuBSK/hjoIDyCcztrF2YNoyULlFwZokuIyh358o5nXaWbaofUcioZ0qGwTHrqjtQ6WiamseIjaD3Z6xkfaSxc=
X-Received: by 2002:adf:c18a:: with SMTP id x10mr19200389wre.302.1631020241001; 
 Tue, 07 Sep 2021 06:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210903113223.19551-1-mark.cave-ayland@ilande.co.uk>
 <20210903113223.19551-7-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210903113223.19551-7-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 14:09:51 +0100
Message-ID: <CAFEAcA9H2a8Z1_m=4hb_OpOXtvMzuxwEb_J7jMTiPAdGbi8n6A@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] escc: implement hard reset as described in the
 datasheet
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

On Fri, 3 Sept 2021 at 13:04, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The hardware reset differs from a device reset in that it only changes the contents
> of specific registers. Remove the code that resets all the registers to zero during
> hardware reset and implement the default values using the existing soft reset code
> with the additional changes listed in the table in the "Z85C30 Reset" section.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

