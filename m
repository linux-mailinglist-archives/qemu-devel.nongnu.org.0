Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD31630FAE
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 18:22:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owRXr-0003TZ-VD; Sat, 19 Nov 2022 12:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1owRXp-0003Sm-Lc
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 12:22:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1owRXo-0002q5-2n
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 12:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668878539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TfXWFKjVtpO9GWi5Go91VkCk7jYhXeXZ7L6ZkS8yU+4=;
 b=Rp/LozkYD98d1Ioe6zzJonQraF+JKkbEUqCKo7MKA5rr2f+XsZoNsbY+4zEC4Mdi0b/XwH
 2y6WMjGrIUQOR7SbN94jmIyjaHN3N5zEX9y0A8x5wDRwWpreDFapYBC8cWdX6VBunUju0T
 qRFf+wNRq60vL1aysof7t3w/E6Aipxw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-2tcp1J6OOQijJZB6LKRm6g-1; Sat, 19 Nov 2022 12:22:17 -0500
X-MC-Unique: 2tcp1J6OOQijJZB6LKRm6g-1
Received: by mail-wm1-f72.google.com with SMTP id
 r186-20020a1c44c3000000b003d0005ff848so4072196wma.2
 for <qemu-devel@nongnu.org>; Sat, 19 Nov 2022 09:22:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TfXWFKjVtpO9GWi5Go91VkCk7jYhXeXZ7L6ZkS8yU+4=;
 b=lat+kkcjw3SlZjRUrRxDGjEAJMYkXx+x3D7kwHYpUemZlk1aB1886jFPZGQkDXQdld
 pDUkP0hYV2dzXytju+86J/HtOgmJg38MBdrC8zGxd4c2Twof5wHww0DHn09erhJY69PE
 dNFonP0hHwXYZJ2lWyy8NlKl/teGyNu7UbFFCCtmXePaZis3h9h0LuyWLOupDLtRIGHW
 k3CxVC3i5rNvf1RAtUkGt42Nc4J4yFO07buGxqbAkH+SIv1FrNyAymJFtoqC1KEKz96R
 VH0ZEcb2/CRKJi5TzKzJariOKgaDfO0wJkmOXdOZ6YEDd7PCK2Hud1QQ96MjF562r0gM
 hC9g==
X-Gm-Message-State: ANoB5pkVz1hSOBiRAIIUnZd2Ei2gv/FYNw4GPFFkrL9CE0PYyyUQxX0n
 xT2KxuxkJhgGrRLjNBJav5Sg85N0ny+RZzE4Cd58lFb19r++fF348MW0NrWdapaWn4rpebmVsw2
 itrX0ejeTkeFiBjE=
X-Received: by 2002:a05:6000:1108:b0:235:8867:50bf with SMTP id
 z8-20020a056000110800b00235886750bfmr7113612wrw.193.1668878536748; 
 Sat, 19 Nov 2022 09:22:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6fJ7BLwC2kFojv+K2KoKLoamhVkRQ26gB5VJ04WJ2oa8R+OkQUSwAqNVJEoZk0WBPxQfp3CA==
X-Received: by 2002:a05:6000:1108:b0:235:8867:50bf with SMTP id
 z8-20020a056000110800b00235886750bfmr7113599wrw.193.1668878536478; 
 Sat, 19 Nov 2022 09:22:16 -0800 (PST)
Received: from redhat.com ([147.235.209.1]) by smtp.gmail.com with ESMTPSA id
 l16-20020a1c7910000000b003b47ff307e1sm8065381wme.31.2022.11.19.09.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Nov 2022 09:22:15 -0800 (PST)
Date: Sat, 19 Nov 2022 12:22:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Volker =?iso-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, kraxel@redhat.com,
 qemu-devel@nongnu.org, stefanha@gmail.com
Subject: Re: [PULL v4 46/83] acpi: pc/q35: drop ad-hoc PCI-ISA bridge AML
 routines and let bus ennumeration generate AML
Message-ID: <20221119122129-mutt-send-email-mst@kernel.org>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-47-mst@redhat.com>
 <d1e1b4a5-1200-dad7-4e82-eacdbd71b92d@t-online.de>
 <20221118140836.73d76e08@imammedo.users.ipa.redhat.com>
 <20221118155517.2a44026d@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118155517.2a44026d@imammedo.users.ipa.redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Nov 18, 2022 at 03:55:17PM +0100, Igor Mammedov wrote:
> On Fri, 18 Nov 2022 14:08:36 +0100
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
> > On Thu, 17 Nov 2022 22:51:46 +0100
> > Volker Rümelin <vr_qemu@t-online.de> wrote:
> [...]
> > > since this patch SeaBIOS no longer detects the PS/2 keyboard. This means 
> > > there's no keyboard in SeaBIOS, GRUB or FreeDOS. OVMF and Linux detect 
> > > the PS/2 keyboard without issues.
> > > 
> > > Here are a few lines from the SeaBIOS debug log.
> > > 
> > > table(50434146)=0x007e1971 (via rsdt)
> > > ACPI: parse DSDT at 0x007e0040 (len 6449)
> > > parse_termlist: parse error, skip from 92/465
> > > Scan for VGA option rom
> > > Running option rom at c000:0003
> > > Start SeaVGABIOS (version rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org)
> > > 
> > > and later
> > > 
> > > SeaBIOS (version rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org)
> > > ACPI: no PS/2 keyboard present  
> it was a bug on SeaBIOS side, we need it to parse Alias term in AML
> instead of choking on it
> 
> proposed patch:
>  https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/RGPL7HESH5U5JRLEO6FP77CZVHZK5J65/
> 
> PS:
> it's probably too late for it to make into 7.2

Right. So revert?


