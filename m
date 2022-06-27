Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 933C755BC58
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 00:42:29 +0200 (CEST)
Received: from localhost ([::1]:49954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5xR6-0001Aj-M3
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 18:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o5xMq-0007Pk-Qv
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 18:38:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o5xMk-0007Cn-Ri
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 18:38:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656369477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6LaqCw2OR0aGC5dM5mL8u3GFY5zA1Gmo2x269wH4qI4=;
 b=e3auup+2stOSI6Ru5GohlvZvr2wHARxbgrRRH+5HZ2tKy4ohzj2bDByDBgfPv+f0sctdgp
 mKDD+0UGDCVIzfsTw1GD05XEWsf48uc6vVSdiSc37TFxnXolGcyYhjdB+0rp0l9RFKJDaE
 L3B1MZdtwvTwYvx07TfyP/KoEuKTAm0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-ek3ghUkaOJaFwDgbGaVeUA-1; Mon, 27 Jun 2022 18:37:56 -0400
X-MC-Unique: ek3ghUkaOJaFwDgbGaVeUA-1
Received: by mail-wm1-f70.google.com with SMTP id
 c185-20020a1c35c2000000b0039db3e56c39so7966858wma.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 15:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6LaqCw2OR0aGC5dM5mL8u3GFY5zA1Gmo2x269wH4qI4=;
 b=zbm0GHOa9by+zYHR1juxxsldxFTu0oPhHjUAFv6VXSJWMTpi246QIGEcjkxU4AcDux
 GuOIagvMdzzLbzsC0TVj0I9pK5CGKoJjTSpwQ+I9XZ9ADgnOwDIMxnpUZMM6zFzWy+Zv
 tBqAFsjYFmamJkIme5i9L/oRdxGgGdrP4whx/PSl/ADjY9FJ2PgAoen2eyVRtiuL3WNX
 llMu2sELUzMywCYUYKagJEeS0wnJPcRa0dHJlzM/mYAGG0mluSx6PwOhYqQtKNpfBtJq
 KaIM8AUKOSph7I0++pkw2oRoXeK/TDxmXciiLSt41KBVozHJS7oprHt7rRN4JWFO9bLd
 b54A==
X-Gm-Message-State: AJIora96bn5hq3jEWD4ORJmsT2OXksB+8Rwv8mThZPK1iFkQzteaD1+k
 yuxbO9PRnM9+6LxO+ekduKIx9KjjfNLYRk8H9B2aonmJWAGljSL0eWWq52EtrIvuAoXuLGWkCwa
 3PNvx3OLN4solT+s=
X-Received: by 2002:a7b:c155:0:b0:3a0:43a2:e1e1 with SMTP id
 z21-20020a7bc155000000b003a043a2e1e1mr15939107wmi.160.1656369475047; 
 Mon, 27 Jun 2022 15:37:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vhRqLeQM567BFl4FtXfiLeSx3sw+nQH/jJsBQIZnWV6NKOm6bxUg5siEeusm1LMVzIq3zlXA==
X-Received: by 2002:a7b:c155:0:b0:3a0:43a2:e1e1 with SMTP id
 z21-20020a7bc155000000b003a043a2e1e1mr15939086wmi.160.1656369474808; 
 Mon, 27 Jun 2022 15:37:54 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b0021b9a4a75e2sm11698722wrr.30.2022.06.27.15.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 15:37:54 -0700 (PDT)
Date: Mon, 27 Jun 2022 18:37:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH] microvm: turn off io reservations for pcie root ports
Message-ID: <20220627183724-mutt-send-email-mst@kernel.org>
References: <20220603085920.604323-1-kraxel@redhat.com>
 <20220608120505-mutt-send-email-mst@kernel.org>
 <20220609072838.jcq4cdofpwvlew7j@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609072838.jcq4cdofpwvlew7j@sirius.home.kraxel.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Jun 09, 2022 at 09:28:38AM +0200, Gerd Hoffmann wrote:
> On Wed, Jun 08, 2022 at 12:06:17PM -0400, Michael S. Tsirkin wrote:
> > On Fri, Jun 03, 2022 at 10:59:20AM +0200, Gerd Hoffmann wrote:
> > > The pcie host bridge has no io window on microvm,
> > > so io reservations will not work.
> > > 
> > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > 
> > I don't much like overriding user like this. We end up users
> > setting it to silly values and then if we do want to
> > support this things just break. Thoughts?
> 
> Well, it just looked like the simplest way to tell the firmware that
> io reservations are pointless.  Do you have a better idea?
> 
> take care,
>   Gerd

Fail if user supplies values we can't support.

-- 
MST


