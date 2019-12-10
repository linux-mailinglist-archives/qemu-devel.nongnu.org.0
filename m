Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AF2118EBD
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 18:17:46 +0100 (CET)
Received: from localhost ([::1]:59982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iej8q-0005tY-Iv
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 12:17:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38703)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <abologna@redhat.com>) id 1iej7u-0005I5-HC
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 12:16:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <abologna@redhat.com>) id 1iej7s-0000Np-8z
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 12:16:45 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46040
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <abologna@redhat.com>) id 1iej7s-0000NT-4l
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 12:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575998202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vbeUY1tYvNFELFptAI6NyGsSXcrw+gBajlhVpD0Q4A8=;
 b=BZ+PI0Yve6YUFxGhX3ScR18hMtmJEfV8o4YPydQFhN+r53KDoaxQk/Z1MiZcKOBk5f9ZuD
 TRjvdSUUBKdeq6m/LusBvW8apHsFP/kKqLW2aziARaO4EYlZAyvwn3zBgfoSo7L2WYt6eO
 9js+RRe6tYW6Hhj1rLvrImVHk5SYVas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-m-J_QNgtMqWr3h-gqil5nQ-1; Tue, 10 Dec 2019 12:16:40 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 623BC10054E3;
 Tue, 10 Dec 2019 17:16:39 +0000 (UTC)
Received: from ovpn-205-189.brq.redhat.com (ovpn-205-189.brq.redhat.com
 [10.40.205.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 907081001B03;
 Tue, 10 Dec 2019 17:16:36 +0000 (UTC)
Message-ID: <ca3212971a456fe8bfb15bdd718dce5aa821daf1.camel@redhat.com>
Subject: Re: [PATCH v1 0/5] target/arm/kvm: Provide an option to adjust
 virtual time
From: Andrea Bolognani <abologna@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Date: Tue, 10 Dec 2019 18:16:33 +0100
In-Reply-To: <20191210160825.ioah26u36eu2i3z2@kamzik.brq.redhat.com>
References: <CAFEAcA8j8M_J8Ocdpms8a2XufigVQ6oB4JBy2BcYAkXfJX5y5A@mail.gmail.com>
 <20191206155327.7adiyjjkjh56mg2t@kamzik.brq.redhat.com>
 <596d07e933cb4da48dbba5b492e81a2438e78a2f.camel@redhat.com>
 <CAFEAcA9+G0jprsHRQp8g=Aso+2-_GhoWkDGx4WWxoC88maOKEg@mail.gmail.com>
 <20191210110531.psjzlikir2ep2omo@kamzik.brq.redhat.com>
 <CAFEAcA_M61hTzU=qCiUbR4V9Mnwd0phFNqTJG9pCWKreVmjy6A@mail.gmail.com>
 <20191210133254.22vcpvr3eabcnthe@kamzik.brq.redhat.com>
 <29add42daba074ab5bdbd462b2d377115fec7c3c.camel@redhat.com>
 <20191210143311.4sen6blhfhzop6zw@kamzik.brq.redhat.com>
 <e0f86b200d0b3c08769cdbaa080569c3ec3db3ab.camel@redhat.com>
 <20191210160825.ioah26u36eu2i3z2@kamzik.brq.redhat.com>
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: m-J_QNgtMqWr3h-gqil5nQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>, bijan.mottahedeh@oracle.com,
 Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2019-12-10 at 17:08 +0100, Andrew Jones wrote:
> I don't have a strong enough opinion about kvm-adjvtime vs.
> kvm-no-adjvtime to insist one way or another. I agree double inversions
> are easier to mess up, but I also like the way the '-no-' better
> communicates that the default is [probably] 'yes'.
> 
> All interested parties, please vote. I'll be sending v2 soon and I can
> call this thing anything the majority (or the dominate minority) prefer.

I like kvm-adjvtime better because it avoids the double negative,
but on the other hand if the new default is be to adjust the time
then I don't expect many people will actually need to use the
parameter, so the name doesn't matter that much after all :)

-- 
Andrea Bolognani / Red Hat / Virtualization


