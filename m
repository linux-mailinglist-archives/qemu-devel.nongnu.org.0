Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB1C3ADA2C
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 15:43:59 +0200 (CEST)
Received: from localhost ([::1]:49256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lubGP-0006jp-J2
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 09:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lubEw-0004Za-Uy
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 09:42:28 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lubEp-00081q-89
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 09:42:24 -0400
Received: by mail-pl1-x633.google.com with SMTP id 69so6126040plc.5
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 06:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Of1AI95mb8IDfEYEcWDGj63UVQ7LCipXj569Q0N0gfk=;
 b=FyIFkDfcA3h50cdXKHwf110ZD59d6dT3Xyb0BEJ7EijocltiGsJ0F5Vync4I1hLVRX
 pqrfb1Nj+G3M4f60jYBxs7Nq3d6M1vqahRxr56cBdXDUjMG6THJCt+15ljA/xkmJXfMg
 sPTKxuawS2ZQNKxzSza63oGAFDmFysP1m28Gd5HQRgQV6kVLgu4810tAD1zvphHsVj+n
 IzuOLWKdjH5T3YYZa/8T+9kA0derrteOFdm6Ey8qZn8OVlKd/BfQfzsA4ayZoDsdi66a
 X6ni1BqfC3lYXH2NnCDmRJZIbI9iqlt2Al9rnEBr6JHBYjW29n/gh714Z+Sf5SZIdZIA
 BKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Of1AI95mb8IDfEYEcWDGj63UVQ7LCipXj569Q0N0gfk=;
 b=TIDBSuBhiuM1Na8aP+kWyzFwsfYPpO/Tjnn5I8T+tpryT6iiifH/mFoY0vK3U55sYu
 P+Fkiw/OIOODTv7RaOt5YeLF2h0NVNPhTeRo2pKf7nmp8kxZOwsaon8aFuI+pHjAWgIL
 UE5bxKoY5USmPwNi/0NJvgRtljhimGI5V8wMPDJ9P5A9yJzBD+EDyFXZxA0OcZLKazeM
 L8zwgOzCHj2YCk5Wv01GnXc14ZS93lIjzciAfCa2Q+8eXn2SuHjfaqbsTNX95JNmI9L9
 5fTAKI0dleNOXGqdCWUStfnCrLQiHM7s6eoJyPjjm3TiKju/Fg830HuDGl+zs8Bjg36k
 BVpg==
X-Gm-Message-State: AOAM531VmKUIFpwAVrgA7uumDcML15rH3PQ+IeZZDq954nD2Lc3BoBa4
 abPYipxBbxM0r+tt9pDs79JFSx0D6w3BJg==
X-Google-Smtp-Source: ABdhPJzOuVVwLMXu9HUsIzLEQt5XwrvCJhxIje+sDjuxS+yq2mCKZe5cOgpEOSxqpSJmfbA1VKXbjg==
X-Received: by 2002:a17:90a:4e0b:: with SMTP id
 n11mr16744832pjh.155.1624110137657; 
 Sat, 19 Jun 2021 06:42:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y20sm12331511pfb.207.2021.06.19.06.42.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 06:42:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] tcg: Fixes for temp_allocate_frame
Date: Sat, 19 Jun 2021 06:42:13 -0700
Message-Id: <20210619134216.590423-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yay! Is works for purpose.  Couple of tweaks:

  * Use fixed 16 as alignment for TCG_TYPE_V32.  Just an itsy bit
    of future-proofing against any host that has a stack frame
    aligned larger than 32.

  * We now have the ability to restart translation when exhausting
    resources.  Do that when exhausting the stack frame.


r~


Richard Henderson (3):
  tcg/sparc: Fix temp_allocate_frame vs sparc stack bias
  tcg: Allocate sufficient storage in temp_allocate_frame
  tcg: Restart when exhausting the stack frame

 tcg/tcg.c                  | 45 ++++++++++++++++++++++++++++----------
 tcg/sparc/tcg-target.c.inc | 16 +++++++++-----
 2 files changed, 44 insertions(+), 17 deletions(-)

-- 
2.25.1


