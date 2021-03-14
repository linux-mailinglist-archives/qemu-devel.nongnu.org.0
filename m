Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660D233A8C7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:30:50 +0100 (CET)
Received: from localhost ([::1]:44388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLaC9-0000M2-AS
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaAh-0007LS-MB
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:29:19 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaAg-0003Pn-5i
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:29:19 -0400
Received: by mail-wm1-x32d.google.com with SMTP id g8so7102507wmd.4
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 16:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y0RlC6wF83trTLyoWgNg2tBlRL4CZ0UJJpbjwlf+mTY=;
 b=mmtnYUqKp5cO4ll5It8AWB67he109XscpQ+tHNcJUDY0y+55Wn52X2/otdjTAPjXbF
 LHOESkBci9UHCzSgh0KiDZExL3fW6mS7jEpOf06mrKi/FHaMKw/VMPodpk2wLltGqah6
 YYlUhEcCgy6rNB0DjLbVoR4fA61z38mAl8hv+QlPjUPUvjsC4ShNFZfXa9WuVdSadu4D
 1g48KlEf+OGRCG4wzykk0X6vODkjgokstnAI2bGmHBoH+8h9tE3x5urpYbJ4Jc8tUsfq
 7DY5zhUJAHvHH1j8q3J/t8ywlq50dD+Fcqr22+R6E5jV0iKh2J2ikcXKqU620Jr6JZvG
 p4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=y0RlC6wF83trTLyoWgNg2tBlRL4CZ0UJJpbjwlf+mTY=;
 b=GQsoT0rIkmyiLlJGvGaeG+nt8RvHy0qyfcA7HHXPKdZpptmAq0XkIwhyS5IqbqXtKt
 oqAgI2V5TuiEPQyIbtNG+pfepzcUmSqKWOez8XbL7lxgCbJ/sRM0ygX/kIP40CjiobGT
 5u6IeNxNqRTSYvgQYF/sNepLSSH8uJS+yPEzn5Vd/tLNPpAyLu+Y/OyO78nxQMyIEve8
 bE+KIO4pSC3jYlYs1tl0fnFljulhPTFsUJOmQwjRDRNj5Iupx7ph/Tg9so9ilkEYdDqH
 eeMUPDsE+lMBbcgiK4fo/CSvYZ6CXLO6YbCjSsX1vk+c7mcN+DA4T7a6OQv0K0/tdBoQ
 GCQQ==
X-Gm-Message-State: AOAM532nTD0ComkQjgx4EkQOwRX8xe54DwRneLyty9ejaFLyzYsPL+hD
 wCOObvlbR48C579GzlWX13sZBUpNO4LmHA==
X-Google-Smtp-Source: ABdhPJzWRlwgADtfgLwkQL7L6qxqE5Q3HS4Lzt0MTGrAe/FdGckqUIEuApdzq+Np4zhRXCD8WYibpA==
X-Received: by 2002:a1c:5455:: with SMTP id p21mr23348015wmi.138.1615764556477; 
 Sun, 14 Mar 2021 16:29:16 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id t8sm16386834wrr.10.2021.03.14.16.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 16:29:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/8] softmmu: Restrict CPU I/O instructions
Date: Mon, 15 Mar 2021 00:29:05 +0100
Message-Id: <20210314232913.2607360-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An attempt to restrict CPU I/O instructions to targets=0D
where it makes sense. If it does, I'll send the next=0D
series which restrict the I/O address space to X86/AVR.=0D
=0D
Based-on: <20210314225308.2582284-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  softmmu/physmem: Rename io_mem_unassigned -> unassigned_mr=0D
  exec: Extract CPU I/O instructions to "cpu-io.h"=0D
  target: Introduce TARGET_HAS_IOPORT=0D
  qtest/fuzz: Restrict CPU I/O instructions=0D
  qtest/libqos: Restrict CPU I/O instructions=0D
  qtest: Restrict CPU I/O instructions=0D
  monitor: Restrict CPU I/O instructions=0D
  softmmu: Restrict CPU I/O instructions=0D
=0D
 default-configs/targets/avr-softmmu.mak    |  1 +=0D
 default-configs/targets/i386-softmmu.mak   |  1 +=0D
 default-configs/targets/x86_64-softmmu.mak |  1 +=0D
 include/exec/cpu-io.h                      | 30 ++++++++=0D
 include/exec/ioport.h                      |  7 --=0D
 tests/qtest/libqos/fw_cfg.h                |  3 +=0D
 hw/i386/xen/xen-hvm.c                      |  1 +=0D
 monitor/misc.c                             |  6 +-=0D
 softmmu/cpu-io.c                           | 88 ++++++++++++++++++++++=0D
 softmmu/ioport.c                           | 60 ---------------=0D
 softmmu/physmem.c                          | 12 +--=0D
 softmmu/qtest.c                            | 11 ++-=0D
 tests/qtest/fuzz/generic_fuzz.c            | 16 ++--=0D
 tests/qtest/fuzz/qtest_wrappers.c          |  7 +-=0D
 tests/qtest/libqos/fw_cfg.c                |  2 +=0D
 hmp-commands.hx                            |  2 +=0D
 softmmu/meson.build                        |  3 +-=0D
 17 files changed, 167 insertions(+), 84 deletions(-)=0D
 create mode 100644 include/exec/cpu-io.h=0D
 create mode 100644 softmmu/cpu-io.c=0D
=0D
-- =0D
2.26.2=0D
=0D

