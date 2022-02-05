Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB8F4AA8C7
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 13:33:13 +0100 (CET)
Received: from localhost ([::1]:39704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGKFc-0005En-2z
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 07:33:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGK8K-0004Xy-3S
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:25:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGK8G-000370-2h
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:25:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644063929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2dQHtGODww96ib93p0RQHsxK3tmuPOynGVKYXEO7hrY=;
 b=SeWpTLZLucClCnLa63hBIo4C4lkDv91Gqw6wowNHRMI59TqYfU5A2kTHS5vEREjcoewnTU
 KTZbcYyEnqV3X6n/lGcWsjN4UCZOzIFcbmB5QqLKwKc8hglPHqFMHr0zmznLVbOWUIKWVd
 I22GLORUcBfvQ1v4IJrkXhdE/7vA2ZY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-pE2AkuV-M-GlWFaPIG_upw-1; Sat, 05 Feb 2022 07:25:28 -0500
X-MC-Unique: pE2AkuV-M-GlWFaPIG_upw-1
Received: by mail-wm1-f69.google.com with SMTP id
 a17-20020a05600c069100b0037bb7eb6944so25503wmn.2
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 04:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2dQHtGODww96ib93p0RQHsxK3tmuPOynGVKYXEO7hrY=;
 b=4z9cXA87Lfc6beSYtQc3qZwnwA1E9uvn301DwoS6TH3HC1/x444HFAwZCs7b8+rXOj
 7R8O5AmKHd6lE/qUrUh2QoSPSA6tBBqnaEaQ+gRqkmyUNgHQGyor83aBpbO1gWonuVpn
 f9SQsaUhC4zwfutI6lJ2QDgtNYU63aJLXSsH/xXzfKkGq4vDkl0DHfgd9de2asiKgYfa
 A1254m8TL0l/U+Ypnd7jIUNly1hI3sVSuaq5nT6WegmwTeRt7MDhtt1GssbRzBeHnw5s
 khDqsnsBxoOeMBiP5qFxdfaAewQNCL9FyB0c+vJj3qy6XjTPHyIGUh7lrHeMibtyAjmX
 /I2A==
X-Gm-Message-State: AOAM531PnI0VXOGFNAoYGg1+FT2/yqpik9oOyC90ffvvDk4He3iZ/5Hs
 aeRF7kkgYO1DnrI8TmExrnnyaU4wm1NF9ws84vpc4ULFQxC89tYMkMmvDlXvvpYQ7Qg3YoMw4CN
 Q11HwZcL/0tWu7aQ=
X-Received: by 2002:a05:600c:35c8:: with SMTP id
 r8mr6299955wmq.142.1644063926626; 
 Sat, 05 Feb 2022 04:25:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4vF5b8psf4HZjNCdsOGA8G1h/OcOiI92z7anX67h0K+dUeTQJpZHnbgUrqx3NHAro8xiwoA==
X-Received: by 2002:a05:600c:35c8:: with SMTP id
 r8mr6299941wmq.142.1644063926407; 
 Sat, 05 Feb 2022 04:25:26 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id m8sm4382530wrn.106.2022.02.05.04.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 04:25:24 -0800 (PST)
Date: Sat, 5 Feb 2022 07:25:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/32] virtio,pc: features, cleanups, fixes
Message-ID: <20220205072452-mutt-send-email-mst@kernel.org>
References: <20220205014149.1189026-1-mst@redhat.com>
 <CAFEAcA91cVDym5fVCXgHFHJ8fkt8GhrOis-EPHN6YWpVn9TOCA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA91cVDym5fVCXgHFHJ8fkt8GhrOis-EPHN6YWpVn9TOCA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 05, 2022 at 11:07:33AM +0000, Peter Maydell wrote:
> On Sat, 5 Feb 2022 at 01:42, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > The following changes since commit 8f3e5ce773c62bb5c4a847f3a9a5c98bbb3b359f:
> >
> >   Merge remote-tracking branch 'remotes/hdeller/tags/hppa-updates-pull-request' into staging (2022-02-02 19:54:30 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >
> > for you to fetch changes up to 593a84174b09f0c8ae4d35ad014f93d1fb7cac00:
> >
> >   util/oslib-posix: Fix missing unlock in the error path of os_mem_prealloc() (2022-02-04 20:16:59 -0500)
> >
> > ----------------------------------------------------------------
> > virtio,pc: features, cleanups, fixes
> >
> > virtio introspection commands
> > Part of ACPI ERST support
> > fixes, cleanups
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Fails to compile for 32-bit, Windows and macos because of format
> string issues in hmp-cmds.c. Here's a sample job with the errors:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2058116754
> 
> thanks
> -- PMM

Just re-pushed with a fixup patch. Can you try again pls?

-- 
MST


