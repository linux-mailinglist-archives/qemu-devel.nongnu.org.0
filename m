Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0FB655A07
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 12:45:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p92wU-0001sq-KS; Sat, 24 Dec 2022 06:43:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p92wS-0001si-Ef
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 06:43:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p92wQ-0007VU-NY
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 06:43:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671882228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fSBsIA72wykcYqS1c3cziGc5YJ42vbmz/d3XgB3s83g=;
 b=hxCkAkYvD8ecKTgjzmVMphz6i4P0pGPnYwpk5yuS1HXyp+fZvqm5uwh4nX/LuuwAbJ0NUZ
 YvvmzHvX4xglOkXMk6GX1YR62vCgRHHOvfQ4yo1h7AvqxkfnWp+jl3fAmrM84hNPPdaNww
 649zcKdzXsWCpDwm1dfXQm3KBV9eUgQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-YHc6Mro5P_uuaDKv3SZfuA-1; Sat, 24 Dec 2022 06:43:46 -0500
X-MC-Unique: YHc6Mro5P_uuaDKv3SZfuA-1
Received: by mail-wr1-f72.google.com with SMTP id
 v14-20020adf8b4e000000b0024174021277so1170386wra.13
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 03:43:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fSBsIA72wykcYqS1c3cziGc5YJ42vbmz/d3XgB3s83g=;
 b=KJIlc7ibd+oBLt4wmquASa3+Qj7YfV/BTKHiyqcnhY6JtlX32G2Iq7kI5PiToWjgoQ
 5OPPylbt3LTiqw7spHqRVBndFDK3YFMm0l+C78sdWueyui6qJ7Us6IywVbk6f7wrRuFc
 ft/cLrSTTaTlTCjI4q4Fh+6yQmfPbqxgf8wAYgE7xGtJeJoqrPABapyMorehI0zr2pEU
 tT9OB8Tc5dgV2vi59D9rIOSBExuLS4JL8Eve0DBCekOZdqLWoINRuM62qtg1dau7TnH/
 cqwRJzVMO/tdAN/PZGcrI1mGs7OkO43z9lsAkE38GBTtId2RY3JN8QnWs3SdvnZf7hYr
 JjBw==
X-Gm-Message-State: AFqh2kouXNKpvGuJSjXMN4xS1wHnGVw3EdnciSKGlfHgXiHGkZrdD+2A
 rdfWEFZJkedv2yWyv/9ubW1JeJtUYr6TUNMEXkyJ5mqwgWyiCz7sTnCD0ksl52HjDBFdegLGASz
 lTBlzwodjMShyIKE=
X-Received: by 2002:a5d:4484:0:b0:242:806c:8612 with SMTP id
 j4-20020a5d4484000000b00242806c8612mr7525968wrq.7.1671882225671; 
 Sat, 24 Dec 2022 03:43:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtPU7qRHgdHyqp20ICg5Wg48HyRPvsnYpHoM6y2Nw9sfuS6OCjLlnlTk93h8HvKedxBSX8Ctg==
X-Received: by 2002:a5d:4484:0:b0:242:806c:8612 with SMTP id
 j4-20020a5d4484000000b00242806c8612mr7525961wrq.7.1671882225462; 
 Sat, 24 Dec 2022 03:43:45 -0800 (PST)
Received: from redhat.com ([2.52.27.62]) by smtp.gmail.com with ESMTPSA id
 n14-20020a5d484e000000b00242814c2cf0sm5643778wrs.4.2022.12.24.03.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 03:43:44 -0800 (PST)
Date: Sat, 24 Dec 2022 06:43:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, jonathan.cameron@huawei.com, philmd@linaro.org
Subject: Re: [PATCH v2 0/7] include/hw/pci include/hw/cxl: Clean up includes
Message-ID: <20221224063930-mutt-send-email-mst@kernel.org>
References: <20221222100330.380143-1-armbru@redhat.com>
 <B98EF322-5449-4942-8718-D3504B863B96@gmail.com>
 <87edsremti.fsf@pond.sub.org>
 <20221222142149-mutt-send-email-mst@kernel.org>
 <87k02i7kr8.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87k02i7kr8.fsf@pond.sub.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Fri, Dec 23, 2022 at 06:27:07AM +0100, Markus Armbruster wrote:
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Thu, Dec 22, 2022 at 11:48:25AM +0100, Markus Armbruster wrote:
> >> Bernhard Beschow <shentey@gmail.com> writes:
> >> 
> >> > Am 22. Dezember 2022 10:03:23 UTC schrieb Markus Armbruster <armbru@redhat.com>:
> >> >>Back in 2016, we discussed[1] rules for headers, and these were
> >> >>generally liked:
> >> >>
> >> >>1. Have a carefully curated header that's included everywhere first.  We
> >> >>   got that already thanks to Peter: osdep.h.
> >> >>
> >> >>2. Headers should normally include everything they need beyond osdep.h.
> >> >>   If exceptions are needed for some reason, they must be documented in
> >> >>   the header.  If all that's needed from a header is typedefs, put
> >> >>   those into qemu/typedefs.h instead of including the header.
> >> >>
> >> >>3. Cyclic inclusion is forbidden.
> >> >
> >> > Sounds like these -- useful and sane -- rules belong in QEMU's coding style. What about putting them there for easy reference?
> >> 
> >> Makes sense.  I'll see what I can do.  Thanks!
> >
> > It would be even better if there was e.g. a make target
> > pulling in each header and making sure it's self consistent and
> > no circularity. We could run it e.g. in CI.
> 
> Yes, that would be nice, but the problem I've been unable to crack is
> deciding whether a header is supposed to compile target-independently or
> not.  In my manual testing, I use trial and error: if it fails to
> compile target-independently, compile for all targets.  This is s-l-o-w.

Yes and it's annoying for developers too.
Do we want to come up with a scheme for target-dependent files?
Name them target-X or put in a target/ directory?
We could also write checkpatch rules to disallow
including target specific headers in target independent files then.

> The other problem, of course, is coding it up in Meson.  I haven't even
> tried.


