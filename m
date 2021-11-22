Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB0745877E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 01:51:25 +0100 (CET)
Received: from localhost ([::1]:47036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moxYK-0006kc-L7
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 19:51:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxWS-0003zN-An
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:49:28 -0500
Received: from [2607:f8b0:4864:20::72d] (port=40937
 helo=mail-qk1-x72d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxWQ-0000wW-57
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:49:27 -0500
Received: by mail-qk1-x72d.google.com with SMTP id p4so16467171qkm.7
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 16:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aldEK2Ak9yDFqfwtS/inxT66VDbn7rGR1suLmqJ/Qxo=;
 b=Job0hbBoHBiN+6VHyeHZ5hssnd1A8FmDxPjwF3IO+IhrZvkQrKsX2Q6+nOyz3yb1H7
 idQ0B7sSmetwyfmrmdy4UiJCrouaWAk4E3YfxdBRluOQBNcobZfCawZGYwsAau/0m2Rh
 FwULp44qyHnm+s33DIyrppI3zZfhcoauZhRk8zvhyAfGH/myaEnU1iwe4c+dpz5SEbKA
 GTeKKpqbvetMFyPvW9ATMCSBCGVYxnhbSYlv6GmcodbEezhg9qJBRymRQ5vt8e1v2SCM
 L43dQR0Aw0K4Vld7lGOFxvAoPDDwnucYsm1LkU9vi2wfgXg1CHupWPk5PZvsyNS3NElA
 F+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aldEK2Ak9yDFqfwtS/inxT66VDbn7rGR1suLmqJ/Qxo=;
 b=Ddj1KK6l/oPfqjEv5+Yzt4aO2ptS6azZx6GDEsV7S9+7yFF9MI+6FFf3o6UU0YDd/O
 Ag+MGpECL4M7FidB/T/mP6pdqoTWfv6tO7NBzhI1ZTtJ/AduP3O2pKcTSjtk/gwnNl2k
 JKEf6NfRGXJmynxZEWEqtHG4DEPANQgOP3A+JJm60A2/bqqGvZlijw3MnxA0QEYH5NE9
 dWH6kHo76pZVyVv3bYNjRA2Thh661+Y1Ce+dtjAyVyIvCfsna81rkfleIyac1tbmf4aJ
 fc0aP8CjskvZY+Da7q1clSgCAcjdPkt9OZGPSsfLiAQMv0ftTTpl78NjbUL1nwc6qMxb
 LoxA==
X-Gm-Message-State: AOAM532jnzVSBZn60C599whd/YxkcxfBgctwH1EAkzOv0elMiLwV4E6z
 pW7ckqY6YZvMHm7kHhjsHIN3kQU6MLGKYg==
X-Google-Smtp-Source: ABdhPJzcSgcmZtmqxFHONiZQavOmefgNRC/tf3sr7UNiZg4vtHac3SAB2D9kSizct/BtfJ8qYe6SYw==
X-Received: by 2002:a05:620a:710:: with SMTP id
 16mr44151332qkc.379.1637542164544; 
 Sun, 21 Nov 2021 16:49:24 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id x17sm3651745qta.66.2021.11.21.16.49.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 21 Nov 2021 16:49:24 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/11] 9p: Add support for darwin
Date: Sun, 21 Nov 2021 19:49:02 -0500
Message-Id: <20211122004913.20052-1-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: hi@alyssa.is, Will Cohen <wwcohen@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a followup to https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg02902.html,
adding 9p server support for Darwin.

Since v1, the following changes have been made:

Submission and formatting
- Submission via git-publish
- Signed-off-by headers now reflect modifications since original submission in 2018
- Previous reviews have been removed, retaining only the newest https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg03426.html

Testing
- Rebased to apply to latest master
- Updated to pass Gitlab CI pipeline

Keno Fischer (11):
  9p: linux: Fix a couple Linux assumptions
  9p: Rename 9p-util -> 9p-util-linux
  9p: darwin: Handle struct stat(fs) differences
  9p: darwin: Handle struct dirent differences
  9p: darwin: Ignore O_{NOATIME, DIRECT}
  9p: darwin: Compatibility defn for XATTR_SIZE_MAX
  9p: darwin: *xattr_nofollow implementations
  9p: darwin: Compatibility for f/l*xattr
  9p: darwin: Provide fallback impl for utimensat
  9p: darwin: Implement compatibility for mknodat
  9p: darwin: meson: Allow VirtFS on Darwin

 fsdev/file-op-9p.h                     |   2 +-
 fsdev/meson.build                      |   1 +
 hw/9pfs/9p-local.c                     |  21 ++-
 hw/9pfs/9p-proxy.c                     |  17 ++-
 hw/9pfs/9p-synth.c                     |   4 +
 hw/9pfs/9p-util-darwin.c               | 193 +++++++++++++++++++++++++
 hw/9pfs/{9p-util.c => 9p-util-linux.c} |  13 +-
 hw/9pfs/9p-util.h                      |  29 ++++
 hw/9pfs/9p.c                           |  75 +++++++++-
 hw/9pfs/codir.c                        |   4 +
 hw/9pfs/meson.build                    |   3 +-
 include/qemu/statfs.h                  |  19 +++
 include/qemu/xattr.h                   |   4 +-
 meson.build                            |  12 +-
 14 files changed, 374 insertions(+), 23 deletions(-)
 create mode 100644 hw/9pfs/9p-util-darwin.c
 rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (82%)
 create mode 100644 include/qemu/statfs.h

-- 
2.34.0


