Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B689335C7DF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 15:44:41 +0200 (CEST)
Received: from localhost ([::1]:42480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVwro-0005Y1-PW
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 09:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVwqa-0004Jy-JA
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 09:43:24 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVwqX-0003N3-OA
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 09:43:24 -0400
Received: by mail-wr1-x436.google.com with SMTP id h4so3966909wrt.12
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 06:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=coR5qfcj7HbN5UNgt4/UQCpFaRvRt8MSF2O7M15ACS8=;
 b=BMUfEZPwGnUS8HE7k/U/fh4/0ucrzzjeMHFpoYRDqJoOqkRJMoaJRp6RMRUK47fN3S
 M/0CZAzeskwp/Kunx0UcRSKJUocnrKmaxwRyRxol5IsbHA8Xu5dMMEqJ2rDE6qu1UoGR
 5Junhb83gJzKiVY/ixs/74DIT8jegYMkEDCiLheiG7bgy9h6TgN5sIltBqarIsCiC71w
 nLT8VYBV4szL7mu+07eoYnkZVscKez4n+sfZGDKxEncNCcQsYizRtRmYo3LJZw/Vekc5
 Y67u3LLUOxFRSHDl96l759f1xFWgOFwdZKiefCE8IEQG7jvYZabr+8G4eCEwwb6eYfaT
 iz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=coR5qfcj7HbN5UNgt4/UQCpFaRvRt8MSF2O7M15ACS8=;
 b=lVmyyGOuzRQJCuhcOcrtRa5xpqhdS7NGDYzSXgczRDcu8dkRiYuhSQgVQXjpDDEM/p
 drByIiXGbR0MX0BX8FiI0EOgHyV/vzwm39xUvTmYzt6TcGMONbeNV70hxSi+btzu7IMz
 m3EjoxmPG2z66WAHvbnILWeA1Hb6HKbJ5wDQ1/A1cRxI0GyoEar/PqhvB2bx4TK6r5Ov
 4udmcKrQHkQt7h0yJjVw+vA60GBhyTqLFSFv6KPJswt2bRmobaycG8d1QZSZTwdi+V5l
 37QwDPNMKlIuZNz99s9NvzR9UM+M0s3tei64KaO7wFSljdKPPSgMBBSFkQT1iZcczaWj
 t2vg==
X-Gm-Message-State: AOAM530ZzMOMglEUu0wgUUnRlV6N8TXJ0ZscPbqAsEfYDNt6xh8OFsKI
 TdQFtqBumKH6cV3Ok4gm/2CVAQ==
X-Google-Smtp-Source: ABdhPJy2Nmx4y7Li9c0axjOF6pteuwTVi1eqh+0L4Q3gh/pxAW3kEmQTpgHsB5dU34AKlFLwSUgiLQ==
X-Received: by 2002:a05:6000:1102:: with SMTP id
 z2mr9914770wrw.333.1618235000055; 
 Mon, 12 Apr 2021 06:43:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm19574680wrt.54.2021.04.12.06.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 06:43:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] mps3-an524: support memory remapping
Date: Mon, 12 Apr 2021 14:43:14 +0100
Message-Id: <20210412134317.12501-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AN524 FPGA image supports two memory maps, which differ
in where the QSPI and BRAM are. In the default map, the BRAM
is at 0x0000_0000, and the QSPI at 0x2800_0000. In the second
map, they are the other way around.

In hardware, the initial mapping can be selected by the user
by writing either "REMAP: BRAM" (the default) or "REMAP: QSPI"
in the board configuration file. The guest can also dynamically
change the mapping via the SCC CFG_REG0 register.

This patchset adds support for the feature to QEMU's model;
the user-sets-the-initial-mapping part is a new machine property
which can be set with "-M remap=QSPI".

This is needed for some guest images -- for instance the
Arm TF-M binaries -- which assume they have the QSPI layout.

Based-on: 20210409150527.15053-1-peter.maydell@linaro.org
("mps3-an524: Fix MPC setting for SRAM block")
though any conflict/dependency would be minor and purely textual.

thanks
-- PMM

Peter Maydell (3):
  hw/misc/mps2-scc: Add "QEMU interface" comment
  hw/misc/mps2-scc: Support using CFG0 bit 0 for remapping
  hw/arm/mps2-tz: Implement AN524 memory remapping via machine property

 docs/system/arm/mps2.rst   |  10 ++++
 include/hw/misc/mps2-scc.h |  21 ++++++++
 hw/arm/mps2-tz.c           | 106 ++++++++++++++++++++++++++++++++++++-
 hw/misc/mps2-scc.c         |  13 +++--
 4 files changed, 146 insertions(+), 4 deletions(-)

-- 
2.20.1


