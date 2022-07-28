Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BA0584268
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:58:11 +0200 (CEST)
Received: from localhost ([::1]:52828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH4xm-00071N-7A
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH4u5-00028h-0U
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:54:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH4u0-00089b-Tk
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659020056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HTZl+WzIOBRQMOQ0DcwHo7ggYIlc0NVu6b7ob27ID0g=;
 b=GQIoLsir0280fWg/k8LBQSntaK59XQNCS292gIlZSj2/DoKwNm1UuYQzBEhtHMAor/UvJs
 mFiOjDm+gJOKZ+eIBtG0q4kRwuklCh4YQnQgBx/7a1aUMM7WMhMfxnWz0NpRhUNahIfim3
 OVwnQhwbQbkNwouaRZvz/fIvJv1o4x8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-JQ_scwNIMvyKX4khbrNGXA-1; Thu, 28 Jul 2022 10:54:14 -0400
X-MC-Unique: JQ_scwNIMvyKX4khbrNGXA-1
Received: by mail-ed1-f72.google.com with SMTP id
 f13-20020a0564021e8d00b00437a2acb543so1255079edf.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 07:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HTZl+WzIOBRQMOQ0DcwHo7ggYIlc0NVu6b7ob27ID0g=;
 b=CnYagMyPEJ9W2sNLB+dnCDwiScjFztqoix/OJlV9JEW+yuH3EuFsKWSNnEJeegfu81
 NwtRrR5npLDGZV7PPj2Vzh1lrSlKDTFx1YdXJ3d4M1rfg48z2D1ArI51tGsWI2JZvwXr
 89n8Kqs4yv2FindRvth/MV9/lh0JBNzvSrcNnsA42j5Pp8vH/yfwbElSgLZzZz2ykiJ8
 BoJC9MrCaUt8FCjHnBll6Ww67//8KAO+BM5jmo7L8p7mlrr7EyxXlZ9Pd5pUnIm2aqIZ
 BgdzWefPQ9tg0+BhbABuzgUPM87nTCsrH1+N2U9l3mM8NIxdYEV3dnVaHeVRUKlRM23o
 0HXA==
X-Gm-Message-State: AJIora/h50GlK+nEJ3jJfTl9htaVduGLe0of55jtOF0rtZxhSD6moEmX
 NcW3NHWnKr7Cj0jyxJU58QGDZa3wZxFOUEDo09CHowJ4HighpmK8GoEl8bGm6QFq7hG8tRvHj+u
 Y1fjDJ5FTQmYdW4M=
X-Received: by 2002:a17:907:724c:b0:72e:e6fe:5ea4 with SMTP id
 ds12-20020a170907724c00b0072ee6fe5ea4mr21884325ejc.421.1659020053640; 
 Thu, 28 Jul 2022 07:54:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u3ZS3DocYjicmVVP/TbaefDFwDKmI3+fAOAUI+I5IeSGGteXwRP7wp5Ytbe3/+l4/2QGfybw==
X-Received: by 2002:a17:907:724c:b0:72e:e6fe:5ea4 with SMTP id
 ds12-20020a170907724c00b0072ee6fe5ea4mr21884290ejc.421.1659020053144; 
 Thu, 28 Jul 2022 07:54:13 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 z25-20020aa7d419000000b0043a43fcde13sm841041edq.13.2022.07.28.07.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 07:54:12 -0700 (PDT)
Date: Thu, 28 Jul 2022 16:54:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, peter.maydell@linaro.org, ani@anisinha.ca,
 mst@redhat.com
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features
 of PIIX4_PM
Message-ID: <20220728165411.5701befb@redhat.com>
In-Reply-To: <YuKgxM4IjAXh/goO@work-vm>
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <YuKgxM4IjAXh/goO@work-vm>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Thu, 28 Jul 2022 15:44:20 +0100
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Igor Mammedov (imammedo@redhat.com) wrote:
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
> 
> Isn't the problem partially due to a 'stub' vmsd which isn't terminated?

Not sure what "'stub' vmsd" is, can you explain?

> 
> Dave
> 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
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
> >   


