Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DB062963B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 11:49:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1outUz-0005MO-2B; Tue, 15 Nov 2022 05:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1outUw-0005Lz-IR
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 05:48:58 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1outUr-0005tQ-Bu
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 05:48:58 -0500
Received: by mail-pg1-x52a.google.com with SMTP id 130so12922853pgc.5
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 02:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BOo7tIQW1jJVU3f8wXs7fkjVNUba58r/CytY7zMfiP8=;
 b=B3JRgU8D6xf3f1AWEb1lr4e7o6NGJsXF3eLZ6g3FSoeYex7D2cgEKX0mngZE3JwpF3
 LAKqRTOUyd+rV9zXYGcvE8S6CrXN0z5CTiwMjkIIU/9eTCEMqKPXqAZsf5gQHiV78U/X
 busvY3DnDZ7YzSRcJHrtlmdNEaOfXqgXJWJbo6Plby6QoR7bnAF7nsM6wmBOUYtc8jAe
 pbe3C3r7OgJVRBl/p8mSo3lBXLWv2+iXilEQ9TFZAji0LnOLV7x5rapHdSSproaFDnDe
 Up2jx/c7A/3iBI6eHddZhQoQ62bmt+mxtptyhe+jA5r26/zSndAj/yl/fFH+Q3F7knnN
 JJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BOo7tIQW1jJVU3f8wXs7fkjVNUba58r/CytY7zMfiP8=;
 b=uxd5N85Owx/rvTjl+5xbJw6MKKZwlv2l6mAh90SLCO8mDmF3RczrvIqHOsEaMs0yDy
 zPFotcoxt3ZnHr7eIklCAqC+0i58DFj3pLI20fg8wXQ3C5iygH2llgoprDUkA4XU9I2p
 szKS8oEdtvweFOTlgEb7CYTRBtoqopynPUE98H2M1jQm21YQQObLV8z8Ra2hcFLYf3ig
 c2jxpVRwJDJOrFeiuz9FaRutgfJfQI5BGzGBANCr23wzOL/5P0IhTRKSWs1RBYt0767n
 nVGzLVX7aLrACISbzu9kQVoWFcJdH1CxDAYgSZruexVMLfM1STYwtT/vVMgvDRQIJdeo
 b8+Q==
X-Gm-Message-State: ANoB5pkwubqJQZ1WSDRtSRsn5xoz+dB2CP68l/+eGEa4T/r4wDr+xiu4
 hPaRUlTFcKYr0Iv7anKZ8OWLkcLkPZ0y45jX3wCpRQ==
X-Google-Smtp-Source: AA0mqf4gUNT5aGYmYCBp7Vy1FKyqoejEq/gU5lFUViypQatA5Q5eYywIGk2Hxu6uAyXzdtUBVYFlnvubW7F/HFccBWk=
X-Received: by 2002:a62:6001:0:b0:571:8549:89c3 with SMTP id
 u1-20020a626001000000b00571854989c3mr17692749pfb.26.1668509331563; Tue, 15
 Nov 2022 02:48:51 -0800 (PST)
MIME-Version: 1.0
References: <20221114190823.1888691-1-peter@pjd.dev>
In-Reply-To: <20221114190823.1888691-1-peter@pjd.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Nov 2022 10:48:40 +0000
Message-ID: <CAFEAcA9itEDTrznX1KRVEza__Dch95aBpPzbdTJ0-tuxwiHtoQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Automatically zero-extend flash images
To: Peter Delevoryas <peter@pjd.dev>
Cc: clg@kaod.org, andrew@aj.id.au, joel@jms.id.au, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, patrick@stwcx.xyz, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 14 Nov 2022 at 19:08, Peter Delevoryas <peter@pjd.dev> wrote:
>
> I've been using this patch for a long time so that I don't have to use
> dd to zero-extend stuff all the time. It's just doing what people are
> doing already, right? I hope it's not controversial.

We just had a thread about this kind of thing for one of the
riscv boards (although there the attempted approach was to
change the size of the flash device to match the provided
file, rather than changing the file to match the flash device):
https://lore.kernel.org/qemu-devel/20221107130217.2243815-1-sunilvl@ventanamicro.com/

The short summary is (a) yes, it's controversial and
(b) if we do something for this we need to have a standard
approach that we do on all boards, not "some boards do
some weird magic in different ways from everything else"...

thanks
-- PMM

