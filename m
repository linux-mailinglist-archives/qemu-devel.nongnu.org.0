Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BB55FEE8E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 15:25:38 +0200 (CEST)
Received: from localhost ([::1]:33436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojKgz-0002sX-5f
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 09:25:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ojKbv-0004Pm-9C
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 09:20:23 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:46137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ojKbr-0005Rm-2D
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 09:20:21 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MKKpV-1oQqoh1JOx-00LosY; Fri, 14 Oct 2022 15:20:08 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Brivio <sbrivio@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 0/2] virtio-net: re-arm/re-schedule when tx_burst stops
 virtio_net_flush_tx()
Date: Fri, 14 Oct 2022 15:20:02 +0200
Message-Id: <20221014132004.114602-1-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9bn25N/2O+dq+awRHoklH1BlR78cEzc7kbVThzBZ9Lwdw+w1GA2
 HwAfxFE9xoMpAXWCeAus8UQlQx6JW4K3CuojPko1xF8sAxmUVBneuyTYqbTZlsUKdtR/poL
 OfjHPypdOFx+1i7GG48qTQObwtmlPUI9TjyLTm4DPK2jyFb+UlZBc0MV/Q/EUfreQ/5ddnN
 bqeVyRhtsrd3jmGdO5HUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RuEgLHEqcO0=:31z711VCfUtqTEb7015Mop
 +qCtHQ4YUMySN0wbwbZ3y1UOU+9RQ/l7UPDvUUOLrwIjOW29HUKT6oqzD5Q9HFblFzbcorrwQ
 F4K3+l7V1G36nXRt0UIM4curiYaeRX/gwo+Qm+WZ33Ox0Y6OED7RL1mDYBuq2qa6iORjcoqMR
 1U9ONFnr11JFyEGtBpZSW4AGJgkpbe3op8dRPznMuEWVpsl0Lk6lHXz632MywK+gk6WT198Qh
 ff55yf0HJLNbIONbzxQpYvzuRbVvRUR6NRYc5GVrlZy1nrMw6I4rSC0jvrsbhDWlGFAouRBFg
 Ton5AtK3PYPXYd5gr32cOmYdYhq8oRPjJahBUazHUjvQ9+wOPaVUoxE5JkvJf1WQDLoB6v+bO
 m4T5Ow8XLm3h31i8ZyfcEneIt7soc4XvlSAV4KMqXQ3UNRbud24xzCQfc5DF4/CyR2SEfrVeO
 JPZXgJBZJFmOh7ChSgGxH0lsGdbJBlOGh1pbKMKW1pgsnuRH0hYOXpNH5F3lV6MfHZPgFMhdJ
 JUBSr5ex33Qyw4E8Pdq6ERyUhCtkdtbk4nNuX3rm7iUyXWfhW8dL+xawjJ7SI0DA9XjnkDX5y
 KOfis5oOJfAfswJ9gurVWdzVaM1MxZtHI6zQdjEgbsjYJ6pgnfOg3LYsF85+KfCutARc8ND5e
 uN2NIb4OTh3khSz4QFqW1P1CcU3xN44P5RkALy/ikr2n0k3U4BVG3tbkTanMEKxYR4cSQk3d7
 kS90YeFxwV2ul1dKPMBs/LYzAHDcQgaBLZhfTqgNxZXZ0AqULE8ZAMvDqlFkf1M5sOcYR06Sk
 ZKCLsrf
Received-SPF: permerror client-ip=212.227.17.13;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_FAIL=0.001, SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When virtio_net_flush_tx() reaches the tx_burst value all the queue is=0D
not flushed and nothing restart the timer or the bottom half function.=0D
=0D
For BH, this is only missing in the virtio_net_tx_complete() function.=0D
For the timer, the same fix is needed in virtio_net_tx_complete() but=0D
it must be also managed in the TX timer function.=0D
=0D
v2:=0D
- fix also tx timer=0D
=0D
Laurent Vivier (2):=0D
  virtio-net: fix bottom-half packet TX on asynchronous completion=0D
  virtio-net: fix TX timer with tx_burst=0D
=0D
 hw/net/virtio-net.c | 68 +++++++++++++++++++++++++++++++++++++--------=0D
 1 file changed, 56 insertions(+), 12 deletions(-)=0D
=0D
-- =0D
2.37.3=0D
=0D

