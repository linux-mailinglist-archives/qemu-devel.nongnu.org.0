Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADC74BD97A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 12:42:01 +0100 (CET)
Received: from localhost ([::1]:35278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM74q-0002Qx-2D
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 06:42:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nM6xO-0003ud-Jr
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 06:34:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nM6xJ-0004EI-PI
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 06:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645443247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XI5BOGYeTDL+MiTLtMUe5vfV7hFtUANruBJwkt43pxw=;
 b=Jep95fM5kDw6Gdfv+A3Mfv88PoOGUymzZPsnv7szUMTMoAOuS4KhdBFw6Mwy4TuhkOiDnl
 C4YG9K8j5dxuEAZzVjcJJH/mpXhudEdTzIiz2qkztm8zJv4o4WM5HG4M495V1XDIePhq+W
 9j/VwM/bMdz47wekeRgsgZuqPsAh6+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-HWvpDGeaNGSpPcYF4FLWpg-1; Mon, 21 Feb 2022 06:34:02 -0500
X-MC-Unique: HWvpDGeaNGSpPcYF4FLWpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE767814246;
 Mon, 21 Feb 2022 11:34:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B6787314F;
 Mon, 21 Feb 2022 11:34:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 99B7B1800094; Mon, 21 Feb 2022 12:33:58 +0100 (CET)
Date: Mon, 21 Feb 2022 12:33:58 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v2 2/2] hw/ide: add ich6 ide controller device emulation
Message-ID: <20220221113358.3xxyoyg2bf64ln2x@sirius.home.kraxel.org>
References: <20220218204155.236611-1-liavalb@gmail.com>
 <20220218204155.236611-3-liavalb@gmail.com>
 <68413ab-d14c-f5c6-4baf-12e3a18a6a5@eik.bme.hu>
 <e905a1d1-c7e8-bf10-22e8-cd5382b93c11@gmail.com>
 <d9733c34-b770-4717-cc8f-10cdf17640a8@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <d9733c34-b770-4717-cc8f-10cdf17640a8@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: jsnow@redhat.com, Liav Albani <liavalb@gmail.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > ICH6 and ICH7 IDE controllers are quite the same as far as I know. I
> > could change it, but then one could argue that the name ich6-ide seems
> > like "ich9-ide", so not sure if we can really go on this path.
> 
> I think we don't actually have ich9-ide, we only have piix3, piix4 and ahci,
> the latter is used by ich9. I just said that calling this new device
> ich7-ide instead of ich6-ide would make it more clear it has nothing to do
> with ich9.

Well, there actually is ich9-ide in physical hardware.  And it's quite
simliar for all ich6 -> ich9 (and possibly more) physical hardware.

The hardware implements both ide and sata.  Typically the bios setup
offers to pick ide or sata mode for the storage controller, and on boot
the chipset is configured accordingly by the firmware.

qemu never bothered to implement ide mode for q35/ich9.  When a guest OS
is so old that it doesn't come with a sata driver there is the option to
just use the 'pc' machine type.  And usually that's the better choice
anyway because these old guests tend to have problems with other q35
components too.

So I'm wondering why you implement ich{6,7,9}-ide in the first place?
What is the use case / benefit?

take care,
  Gerd


