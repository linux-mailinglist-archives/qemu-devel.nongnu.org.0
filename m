Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A9266E492
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:13:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHpVY-0002KN-3I; Tue, 17 Jan 2023 12:12:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pHpVR-0002CM-B6
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:12:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pHpVN-00056y-O2
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:12:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673975527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/xT2F+gCG0Rjzumy1UFOyArPW6tPSIn20KE3KJxQnIc=;
 b=H79wx/ctRczRDQl6ztjtq1ePJ7PzsXol5JdeXyn7JHNimc+q9aleTM1KNoSVhKq7H2A3OV
 M9w6xR2cqf8mtK7EhwqEz+2TDpTJpIv/4wL06Nc2NvcySDedY6F7nACheNrG+7C50VODzA
 S2vBgnwK3/TITz63ekPhezBh0p+6Ajg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-631-XPeLS7NXMdOQXmmTjp9eOg-1; Tue, 17 Jan 2023 12:11:46 -0500
X-MC-Unique: XPeLS7NXMdOQXmmTjp9eOg-1
Received: by mail-wm1-f72.google.com with SMTP id
 az37-20020a05600c602500b003da50af44b3so4878090wmb.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 09:11:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xT2F+gCG0Rjzumy1UFOyArPW6tPSIn20KE3KJxQnIc=;
 b=lzWxftLuWAdeaEB4O2FVH4WZIHFDEu6yi9Pl+u7S/2QuXLVMasD1UTEivNDH/b6O88
 5kgkQ7g4SXqyrz8iaGRIIyAs+WeDYeIxkFoxsnfR0ZuBx2NgVg2MlWpGWDo+1Xr6hUbP
 qd8hfBNEWRGLkdCa1Y4L690oK9cfbOFaxGr4DSbN980GG3fBV0Fj8LhN6Hzk8OBSMQpt
 gmRZEpNzp7y9PFjnL9ZZPrUc1ihx+zh2VjYow51yiH3L6NzCqOCJiH0ckFjgalv3CZ9s
 2T3NEr/XkaPXyOXiroJGnP7ApeD+iNyhSG2ii2iF56SqEdC9NwART4iZrbbZzmQUKDiK
 eqiw==
X-Gm-Message-State: AFqh2kqerwI55qe95JccZgIu+2bydBDjrv9C3zpvXcX9FbRvyvv4A1dF
 C8w8h4MBYYYMoaQ6Kfl+jwfF3ngV/ImP++1ZVdiVpTJAlnrw7GUqg9XTDCqaKxm5tc01T19RxPS
 CzI2+6fkplwRXYJc=
X-Received: by 2002:a05:600c:3d86:b0:3d2:3761:b717 with SMTP id
 bi6-20020a05600c3d8600b003d23761b717mr3645136wmb.37.1673975503983; 
 Tue, 17 Jan 2023 09:11:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXthCy8QSeEC7iz78+ZXE8290P6Tj/9R6eydiQpw7t1RDUTcjH8HczS8uO0wFNDFTf0uUkN27Q==
X-Received: by 2002:a05:600c:3d86:b0:3d2:3761:b717 with SMTP id
 bi6-20020a05600c3d8600b003d23761b717mr3645117wmb.37.1673975503770; 
 Tue, 17 Jan 2023 09:11:43 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c4fc200b003da2932bde0sm15811861wmq.23.2023.01.17.09.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 09:11:43 -0800 (PST)
Date: Tue, 17 Jan 2023 17:11:41 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v4 1/2] arm/kvm: add support for MTE
Message-ID: <Y8bWzZe4svHOmdvd@work-vm>
References: <20230111161317.52250-1-cohuck@redhat.com>
 <20230111161317.52250-2-cohuck@redhat.com>
 <CAFEAcA9BKX+fSEZZbziwTNq5wsshDajuxGZ_oByVZ=gDSYOn9g@mail.gmail.com>
 <Y8bR7xrsCMr5z6xI@work-vm> <877cxl85cb.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877cxl85cb.fsf@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

* Cornelia Huck (cohuck@redhat.com) wrote:
> On Tue, Jan 17 2023, "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> >> On Wed, 11 Jan 2023 at 16:13, Cornelia Huck <cohuck@redhat.com> wrote:
> >> >
> >> > Introduce a new cpu feature flag to control MTE support. To preserve
> >> > backwards compatibility for tcg, MTE will continue to be enabled as
> >> > long as tag memory has been provided.
> >> >
> >> > If MTE has been enabled, we need to disable migration, as we do not
> >> > yet have a way to migrate the tags as well. Therefore, MTE will stay
> >> > off with KVM unless requested explicitly.
> >> >
> >> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> >> > ---
> >> >  docs/system/arm/cpu-features.rst |  21 +++++
> >> >  hw/arm/virt.c                    |   2 +-
> >> >  target/arm/cpu.c                 |  18 ++---
> >> >  target/arm/cpu.h                 |   1 +
> >> >  target/arm/cpu64.c               | 133 +++++++++++++++++++++++++++++++
> >> >  target/arm/internals.h           |   1 +
> >> >  target/arm/kvm64.c               |   5 ++
> >> >  target/arm/kvm_arm.h             |  12 +++
> >> >  target/arm/monitor.c             |   1 +
> >> >  9 files changed, 181 insertions(+), 13 deletions(-)
> >> >
> >> > diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> >> > index 00c444042ff5..e278650c837e 100644
> >> > --- a/docs/system/arm/cpu-features.rst
> >> > +++ b/docs/system/arm/cpu-features.rst
> >> > @@ -443,3 +443,24 @@ As with ``sve-default-vector-length``, if the default length is larger
> >> >  than the maximum vector length enabled, the actual vector length will
> >> >  be reduced.  If this property is set to ``-1`` then the default vector
> >> >  length is set to the maximum possible length.
> >> > +
> >> > +MTE CPU Property
> >> > +================
> >> > +
> >> > +The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
> >> > +presence of tag memory (which can be turned on for the ``virt`` machine via
> >> > +``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
> >> > +proper migration support is implemented, enabling MTE will install a migration
> >> > +blocker.
> >> > +
> >> > +If not specified explicitly via ``on`` or ``off``, MTE will be available
> >> > +according to the following rules:
> >> > +
> >> > +* When TCG is used, MTE will be available iff tag memory is available; i.e. it
> >> > +  preserves the behaviour prior to introduction of the feature.
> >> > +
> >> > +* When KVM is used, MTE will default to off, so that migration will not
> >> > +  unintentionally be blocked.
> >> > +
> >> > +* Other accelerators currently don't support MTE.
> >> 
> >> Minor nits for the documentation:
> >> we should expand out "if and only if" -- not everybody recognizes
> >> "iff", especially if they're not native English speakers or not
> >> mathematicians.
> >> 
> >> Should we write specifically that in a future QEMU version KVM
> >> might change to defaulting to "on if available" when migration
> >> support is implemented?
> >
> > Please make sure if you do something like that, that the failure
> > is obious; 'on if available' gets messy for things like libvirt
> > and higher level tools detecting features that are available and
> > machines they can migrate to.
> 
> I guess we can just keep the door open but decline walking through it if
> we fail to come up with a good solution...

Yeh; at least make sure that any migration failure gives an obvious
message in the log.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


