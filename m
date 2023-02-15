Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDC2697F2C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 16:12:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJRQ-0007AT-As; Wed, 15 Feb 2023 10:11:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pSJRO-000785-Gr
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:11:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pSJRM-0001nI-HM
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:11:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676473883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IWmI5kOIcarBlond1pzL1VuWgQNkqgj7JxpH6qYKknc=;
 b=YhaHbvxVCfFP/mFw5jP7TYv1YVfJRW+dwKBm5eetXCbTg6e/BUAoTB0sSTPAz6DQyjTjj2
 EVYtzH76b7ccoZ8tQfFGlg6tszX0k36NUGhd/jBpMOONZQcpWUeOs0tAuhW6SUnGGNx4zP
 9DE7woRU+/VDoDu38g0JvDyz0m8okjw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-4lsejKZLOqSoieZMEIcz0g-1; Wed, 15 Feb 2023 10:11:17 -0500
X-MC-Unique: 4lsejKZLOqSoieZMEIcz0g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 216C93811F33;
 Wed, 15 Feb 2023 15:11:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.135])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E946D2166B30;
 Wed, 15 Feb 2023 15:11:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 904631800084; Wed, 15 Feb 2023 16:11:15 +0100 (CET)
Date: Wed, 15 Feb 2023 16:11:15 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Dorinda Bassey <dbassey@redhat.com>, qemu-devel@nongnu.org,
 armbru@redhat.com, pbonzini@redhat.com, wtaymans@redhat.com,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH] audio/pwaudio.c: Add Pipewire audio backend for QEMU
Message-ID: <20230215151115.posxqlvgzgl4eszw@sirius.home.kraxel.org>
References: <20230215085102.415053-1-dbassey@redhat.com>
 <CAJ+F1CL0_OAj5-jsyCVY5aF=qoSoPx2Mu=q8Z7mpp3mesRi6=Q@mail.gmail.com>
 <5159868.WgR6L5i3FV@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5159868.WgR6L5i3FV@silver>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

> > What is the main advantage compared to using the ALSA backend? (I
> > assume pipewire depends on ALSA anyway on Linux)
> 
> I think it does make sense to add Pipewire. Apparently it gains popularity.
> 
> The main advantage of Pipewire is its interoperability: It allows you to 
> connect apps with each other that only support a specific audio system. Say 
> one app that only supports JACK, another app that only supports PulseAudio, 
> another that only supports ALSA and so on. So it tries to provide a universal 
> plug on a system for all.

We already have support for pulse, jack and alsa in qemu, so there are
already three different ways to talk to pipewire.  So the question
whenever adding yet another way makes sense is valid IMHO.

Are there any additional features available when using the pipewire
protocol instead of pulseaudio or jack?

Are there any plans beyond audio?  pipewire does video too and gnome
screen sharing uses that.  Is it maybe possible to wire up the qemu vga
display and have pipewire send out qemu sound+display as video stream?

take care,
  Gerd


