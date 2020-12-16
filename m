Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B23D2DBC7D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 09:16:27 +0100 (CET)
Received: from localhost ([::1]:36394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpRz0-0000ZS-9V
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 03:16:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kpRxp-0008SU-0f
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 03:15:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kpRxm-0005hy-NP
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 03:15:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608106509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1LHsXws9ePrj9c6V+fDv9BpvyWinyCblDpbMSTC3UGU=;
 b=A4cJlbo4Qf0bQ4O1Bp3xEtxA/yGQ5ATUrazVltL+A7uFNkyA0SYWtVY43v9zi4ZGkgNYkv
 U8rN3L2fWomt6IWC5Uyx22uHZViiBPdLbw/CGt3MHqYnw5YSMx87XbtYrK1pRSsLP+rW3I
 Ac23kN2HAMnpjl/N7388K/rxhL7eSpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-xn1CHg6gOMO2LxvZs0rX8Q-1; Wed, 16 Dec 2020 03:15:05 -0500
X-MC-Unique: xn1CHg6gOMO2LxvZs0rX8Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A165801A9D;
 Wed, 16 Dec 2020 08:15:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D71275D6D3;
 Wed, 16 Dec 2020 08:15:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BA7C416E31; Wed, 16 Dec 2020 09:15:02 +0100 (CET)
Date: Wed, 16 Dec 2020 09:15:02 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 1/2] audio: remove qemu_spice_audio_init()
Message-ID: <20201216081502.pmyx36fmpkux72hs@sirius.home.kraxel.org>
References: <20200916084117.21828-1-kraxel@redhat.com>
 <20200916084117.21828-2-kraxel@redhat.com>
 <CALdTtnsBpZ1fyB=dJMdO7Oq=swHw5AsmZxVru_tf6iZZouC=5g@mail.gmail.com>
 <20201215080719.qnr2lgoi3l5iaogq@sirius.home.kraxel.org>
 <db92cbae-fcbf-f64e-709c-24ceaf6e1b4b@t-online.de>
MIME-Version: 1.0
In-Reply-To: <db92cbae-fcbf-f64e-709c-24ceaf6e1b4b@t-online.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: dann frazier <dann.frazier@canonical.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > I'm wondering though how you end up with spice being enabled
> > but spiceaudio driver not being available.  There is no separate
> > config switch so you should have both spice + spiceaudio or
> > none of them ...
> 
> Hi Gerd,
> 
> I can reproduce this problem on my openSUSE 15.2 system. I just have to uninstall the qemu-audio-spice rpm package.

Ah, that explains it.

> One could argue this is a packaging problem.

Well, sort of.  IMHO it is rather pointless to create a separate
qemu-audio-spice sub-package, I'd suggest to bundle all spice modules
(i.e. *spice*.so + hw-display-qxl.so) in one qemu-spice sub-package.

take care,
  Gerd


