Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD9F702AF1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 12:56:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyVqw-0007pU-Ta; Mon, 15 May 2023 06:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pyVqr-0007ot-Mk
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:54:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pyVqq-00037Y-4R
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684148077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NO8clI/ymP8mHNpHEMT3OOrIyYGGAxntOD4vMAusQzc=;
 b=bn9hUjXJDPD+Y9MOvzgEVKPkpdiGNdyFFsJnRqXa0q0J6UumXTls0dZIbwtI0cFl6c95hI
 EJxdgWBdTrIKitJ/Rln8Yla4UFBmjJGJ/u9s/Zu+XNfOBxKbziU81aYWDWGnfHwpBzXLnH
 PLLQ2XyEooX2Bl136FwpktUav5S5brc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-WULRToWjMNydBSIfypPY9A-1; Mon, 15 May 2023 06:54:35 -0400
X-MC-Unique: WULRToWjMNydBSIfypPY9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D0A42811BC0;
 Mon, 15 May 2023 10:54:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26471C15BA0;
 Mon, 15 May 2023 10:54:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AC42E1801081; Mon, 15 May 2023 12:54:31 +0200 (CEST)
Date: Mon, 15 May 2023 12:54:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Hao Zeng <zenghao@kylinos.cn>, pbonzini@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH V2] hw/arm: enable qxl for aarch64
Message-ID: <wfky3jb2iuza4aom6si2jfkbgnjhalkpzmsc3x2ofjzilgtssw@ejwsuey3khif>
References: <20230512093108.1180726-1-zenghao@kylinos.cn>
 <ZGHyvBb8BQdKhWEy@redhat.com>
 <e2d06c7a6528a16b6ae58360d49a1fc9c7e8ade5.camel@kylinos.cn>
 <CAFEAcA8fN-+FUJapo=+ObZgfrJW32ccFj22qvU92ndNzPLQ9Dw@mail.gmail.com>
 <ZGIDg+8xIOGpTIO4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZGIDg+8xIOGpTIO4@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

> > > On Mon, 2023-05-15 at 09:52 +0100, Daniel P. Berrangé wrote:
> > > > Overall, IMHO, we should keep QXL restricted to as few build
> > > > scenarios
> > > > as possible. Given the status of SPICE, possibly we'll even want to
> > > > deprecate it on x86 eventually, not add it to more arches.
> > > >
> > > > What are you seeing as the compelling use case that requires QXL to
> > > > exist on aarch64 ?
> > 
> > >    Thank you for your answer, it made me learn a lot. No use case, just
> > > outside customer feedback on the ARM architecture qxl use has problems,
> > > I compiled the community qemu, found that the default does not support
> > > qxl display, so the submitted enablement.
> > >   I agree with you, please ignore this commit.
> > 
> > I would still like to know why QXL isn't automatically
> > enabled like every other PCI device...
> 
> Historical reasons ?

Yes.  Any display device with a pci memory bar is disabled on arm due
to the caching problems.  So virtio-gpu is the best option available
(and it IMHO still is, it works without strings attached).

With FEAT_S2FWB being available (not sure how widespread) we might
reconsider this.  One advantage would be that a pci vram device with
dirty tracking allows for GOP support, i.e. efifb works.  Needs some
changes in edk2 too (include the QemuVideoDxe driver in ArmVirt builds).

If someone wants that I'd recommend to enable bochs-display for arm.

VGA + QXL would add complexity (and attack surface) without benefits.
Nothing running arm is going to use the obsolete features of these
devices (2d accel, vga text mode, planar video modes, ...).

take care,
  Gerd


