Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7511155E570
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 16:48:10 +0200 (CEST)
Received: from localhost ([::1]:35938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6CVd-0004Cy-3j
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 10:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6CUD-0003Kt-Bs
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:46:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6CTp-0000Kf-6Q
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656427564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ve34xPlqRNHBbvU1cpacMxfTKLyZQHYIUCus4A1MzWY=;
 b=ARI4mJ3qToO0DX0l4FsbdMPZd1j42dAWgQDpWXEIklx6yQZzO3EYPz9cK80SVNy/9+oZ3P
 6gUOdmxMG+sijAU7lU+lvXy3tdqVrNUIl7fMXznes/TDsWHNI5EzDXJ1jdkk+DeAq5VQPH
 H2YmOZ3BbjwN/g+mPZDmMf+md/1ciLQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-Mt5Wjff9OmmFYUfxDjsoKw-1; Tue, 28 Jun 2022 10:46:02 -0400
X-MC-Unique: Mt5Wjff9OmmFYUfxDjsoKw-1
Received: by mail-wr1-f72.google.com with SMTP id
 w12-20020adf8bcc000000b0021d20a5b24fso452355wra.22
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 07:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ve34xPlqRNHBbvU1cpacMxfTKLyZQHYIUCus4A1MzWY=;
 b=YzOoy2WwpJ4JzFocMYsckBHa0nSAHs+7Sx/8kmMWn6U7fOVKl7AZJdwN1ibQLicBE7
 rGhYWN8i+Kj3z0Umbgvxo/462CjRDU4OPCLYJFfF/d1qpFO2F1/icbr/QOMN62+/nP+S
 N1SwjKkTg+yoeXpzMHHrN53WEA4GRoPWsjKh5lkozw4jWcKHFJy2BIihEyD1vfl2v7ll
 qUIhr3AJ4AkdUp4qA6ZOdnG+qc2fgfXvz7CMBWtpsAETlxZ0qV2IWdMTD+V1i3gxSIpj
 fpSQwNrjBJmc+Z4LJ+wDFR/3g+Ql7RY6dAy/Ix5QFcfSjFpiVn/OP641cgun29yIY6xu
 CTfQ==
X-Gm-Message-State: AJIora+TePu+Us9kLyTuv/YetP5tsEk7e5b9CZ3E0qMqZGg8jVhUWgTr
 FMq2Y8gGCdJR6KM8HDQDueWZvAW6SjG/6/Zi8mpirWyTvs8EPHHYZcVN1Z8LVkJWzTymqolQEY+
 l0dpv3wrs9kWKseU=
X-Received: by 2002:a05:600c:a47:b0:39e:f953:84e2 with SMTP id
 c7-20020a05600c0a4700b0039ef95384e2mr26693079wmq.202.1656427561052; 
 Tue, 28 Jun 2022 07:46:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uuAtx9XO4MBUekRvU7sPCLrXwaYA0XM+Rs2OLQBRM2bZkd1U2JJ1uzP2uxxiIJBvc21kiejA==
X-Received: by 2002:a05:600c:a47:b0:39e:f953:84e2 with SMTP id
 c7-20020a05600c0a4700b0039ef95384e2mr26693054wmq.202.1656427560792; 
 Tue, 28 Jun 2022 07:46:00 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 x3-20020a5d4443000000b0021b8bb97a47sm13331925wrr.50.2022.06.28.07.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 07:46:00 -0700 (PDT)
Date: Tue, 28 Jun 2022 10:45:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: Why we should avoid new submodules if possible
Message-ID: <20220628104230-mutt-send-email-mst@kernel.org>
References: <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220628062551-mutt-send-email-mst@kernel.org>
 <1182d647-bef1-0a8a-a379-86f029af7ac6@redhat.com>
 <20220628070151-mutt-send-email-mst@kernel.org>
 <2c3bb7f4-45cb-9c13-4ecd-22de75eaa7d3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c3bb7f4-45cb-9c13-4ecd-22de75eaa7d3@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Jun 28, 2022 at 02:39:31PM +0200, Thomas Huth wrote:
> On 28/06/2022 13.14, Michael S. Tsirkin wrote:
> > On Tue, Jun 28, 2022 at 12:50:06PM +0200, Thomas Huth wrote:
> [...]
> > > > Come on, this is just a test. We *really* don't care if an ISO
> > > > we use to test ACPI is using an exploitable version of grub.
> > > 
> > > Wait, I thought we were only talking about tappy here? The ISO binaries
> > > should certainly *not* be bundled in the QEMU tarballs (they are too big
> > > already anyway, we should rather think of moving the firmware binaries out
> > > of the tarball instead).
> > > 
> > >   Thomas
> > 
> > IIUC there are three things we are discussing
> > - biosbits source
> > - biosbits image
> > - tappy
> 
> Oh well, I missed that part of the discussion so far since the corresponding
> patches did not make it to the mailing list ¯\_(ツ)_/¯
> 
> Anyway, that's just another indication that it might not be the right fit
> for inclusion into the QEMU source tree. So either download it similar to
> (or included in) the avocado tests, or maybe another solution would be to
> have a separate "qemu-ci" or "qemu-testing" repository for stuff like this
> ... ?
> 
>  Thomas

I don't think anyone suggested sticking all those blobs in qemu.git: I
proposed a submodule, others proposed the web (fetched with avocado or
just wget). If it's a submodule we'll want to skip it in the tarball,
and skip the test if not checked out.  Whoever is trying to do
development out of a tarball should just stop :).

-- 
MST


