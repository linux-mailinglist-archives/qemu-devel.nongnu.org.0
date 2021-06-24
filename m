Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9624E3B365D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 20:54:39 +0200 (CEST)
Received: from localhost ([::1]:58266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwUUo-0008MU-N6
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 14:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lwUTk-0007bb-4D
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:53:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lwUTd-0004sb-Fo
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:53:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624560803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MOWGd12r5GJqRHfOsxY1wODig0Azz/FWacA5Ll4JrUY=;
 b=UY8GhxwRXNJf9axohXn5ntyKBV2AJrrfm6q8r+7VL2nCwSALnpL75evKI6572DN47prILc
 t8qmxuPsBLZe3mohJw7WqTGH2ggOYX0v9beWf9UBbLlAX8IWe0HAsu1MmxVcWNULnMQYS2
 icyu3N4g5ttoQKQ7IvA5awOdrXLwm9U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-5_1KAV2FM3OZy1ejsFaSsA-1; Thu, 24 Jun 2021 14:53:21 -0400
X-MC-Unique: 5_1KAV2FM3OZy1ejsFaSsA-1
Received: by mail-wr1-f71.google.com with SMTP id
 x5-20020adff0c50000b029011a7be832b7so2501616wro.18
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 11:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MOWGd12r5GJqRHfOsxY1wODig0Azz/FWacA5Ll4JrUY=;
 b=KT7Wr2WRhM5o9RkogvwgmPgOLd0y8Z94gzXE0EXSQb3qtZXiMtZWHi9kg5wY4slGAm
 rzc4XLQP86yyexSqLtAOVRzUsrvVIMxw20PtcJKGL02JXvMA5yP46fmFP5EkJqOL+DFz
 eK13dwDGA7M87kozEjRINgzJDTfurMHBv2PWjUo6cUPsZ14ncldmzd2ezcvdZtYWFUm0
 MrQdmf+bqH1OKJjNT3RLZfpRMHaC5N3bSvFf7IylHIraXP7oObnbnv/SfKCYuWlBWTSd
 OrSRI+utrYPxQmTSfdDhs4VI5rqboYgbc2lQ6DL1kxrObKLukCFbGZYe59vc/3ABg5MB
 c1Og==
X-Gm-Message-State: AOAM532ArEtec2e2fqlgqsb7EN6pJwMvnuKqmzuPanwu2O84VLLcnSv2
 NxLSPwfMBaBI/gbrmM088VOvaranq5UYmoW5zAdcLQtuV5P//UQ82Gwxr5aJcB/zhhcmadsNl+l
 8+C/kqXlnzgomWfE=
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr5997768wmq.181.1624560800236; 
 Thu, 24 Jun 2021 11:53:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAXdmAkpG5lo+L7+Y//BQpAetNfsw4B0KNJVj7wlngaovplEihLQ0oaDllFZyUSxdBg5qePQ==
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr5997735wmq.181.1624560799936; 
 Thu, 24 Jun 2021 11:53:19 -0700 (PDT)
Received: from redhat.com ([77.124.79.210])
 by smtp.gmail.com with ESMTPSA id b7sm3976533wrw.20.2021.06.24.11.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 11:53:19 -0700 (PDT)
Date: Thu, 24 Jun 2021 14:53:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] acpi/ged: fix reset cause
Message-ID: <20210624145307-mutt-send-email-mst@kernel.org>
References: <20210624110057.2398779-1-kraxel@redhat.com>
 <CAFEAcA-fULMwcstO3eCAggktfD6vDP4TPDadyB0A9eAKAtnP-w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-fULMwcstO3eCAggktfD6vDP4TPDadyB0A9eAKAtnP-w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 24, 2021 at 12:06:14PM +0100, Peter Maydell wrote:
> On Thu, 24 Jun 2021 at 12:01, Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > Reset requests should use SHUTDOWN_CAUSE_GUEST_RESET not
> > SHUTDOWN_CAUSE_GUEST_SHUTDOWN.
> >
> > Reported-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  hw/acpi/generic_event_device.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> > index 39c825763ad8..e28457a7d103 100644
> > --- a/hw/acpi/generic_event_device.c
> > +++ b/hw/acpi/generic_event_device.c
> > @@ -207,7 +207,7 @@ static void ged_regs_write(void *opaque, hwaddr addr, uint64_t data,
> >          return;
> >      case ACPI_GED_REG_RESET:
> >          if (data == ACPI_GED_RESET_VALUE) {
> > -            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> > +            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> >          }
> >          return;
> >      }
> > --
> > 2.31.1
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM

tagged, thanks!


