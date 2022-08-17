Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BA2596D09
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 12:54:17 +0200 (CEST)
Received: from localhost ([::1]:34322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOGgi-0008JL-0D
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 06:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOGdD-0005fi-It
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 06:50:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOGdB-0008O6-Sx
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 06:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660733437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9u+NcJgun7Iblf8I31akYbC1kVoGYvFmbgrtP9dmvuY=;
 b=TxxgLu0HaGnqUy1mlbMpCBwIYiHoBKYqezYGZEJufTnOEBvXWUVqWFt+3pBW1XdkX1mC7V
 GxkeybnV/sTxKQ7qjjYzJPCKRnb0aUvArJOJ4uyczN023QwyTq3nRms8Lykqn/yVOVyQKx
 3AZ9oAtmnoh0p7mZaJLwEw9A9IoiXWE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-386-Pud4ApU-Nqid7dJsyMvhgQ-1; Wed, 17 Aug 2022 06:50:33 -0400
X-MC-Unique: Pud4ApU-Nqid7dJsyMvhgQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 m7-20020adfa3c7000000b002251ddd0e05so727503wrb.10
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 03:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=9u+NcJgun7Iblf8I31akYbC1kVoGYvFmbgrtP9dmvuY=;
 b=csM0Cg3MrjFy80EUB0C/yvdafH6QJwmAZmmv0ZlOVzdpQubc/jhdXrq9OL5yZ17dyq
 qRpfu9sWFduU4gn696jpcACASY9VbNm59g5VGWAmikg9gd/EFaJDapM9EpjtVYiCzxTu
 hxanOIDX6ct9qCl4m7gA74HUfi4qRDp4BSuC3nDFFd4XdiczoeIiEULPBk5bcE18QW4S
 Wl/GViZ6FSyRTNZFkj3X/RXPtsQsbEaojEISBrjOXQ4qgjK3JmXwx+Z7gJdspvS5lcnx
 YQIt9U1z4g7ta0a1gvFBcvtfuqg/OaM8UhLp3fWzaPvZXq9EI+ZQzAFl18Yq/6Weul1b
 43vQ==
X-Gm-Message-State: ACgBeo3JK446HETpzL/bMGdeZ8g9x8+o9ci3hX0jIpmyI/ehNoP3S9ks
 1QP6nbM5ty0puU1C5UQMBlfvVE6+McdgMhiTHwBnFwEEkTdmQKFTfAYZ8KMo4mGjRyDd8GfWDPz
 8D9CwclhDGhuLneM=
X-Received: by 2002:a05:600c:3b16:b0:3a6:169:d7f8 with SMTP id
 m22-20020a05600c3b1600b003a60169d7f8mr1763051wms.129.1660733432836; 
 Wed, 17 Aug 2022 03:50:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR64CuOc9UF6aPNXKpdPtbpiydX1gzG127zAqeeU7D4ZJ4k2Z1F64bEoaa/ZRATt+vSy+6HGBA==
X-Received: by 2002:a05:600c:3b16:b0:3a6:169:d7f8 with SMTP id
 m22-20020a05600c3b1600b003a60169d7f8mr1763035wms.129.1660733432537; 
 Wed, 17 Aug 2022 03:50:32 -0700 (PDT)
Received: from redhat.com ([2.55.43.215]) by smtp.gmail.com with ESMTPSA id
 p22-20020a05600c359600b003a35516ccc3sm2282288wmq.26.2022.08.17.03.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 03:50:31 -0700 (PDT)
Date: Wed, 17 Aug 2022 06:50:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jay Khandkar <jaykhandkar2002@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Subject: Re: [PATCH] hw/intc: Handle software disabling of APIC correctly
Message-ID: <20220817065014-mutt-send-email-mst@kernel.org>
References: <20220712141804.99494-1-jaykhandkar2002@gmail.com>
 <CAFEAcA_sBoNCvUEaTOC26Om5vZKeZvLLJS1edkPM-pbswzQvzA@mail.gmail.com>
 <YuQaN9GScQJ4ZXC+@thinkpad.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YuQaN9GScQJ4ZXC+@thinkpad.localdomain>
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

On Fri, Jul 29, 2022 at 11:04:47PM +0530, Jay Khandkar wrote:
> On Fri, Jul 29, 2022 at 06:09:01PM +0100, Peter Maydell wrote:
> > On Tue, 12 Jul 2022 at 19:38, Jay Khandkar <jaykhandkar2002@gmail.com> wrote:
> > >
> > > When the local APIC is in a software disabled state, all local interrupt
> > > sources must be masked and all attempts to unmask them should be
> > > ignored. Currently, we don't do either. Fix this by handling it
> > > correctly in apic_mem_write().
> > >
> > > Signed-off-by: Jay Khandkar <jaykhandkar2002@gmail.com>
> > > ---
> > >  hw/intc/apic.c | 16 +++++++++++++---
> > >  1 file changed, 13 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> > > index 3df11c34d6..493c70af62 100644
> > > --- a/hw/intc/apic.c
> > > +++ b/hw/intc/apic.c
> > > @@ -792,9 +792,16 @@ static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
> > >          s->dest_mode = val >> 28;
> > >          break;
> > >      case 0x0f:
> > > -        s->spurious_vec = val & 0x1ff;
> > > -        apic_update_irq(s);
> > > -        break;
> > > +        {
> > > +            s->spurious_vec = val & 0x1ff;
> > > +            if (!(val & APIC_SPURIO_ENABLED)) {
> > > +                for (int i = 0; i < APIC_LVT_NB; i++) {
> > > +                    s->lvt[i] |= APIC_LVT_MASKED;
> > > +                }
> > > +            }
> > > +            apic_update_irq(s);
> > > +            break;
> > > +        }
> > 
> > What are the braces for here ? There's no local variable declaration...
> > 
> > thanks
> > -- PMM
> You are right, the braces are unnecessary for that part. I just put them in to
> create a neat visually separate block. Can get rid of them.
> 
> Thanks,
> Jay 

Did you intend to send v2 of this?

-- 
MST


