Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085935260F1
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 13:25:28 +0200 (CEST)
Received: from localhost ([::1]:46624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npTQF-0000Ef-4n
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 07:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npTOy-0007j4-6D
 for qemu-devel@nongnu.org; Fri, 13 May 2022 07:24:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npTOw-00050n-I2
 for qemu-devel@nongnu.org; Fri, 13 May 2022 07:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652441045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5rtU7YPotJf9w9BAQkrBLCeKfTNxD8IFDZUgiNXa2dY=;
 b=QPSZXkjQ8TkT/vEV5ld5Ig/XkzWumJJRlnMH7q50PnozMDyJl/9Y2QMVH5cAmuZ0IG/gvq
 +MmZ4BGgH/tMWS05RuFmQ/X5PtF6amhMvZ253xXNbY0ZHBbETVgcML9h4qf+kSZAx5CgKl
 nIsoxNlxWx/TyTFNRfadcKievyOeQLs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-Ygs9pvMYPle1rW8rhufI9Q-1; Fri, 13 May 2022 07:23:57 -0400
X-MC-Unique: Ygs9pvMYPle1rW8rhufI9Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 k35-20020a05600c1ca300b003946a9764baso5837782wms.1
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 04:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5rtU7YPotJf9w9BAQkrBLCeKfTNxD8IFDZUgiNXa2dY=;
 b=y9HpcCPJ3uxL2zpM91zpoFJC9YKD4QFOpIb+jhYnVAVeXjwDlNQhvr46taQOC9ILNn
 z1xH3UL4gsB8kc8vLOT/ff0/6RPAJFdnWFys3QfjO7v9B9SBtnGkSBAEEkQFya2YQ5Et
 PvE9nsVI9cqQ9yOc7KZU1GTFXO0BwjSzHwn/yzA1HDqdFU5+GFIwm3f5tyTjtRrbp4iD
 ZW6Hs+/LTvlBnmCwYi5e/smTGzD5pkIYRidjXiTcvt/h4+M9tV+CTssmuar+t1yjMSSX
 na2jF3HNUZ2uyG4QnW4EzmErO9pahtYgSt7CDnDckXdrZ9bsqwKIoLzE4gboabKY5ORG
 NdZQ==
X-Gm-Message-State: AOAM532VNhKHaJMvsNtIwxO29KItU2bwkDTC835s3DN3XEPG84YJmf3o
 v3aVJPxNdtNeWPhNQAxVbNqZjM6+3fmDLPjkIzRQsyk2FXILwdwVf7AwJVEc2AQqUtSaDpCi9a/
 J1/QnycVoh/KHxyo=
X-Received: by 2002:a5d:4205:0:b0:20a:e23c:a7f4 with SMTP id
 n5-20020a5d4205000000b0020ae23ca7f4mr3661793wrq.576.1652441035929; 
 Fri, 13 May 2022 04:23:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5Dwjr2gwn1GXAUboI1ksy0njO7Sdd3EOrq8dUCHZnQt+Oxxbu3h+12SUzKjXG9F55pRePFw==
X-Received: by 2002:a5d:4205:0:b0:20a:e23c:a7f4 with SMTP id
 n5-20020a5d4205000000b0020ae23ca7f4mr3661774wrq.576.1652441035652; 
 Fri, 13 May 2022 04:23:55 -0700 (PDT)
Received: from redhat.com ([2.53.15.195]) by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c4f8800b0039444973258sm6785891wmq.0.2022.05.13.04.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 04:23:55 -0700 (PDT)
Date: Fri, 13 May 2022 07:23:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, jon.grimm@amd.com
Subject: Re: [PATCH] pc: q35: Bump max_cpus to 512
Message-ID: <20220513072007-mutt-send-email-mst@kernel.org>
References: <20220504131639.13570-1-suravee.suthikulpanit@amd.com>
 <20220509091249.392fdab6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509091249.392fdab6@redhat.com>
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

On Mon, May 09, 2022 at 09:12:49AM +0200, Igor Mammedov wrote:
> On Wed, 4 May 2022 08:16:39 -0500
> Suravee Suthikulpanit <suravee.suthikulpanit@amd.com> wrote:
> 
> > This is the maximum number of vCPU supported by
> > the AMD x2APIC virtualization.
> > 
> > Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
> > ---
> >  hw/i386/pc_q35.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > index 302288342a..e82b1c690d 100644
> > --- a/hw/i386/pc_q35.c
> > +++ b/hw/i386/pc_q35.c
> > @@ -357,7 +357,7 @@ static void pc_q35_machine_options(MachineClass *m)
> >      machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
> >      machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
> >      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
> > -    m->max_cpus = 288;
> > +    m->max_cpus = 512;
> 
> Maybe we should bump it to KVM VCPU maximum,
> and make sure we error out if asked for combination of
> hardware/irqchip is not usable.

So what happens if one does 710 and then tries to use AMD x2APIC?
We'd like that to error out, right?

> 
> >  }
> >  
> >  static void pc_q35_7_1_machine_options(MachineClass *m)


