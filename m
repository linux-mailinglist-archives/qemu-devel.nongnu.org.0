Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D046A1F71
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 17:16:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVaih-0007l5-0C; Fri, 24 Feb 2023 11:14:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVaif-0007kW-Er
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 11:14:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVaid-00012h-Kn
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 11:14:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677255286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r6N/H2VMbxq9YEb1nonoc16MaaTKeodJuoF+68VcCWI=;
 b=EIWxk4VG4hh5lvJSbX3oiPMQlNO4p7QW4e4A1gs4OqJl7PJcILUZHuya56I1F4GrI3piDA
 sIoRsim5s31AxZx+4zSgFVSaAs6CRHVThbMBefSpBvmEicMkqHolCI3CjYVIgNIkBGQ/CC
 +npOQvkD5/4e6k+T+pwJApy7ILEywAI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-498-qLGyxTxROISafd5C6xPaGA-1; Fri, 24 Feb 2023 11:14:45 -0500
X-MC-Unique: qLGyxTxROISafd5C6xPaGA-1
Received: by mail-wm1-f71.google.com with SMTP id
 az12-20020a05600c600c00b003e8910ec2fdso4513495wmb.6
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 08:14:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r6N/H2VMbxq9YEb1nonoc16MaaTKeodJuoF+68VcCWI=;
 b=gJmFdZJjIfs+DLyRRl/CQSBlD2JXmrobeD40Ob8lcevkPxoBcGPJVz+MQPrPdjMj5V
 Y9uh4qZMKNuNQMPpqyMju/xkCvgS5OV99pOMYlVDmdWO56unBIiAKe2g+38PxHC5J7mv
 lU7U4kUd4vhveITC5ZkKT+MvlhRpg4/5bfQbqYtV3yblmfcMK/GVDyVLtC0EGraEnstv
 n8hB1jgEbYREjBDXTeHGZE7HaRYZ5Pq3+xWcp30QeeYQVr39oPrvzLhlw3BTdVDU9nka
 K3LYTpo4cf5Whs6po98rQylIU3oz76UyvCDfw3/7VeqfjH3dnRWaH6ZS30HLBb0RxVtC
 m4gg==
X-Gm-Message-State: AO0yUKWogscSq4mnlUfl/JxTDVfPs+G+nSrMxPtzKVycVk+BNszqA0/2
 h/aTVmiw/pUcH2VVKGmv0QYvZTskGLDaNrOttrOPIM49VFyfJc51OKwbhZU/2T97F0fZgAV4Pn6
 f7hjrxwSGLzZRhks=
X-Received: by 2002:adf:fc82:0:b0:2c7:70d:cc36 with SMTP id
 g2-20020adffc82000000b002c7070dcc36mr10047721wrr.5.1677255284416; 
 Fri, 24 Feb 2023 08:14:44 -0800 (PST)
X-Google-Smtp-Source: AK7set+YhjXd/MdN4hRK6w5y50Q/E22rZLQ0F9REqbFxK/uhKQzbiFNhfKuMih2iSWWlV77/TQiYgQ==
X-Received: by 2002:adf:fc82:0:b0:2c7:70d:cc36 with SMTP id
 g2-20020adffc82000000b002c7070dcc36mr10047705wrr.5.1677255284158; 
 Fri, 24 Feb 2023 08:14:44 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003e209b45f6bsm3631876wmq.29.2023.02.24.08.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 08:14:43 -0800 (PST)
Date: Fri, 24 Feb 2023 17:14:42 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Sunil V L <sunilvl@ventanamicro.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, Andrew Jones
 <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, Atish
 Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 04/10] hw/riscv/virt: virt-acpi-build.c: Add basic ACPI
 tables
Message-ID: <20230224171442.5affcb4a@imammedo.users.ipa.redhat.com>
In-Reply-To: <CAEUhbmX6J5ja+_zdRQ8wuqKyU4uquM6ytnJMtqSfN2CSfLv=MA@mail.gmail.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-5-sunilvl@ventanamicro.com>
 <CAEUhbmXhXw7juMQTW7-XxSLwhcJrOiZ=4fiwFFAyoXj+sL0jUQ@mail.gmail.com>
 <Y+D/frPU/TE1aj7y@sunil-laptop>
 <CAEUhbmU2cofq767-9Lfs2CF+DzpZ6FCHz1ox1TC1siPs5uUdWQ@mail.gmail.com>
 <Y+KVPaVQPcoItBbV@sunil-laptop>
 <CAEUhbmX6J5ja+_zdRQ8wuqKyU4uquM6ytnJMtqSfN2CSfLv=MA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
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

On Wed, 8 Feb 2023 09:06:48 +0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> On Wed, Feb 8, 2023 at 2:15 AM Sunil V L <sunilvl@ventanamicro.com> wrote:
> >
> > On Wed, Feb 08, 2023 at 12:10:55AM +0800, Bin Meng wrote:  
> > > On Mon, Feb 6, 2023 at 9:24 PM Sunil V L <sunilvl@ventanamicro.com> wrote:  
> > > >
> > > > On Mon, Feb 06, 2023 at 06:17:50PM +0800, Bin Meng wrote:  
> > > > > On Thu, Feb 2, 2023 at 12:54 PM Sunil V L <sunilvl@ventanamicro.com> wrote:  
> > > > > >
> > > > > > Add few basic ACPI tables and DSDT with few devices in a
> > > > > > new file virt-acpi-build.c.
> > > > > >
> > > > > > These are mostly leveraged from arm64.  
> > > > >
> > > > > There are lots of same ACPI codes existing in x86/arm/riscv. I believe
> > > > > some refactoring work is needed before ACPI support fully lands on
> > > > > RISC-V.
> > > > > For example, we can extract the common part among x86/arm/riscv into a
> > > > > separate file, like hw/acpi/acpi-build.c?
> > > > >  
> > > >
> > > > While it appears like there is same code in multiple places, those
> > > > functions take architecture specific MachineState parameter. Some tables
> > > > like MADT though with same name, will have different contents for
> > > > different architectures.
> > > >
> > > > Only one function which Daniel also pointed is the wrapper
> > > > acpi_align_size() which can be made common. I am not
> > > > sure whether it is worth of refactoring.
> > > >  
> > >
> > > It's more than that. For example,
> > >
> > > With acpi_dsdt_add_cpus(), the only meaningful parameter is the number
> > > of cpus, so there is no need to pass the architecture specific
> > > MachineState as the parameter.
> > >  
> > I would not make this function common. The reason is, an architecture may
> > choose to attach different ACPI objects under the CPU node.
> >  
> 
> Is it possible to insert architect specific CPU nodes after this
> common API builds the basic CPU node in DSDT?

What do you mean by "architect specific CPU", any examples?

> 
> > > Likewise, acpi_dsdt_add_fw_cfg() can be made generic as well.
> > >  
> > The issue is, these things are not exactly common across all architectures.
> > x86 has bit different data in these objects. While today it appears they
> > are same for riscv and arm, in future things may change for an architecture.
> > It doesn't look like it is a standard practice to build files under
> > hw/acpi for specific architectures. Hence, IMO, it is better to keep these
> > things in architecture specific folders to allow them to do differently in
> > future.
> >  
> 
> It looks like hw/acpi/ghes.c is for Arm from MAINTAINERS.
> 
> > But I look forward for the feedback from other architecture maintainers on
> > this topic. My experience in qemu is very limited. So, I need help from
> > experts.  
> 
> + Michael and Igor
> 
> Regards,
> Bin
> 


