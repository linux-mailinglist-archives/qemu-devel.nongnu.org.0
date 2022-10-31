Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8038613AAE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 16:50:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opX2J-000311-O9; Mon, 31 Oct 2022 11:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opX2E-0002s1-Dn
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 11:49:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opX2B-0006wL-J3
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 11:49:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667231346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z3ImdtFgSoum08FNXzXQwI7OZAquniKJz0ux7qn58qw=;
 b=hxQn8dVOiFm/zHHEqxkpqAg4PoYGXO5prxKFRv06S8cPzuj96nSCZ4WUps3B3tsiGPnQHy
 YgsIAdOw2jNZNsqT1W/zbnq6v123rE9AoJ1bgb21ccrDweGJzUJ+syKupM7izZanAMnODL
 kObNoWLhH778JW3Rf64dX0tudNk1CvU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-675-06zgHPMNNSuYLhUYBO-wCA-1; Mon, 31 Oct 2022 11:49:03 -0400
X-MC-Unique: 06zgHPMNNSuYLhUYBO-wCA-1
Received: by mail-wm1-f70.google.com with SMTP id
 r6-20020a1c4406000000b003cf4d3b6644so1295154wma.6
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 08:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z3ImdtFgSoum08FNXzXQwI7OZAquniKJz0ux7qn58qw=;
 b=r903iEKjNQFVPiFMz+ucH7zSyDfGRbI31E5FJGcp7koWLsojar3IQoCVWPB4EM3xo3
 ZwUBzOgpqRbKTLZ/xOeeTiOsuT0LObiDxOM4NyEvSG9gqsCgkrgEtth1xBNenknK7Vf3
 uaRunDrDy1RrACmBx/Ymx+yuwpj+Y6+5YlnZ21P4UGevF/Fxn/po408od+qdvjp+OYEi
 05WD/BUP1gv4Qwiw48ypp5OAw2Dtyfizmadh3PikclU4zRIllRpd/x0cIdY9mTWEbDF3
 3ZWyiljESPOK4WW2XP3Wm6+18dhU190+IFJeo6OU2o9L4kpwdzQMxt9oR3Y7pTwkS4U2
 20/A==
X-Gm-Message-State: ACrzQf3yVRb06h/uADUpWHAjjwM+5t7nBKWWqkIPdf+gEbBeNRtSq2he
 2UVWniCV0e85j48qcyRgCP/CM3NwqU/7VT5cyju4mpLWxTVYoqGNtmXIvcsfBONKW8Y2cZ3dXMd
 wRRqtGssK/wn9r2o=
X-Received: by 2002:a05:600c:5023:b0:3c7:1526:fdb8 with SMTP id
 n35-20020a05600c502300b003c71526fdb8mr8768465wmr.28.1667231342341; 
 Mon, 31 Oct 2022 08:49:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4rdGsNDVoee/VP9kno5Q4QqjizRusO80Ao120HPjsEJGrrZYRuG+0zt0pHCgxvr00KIDcdug==
X-Received: by 2002:a05:600c:5023:b0:3c7:1526:fdb8 with SMTP id
 n35-20020a05600c502300b003c71526fdb8mr8768448wmr.28.1667231342110; 
 Mon, 31 Oct 2022 08:49:02 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b002367ad808a9sm7405234wrw.30.2022.10.31.08.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 08:49:01 -0700 (PDT)
Date: Mon, 31 Oct 2022 11:48:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH 0/4] hw: make TCO watchdog actually work by default for Q35
Message-ID: <20221031114835-mutt-send-email-mst@kernel.org>
References: <20221031131934.425448-1-berrange@redhat.com>
 <Y1/SoFxe3P2HVV3W@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y1/SoFxe3P2HVV3W@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 01:50:24PM +0000, Daniel P. Berrangé wrote:
> On Mon, Oct 31, 2022 at 01:19:30PM +0000, Daniel P. Berrangé wrote:
> > The TCO watchdog is unconditionally integrated into the Q35 machine
> > type by default, but at the same time is unconditionally disabled
> > from firing by a host config option that overrides guest OS attempts
> > to enable it. People have to know to set a magic -global to make
> > it non-broken
> 
> Incidentally I found that originally the TCO watchdog was not
> unconditionally enabled. Its exposure to the guest could be
> turned on/off using
> 
>   -global ICH9-LPC.enable_tco=bool
> 
> This was implemented for machine type compat, but it also gave
> apps a way to disable the watchdog functionality. Unfortunately
> that ability was discarded in this series:
> 
>   https://lore.kernel.org/all/1453564933-29638-1-git-send-email-ehabkost@redhat.com/
> 
> but the 'enable_tco' property still exists in QOM, but silently
> ignored.
> 
> Seems we should either fix the impl of 'enable_tco', or remove the
> QOM property entirely, so we don't pretend it can be toggled anymore.
> 
> With regards,
> Daniel

i am inclined to say you are right and the fix is to fix the impl.

> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


