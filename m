Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BD84E7A86
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:56:50 +0100 (CET)
Received: from localhost ([::1]:52530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXq3F-00084t-Rz
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:56:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpzX-0001ty-U7
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:53:01 -0400
Received: from [2607:f8b0:4864:20::233] (port=41828
 helo=mail-oi1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpzT-0008NZ-JY
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:52:58 -0400
Received: by mail-oi1-x233.google.com with SMTP id e189so9283994oia.8
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 12:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XB9YE42jYN/R7Zfg1GOSKddGylx8gPNojaQcMJaEyIQ=;
 b=ULou6J53KY9SzbC2AXS3FNvu1SS87xPmFoI0BdxPj2GkbYy8CWkx51jJ1zIIPT6cYV
 IVC9tuUdiMfTkR7bI+vvm3uLDZsHSc5uFw3EIrwfYRhni04r33qq36x7Ncpj172iE29W
 jkSWneTlBr2ua8oELI6wGyq48id3P7B3dCHuuLcRJjXIN7lyQR3DO/NQzf37jS2aOrq5
 cql5rwsoWUxlrBYHJQ7ONX9AZj3nbsJWqVa4vp/9lj5nn1qqdNhbp6j1trlPxxHyjcN7
 eHp+WTMWV3ZjTAge4K3rrHhPlZLehhd0VWMs6KycvcLN4lLwW6tHbstogIMztFHaF35H
 wZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XB9YE42jYN/R7Zfg1GOSKddGylx8gPNojaQcMJaEyIQ=;
 b=oPpxVbMDxOtSd8pXBaxZOtvNuRxBYW243Tc/MtG3OpGiaJwYUpj1N1pwDEjpntIR46
 DySP4Af6B9uwWlFvj20Y0fExLvBCYeNkCzYrjZiKQey36BMB6mUdv5oHA04Jaic/xWo4
 rNdcsWl0iGW249ca9zHTtlcqPCo4Ehp5Xtq/yKv9SNb9TL9FKltxstlBkEwT9zUgNUAO
 P6uAJOErWxiXPEquenokKbkEcMzNTkXjPdzPgonpaX/vpHgG3w8ZHdsfEIuhwZqsYfTI
 6Fv54OZIp9IV3ds91IqL448FlzHzhBb6tjHySbPNdJ4XSInk7VWpsT9Xts8Dlez9s2Lx
 dBCA==
X-Gm-Message-State: AOAM5315qBAIir2OKAsU5oFH9nO9Jct+Mg5qpGpJUWBKmFTCZjBivb98
 AAIENA0p5hlsTKHH99tgH2iMR84m/iUsnM7nkWA=
X-Google-Smtp-Source: ABdhPJzOSoryGWuN09uucbf+xrKQoTG7A01KoXIo8bVvxvBA08fEH1ovL85R9yWljGxvWrCmdZ8zJw==
X-Received: by 2002:a05:6808:ec2:b0:2f7:34db:691e with SMTP id
 q2-20020a0568080ec200b002f734db691emr1604982oiv.252.1648237973292; 
 Fri, 25 Mar 2022 12:52:53 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 ep36-20020a056870a9a400b000de98fe4869sm2153730oab.35.2022.03.25.12.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 12:52:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for-7.1 0/8] linux-user/nios2: Fix clone and sigreturn
Date: Fri, 25 Mar 2022 13:52:42 -0600
Message-Id: <20220325195250.386071-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::233
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These two syscalls are the reason that the generic linux-user
tests were failing, which allows us to re-enable the tests.

Changes for v2:
  * Hoist the pc advance to apply to all EXCP_TRAP.
    Fixing this properly requires larger changes outside of linux-user;
    deferred until EIC patch set also committed.
  * Treat ret < 0 as error, per the kernel syscall path.
  * Return ESIGRETURN from badframe path.


r~


Richard Henderson (8):
  linux-user/nios2: Hoist pc advance to the top of EXCP_TRAP
  linux-user/nios2: Fix clone child return
  linux-user/nios2: Drop syscall 0 "workaround"
  linux-user/nios2: Adjust error return
  linux-user/nios2: Handle special qemu syscall return values
  linux-user/nios2: Remove do_sigreturn
  linux-user/nios2: Use QEMU_ESIGRETURN from do_rt_sigreturn
  tests/tcg/nios2: Re-enable linux-user tests

 linux-user/nios2/target_cpu.h   |  1 +
 linux-user/nios2/cpu_loop.c     | 27 ++++++++++++++++++++-------
 linux-user/nios2/signal.c       | 19 ++++---------------
 tests/tcg/nios2/Makefile.target | 11 -----------
 4 files changed, 25 insertions(+), 33 deletions(-)
 delete mode 100644 tests/tcg/nios2/Makefile.target

-- 
2.25.1


