Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D06F6A65BD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:49:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCVO-0005VJ-IB; Tue, 28 Feb 2023 21:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCVM-0005VA-Qr
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:47:44 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCVL-0000gF-7t
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:47:44 -0500
Received: by mail-pl1-x631.google.com with SMTP id h8so9241621plf.10
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RT9ZGPqWs1Dvsf1Syxd+U8qeK/p/Ema/L7McQtUFZ+Q=;
 b=nGyV1mRXSjxoSidV3IWplMBWAPmI6kJ1Dt10NIrBEB22dzx8hV3BliaEqM4xyxfjAU
 iKGIYID8hY11nUQcpxNDE53fP2poyAflK5QA7LcgAErcPyDFr/Q+nlXsI0nK1i2NUrtp
 710ofCPwUw2ib3YT137FBfLjd8xreCH9rVGDFxNG9CJyM+Mi9GtE7GDD0uDtc4vPjqu0
 moWgRGFORUJ5BmQwunByHlOsVTYsmwOlpfRUMnD8rScoWkk5yxeYu9Wkz4Gp7SZToD+0
 PnSVU2sBHrUZnsBgoEE4seKf9S2wpI1iwcYTtBkltDPtVd9eGF283f9J/SzBzEfeBeV4
 6q8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RT9ZGPqWs1Dvsf1Syxd+U8qeK/p/Ema/L7McQtUFZ+Q=;
 b=USBIUrRsjeKHvtPQzIG9fshwOKuzJyuuS7P3grVjHLAM3ebJ1TEx09TORjxWLtcIgc
 D7xAqKddr/nYjzHOV1iL/NwKVt54XKbK/G9zbcK28FXWU+rnkhKHO+pgihQ5bnUytBZ0
 SA+/+037wdLR41rm/aDXASLxE6SM8vjhJZUMqn0GbqhUpnlkLntHRAKZ/Xk56PTsQ7BL
 pfnnXrVmNNLe8UdcbBD5DpLdPAEL41L0NCQGx8MlBxG0lm/hHGxPRvElgHFkacIar1dj
 dlrrm7oHSvFc/vck+duTE50bVOQxVADuYT5q5HLXFq0yRX6ydVZxTkcO5LkFN2I82S8y
 UxAA==
X-Gm-Message-State: AO0yUKWTMi+MLkpnMvxzQ7CYnd0cggigo6pvo7mo8Mu/ZDsz2sDhz2pU
 FrjgxnTtUrVXkcVd3r1+rWuVzuML5245fbMm2Qc=
X-Google-Smtp-Source: AK7set+qtHM1M4G5FoDTPcVlUmImgbHEvDJ5n7whZmThMNq74JzcwIiassW2hVFrt7GM6X0R/HrEIg==
X-Received: by 2002:a05:6a20:a028:b0:c0:53f7:7d16 with SMTP id
 p40-20020a056a20a02800b000c053f77d16mr5967055pzj.39.1677638861530; 
 Tue, 28 Feb 2023 18:47:41 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 y18-20020aa78052000000b005a8aab9ae7esm6708449pfm.216.2023.02.28.18.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:47:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org, alex.bennee@linaro.org, aaron@os.amperecomputing.com,
 frederic.petrot@univ-grenoble-alpes.fr
Subject: [PATCH 0/2] plugin: fix clearing of plugin_mem_cbs on TB exit
Date: Tue, 28 Feb 2023 16:47:35 -1000
Message-Id: <20230301024737.1210851-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Supercedes: <20230222043204.941336-1-cota@braap.org>
("[PATCH] plugin: fix clearing of plugin_mem_cbs before TB exit")

Let's handle this as we do can_do_io, and reset the value in C.


r~


Richard Henderson (2):
  tcg: Clear plugin_mem_cbs on TB exit
  include/qemu/plugin: Remove QEMU_PLUGIN_ASSERT

 include/qemu/plugin.h       | 4 ----
 accel/tcg/cpu-exec-common.c | 4 ++++
 accel/tcg/cpu-exec.c        | 5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)

-- 
2.34.1


