Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54B0320164
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:35:09 +0100 (CET)
Received: from localhost ([::1]:58550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDEMe-000234-U6
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:35:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDEKO-0000SG-PR
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:32:50 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDEKK-0002eP-4L
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:32:48 -0500
Received: by mail-wm1-x335.google.com with SMTP id a207so8961743wmd.1
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 14:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gKCfUeTiGhUiIa4EK50I0WQCrPu4LqNrNEATOG66HhY=;
 b=ZaR0xs0r3WXgs0W3BlkNNAhiT3asx3iZG/TDxu9xopEFsgxqp2t0AABxnGSBzVaMKa
 RBS3IFD/3yKqTP88fDfmw8nz6vNml2/VK3JEZYpTyZL619xjVNLPLz41TDBef9yfR9zD
 RDxRf5qsU1+C3J7JyTgiXooH+apjJOEx0DZKRBARbn/MPdeCzpa1S8rFDKpzJYCXA5ph
 uuwlDd5Z8/hGb0qY/jsD3FpdbBBv6i+1E6Iyp/pfjXacTl7nNyLuz8y0QiworA1wKSZM
 mS8MccCxEnitH8tjWKHent4WP3Acy+bTUMrg7FS/71VlTWWBLXuSrs1gYktojUSB78Km
 XsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gKCfUeTiGhUiIa4EK50I0WQCrPu4LqNrNEATOG66HhY=;
 b=kq4WJKQLFP/Ew+RrLt8BjYDpnF/p9xkdVG0VLMYleBfQLjGYi2Gr8vIEuH9esmGdtX
 AdEYY8jfJXIF0zIbVe9cEVvy8TEzSYDS32ZxlV99eK1g2oFffsRGUiFWdygvs+fWaEKq
 B40D0qIcPMkwxbNarH7SpzPjoOqviGLS1MXy6JrFz+QBMQnl5Q4CiwlR7ZK6CIRKdxGa
 K4ezDyVldHc3imOsf5O+Rm3o4NpjRzAne8nh/VZtsdiN25I4U1T+0pQvxqWhgbyAZgU9
 GJsEtIcjpCrDfbuiiJeTn0qGJyiw2uP1PZ7bUIY3aqzgfg+r0kw1PXPOkso/aRDgxZnB
 PbVg==
X-Gm-Message-State: AOAM530kv+G5LA/MsYka0iXDr2UHY3qPrVxqR2KjigVTPoAgCWhPHDAQ
 uGFy4j+eFx9e06YHzU9plsfVaPybiOybow==
X-Google-Smtp-Source: ABdhPJyE3HNaoNVFS5t3Cint3V16DJldKDjoki1vKkwvmf0DCW43Lo2sVlbVh7+hdju6xo6qLQEovA==
X-Received: by 2002:a1c:2ed4:: with SMTP id u203mr10119400wmu.45.1613773962788; 
 Fri, 19 Feb 2021 14:32:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t15sm13370654wmi.48.2021.02.19.14.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 14:32:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/timer/renesas_tmr: Fix use of uninitialized data
Date: Fri, 19 Feb 2021 22:32:38 +0000
Message-Id: <20210219223241.16344-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchseries fixes a use-of-uninitialized-data spotted by Coverity
(CID 1429976).

Patch 1 just tweaks some constant names for values of the TCCR.CSS
register field, since patch 2 needs to add some more defines
for the other possible values of the field.

Patch 2 is the bugfix proper; the use-uninitialized happens if the
guest programs TCCR.CSS to values which are either prohibited in
the h/w datasheet, or valid but corresponding to behaviour not
currently implemented by QEMU. (Yes, I could have added LOG_UNIMP
and/or LOG_GUEST_ERROR when the TCCR is written by the guest; it
didn't really seem worth the effort to me.)

thanks
-- PMM

Peter Maydell (2):
  hw/timer/renesas_tmr: Prefix constants for CSS values with CSS_
  hw/timer/renesas_tmr: Fix use of uninitialized data in read_tcnt()

 hw/timer/renesas_tmr.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

-- 
2.20.1


