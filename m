Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44736332F9B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:08:01 +0100 (CET)
Received: from localhost ([::1]:47556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJie8-0002Kw-9u
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJh4y-0000U4-L4
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:27:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJh4k-00017g-QS
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:27:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615314437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HkiWR+cyoXL+3QxgB4d5UIT+26hl5aPuRcbIAsUgzew=;
 b=ZhL3bYXXA0lkpWJVnxAeUtCx7KrYiuV8ySz8bsa9/PxDfgpM6/RzMh+pKCszqm4UlYbpss
 DaVqNutkDFKfxpotjY8Dd/b3LPdOxiaGXDEkNpAhPmscs0NdLEvgBYA9Y6RaAWNa2FLm4P
 N14+r6nOkHy9sOWqwwRfCqEPM6gO8ZQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-dlplkOxjMdif6bwXbE37iQ-1; Tue, 09 Mar 2021 13:27:13 -0500
X-MC-Unique: dlplkOxjMdif6bwXbE37iQ-1
Received: by mail-ej1-f69.google.com with SMTP id jo6so6029204ejb.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 10:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RLF51FFC7qM3o+SMPe8txGyZ4Ay15wN/0Wk+wGkbd2s=;
 b=lqQdhS0KYtRO6sByP6Hsi3b9MCYI5rmsbURnbUg1g2kvwwzPCOjE/PeTZ22pahBy5E
 YU1rsELCgbsUyU7l3Ca+pRTjMFG7kV5EycfCunSXMJACcG+0WVUmShln7cVfwyKB4Spq
 sDPj/ZlFmux5/pEErFCmPdDwNEnrJLJbkfGClTl9YBfxpRHU43+qTQzAtmR9/g4LbOhr
 tsf3nC8gV3bTiEL//AENd/txGD8VJb77G1upkpAS/RX/wZh6LPSQabubYFCiEYYK/uiG
 hbiNP1olGZMEzz+7LWRzW6eaOV2cgpr02L/ys0TmvVDeCzNj9tdb3PyDJUAfIPabcQ2L
 Zppw==
X-Gm-Message-State: AOAM531mFtFfg9KE2UAqvlMSaP8NYW3gXhthJ7KKBF9q+Ebpkr1y0k+g
 DMcvSIhkD4jL08b1QTl98u3PTyU1jO/qAl0UKLZqLqPVvc2bZXVoar+TyYyg3EtfqT5say7iYwz
 0pC9mQaDSomcKFQkaLiAxQXQC/HbAhCKnR1/4InXDArYM++ULbQNxIFqdQl8lKDqi
X-Received: by 2002:a17:906:f8d5:: with SMTP id
 lh21mr21673459ejb.64.1615314432378; 
 Tue, 09 Mar 2021 10:27:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYhNph6o44XdUaszL05pI+YotaWAAXvnl8ANwB0u/0We7U5IKGuX4X7BMIsn4E5TxtTia+ug==
X-Received: by 2002:a17:906:f8d5:: with SMTP id
 lh21mr21673432ejb.64.1615314432150; 
 Tue, 09 Mar 2021 10:27:12 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m7sm9425080edp.81.2021.03.09.10.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 10:27:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/6] net/eth: Fix stack-buffer-overflow in
 _eth_get_rss_ex_dst_addr()
Date: Tue,  9 Mar 2021 19:27:03 +0100
Message-Id: <20210309182709.810955-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I had a look at the patch from Miroslav trying to silence a=0D
compiler warning which in fact is a nasty bug. Here is a fix.=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg772735.html=0D
=0D
Since v3:=0D
- reworked in multiple trivial patches (Stefano)=0D
- reset R-b/A-b tags=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  net/eth: Simplify _eth_get_rss_ex_dst_addr()=0D
  net/eth: Better describe _eth_get_rss_ex_dst_addr's offset argument=0D
  net/eth: Initialize input_size variable earlier=0D
  net/eth: Check rt_hdr size before casting to ip6_ext_hdr=0D
  net/eth: Remove now useless size check=0D
  net/eth: Return earlier in _eth_get_rss_ex_dst_addr()=0D
=0D
 net/eth.c                      | 42 +++++++++++++--------------=0D
 tests/qtest/fuzz-e1000e-test.c | 53 ++++++++++++++++++++++++++++++++++=0D
 MAINTAINERS                    |  1 +=0D
 tests/qtest/meson.build        |  1 +=0D
 4 files changed, 75 insertions(+), 22 deletions(-)=0D
 create mode 100644 tests/qtest/fuzz-e1000e-test.c=0D
=0D
--=20=0D
2.26.2=0D
=0D


