Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E5D5842DE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 17:18:42 +0200 (CEST)
Received: from localhost ([::1]:50374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH5Hd-0008Rz-0Z
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 11:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oH59B-0000WA-EU
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:09:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oH597-0004iv-Hm
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659020992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d3oWlHhfeCLKsDZPtTSW4/dJYZg0impOxzhyAdEDS0g=;
 b=B4tafWnnj5Wr6J5nk7hCsNZFz5cG5o7C6UoDgchLQP7/adpkyTg0LCTG0xhfGsQHQ8mGTm
 X6r5BGY4+TneocSHfjkiMxmq8+jc1lciJjcJTPPaMaHBhhrElXgIIaPFscegQ8UZ06Q6rf
 dEhmIgq4HJdM4STF2B8XMM/l1wwjrkc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-xFCKbbY4NlecyJZqO0Aydw-1; Thu, 28 Jul 2022 11:09:51 -0400
X-MC-Unique: xFCKbbY4NlecyJZqO0Aydw-1
Received: by mail-wr1-f72.google.com with SMTP id
 j4-20020adfa544000000b0021ebac13bf3so486662wrb.19
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 08:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=d3oWlHhfeCLKsDZPtTSW4/dJYZg0impOxzhyAdEDS0g=;
 b=yJ40qdISRZhrOXb1M3GOhAuTSiIRKcnMmc6nfPeBMYdaxofZCGjQ70mpw7VGphyi28
 I5LxTjqi4lGnFJ0YEh39xzpR5Zs4t2N7ymHC95KdGTulXqDaEs1h9pkMD6z3Zj92k/50
 3bcwzlRPajAbZF6ZqypZvudfvXILQvq/N7VF0Abn99uPViWWtR78DtJjUB3yL3+rW6lt
 53BvqBKdEdZjitwOhw/ZU3qiL/W1J10QEHkg6HfLJXglsXnQLtwHC6y37K4X5EgRpwXt
 NNgecGsMSgCyGnbd6qC/9y4TAihSOD/txpUqRCcby/h/UMBQxayZorQy9vS7EbevsbAP
 NqAw==
X-Gm-Message-State: AJIora/7LxlW8yf0JJExPBesVozRexgqs/kKHtdXd/8c3DcSv3cddfwt
 +AIJm9WQISQNqPCuuEJ/Bjj/+y6jpukAFzgMMvYRCdv1DPw1mzF4oPJHv1iZfr9UbyPwJsYI2z5
 amN9VKHkzzL23ejk=
X-Received: by 2002:a5d:5846:0:b0:21e:8ddd:4b58 with SMTP id
 i6-20020a5d5846000000b0021e8ddd4b58mr12399127wrf.323.1659020989790; 
 Thu, 28 Jul 2022 08:09:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ucAbUyOI/SjyT3bwnUWWDl3l4mdzP2PEGBAEtK8+p5+rA7R3Dg44ASH4vHsZh2+uRHJ+7Bmw==
X-Received: by 2002:a5d:5846:0:b0:21e:8ddd:4b58 with SMTP id
 i6-20020a5d5846000000b0021e8ddd4b58mr12399098wrf.323.1659020989290; 
 Thu, 28 Jul 2022 08:09:49 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 t11-20020a5d690b000000b0021d65e9d449sm1165320wru.73.2022.07.28.08.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 08:09:48 -0700 (PDT)
Date: Thu, 28 Jul 2022 16:09:46 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, peter.maydell@linaro.org, ani@anisinha.ca,
 mst@redhat.com
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features of
 PIIX4_PM
Message-ID: <YuKmuvgqMQtTXVjX@work-vm>
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <YuKgxM4IjAXh/goO@work-vm> <20220728165411.5701befb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728165411.5701befb@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Igor Mammedov (imammedo@redhat.com) wrote:
> On Thu, 28 Jul 2022 15:44:20 +0100
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Igor Mammedov (imammedo@redhat.com) wrote:
> > > QEMU crashes trying to save VMSTATE when only MIPS target are compiled in
> > >   $ qemu-system-mips -monitor stdio
> > >   (qemu) migrate "exec:gzip -c > STATEFILE.gz"
> > >   Segmentation fault (core dumped)
> > > 
> > > It happens due to PIIX4_PM trying to parse hotplug vmstate structures
> > > which are valid only for x86 and not for MIPS (as it requires ACPI
> > > tables support which is not existent for ithe later)
> > > 
> > > Issue was probably exposed by trying to cleanup/compile out unused
> > > ACPI bits from MIPS target (but forgetting about migration bits).
> > > 
> > > Disable compiled out features using compat properties as the least
> > > risky way to deal with issue.  
> > 
> > Isn't the problem partially due to a 'stub' vmsd which isn't terminated?
> 
> Not sure what "'stub' vmsd" is, can you explain?

In hw/acpi/acpi-pci-hotplug-stub.c there is :
const VMStateDescription vmstate_acpi_pcihp_pci_status;

this seg happens when the migration code walks into that - this should
always get populated with some of the minimal fields, in particular the
.name and .fields array terminated with VMSTATE_END_OF_LIST().

Dave

> > 
> > Dave
> > 
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > ---
> > > PS:
> > > another approach could be setting defaults to disabled state and
> > > enabling them using compat props on PC machines (which is more
> > > code to deal with => more risky) or continue with PIIX4_PM
> > > refactoring to split x86-shism out (which I'm not really
> > > interested in due to risk of regressions for not much of
> > > benefit)
> > > ---
> > >  hw/mips/malta.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > > 
> > > diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> > > index 7a0ec513b0..0e932988e0 100644
> > > --- a/hw/mips/malta.c
> > > +++ b/hw/mips/malta.c
> > > @@ -1442,6 +1442,14 @@ static const TypeInfo mips_malta_device = {
> > >      .instance_init = mips_malta_instance_init,
> > >  };
> > >  
> > > +GlobalProperty malta_compat[] = {
> > > +    { "PIIX4_PM", "memory-hotplug-support", "off" },
> > > +    { "PIIX4_PM", "acpi-pci-hotplug-with-bridge-support", "off" },
> > > +    { "PIIX4_PM", "acpi-root-pci-hotplug", "off" },
> > > +    { "PIIX4_PM", "x-not-migrate-acpi-index", "true" },
> > > +};
> > > +const size_t malta_compat_len = G_N_ELEMENTS(malta_compat);
> > > +
> > >  static void mips_malta_machine_init(MachineClass *mc)
> > >  {
> > >      mc->desc = "MIPS Malta Core LV";
> > > @@ -1455,6 +1463,7 @@ static void mips_malta_machine_init(MachineClass *mc)
> > >      mc->default_cpu_type = MIPS_CPU_TYPE_NAME("24Kf");
> > >  #endif
> > >      mc->default_ram_id = "mips_malta.ram";
> > > +    compat_props_add(mc->compat_props, malta_compat, malta_compat_len);
> > >  }
> > >  
> > >  DEFINE_MACHINE("malta", mips_malta_machine_init)
> > > -- 
> > > 2.31.1
> > >   
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


