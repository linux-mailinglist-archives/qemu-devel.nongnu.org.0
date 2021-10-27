Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6266843CB23
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 15:49:17 +0200 (CEST)
Received: from localhost ([::1]:41396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjIo-0008Nc-ML
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 09:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mfijW-000267-Ht
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:12:54 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:37756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mfijU-0005dy-1G
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:12:46 -0400
Received: by mail-ed1-x52d.google.com with SMTP id y12so10487543eda.4
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 06:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0SpzuPaoJKo3wjibgefgmzTu8SFNj3rApjALf/7EAa8=;
 b=TitVVro05VebmBLBEXb8OZ0l7gDWs8NWOyTN6EOESBZGDeZM7huHb1t87vJlYG6Jt6
 BqcaPY7ElM5rOX3nBNV6c1D3MIn4nFtGJz0dqNPLUtBVxTl/wyPg6mJ6eEjMTHs0/4SN
 piVL1cat0Qs5tWh+rR2rGWeduu7cpPvOl2GB2Y73fzbIZDUnHG/6QSWZlJ2ftsTJYd1M
 ShZM8Yyq60TUiE2gRFOFKjruoTItyt53pngx3ehA+6hEuQGxeZ0vrf2yZU/xLg5XJ6TX
 UwlzyQ2cg56JPIJqwyBqLMldSwLAEjDw6EWWgH39Dq5oUL1TkQh26MXle9+SicJnerLL
 8Lgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=0SpzuPaoJKo3wjibgefgmzTu8SFNj3rApjALf/7EAa8=;
 b=dWiGHpM0s4E3okb0czC7XadY/76oqkoR3zdcegRhUlR0waxR0dJGKLzuCf5AdUoeUD
 jV2X+NWmgFj4gnjNUEG5HKgcXYeqswiRoQaZNLh3cWTvctyn3cVZ8DV0JVwtXXw1CuZX
 tNAJOrjtxvYMYn8O8cvGnlHdWbnRWWFJsoni0Uoeoi61aFYyp55YWmRBKfkgQ4yUGQ1N
 X7Ehg24l3u3//EDH+5WUWSnSzxL6PRQ52rVZ5j/puaGk8hA2ScS8Rj+cVipVjuAvIE0V
 Lyj1hySs0/6nyipRJwbfztJUCB65M0nUGg/w4zlEl2H75bY+K7qKNn8AtR0SdXRBr9XA
 tRlA==
X-Gm-Message-State: AOAM531yu9IRX+E84fCL32PfHcxfYavuQ9zHsyJkabTUx/wvxKGybsoN
 uQRb8mZIwRQ4JfJ98eGj1rgo3sob8tA=
X-Google-Smtp-Source: ABdhPJz781r1Boz4xs0LBmdKeGV6kesG8wxonFGPm35srCid4JCNyi6mZ9qHhjbBtrotPUwuz05U9Q==
X-Received: by 2002:a05:6402:2034:: with SMTP id
 ay20mr1879575edb.320.1635340360932; 
 Wed, 27 Oct 2021 06:12:40 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p26sm12716943edu.57.2021.10.27.06.12.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 06:12:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Deprecate -watchdog, cleanup -watchdog-action
Date: Wed, 27 Oct 2021 15:12:36 +0200
Message-Id: <20211027131239.802564-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

-watchdog is a simple wrapper around -device, but it includes quite
a bit of code to register and list available watchdog devices.
Add a category for watchdogs so that they are listed as such in
'-device help', and deprecate it.

For -watchdog-action, make it 100% a shortcut for "-action watchdog",
instead of calling into watchdog.c from the command line parser.
This is a small improvement because "-watchdog-action" and "-action
watchdog" now override each other based on the position on the
command line; previously, "-action watchdog" always won.

Paolo Bonzini (3):
  watchdog: add information from -watchdog help to -device help
  vl: deprecate -watchdog
  watchdog: remove select_watchdog_action

 docs/about/deprecated.rst  |  5 +++++
 hw/watchdog/sbsa_gwdt.c    |  3 ++-
 hw/watchdog/watchdog.c     | 14 --------------
 hw/watchdog/wdt_aspeed.c   |  3 ++-
 hw/watchdog/wdt_diag288.c  |  3 ++-
 hw/watchdog/wdt_i6300esb.c |  3 ++-
 hw/watchdog/wdt_ib700.c    |  3 ++-
 hw/watchdog/wdt_imx2.c     |  4 ++--
 include/hw/qdev-core.h     |  1 +
 include/sysemu/watchdog.h  |  1 -
 monitor/misc.c             | 15 ++++++++++++---
 softmmu/qdev-monitor.c     |  1 +
 softmmu/vl.c               | 11 ++++++-----
 13 files changed, 37 insertions(+), 30 deletions(-)

-- 
2.31.1


