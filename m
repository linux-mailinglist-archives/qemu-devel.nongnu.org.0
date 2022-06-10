Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0915465B7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 13:37:16 +0200 (CEST)
Received: from localhost ([::1]:51452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzcx0-0003t4-Tr
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 07:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzcoY-0004uF-43
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 07:28:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzcnx-0002De-Oy
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 07:27:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654860468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VkUtdtuo3qM6eoRx092NTAt8mYrOi4UZOQOdsiVItjI=;
 b=hWH2pvZm+9ZfPvXiZvS1YUAENbq2BTggjIw2EZTiLnnOn/T/s5Fv1Jt/DZWa/Fh7KzxJPy
 wSn5JrXO9+iFSeiy5lez0C3Fkx4Oi99IQZoEO/xrjNfMP8ndY94nia2SM/ATIglVeExhJY
 ZdTpIWtYUcRCO0/QaW9B51tb9Yhlenk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-V-H8lEVWOMqPDw-8mEln_w-1; Fri, 10 Jun 2022 07:27:45 -0400
X-MC-Unique: V-H8lEVWOMqPDw-8mEln_w-1
Received: by mail-wr1-f72.google.com with SMTP id
 t2-20020adfe442000000b002108370e7a3so6104886wrm.3
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 04:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VkUtdtuo3qM6eoRx092NTAt8mYrOi4UZOQOdsiVItjI=;
 b=cMGFe5+EyjV/yG6ed9vmMecuWKjLAX6OdGiekRDEmDVMkqhsXGysVV1/KgmA4NBQ8c
 F3xS1FHPg6Drc0+sFPSABMcnBIUqQXeh/kfElRvYndQxrcXXylPRd+Ol8L5dGIIbKpzN
 I2xMDNVRXAkwwLYxtBOMildy24FMXgvpxqUMdNgGNEaybQ7HeuhBqghKZ05bfjFZjpE/
 MrGjUqKr5yb8VV3YZ13TPDF4pXOwXmXj8p/BTwiViBQr+r+c1I5WLQTzEW2KYHA/ytyx
 pLWcKhS0cCUHF7Ib+UQPJ5Bunt7VYbJil/MJvPh3Lw/uuhOR7ohpGg4kNRAjqcEC4N6O
 BJyw==
X-Gm-Message-State: AOAM531zNG2sDdZXm4BKTK3l491klUk0MwfmouKu0oPMXn7UL6qZUNEo
 ii2WisKbPzj5kEcAG4LMAgP1Rr2nYPF7ysO1r3NR+zWsVr/hHaag0vTY7DkK1QA4i2mGCduY1mo
 6jUr6pl7Mg6p1/QQ=
X-Received: by 2002:a1c:f704:0:b0:39c:6684:b375 with SMTP id
 v4-20020a1cf704000000b0039c6684b375mr8153173wmh.66.1654860463961; 
 Fri, 10 Jun 2022 04:27:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyw1EqiRLR5/HL62rZCqRAa+nbRGDeC+sH2OD/QtQ9d8x9JEw9gr4vpKBNd71vwlxwbXk7ZeQ==
X-Received: by 2002:a1c:f704:0:b0:39c:6684:b375 with SMTP id
 v4-20020a1cf704000000b0039c6684b375mr8153155wmh.66.1654860463723; 
 Fri, 10 Jun 2022 04:27:43 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c47cf00b0039c5642e430sm2545197wmo.20.2022.06.10.04.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 04:27:43 -0700 (PDT)
Date: Fri, 10 Jun 2022 07:27:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Eric DeVolder <eric.devolder@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] acpi/erst: fix fallthrough code upon validation failure
Message-ID: <20220610072725-mutt-send-email-mst@kernel.org>
References: <20220513141005.1929422-1-ani@anisinha.ca>
 <2b64c7b3-a18c-b764-3854-cb14a7432f88@oracle.com>
 <CAARzgwweNOJjoRpGSfvu2kh74207JszXduCqg3rkx+Y7S7c62Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARzgwweNOJjoRpGSfvu2kh74207JszXduCqg3rkx+Y7S7c62Q@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Fri, Jun 10, 2022 at 01:48:57PM +0530, Ani Sinha wrote:
> On Thu, May 19, 2022 at 6:35 PM Eric DeVolder <eric.devolder@oracle.com> wrote:
> >
> >
> >
> > On 5/13/22 09:10, Ani Sinha wrote:
> > > At any step when any validation fail in check_erst_backend_storage(), there is
> > > no need to continue further through other validation checks. Further, by
> > > continuing even when record_size is 0, we run the risk of triggering a divide
> > > by zero error if we continued with other validation checks. Hence, we should
> > > simply return from this function upon validation failure.
> > >
> > > CC: Peter Maydell <peter.maydell@linaro.org>
> > > CC: Eric DeVolder <eric.devolder@oracle.com>
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> >
> > Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>
> 
> Michael:
> Did you forget to queue this for your latest pull request?
> 

I did, thanks for the reminder!

> >
> > My apologies, I've been away for the past week.
> > Thank you for taking the time to correct this issue!
> > eric
> >
> > > ---
> > >   hw/acpi/erst.c | 3 +++
> > >   1 file changed, 3 insertions(+)
> > >
> > > diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> > > index de509c2b48..df856b2669 100644
> > > --- a/hw/acpi/erst.c
> > > +++ b/hw/acpi/erst.c
> > > @@ -440,6 +440,7 @@ static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
> > >           (record_size >= 4096) /* PAGE_SIZE */
> > >           )) {
> > >           error_setg(errp, "ERST record_size %u is invalid", record_size);
> > > +        return;
> > >       }
> > >
> > >       /* Validity check header */
> > > @@ -450,6 +451,7 @@ static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
> > >           (le16_to_cpu(header->reserved) == 0)
> > >           )) {
> > >           error_setg(errp, "ERST backend storage header is invalid");
> > > +        return;
> > >       }
> > >
> > >       /* Check storage_size against record_size */
> > > @@ -457,6 +459,7 @@ static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
> > >            (record_size > s->storage_size)) {
> > >           error_setg(errp, "ACPI ERST requires storage size be multiple of "
> > >               "record size (%uKiB)", record_size);
> > > +        return;
> > >       }
> > >
> > >       /* Compute offset of first and last record storage slot */
> > >


