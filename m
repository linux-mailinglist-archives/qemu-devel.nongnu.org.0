Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED36648038
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 10:38:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3ZoX-0004Dy-Vy; Fri, 09 Dec 2022 04:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3ZoO-0004Aw-SH
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:36:56 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3ZoM-0003k5-Qg
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:36:56 -0500
Received: by mail-wm1-x332.google.com with SMTP id bg10so3140272wmb.1
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 01:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5XG/qyJ3qYTJh4r6ftpZVsjimgFpri3BNqgCExr7520=;
 b=isFNCC17TOoNQuP9Quq70Je89yIOQPLDDYGL+TcjX+5Dz/9pALiEfPfY6VktqR9d+I
 uZdgD/aQ2VOVfvOTwVoOrX1ibpHIvz/mM3AtC6SNZR99zL7KjmNRU84CM3V9k1kwg3HC
 OZ14yQO/WJ+ePsr7iFP6h32Uh+3JqXHNrgBqRM2Uho7zucrNekbtKmiucdJWBiGQEb+6
 hqEq91mEys+fySM5WedJPHCSXGk39k3znwFwkooU/M6wCv1NTFTnwPPtSfAtYiwezOG5
 WP21YRxauQn3GSKf7VVZV2LgY/Rif6mc2CSWeeN2RjalNDwCyNSO5ooPDXRFAQYNUYd4
 7oDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5XG/qyJ3qYTJh4r6ftpZVsjimgFpri3BNqgCExr7520=;
 b=MLSNy9EL9eDabbNkDtmCgwtg1cSnoyBIhnbquESkbTovXLCs91+Y5thppJQPHYZjq3
 3E/UnIYVYAVq1iIVz4kX2FfFhGcRMicpYKbpJQ5HL1Lm4+DNJVdEmY5O5pDHfF+hv/52
 J8MloYMfh5jgzoTQe1Vff52tGz7HaDPRVh0EymeZFOGfJRYLok0wltgGFJkq0tck5u3D
 8gvDr+aVQ0JqoB65ULtEKc4XPBQyIJuDs0RjlhM2eKX65+EvIezf1Y18nCBB9MW9A5I6
 29VJ6SKPVebNu+KBfl3Klhhwc/SVeqHpbE08z4T/fcNnViCslevAblVcOtaH5lpDwCOI
 dtvA==
X-Gm-Message-State: ANoB5pl8bTK+1dOBc3JMrHw6CzTxisoRl4YydpqK2PpvA9YPEnniJ2z/
 tVGtLC9QJVhSJDjGaQ7ZCXut7bp+X6ZJS67dkX0=
X-Google-Smtp-Source: AA0mqf6ID8aJdWw1lmYvkQCiyMNQUJ247TNVdNv3J+s9vSHGVjNI284whCI5hTFvJ7QysAI3d6Lvbw==
X-Received: by 2002:a05:600c:3d12:b0:3cf:7903:5646 with SMTP id
 bh18-20020a05600c3d1200b003cf79035646mr4539055wmb.24.1670578611703; 
 Fri, 09 Dec 2022 01:36:51 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 az40-20020a05600c602800b003d1e1f421bfsm7947819wmb.10.2022.12.09.01.36.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 01:36:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 0/5] accel/tcg: Restrict page_collection structure to
 system TB maintainance
Date: Fri,  9 Dec 2022 10:36:44 +0100
Message-Id: <20221209093649.43738-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Few cleanups noticed while reviewing Richard's "Rewrite user-only
vma tracking" v3 ([*], based on top of it).

- Move accel/tcg/ trace events out of trace-root.h
- Refactor tb_invalidate_phys_range_fast() to restrict page_collection
  to sysemu.

[*] https://lore.kernel.org/qemu-devel/20221209051914.398215-1-richard.henderson@linaro.org/
Based-on: <20221209051914.398215-1-richard.henderson@linaro.org>

Philippe Mathieu-Daudé (5):
  accel/tcg: Restrict cpu_io_recompile() to system emulation
  accel/tcg: Remove trace events from trace-root.h
  accel/tcg: Rename tb_invalidate_phys_page_[locked_]fast()
  accel/tcg: Factor tb_invalidate_phys_range_fast() out
  accel/tcg: Restrict page_collection structure to system TB
    maintainance

 accel/tcg/cputlb.c     |  7 ++-----
 accel/tcg/internal.h   | 12 ++++--------
 accel/tcg/tb-maint.c   | 33 +++++++++++++++++++++++----------
 accel/tcg/trace-events |  4 ++++
 trace-events           |  4 ----
 5 files changed, 33 insertions(+), 27 deletions(-)

-- 
2.38.1


