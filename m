Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D381C65B6BC
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 19:51:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCPsd-0002Wk-Kk; Mon, 02 Jan 2023 13:49:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pCPsb-0002W8-DQ; Mon, 02 Jan 2023 13:49:49 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pCPsZ-0006Pt-LQ; Mon, 02 Jan 2023 13:49:49 -0500
Received: by mail-oi1-x231.google.com with SMTP id n8so18759006oih.0;
 Mon, 02 Jan 2023 10:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9OxOWN0yUc3CnItuQ5PzUMy/WXtVKx/HlDwwS4NlTXc=;
 b=e2lhmD68/yTYiZW8hwZh3TPATTywaYmKpqjrwxJiGDkyxT9gOZIUkwUMqkqtwctf6n
 9xQMAIyRKj45nTvB6LnDxqOulfUkxkSgd+2L0uGjEBoQ2pCZWxG0RlyOT3S1rz1qTVwg
 g6Ay3hiiX1Yut4I4XmsNDdpp0x44bywMPBkK3/iwFDRFEl9NOxjkKkOSuzDGLMpYD/ne
 mqapuiYz3yuhLlwtN9iXQe65CIAd6EhXD4N1XJl11H3eUkTwl1dZu4B4baqni1wPMTWz
 Hw9+NC2ALwnuIkmRZIdUGt8yOKqIqnj6DsMOonG+vT43EiEPCF9CuM4SO02eVnLZUw2e
 Q7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9OxOWN0yUc3CnItuQ5PzUMy/WXtVKx/HlDwwS4NlTXc=;
 b=NGAvORnL0zuQKAVlUXNtNKjBHogud21X2dtu3vMfDwIa+S620fZS3jVQVNbPFfNEky
 iXgim0e3xoS3/LiZWTS4b72UwzHQ44/5yHO8I9tfo6kfHpvLU+HNSmSpaFMo0DR8w/sN
 3f/lqyHSrmu/iaDfHZ85yRvNxoI/p4Rqi630jl0sqMQ9XfoKd4e4eqU1gKTEPQWo3+LU
 hKRL/iLMJnYe7t3v0SmjZKvQgeIJHMVTEfrmeHNGP1i+Prcs3IaibTuQ5MJURguDHzP+
 F3/DmdrjdxRo8WMZCrBMoJoXgvC4wHfs08ReHo9rCSK3wQ/nymYSiVGP9Nulp2y0C3sh
 7Ylg==
X-Gm-Message-State: AFqh2koc9xG/IyloEFOb/w9r5kCJcimjpb19038Z6+hgwoTBCB1uQzoQ
 b/Ac6f1eSAr3v2n9MX7OrJY=
X-Google-Smtp-Source: AMrXdXso7eNPGn5l7gbYTPzCJncqSJJtFx0kMU699jwP97WrSFIJO63a/YvcNKrFnSKVFed6u1qxrw==
X-Received: by 2002:a05:6808:28e:b0:35e:e530:a07b with SMTP id
 z14-20020a056808028e00b0035ee530a07bmr18026576oic.57.1672685385865; 
 Mon, 02 Jan 2023 10:49:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a056830139400b0066db09fb1b5sm13829149otq.66.2023.01.02.10.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 10:49:45 -0800 (PST)
Date: Mon, 2 Jan 2023 10:49:43 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <michael@walle.cc>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Ben Dooks <ben@fluff.org>,
 Alistair Francis <alistair@alistair23.me>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] m25p80: Add the is25wp256 SFPD table
Message-ID: <20230102184943.GA2553640@roeck-us.net>
References: <20221221122213.1458540-1-linux@roeck-us.net>
 <2236d0ee-4fc6-5e2c-95b4-f97639e0955b@kaod.org>
 <20221225121850.4bjnskmlhsot54cf@hetzy.fluff.org>
 <b00bb842-a9e6-fa5c-94d9-876c241be600@linaro.org>
 <c1f5c868-0006-bb28-af88-eddc5543068e@kaod.org>
 <3044e0c174268312d0323d8f9ad43c68@walle.cc>
 <20230102162308.GA1138622@roeck-us.net>
 <50d8282e95bde199ad60411ddfa9b373@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50d8282e95bde199ad60411ddfa9b373@walle.cc>
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Jan 02, 2023 at 06:42:03PM +0100, Michael Walle wrote:
> Am 2023-01-02 17:23, schrieb Guenter Roeck:
> > On Mon, Jan 02, 2023 at 04:43:49PM +0100, Michael Walle wrote:
> > > Am 2023-01-02 14:53, schrieb Cédric Le Goater:
> > > > On 12/27/22 07:31, Tudor Ambarus wrote:
> > > > >
> > > > >
> > > > > On 25.12.2022 14:18, Ben Dooks wrote:
> > > > > > On Wed, Dec 21, 2022 at 06:36:02PM +0100, Cédric Le Goater wrote:
> > > > > > > On 12/21/22 13:22, Guenter Roeck wrote:
> > > > > > > > Generated from hardware using the following command and
> > > > > > > > then padding
> > > > > > > > with 0xff to fill out a power-of-2:
> > > > > > > >     xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> > > > > > > >
> > > > > > > > Cc: Michael Walle <michael@walle.cc>
> > > > > > > > Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> > > > > > > > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > > > > > >
> > > > > > > Reviewed-by: Cédric Le Goater <clg@kaod.org>
> > > > > >
> > > > > > If SFDP is a standard, couldn't we have an function to generate
> > > > > > it from
> > > > > > the flash parameters?
> > > > > >
> > > > >
> > > > > No, it's not practical as you have to specify all the flash parameters
> > > > > at flash declaration.
> > > >
> > > > Indeed and the definition of flash models in QEMU is far to cover all
> > > > the SFDP
> > > > features. The known_devices array of m25p80 would be huge ! However, we
> > > > could
> > > > generate some of the SFDP tables if no raw data is provided. It could be
> > > > useful
> > > > for testing drivers.
> > > 
> > > I don't think adding (incomplete) SFDP tables makes sense for any real
> > > devices. E.g. sometimes our linux driver will look at specific bits in
> > > SFDP to figure out what particular flash device is attached. For
> > > example
> > > when there are different flashes with the same jedec id.
> > > 
> > > But since the last released kernel, we support a generic SFDP
> > > driver, which
> > > is used when there is no matching driver for the flash's jedec id.
> > > Theoretically, you can build your own flash device (with a unique
> > > id) and
> > > generate the sfdp tables for that one.
> > > 
> > How about older kernels versions ? Would those still support such
> > (virtual ?)
> > flash devices ?
> 
> No with older kernels you'd be out of luck. They will just print "unknown
> flash
> id" and skip the device.

That would mean that qemu versions including this change could no longer
be used to test flash support on older kernel versions. That would be
extremely undesirable. I'd rather live with the current code and still be
able to test older kernels.

Thanks,
Guenter

