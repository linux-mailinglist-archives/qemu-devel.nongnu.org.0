Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2C94029B1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:27:21 +0200 (CEST)
Received: from localhost ([::1]:54156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNb8C-0002Bo-M9
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNapI-00026b-8W
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:07:48 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNapE-000836-U2
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:07:47 -0400
Received: by mail-wr1-x42b.google.com with SMTP id m9so14386276wrb.1
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 06:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uMAOTjktwFCWtludeLqtnLfTGJ5StLfQeMjWvhDKzHw=;
 b=YyaJpBj9hCOtdfJ+GHYPpQeALx51JcAJ//tBMDON1SZUCEqw5ASjOycLmhMHTxkn0S
 w2qcvvw724oqqr9nARFNv+xKmhbNpohTa3mkIZ+JaO2viAu/wA4JP1dXcMyiBv/xoEkf
 WAMlzop1YVz/T399YZQAL0jwFfcCvAMHDyCZnmEfC0x07c6k9+nkXQRzWwfXwbNYIslO
 33Nwld7a0TccE5n++gFLfQNSLmPqewGX00MGaAMNT6ax/KqI+gyeBEGIoss4roLtkIQT
 P3a6s/M5P18AFQGxaatPCQbHdMD+c73bApMFuZXJ01RwaabrwbOQpUlgBPWMFFD2OPwZ
 Cc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uMAOTjktwFCWtludeLqtnLfTGJ5StLfQeMjWvhDKzHw=;
 b=Yr5oJzk4NLrKPTm168GpW1BcpSoYc0BTNJNwN1gIk8x825pXt0wL4RHTaMv/Z6o0pH
 0gk+JuDVzfDWHDpB0NPRTzYWxetASHu//IUPup8b7roRjACadMWPyQPiXz7P0mwqgSdM
 Vo3G5c3TKZGb3aulzyZBu8TXYFkAfX1u+AfHHZoCUoK29k2gqIMh1GSyNvRBzgRp+g+G
 KDk7sZoqC0lpgGYF1tcbk0Ap8xcG8zyHr86zux8u/lEpgXNwyD65kkSOz4wXhMKltDCx
 k78b906/iDZKmUY3L+S7En1AorR0dEDOo5NtXb9qCIKBoy9/bpNr9xbKqLaXhBvL6+Ef
 TGlw==
X-Gm-Message-State: AOAM531xMuTDZf84EUJ5OsLzeklhww8HNGU2U1BR7qZjNOwnfDO+GqGa
 XH6aEMpFLMgRDa1Ub6TL3YgYbBam1Abu/PmtUQlDfA==
X-Google-Smtp-Source: ABdhPJzBORcJc7ihPdxXHkXy7vtYGvmL8rNbCa7sysgDAbLld7iz6zyuJrJVAFW5HV65F9d7GINYBcxEP7Kb2Pc9j/8=
X-Received: by 2002:adf:c18a:: with SMTP id x10mr19181031wre.302.1631020062833; 
 Tue, 07 Sep 2021 06:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210903113223.19551-1-mark.cave-ayland@ilande.co.uk>
 <20210903113223.19551-6-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210903113223.19551-6-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 14:06:53 +0100
Message-ID: <CAFEAcA-rGBmWWJ+2U4B9efno7fC1DU7Cp5qz0_HiRy6rRFQu5w@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] escc: implement soft reset as described in the
 datasheet
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

On Fri, 3 Sept 2021 at 12:50, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The software reset differs from a device reset in that it only changes the contents
> of specific registers. Remove the code that resets all the registers to zero during
> soft reset and implement the default values listed in the table in the "Z85C30 Reset"
> section.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

