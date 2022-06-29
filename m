Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2F955F897
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 09:19:28 +0200 (CEST)
Received: from localhost ([::1]:33540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Ryw-0004sP-So
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 03:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6Rw8-0003Ig-Hq
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 03:16:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6Rw5-0008H6-3s
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 03:16:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656486988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7O+etg/wAtINEnDcL05fibBXV7eaysLazLLq4ftL3YE=;
 b=FhGtUncEWfJkgfYuINMpHHgS44c+iTPHvJ1gnH7Nw+1p8gHCoM6/Kyf1qhHMSvcrZzxOi4
 8Y0xZwoL2fdko4DsIgt1xxsfrRTo6ic93rLzarMbGOuJP53DZNS7IDR1nLK3CrtZqEAIk8
 2mzLsOcfIsvlhoBV8tDbwDoPrOdapso=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-jK20o53INEappIf0VMk5ng-1; Wed, 29 Jun 2022 03:16:24 -0400
X-MC-Unique: jK20o53INEappIf0VMk5ng-1
Received: by mail-wr1-f72.google.com with SMTP id
 r20-20020adfb1d4000000b0021b8507563eso2129460wra.16
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 00:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7O+etg/wAtINEnDcL05fibBXV7eaysLazLLq4ftL3YE=;
 b=sM7jg0fixKTprciPiSCGxGjGUsx5KFJAqE1k10DdpO5JwbZBlhGMBW41mUhnlZku8d
 a1LadVOj+x6W7QxNBLMXCj7Jysp4tVVOTpAi6uy72WUdYjDn79zJQOTR8DuTkqPw4UYX
 xuMtyPKtl5IeWxjbNKmYpBtqwCYYBzzWWmtldKHiKPnuOxuayF6ZmXWQtIxq5iPb96iY
 Slyj1vY9mnpjVWNjArlo3gygdmNzYaYJYPG4CofVmaFVBZ48P9oyv4G3Bc8IIzprDrjo
 FN/XsutqHeXeXZyFKXrsamDzbhxRD/k0UN3mmNmGNvhBi0kFUGg/x4+wYXPE1omWgDRy
 TVog==
X-Gm-Message-State: AJIora85Qsarh2MiW7X4X7UUSwdmsMFQ6khzKu7dqsrYwTzK5wFD5OBW
 sEAPuT4cEH9NtxNftPVGanRGTSRfXwQNRKWkpM9rgdAV1qomXr/sK9zciStP0+KUbS29qtjCax1
 8L6njqHKidZzq5M4=
X-Received: by 2002:a5d:4647:0:b0:21b:bde9:f267 with SMTP id
 j7-20020a5d4647000000b0021bbde9f267mr1535952wrs.526.1656486983347; 
 Wed, 29 Jun 2022 00:16:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s7zYA31xrVj9DXxqCZe64o1cykSMAK+ymS110EpAx08nLAiIaiN+xXa8S3pj2bTYxL9FSKog==
X-Received: by 2002:a5d:4647:0:b0:21b:bde9:f267 with SMTP id
 j7-20020a5d4647000000b0021bbde9f267mr1535933wrs.526.1656486983086; 
 Wed, 29 Jun 2022 00:16:23 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 e2-20020adfdbc2000000b0021b9f126fd3sm15995857wrj.14.2022.06.29.00.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 00:16:22 -0700 (PDT)
Date: Wed, 29 Jun 2022 03:16:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH] microvm: turn off io reservations for pcie root ports
Message-ID: <20220629031527-mutt-send-email-mst@kernel.org>
References: <20220603085920.604323-1-kraxel@redhat.com>
 <20220608120505-mutt-send-email-mst@kernel.org>
 <20220609072838.jcq4cdofpwvlew7j@sirius.home.kraxel.org>
 <20220627183724-mutt-send-email-mst@kernel.org>
 <20220629071023.2wfvs7utmx6w3p4o@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629071023.2wfvs7utmx6w3p4o@sirius.home.kraxel.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 29, 2022 at 09:10:23AM +0200, Gerd Hoffmann wrote:
> On Mon, Jun 27, 2022 at 06:37:50PM -0400, Michael S. Tsirkin wrote:
> > On Thu, Jun 09, 2022 at 09:28:38AM +0200, Gerd Hoffmann wrote:
> > > On Wed, Jun 08, 2022 at 12:06:17PM -0400, Michael S. Tsirkin wrote:
> > > > On Fri, Jun 03, 2022 at 10:59:20AM +0200, Gerd Hoffmann wrote:
> > > > > The pcie host bridge has no io window on microvm,
> > > > > so io reservations will not work.
> > > > > 
> > > > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > > > 
> > > > I don't much like overriding user like this. We end up users
> > > > setting it to silly values and then if we do want to
> > > > support this things just break. Thoughts?
> > > 
> > > Well, it just looked like the simplest way to tell the firmware that
> > > io reservations are pointless.  Do you have a better idea?
> > > 
> > > take care,
> > >   Gerd
> > 
> > Fail if user supplies values we can't support.
> 
> Well, it is the *default* value which doesn't work on microvm.
> 
> take care,
>   Gerd

Changing defaults is ok of course. Let's just not override the user.

-- 
MST


