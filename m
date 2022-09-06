Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835295AE16C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 09:44:05 +0200 (CEST)
Received: from localhost ([::1]:45738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVTFc-0007Pt-L9
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 03:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oVTBl-0003Az-NA
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:40:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oVTBg-000492-Jc
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:40:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662449999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vFZHyRys45niAr3aT5+wkU1LgJ6aC3CCaRPi/xfSu/4=;
 b=NBoi++ziwUsC4sqYzZ4U1MDNfsnzNN5AG6Ebt7HbYxshEQiPxidJFCwXEzvck7wLyINxsd
 rSb2WH7f798nE96JUpbpOIgj3q4REVU08ZJyGprenU2d0+7K+ewa48C3CSkW4tP0orIwBx
 QisQybfEKQ4zazzE92JDHMwTmhQE1/A=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-150-NW5uirgGPES95UYhRqTuUg-1; Tue, 06 Sep 2022 03:39:55 -0400
X-MC-Unique: NW5uirgGPES95UYhRqTuUg-1
Received: by mail-ej1-f71.google.com with SMTP id
 sd6-20020a1709076e0600b0073315809fb5so3105481ejc.10
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 00:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=vFZHyRys45niAr3aT5+wkU1LgJ6aC3CCaRPi/xfSu/4=;
 b=SqN9Fc8DiD8I/U2UcwMSbk4hy2xPAVUhVLNwkB1uNhR6BYRjfck1QnW0l3g9l6GvLr
 m2M+mHs72Ydgz7JF86++BzvjklYf1eJcoQEaFpKUwepKquvU3xWQwPEXW29FANXd3yNG
 5A504/1YX1wYk05Z/6eUHr6pFBqZN7CDr2fcaSEoeFs6mSFTsCJQi6F5BczAUEaCxKl2
 8QsiFb1tIwN1OjaPkTpRXz6R2WCv7PJiu5XRR5IChDzYyvLpbfRbKP0KhY/2JcGac1AH
 bXC8mmEva91uigjSNCGTYmi6mPE2WOqIogZThnASd8gDfLKitB5wgmlKKNq37/sUns7b
 RIJQ==
X-Gm-Message-State: ACgBeo01FMPhVNK+mdPMhkfP0hj/VLQEYPkZxY6uKgtRIMnzGljunGgk
 Hyk+49cGgcb9eD4eMgR5gazWbJIgcc+Q62lhMVndRYbvmOVwNrhJ/13dh1JXyPxyazHB53RvvPA
 YaGFnoljRkGYu6x0=
X-Received: by 2002:a17:906:770d:b0:73c:a08f:593c with SMTP id
 q13-20020a170906770d00b0073ca08f593cmr40408279ejm.182.1662449994425; 
 Tue, 06 Sep 2022 00:39:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6KQd9Ju8eLYuqBS+5hpI51nwUPPsbfwWGVHbQkya8vCcZRKwQw0n4zOtTCzC3RKFYPZcTQ4A==
X-Received: by 2002:a17:906:770d:b0:73c:a08f:593c with SMTP id
 q13-20020a170906770d00b0073ca08f593cmr40408264ejm.182.1662449994251; 
 Tue, 06 Sep 2022 00:39:54 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 ch29-20020a0564021bdd00b0044657ecfbb5sm7886526edb.13.2022.09.06.00.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 00:39:53 -0700 (PDT)
Date: Tue, 6 Sep 2022 09:39:52 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org, kkostiuk@redhat.com,
 yvugenfi@redhat.com, yiwei@redhat.com, ybendito@redhat.com,
 jusual@redhat.com
Subject: Re: [RFC PATCH] hw/acpi: do not let OSPM set pcie native hotplug
 when acpi hotplug is enabled
Message-ID: <20220906093952.736ca756@redhat.com>
In-Reply-To: <971e9a8-f9a1-4280-3fc5-4b695d42698b@anisinha.ca>
References: <20220905072531.8059-1-ani@anisinha.ca>
 <20220905175225.74881174@redhat.com>
 <9e83cb29-98f6-02d-7f60-aed42a316930@anisinha.ca>
 <971e9a8-f9a1-4280-3fc5-4b695d42698b@anisinha.ca>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Mon, 5 Sep 2022 22:25:25 +0530 (IST)
Ani Sinha <ani@anisinha.ca> wrote:

> On Mon, 5 Sep 2022, Ani Sinha wrote:
> 
> >
> >  
> 
> > > >
> > > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > > index 0355bd3dda..3dc9379f27 100644
> > > > --- a/hw/i386/acpi-build.c
> > > > +++ b/hw/i386/acpi-build.c
> > > > @@ -1348,10 +1348,12 @@ static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
> > > >  {
> > > >      Aml *if_ctx;
> > > >      Aml *if_ctx2;
> > > > +    Aml *if_ctx3;
> > > >      Aml *else_ctx;
> > > >      Aml *method;
> > > >      Aml *a_cwd1 = aml_name("CDW1");
> > > >      Aml *a_ctrl = aml_local(0);
> > > > +    Aml *a_pcie_nhp_ctl = aml_local(1);
> > > >
> > > >      method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
> > > >      aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
> > > > @@ -1366,11 +1368,26 @@ static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
> > > >      /*
> > > >       * Always allow native PME, AER (no dependencies)
> > > >       * Allow SHPC (PCI bridges can have SHPC controller)
> > > > -     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
> > > >       */
> > > > -    aml_append(if_ctx, aml_and(a_ctrl,
> > > > -        aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)), a_ctrl));
> > > > +    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));  
> > >
> > > that makes us not actually mask any capabilities since you forgot to mask
> > > bit 1 later under if_ctx3 context.
> > >
> > > So OSPM will see a permanent failure (_OSC failure bit in CWD1)
> > > and will have no idea that PCI Hotplug is not supported since we return CWD3
> > > with this bit still set whoever much it tries to negotiate.  
> >
> > The failure is only returned when the OS requests/probes native hotplug
> > capability in CWD1.  
> 
> I meant CWD3.
For OSPM to know which features are denied by platform, the later must mask
them in returned bitmask, how otherwise you would see above behavior.
(or alternatively OSPM might ignore _OSC results and resort to workarounds/probing
as result enabling native hotplug in which case you would see ATS
detected).

To verify which hotplug is used, you can just trace acpi_pci_* in QEMU and observe
if it's used for unplug or not.


