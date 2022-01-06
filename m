Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EA1486D72
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 23:59:25 +0100 (CET)
Received: from localhost ([::1]:53684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5bjA-0006xh-85
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 17:59:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5bhW-00050z-Bo
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:57:42 -0500
Received: from [2607:f8b0:4864:20::530] (port=43902
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5bhU-0000GY-VK
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:57:42 -0500
Received: by mail-pg1-x530.google.com with SMTP id 8so3845308pgc.10
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 14:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zo3FYMOIo83Psa9s5tlKpGQIkEMOehaZnQRMwEISvFc=;
 b=ggIQT4ihqwXDOYfeBEn+AbGyRirkiXNrAtaJonWGJu/o7RdrkKzFBKK8KaZzyzQVsU
 gqLrsfM6ehMKBjQ293HN9jFgk47Mt9Q/P2Bb4krpZ5q+brCERyJGR7uupAiPCSaLrkD/
 f+SsFBycdpAzvMdnkGGwKPjAcW56XgqtXczk6uduA/WcjAd4AJgZJd+VzLDsc+dFVFbH
 T1X+HmdJxRgDhbIUyJnuiea1goRkuuKP60pAL51++fptx4U7sdwu0pwbRSBENY3fcj9g
 kYdZtE27LIdgYIO73cE7LvDJ+exSgHX6uos6/TZi2edJF0A8A7kA6K2kK1cn+bRSR+GA
 ObxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zo3FYMOIo83Psa9s5tlKpGQIkEMOehaZnQRMwEISvFc=;
 b=VFMcTzNYW3gpBpyc1FbVObNbRLM1CA0kkmCGcO9VbB/7Z0PKVe8FY3C0lYVtGMzVSz
 TG+V2cuujIkNU1o5jArjaZhDAdQ8Wamo/guVEEjgUA3BWWfI6EBclD24dQzmuLVcwT95
 leSeZkQTkhKKn6hRBvmnnWMePf+OTi8tKqE3E8DjI08f/fd4otKnjIEBjC8d5xGVDKn5
 2JUlzQCVT47uFjUQpi8ZociFd4Sbl9e+fwF/Nct1qXu+9r5+d3ICp9iYAfE7dZ3YWw6/
 9dhsMpKpMJkTI4KjRQyPTkMbZfDGkcE9makf6wp/N4FYfXZczptZ0Cx1RSahxpzvPGN/
 X66Q==
X-Gm-Message-State: AOAM531YMvubuFPJ+l/mG/oU9kpzvDCKtSTzaoER4Q+xaUw1n/mZQNw5
 3QAu+xroV8i1sBzFnhT7b7U1e1P9TDm5kA==
X-Google-Smtp-Source: ABdhPJwUv3g9JLbyj/tRm4cNo7+c2t6Cj72ZBnlLeIl9KPAPQ29sNoHEpyasgSO63wS8wGaHOjfM+w==
X-Received: by 2002:a62:c103:0:b0:4ba:75b8:cf69 with SMTP id
 i3-20020a62c103000000b004ba75b8cf69mr61617309pfg.64.1641509859383; 
 Thu, 06 Jan 2022 14:57:39 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id rj6sm5774687pjb.50.2022.01.06.14.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 14:57:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] linux-user: prctl follow-ups
Date: Thu,  6 Jan 2022 14:57:34 -0800
Message-Id: <20220106225738.103012-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent, as requested.  I did all of the cap_task_prctl options,
and fixed a few existing bugs with PR_GET_DEATHSIG.

r~

Richard Henderson (4):
  linux-user: Do not special-case NULL for PR_GET_PDEATHSIG
  linux-user: Map signal number in PR_GET_PDEATHSIG
  linux-user: Implement PR_SET_PDEATHSIG
  linux-user: Implement capability prctls

 linux-user/syscall.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

-- 
2.25.1


