Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A0E583FE0
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:23:58 +0200 (CEST)
Received: from localhost ([::1]:41590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH3Ub-0000e7-IO
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH3NU-0002qg-JN
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:16:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH3NQ-0003FP-TV
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659014191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5AI7gEcauDVRcNhvEJ+ss1MBv3WS+UEYNQmXQ2mpLaA=;
 b=O0PoXjocyR0D+DBGrTB8MO5B0nMTOoPe3pXrKxIlWBb0c99KFyhUsy6NwALV+EurhK5gga
 h335vCZtAOYNMWBDZE3giHzeP5mHdtoQHvS4cLRgZuYTLk4vPOarxsf6DWVkGcwDrJngWD
 ArHCEIYVh88yQ/89zDPW6qp2B8pokN4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-07lxpgYzN8ykEc-qGJXgkw-1; Thu, 28 Jul 2022 09:16:30 -0400
X-MC-Unique: 07lxpgYzN8ykEc-qGJXgkw-1
Received: by mail-ed1-f70.google.com with SMTP id
 y2-20020a056402440200b0043bd6c898deso1101311eda.20
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5AI7gEcauDVRcNhvEJ+ss1MBv3WS+UEYNQmXQ2mpLaA=;
 b=ZpPDIcDgYrzun3kUvLZhFOSyfOB2xC34mkaFy3Ti0XRCLHj9au85DKvVIlLySmtoH1
 Fo4bWjTV4A7caWR8fSFdABadRZ70VUR0hXtk335Z6CoUYib2sSbfp955WEYo2iOOEzvi
 JCmA5SjvXpFXtbCClXwU5gfmIYt5ZogS4/Jqcel7THUsRpSt66uulH0bSmu5g3iAi/aO
 +D4UV1jPz2milk5TKw0t7UXiCXCHd02Hi2/77BtntwlWfcFF1iXfOZ0Vdaxca+9AjkgJ
 bjNOnpf86jkVPtE1gBK+XAMModv1DQFs35hc4zygiPhj3Pr5/FGGA/GRwNwxCK2t/OHl
 WEGQ==
X-Gm-Message-State: AJIora/aF/5hMBVbjcq78leAPRhyNAaNESMp5HEbEf+MD3PyfTI+HGIc
 8HgZuVC8VgpHCK8GpxYgomdqL5SqelbaESTvGP1bboXAqLwiLajK9kaxBCw0LAFw3L0L01AMYKD
 0P1B30ViFR3vmgXo=
X-Received: by 2002:a17:907:2888:b0:72b:8f41:1405 with SMTP id
 em8-20020a170907288800b0072b8f411405mr20183000ejc.564.1659014189239; 
 Thu, 28 Jul 2022 06:16:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t1SUc6wdZtsN8TFMvC7f43BgF7J8MWCymetCKqGYhIux3ZvfVHmAhMl3/Nwcpmx4S4zzLnlg==
X-Received: by 2002:a17:907:2888:b0:72b:8f41:1405 with SMTP id
 em8-20020a170907288800b0072b8f411405mr20182984ejc.564.1659014188925; 
 Thu, 28 Jul 2022 06:16:28 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 r26-20020a170906365a00b0072fdb26bd9fsm412832ejb.172.2022.07.28.06.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 06:16:28 -0700 (PDT)
Date: Thu, 28 Jul 2022 15:16:27 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, ani@anisinha.ca, dgilbert@redhat.com,
 mst@redhat.com
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features
 of PIIX4_PM
Message-ID: <20220728151627.119d57d5@redhat.com>
In-Reply-To: <CAFEAcA95sRW8u2NFDa1BX7uNg2t85Yr_kPgWWC+5QnJobygwMA@mail.gmail.com>
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <CAFEAcA95sRW8u2NFDa1BX7uNg2t85Yr_kPgWWC+5QnJobygwMA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Thu, 28 Jul 2022 13:29:07 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 28 Jul 2022 at 12:50, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > QEMU crashes trying to save VMSTATE when only MIPS target are compiled in
> >   $ qemu-system-mips -monitor stdio
> >   (qemu) migrate "exec:gzip -c > STATEFILE.gz"
> >   Segmentation fault (core dumped)
> >
> > It happens due to PIIX4_PM trying to parse hotplug vmstate structures
> > which are valid only for x86 and not for MIPS (as it requires ACPI
> > tables support which is not existent for ithe later)
> >
> > Issue was probably exposed by trying to cleanup/compile out unused
> > ACPI bits from MIPS target (but forgetting about migration bits).
> >
> > Disable compiled out features using compat properties as the least
> > risky way to deal with issue.
> >
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/995
> 
> > ---
> > PS:
> > another approach could be setting defaults to disabled state and
> > enabling them using compat props on PC machines (which is more
> > code to deal with => more risky) or continue with PIIX4_PM
> > refactoring to split x86-shism out (which I'm not really
> > interested in due to risk of regressions for not much of
> > benefit)
> > ---
> >  hw/mips/malta.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> > index 7a0ec513b0..0e932988e0 100644
> > --- a/hw/mips/malta.c
> > +++ b/hw/mips/malta.c
> > @@ -1442,6 +1442,14 @@ static const TypeInfo mips_malta_device = {
> >      .instance_init = mips_malta_instance_init,
> >  };
> >
> > +GlobalProperty malta_compat[] = {
> > +    { "PIIX4_PM", "memory-hotplug-support", "off" },
> > +    { "PIIX4_PM", "acpi-pci-hotplug-with-bridge-support", "off" },
> > +    { "PIIX4_PM", "acpi-root-pci-hotplug", "off" },
> > +    { "PIIX4_PM", "x-not-migrate-acpi-index", "true" },
> > +};  
> 
> Is there an easy way to assert in hw/acpi/piix4.c that if
> CONFIG_ACPI_PCIHP was not set then the board has initialized
> all these properties to the don't-use-hotplug state ?
> That would be a guard against similar bugs (though I suppose
> we probably aren't likely to add new piix4 boards...)

unfortunately new features still creep in 'pc' machine
ex: "acpi-root-pci-hotplug"), and I don't see an easy
way to compile that nor enforce that in the future.

Far from easy would be split piix4_pm on base/enhanced
classes so we wouldn't need x86 specific hacks in 'base'
variant (assuming 'enhanced' could maintain the current
VMSTATE to keep cross-version migration working).

> > +const size_t malta_compat_len = G_N_ELEMENTS(malta_compat);
> > +
> >  static void mips_malta_machine_init(MachineClass *mc)
> >  {
> >      mc->desc = "MIPS Malta Core LV";
> > @@ -1455,6 +1463,7 @@ static void mips_malta_machine_init(MachineClass *mc)
> >      mc->default_cpu_type = MIPS_CPU_TYPE_NAME("24Kf");
> >  #endif
> >      mc->default_ram_id = "mips_malta.ram";
> > +    compat_props_add(mc->compat_props, malta_compat, malta_compat_len);
> >  }
> >
> >  DEFINE_MACHINE("malta", mips_malta_machine_init)
> > --
> > 2.31.1  
> 
> thanks
> -- PMM
> 


