Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417034AAEE0
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:43:10 +0100 (CET)
Received: from localhost ([::1]:44802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGf0f-0007jO-4U
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:43:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGepg-0004Sd-Jx
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:31:48 -0500
Received: from [2607:f8b0:4864:20::634] (port=41595
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGepe-0002NV-7f
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:31:47 -0500
Received: by mail-pl1-x634.google.com with SMTP id z5so8977768plg.8
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 02:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iKJm0IpOkcnRYB0s3KIyaoPI0zb//uzQf2U9DPVQ+T0=;
 b=WPAEktbY8GClMKkoAq4rJ7FnL0mUegY2IZ+jTg38cjT7ZWaDmLFUb3nLWiPqQHXlWN
 Dx4z8LQAnMMbK1j/rC4efbMwsRHKSzreQUyMEL7iW7T/ux1SLlN1XrUS8I8uEgVFHpvR
 2kEfPzgTKSNpeb0YJK/l/tiTO94uw0PGMA+XraBBXY7k0gmC20ENP8hjyWDQJMb812KD
 y2sopWqQXybzOo97/1fTK0pCAR012JjT3Z/PkjUKxM3WOfjJ2d7grJ0xsKXbmrIKeYOt
 uv2qeuneVLdu+2JAvYCr7Q9a+fMlpK9MIKzwr6mG2E5d4tb7cH2CAAilIQxXavoXZTDq
 aZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iKJm0IpOkcnRYB0s3KIyaoPI0zb//uzQf2U9DPVQ+T0=;
 b=HC98yvzZlscHq7hhp6a32yFxjCHIimdnl49AzaiQzAVd8Fmgdf9tpfcix7UWP+kRTZ
 +MICD1uLVnr1nOLjTrvg/jA6YmLEkEV7d/cMvGxkQ7XwI7+7mdnwmkBgdLDu4cIQfQ1u
 K+8TfiFHhoR9xTyiDZ3h/h66+//vqe+I/SwtdZkHlROC9ssA/KCJ69PUw6PSGXdqeWSh
 e4WsdkPWw30EjmVCqTcipbl0NYY9BnjO0lUuUSwEVbPI73I1wwvIXXYPz85HBLiXzub3
 xcKbgzKftArl/0JPH6vlfByCebWqiqwnapBLC8oloerWAHLKq1JjKSfpAwYG9bcLGMz5
 pqSQ==
X-Gm-Message-State: AOAM531Zouqpvge97J83eSeCSlmrzR+xs+Mm80hCNtzIXYQOPO9rRG3p
 L4vRF2OtanLUfLWRvGz+OSj+Tak7GDpNhuEN
X-Google-Smtp-Source: ABdhPJxfadY9LX1TAf0BL8+w7k495w3Tibo6eFq8giHWjC8aZ/vagA6GzX+Y3c+eT56EKM98OQrikw==
X-Received: by 2002:a17:902:d4c2:: with SMTP id
 o2mr11422917plg.27.1644143504552; 
 Sun, 06 Feb 2022 02:31:44 -0800 (PST)
Received: from localhost.localdomain ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id s2sm5605937pgl.21.2022.02.06.02.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 02:31:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/6] tcg/sparc: Unaligned access for user-only
Date: Sun,  6 Feb 2022 21:31:32 +1100
Message-Id: <20220206103138.36105-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes from v4:
  * Remove assert from tcg_out_movi; rely on the one in tcg_out_movi_int (pmm).
  * Finish conversion of patch_reloc (pmm).
  * Simplify unaligned access loads.

Changes from v3:
  * Rebase on master, two patches merged.


r~


Richard Henderson (6):
  tcg/sparc: Add scratch argument to tcg_out_movi_int
  tcg/sparc: Improve code gen for shifted 32-bit constants
  tcg/sparc: Convert patch_reloc to return bool
  tcg/sparc: Use the constant pool for 64-bit constants
  tcg/sparc: Add tcg_out_jmpl_const for better tail calls
  tcg/sparc: Support unaligned access for user-only

 tcg/sparc/tcg-target.c.inc | 310 ++++++++++++++++++++++++++++++++-----
 1 file changed, 273 insertions(+), 37 deletions(-)

-- 
2.25.1


