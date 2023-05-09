Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F5B6FC81F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 15:40:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwNYV-0005tP-K3; Tue, 09 May 2023 09:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwNYT-0005sT-Vb
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:39:01 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwNYR-0003ep-Vd
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:39:01 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50bd2d7ba74so58918208a12.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 06:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683639537; x=1686231537;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zTewEQMFLK2T3sUaVCP8le0EYo0se9/8F0qAzKhz/dg=;
 b=rIk5BO9ZqfNZrSo4XCgpvI+lAiHRS72ZW7GPGzUsvYNgnEyfH8V7B9aYnPqhpO9mkc
 c4GSj0GsnRma8HgeMFrSv3uz+KWixLHcA3MEs3NVO1GpdvrjwU/eRRH6feC2rEHQ3QeX
 d15zl8nHk3gzM5CfnMCIUuxJa51QjiFylwgh1A4AgUtRTwtLiVQIz5pjll8ewV0KXCK+
 xDs2YlztXVB5UQeWQaiJR2Negeg2OzFQKNm8xqBncFMEGZk4TfS88uoZZjD/3HHlS9tJ
 KW6sEIi6kigUl70rel717dVFJ8hCRgiAJICBJsqo7vssbje4yBeEdiuQpKtmHWhnCraz
 IKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683639537; x=1686231537;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zTewEQMFLK2T3sUaVCP8le0EYo0se9/8F0qAzKhz/dg=;
 b=gCYzWenQ3IkN5UPvnonDNq6Ya56OBxkfAq/A/sr10h4JfodyzaaBAYhOZxpXdWc9K1
 Fhf6otkXWSjGim4mW35jfViGlRhEXKzmt/RzTf5mIRcsk7INwLHPiVOrbWFRAD93G37c
 1X/CZKHcP5YpCABCksSDvX8DfMX9A9eifAsJyVUbQY0SaN+OF4OKIX9214BLW1BE2D9m
 RUXcEJ0spPYMJvTH1lN3/BYKiUqDqAKVY2Ky14SwcvvhyYutjatBQhNlMXs7PEQzzsU3
 J2bgBDR7jfH5oOc2yqZKYasM51e4sgKHjS8wsn5f9s4Hb7xPfBzlMdeYmn1kfbASe//T
 xW/g==
X-Gm-Message-State: AC+VfDy//0dgbY5pk+QJEstSn7vA9Mivv9jPTCeXCdBQgNpbiaRGnhde
 NUORPftNz5oWxypSLbaQiItvFE3UgvxBTmIN4LHKnw==
X-Google-Smtp-Source: ACHHUZ6LmjjSVSuEDeQqxXNZKFs/IcN5eeylyI20hwZBydeIjCmI/si7/N7+6ih60NO+RFJzLsyJRK01orPABBP2iaE=
X-Received: by 2002:a05:6402:26d2:b0:506:c2e6:f69 with SMTP id
 x18-20020a05640226d200b00506c2e60f69mr11276764edd.6.1683639537414; Tue, 09
 May 2023 06:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <11bf324.342.187b3418349.Coremail.wangyuquan1236@phytium.com.cn>
 <CAFEAcA9pa+uHGk34uCGX1ZHiCBDeDHXFLDFyVDAVvDxQScEChg@mail.gmail.com>
 <70009a13.15f.187bc308951.Coremail.wangyuquan1236@phytium.com.cn>
 <CAFEAcA-jZBiSL8vNzgcwUT2Lqtgf9JyyaQx7kD4j=Tc9neD_OQ@mail.gmail.com>
 <e4ljd7cckcoe5s3cphztjjqacswssjkap3l3dtre22rtew64kq@cbo7oi7s4wow>
In-Reply-To: <e4ljd7cckcoe5s3cphztjjqacswssjkap3l3dtre22rtew64kq@cbo7oi7s4wow>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 14:38:46 +0100
Message-ID: <CAFEAcA9wk+UOO76myohS2tYXYJ9zHFxr9ARdg1w3QUDXBUQv+w@mail.gmail.com>
Subject: Re: Problem of initialization of platform-ehci-usb in sbsa-ref
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Yuquan Wang <wangyuquan1236@phytium.com.cn>, qemu-arm@nongnu.org,
 rad@semihalf.com, 
 quic_llindhol@quicinc.com, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 9 May 2023 at 14:30, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > Gerd, is there a particular reason our EHCI controller only
> > claims to be able to do 32-bit DMA ? Should we give it a QOM
> > property so boards that only have RAM above the 4GB mark can
> > use it ? (Would the x86 PC benefit from allowing >4GB DMA?)
>
> Can be done, but it's more complex than just a property.  All
> the EHCI descriptors exist in two variants, one for 32bit and
> one for 64bit.  The current code base only supports the 32bit
> versions.
>
> Alternatives:
>   (a) use an iommu to map 32bit to 64bit dma addresses.
>   (b) use xhci instead of ehci.
>
> I'd recommend (b) as the xhci hardware design is much more
> virtualization-friendly.

Thanks. Leif, do you have any preference there?

-- PMM

