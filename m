Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BDE626646
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 02:53:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otfgO-0003TZ-7d; Fri, 11 Nov 2022 20:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otfgM-0003TL-Tt
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 20:51:42 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otfgL-0005Ho-AH
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 20:51:42 -0500
Received: by mail-pl1-x632.google.com with SMTP id g24so5591158plq.3
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 17:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YIVlNLTwgWUsrPijf7k4up7dOlx2RuENq73N+ddWoBw=;
 b=G4iJYJba7z6EWptE/NY4+f8ditQARmzJtv93tAT46D18Y5vKlYvtK8FQ4vsf8VVu3A
 9JZpE+HyiO9nRZvgnuXKX4I+8bm+d4iy/pDff+BCvnjjmyOZQdEDgGcBo1w8/O9Y2S5J
 JP80ufQDfRZ2lFSD12Z/d0Nf93DAHu/tfysf2sPcrCMoRsWDzosKqhubwzaM34JrT308
 kTKpbWOChaUcp25W2v9kuo6DPmotw3iBUm+XtEh/olSv0k4Jg2IOGjtd1VqUxN1fJFc/
 qltQMYM2iYLrIGe6kfn2Z6jl0uA2Dbu+U7FK7x/ohsdj5uZ4X3AlUPWziQuEOafdE2Nl
 34LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YIVlNLTwgWUsrPijf7k4up7dOlx2RuENq73N+ddWoBw=;
 b=nJYkliMcNUqcmac0oIbaGZtuRKw8JPyEsZ9alPIdR89Czj8jlfr/4R8UJuMSl+vDSA
 vEYO9lLEwaBVoHS0xixB7iAY346/PKU0EwqgA/9IdeqwwbjzxGda/XeP5fjlnALeJmD1
 ou7gg+rWJISGQN7tXYkbBQlqZzPe95R/zkqtkZJMGBAzoA5cNCKMjGoUrN/1+y5Mt75b
 SwTbMRw8OVEKBhhp7muUkHxVof0maL8fk/yRHEPVwMhbrzzl/6ZXK5vRnjKlC6R/emwh
 xRwq7/aUR9IWAaT0dbYz7bZ5Oi8R9gUAWKP7RiNmziyDx3x4oqPJCOYICdK7BNwUhMg0
 E6ZQ==
X-Gm-Message-State: ANoB5pmaTyz6P7URjvEbkP9UziaetnPPo4scmlpWnpmSN9rzt9OhInvY
 +j4LYdaX0hKt8uj6Ti6R0sO4deEYImM1ouA8
X-Google-Smtp-Source: AA0mqf6Yjf7SlUO5PFa5nY/UmmtJftKsEVP7ts9AGviAFfH77mwBraQ6LlqafgcLuwPnA3FVtFMYWw==
X-Received: by 2002:a17:902:c60a:b0:17f:6e07:74ed with SMTP id
 r10-20020a170902c60a00b0017f6e0774edmr5040223plr.67.1668217899838; 
 Fri, 11 Nov 2022 17:51:39 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-6e1e-8b39-f1a5-d250.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:6e1e:8b39:f1a5:d250])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a170903110500b00174c235e1fdsm2365265plh.199.2022.11.11.17.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 17:51:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: gaosong@loongson.cn,
	stefanha@redhat.com
Subject: [PULL 0/1] Fix loongarch make check-tcg failure
Date: Sat, 12 Nov 2022 11:51:32 +1000
Message-Id: <20221112015133.2593661-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Since the fix has been sitting around on the list for a
few days, I thought I'd help get this merged before rc1.


r~


The following changes since commit 2ccad61746ca7de5dd3e25146062264387e43bd4:

  Merge tag 'pull-tcg-20221109' of https://gitlab.com/rth7680/qemu into staging (2022-11-09 13:26:45 -0500)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-la-20221112

for you to fetch changes up to 46b21de238c643ea098f2dcffe493abd135f7d89:

  hw/loongarch: Fix loongarch fdt addr confict (2022-11-12 11:05:52 +1000)

----------------------------------------------------------------
Fix loongarch make check-tcg failure.

----------------------------------------------------------------
Song Gao (1):
      hw/loongarch: Fix loongarch fdt addr confict

 hw/loongarch/virt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

