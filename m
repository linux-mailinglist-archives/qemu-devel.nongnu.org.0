Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF68435A368
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:31:09 +0200 (CEST)
Received: from localhost ([::1]:42700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUu2G-0002D7-Q8
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3E4BwYAcKCt4VENTUREGOOGLE.COMQEMU-DEVELNONGNU.ORG@flex--venture.bounces.google.com>)
 id 1lUtxL-0005Ir-CQ
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:26:03 -0400
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a]:56198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3E4BwYAcKCt4VENTUREGOOGLE.COMQEMU-DEVELNONGNU.ORG@flex--venture.bounces.google.com>)
 id 1lUtxI-0007Rh-1U
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:26:03 -0400
Received: by mail-qt1-x84a.google.com with SMTP id f8so3370703qtv.22
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 09:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=38uiuJ3QJKBXotFg87dlcM88G9yDApKLBBvLmJGZZCE=;
 b=ZBn49z+s38lRSLFPTBjx7y7reVOP5OjuKrdvbWA9tn7abKsAeB9isRgh4NBJscTVc3
 yVebGjhcZ3i1wmG9J6s5AfucHvkgFeMHnK5xGIIW4Y2W2p6kK32MBIpd3QeZGunzPw6t
 LwSsMKwhi2HhObiccaKppzNvKDDKNQjLk3iLTWvohBHDbJ3i44y7LQrU76yiUJlKbqS8
 BiGFcN6imb8bND5X2yyPx0jzUvc5FU/B4s/5KspI7Qhi89pwGyL1cWCyXxIe/3PXYOXH
 aA3/95e0dCuouDQY8LTS4An4m05KN84amK3gTawMXEHGQSfLsmsfT4k5hCsTl4F7wYXm
 NOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=38uiuJ3QJKBXotFg87dlcM88G9yDApKLBBvLmJGZZCE=;
 b=Wa6F5+3WUTcM0LCBwKos33RI3kWFUPvLYBg4ii7r7gniX5h7c0oWEPqXw/yhXoEavX
 XZ4ShE/rl+nf15tnw+v2yHGNkPjAg0co4X3UUHD2h0ShjHc9k8Wr2qJyxMN4lUDFAV+4
 lQum7lRT/SDaJ6k2+hQuvi66xhrS6sIlRZXaR/SWl8wd9Mzn/AjN6nJxqTJ6KekWOT+P
 TsHEjKBG/obaVpJZQqiie1dSzhDD1qAPj+UKWlribgFvobBQNz3O1nQqdEq5TqIkaLy8
 x2Er3dIWzxeVpjRH6/U1EfRZCpWYXWChGpHBRWfXJY6AeTnB+N/G6tN2nt4BXYmIZDUZ
 /tgA==
X-Gm-Message-State: AOAM5310y4XP45BRSkuVVcOQPOI+aNXLA+u7r1/WAMhBjr+D7RcHWYPV
 jnVNAthpnDUUVtnkHSeVW34w9EOl2gYS
X-Google-Smtp-Source: ABdhPJz+rsqcwUxEPRLG3v5PkbanwC118eDKXaZ5FHzpfUaPy/8UT9KmKFZ8/bus/8lxSLuCtiFPABalaj6J
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:6985:9b01:e10b:b119])
 (user=venture job=sendgmr) by 2002:a0c:c3cd:: with SMTP id
 p13mr15159951qvi.4.1617985555670; Fri, 09 Apr 2021 09:25:55 -0700 (PDT)
Date: Fri,  9 Apr 2021 09:25:41 -0700
Message-Id: <20210409162545.3705962-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v2 0/4] hw/i2c: Adds pca954x i2c mux switch device
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=3E4BwYAcKCt4VENTUREGOOGLE.COMQEMU-DEVELNONGNU.ORG@flex--venture.bounces.google.com;
 helo=mail-qt1-x84a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

The i2c mux device pca954x implements two devices:
 - the pca9546 and pca9548.

v2:
 - the core i2c bus now calls a match method on each i2c child, which
 by default will only check for a match against itself.
 - the pca954x device overrides the i2c device match method to search
 the children for each of its buses that are active.
 - the pca954x device now owns an i2c bus for each channel, allowing
 the normal device model to attach devices to the channels.

Patrick Venture (4):
  hw/i2c: name I2CNode list in I2CBus
  hw/i2c: add match method for device search
  hw/i2c: move search to i2c_scan_bus method
  hw/i2c: add pca954x i2c-mux switch

 MAINTAINERS                      |   6 +
 hw/i2c/Kconfig                   |   4 +
 hw/i2c/core.c                    |  55 ++++--
 hw/i2c/i2c_mux_pca954x.c         | 290 +++++++++++++++++++++++++++++++
 hw/i2c/meson.build               |   1 +
 hw/i2c/trace-events              |   5 +
 include/hw/i2c/i2c.h             |  16 +-
 include/hw/i2c/i2c_mux_pca954x.h |  19 ++
 8 files changed, 382 insertions(+), 14 deletions(-)
 create mode 100644 hw/i2c/i2c_mux_pca954x.c
 create mode 100644 include/hw/i2c/i2c_mux_pca954x.h

-- 
2.31.1.295.g9ea45b61b8-goog


