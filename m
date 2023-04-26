Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 250A56EFA1F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 20:38:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prk1I-0007rW-61; Wed, 26 Apr 2023 14:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prk17-0007nm-3U
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 14:37:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prk15-0004t7-6r
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 14:37:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682534237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y9lsD0KGWcU1BbclELkHuS5VF/TYlXFELqbZu8QrCyY=;
 b=h0BgKtWNuYpBhsUJzTOifr4McnoHu6+mcnXgVsWyrx8u76q15tvtm5bVjTgXnNenbHyy3S
 ez4Gj/RZfkmvxTRzgpFlZxQFQe0TUIJC97T5M8SRbPdsaQtZoLutWqkN/uRhbcBbkjNRlW
 I5HwNFm64mRptk3QC71p59uf/aqxwtU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-FoTmJ-9UO3qyyIh3Pdh0ZA-1; Wed, 26 Apr 2023 14:37:16 -0400
X-MC-Unique: FoTmJ-9UO3qyyIh3Pdh0ZA-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-3ed767b30easo16880491cf.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 11:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682534235; x=1685126235;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y9lsD0KGWcU1BbclELkHuS5VF/TYlXFELqbZu8QrCyY=;
 b=U/ktRmeDpskHOrjtvZhOfhkbS/CF5U0aWzYVWwNXRUS2vJL9d7do4vZmXabEpZOtnD
 Z0IWtNgnXg3R3ee7oE/PaIVszsMHjUkvyfKztjph9Wm8i3xM9gRHN57egXQ/oBO84fpL
 DZAII8p8uJt+zfV54++blVjEAFWNS7emlMsSet01rJqPSLQ/yrShZDA/+kKPmJ9QFrdP
 KuKSUwSTwMPUyolxRTpYC+nbt2QV7oHeFJqWpMFMkSyOV3G8lUnMJ/jaHcZm+AowFESu
 1Xg+88gXYOQxG97ZEGgdV8wmcdDesD8AE1zzcEEAZtDh5uMwaYv8f5Xc7RzQyKTmDZ1J
 +M0g==
X-Gm-Message-State: AAQBX9faKJeN2U3MrtnqhZRcIIiteaM9IIexIRo/2dBPRDYDIjvWljcQ
 uQEY2VyRPftVMYYOIFaR/QjjKODf/VWdnEysazdyk33X5pYMeLdo1j07t8wcyZ78wr8+kb4YX9x
 /pHPFB0aKwjrj9Nw=
X-Received: by 2002:a05:622a:1822:b0:3ef:3204:5148 with SMTP id
 t34-20020a05622a182200b003ef32045148mr33759654qtc.1.1682534235719; 
 Wed, 26 Apr 2023 11:37:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350baLCljmpzKpGOknCNgQPLJI5sLnATzNJwboFLIxdH41XzIb1aAXA4fdvwzxzbP5IBChaIHbg==
X-Received: by 2002:a05:622a:1822:b0:3ef:3204:5148 with SMTP id
 t34-20020a05622a182200b003ef32045148mr33759630qtc.1.1682534235401; 
 Wed, 26 Apr 2023 11:37:15 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 y9-20020ac87c89000000b003ee08d3e073sm5488750qtv.42.2023.04.26.11.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 11:37:14 -0700 (PDT)
Date: Wed, 26 Apr 2023 14:37:13 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org,
	Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH 0/2] vmstate-static-checker: Fix VMS_ARRAY comparisons
Message-ID: <ZElvWffplx+1vNH1@x1n>
References: <20230425180544.1815888-1-peterx@redhat.com>
 <87354mfvnz.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87354mfvnz.fsf@secure.mitica>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Apr 26, 2023 at 06:36:00PM +0200, Juan Quintela wrote:
> Peter Xu <peterx@redhat.com> wrote:
> > I'm doing some machine type checks to make sure nothing breaks for
> > 7.2<->8.0.  Along the way I found one false negative report on e1000e using
> > the static checker, turns out to be an issue in the checker itself.
> >
> > The problem is the checker doesn't take VMS_ARRAY into account when
> > comparing with UNUSED, hence the total size is wrongly calculated.
> >
> > Fix that first in qemu by start dumping size of array as "num", then teach
> > the checker for that.
> >
> > NOTE: the patchset will change both behaviors for either -dump-vmstate on
> > QEMU or the checker, however both patches will be compatible even with old
> > QEMU dumps or even old vmstate-checker script.  That's not extremely
> > important, IMHO, but still worth mentioning.
> >
> > Thanks,
> >
> > Peter Xu (2):
> >   migration/vmstate-dump: Dump array size too as "num"
> >   vmstate-static-checker: Recognize "num" field
> >
> >  migration/savevm.c                |  3 +++
> >  scripts/vmstate-static-checker.py | 13 ++++++++++---
> >  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> Hi
> 
> once that you are working with the static checker.
> 
> Could we just run two checks in make check:
> 
> - qemu-<whatever> -M <previous-version> against the one from previous
>   version, and see that they match.
> - qemu-<whatever> -M <latests> against the one from previous version
>   And we save the diffs each time that we add something incompatible and
>   fix it on source.

Normally we don't have "latest machine" but only "previous"?  Checking
"previous" would be enough, right?  E.g. currently we're at 8.1 dev window,
so we check against 8.0 with whatever new thing coming.

> 
> I will start with x86_64.  And once that we have it running, the other
> architectures that care about version compatibility can add to it.
> 
> What do you think?

It sounds a good idea to have some way to check compat bits in unit tests.
I'm just not sure whether it's easy to integrate to make check: the
comparision requires building two qemu binaries; one normally with an old
tag that I built manually.

For the static checker itself, it normally also needs some intervention
from human, e.g., it doesn't understand things like field_exists() so it
can report "warnings" only which can be false negative even with ARRAY
issue fixed.

But ideally e.g. in a CI env we can always keep an old version qemu binary
ready for each arch to be tested, then verify forward+backward migration
with that old machine type with whatever patch applied on top.  One trick
here is we need to make sure the test cmdline contains the device/anything
that got changed by the patch.  It may not always be the case.

Thanks,

-- 
Peter Xu


