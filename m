Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82899458F3D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 14:14:51 +0100 (CET)
Received: from localhost ([::1]:46616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp99m-000628-32
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 08:14:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp977-0004Zf-JD
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:12:05 -0500
Received: from [2a00:1450:4864:20::32e] (port=38567
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp975-0005Gw-GN
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:12:05 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso16726787wms.3
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 05:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AYC7Z8E+6XFvG/OquUxfAixODQBYA/BdKm5RfzhfTSg=;
 b=UynGYgsdF9kQC1ACjmYrzZYZscI+THHj8+iQfRZT5bOaVeF3l3m+St8hxjiwpvok04
 EVX7iaHrUqzMJ3uQUln0Kl8tBV+H76UDzMEDqlpH5gQH0k2FJ9YJIrfgD5uVpcLxrHtm
 18NmpzIN7vELDIwX1UgFmab2ZZkimzPaq5n0fFmo8BnVz+VayNXb3xCr8+1tcHDeHGOq
 0M9GjE3kHyr8M5O/2NNCCNgOSgGhlJWlxPeIDH/flGYwBSaoT5/FbwK+03yskAdfBhKF
 lr1BwEL9WbP8c+PIBMUuj2Jbzo+HWfKxLYwTOGMh9jlE7g7QozwjVvVHsphAiZ00q88u
 741A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AYC7Z8E+6XFvG/OquUxfAixODQBYA/BdKm5RfzhfTSg=;
 b=fBD842yD6i+3/6t/CQK51qK5Z82m9ZIVMcLuao4FAeSDt01GmsfIz+t6jjUWzItjFg
 B694mo9JTkyFiEj20gFIGBsXA9VsFVp+ipj/F7OgUWTul291st234uExlHbtBvkiaHTt
 X+ZhafH9rdbbNtaiityebLSq1gBzXIUfKgJqoMA7ifPO1kl4pnMzTr4tBSk23n4sEcGb
 giE7WHnVNUr28iI9gwWkLBctQg6Ch7wBKxdxhPs43RWRi5W9ppsU21J4aZaVVOfWGhqP
 FvauK0RnCs8duHjMFor6xAiudp792zIkJDHIfkVerir8p98W32xop+fFGX+6t2nqgd3B
 cSbw==
X-Gm-Message-State: AOAM5334BGy89MKLb9eVRa7KeKmXVDljRd7PJN51UejYYGU/aUdF28nH
 xMOFVYlEgvqtM0y00jacKYglqbPOcIR+CRX7Cig=
X-Google-Smtp-Source: ABdhPJzn0E8/EfULF68HzBjS0eYDqaQB/2FHghcCTFY/mPS3wJQW1BUNOz4rj7RsBSM8s8kDcv80DQ==
X-Received: by 2002:a05:600c:34c2:: with SMTP id
 d2mr30160494wmq.102.1637586721977; 
 Mon, 22 Nov 2021 05:12:01 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id q84sm25364820wme.3.2021.11.22.05.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 05:12:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 0/2] linux-user: Create a common
 rewind_if_in_safe_syscall
Date: Mon, 22 Nov 2021 14:11:58 +0100
Message-Id: <20211122131200.229286-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: raj.khem@gmail.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a re-packaging of two of Warner's patches that
fix a build issue on aarch64 using musl:

https://lore.kernel.org/qemu-devel/20211108194230.1836262-1-raj.khem@gmail.com/


r~


Warner Losh (2):
  linux-user: Add host_signal_set_pc to set pc in mcontext
  linux-user/signal.c: Create a common rewind_if_in_safe_syscall

 linux-user/host/aarch64/host-signal.h |  5 +++++
 linux-user/host/aarch64/hostdep.h     | 20 --------------------
 linux-user/host/alpha/host-signal.h   |  5 +++++
 linux-user/host/arm/host-signal.h     |  5 +++++
 linux-user/host/arm/hostdep.h         | 20 --------------------
 linux-user/host/i386/host-signal.h    |  5 +++++
 linux-user/host/i386/hostdep.h        | 20 --------------------
 linux-user/host/mips/host-signal.h    |  5 +++++
 linux-user/host/ppc/host-signal.h     |  5 +++++
 linux-user/host/ppc64/hostdep.h       | 20 --------------------
 linux-user/host/riscv/host-signal.h   |  5 +++++
 linux-user/host/riscv/hostdep.h       | 20 --------------------
 linux-user/host/s390/host-signal.h    |  5 +++++
 linux-user/host/s390x/hostdep.h       | 20 --------------------
 linux-user/host/sparc/host-signal.h   |  9 +++++++++
 linux-user/host/x86_64/host-signal.h  |  5 +++++
 linux-user/host/x86_64/hostdep.h      | 20 --------------------
 linux-user/safe-syscall.h             |  3 +++
 linux-user/signal.c                   | 15 ++++++++++++---
 19 files changed, 69 insertions(+), 143 deletions(-)

-- 
2.25.1


