Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86326698C2
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:38:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKFj-0006MF-14; Fri, 13 Jan 2023 08:37:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKFh-0006Lr-Bp
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:37:49 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKFf-0004XI-NU
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:37:49 -0500
Received: by mail-pj1-x1029.google.com with SMTP id bj3so19255637pjb.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 05:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M9GMVBCNMhBrx4XZKL4Yy6ZquvHJgVM2m+NkvtAz+nk=;
 b=RJwSahGT1pO/ZtEdHc0UgyKVPbjdT29yNjSMiXEEbCEuKRuC1WeuQU1kSvB+waHoUC
 8RfOB1jeg1k1SnhCPlalm6Bph0IAM8T+Y6NNpII6VXWNNgaVcwJyyEkp59YMFaskTlG5
 8YiKTLGM5hbMJOcXVy7v0vruxtuRojzq5qDWGXZUI23iIXUDPNCgr6+yTAiZ9kcFVlPb
 hQ3iADLUthhTq4qr6n7ceXh1eyWaaSsWksBDih5MHMakjQytnusqFr8dWoP///CRY2TX
 yM5kDllVM9DgVEt6jIBR+PCU7UNf4yFhXrfE1NOvsVX/7/tiiLZcWC0x8cZEHhnetyBf
 SeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M9GMVBCNMhBrx4XZKL4Yy6ZquvHJgVM2m+NkvtAz+nk=;
 b=ASa406NF83Kb628blDI8mclUM2BCXGWHOz3mrwzULeMbqPK4YTlb4ZGOPFCrkKsyvW
 /Da9t6sAUKtPtPhhPH9pbhbpC25QMIja6Zw9cO6IVbVzJVYW2uru5L1Q9ySX/70C2tmg
 ztDCHQ+uzrfE6IFxwW6DaYbeXfafUrLz8u4bY/njQH2j2w1G0P3Ti8Bw/7LRWzSSwAFQ
 c4qxGiAI/09zB6Y7QN0T5aZ2PVc1eDqZm67CWlro4KqnXkcuk/tPMTbdI4xJcFThs5bx
 CgnCzUSfrA4nA12cdsIuXnvg24Dqtuuop6UteU7Cf2HDJk/gotY+9L6ufjEl6GaRBWSG
 lsWg==
X-Gm-Message-State: AFqh2koF4K75l2GyyAmwHk1PhWsS9HivzDhjdl/M0+5QRPoq3bOyHAf8
 /POn7f7i5+7iBPtQog6e7mujwGRclNodTt03IDEycw==
X-Google-Smtp-Source: AMrXdXuHDHdgmvBpHax89uLz8CjPsIuTRkol+PjIe3+LzEe1gQ4l5+rXkYtdDtHk3AltVmXrV1PUV5gH9HPg2sOxNu4=
X-Received: by 2002:a17:90a:77c7:b0:219:e2f1:81ad with SMTP id
 e7-20020a17090a77c700b00219e2f181admr6611138pjs.19.1673617066094; Fri, 13 Jan
 2023 05:37:46 -0800 (PST)
MIME-Version: 1.0
References: <20230109120833.3330-1-philmd@linaro.org>
 <20230109120833.3330-2-philmd@linaro.org>
 <791cd783-4f27-dd18-c6bd-b9a316bb42cd@eik.bme.hu>
 <8507ed0d-fc90-8ce3-2d7d-82c106b20231@linaro.org>
In-Reply-To: <8507ed0d-fc90-8ce3-2d7d-82c106b20231@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jan 2023 13:37:34 +0000
Message-ID: <CAFEAcA-h49eXgS63LARX0aMgBknNcaURGxqammQh5U9OZQ7v4A@mail.gmail.com>
Subject: Re: [PATCH v2 01/21] hw/block: Rename TYPE_PFLASH_CFI02 'width'
 property as 'device-width'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 9 Jan 2023 at 14:19, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 9/1/23 14:33, BALATON Zoltan wrote:
> > On Mon, 9 Jan 2023, Philippe Mathieu-Daud=C3=A9 wrote:
> >> Use the same property name than the TYPE_PFLASH_CFI01 model.
> >
> > Nothing uses it? Can this break command lines and if so do we need
> > deprecation or some compatibility function until everybody changed thei=
r
> > usage?
>
> Good point... I missed that :/

That should not be possible, because the cfi02 device
is a sysbus device that must be mapped into memory. There's
no useful way to use it on the QEMU commandline; the only
users are those creating it from C code within QEMU.

That said, the meanings of the cfi01 parameters are:

    /* width here is the overall width of this QEMU device in bytes.
     * The QEMU device may be emulating a number of flash devices
     * wired up in parallel; the width of each individual flash
     * device should be specified via device-width. If the individual
     * devices have a maximum width which is greater than the width
     * they are being used for, this maximum width should be set via
     * max-device-width (which otherwise defaults to device-width).
     * So for instance a 32-bit wide QEMU flash device made from four
     * 16-bit flash devices used in 8-bit wide mode would be configured
     * with width =3D 4, device-width =3D 1, max-device-width =3D 2.
     *
     * If device-width is not specified we default to backwards
     * compatible behaviour which is a bad emulation of two
     * 16 bit devices making up a 32 bit wide QEMU device. This
     * is deprecated for new uses of this device.
     */

cfi02 claims that it does not support flash interleaving
(and unlike cfi01's comment which also claims that, I think
it really means it). So I think the cfi01 'width' parameter is the
same meaning as the cfi01 'width' parameter. It also happens
to be the same as 'device-width', but I don't think we
really need to rename the parameter here.

Happily, unlike cfi01, cfi02 doesn't have any of that
"bad emulation of two 16 bit devices making up a 32 bit
wide device" code :-)

thanks
-- PMM

