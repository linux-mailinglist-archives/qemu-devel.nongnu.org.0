Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5691429A63C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 09:11:13 +0100 (CET)
Received: from localhost ([::1]:39522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXK4W-00086D-Eu
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 04:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kXK3B-0007ZH-Tv
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 04:09:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kXK39-0002Yt-1Q
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 04:09:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603786184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ianT2ZiygVGyUw8kmt2t2kzbxwisknCUlX1sBAYJCVs=;
 b=BDbPD8t/s67pbQ5xdJLHVVz5Lw6PHiEMRryPT5XfOuxIAqDJvdWLsMV2fA31JsBOG8ckZ9
 nBPTpQyZ4Ud3qX3mawudiiuB2KYF+JQ39euucWPnuC52+kb33ty0IESRybOCCokINCFvv7
 /b54MYO1yCB+eyFAT7w9IKcOqaN+IcY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-SkmmK0DOPwShLeKSpY7UBA-1; Tue, 27 Oct 2020 04:09:41 -0400
X-MC-Unique: SkmmK0DOPwShLeKSpY7UBA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 924E11019624;
 Tue, 27 Oct 2020 08:09:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1435955760;
 Tue, 27 Oct 2020 08:09:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DF1789D0D; Tue, 27 Oct 2020 09:09:38 +0100 (CET)
Date: Tue, 27 Oct 2020 09:09:38 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 6/9] dev-serial: add always-plugged property to ensure
 USB device is always attached
Message-ID: <20201027080938.5q5stvmd5cza7hfh@sirius.home.kraxel.org>
References: <20201026083401.13231-1-mark.cave-ayland@ilande.co.uk>
 <20201026083401.13231-7-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
In-Reply-To: <20201026083401.13231-7-mark.cave-ayland@ilande.co.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: samuel.thibault@ens-lyon.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>      case CHR_EVENT_OPENED:
> -        if (!s->dev.attached) {
> +        if (!s->always_plugged && !s->dev.attached) {
>              usb_device_attach(&s->dev, &error_abort);
>          }

Not needed (but doesn't hurt either).

>          break;
>      case CHR_EVENT_CLOSED:
> -        if (s->dev.attached) {
> +        if (!s->always_plugged && s->dev.attached) {
>              usb_device_detach(&s->dev);
>          }

Ok.

> -    if (qemu_chr_fe_backend_open(&s->cs) && !dev->attached) {
> +    if (s->always_plugged || (qemu_chr_fe_backend_open(&s->cs) &&
> +                              !dev->attached)) {

The dev->attached check should not be skipped, i.e. the logic should be
((always_plugged || open) && !attached).

take care,
  Gerd


