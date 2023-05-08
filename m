Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48E26FAEE8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 13:48:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvzLd-0001en-Dv; Mon, 08 May 2023 07:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pvzLZ-0001ed-4v
 for qemu-devel@nongnu.org; Mon, 08 May 2023 07:48:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pvzLX-0000rs-AC
 for qemu-devel@nongnu.org; Mon, 08 May 2023 07:48:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683546482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4NU8Ina6CYU3EE/dixRSFMPxF1uBRyqYq6HXZcQeb/w=;
 b=hYivVi/WNg9jQcoyp2Na4wDWfuza3YHX8N7VCwmTUCzvFySZtFSoggRBYINoLOkSl2wRGr
 BQQ4TFxYth1fRkMHTBAZOkiTDW4E0Lyy4KHNM2g2vzB20DH7E9Mq2m3RXTUvFAvMaNVd0r
 03LmQj0ssej36TyRyMwMOVuFJRzLWTk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-dgKQPpI9NYOy8qTgJGeOGw-1; Mon, 08 May 2023 07:48:01 -0400
X-MC-Unique: dgKQPpI9NYOy8qTgJGeOGw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-307814dd87eso1103078f8f.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 04:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683546480; x=1686138480;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4NU8Ina6CYU3EE/dixRSFMPxF1uBRyqYq6HXZcQeb/w=;
 b=OA1T5zcjO0oB5UPXvN7WmKBO/lDTai8qCmgRL6j6Qe9aBuCSputrP5Y05MDAx3BI9W
 NjVPXENcYvy3xdSGO5knpKCVR2V1uM5UXsRULQqRSpre4Q61QfCiM0IB4isVrgWn7DN9
 RDeG5+K+tAHnbxV7KkVWcx2yqdOl1q3BRL8MOocm6INQdDUi9Wj3uktp2rKNebxg7+bp
 Fb0Y5PS2xlB1dAuo94XaU8RBlIoSe8px482LSg9GXp+RPmfWPtI6HVPLL4dGud4tjIyf
 AG4MNzYgLnJ3nOlJtsU7xL2ycyo3nTUEXNTNpiiKXYB3KLwjWfZT/aBXsTvxP8TscXrw
 ZyPQ==
X-Gm-Message-State: AC+VfDyvchOxuJupRF9bsAMOBm0oVLqWozobIclg8q0xEV9tj0t1DyWz
 h1w6Qx7uA5Lhv/5DIShvLzETfSbn0GPgLqRnXOx5uxEJFYFthv3byum1lPE2QrjjE7CWOp40IfX
 eTLayX8dpAlO0k7w=
X-Received: by 2002:a05:6000:1a48:b0:306:34e4:be40 with SMTP id
 t8-20020a0560001a4800b0030634e4be40mr6617852wry.33.1683546479985; 
 Mon, 08 May 2023 04:47:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6m4YT07r4alvio77xlZYZfCtmyGvZ2pbaL+WiOATdXlwgIrTeGWGHGGgQhoqk8NVYo0bnSbw==
X-Received: by 2002:a05:6000:1a48:b0:306:34e4:be40 with SMTP id
 t8-20020a0560001a4800b0030634e4be40mr6617845wry.33.1683546479702; 
 Mon, 08 May 2023 04:47:59 -0700 (PDT)
Received: from redhat.com ([31.187.78.15]) by smtp.gmail.com with ESMTPSA id
 e13-20020a5d65cd000000b0030789698eebsm7496183wrw.89.2023.05.08.04.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 04:47:59 -0700 (PDT)
Date: Mon, 8 May 2023 07:47:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: missing boot rom: is it really a fatal error?
Message-ID: <20230508074529-mutt-send-email-mst@kernel.org>
References: <d6f3e06c-ee84-5101-c583-220aa90c0c12@msgid.tls.msk.ru>
 <20230508062407-mutt-send-email-mst@kernel.org>
 <5492f69f-021d-cf25-5a92-8310255fddca@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5492f69f-021d-cf25-5a92-8310255fddca@msgid.tls.msk.ru>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Mon, May 08, 2023 at 01:42:04PM +0300, Michael Tokarev wrote:
> 08.05.2023 13:28, Michael S. Tsirkin wrote:
> > On Sun, May 07, 2023 at 08:56:23PM +0300, Michael Tokarev wrote:
> ..
> 
> > > I'm about to revert that old change on debian, to make it just a warning instead
> > > of an error (the code is different now, but the same principle applies), - because
> > > I dislike dependencies which are useless 99.9% of the time and are trivial to
> > > install when actually needed.
> ..
> > I advise against it.
> > If you boot guest on a system with boot rom not installed you will not
> > be able to migrate to a system with boot rom installed.
> > why not? because we don't know how big to make the rom BAR.
> > And users will not discover until much much later after they have
> > painted themselves into a corner.
> 
> Yes, I know about the migration. Actually there's an old bug report open
> against debian qemu package, - the context is similar to the old bios128
> vs bios256 thing in qemu upstream, - boot roms might change in size too.
> 
> In this context though, the talk is not about migration at all. The missing
> dep is in Xen HVM qemu package, a xen-only build of qemu-system-i386. And
> this one fails to start unless the boot roms are provided. It is not even
> capable of migration to begin with :)
> 
> Thank you for the reminder, - very useful.
> 
> /mjt

I guess we decided we'd rather not handle reports from users about net
boot not working. It's true most users don't need net boot but then
that's true for most qemu functionality - 99% of users
probably need 1% of the functionality. It's just a different 1% for each
user...

-- 
MST


