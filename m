Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7819D61F92F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 17:20:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os4qj-00012p-9C; Mon, 07 Nov 2022 11:19:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1os4qf-00012b-PO
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 11:19:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1os4qP-0004CF-RE
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 11:19:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667837960;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o3FhoMRlaFkaHIiweeqndHIPUaMjlYpQ6+Vto683aPI=;
 b=GFqWuT8dW1Ciqi78+Y53JNinfS+APfyxxM8FI9+e1+lajzW7QuHIQ1oJikejJV9p9X6UoU
 1rp21Gb+1smw26BxT2jomxmKajEuGcFrMeob+4iyiyJEa5rKuB598rlJH6Npx6M9/d/qHc
 enD9GhWMc54u9oH2Fyu3Xj1FLMsh+8E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-dACXHCgpPsCyUs5C-5Kedg-1; Mon, 07 Nov 2022 11:19:17 -0500
X-MC-Unique: dACXHCgpPsCyUs5C-5Kedg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 219663814948;
 Mon,  7 Nov 2022 16:19:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC6F140C6DC7;
 Mon,  7 Nov 2022 16:19:13 +0000 (UTC)
Date: Mon, 7 Nov 2022 16:19:10 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Sunil V L <sunilvl@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH V2] hw/riscv: virt: Remove size restriction for pflash
Message-ID: <Y2kv/k5oKGOd+90w@redhat.com>
References: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
 <CAFEAcA8X3Q7s6qZ=ojE9fTLG464rrZw+FX=4hmMOhwR-Q4n2sA@mail.gmail.com>
 <Y2kRWNnk7wDxPnBK@sunil-laptop> <871qqehib4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871qqehib4.fsf@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 07, 2022 at 03:50:44PM +0000, Alex Bennée wrote:
> 
> Sunil V L <sunilvl@ventanamicro.com> writes:
> 
> > On Mon, Nov 07, 2022 at 01:06:38PM +0000, Peter Maydell wrote:
> >> On Mon, 7 Nov 2022 at 13:03, Sunil V L <sunilvl@ventanamicro.com> wrote:
> >> >
> >> > The pflash implementation currently assumes fixed size of the
> >> > backend storage. Due to this, the backend storage file needs to be
> >> > exactly of size 32M. Otherwise, there will be an error like below.
> >> >
> >> > "device requires 33554432 bytes, block backend provides 4194304 bytes"
> >> >
> >> > Fix this issue by using the actual size of the backing store.
> >> >
> >> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> >> > ---
> >> 
> >> Do you really want the flash device size presented to the guest
> >> to be variable depending on what the user passed as a block backend?
> >> I don't think this is how we handle flash devices on other boards...
> >> 
> >
> > Hi Peter,
> >
> > x86 appears to support variable flash but arm doesn't. What is
> > the reason for not supporting variable size flash in arm?
> 
> If I recall from the last time we went around this is was the question
> of what you should pad it with.

Padding is a very good thing from the POV of upgrades. Firmware has shown
a tendancy to change (grow) over time, and the size has an impact of the
guest ABI/live migration state.

To be able to live migrate, or save/restore to/from files, then the machine
firmware size needs to be sufficient to cope with future size changes of
the firmware. The best way to deal with this is to not use the firmware
binaries' minimum compiled size, but instead to pad it upto a higher
boundary.

Enforcing such padding is a decent way to prevent users from inadvertantly
painting themselves into a corner with a very specific firmware binary
size at initial boot.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


