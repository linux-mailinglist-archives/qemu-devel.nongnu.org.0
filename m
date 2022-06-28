Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E32D55C08B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:05:25 +0200 (CEST)
Received: from localhost ([::1]:44794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6924-0005wy-MB
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o68xo-0002kO-B5
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:01:01 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:44939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o68xk-0007k4-Al
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:00:59 -0400
Received: by mail-pl1-x629.google.com with SMTP id l6so10715939plg.11
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=joIvObiOirKSLFNI/hnI0b5hmcSYOKECnKpfxO2cd+w=;
 b=Qoq36cXmh9/oA0ssBS0OUQZZT5VoY9ctxY4eOLsQmRt5CWwMXny+pS+ggMxgHC1gdw
 7bzhp0e+s6d+DjiZyrXJ++5nO9+K8KkecTCyRgJJJysK2qhzt9N23eS2JH0fY9NDLNsA
 eY2MQ8FGM2kLygplXX4Ax1s8vdea3bmg4dQKBneec0E+6+kWqKoRHhxy1kiVKH4dVUW1
 FIISBoIx1aUqyGbxuJOsUT6K5YEhcukfAi7JTgS1U3L1hwu8lw+th5s8nqROlgeu98uK
 X3s36SvsSuZazt3ksiQTrCkDBT/jE6BX7V1KmYm7OLBlliyFyVgyGGEm5T8Wwko/h+/e
 l7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=joIvObiOirKSLFNI/hnI0b5hmcSYOKECnKpfxO2cd+w=;
 b=PUht7Ib/WBjraMrzg/TNtkbFzl7kH52FaxkhX0TVvL/ou/C1Gjzl4PMQ1+kFDr9VEZ
 K6fzDb/tMNIHL90lIu2UKmfyH2FBwni12sTgvG3yKpSgsroItc0KCynPENWHQSQU5P/w
 8XXWRfkfL0CJklwQJ3e2znWmETbAsiVymPnv9dUd3/j4zdcYkk6H9rjTjAew5/blyjVf
 Z5wby+TNs6x+DoBJ3dKmYaerZSFfEBoPuCJAjLgVXuxAyRsvitxNr1RtyuEZItDluu5X
 xzX3Fmu1cmwpgxgKkkYOw9AOASa7A4/XydPu8P0SbuEtIKdydv990M0ysZW0aQPMkTHi
 Hv9g==
X-Gm-Message-State: AJIora8JvMN8OfsuXJpI1CSjhpZ0VWMpemix5ComldZJSuoXgzgk7rPb
 C9CsGitTd0BlpEVyPW8EHpPBkB3fBaB/RQ==
X-Google-Smtp-Source: AGRyM1scaqfDSALQCb1iQtSAxEeKyGWqUZUsByuOBhRpuLjurzS/eGe5e42S+Sl+jokp3KgV4zR9CA==
X-Received: by 2002:a17:902:ebcb:b0:168:e3ba:4b5a with SMTP id
 p11-20020a170902ebcb00b00168e3ba4b5amr4408626plg.11.1656414053638; 
 Tue, 28 Jun 2022 04:00:53 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 p22-20020a1709027ed600b0016a0fe1a1fbsm9044501plb.220.2022.06.28.04.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:00:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v5 0/2] target/m68k: semihosting cleanup
Date: Tue, 28 Jun 2022 16:30:45 +0530
Message-Id: <20220628110047.666612-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Changes for v5:
  * Rebase on master, which includes all prereq and patch 1.
  * Split out errno remapping to a separate patch.

r~

Richard Henderson (2):
  target/m68k: Use semihosting/syscalls.h
  target/m68k: Convert semihosting errno to gdb remote errno

 target/m68k/m68k-semi.c | 306 ++++++++++------------------------------
 1 file changed, 76 insertions(+), 230 deletions(-)

-- 
2.34.1


