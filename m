Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558FC194EBD
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 03:11:15 +0100 (CET)
Received: from localhost ([::1]:36174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHeSo-0008ND-DC
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 22:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47192)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1jHeRp-0007le-HC
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 22:10:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1jHeRo-0003nO-GL
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 22:10:13 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:47131)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1jHeRo-0003mt-CQ
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 22:10:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585275012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jTS/A/r8FwJx0pyyRMmMuWCyUhQ3Ag9+MhFwgoRZJk4=;
 b=KHattziT+8DHj4W3gxpzTil7EO/szwVw8AmH+2QlJpSHyQIz2jqwhr64Hr8Ylx0Gu061K5
 gSr030/Lj0UdAQdHB9LijItqrjfOitesNWPshhd6yoS+gGSrXFKZwCJvF2NybWOkRhKtSB
 4Wx4kgc0mlQB3f23b0l+sPX6fqjBwNM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-qiIe98uSNde8W6AbwvDoAQ-1; Thu, 26 Mar 2020 22:10:10 -0400
X-MC-Unique: qiIe98uSNde8W6AbwvDoAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1F67107ACC7;
 Fri, 27 Mar 2020 02:10:08 +0000 (UTC)
Received: from [10.72.13.132] (ovpn-13-132.pek2.redhat.com [10.72.13.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F8FE60304;
 Fri, 27 Mar 2020 02:10:06 +0000 (UTC)
Subject: Re: [PATCH] hw/net/i82596.c: Avoid reading off end of buffer in
 i82596_receive()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200312201638.6375-1-peter.maydell@linaro.org>
 <a550ff78-f639-4048-ba2b-20cea1915d83@redhat.com>
 <CAFEAcA8GMPAgxJrHwJZDWOmCWRnTPxb7+9UoAJqZAMpnWxXu=g@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <db0dc4bf-fbdb-a4e8-ec01-d6b6a7a261a9@redhat.com>
Date: Fri, 27 Mar 2020 10:10:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8GMPAgxJrHwJZDWOmCWRnTPxb7+9UoAJqZAMpnWxXu=g@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Helge Deller <deller@gmx.de>, QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/3/27 =E4=B8=8A=E5=8D=885:11, Peter Maydell wrote:
> On Tue, 17 Mar 2020 at 06:13, Jason Wang <jasowang@redhat.com> wrote:
>> On 2020/3/13 =E4=B8=8A=E5=8D=884:16, Peter Maydell wrote:
>>> The i82596_receive() function attempts to pass the guest a buffer
>>> which is effectively the concatenation of the data it is passed and a
>>> 4 byte CRC value.  However, rather than implementing this as "write
>>> the data; then write the CRC" it instead bumps the length value of
>>> the data by 4, and writes 4 extra bytes from beyond the end of the
>>> buffer, which it then overwrites with the CRC.  It also assumed that
>>> we could always fit all four bytes of the CRC into the final receive
>>> buffer, which might not be true if the CRC needs to be split over two
>>> receive buffers.
>> Applied.
> Hi Jason -- this doesn't seem to have reached master yet.
> Has it gotten lost somewhere along the line?
>
> thanks
> -- PMM


Nope, it's in my queue.

I will send a pull request shortly.

Thanks


