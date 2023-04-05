Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5EF6D8025
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 16:56:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk4XF-0008EE-V7; Wed, 05 Apr 2023 10:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pk4XE-0008Dz-CG
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:54:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pk4XC-0006Pz-M5
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:54:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680706489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e+1gGhOiy2CXJQL56csdvWAEhqFWUNYr1LDoqFzvBkg=;
 b=i7fvRMJAusoFHBuyIO3M6vu3GzJUhU19A+qXPYTw4brFPvsIAeSExZUPe3OYo4Npo9AvFx
 LGZiNnItetWZCyQED0EnVD/LP+Q0/blbQMXkZiV5bKOeWMkUxw9MVIX5k8anMMzokGuu1G
 pSERDU3706VU9BnAHQgfAQ9m0+1+OrA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-7ej1ZOPkMLOxIfKamDyC9A-1; Wed, 05 Apr 2023 10:54:47 -0400
X-MC-Unique: 7ej1ZOPkMLOxIfKamDyC9A-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-3e385709826so1022791cf.0
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 07:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680706487; x=1683298487;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e+1gGhOiy2CXJQL56csdvWAEhqFWUNYr1LDoqFzvBkg=;
 b=Bl5pxdA14BTfDP0cYAGsTvLw+hnv+l7riAM957AyzwUNpYP3yWaYeNwmitIzAby+KL
 LO0nfkSOoxGLN27X5LPDzsI7QOIA2A5T1Ruo0HEv4uAYuaohpEKIWIVD2OYDdILgDkSn
 O3Djp0ZAig36Ej25j/CDmhzwgQgfWfgjL+kvOC6zwW+wBkt65lXRQGRwbYQNQptU+b1q
 eIJJtmmh6bkJKhgb4NgIXt+cW3e0WG74v+ltYycLUQWXtRVtP3EyZpDuKrhft0Lsd911
 R3dOF3AmymzqFpUWt1iH5ZuG8JXp1irB4c1exEnEsgTkKgQAdGRuK5UCquzovWcrkY9O
 opRA==
X-Gm-Message-State: AAQBX9cvCCDG5zIpma4Za7gkWXk1NlIGv1zosGUDjuHzLQbpBhH7Xk5g
 KUWrGbF6MsKrTU60k42rZFjI/gZM2Cp3xboGSXD5uLWJTFShjDdFcZUgCOpKdGE4t1Q2c28kZ1J
 PgH0VKdZGj69JMC8=
X-Received: by 2002:a05:622a:1a9a:b0:3e2:be32:cb74 with SMTP id
 s26-20020a05622a1a9a00b003e2be32cb74mr3856896qtc.3.1680706487147; 
 Wed, 05 Apr 2023 07:54:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350aOFvKMZrU12Was/RcMIfejO5Yc1Lg0vVWhXJG5dcAJLqelectWw3/GMBVHuO2NxNoFqR+73g==
X-Received: by 2002:a05:622a:1a9a:b0:3e2:be32:cb74 with SMTP id
 s26-20020a05622a1a9a00b003e2be32cb74mr3856858qtc.3.1680706486722; 
 Wed, 05 Apr 2023 07:54:46 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 o26-20020ac841da000000b003de4e646d63sm4062025qtm.32.2023.04.05.07.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 07:54:46 -0700 (PDT)
Date: Wed, 5 Apr 2023 10:54:45 -0400
From: Peter Xu <peterx@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 00/14] migration/ram.c: Refactor compress code
Message-ID: <ZC2Ltd8aZgj4L7Cl@x1n>
References: <cover.1680457764.git.lukasstraub2@web.de>
 <20230405144413.67f0b505@gecko.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230405144413.67f0b505@gecko.fritz.box>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Wed, Apr 05, 2023 at 02:44:13PM +0000, Lukas Straub wrote:
> On Sun, 2 Apr 2023 17:55:59 +0000
> Lukas Straub <lukasstraub2@web.de> wrote:
> 
> > This series refactors the ram compress code.
> > 
> > It first removes ram.c dependencies from the core compress code, then
> > moves it out to its own file. Finally, on the migration destination side
> > the initialisation and cleanup of compress threads is moved out of ram.c
> > to migration.c. This allows using COLO with compress enabled.
> > 
> > This series is based on the following series:
> > https://lore.kernel.org/qemu-devel/af76761aa6978071c5b8e9b872b697db465a5520.1680457631.git.lukasstraub2@web.de/T/#t
> > 
> 
> Hmm, I'm wondering if I should add postcopy+compress tests in this
> series? Because if we start this, the test matrix really will explode.

Do you perhaps mean when compress added to the existing (and already large)
postcopy test matrix?

I assume we can still add one for vanilla postcopy+compress, so it still
covers the major parts.  Or, add the compress test with the postcopy test
with most features enabled? The most comprehensive one in qtest should be:

/x86_64/migration/postcopy/preempt/recovery/tls/psk

That covers postcopy+preempt+tls, meanwhile there'll be an emulation of
network failure too during postcopy and test recovering from it.

-- 
Peter Xu


