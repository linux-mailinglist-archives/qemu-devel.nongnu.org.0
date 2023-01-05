Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C390C65E977
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 12:02:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDNzf-00080T-8f; Thu, 05 Jan 2023 06:01:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDNyz-0007qH-1K
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:00:48 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDNyw-0006I0-DP
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:00:24 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso1041027wmb.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 03:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KJQ8680IxbyL1j64vg1su0qOjoqZaqjJM20SITthiJQ=;
 b=zpdHReTVnX+aSp7nefKxjYbYZYVRBhFcpNTZbE8eFopIZn1xxQnJg7jrWaGntiEL8G
 mRURW/QFhRdiz07dlYLrznjD7XioBY8GI9bUyD19WLE3uUkFGrscfq8jE85Qm62phrsh
 0nPCTMv7pMjcwEsQvCp1jXBPVYMwq/G5jVaA99JtN6TcXrmPAE/Lk8TZxGux2nzbQM/O
 s6jWrSRFGp86C4pUjOUdYDo7+BoGMxCQ95hAC3nxO20E2Ehvr8JBnNjOKmODPsVVZIFw
 rb47axKKq+jhHli1W3ZvaAIVuGMye8gpZbRTWQLswZLmWMTjc0dvbe9Z7qafmP7VE9XF
 Iqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KJQ8680IxbyL1j64vg1su0qOjoqZaqjJM20SITthiJQ=;
 b=tL0secVoDMopAl6uFynZ2Lhd6eak7yOh8DQSy2EjfhL15Hx7eMh4ladW2hWyWEbM3H
 vtGAiD8+JJSMvM+ZIRqrAiW+y3kktL3S7YUPurxR7Rucver0mGOgUDW2QYbCkTUbILUK
 Q+x9HNBCjK6aYWoEKcPLiMxEzcd9nUuuqDXMAFy4BdUR6eGuB4JRZqExahArZgINPTKi
 u2XeSmeFXHl6zAkcx21BIp7huFVfVovzfNEwiHi1gUdNj+zmKDSPgrV04/TlHYpNHhlr
 fQltdMSMDRZU5vhFIHUkcPI6bYLhqLgByh5PKJC0GHRuhA/ii2IFJ9QlGqGMlQKKIXaU
 5M7A==
X-Gm-Message-State: AFqh2koBqViFIgviIF5XGVGRPTVU8BeBIMaw4KZc19Opt00Hkb+2UtEL
 wbmgHwCFLkOnF8llnYSUkEbPUg==
X-Google-Smtp-Source: AMrXdXsZOnPJBs9sgo9um2wt2IWuTNWOe9R9QKZ4PpQ3EUycoKbNIfvmegSSF8wD+SXMee6ImGJG2g==
X-Received: by 2002:a7b:cb50:0:b0:3d1:f882:43eb with SMTP id
 v16-20020a7bcb50000000b003d1f88243ebmr35587070wmj.10.1672916408684; 
 Thu, 05 Jan 2023 03:00:08 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 fc14-20020a05600c524e00b003a3442f1229sm2266258wmb.29.2023.01.05.03.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 03:00:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 844101FFB7;
 Thu,  5 Jan 2023 11:00:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/4] Some tweaks for semihosting-tests
Date: Thu,  5 Jan 2023 11:00:03 +0000
Message-Id: <20230105110007.1977399-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

Hi Peter,

I discovered that semihosting syscall support got broken and while
preparing to bisect I ran into a few warts.

 Alex Bennée (4):
       semihosting-tests: add timeout support
       Makefile: drop microbit.lds from the sources
       Makefile: simplify path to QEMU binaries
       Makefile: explicitly disable -net for our -M virt runs

Alex Bennée (4):
  semihosting-tests: add timeout support
  Makefile: drop microbit.lds from the sources
  Makefile: simplify path to QEMU binaries
  Makefile: explicitly disable -net for our -M virt runs

 Makefile | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

-- 
2.34.1


