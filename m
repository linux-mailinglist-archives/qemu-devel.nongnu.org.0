Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA6C4ADD65
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:48:36 +0100 (CET)
Received: from localhost ([::1]:38552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHSjL-0001Fn-9E
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:48:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHQAn-0008Id-M6
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:04:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHQAg-0007tG-Rz
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644325438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rccvkoQ50g7xkwHfI/fVDwnpHte4kXUgkMxBoc+603o=;
 b=HLADVRiSajuLYfls42oUUHNH6PpDxS96xNie28bK0GmW7V4gpnfe6ACVExomrCzuznaW3d
 rVqa4caI7GBCoxfA7cg/OKyMQ842lNY8VISK3hOWgYuRpBBY8sP1RA7+vv5L2RCp6va705
 M53zcmubhurGFUKpGrdCL1iSDANxGmM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-q_-cZf1iMSGLjYhBAMd1cg-1; Tue, 08 Feb 2022 08:03:57 -0500
X-MC-Unique: q_-cZf1iMSGLjYhBAMd1cg-1
Received: by mail-wm1-f70.google.com with SMTP id
 r16-20020a05600c2c5000b0037bb20c50b8so512693wmg.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 05:03:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=rccvkoQ50g7xkwHfI/fVDwnpHte4kXUgkMxBoc+603o=;
 b=nyphoa4ZeoypsMmMmDyqFW0FNzqYwJxXyZcMFW1FP5VYeJUFXMEuQrhH5rh5dxZGM7
 H2/EXmiRZ08T4sz5fhHYr2m+43PYs8HCxL6c4c29p3aNJQ1khjdvOHvfySI3/rYWfO6t
 G4hXm5An4gCB0PdddxRhEX9ie0xUzdPGyVPSUrNVDIPPX54lMvmNR5tEfYA7hddfA+Ei
 T5U8SALvmswgUVhwSp+q7tFrFhKjn9Ff6l41fSbDSgABujfeI9ljeVwcRY0B4RUT/p3r
 K6v58MMNd7uzChb7bc84ZwpBjvJd4skBe+LEnHqp8vKHh0UVLSN0FJ2fHLrEz24m6Kk8
 gXYA==
X-Gm-Message-State: AOAM532+AoaA7KV1Ofjx/1jBq8cb9jZGdA3+HTv1bVrsVhEizrLbeA3t
 vM5ry3e2bPf4oyjj6F+zSEmb2u3cR1/HlQzXhTXchpT2ANCCQ2dt3JCHXQO8wIJHJ7IekyY2KRE
 Chen93Fqe/wa6Tk0=
X-Received: by 2002:a05:6000:1682:: with SMTP id
 y2mr3469522wrd.654.1644325436083; 
 Tue, 08 Feb 2022 05:03:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFnKTPLc/abAjiSn4cEWSbCD7Bfma0y8uICltBD10x0JitfgpkoSRxHKWqX5ytKFqPc4Q/2w==
X-Received: by 2002:a05:6000:1682:: with SMTP id
 y2mr3469506wrd.654.1644325435837; 
 Tue, 08 Feb 2022 05:03:55 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id o10sm8465004wri.69.2022.02.08.05.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 05:03:55 -0800 (PST)
Date: Tue, 8 Feb 2022 13:03:52 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 08/11] mos6522: add "info via" HMP command for debugging
Message-ID: <YgJqOCmbgMt3oMl1@work-vm>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA8ZiLTgeG_2aUHBoV0io52623VRybG0NL0uY8=9Fg59Kg@mail.gmail.com>
 <71542eb1-fc8f-8f30-81e0-35c9df764825@amsat.org>
 <877da5wzgp.fsf@pond.sub.org> <YgJF9SDwb93k5/fg@work-vm>
 <YgJZfwfpX5/R9HfR@redhat.com>
 <60d34033-fd73-249d-97d2-886ece0ef190@ilande.co.uk>
MIME-Version: 1.0
In-Reply-To: <60d34033-fd73-249d-97d2-886ece0ef190@ilande.co.uk>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Mark Cave-Ayland (mark.cave-ayland@ilande.co.uk) wrote:
> On 08/02/2022 11:52, Daniel P. Berrangé wrote:
> 
> (cut)
> 
> > > > The proposed device-specific command uses a mechanism originally made
> > > > for modules instead (more on that below).
> > > > 
> > > > I think we should make up our minds which way we want device-specific
> > > > commands done, then do *all* of them that way.
> > > 
> > > I think device specific commands make sense, but I think it would
> > > probably be better if we had an 'info dev $name' and that a method on
> > > the device rather than registering each one separately.
> > > I'd assume that this would be a QMP level thing that got unwrapped at
> > > HMP.
> > > 
> > > But that's not a problem for this contribution; someone else can figure
> > > that out later.
> > 
> > Actually I think this would solve a problem with this contribution.
> > This patch implements a QMP command but never registers it, so it
> > isn't actually accessible via QMP. It only registers the HMP wrapper
> > which rather defeats the point of doing it via the QMP HumanReadableText
> > approach.
> > 
> > I'm guessing this was done because we don't have ability to dynamically
> > register QMP commands at runtime.  I don't know how hard/easy it is
> > to address this, and perhaps we don't even want to.  It was a problem
> > for me when previously converting HMP info commands to QMP and I
> > didn't get a solution, so didn't convert anything where the command
> > impl was dynamically registered at runtime. This basically excluded
> > converting devices that have been split into loadable modules.
> > 
> > If we had a general  'info dev-debug' (HMP) and  'x-query-dev-debug'
> > commands, then we could side-step the QMP limitation, as both thue
> > HMP and QMP comamnds could be statically registered. The devices
> > then only need to register  a callback at runtime which should be
> > easier to deal with.
> 
> That could work, or even just a "debug via" without using "info" for brevity.
> 
> You could even add the callback to DeviceClass so that the registration
> takes place as part of class_init() using a function such as
> device_class_register_debug("name", callback).

Yes, that was what I was imagining

Dave

> 
> ATB,
> 
> Mark.
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


