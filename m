Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6B56DFFFA
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 22:35:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmhB2-0004gu-SG; Wed, 12 Apr 2023 16:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pmhB0-0004gO-Ns
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:34:46 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pmhAy-0000Qz-C2
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:34:46 -0400
Received: by mail-ej1-x62f.google.com with SMTP id qb20so31584768ejc.6
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 13:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681331681;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m7PMe08OhJIOkNUgJ0L7DJKWJ8FYyblEEvrpIme5qqw=;
 b=fDTlTm0AdgGmtHHd1qBvHhWCNXyUhip++6ipC05RtItTmrxhNyZgETzAUvnSkklmLq
 WyMj41ki58oQsx/mFDR325hWEG6iww/ErVggy6eJrM+9adCeYhACeRLnBKvN/FwYsEEm
 U6nNqjkC4oB3urNpQE1Z73nqFBVsCRQzv6H6FlBJa4d/DbSFWjZ5AK5tLtkmyBzlGiA+
 qi4yCd04U2J/pH89oGXp0AV+gCWhh1jXhZtfhnUxHGjxMzO+S9nUHCK4I7S+9+JoH+GX
 7huP4rR5CJuNnGDpz2kX1v67NLq0Lp3sPcN+P14DlYHdZJChijWfFuCjP0WRaTx6nFbK
 8n7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681331681;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m7PMe08OhJIOkNUgJ0L7DJKWJ8FYyblEEvrpIme5qqw=;
 b=DrQSbK9bXpXZqgnccS3aSxUl7uMULTckfCHFoXfT9Lvm0DeMU3I6LKb4yHC1nLlbaF
 juA16jYXK0U6clbWZJnC0mZjU8PUZsWtdcpwovahJkZ/uJ2PVCYY9XZS29oitH16FWvc
 pVyDoXBROJ3GcccE2eOrx1iR4RXO0V+Kn6rWzdb36cdeNNbPaCozuHdaj1I+6YuYlmM+
 IEGxZdQtIKJBF9xIBxk6RHomjSm4mVJX9UhnI4+kpUII0J4dcuddfWcxnUBS90zykWDH
 MHqTB6axG8RlG3Q+K+cGBWk2riArtVPCYIUVB6Ggj2XLNHBX9hApOJlPohsLlqpkZWNZ
 xHyQ==
X-Gm-Message-State: AAQBX9dK0MjWvON29A7LyjGfiiaIv4jNTRl49NRLdK7ZmUZ1iZBVTIRk
 McL6LgBG4o3iMHJ6bbmUIv2DVPG04S8=
X-Google-Smtp-Source: AKy350YIuE93c8GUw4KWJGJYZvFcMckNI2TbxKZWP5MAc8rRrjzcU2lPwiCJ8NY+hg0o4/cJP54phQ==
X-Received: by 2002:a17:906:6b82:b0:94a:7fa7:ebb8 with SMTP id
 l2-20020a1709066b8200b0094a7fa7ebb8mr146224ejr.61.1681331681433; 
 Wed, 12 Apr 2023 13:34:41 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-012-055-150.89.12.pool.telefonica.de. [89.12.55.150])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a170906358800b0094a6f908b8bsm4093562ejb.166.2023.04.12.13.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 13:34:40 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/3] SDL2 usability fixes
Date: Wed, 12 Apr 2023 22:34:22 +0200
Message-Id: <20230412203425.32566-1-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

I'm trying to use QEMU on Windows hosts for fun and for profit. While the G=
TK=0D
GUI doesn't seem to support OpenGL under Windows the SDL2 GUI does. Hence I=
=0D
used the SDL2 GUI where I ran into several issues of which three are fixed =
in=0D
this series, which are:=0D
=0D
* Alt+Tab switches tasks on the host rather than in the guest in fullscreen=
 mode=0D
* Alt+F4 closes QEMU rather than a graphical task in the guest=0D
* AltGr keyboard modifier isn't recognized by a Linux guest=0D
=0D
More information about each issue is provided in the patches.=0D
=0D
Bernhard Beschow (3):=0D
  ui/sdl2: Grab Alt+Tab also in fullscreen mode=0D
  ui/sdl2: Grab Alt+F4 also under Windows=0D
  ui/sdl2-input: Fix AltGr modifier on Windows hosts=0D
=0D
 ui/sdl2-input.c | 13 +++++++++++++=0D
 ui/sdl2.c       |  2 ++=0D
 2 files changed, 15 insertions(+)=0D
=0D
-- =0D
2.40.0=0D
=0D

