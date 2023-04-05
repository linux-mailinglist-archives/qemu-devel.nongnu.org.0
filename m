Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C32A6D78BC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 11:46:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjzi7-0008NU-K0; Wed, 05 Apr 2023 05:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjzi1-0008MY-MJ
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 05:45:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjzhz-00080h-BD
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 05:45:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680687938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RVhI0yFpncr1km1TNyPaijJ0kP3sxarwz5JWOCAivj0=;
 b=XaaqrSBLNSNl7Fq8LK49GXIzihTeIRsBBMRKytdF0jAoApimMpDjthKbT1Ir1rMTP5GogG
 Mqx0jO/Z008H7i2GFSsCnqnGZTwNu3GvBDs7HvdFEwL7D+yAgiPJJqtipGnrZN3OSoaWsJ
 unnh8SO3svaGKBIn7Pz34mjx6MsPtjA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-vAzaqr4EPbaJTKb515Qpgw-1; Wed, 05 Apr 2023 05:45:37 -0400
X-MC-Unique: vAzaqr4EPbaJTKb515Qpgw-1
Received: by mail-ed1-f71.google.com with SMTP id
 y35-20020a50bb26000000b005029d37a3ffso12972746ede.6
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 02:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680687936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RVhI0yFpncr1km1TNyPaijJ0kP3sxarwz5JWOCAivj0=;
 b=MlrFgjOxLstUgNHx/SbG6hCSstMvpKOE667XE9pmOh3Yj9f12lN/4VRl9zdJP0iQal
 s8nFh4VZpAG9EeXWqujPUkBNXGZxOVrCEeTIj3DL95VX7Mdo3qxZ3PsE5ddQWLbOC5OR
 jaCiQFL796rlCjQa8Prj3Nx/cY0tWOqkXWrAen5f+GqtmFGrWVY9bTDi5NbWpIMoPnGK
 /4IAPDPDoE4cRjEYAkxojy4AVTwg5g1JDPaKugNYk+3eLlbJIkWHhlIvKHIYP64gWk2E
 l2BZvxNxTjgQFrqkO/UcXIXnmC6SO7XlSdaFzJo5FLQZhxN9WTs6QBN6ZPVduULgIKuv
 b9rA==
X-Gm-Message-State: AAQBX9fQZI7Z1h7z6Ot8FbhF3oBnpgGPN0il2eqY97atU+LrTVZMh8rz
 QTtVxfuGhWHFWg+OY92m/EtYStKMJ2wJuDj/UbMKgUz5DNIxCzpX0K5LYGr+sTzOrpskJC30KlZ
 x/0c0zt+2PMeffpM=
X-Received: by 2002:a17:906:854c:b0:931:f9f8:d4ea with SMTP id
 h12-20020a170906854c00b00931f9f8d4eamr2140105ejy.53.1680687936136; 
 Wed, 05 Apr 2023 02:45:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z2UOZPIO1NoudkD1bsdxGLTl7MsvHLyvlGRX6IY5kTpypZe36YD4KvXHfwl5AuDQdGp3FKWg==
X-Received: by 2002:a17:906:854c:b0:931:f9f8:d4ea with SMTP id
 h12-20020a170906854c00b00931f9f8d4eamr2140098ejy.53.1680687935886; 
 Wed, 05 Apr 2023 02:45:35 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 m15-20020a170906258f00b009255b14e91dsm7036227ejb.46.2023.04.05.02.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 02:45:35 -0700 (PDT)
Date: Wed, 5 Apr 2023 11:45:34 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, anisinha@redhat.com, jusual@redhat.com,
 kraxel@redhat.com
Subject: Re: [PATCH v2] acpi: pcihp: make pending delete blocking action expire
Message-ID: <20230405114534.4a795ab3@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230405044231-mutt-send-email-mst@kernel.org>
References: <20230405083444.1536720-1-imammedo@redhat.com>
 <20230405044231-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Wed, 5 Apr 2023 04:47:48 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

[...]
> This is arguably a regression but not in this release yes?
> So I don't think it needs to block qemu release.

yep, it's 'old' regression introduced in earlier releases
> Fixes: cce8944cc9ef ("qdev-monitor: Forbid repeated device_del")
 

> 
> 
> > ---
> > v2:
> >    * change timeout to 1ms
> >    * add comment to expire usage
> >    * massage commit message to be a bit more clear
> > 
> > CC: mst@redhat.com
> > CC: anisinha@redhat.com
> > CC: jusual@redhat.com
> > CC: kraxel@redhat.com  
> 
> It's helpful to have CC before --- so backporters know whom to CC, too.
> 
> > ---
> >  hw/acpi/pcihp.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > index dcfb779a7a..5daa732a33 100644
> > --- a/hw/acpi/pcihp.c
> > +++ b/hw/acpi/pcihp.c
> > @@ -357,6 +357,16 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> >       * acpi_pcihp_eject_slot() when the operation is completed.
> >       */
> >      pdev->qdev.pending_deleted_event = true;
> > +    /* if unplug was requested before OSPM is initialized,
> > +     * linux kernel will clear GPE0.sts[] bits during boot, which effectively
> > +     * hides unplug event. BAnd than followup qmp_device_del() calls remain  
> 
> BAnd?
> 
> > +     * blocked by above flag permanently.
> > +     * Unblock qmp_device_del() by setting expire limit, so user can
> > +     * repeat unplug request later when OSPM has been booted.
> > +     */
> > +    pdev->qdev.pending_deleted_expires_ms =
> > +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL); /* 1 msec */
> > +
> >      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
> >      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
> >  }
> > -- 
> > 2.39.1  
> 


