Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 229BE598135
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 12:01:40 +0200 (CEST)
Received: from localhost ([::1]:53496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOcLL-0006vj-50
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 06:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOcEn-00008W-KF
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:54:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOcEk-0003i2-Go
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:54:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660816488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lvvd7Zxpuz0NZVqxNTb2umlO6ujnnDXYfYjn8KNSMtI=;
 b=RFT6rnEyr/RoBniP2XSQm4mOEK1a/YQWJ3iveEjksOk//9ARgiTlRoW7kNsaqNZ8Ap1kau
 4OoVbqqqiJJGsTcWAke5SHNgUMYmomdbC2GWMxnuGvbKXjYgklgsmfOdweXUmfzaDJ4stK
 3zlvtwFWsFe2P2erBhM/K3ohsWMOmfI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-221-FErTBipkNHCRkb-aKh4gag-1; Thu, 18 Aug 2022 05:54:47 -0400
X-MC-Unique: FErTBipkNHCRkb-aKh4gag-1
Received: by mail-wm1-f71.google.com with SMTP id
 c64-20020a1c3543000000b003a61987ffb3so720143wma.6
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 02:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=lvvd7Zxpuz0NZVqxNTb2umlO6ujnnDXYfYjn8KNSMtI=;
 b=uante8/OZ4Q0o0OBRTJpDPjA1fBq3wvQ+pwL8IJSZFmk0x2kvWhgKb09bwGNGDr7NE
 /cYfuZ3aoRL/283PmYSbhrQlbZdqv6UGcwS3+gbik7DNVPjrj/CN0vKzUoGhtl+syJ9A
 izCmj6b2in2IhYeHOOMnl7V2QZ7dt/acNMqiJtCPI9m7FIf4IxMYdxKtqi+D0eA/Te/A
 72oEwlmoNKbstUH35kLwqp1Ck436unekwZ4lD95NlOSSXPx0A81j581BXXrM8NySPruW
 WRzj9debIM+PZHPF/24fMXvGwOG82yuyTd0d3YvS+JRSKD2LvUUY0NBBU1a6ME9yEqfy
 UGOg==
X-Gm-Message-State: ACgBeo2Xk/4inTQucEQTLs5JWXHkRVaeoGfuzvsE5yB1yBjcLX0+mhAt
 9T0WqEO1DyKfY+AVqnjMPmg0Nc1TrH2K6njyigbJLkrj9UHPixIKhO1tIbV1DO+8UGaU8mV7pMO
 r7h0jBn2Q2uf+7uo=
X-Received: by 2002:adf:db4d:0:b0:225:2fe0:8d08 with SMTP id
 f13-20020adfdb4d000000b002252fe08d08mr846694wrj.362.1660816486127; 
 Thu, 18 Aug 2022 02:54:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5PMpK10WsWOjqgF6aRDIuzaEvj6yccKGoVhm19MryObao2K65x8Nu/sJvmpVW2j/SzMT9uug==
X-Received: by 2002:adf:db4d:0:b0:225:2fe0:8d08 with SMTP id
 f13-20020adfdb4d000000b002252fe08d08mr846678wrj.362.1660816485841; 
 Thu, 18 Aug 2022 02:54:45 -0700 (PDT)
Received: from redhat.com ([2.55.43.215]) by smtp.gmail.com with ESMTPSA id
 u18-20020adfdb92000000b0021eaf4138aesm1149302wri.108.2022.08.18.02.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 02:54:45 -0700 (PDT)
Date: Thu, 18 Aug 2022 05:54:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Sergio Lopez <slp@redhat.com>
Subject: Re: [PULL 05/10] x86: disable rng seeding via setup_data
Message-ID: <20220818055350-mutt-send-email-mst@kernel.org>
References: <20220817161342.240674-1-mst@redhat.com>
 <20220817161342.240674-6-mst@redhat.com>
 <52a9fe51-335c-c3a1-a4ed-53d5f46b4fd8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52a9fe51-335c-c3a1-a4ed-53d5f46b4fd8@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Thu, Aug 18, 2022 at 11:27:30AM +0200, Paolo Bonzini wrote:
> On 8/17/22 18:14, Michael S. Tsirkin wrote:
> > @@ -332,7 +332,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
> >       rom_set_fw(fw_cfg);
> >       if (machine->kernel_filename != NULL) {
> > -        x86_load_linux(x86ms, fw_cfg, 0, true, false);
> > +        x86_load_linux(x86ms, fw_cfg, 0, true, true);
> >       }
> >       if (mms->option_roms) {
> > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > index a5c65c1c35..20962c34e7 100644
> > --- a/hw/i386/pc_piix.c
> > +++ b/hw/i386/pc_piix.c
> > @@ -439,6 +439,7 @@ static void pc_i440fx_7_1_machine_options(MachineClass *m)
> >       m->alias = "pc";
> >       m->is_default = true;
> >       pcmc->default_cpu_version = 1;
> > +    pcmc->legacy_no_rng_seed = true;
> >   }
> >   DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
> > @@ -450,7 +451,6 @@ static void pc_i440fx_7_0_machine_options(MachineClass *m)
> >       pc_i440fx_7_1_machine_options(m);
> >       m->alias = NULL;
> >       m->is_default = false;
> > -    pcmc->legacy_no_rng_seed = true;
> >       pcmc->enforce_amd_1tb_hole = false;
> >       compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
> >       compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
> > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > index 3a35193ff7..2e5dae9a89 100644
> > --- a/hw/i386/pc_q35.c
> > +++ b/hw/i386/pc_q35.c
> > @@ -376,6 +376,7 @@ static void pc_q35_7_1_machine_options(MachineClass *m)
> >       pc_q35_machine_options(m);
> >       m->alias = "q35";
> >       pcmc->default_cpu_version = 1;
> > +    pcmc->legacy_no_rng_seed = true;
> >   }
> >   DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
> > @@ -386,7 +387,6 @@ static void pc_q35_7_0_machine_options(MachineClass *m)
> >       PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
> >       pc_q35_7_1_machine_options(m);
> >       m->alias = NULL;
> > -    pcmc->legacy_no_rng_seed = true;
> >       pcmc->enforce_amd_1tb_hole = false;
> >       compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
> >       compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
> 
> Why not just revert the whole patch?
> 
> Paolo

At this point I was looking for a minimally intrusive change.

-- 
MST


