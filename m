Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3FD61FAFE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 18:16:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os5id-0007eQ-2T; Mon, 07 Nov 2022 12:15:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os5ia-0007dD-Tp
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 12:15:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os5iZ-0003rq-1G
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 12:15:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667841325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BJHwJtJgMwfJKT6EBbx5GmZw0CXp+QPJD5rxD0SOqd0=;
 b=STvWsVf/Q0r3r6PxzCRHkEp6U77Et8fPE8Pee5HWPN6eYB4XtNw3DZnQ8Or7a6Ok78CYSe
 GrzWveOoFQfUpE2G3Uiygzbo6mqtwbd5DSi0mBFk1JoVFmhJkbE1pszH8zf4GCbvw6PYRR
 a4xBy+aVNppwZIYCyzCuA6/PZrdSKC8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-hPsXMGSTNmiAM-D28YsIQg-1; Mon, 07 Nov 2022 12:15:23 -0500
X-MC-Unique: hPsXMGSTNmiAM-D28YsIQg-1
Received: by mail-wr1-f72.google.com with SMTP id
 w23-20020adf8bd7000000b002358f733307so3032713wra.17
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 09:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BJHwJtJgMwfJKT6EBbx5GmZw0CXp+QPJD5rxD0SOqd0=;
 b=ZVg2OtYAxVcdxSEbOuapR2M5VUXjM4/wTUHRoO4LKHYy3LFlxkVf86NZF/YGr4uxeG
 pDCKuKkarNYFvuI1e9FS8zwupRHU10MtO6VUMtq6H2GD+743t7r39lc89htay8/iUW+B
 WBD8SFQoEyC2VGDbTl5CN3SodrbzCxtevzvTJEGyupScWWQMSSd1aB6Z2WnaK5jIYWbE
 4+qPOzZk2WFcWB5IQNP7jzWTh5wgABGqLAeRZu4RCwsOsyauF+TTUwLEwxbvjLIEIwa5
 3/KondP3wG1Z6FosV4jEcKFAdBVIIo9aJAblMYy7/BQmPJ9DrYTnObMw6vW3N3pp6Qcb
 t3Tw==
X-Gm-Message-State: ACrzQf1eme7fd8QWac+xUDVHEb8Xb5i1RzmIfrSWlhALF//x47BnwIC7
 jRL/JJtKU3Dd76whLE6rI7QuNA/QJUD9IBg1SSxplYgopBipioUhhLdUXz3oPkqotInJXUxMS9D
 ggwgalfysaK5WoMs=
X-Received: by 2002:a5d:6a90:0:b0:236:4835:ca94 with SMTP id
 s16-20020a5d6a90000000b002364835ca94mr31970796wru.187.1667841322701; 
 Mon, 07 Nov 2022 09:15:22 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6+Za/mVL2i33+7yJaxoYKaKgeBdDvicrOK47MvB70P8ETCO10usp5a2+4qBBwGiC2uo8HgQQ==
X-Received: by 2002:a5d:6a90:0:b0:236:4835:ca94 with SMTP id
 s16-20020a5d6a90000000b002364835ca94mr31970775wru.187.1667841322348; 
 Mon, 07 Nov 2022 09:15:22 -0800 (PST)
Received: from redhat.com ([169.150.226.212]) by smtp.gmail.com with ESMTPSA id
 l5-20020a1c7905000000b003cf6e1df4a8sm8469025wme.15.2022.11.07.09.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 09:15:21 -0800 (PST)
Date: Mon, 7 Nov 2022 12:15:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] hw/acpi: fix breakage due to missing aml stub
 definitions when acpi is off
Message-ID: <20221107121433-mutt-send-email-mst@kernel.org>
References: <20221107152744.868434-1-ani@anisinha.ca>
 <34fa9010-b654-a8dd-6591-5b0f4aa4e5f6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34fa9010-b654-a8dd-6591-5b0f4aa4e5f6@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Mon, Nov 07, 2022 at 06:08:49PM +0100, Philippe Mathieu-Daudé wrote:
> On 7/11/22 16:27, Ani Sinha wrote:
> > Some HW architectures do not support acpi and CONFIG_ACPI is off for them. For
> > those architectures, dummy stub function definitions help to resolve symbols.
> > This change adds couple of dummy stub definitions so that symbols for those can
> > be resolved and failures such as the following can be fixed for or1k targets.
> > 
> > Configuration:
> > qemu/build $ ../configure --enable-werror --disable-docs --disable-nettle \
> >               --enable-gcrypt --enable-fdt=system --enable-modules \
> >               --enable-trace-backends=dtrace --enable-docs \
> > 	     --enable-vfio-user-server \
> >               --target-list="ppc64-softmmu or1k-softmmu s390x-softmmu x86_64-softmmu
> >   rx-softmmu sh4-softmmu nios2-softmmu"
> > 
> > actual failure:
> > 
> > qemu/build $ QTEST_QEMU_BINARY=./qemu-system-or1k  ./tests/qtest/qos-test
> > 
> > failed to open module:
> > /build/qemu/qemu/build/qemu-bundle/usr/local/lib64/qemu/hw-display-virtio-vga.so:
> > undefined symbol: aml_return
> > qemu-system-or1k: ../util/error.c:59: error_setv: Assertion `*errp ==
> > NULL' failed.
> > Broken pipe
> > ../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from
> > signal 6 (Aborted) (core dumped)
> > Aborted (core dumped)
> > 
> > CC: Bernhard Beschow <shentey@gmail.com>
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >   hw/acpi/aml-build-stub.c | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > changelog:
> > v2: cosmetic commit description format update.
> > 
> > diff --git a/hw/acpi/aml-build-stub.c b/hw/acpi/aml-build-stub.c
> > index 8d8ad1a314..89a8fec4af 100644
> > --- a/hw/acpi/aml-build-stub.c
> > +++ b/hw/acpi/aml-build-stub.c
> > @@ -26,6 +26,16 @@ void aml_append(Aml *parent_ctx, Aml *child)
> >   {
> >   }
> > +Aml *aml_return(Aml *val)
> > +{
> > +    return NULL;
> 
> Can't return NULL, otherwise aml_append() will crash.

This is what rest of functions do.

> We just want the symbol to be defined, so instead:
> 
>       g_assert_not_reached();
> 
> > +}

NULL derefs are actually somewhat easier to debug than asserts.

-- 
MST


