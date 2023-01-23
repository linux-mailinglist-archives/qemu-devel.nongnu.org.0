Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D5B677A95
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 13:10:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJve0-0003Zv-E7; Mon, 23 Jan 2023 07:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pJvdy-0003Zl-IJ
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:09:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pJvdw-0002u3-T1
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:09:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674475783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cCzNTLmTqb+tYP3FlfJsh82GID+HvwgXYb0MQFz8aZM=;
 b=hhlkaNh5r08/B0u1QVy5E2xG9MR94f/duItNdllfOVMVv3o59CxTLjiOm5ySWehh3gx1SX
 c/vjkOb1L4Of4UFXF1q1TfbNYTie4GwOEJUZsXJwhPa7cc+4IBlyM2C2e2HKaWbHwA9Hbs
 wZ1k3BP2SF8W+b1tycgQoamJS6AqC0s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-141-L1KxZKiUMkGtlzfhYI3VCA-1; Mon, 23 Jan 2023 07:09:42 -0500
X-MC-Unique: L1KxZKiUMkGtlzfhYI3VCA-1
Received: by mail-wm1-f69.google.com with SMTP id
 c66-20020a1c3545000000b003d355c13229so9341518wma.0
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 04:09:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cCzNTLmTqb+tYP3FlfJsh82GID+HvwgXYb0MQFz8aZM=;
 b=XrBi7V0jEtSoiCtWIThx4BGec3iqzOoqVxTvjYBEh5aIcPqodMmJyNhU+0jl9ereOs
 7BfTFwZ4HKyLCyGJeuMYD19oDcZupuPSUYO4n2jnGjvu80g2GxwPS/vPkUbS0eQy9kUL
 qMqoqNCBT16sV61tuYKBF9Wvt0/0vvfcHaIo1UGyXSsS3bYONYw96EzwsIIk8ejDKxbc
 cQYCv4AEt3Xaa9wJM15dpVjbZ1SdiV9Kd41kx9+Oqf7uhu15G47Op4RO8QX+L1cMF3t/
 JqlkiZxH8pgKxwK75y/jH/n6BI3BzWg7H3Vl7v3oB0UUOyS8Gz09Zgjfa/1Purd6OgqV
 W6Uw==
X-Gm-Message-State: AFqh2kq849DEjaR8NpQJ9K0Vq66+/7y1Mv1pzWx9JfrO/f8iEPanBmfA
 Zzl2cXDzdnIsoHazJZ5mU4n4136G55H8GJfyzszLe1LFrAZDu1KA+jnc/1Jlk+nN7GAadWx5CmH
 AF82bq5xj8v8mUTM=
X-Received: by 2002:a5d:6648:0:b0:2bc:805a:3e77 with SMTP id
 f8-20020a5d6648000000b002bc805a3e77mr17224865wrw.15.1674475781010; 
 Mon, 23 Jan 2023 04:09:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuHUIZH4I2HeOVCLOLrvy1Vp18R+KRuOEnYw4gwnfEVmytabgVNJEfNXu+qYZdXuFm2WSHbIw==
X-Received: by 2002:a5d:6648:0:b0:2bc:805a:3e77 with SMTP id
 f8-20020a5d6648000000b002bc805a3e77mr17224847wrw.15.1674475780714; 
 Mon, 23 Jan 2023 04:09:40 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600016ca00b00267bcb1bbe5sm4815421wrf.56.2023.01.23.04.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 04:09:40 -0800 (PST)
Date: Mon, 23 Jan 2023 12:09:38 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [RFC PATCH 2/2] hw/sd: skip double power-up in
 sd_vmstate_pre_load()
Message-ID: <Y855ApwNhuo3qLmR@work-vm>
References: <20230120120133.666993-1-dbarboza@ventanamicro.com>
 <20230120120133.666993-3-dbarboza@ventanamicro.com>
 <1ddbd1ec-6419-3b73-b913-c0584e041ffe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ddbd1ec-6419-3b73-b913-c0584e041ffe@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Philippe Mathieu-Daudé (philmd@linaro.org) wrote:
> +David / Juan / Peter for migration and timers.
> 
> On 20/1/23 13:01, Daniel Henrique Barboza wrote:
> > At this moment any migration with the RISC-V sifive_u machine
> > fails with the following error:
> > 
> > qemu-system-riscv64: ../hw/sd/sd.c:297: sd_ocr_powerup: Assertion
> > `!FIELD_EX32(sd->ocr, OCR, CARD_POWER_UP)' failed.
> > 
> > The assert was introduced by dd26eb43337a ("hw/sd: model a power-up
> > delay, as a workaround for an EDK2 bug"). It introduced a delayed timer
> > of 0.5ms to power up the card after the first ACMD41 command. The assert
> > prevents the card from being turned on twice.
> > 
> > When migrating a machine that uses a sd card, e.g. RISC-V sifive_u, the
> > card is turned on during machine_init() in both source and destination
> > hosts.

If that's a problem, then why don't you make that machine_init code
check whether we're INMIGRATE, and skip the power on?

> When the migration stream finishes in the destination, the
> > pre_load() hook will attempt to turn on the card before loading its
> > vmstate. The assert() is always going to hit because the card was
> > already on.
> > 
> > Change sd_vmstate_pre_load() to check first if the sd card is turned on
> > before executing a sd_ocr_powerup() and triggering the assert.

Again, not knowing this device, but the other thought is a Post_load
that determines if the OCR state hasn't been loaded, and then turns it
on.

Dave

> > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > ---
> >   hw/sd/sd.c | 12 ++++++++++--
> >   1 file changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> > index bd88c1a8f0..4add719643 100644
> > --- a/hw/sd/sd.c
> > +++ b/hw/sd/sd.c
> > @@ -664,11 +664,19 @@ static int sd_vmstate_pre_load(void *opaque)
> >   {
> >       SDState *sd = opaque;
> > -    /* If the OCR state is not included (prior versions, or not
> > +    /*
> > +     * If the OCR state is not included (prior versions, or not
> >        * needed), then the OCR must be set as powered up. If the OCR state
> >        * is included, this will be replaced by the state restore.
> > +     *
> > +     * However, there's a chance that the board will powerup the SD
> > +     * before reaching INMIGRATE state in the destination host.
> > +     * Powering up the SD again in this case will cause an assert
> > +     * inside sd_ocr_powerup(). Skip sd_ocr_powerup() in this case.
> >        */
> > -    sd_ocr_powerup(sd);
> > +    if (!sd_card_powered_up(sd)) {
> > +        sd_ocr_powerup(sd);
> > +    }
> >       return 0;
> >   }
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


