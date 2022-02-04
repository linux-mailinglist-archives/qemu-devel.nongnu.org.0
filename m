Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287954A9C0C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:34:28 +0100 (CET)
Received: from localhost ([::1]:42856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0bT-0006bB-AH
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:34:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG0Wm-0003kR-O3
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:29:36 -0500
Received: from [2607:f8b0:4864:20::102c] (port=50766
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG0Wi-0004Ba-TK
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:29:36 -0500
Received: by mail-pj1-x102c.google.com with SMTP id m7so5932110pjk.0
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 07:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=unMJI0hH6e9du6DGKKwYhEvMIsLNTZ3jY6vBAwU9dHM=;
 b=i0QUbhGcfDz/v93L8XJ745DhTvoZzjJfu5ppBGyGrZ+j0FNbTOnU2GewljrSetdlT6
 cW6Yw58BpIRMO7jEWZMZtNUQ2HEOnHJ4Trnz6Q4DdwvOyV+TMO9eJmVGH4plE0cgfFZC
 /myIpTIt+J/QcJATYdaIgN4kSllPQ9T6kd7Xqje4TooBuKrVwB7Be7CqruQiDL2Ynb2H
 Aujb143265+qU88o6jOL7X7wXaVOIBZ/sESvJvGA6NncoyccBKkvoBdWqz556CHz5I2J
 jTxfQv6/fXYfz41D865H+CcgB2LARDKw1x82eu0u1y7mty7yAcjyscljMGj5Qg9HtY9/
 oxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=unMJI0hH6e9du6DGKKwYhEvMIsLNTZ3jY6vBAwU9dHM=;
 b=mPkjJgRfQzCVq66bsRLIdA2bqTi1qNkHSscQUJE/SMFtt2fvqwWR0J2O0ANGj/tVyR
 rrufLxIydYQa2sIIz/FQOlvGT/tjrb4I9jzblO+3h76EvnXu2KHecU+4wT3rf9JuRaCV
 MOiYpC4kRQSnaSdg5Xy+2zigl1RLG1265aTV2cBTcnjan4vcuMGhxVS3U9j2viUeCLN3
 h1WCn0A3nGOZxUecxAt5d1782i96ygbSM2RQKKk5FIu3BbEuw1pF+viwYfdM8XZNCo15
 Gs9qKr9AgqiO6ujuHH2eiAvhexq60KxRvRhzJPf5448ltk++1mFu69TYdp/C931oenp4
 HL1A==
X-Gm-Message-State: AOAM532dijuGTR8ysyTi5Fzp7+60VkDYD0H4VzE+tl4CN/qwoGVhmgMD
 Xq7+UIFYQizMezsszwRKNTEAYSzKJA8=
X-Google-Smtp-Source: ABdhPJwzPVXGQnR26L9/K04/+STe6Er0medIDlD+Xa/bpPrWpbE3bts6+y1hKe6UM5GBblXbY0d3Bg==
X-Received: by 2002:a17:903:2307:: with SMTP id
 d7mr3780855plh.52.1643988571303; 
 Fri, 04 Feb 2022 07:29:31 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id a3sm2901812pfk.73.2022.02.04.07.29.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Feb 2022 07:29:30 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 0/4] buildsys: Avoid building unused objects
Date: Fri,  4 Feb 2022 16:29:20 +0100
Message-Id: <20220204152924.6253-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Hi,

I already sent these patches few times. I am refactoring the whole
tree and building over and over various combinations, and still see
unuseful objects being built, so posting these patches again
(rebased).

Based-on: <20220203193803.45671-1-f4bug@amsat.org>

Philippe Mathieu-Daudé (4):
  configure: Restrict TCG to emulation
  tests/fp: Do not build softfloat3 tests if TCG is disabled
  qom: Remove user-creatable objects from user emulation
  qapi/meson: Restrict machine-specific objects to sysemu

 configure                 | 12 ++++++++++--
 qapi/meson.build          | 20 ++++++++++----------
 qom/meson.build           |  7 ++++++-
 qom/user_creatable-stub.c |  8 ++++++++
 tests/fp/meson.build      |  3 +++
 tests/unit/meson.build    |  2 +-
 6 files changed, 38 insertions(+), 14 deletions(-)
 create mode 100644 qom/user_creatable-stub.c

-- 
2.34.1


