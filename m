Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FFD49057B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 10:56:03 +0100 (CET)
Received: from localhost ([::1]:39256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Ok6-000342-76
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 04:56:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9Oi9-0001jX-UW
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 04:54:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9Oi7-0000RV-AO
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 04:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642413238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=av5eHz1fCYP0lR5LhXBgfvE2IqtLWPNahjJb8/H1mAE=;
 b=Zr+sZWu1L8sqbtxpfQvQRt8bSIpJBL/l4U2w/1d8gWCMTvEyddRuTWO4nZkxH23JjFJdwT
 0RjF/b7WbYSKPQCqmQQFXc/bl0jWXeHYuVHe4+lEBYmc58F6liJFqNurTKTLJQf5afxtf9
 EAuCWM8G9Xs0CL1rMXYvZ8K0G2w1x1o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-SWDN8YWMON2qweY-09Qi1w-1; Mon, 17 Jan 2022 04:53:57 -0500
X-MC-Unique: SWDN8YWMON2qweY-09Qi1w-1
Received: by mail-wm1-f72.google.com with SMTP id
 20-20020a05600c22d400b00349067fe7b7so4957246wmg.5
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 01:53:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=av5eHz1fCYP0lR5LhXBgfvE2IqtLWPNahjJb8/H1mAE=;
 b=gEw/evhk6T3Wpbgue9fKQry9XNbNLQ3DI+OMFHWpXTEkyxIfcRmwmhGURpACfZkri9
 Xubb6is0Ushyt39fRTJ8oxnSSV85jSOdfL32tuFGUFptdYGvJ5cGlpFNSYVmZX/Pqg/R
 ApoiJPNDmyllCwsdgd888H6ZlC1szzqGBk14D3ju2hcGeqMLbws7gFC6PvCre2XeJit/
 GPgrLAaDS0VX+mCo7zc1DbvGaijZbSQ7fcbLF5tU/wU7l6nvjzT1FccYPiFh9kNMRys1
 hirG9jMlk1ox45m1e5zA+C64EYCcTLIaGFzCAE4VB8i1WttArgsQznhvsqm+NY2ksE13
 bVIQ==
X-Gm-Message-State: AOAM530cw6Z+Lt/Rv3AUgcDyx4cOXsBtnumk3wArXiFdX7zH648m+fKy
 7wMUpZNndqEkxIyhdigt10lTmvK3tFU2TgdWoKTKLzNBozbxHBtAHYog1KvVEuZ5SwnvpZfUJ53
 mpd6kmTTtrxhgPEY=
X-Received: by 2002:a5d:525a:: with SMTP id k26mr8426914wrc.625.1642413236274; 
 Mon, 17 Jan 2022 01:53:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcJDHQYRBXvlJAVYI+ULsBYwK+FDyWzpJwHW51MYtNWbNtaIBVK6Jaap2nyaHFTkIk8TMdEA==
X-Received: by 2002:a5d:525a:: with SMTP id k26mr8426905wrc.625.1642413236090; 
 Mon, 17 Jan 2022 01:53:56 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id v8sm13322131wrt.116.2022.01.17.01.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 01:53:55 -0800 (PST)
Date: Mon, 17 Jan 2022 09:53:53 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 1/3] ppc: Fix vmstate_pbr403 subsection name
Message-ID: <YeU8scwJWgWSjirg@work-vm>
References: <20220113194452.254011-1-dgilbert@redhat.com>
 <20220113194452.254011-2-dgilbert@redhat.com>
 <CAFEAcA80kZMYZkOpw8mka+skyMyq4W_pLUeYg_1D2MJUGYLUJQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA80kZMYZkOpw8mka+skyMyq4W_pLUeYg_1D2MJUGYLUJQ@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lsoaresp@redhat.com, marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 13 Jan 2022 at 19:45, Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
> >
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > The pbr403 subsection is part of the tlb6xx state, so I believe it's
> > name needs to be:
> >
> >     .name = "cpu/tlb6xx/pbr403",
> >
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  target/ppc/machine.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> > index 756d8de5d8..e535edb7c4 100644
> > --- a/target/ppc/machine.c
> > +++ b/target/ppc/machine.c
> > @@ -718,7 +718,7 @@ static bool pbr403_needed(void *opaque)
> >  }
> >
> >  static const VMStateDescription vmstate_pbr403 = {
> > -    .name = "cpu/pbr403",
> > +    .name = "cpu/tlb6xx/pbr403",
> >      .version_id = 1,
> >      .minimum_version_id = 1,
> >      .needed = pbr403_needed,
> > --
> > 2.34.1
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Actually, we'll drop this one; Cédric Le Goater has just published
'target/ppc: Finish removal of 401/403 CPUs' that kills this code off.

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


