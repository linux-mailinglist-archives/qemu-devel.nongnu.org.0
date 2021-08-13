Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400623EBA0B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 18:30:05 +0200 (CEST)
Received: from localhost ([::1]:50954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEa4J-0007ic-R5
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 12:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEa39-0006sM-8P
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 12:28:51 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:42778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEa37-0001p6-Uc
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 12:28:51 -0400
Received: by mail-ej1-x62f.google.com with SMTP id b10so10792991eju.9
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 09:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5hIf9deYMKkyVe1TjzJitVmHm4cUsZH1bUzmbdwL0HY=;
 b=wkFwYV/5C+ESdKDKmz6u2DAAkdMDaJgs9S7nH9CoiLwWUfvUTb947X4PuPNL71o8Ls
 ODx1STn0dmf1QvwEoyl4Nrc0HHCOiHY7kqdE1RS9FYhVgoyy/zvk40Q97r470Mq97hZB
 BmG6RayoliP0X1pEJEP2v36KRDN3LyVn6FPVpeWPDTEyYFPGUGY/e3N4ZYZuDDlnmvWd
 8YpX/PYl2PG+3d1ePAsjDZ7Kgn3SrSXksMZYOwV5owZBJvbIrfnBG61FH1ofOyBvkZ/s
 gqmlKUs5lftT3x86g1loget+h38hdHfqwkM6us0uBowBvtsh14HZkSSX+FWGEXkb/1gA
 82Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5hIf9deYMKkyVe1TjzJitVmHm4cUsZH1bUzmbdwL0HY=;
 b=jPWF25yx2tTdAoTvzU7+pk+gckAVI4q0ABvHng269gjRayW/BX1oeMkTvOSDd7XpVj
 KXcbAQG2iy1BrXAgy5cFZ7YTg0tuW7Iz4VkClLIIV3wiqcMP9VQ7ISueFS3zxQ0uTdCG
 mLLVRmROCzWT4eiIOw5CJYG0oYTW9Q/58U9xum8KvML60kMtqtoEJpEYSBRYECdM4ZC1
 K9QTLsQcwO88XwtUVH91fkv0qZBc3R4jlvUFsC3a3cCtcyxU+86d7eUZsQiPrc4lmX3y
 J0p3U5YFCC3UkuoAQuJocQ3+nVeScwo2K9Qqyv+cHpwXk9L5iABaMSEvsEv6ebdQmboj
 1a8g==
X-Gm-Message-State: AOAM53019ywSoozavxmgYl+JTpByPJZdQ7d+iRwuU0B0SFFBSvIFttzS
 GnVwBZDtjrtN8eiGXIS8wRh5yFUsXBWtv3d9AqN2GQ==
X-Google-Smtp-Source: ABdhPJwICpcpVDXT5OtjxZFPFP1D1Lkjz4bx3uQ95sR2GY6x4LMM3duqZdBf2bhtC+LHNXYO/+u7PaZWeFB5ELigS4Y=
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr3228937ejb.382.1628872127855; 
 Fri, 13 Aug 2021 09:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210806144700.3751979-1-jlu@pengutronix.de>
In-Reply-To: <20210806144700.3751979-1-jlu@pengutronix.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Aug 2021 17:28:02 +0100
Message-ID: <CAFEAcA-tpYBK7enDU01gQ-ZNWnOSve0Gz7AjCFcC7quicWBKKg@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: add support for sending break
To: Jan Luebbe <jlu@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 6 Aug 2021 at 15:47, Jan Luebbe <jlu@pengutronix.de> wrote:
>
> Break events are currently only handled by chardev/char-serial.c, so we
> just ignore errors, which results in no behaviour change for other
> chardevs.
>
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>


Applied to target-arm.next for 6.2, thanks.

If you're connecting the pl011 to the serial backend, you might
also need to implement the CHR_IOCTL_SERIAL_SET_PARAMS handling
so that when the guest sets the baud rate etc it actually works...
CHR_IOCTL_SERIAL_SET_TIOCM and _GET_TIOCM to wire up the flow control
signals will also be helpful I suspect.

-- PMM

