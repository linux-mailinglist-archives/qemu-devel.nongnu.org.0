Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BC747D980
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 00:04:25 +0100 (CET)
Received: from localhost ([::1]:41184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Aem-0002Kt-KM
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 18:04:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n0AWw-0002Ht-L1
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 17:56:22 -0500
Received: from [2a00:1450:4864:20::536] (port=35621
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n0AWr-0002Py-HK
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 17:56:15 -0500
Received: by mail-ed1-x536.google.com with SMTP id y22so14309600edq.2
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 14:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tu+v3elxs7PsJNIA1EEVVCo2MjxO1lip1atP65amZ3k=;
 b=Nf4ZysCHVROx1LcMp/PLw6U6B0B2+WwLcWsTlh3N1nIkZSSU2PjErTOxa/4Fy6ZbL2
 PBLNDBMoWY0+jG5BPlrS44aFIrSmeqEuSMZ4ybPOnvZuT9Jj9YcPDT8MTeX5Qjbp2y6Y
 qmxWNqAMMnj4rEhA1V5zo4rwklPNoL4/5zLJzHClM+ahKTAZhUf/if9/FKVv4JLpOJZB
 M7bO7OiPA8idM1Iv9ETUkhMdu1PztxLDCc0E5VEEwu8feK20DNMDAhtydQMOsGdfSON8
 EAwcOb+E2wwIxyWT8aFnwIqZduPa5m/fss7w4VKYJBKxEeMqW4RvyMLbHYrKPbPSILAt
 F2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tu+v3elxs7PsJNIA1EEVVCo2MjxO1lip1atP65amZ3k=;
 b=uoV25FVjAcr76Yrr6XchTnt4BPZB765W7tjqiiMtOJL7Bra7X7uFBzygWZq5ZT69tG
 sPxxMPdkYnLmRVoyBvF/PXGRCvPMZcZiXCZAWfCbtiL5vaJ/hVxjedxAe55NFc72FJ/y
 wj0QaaP+8O+oH0uc7vbO/twE6hqvaQC9tWYuafvTkZ9Tqzcc0PfnfWhLiUcSFHMnNLmE
 UXAKAdgqKHb90KYnLqpGQM7sKdVCYGDxK5QidwDhucLsicqe8Vg9HS2myRirPTqvKOrZ
 5k27+8s2fck6tGhTkz9xIYYQZDdLQ+G2yzVELXXIR0pLe6rdQ2m2zrYFDngOW2abYvdY
 Euxw==
X-Gm-Message-State: AOAM532EyymulMYwYmXZ4zxqsUr6fZcoFcZr6pEuvoZGsQBrjEyOe9to
 q2JRxYG07ubxAanm8wgN+vUyYTBKF3A=
X-Google-Smtp-Source: ABdhPJzzXxTQkMRcq0xREWaAQGBn0MPrkfgUy1mN+/QfF5pgevfUZP2du1FyveD1ne0sp/2Ob9FjAw==
X-Received: by 2002:a17:907:3f8d:: with SMTP id
 hr13mr3996166ejc.397.1640213767552; 
 Wed, 22 Dec 2021 14:56:07 -0800 (PST)
Received: from owl.kpn ([2a02:a467:f77d:1:deba:f393:276b:fad2])
 by smtp.gmail.com with ESMTPSA id gv11sm1097226ejc.135.2021.12.22.14.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 14:56:07 -0800 (PST)
From: Dmitry Petrov <dpetroff@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] Add horizontal mouse scroll support
Date: Wed, 22 Dec 2021 23:56:01 +0100
Message-Id: <20211222225606.1359162-1-dpetroff@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=dpetroff@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Dmitry Petrov <dpetroff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset adds implements passing horizontal scroll
events from the host system to guest systems via ps/2
mouse device.

This is useful during testing horizontal scroll behaviour
in guest operating systems as well as using it in case it
provides any benefits for a particular application.

The patch is based on the previous work by Brad Jorsch done
in 2010 but never merged, see
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=579968

Changes from V1 to V2:
  - Patch is split into a sequence
  - Value is clamped to 31 for horizontal scroll in the device code

Changes from V2 to V3:
  - Cover letter
  - Removed unnecessary log line

 hw/input/ps2.c    | 57 ++++++++++++++++++++++++++++++++++++++++-------
 qapi/ui.json      |  2 +-
 ui/cocoa.m        | 18 ++++++++++-----
 ui/gtk.c          | 54 ++++++++++++++++++++++++++++++++++----------
 ui/input-legacy.c | 15 +++++++++++++
 ui/sdl2.c         |  5 +++++
 6 files changed, 124 insertions(+), 27 deletions(-)

--
2.32.0

