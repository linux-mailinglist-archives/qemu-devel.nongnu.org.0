Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36916D8046
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 17:02:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk4dr-0002Qw-8W; Wed, 05 Apr 2023 11:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pk4dp-0002QW-IN
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:01:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pk4do-0001v9-3B
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:01:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680706899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6l+u7xD96RHkpqZ3v/PXf9QKq0R3DTdrPXgvJXVI+YA=;
 b=c7QOuQKH3AEPhyUURMc77qbCQNA2LhkEv7gt9nHBk437yW1vwocI6JApQlhwVNlingIrQB
 4n0KN76QxDY1ww+xRmv/KbzcMjM1dmvF5IqqSVs6+6LWCPZ2y0rFeF06SEIhWW3hVPqlaw
 N/0sX2PMgvuctWL74u+0r5ud9lc0MIM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-f9-hb8mKNa6KNKzaazJI3w-1; Wed, 05 Apr 2023 11:01:22 -0400
X-MC-Unique: f9-hb8mKNa6KNKzaazJI3w-1
Received: by mail-wm1-f70.google.com with SMTP id
 n11-20020a05600c3b8b00b003f04739b77aso7318773wms.9
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 08:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680706879; x=1683298879;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6l+u7xD96RHkpqZ3v/PXf9QKq0R3DTdrPXgvJXVI+YA=;
 b=wTDpK0WkAjvC4RYvjk894zHu2wJztt9aC+5F3UUMPWvVRKM6NBoUoTs0quHGv4bN7b
 8pFcVR7SDToxc85PAS/N+vO7HVTRVmZBlYJ+M3Eqxh4u/YffXScxy5jwdj0LHJjHGxRo
 I08cvlBXcMFAuJ6hMklzp+9/FbVvu9Dqb88un3fAyJePz+euAg/7lz4xOw5NLlD2tAHZ
 vyxLLdYJ7QuTkCpUzm5uD/OG8yQKaCScFDZBYt4EbQ9G2w9Revo84r+a+l0kfOANCNco
 HpOk8Ivph0XsT61C1w+6HbyXZ05vaM4tKNHzomzM9W7xel2I9qQFdx7XogBZnkGg+bSg
 th5A==
X-Gm-Message-State: AAQBX9cz72Wl/JdL9YbMoSwEok5mvtEx+ymm6jpiJb+MSBdv0LTQx2mt
 uM1nJqZm3Oo4iAtb3RDXJU4wKDwMI73FJzoFR86xi+VJEQJc27v97UOX0Rl3FHGUZTrQswJ+tb4
 XqnSh0YbPn2aiA58=
X-Received: by 2002:a5d:6791:0:b0:2d6:4e98:5f32 with SMTP id
 v17-20020a5d6791000000b002d64e985f32mr4498087wru.23.1680706879400; 
 Wed, 05 Apr 2023 08:01:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350YaUeig5YDlb6YXbFkv9xIJaG906k5+sNM17RNycOwiLLHH2WOlJ4Mzpgpkcp4rOLlz1LUzsw==
X-Received: by 2002:a5d:6791:0:b0:2d6:4e98:5f32 with SMTP id
 v17-20020a5d6791000000b002d64e985f32mr4498063wru.23.1680706879058; 
 Wed, 05 Apr 2023 08:01:19 -0700 (PDT)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a056000018400b002c56013c07fsm15089646wrx.109.2023.04.05.08.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 08:01:18 -0700 (PDT)
Date: Wed, 5 Apr 2023 16:01:16 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Laurent Vivier <laurent@vivier.eu>,
 Eric Blake <eblake@redhat.com>, dave@treblig.org
Subject: Re: [PATCH v2 10/10] hmp: Deprecate 'singlestep' member of StatusInfo
Message-ID: <ZC2NPOezgZ58998o@work-vm>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-11-peter.maydell@linaro.org>
 <87wn2s12bu.fsf@pond.sub.org>
 <CAFEAcA_v4yt1S+jjX2acyDLjb6OGTGOSLGxGUkH5XALKjBkHVQ@mail.gmail.com>
 <875yabzsmc.fsf@pond.sub.org>
 <CAFEAcA9owMUFkwy-CPC7i=ZFiqce=bzV9YJNFK9YQbh3oOAj1w@mail.gmail.com>
 <ZC2MGswxJiBfhPR2@work-vm>
 <CAFEAcA8za098K5wTLmr4ar+dT-wFzN+XCg3fjxPXn5qEA+U7iQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8za098K5wTLmr4ar+dT-wFzN+XCg3fjxPXn5qEA+U7iQ@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Wed, 5 Apr 2023 at 15:56, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > I think on balance I would go for:
> > >  * remove (ie deprecate-and-drop) 'singlestep' from the QMP struct,
> > >    rather than merely renaming it
> > >  * if anybody comes along and says they want to do this via QMP,
> > >    implement Paolo's idea of putting the accelerator object
> > >    somewhere they can get at it and use qom-get/qom-set on it
> > >    [My guess is this is very unlikely: nobody's complained so
> > >    far that QMP doesn't permit setting 'singlestep'; and
> > >    wanting read without write seems even more marginal.]
> > >  * keep the HMP commands, but have both read and write directly
> > >    talk to the accel object. I favour splitting the 'read'
> > >    part out into its own 'info one-insn-per-tb', for consistency
> > >    (then 'info status' matches the QMP query-status)
> >
> > If it's pretty obscure, then the qom-set/get is fine; as long
> > as there is a way to do it, then just make sure in the commit
> > message you say what the replacement command is
> 
> The point is that there isn't a replacement way to do it
> *right now*, but that we have a sketch of how we'd do it if
> anybody showed up and really cared about it. I think the chances
> of that happening are quite close to zero, so I don't
> want to do the work to actually implement the mechanism
> on spec...

Sure, then just drop it.

Dave

> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


