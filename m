Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6466DC8BC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 17:48:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pltjf-0005bQ-DN; Mon, 10 Apr 2023 11:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <timothee.cocault@gmail.com>)
 id 1pltIf-00043s-VE
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 11:19:21 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <timothee.cocault@gmail.com>)
 id 1pltId-00065z-RC
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 11:19:21 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 d8-20020a05600c3ac800b003ee6e324b19so2792894wms.1
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 08:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681139957;
 h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=UDtyZGLw2WV72TEM/0FWDDnFxiGCyvQmNANFQu62Hrs=;
 b=D92x1E/atbbNZwBO+l6CGBThO+Ay7hOR/FO3g8R0Y29v62Gp/nuZHZQG3NPc+4UJc2
 Rx7Ru4QSZigl6yAUZEFvN791U1Mxc01AXhD3tfpmbcR6b5t2QTtVTI4I4EnZyABGZijt
 f8Hwm9HcGeYOQLvWkK7ALaXIWOMDYaghkBCqSRhc3T1FwA5G3hFmVtNaQT4gx7goyZOa
 1zFMquTLQH4VUqfc3opRYFxGxBaXmFUiLqno888VWl6klOWBHTxoYCKtciKnjUqsNPuR
 WzyWPnTgwcpfbuyR/PUNU6TiLWUbi5cdotkNeMQekuIH7h+Xee+haTpo+RHdQVxxBaFx
 wayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681139957;
 h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
 :subject:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UDtyZGLw2WV72TEM/0FWDDnFxiGCyvQmNANFQu62Hrs=;
 b=jI0XGxd+YEMJWj1VaYiryn1uxyypMxNrWXNjcv+UDJ6I5gs55WW149kb1bDU4aylTM
 tNz/zY/5Ln1dPTRc8KSpsfvGS1TkDt++CsZpZJKvY0ZCogaYN7YBBsrMVNni3j4uMBlj
 egUhI24Yl78NorbgRLLBIJFSM4bMfbUmD1wOI4bw6nV2aLyk2OLxQUdYdYX0jk6FGPPd
 bxkK6flTwNYIXAUv9I4UlwDxdc9ze93hvhJrSqC3+RUSs2/QATJmmbOvhVlwOYYKJv4U
 3ObwVDpep2cDoDHbAIvwsC0H9RI/cAzfm2TxPfSgSlPH/ztDbDuSQB7tXcnHq6SDgtSv
 8lpA==
X-Gm-Message-State: AAQBX9d7m9GhtzvUW0VK+2kJ7ZNTeAneP+FLNVoYACNs42NxH7416tLW
 8EcQEKTGdQfj3XOlfTyn0TeDcdUw6OR0dg==
X-Google-Smtp-Source: AKy350ZPio29ncXRDcwUKAPbkw5VIKSZSHglZYKnODzGrELmJOlZ2l389JsUlpkUgePNL3RRvhPNbw==
X-Received: by 2002:a7b:c006:0:b0:3f0:7db5:6078 with SMTP id
 c6-20020a7bc006000000b003f07db56078mr7290850wmb.27.1681139957177; 
 Mon, 10 Apr 2023 08:19:17 -0700 (PDT)
Received: from ?IPv6:2a01:cb08:8115:9e00:c5ce:940f:107a:4ac7?
 (2a01cb0881159e00c5ce940f107a4ac7.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8115:9e00:c5ce:940f:107a:4ac7])
 by smtp.gmail.com with ESMTPSA id
 22-20020a05600c021600b003dc522dd25esm14059994wmi.30.2023.04.10.08.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 08:19:16 -0700 (PDT)
Message-ID: <366bbcafdb6e0373f0deb105153768a8c0bded87.camel@gmail.com>
Subject: [PATCH 0/1] e1000e: Fix tx/rx counters
From: timothee.cocault@gmail.com
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Mon, 10 Apr 2023 17:24:57 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=timothee.cocault@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 10 Apr 2023 11:47:14 -0400
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

This commit fixes a bug in the stats registers of the e1000* devices
reporting higher bandwidth usage.

I'm adding a bit of context for affected Googlers:

The e1000e is the default NIC used by libvirt for Windows VMs.
This bug creates huge slowdowns on BITS transfers (used for
Windows Update for example).
The task manager shows high usage of bandwidth (>2Gbps inbound),
and thus the BITS client throttles the speed (<1kbps).

A temporary fix is to switch to the rtl8139 device.

Timoth=C3=A9e Cocault (1):
=C2=A0 e1000e: Fix tx/rx counters

=C2=A0hw/net/e1000.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 ++=
---
=C2=A0hw/net/e1000e_core.c=C2=A0=C2=A0 | 5 ++---
=C2=A0hw/net/e1000x_common.c | 5 ++---
=C2=A0hw/net/igb_core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 ++---
=C2=A04 files changed, 8 insertions(+), 12 deletions(-)



