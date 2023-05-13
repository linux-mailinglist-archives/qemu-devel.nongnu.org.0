Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9D4701609
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 12:11:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxmC7-0008LT-Q6; Sat, 13 May 2023 06:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pxmBv-0008Fm-8v; Sat, 13 May 2023 06:09:32 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pxmBs-0004MZ-3Z; Sat, 13 May 2023 06:09:29 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50bc2feb320so16639207a12.3; 
 Sat, 13 May 2023 03:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683972562; x=1686564562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kB0fhfl32qFVI6ft2jTJEJ33AnlefeZ8d6wvh4tFsS4=;
 b=gMyfBkGzHLohjZUtqXgRhPI/VYZ59HMfUs3qT3sZA5V8mm5KuPCCfGxb9gDuD4eV+e
 MDV21RxKkDaMM6G1Hn8VJkpOJEdy4jtfm1PdtwpLndiEWxG7TgTi4k6caZbBToz+NgAX
 HDJe5zLY3w/Vw8DrMdU1CBHARA1O417kBeHjPzxFUdjrD+lvfH/j0wQFh94LQeZvF1vh
 xCnZrXGkKhfhNmOw3jtNnsr+IXfITUBikqCfyBYa3+pqcN4I+p/x+wMZaMkAY5YDW2/p
 hy1wZ//L6cHJBZGhHI9V+ud2afIuwWianGkdq+iVVP03Z7KzECNQDI2dJLqhdEV4yWVl
 TEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683972562; x=1686564562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kB0fhfl32qFVI6ft2jTJEJ33AnlefeZ8d6wvh4tFsS4=;
 b=PXVjHG32OtSrUQoxxYjm5h0dphFspZy08eY0EoCQhe3Mwd+ViVy6oqkOUpLluQKX8U
 wfw8ccRywc4wGuOgRClvw+Mduw6vq4hCwxxApcz7eK2CroJoQ4/1BLif2VZBp5TO9Cl1
 H7G8fSGgczqKu3LvQEu5bVuE9WQWpmE9TRZwpzp1P2SVMQBtbrJUNB+7okXtDZU/Fw5y
 EAiGTVWQpvKl9rewL94cb2seUArhkp2gdJ3/Cxfgs3tt7SK/fBYGUdpk/BwRppoRBOFb
 Gd5SbyFNZVLKEu94jzOOeg5iiYpBuGTehfMt5gJNElM1QbDaCgP6xCV2B8KW+V9v2PCk
 HXgw==
X-Gm-Message-State: AC+VfDzjT1ihwds9uITJOuoQmrX0LUixumhcYmd4+mg3+lWHOA6qxTIx
 pXtetZQWJD3j/KLkGIqUIrd3XiXR8Tg=
X-Google-Smtp-Source: ACHHUZ5c/4+dNr3Dhlq7CRk+DjNdi0p/ylgRv6bf0KsMAokoVBldNiUiZPxnV9DGV+OvyBz1nsYKag==
X-Received: by 2002:a17:907:9703:b0:966:265d:edc9 with SMTP id
 jg3-20020a170907970300b00966265dedc9mr22940134ejc.74.1683972561935; 
 Sat, 13 May 2023 03:09:21 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-013-174-037.77.13.pool.telefonica.de. [77.13.174.37])
 by smtp.gmail.com with ESMTPSA id
 jr18-20020a170906515200b00965f5d778e3sm6645285ejc.120.2023.05.13.03.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 May 2023 03:09:21 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/4] Trivial cleanups
Date: Sat, 13 May 2023 12:09:02 +0200
Message-Id: <20230513100906.46672-1-shentey@gmail.com>
X-Mailer: git-send-email 2.40.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This series:=0D
* Removes dead code from omap_uart and i82378=0D
* Resolves redundant code in the i8254 timer devices=0D
* Replaces string literals by macro usage for TYPE_ISA_PARALLEL devices=0D
=0D
Bernhard Beschow (4):=0D
  hw/timer/i8254_common: Share "iobase" property via base class=0D
  hw/arm/omap: Remove unused omap_uart_attach()=0D
  hw/char/parallel: Export TYPE_ISA_PARALLEL macro=0D
  hw/isa/i82378: Remove unused "io" attribute=0D
=0D
 include/hw/arm/omap.h      | 1 -=0D
 include/hw/char/parallel.h | 2 ++=0D
 hw/char/omap_uart.c        | 9 ---------=0D
 hw/char/parallel-isa.c     | 2 +-=0D
 hw/char/parallel.c         | 1 -=0D
 hw/i386/kvm/i8254.c        | 1 -=0D
 hw/isa/i82378.c            | 1 -=0D
 hw/isa/isa-superio.c       | 3 ++-=0D
 hw/timer/i8254.c           | 6 ------=0D
 hw/timer/i8254_common.c    | 6 ++++++=0D
 10 files changed, 11 insertions(+), 21 deletions(-)=0D
=0D
-- =0D
2.40.1=0D
=0D

