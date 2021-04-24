Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5201536A381
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 00:43:05 +0200 (CEST)
Received: from localhost ([::1]:37020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laQzQ-0003HP-D7
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 18:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laQxk-0002Hz-S7
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 18:41:21 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laQxf-0001HP-Eh
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 18:41:16 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 y5-20020a05600c3645b0290132b13aaa3bso3082859wmq.1
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 15:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g3HbVg8LKce141TaodhTe1f1mO+EXNSD2W1CLnN8Fgs=;
 b=F9pZOAV9XoNKfd0OiBIdcvHpDs8DQRZybTBKZ9wrfL5Epg5ZdadDqYVsW7NzV2PMCY
 04tnXUz41pbQ23e5FlxoDCTS2UIEgtpT8D73bpbjSsYxhuxDZBdYSL4DPPERka+ysAZw
 5ST61+DMoHt71kASrXMe/R0MIJCTLaFRClSVZfre2P+33+GHwFOenXgdS3whdjed+q3A
 rN6YzE8t97iKS7CtgIXfJ0LMuQjWVpIfo6jOUah2nbHKV0NpVUX3AJ46jrbjAjV1nQez
 6QjetaiGkjoDB9uyEb7W9V2LhLajLXcdTllfJ8C19wc2VDBl//4JsklanCyAz1Ocu9IW
 kprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=g3HbVg8LKce141TaodhTe1f1mO+EXNSD2W1CLnN8Fgs=;
 b=sLDr27Kc0tHdOu4v/549E5BgCPheZUnI1+alqiIdTww2JHZ2dKzM6N784CXjyjNW1h
 C8nPkj/tjqNew9gr3WtYcQgdjJMwH2oT1J0ooxCGBeIraJVPARSoOMMSUMYQiayMw7Ap
 I7jmxBMw9oPISxaIrv5rO7TmatARNCQ3yzAIWbOt+UgMX8P98wJua/wgcFY4YeSXiTG9
 UPWzv8B22WGJhDAGZqekME//zJFJHpa3vgFyghmxg+LCy0FhLCHHPFfd1bHVQek/IlK9
 zsTdXqHPomO1WSsQdsDFbe5s6NQTt4UHFHIH036lelfbSIC6A9IELFxE+aVRCtSZ/MUq
 phaw==
X-Gm-Message-State: AOAM531NKp+aN+Wozx1I8KCHNQxGTsvO/3Lj4HxSAXP6/r/2WBilcDlF
 Wj9iW7ozZLwHE0hiSAivSx9FgL3n/NIj8g==
X-Google-Smtp-Source: ABdhPJyZkspYHX598SFcTWrlM0Q0TU+YKcKn2lwVncnHogey3QFhyOuamehW29bANSMMDTdUp4vmvg==
X-Received: by 2002:a7b:cc9a:: with SMTP id p26mr4834585wma.39.1619304073380; 
 Sat, 24 Apr 2021 15:41:13 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p13sm15997592wrt.0.2021.04.24.15.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 15:41:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/usb: Do not build USB subsystem if not required
Date: Sun, 25 Apr 2021 00:41:08 +0200
Message-Id: <20210424224110.3442424-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not all targets use USB: allow the build system to not=0D
build it if not selected.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/usb/host-stub: Remove unused header=0D
  hw/usb: Do not build USB subsystem if not required=0D
=0D
 hw/usb/host-stub.c   |  1 -=0D
 stubs/usb-dev-stub.c | 25 +++++++++++++++++++++++++=0D
 MAINTAINERS          |  1 +=0D
 hw/usb/meson.build   |  9 +++------=0D
 stubs/meson.build    |  1 +=0D
 5 files changed, 30 insertions(+), 7 deletions(-)=0D
 create mode 100644 stubs/usb-dev-stub.c=0D
=0D
-- =0D
2.26.3=0D
=0D

