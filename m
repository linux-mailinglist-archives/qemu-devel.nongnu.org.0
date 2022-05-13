Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61DC525CC7
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 10:05:08 +0200 (CEST)
Received: from localhost ([::1]:37244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npQIM-0007DG-BZ
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 04:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1npQ5m-0006U9-FV
 for qemu-devel@nongnu.org; Fri, 13 May 2022 03:52:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1npQ5h-0004L3-Em
 for qemu-devel@nongnu.org; Fri, 13 May 2022 03:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652428319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NBuRp8Tu/P8sFgtwvTlKh9zjaYJ1APDke1VCVrw8tgg=;
 b=dUEiFoJyftZN9/yUbs6i9L0qauP4/VBTIbkQn8nkjkdzxFCdnLil3ffU9v+KiH49FAkKbG
 2+ht9f4yfhRputKxxJvhzbhlt80izLtpexYhe/4a2tOwuPHLizbYdf17PfH7ltzBlgULNT
 KVLub4Cll7ddfMaLN2l2xK8C24RudVg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-At0fj3mxOjqaZ4YZZiqTQA-1; Fri, 13 May 2022 03:51:57 -0400
X-MC-Unique: At0fj3mxOjqaZ4YZZiqTQA-1
Received: by mail-wm1-f69.google.com with SMTP id
 u3-20020a05600c210300b0039430c7665eso2732612wml.2
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 00:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NBuRp8Tu/P8sFgtwvTlKh9zjaYJ1APDke1VCVrw8tgg=;
 b=s15DSFMgB8AAwu0PUZ0j1NAf2EzRr+QIrGy8/tZ8O8WVoErGIXyGvJT/kHPmLm/62m
 RDOkFJvvyIBVBcRvEKRo3j632Ab8mKm2MTimjZshfaI3tYkGfbsIC9KUPcaLoJOE0/kc
 3Nz94By7/If6LxG7uUqbdQy1gO65+yX6qA0cV9hBe22tnrC4RYlH6lozrjZaJbyN0Wvh
 ZutdUnQwsRBtX/5j7YzzcHda+9rUM0jIV3YSecNHohDlOi90F7+fGxq1YfattYe8Axbl
 H+ZUezahNI4xyv/U3Cr9zflLtwqdbVugGVu4VZRxWoBT1gj5omepvdTsYSiaVhsUwsTp
 5pVA==
X-Gm-Message-State: AOAM532DqMYWeRxw3bOiOiQQW42im+RsQUNU9gYb4CrSJmOGdiLh8aiB
 Hl9Wz2CxgJ904Bt/KdjXYYgNrwU1flQVxUntuxEob+GakWHx6KoiyetxDOVPqaGUoAlN7xm0H/s
 mgpoUE+PDkYJjTB0=
X-Received: by 2002:a7b:cc8e:0:b0:393:fbf9:ab72 with SMTP id
 p14-20020a7bcc8e000000b00393fbf9ab72mr13664506wma.70.1652428316357; 
 Fri, 13 May 2022 00:51:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2ZJHYJ1RL7SuXoPzwfpY6AM3YsLwaJP9ceEOZ2S7Bj5vBrRKHl3nT6xue1OcmjSwSqteufw==
X-Received: by 2002:a7b:cc8e:0:b0:393:fbf9:ab72 with SMTP id
 p14-20020a7bcc8e000000b00393fbf9ab72mr13664493wma.70.1652428316132; 
 Fri, 13 May 2022 00:51:56 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a1ce914000000b003942a244f3dsm4639373wmc.22.2022.05.13.00.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 00:51:55 -0700 (PDT)
Date: Fri, 13 May 2022 09:51:54 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 10/10] test: tpm-tis: Add Sysbus TPM-TIS device test
Message-ID: <20220513095154.7a015ff9@redhat.com>
In-Reply-To: <CAFEAcA_2kLcL4j9Dgv5QfWw5d2shK1GBrGXFMffWKgfVguWgqw@mail.gmail.com>
References: <20200305165149.618-1-eric.auger@redhat.com>
 <20200305165149.618-11-eric.auger@redhat.com>
 <CAFEAcA8pC4RQ3oVVVzG4NA8fBkhzspxD+DyZB+UCn7u1aPSP5A@mail.gmail.com>
 <52bdff5a-f33a-c76b-0e04-b20970e3ec1d@redhat.com>
 <CAFEAcA_2kLcL4j9Dgv5QfWw5d2shK1GBrGXFMffWKgfVguWgqw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, 12 May 2022 17:05:41 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 12 May 2022 at 16:59, Eric Auger <eric.auger@redhat.com> wrote:
> >
> > Hi Peter,
> >
> > On 5/12/22 15:08, Peter Maydell wrote:  
> > > On Thu, 5 Mar 2020 at 16:52, Eric Auger <eric.auger@redhat.com> wrote:  
> > >> The tests themselves are the same as the ISA device ones.
> > >> Only the main() changes as the "tpm-tis-device" device gets
> > >> instantiated. Also the base address of the device is not
> > >> 0xFED40000 anymore but matches the base address of the
> > >> ARM virt platform bus.
> > >>
> > >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > >> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>  
> > > Hi Eric; the commit adding this test is from back in 2020, but I've
> > > just noticed something a bit odd about it:
> > >  
> > >> +    args = g_strdup_printf(
> > >> +        "-machine virt,gic-version=max -accel tcg "
> > >> +        "-chardev socket,id=chr,path=%s "
> > >> +        "-tpmdev emulator,id=dev,chardev=chr "
> > >> +        "-device tpm-tis-device,tpmdev=dev",
> > >> +        test.addr->u.q_unix.path);  
> > > This 'virt' command line doesn't specify a CPU type, so it
> > > will end up running with a Cortex-A15 (32-bit). Was
> > > that intended? Also, it will get a GICv3, which is a
> > > definitely odd combination with an A15, which was a GICv2 CPU...  
> > no it is not intended. I guess it should include "-cpu max" too
> > as arm-cpu-features.c does?  
> 
> Seems like a reasonable thing to set, yes.
> 
> > > I noticed this because I have some recent GICv3 patches which
> > > end up asserting if the GICv3 and a non-GICv3 CPU are used together,
> > > and this test case triggers them. Since the user can also cause
> > > an assert with that kind of command line I'm going to rework them
> > > (either to make the virt board fail cleanly or else to make the
> > > GICv3 code do something plausible even if the real hardware CPU
> > > nominally didn't have a GICv3). But maybe we should make this
> > > test case not use a non-standard combination anyway? (The meson
> > > conversion seems to have resulted in this test being run under
> > > qemu-system-arm as well, incidentally, so I guess we would want
> > > it to specify either 'a 64 bit CPU and GICv3' or 'a 32 bit
> > > CPU and GICv2' accordingly. Or limit the test to aarch64...)  
> > limiting the test to aarch64 may be enough?  
> 
> Mmm, if running the test under 'qemu-system-arm' isn't giving
> us interesting extra coverage we might as well save the CI cycles.

agreed,
we probably should limit all ARM tests in bios-tables-test to aarch64
'qemu-system-arm' doesn't give us anything extra on top of what aarch64
already does.

> 
> -- PMM
> 


