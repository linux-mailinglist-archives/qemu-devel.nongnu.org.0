Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553C245C9C0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 17:19:24 +0100 (CET)
Received: from localhost ([::1]:52346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpuzT-00055m-6x
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 11:19:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpuvz-0000qZ-DH
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 11:15:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpuvw-0005BX-Mk
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 11:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637770541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HEBd9tPeSkrmDFZmnxzwGHLO3lDi8PwGEiUIk0JryTY=;
 b=LvXCy37ck/6T2/Kp0CErheDoCdzLYQ2XFOq7Z+MRmTuMSvVA4hR4doNh1846FRagF+Pxu2
 DSwlTBDvpNkmOjA+x2KG6+O1Z/nqClFuBw9fMtwR9amjMNq79V+pWW805cuw3V8J2OaEbe
 gHWEH24Y7r3zFnCWOo9IjCY/o8WJkSA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-TRahDRg2N_enfZocGtg7Xw-1; Wed, 24 Nov 2021 11:15:39 -0500
X-MC-Unique: TRahDRg2N_enfZocGtg7Xw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so1554922wmj.7
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 08:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zKk9rybsDYyAL0f6Kx4JEWaAAwRXTdGmRTXhK5JM1MU=;
 b=pcFsZM0QW9QhCNIq5R77qxAMC5Kv7IlplkR3oIoelRp+QLMaHdb86joOeNybLQ0O2A
 1BSO5ysQGNuI22jcPOiTGTj1VQiJ0sAG19EjmmEqzStQYZe9prQc+sLzyLs5tssuHqjq
 j+p+3NA5+DISat0pxnFa6pWhuwLN5Nq/dlryj/Blmci9zQJJwZ793hnwwzhufRTjz0Kz
 lMVJRCpNdWBhTjMG+aDBXyM8CRX89Er38Sk7OJvQnK5a0Vxf4z1vKc9sth61m7qv6OB0
 A9IpNDOEsq62InwjOQb9Ajb1Qv1KMR2ng9OO2vabXf85kjP578VGDImueCT3zgnFPhSx
 D5KA==
X-Gm-Message-State: AOAM533IxKUDrboTz5U+DNbAz/9wcAku3AMu2PLUFWlWmQGMpvhboKOK
 97bY1Zrr4L1gQXuLslUhyza+xSAAiQggGoymQVbEX6iBAbU3o/64tAzkhzumbokRWVtvNc5xL+c
 tTV9EVoTu5Jf3XQe9lvV+yAe3qntGl8FH6dMyAYmHrtoVksMa5Tn2TLK0LqJzDJPP
X-Received: by 2002:a1c:790d:: with SMTP id l13mr17472679wme.101.1637770538346; 
 Wed, 24 Nov 2021 08:15:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw83ZH2SPuTpaAGH06EC7umzV1UpQTM6T0q5c5ad7N/JixyQCfBbjNgV3/oBqhPvzmynfrhXA==
X-Received: by 2002:a1c:790d:: with SMTP id l13mr17472629wme.101.1637770538069; 
 Wed, 24 Nov 2021 08:15:38 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id h15sm6314705wmq.32.2021.11.24.08.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 08:15:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] hw/block/fdc: Fix CVE-2021-20196
Date: Wed, 24 Nov 2021 17:15:33 +0100
Message-Id: <20211124161536.631563-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v3:=0D
- Preliminary extract blk_create_empty_drive()=0D
- qtest checks qtest_check_clang_sanitizer() enabled=0D
- qtest uses null-co:// driver instead of file=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/block/fdc: Extract blk_create_empty_drive()=0D
  hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196=0D
  tests/qtest/fdc-test: Add a regression test for CVE-2021-20196=0D
=0D
 hw/block/fdc.c         | 23 ++++++++++++++++++++---=0D
 tests/qtest/fdc-test.c | 38 ++++++++++++++++++++++++++++++++++++++=0D
 2 files changed, 58 insertions(+), 3 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


