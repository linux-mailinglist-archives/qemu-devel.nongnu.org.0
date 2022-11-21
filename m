Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23240631AA4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 08:51:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox1Zn-0000L2-DH; Mon, 21 Nov 2022 02:50:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ox1Zl-0000Kt-JX
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 02:50:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ox1Zk-0005fr-1Y
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 02:50:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669017043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fvh4T5Xm4+HfKNGTEWEyPdq64lyZLWIPtQA5Ahv9dnU=;
 b=bC+QR2PXa4gtVnflQe5Oio8Pc0gz/9uci6+5cNPTiJKpmDTSGzXTzIn6q92LhjkhsAGC0q
 VzVY3aEmBRZLT2s33ewaB8vJh4a0WVr9IV5bgSs3HVNkkyX0d/A3Tm8Du7oMFRKOXM4XTB
 UYke/WrJll2MRtgl6Y91GYLxqu6A4CM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-TrrIjDFKMQGsEMMJkuAJcw-1; Mon, 21 Nov 2022 02:50:41 -0500
X-MC-Unique: TrrIjDFKMQGsEMMJkuAJcw-1
Received: by mail-wr1-f72.google.com with SMTP id
 v12-20020adfa1cc000000b00236eaee7197so2896671wrv.0
 for <qemu-devel@nongnu.org>; Sun, 20 Nov 2022 23:50:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fvh4T5Xm4+HfKNGTEWEyPdq64lyZLWIPtQA5Ahv9dnU=;
 b=71U91L0kjNB9u3xctfZQ1VUOvZ8T8ubdxikKVZPtRmI/ZnLLaHRJWsggxNcD2seOGG
 +kE+qezLnUilPR+UzE/nrJtLw1ntea2dBVKVjIEzVY3CeJXbiYH9DMjrQMrkIf+dvA5f
 gxPqb2QTffoQoPK8DVbH7JAWNgHkueLSrK+ZajqLqSMHiCnLsyckBjIjLBu5gdXtKYLV
 fOn7L7jb5mhrP1JJSsU9vYhgTbbmMTHmbTw24IfaGpraJu+rEKqtObnnoaeLCORy9l0u
 mhKxy8vMXQ+s/auJKiDynY4cpehaO/1pJ4VSYKCWelTFgQ8Wu3PMlcoS0d4ZDPqa9o2W
 mnQA==
X-Gm-Message-State: ANoB5plaNRfhdaSkTAV2xFiXNKEJdJRz9sZnWx6Xq8LBXItmEoRfF0Xn
 ZPmC0pK2hrVibrOfI50oQM0KIjj5Cbg07IlzhGulteSiv3l23NVzZGBnLwB7Crqen1AxS5khPWI
 lEsWqmScRXL2prYI=
X-Received: by 2002:a1c:7701:0:b0:3cf:7556:a592 with SMTP id
 t1-20020a1c7701000000b003cf7556a592mr5024191wmi.199.1669017040296; 
 Sun, 20 Nov 2022 23:50:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4FYHMmlXCb6k4vRO9ecxJXv0xZ8chfwP8feycss7B6VRHyII1WZE3sOT0SQRw8Wsh81vjXWQ==
X-Received: by 2002:a1c:7701:0:b0:3cf:7556:a592 with SMTP id
 t1-20020a1c7701000000b003cf7556a592mr5024176wmi.199.1669017040049; 
 Sun, 20 Nov 2022 23:50:40 -0800 (PST)
Received: from redhat.com ([2.52.21.254]) by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c311100b003a2f2bb72d5sm21407747wmo.45.2022.11.20.23.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 23:50:39 -0800 (PST)
Date: Mon, 21 Nov 2022 02:50:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Volker =?iso-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, kraxel@redhat.com,
 qemu-devel@nongnu.org, stefanha@gmail.com
Subject: Re: [PULL v4 46/83] acpi: pc/q35: drop ad-hoc PCI-ISA bridge AML
 routines and let bus ennumeration generate AML
Message-ID: <20221121024925-mutt-send-email-mst@kernel.org>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-47-mst@redhat.com>
 <d1e1b4a5-1200-dad7-4e82-eacdbd71b92d@t-online.de>
 <20221118140836.73d76e08@imammedo.users.ipa.redhat.com>
 <20221118155517.2a44026d@imammedo.users.ipa.redhat.com>
 <20221119122129-mutt-send-email-mst@kernel.org>
 <20221121082315.4d4a6c78@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221121082315.4d4a6c78@imammedo.users.ipa.redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, Nov 21, 2022 at 08:23:15AM +0100, Igor Mammedov wrote:
> On Sat, 19 Nov 2022 12:22:13 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Fri, Nov 18, 2022 at 03:55:17PM +0100, Igor Mammedov wrote:
> > > On Fri, 18 Nov 2022 14:08:36 +0100
> > > Igor Mammedov <imammedo@redhat.com> wrote:
> > >   
> > > > On Thu, 17 Nov 2022 22:51:46 +0100
> > > > Volker Rümelin <vr_qemu@t-online.de> wrote:  
> > > [...]  
> > > > > since this patch SeaBIOS no longer detects the PS/2 keyboard. This means 
> > > > > there's no keyboard in SeaBIOS, GRUB or FreeDOS. OVMF and Linux detect 
> > > > > the PS/2 keyboard without issues.
> > > > > 
> > > > > Here are a few lines from the SeaBIOS debug log.
> > > > > 
> > > > > table(50434146)=0x007e1971 (via rsdt)
> > > > > ACPI: parse DSDT at 0x007e0040 (len 6449)
> > > > > parse_termlist: parse error, skip from 92/465
> > > > > Scan for VGA option rom
> > > > > Running option rom at c000:0003
> > > > > Start SeaVGABIOS (version rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org)
> > > > > 
> > > > > and later
> > > > > 
> > > > > SeaBIOS (version rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org)
> > > > > ACPI: no PS/2 keyboard present    
> > > it was a bug on SeaBIOS side, we need it to parse Alias term in AML
> > > instead of choking on it
> > > 
> > > proposed patch:
> > >  https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/RGPL7HESH5U5JRLEO6FP77CZVHZK5J65/
> > > 
> > > PS:
> > > it's probably too late for it to make into 7.2  
> > 
> > Right. So revert?
> 
> let me check first what happens with migration case,
> and maybe I can come up with a temporary hack to avoid aliases on QEMU side,
> probably it will be something ugly but should do the job
> 
> > 

Given the timing I'd prefer the revert. But if you insist let's see how
small that turns out to be.

-- 
MST


