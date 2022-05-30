Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185C85385F7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:16:56 +0200 (CEST)
Received: from localhost ([::1]:54572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvi4b-0004R4-Hk
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nvhoz-0002tj-5Y
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:00:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nvhou-00067q-SV
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:00:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653926439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R+xjmwKX/xnIfuylASj1wtZMEMM4a9E3qy+0crvTQ/A=;
 b=Xn17VAFuelb4q2juod/Yp/NT/q9zFfSsmPHTyUxR4B4YzvHUmfgitBDV/jXgLr4PYJsVzp
 ZUdfFu6Vg+X5U2IRpjvV00hufEfI73FS76/t3QeDHTGXJt/a7S6PLoupL01pj63jmqEyT5
 Hl9Asp236mN8/W5C3NGLMbrPVVw/6RM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-niCeSg6nMQWtTcXAVScCCA-1; Mon, 30 May 2022 12:00:37 -0400
X-MC-Unique: niCeSg6nMQWtTcXAVScCCA-1
Received: by mail-wm1-f70.google.com with SMTP id
 m26-20020a05600c3b1a00b00397220d6329so7187807wms.5
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R+xjmwKX/xnIfuylASj1wtZMEMM4a9E3qy+0crvTQ/A=;
 b=nPZZebfbCwr6DuBGZOOqGraU/26DA2cmYKirpnlSOxQG6sP2/7Kr3e+sX9VzYpenYa
 j2vaDI0ugutm92VFKvvvUlCIhvoOMsprdosf4adHVUWPM7RmXu8LWWhcHK2nzSE0MWDU
 1B1vwCA0RaK1OnD7qOh1k4pedRNXO2hbetDkrcm95I77huFgGPPxyc+6QmUdi73LshYo
 qm7BF4eva7fNnIu1gg0iJlnNpT0HGR+S/Svnt/nN4dotms7ZmCOn+mpxYGwNIqyIAqgb
 3mzRvMlBPDHCdQnRmGXXF2YA2E76npIK0stbQ0C+0JqAyW1GYh01XKccCKUvQq2XTBlY
 +QGQ==
X-Gm-Message-State: AOAM531KfCTsYqKg2XTSXowwJ0InTwLNsmv4PxaNHozgp+kzXqIeLJED
 SbbEh5aaRzV2h1urfAreluhmTsMALBXiO3kveXS7jLj9chRK3VddPghtHTkNqs3E+4lR3ZlXn9E
 uiYTPhqmyQElw53U=
X-Received: by 2002:adf:e190:0:b0:20d:e98:e366 with SMTP id
 az16-20020adfe190000000b0020d0e98e366mr47310131wrb.472.1653926436596; 
 Mon, 30 May 2022 09:00:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxm5G/dEq1swV+awwRivwIskKYC/u1qI9gOxfexY8GyiB7XpTCmOeiid+R14HYRBCnfWgwdUg==
X-Received: by 2002:adf:e190:0:b0:20d:e98:e366 with SMTP id
 az16-20020adfe190000000b0020d0e98e366mr47310110wrb.472.1653926436333; 
 Mon, 30 May 2022 09:00:36 -0700 (PDT)
Received: from redhat.com ([2.53.142.172]) by smtp.gmail.com with ESMTPSA id
 f15-20020a5d58ef000000b0020d117a4e00sm9163980wrd.105.2022.05.30.09.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:00:35 -0700 (PDT)
Date: Mon, 30 May 2022 12:00:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Cedric Le Goater <clg@kaod.org>
Subject: Re: [PULL v2 75/86] include/hw/pci/pcie_host: Correct
 PCIE_MMCFG_SIZE_MAX
Message-ID: <20220530115950-mutt-send-email-mst@kernel.org>
References: <20220516204913.542894-1-mst@redhat.com>
 <20220516204913.542894-76-mst@redhat.com>
 <96abb644-4031-7d7f-db45-6376f8f74161@gmail.com>
 <de56b35-c77-e979-b8bd-17c439f4b56d@eik.bme.hu>
 <bbab97ff-c24f-7318-ed83-218e52481451@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbab97ff-c24f-7318-ed83-218e52481451@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 30, 2022 at 11:42:41AM +0200, Thomas Huth wrote:
> On 26/05/2022 17.54, BALATON Zoltan wrote:
> > Hello,
> > 
> > On Thu, 26 May 2022, Daniel Henrique Barboza wrote:
> > > Hi,
> > > 
> > > This patch broke the boot of the sam460ex ppc machine:
> > > 
> > > qemu-system-ppc -M sam460ex -kernel
> > > ./buildroot/qemu_ppc_sam460ex-latest/vmlinux \
> > > -device virtio-net-pci,netdev=net0 -netdev user,id=net0 -serial mon:stdio \
> > > -nographic -snapshot
> > > qemu-system-ppc: ../hw/pci/pcie_host.c:97: pcie_host_mmcfg_init:
> > > Assertion `size <= PCIE_MMCFG_SIZE_MAX' failed.
> > 
> > Thanks for noticing this. I usually only test it during the freeze.
> > Wasn't there a test patch submitted by Philippe before? Isn't that yet
> > merged or included in CI? That should catch these before breaking it.
> 
> Seems like there is only the (primitive) boot-serial test so far:
> 
> $ grep -r sam460ex tests/
> tests/qtest/boot-serial-test.c:    { "ppc", "sam460ex", "-m 256", "DRAM:  256 MiB" },
> tests/qtest/boot-serial-test.c:    { "ppc64", "sam460ex", "-device e1000", "8086  100e" },

Hmm why don't these tests catch the issue?

> If there is a guest kernel available for public download somewhere,
> it would be great if you could add an avocado test for this machine
> (see e.g. the tests/avocado/ppc_*.py files for a template).
> 
>  Thomas


