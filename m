Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4EE1773E4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 11:20:33 +0100 (CET)
Received: from localhost ([::1]:44822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j94fA-0002Lg-Ds
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 05:20:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52731)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1j94WP-0008Pj-HH
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:11:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1j94WO-0006Hs-LM
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:11:29 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34362
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1j94WO-0006Hi-Gv
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583230288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j5jE8HWbNPifhZ3dVT2DLxcKSsjBW9hzWjqaz90m43w=;
 b=dACfpmI61g0VJhSlwZzOAv9hdPmMNWFKjURffkgxEu2e00HZ/0T2AQpBazeVqbkkPzdc46
 nssZ46vpaareI5npdmcIlOvC1ScESg/1rvgmhLitHP8mxLQmoEG1vNu+x6JV0uAqM5Z3Yn
 hniTzwEZyHxFZfgoGQ+LChjMmrYXSRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-uycyzTYoNHOsgJCnsY756g-1; Tue, 03 Mar 2020 05:11:26 -0500
X-MC-Unique: uycyzTYoNHOsgJCnsY756g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57300800D4E;
 Tue,  3 Mar 2020 10:11:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6269760C80;
 Tue,  3 Mar 2020 10:11:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D7B3417449; Tue,  3 Mar 2020 11:11:20 +0100 (CET)
Date: Tue, 3 Mar 2020 11:11:20 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: Re: [PATCH 1/3] usb/hcd-xhci: Make dma read/writes hooks pci free
Message-ID: <20200303101120.oid7rb6suiudcsgw@sirius.home.kraxel.org>
References: <1583141724-6229-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1583141724-6229-2-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
In-Reply-To: <1583141724-6229-2-git-send-email-sai.pavan.boddu@xilinx.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Thomas Huth <thuth@redhat.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
 Anthony Liguori <anthony@codemonkey.ws>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> @@ -189,6 +191,7 @@ struct XHCIState {
> =20
>      USBBus bus;
>      MemoryRegion mem;
> +    AddressSpace *as;
>      MemoryRegion mem_cap;
>      MemoryRegion mem_oper;
>      MemoryRegion mem_runtime;

as is not initialized ...

I guess the patch was never tested?

cheers,
  Gerd


