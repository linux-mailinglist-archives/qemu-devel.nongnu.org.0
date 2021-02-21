Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98357320E4C
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 23:30:42 +0100 (CET)
Received: from localhost ([::1]:40024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDxFR-000209-M0
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 17:30:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxBN-0006Kc-Hi; Sun, 21 Feb 2021 17:26:31 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxBI-0004Ix-Vx; Sun, 21 Feb 2021 17:26:27 -0500
Received: by mail-wr1-x435.google.com with SMTP id l30so1435875wrb.12;
 Sun, 21 Feb 2021 14:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l7kGV8BCSlV/22uKIKSaj5ga01T9HW6SOkPfs1f0tT8=;
 b=qewQNxzl73gtCogP0xSm52S0nm1u/PgocBmaQV4WLIwzXKFHsgpvlz5sfyA8/49H49
 44CWgTlUx8mx6ltTdi3Lz1YywcCwn/LpmVlmy8dmfmQgn/MTCPgh76yCFzTNqsCB9dxx
 lZpRfuA27s6X+1pFxIoheUVVnsNzXbYeg6qkC5TeuZ+1aQBIxJbYtLWvB1DvQ93ERrmA
 w2nwUNn0x58KiLZIdTdjqG3r83+2yH+FeiTcczcgEkjpGd/T1tqp/CMXjj0N3ZCo4skW
 KR1YntGBknG4AJgbHHDj1cPo8T8Uho8n1OaNV3WXUg5V7dNHG8QiJrvzCJuujJewKE2b
 Gk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=l7kGV8BCSlV/22uKIKSaj5ga01T9HW6SOkPfs1f0tT8=;
 b=sS67fx4jQG2IUpqU7suPgkCPy1fos0DBacX9NMg18Mrwjq7t/pODBNvVZmHTmnzaTX
 rFuqxuw2h40QF5vjOFQPeKzpVUnpfiEoKVB80f1wmImez2YOZHzJYMGGEFGrBqfbkxon
 5MLmeBI+myG1wIOk7JwGXN9+a3vWokrlIbAnD5qjuXDTZhUz6WoOTf7f5VtV02DO2S2w
 YHRfszyEsdypCI+JpEp6NPWauJqJR+E0bI7fVXn5UB94EsO5nvkTTIaF2INm7IVj+zS5
 EHPYBWBu2hefHrTmtcCGqvA8P1kWiGieZYRU+r/5oeYzoqXhq+TXxtDg4M5JNLL05uNk
 6l8g==
X-Gm-Message-State: AOAM530/UAXXLB0j4gL88B6aHa5uKvkAg3q3kU3iMeYA+mJPBm6E7gbs
 yIT0gOHkXrkc2B5TXdjkVIwgnHpSaSU=
X-Google-Smtp-Source: ABdhPJz5VyQzjwor1cxFhR/udEiNhjCz9W3EJrgeGTTv6xCoA6fbTbjw4MSWlNahc/dib6/qI5CirA==
X-Received: by 2002:adf:9f54:: with SMTP id f20mr18703165wrg.362.1613946379525; 
 Sun, 21 Feb 2021 14:26:19 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y1sm26297302wrr.41.2021.02.21.14.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 14:26:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] target/arm: Restrict v7A TCG cpus to TCG accel
Date: Sun, 21 Feb 2021 23:26:14 +0100
Message-Id: <20210221222617.2579610-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM requires the target cpu to be at least ARMv8 architecture.=0D
=0D
Restrict the last ARMv7 CPUs (A-profile) to TCG.=0D
=0D
Series almost fully reviewed (missing review is trivial code style).=0D
=0D
Since v1: Only include patches which don't depends on  previous series=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  target/arm: Restrict v8M IDAU to TCG=0D
  target/arm/cpu: Update coding style to make checkpatch.pl happy=0D
  target/arm: Restrict v7A TCG cpus to TCG accel=0D
=0D
 target/arm/cpu.c     | 334 -------------------------------------------=0D
 target/arm/cpu_tcg.c | 322 +++++++++++++++++++++++++++++++++++++++++=0D
 2 files changed, 322 insertions(+), 334 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

