Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AAC418A96
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 20:58:40 +0200 (CEST)
Received: from localhost ([::1]:53700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUZMF-0001u4-M7
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 14:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mUZJW-0008GD-Rc
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 14:55:51 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:41948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mUZJT-0006Lz-TD
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 14:55:50 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id az15so15727961vsb.8
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 11:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QyG8LUKoiJuona240wxgR1VvYFwuqPXh9SHPqugr1GI=;
 b=en0k4iwWL3frDbpErMim5v3kb8pR9jooEGCd9sDIxOIVdHJboiyCBmTEkom0Efez48
 23LFBtKimCqL3V+6GnXNRfFnuKl5ro3fs4O59eQh0friEwA1/EFnCS9dADVYko95Pu3a
 YAaOYlNFw0aKVsxzPYvQsnWs6gdwb3JqdpdTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QyG8LUKoiJuona240wxgR1VvYFwuqPXh9SHPqugr1GI=;
 b=uZ0cauw7/9nlpu9T8J6TtN5+aD3AvX3+dN82qEg8j+GzyPKXny93TriADh5Eg31Rbh
 omkb+sXyUUattS7+Jc1MdDroYxktrb4DnlBFuQ2EA3D9wwBTobdmgtLiaVETt8RaNfNv
 di6MrNFrfjY7dnvUcs6By01Ksvh1//wAHSlQOC8h+SjFs0mgVs6EfTTjHUhnhQ5FId+R
 bfFJpRglbA+h+xXNGnyAUPMnA8PSVNQnaOa2iR1bhfjFrMwDEQ897FpUd3nU5opGZ2fL
 LqwaRAxZn9Romem4XIhmI2Y0TQQeDbQIQdx3AH/FQxiWcD+b3rvQV2c84bffTBvd75//
 qeKw==
X-Gm-Message-State: AOAM532GXy8sIOiCHvdKxHUP7zOHv0k/syoaeislVWCfl6B2YnZng9IX
 lrkg7KPfEmgxPr4LbZN75oYT6u7HOnBjlVLWTsPKqA==
X-Google-Smtp-Source: ABdhPJwMN4LDokIOobG3HrUFofZed4KDISiMhoIBsWPdLha3q5bybxvki0d0a54WosEfmBRTDlUm++nAqLfRip1omgs=
X-Received: by 2002:a05:6102:3a59:: with SMTP id
 c25mr16110800vsu.15.1632682543607; 
 Sun, 26 Sep 2021 11:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org>
 <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
In-Reply-To: <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 26 Sep 2021 12:55:32 -0600
Message-ID: <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=sjg@google.com; helo=mail-vs1-xe2c.google.com
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

On Sun, 26 Sept 2021 at 12:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 26 Sept 2021 at 19:34, Simon Glass <sjg@chromium.org> wrote:
> >
> > At present qemu creates a device tree automatically with the 'virt' generic
> > virtual platform. This is very convenient in most cases but there is not
> > much control over what is generated.
> >
> > Add a way to provide a device tree binary file with additional properties
> > to add before booting. This provides flexibility for situations where
> > Linux needs some tweak to operate correctly. It also allows configuration
> > information to be passed to U-Boot, supporting verified boot, for example.
>
> So, I'm strongly inclined to say "nope" here. The device
> tree virt generates is supposed to entirely describe the
> virtual hardware we pass to the guest. If a guest doesn't
> work with that, then either we're generating bogus dtb info
> or the guest is not handling the dtb we pass it, and one
> or the other should be fixed.

Thanks for the response.

In the case of U-Boot at least, it uses the devicetree for
configuration (it is a boot loader, so there is no user space to
provide configuration). So the current setup is not sufficient to boot
it correctly in all cases. On the other hand, the 'virt' feature is
very useful for testing U-Boot, so it would be great to be able to
support this.

I also forgot to ask about testing, but am happy to add a test if you
can give me some pointers.

Regards,
Simon

