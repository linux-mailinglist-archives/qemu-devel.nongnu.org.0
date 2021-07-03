Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDAB3BA91E
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 17:04:16 +0200 (CEST)
Received: from localhost ([::1]:49324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzhBn-0002OY-4C
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 11:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzhA1-0000I4-UA
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 11:02:26 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzhA0-0002Zs-DZ
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 11:02:25 -0400
Received: by mail-wr1-x436.google.com with SMTP id v5so16230500wrt.3
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 08:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kfLsKH39FG58ZYp21DZfJGefUVgN/UTfSlcfjTwROVI=;
 b=JbYoB1ezYLkrUE6vXh/DYn6GE6X+uobFir6WNumo2nCe18Igen8iOaUb2rtXfz5clI
 5TG9YChB8LCzCQNJJLQqogjTTG9nkUZz+lZu4uhE6TJu8OQR+mPoTSHeKSTyevRli6ol
 ChUvejmZAJt2NrAwyP3aDC5rMSL03cs3SJZqjskD1JNw/7dGJ58YgLOAQFqj/twDFfrU
 KZF5jDO2E7BjsnfiZ4DxUQbnIvqxOmasRP3NwIpW+6SxUoQqy/XUHBOvpWPUJ4hXv3Kp
 g8TgOMtoJqNkMBazM1QwHVls4nRoSv0z5hLpBrls9LLAElkHmBoGnm5wpYXr1qteGJ2V
 lECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=kfLsKH39FG58ZYp21DZfJGefUVgN/UTfSlcfjTwROVI=;
 b=G99cUqyEqHzF8cQlOx+rJL/2QNs4JpLjvPKyYQxbr1qG4Vls98DtOyKA8NU9cIEZ93
 knwKJZmLSApsgLs7JTjJBMh80vp1DNHBdBxZcLXWPLxZW3QpaN5RpWXazHe8cYk/EQXE
 /QUuIqJCbeNmGT5M58rEEJ8ra0DB80vgo0p4dqMzlKmlbJJ+cqto8x3ezgAWd9Lue/5j
 gkm7HjKPX+Tr3StAmTPQePr/HGoVq3TUQRpflQmKID+B3WXkD03aE4H6BSO1KTlhhLpa
 IoFPd74WOzCL7a2RdOz4akf5Miy8Y2GtUOzY0Ek9ACrXFBSqL7sszfsXPJCX4B+an6XI
 XGHA==
X-Gm-Message-State: AOAM533GfhLqjWha2VaXKq86QL9P7CIn/kBKPaPiX2d5ExCFdHPsVXA+
 m8MtJ1fHqhQ8MAbs54DZSJ9pI/D0ryS1jg==
X-Google-Smtp-Source: ABdhPJyiKpsmRLZoQmCwfwg4wSoN/eA4+SCGHNd9euo05dL42kBXXNJi8kl0Zzhebds1HKXdOZOpQg==
X-Received: by 2002:a05:6000:1a43:: with SMTP id
 t3mr5760230wry.112.1625324541783; 
 Sat, 03 Jul 2021 08:02:21 -0700 (PDT)
Received: from x1w.. (184.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.184])
 by smtp.gmail.com with ESMTPSA id z3sm8228553wrv.45.2021.07.03.08.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 08:02:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/3] dp8393x: Reviewing CRC code
Date: Sat,  3 Jul 2021 17:02:16 +0200
Message-Id: <20210703150219.364582-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mark, few more patches while reviewing.=0D
=0D
Again, not tested (yet)... Simply compiled.=0D
=0D
Please tell me what you think of them.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  dp8393x: Store CRC using address_space_stl_le()=0D
  dp8393x: Do not amend CRC if it is inhibited (CRCI bit set)=0D
  dp8393x: Store CRC using device configured endianess=0D
=0D
 hw/net/dp8393x.c | 26 ++++++++++++++++++--------=0D
 1 file changed, 18 insertions(+), 8 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

