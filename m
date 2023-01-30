Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F67680F5E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:51:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUYd-0000Lo-Pl; Mon, 30 Jan 2023 08:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUWj-0004oJ-1N
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:53 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUWh-0003d8-Ic
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:52 -0500
Received: by mail-pl1-x62f.google.com with SMTP id v23so11678610plo.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohMf18caqqQPgi91C0B3lsVIHsHFjokkBE5D4OLJEvE=;
 b=qjO1UB9Up7j3p20CZBCClrNtzTp6Uz/IKAs8WN68ZDEJVI0jNAf6VHg7POpHyXwLVe
 vayfVdAzCdT4boukRInshHC4oP+eC+2fbM6p6tXGaLitcmH2bilGigwQbwzRbaS6DZGG
 SV5+g/waP3z7nMUiDbp3eoMqO4p1UP/Y75hnydwKX0vxmAxDtaXs9ocqHDf3R1qrpJ3I
 r3LC2dHS+WEY8O+unad4Nc9n0eEv1KLLgfC7nlBn0TvbQprXqARsoKO45FjcHHtuxCHs
 XjPjvra9ps3qM8+loBLJ4JGynQoSTXadX8ztzGg3Vd4n1u7U5etOgt7vv852VULj8UX8
 CfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohMf18caqqQPgi91C0B3lsVIHsHFjokkBE5D4OLJEvE=;
 b=hR+3JOmPz+u7iAbu+GIZz3lSltrgRLIIWgj2VJ1YYQ17t8U/qcu0mvz4ltWZed/VEL
 0x2aZe7oBylvZaHNzExC+vtzzHnxNYXRRF2kQZ7m53NtycStPpsPYVYLircmOFEqOoR7
 qfeaOoq46DkvIxGPTi6b/U8U02txCSvTJ5iqNBLP78FGwZeHg75cjXRUALxopTRiy9Es
 04JZXZGLBk93EfhWb8T734Mzof7XTUSepDnzCG4M3Sbtwut8O00+aaJ6eF3nYGp2jeCT
 EBSdU1qRo6CWQV3L8LT75FPh807Ky84D+2ZKap0kvJ4j9n2FySRtlsCYvE48O4hSMcI0
 SP4g==
X-Gm-Message-State: AO0yUKX0X0zPBuNj0Bz7T1W61f8+Xgv2MN2r6sXpdOW9SW1zejjcQoA8
 2H8b6trMYeWpGyN2yC8rcYQU2g==
X-Google-Smtp-Source: AK7set/7Ap+tJMnWi/yRM6OBUhr0rrSlOgHbOpN5elBf9Q9ZFKLntAjsGrWzIzvFaxzC/0VRDNtCiA==
X-Received: by 2002:a17:903:1d1:b0:196:2ade:6e21 with SMTP id
 e17-20020a17090301d100b001962ade6e21mr24255454plh.14.1675086530147; 
 Mon, 30 Jan 2023 05:48:50 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170902d34d00b0018bc4493005sm7815573plk.269.2023.01.30.05.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 05:48:49 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 27/28] MAINTAINERS: Add Akihiko Odaki as a e1000e reviewer
Date: Mon, 30 Jan 2023 22:47:14 +0900
Message-Id: <20230130134715.76604-28-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130134715.76604-1-akihiko.odaki@daynix.com>
References: <20230130134715.76604-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

I want to know to be notified when there is a new change for e1000e
as e1000e is similar to igb and such a change may also be applicable for
igb.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 08ad1e5341..958915f227 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2208,11 +2208,13 @@ F: docs/specs/rocker.txt
 
 e1000x
 M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
+R: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
 F: hw/net/e1000x*
 
 e1000e
 M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
+R: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
 F: hw/net/e1000e*
 F: tests/qtest/fuzz-e1000e-test.c
-- 
2.39.1


