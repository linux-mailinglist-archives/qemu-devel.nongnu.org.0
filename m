Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DF52F230B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 00:14:45 +0100 (CET)
Received: from localhost ([::1]:53590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz6Oa-0008GS-AX
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 18:14:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz6LF-0004aE-5M
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 18:11:17 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:43359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz6LB-0006C0-VE
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 18:11:16 -0500
Received: by mail-pg1-x52d.google.com with SMTP id n10so147363pgl.10
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 15:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UWP41LldK9nkC6LBfZA8LR7R7rGfju6ns2oORRKgk08=;
 b=FSLNrW1Kgta0djg85U/FyKXbFjN1eJBZqUBL/OF2GFGzjnuXsw5ttqXM+yYZhEJ3d3
 zb402Nl1fh/heIol+wy3iYvHc+4lWzBIlIC6Kq17zIiTJX2s+7381D+ZXreD6SK/t0AO
 7cBRQBt2tV/1k+72kUItZjpfvlvzfdx2rW8vNJYwCCQ/WFNK8+T1641q5TY2Q9BoeXxw
 P9a7pj5dR+MKBSoOlrgDU4UKCK9+xyTQmN5LcT/8nmuzILBs9fBHVWbCj/keKuevNn65
 yHGW23UHlrGLnFIyHRBwDvTim4p8LdjVGJfpjpXZFtWub6vUC9UbceOuljwqopx5mh5s
 U43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UWP41LldK9nkC6LBfZA8LR7R7rGfju6ns2oORRKgk08=;
 b=hNHdiX5g5T27mo59n1vdbW6OzHhPluOLUq1dxRnDQOzbOXNj+FfATz5URoWH/UUI+t
 55JnnE3WP7m223B2qiaXp1U1cy62sCzjnJ/IpkTrylVpeOMswcEsGY5svizcPUVmf/WK
 qm45EmP8PFtKh1iZnGiCz3xhXXaf/wq1RDbmTGJhP5LOGpsmTmciGHOPb7/QLEIsF5on
 ofSdF9j313ZSjmncfoNrtbDZjp+WdWS/96GhMaR6j6o/PBQ3ImUjBuAwjpGGMPTWiWW+
 6OHQYaW45BkG+p1cKuUdnhHOQuq0gMOPsm+VfoKxo9ADWME1iL26SYDEPcW1DXg+SxoQ
 Ox1g==
X-Gm-Message-State: AOAM531cUCzONyoc/QtxUyzQ3Z88P9UJcs6MjhX5yh9vmxHmT8B7dsmT
 zU5nWIHr7IpJyBYwSUgnQ2SbXctMrtL5Mg==
X-Google-Smtp-Source: ABdhPJxIRsqbXDFSJDKQmpRLY43U3h1Njkr9CiB/YLGW0P88DE+Aw4X0hPZksuvGdToTvkD6MBJ7Dg==
X-Received: by 2002:a63:4e44:: with SMTP id o4mr1774714pgl.46.1610406671500;
 Mon, 11 Jan 2021 15:11:11 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id g202sm658105pfb.196.2021.01.11.15.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 15:11:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/3] target/arm: Implement an IMPDEF pauth algorithm
Date: Mon, 11 Jan 2021 13:11:05 -1000
Message-Id: <20210111231108.461088-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The architected pauth algorithm is quite slow without
hardware support, and boot times for kernels that enable
use of the feature have been significantly impacted.

Version 6 changes:
  * Rearrange xxhash64 (pmm).
  * Add documentation (pmm).


r~


Richard Henderson (3):
  target/arm: Implement an IMPDEF pauth algorithm
  target/arm: Add cpu properties to control pauth
  target/arm: Use object_property_add_bool for "sve" property

 docs/system/arm/cpu-features.rst | 21 +++++++
 include/qemu/xxhash.h            | 98 ++++++++++++++++++++++++++++++++
 target/arm/cpu.h                 | 25 ++++++--
 target/arm/cpu.c                 | 13 +++++
 target/arm/cpu64.c               | 64 +++++++++++++++------
 target/arm/monitor.c             |  3 +-
 target/arm/pauth_helper.c        | 27 +++++++--
 tests/qtest/arm-cpu-features.c   | 13 +++++
 8 files changed, 236 insertions(+), 28 deletions(-)

-- 
2.25.1


