Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48F94197BE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 17:22:38 +0200 (CEST)
Received: from localhost ([::1]:36230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUsSj-00044r-OY
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 11:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mUsOM-0001Rx-47
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 11:18:06 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:41713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mUsOK-0000Po-9w
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 11:18:05 -0400
Received: by mail-vs1-xe32.google.com with SMTP id az15so18534663vsb.8
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 08:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BNd5Gru1d6gt2MuT3knaFcvxWIHVgR33D0qJAIFCPlk=;
 b=XdfsVD0Q5jUfBgeEm3Nd1HAJfBen1dV/zP3eC23k8ksCUssvKarms6+P75QK95zYyQ
 OEy6wmW/BhlOAp2WbA1iFyB6jrCH3L52+O8zK/GvMpvtShVMJXf/28aDPhlRtTiuctAQ
 4zMp5mW3wPijl9mIJ9u1bmCyldsOywsjuu0Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BNd5Gru1d6gt2MuT3knaFcvxWIHVgR33D0qJAIFCPlk=;
 b=PSxUikf0hhrFgqoCMoJCP3YRg08Z7Mn0s1xDZlml6IcDUJJYiKm0GIwpCqpPwfK09I
 rboI1c8AoSq57sIvZ8gSFLINFEwjWKe43/ejZY90Dv4ovzxfU/gARJ5m28xObQxfqGtF
 r7b2bhwb20uCHw1iXi2Z2/1ZsGVUUHwLNJEEIUI/Ch8k0Fu1GG9UTnNGvhwnrF3fusCw
 jqacrf8A/CiH1YwvEzwzjqJMG6PaK45tPY9yRTF638DgVE5DPQSDgLI7soQayzJ/05SJ
 bh//SfogPsKUnIgVm1vN8mV56hAsNIjXoO8B3Uczab0bftIV0t+kw1ZQbw6j/aKiCv8j
 /FrA==
X-Gm-Message-State: AOAM532nQ6yaHwgCXV3qGwHkczgU0ueiRvQLLuAid433XRITLvhSuXJG
 C3O/ySZH42Us8E+/G8LFSHo3++9dWTzjONzzj//cyg==
X-Google-Smtp-Source: ABdhPJxLnbrrpNKl4MfEdX7m6jvV+A7ofdABt+vEQs7kBf+YLhXwS16U8XZmz5AGKw2e8Ais4nHn+37aZu4ydSTPiqQ=
X-Received: by 2002:a05:6102:3a59:: with SMTP id
 c25mr396589vsu.15.1632755882509; 
 Mon, 27 Sep 2021 08:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org>
 <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
 <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
 <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 27 Sep 2021 09:17:51 -0600
Message-ID: <CAPnjgZ1AO8575LYbwmuouNR5=dgNam6EFDC1_bai=8xAHdw7-Q@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=sjg@google.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -92
X-Spam_score: -9.3
X-Spam_bar: ---------
X-Spam_report: (-9.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On Mon, 27 Sept 2021 at 02:48, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 26 Sept 2021 at 19:55, Simon Glass <sjg@chromium.org> wrote:
> > In the case of U-Boot at least, it uses the devicetree for
> > configuration (it is a boot loader, so there is no user space to
> > provide configuration). So the current setup is not sufficient to boot
> > it correctly in all cases. On the other hand, the 'virt' feature is
> > very useful for testing U-Boot, so it would be great to be able to
> > support this.
>
> So what is missing in the QEMU-provided DTB that it needs?

Quite a lot. Here are some examples:

U-Boot has limited pre-relocation memory so tries to avoid
binding/probing devices that are not used before relocation:

https://u-boot.readthedocs.io/en/latest/develop/driver-model/design.html#pre-relocation-support

There is a configuration node (which is likely to change form in
future releases, but will still be there)

https://github.com/u-boot/u-boot/blob/master/doc/device-tree-bindings/config.txt

Then there are various features which put things in U-Boot's control
dtb, such as verified boot, which adds public keys during signing:

https://github.com/u-boot/u-boot/blob/master/doc/uImage.FIT/signature.txt#L135

More generally, the U-Boot tree has hundreds of files which add
properties for each board, since we try to keep the U-Boot-specific
things out of the Linux tree:

$ find . -name *u-boot.dtsi |wc -l
398

Quite a bit of this is to do with SPL and so far it seems that QEMU
mostly runs U-Boot proper only, although I see that SPL is starting to
creep in too in the U-Boot CI.

So at present QEMU is not able to support U-Boot fully. It would be
great to add this as we use QEMU heavily in CI testing, e.g. see the
second column here:

https://source.denx.de/u-boot/custodians/u-boot-dm/-/pipelines/9260

Regards,
Simon

