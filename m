Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8AFE329D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 14:43:00 +0200 (CEST)
Received: from localhost ([::1]:41308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNcSB-0001qW-5k
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 08:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46225)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iNcAr-0006d6-82
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 08:25:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iNcAp-0007Xb-Vo
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 08:25:05 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28280
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iNcAp-0007X3-Rj
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 08:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571919903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZAMN4B//LhIiWLht7TffCNiSr4z5k4zs0lJpc0SH8Y=;
 b=SFX542rCLjHnH0S/yLqvSYbm9QcPuczzA0io4k5RRZuypHY6s/ggO1ZMwtISi9NdNVLBKc
 bx/XSm3xwamf1RVBWWKoiXBNYThqYutcypkrtf3DrnQxDsQ1yCVeM1RCyhEQx8NlInFkvL
 2ZOgNYUrCys9N85Jx1zKvFZis8T0hB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-YyzGlylgMbuk-SoRy92QFg-1; Thu, 24 Oct 2019 08:24:59 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D512B1005500;
 Thu, 24 Oct 2019 12:24:58 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-184.brq.redhat.com [10.40.204.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23C66605A6;
 Thu, 24 Oct 2019 12:24:45 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] mc146818rtc: fix timer interrupt reinjection
Date: Thu, 24 Oct 2019 14:24:25 +0200
Message-Id: <20191024122425.2483-4-philmd@redhat.com>
In-Reply-To: <20191024122425.2483-1-philmd@redhat.com>
References: <20191024122425.2483-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: YyzGlylgMbuk-SoRy92QFg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Xiao Guangrong <guangrong.xiao@gmail.com>,
 Vadim Rozenfeld <vrozenfe@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marcelo Tosatti <mtosatti@redhat.com>

commit 369b41359af46bded5799c9ef8be2b641d92e043 broke timer interrupt
reinjection when there is no period change by the guest.

In that case, old_period is 0, which ends up zeroing irq_coalesced
(counter of reinjected interrupts).

The consequence is Windows 7 is unable to synchronize time via NTP.
Easily reproducible by playing a fullscreen video with cirrus and VNC.

Fix by not updating s->irq_coalesced when old_period is 0.

Signed-off-by: Marcelo Tosatti <mtosatti@redhat.com>
Message-Id: <20191010123008.GA19158@amt.cnet>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/mc146818rtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/mc146818rtc.c b/hw/timer/mc146818rtc.c
index 8da7fd1a50..adbc3b9d57 100644
--- a/hw/timer/mc146818rtc.c
+++ b/hw/timer/mc146818rtc.c
@@ -224,7 +224,6 @@ periodic_timer_update(RTCState *s, int64_t current_time=
, uint32_t old_period)
         last_periodic_clock =3D next_periodic_clock - old_period;
         lost_clock =3D cur_clock - last_periodic_clock;
         assert(lost_clock >=3D 0);
-        }
=20
         /*
          * s->irq_coalesced can change for two reasons:
@@ -261,6 +260,7 @@ periodic_timer_update(RTCState *s, int64_t current_time=
, uint32_t old_period)
              */
             lost_clock =3D MIN(lost_clock, period);
         }
+    }
=20
     assert(lost_clock >=3D 0 && lost_clock <=3D period);
=20
--=20
2.21.0


