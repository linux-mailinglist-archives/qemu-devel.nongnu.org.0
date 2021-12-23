Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A80347E139
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 11:19:03 +0100 (CET)
Received: from localhost ([::1]:58794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0LBe-0004ij-7S
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 05:19:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0LAW-0003R9-VH
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 05:17:53 -0500
Received: from [2a00:1450:4864:20::531] (port=33356
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0LAK-0007Rq-2m
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 05:17:48 -0500
Received: by mail-ed1-x531.google.com with SMTP id m21so20737380edc.0
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 02:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1kpNA6cvx89XfQbuOuKkKt2HzwH8wLeVMmiofMBGSI0=;
 b=B5urcglE2lk95s2lfW4U4XgefZK+jlL98mtpdl4i9udk7wonQ5VgPFylvDthnkUbs+
 2hnWzBsjE37IR+cESYaaCT7O3KM2WIrSo/omWQ578dvxlxP+1+0MQuqHLfW/s9rGd80A
 iuOWidor72hjUnigY1sLQ6lM0meNuGTQoDlRuvF7VjZVuJhne220Xc5/Z4DI/NbHpoP+
 iCDCXr9mIgwRHCvxKIJI5AoXfFsKz2wKfAB/Cv/PF2/NzCGTYelTahFyzZUvDfsKJUdO
 a/KqrLsc+mz73skcf30T828v1YoIh8JHJEgeknPky6jzBPBFtSFIZJ2cQ5RiF/mkjPla
 jpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1kpNA6cvx89XfQbuOuKkKt2HzwH8wLeVMmiofMBGSI0=;
 b=wbciDy6NsFX4/6l2hcwyW9pENiieqeoB87RH4GE7SHK3GAso4Nag/uzutW1jwqvc7d
 75DsEmXTyDFIzI6pIldm79AFa78ICSdPZWNQ3+Y3uCg6ERU+81gqzI/3dc7umRIQyn3I
 m6Wd+da3BLpUcreN+C+sD/oVbqcqTVxPq+E6c7SA8lXFmdeWwdRZZy/vsr1RqrGzepDO
 5MBZWoWpK7QwETTjhfh15+vg5OR9D4w1yxvrbJYGJrZ2LpCiBQ5Ijm82xD1GfLluQkpP
 /myXV18bWrv+n8+EV+2oA1fusrPPsI7icf3hvVAwTAwxUEFUIB3TA9kHtoChCT85+oQC
 /npA==
X-Gm-Message-State: AOAM532NKpirs/Qmu/bF/kajwOI0f9o6PNTx7sEMUzg4Ez78F4skz4qd
 E51U4UeZVgC80NAWQM/ZeXsBQYhz5gA=
X-Google-Smtp-Source: ABdhPJw3iHEwGr5CW84JRuy11p6Oah+9LUmbquzlUi2BrdtksRLcLmX2ExkiNm6NL6mVSvHNMp1kZQ==
X-Received: by 2002:a05:6402:3554:: with SMTP id
 f20mr1444669edd.138.1640254657993; 
 Thu, 23 Dec 2021 02:17:37 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id w3sm1601634eji.134.2021.12.23.02.17.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 02:17:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] "make check" switch to meson test harness
Date: Thu, 23 Dec 2021 11:17:35 +0100
Message-Id: <20211223101736.507167-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The following changes since commit 2bf40d0841b942e7ba12953d515e62a436f0af84:

  Merge tag 'pull-user-20211220' of https://gitlab.com/rth7680/qemu into staging (2021-12-20 13:20:07 -0800)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream-mtest

for you to fetch changes up to 3d2f73ef75e25ba850aff4fcccb36d50137afd0f:

  build: use "meson test" as the test harness (2021-12-23 10:06:19 +0100)

----------------------------------------------------------------
Replace tap-driver.pl with "meson test".

----------------------------------------------------------------
Paolo Bonzini (1):
      build: use "meson test" as the test harness

 Makefile              |   3 +-
 meson.build           |   5 +-
 scripts/mtest2make.py | 112 ++++++---------
 scripts/tap-driver.pl | 379 --------------------------------------------------
 scripts/tap-merge.pl  | 111 ---------------
 tests/fp/meson.build  |   2 +-
 6 files changed, 51 insertions(+), 561 deletions(-)
 delete mode 100755 scripts/tap-driver.pl
 delete mode 100755 scripts/tap-merge.pl
-- 
2.33.1


