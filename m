Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FD73EB75F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 17:07:08 +0200 (CEST)
Received: from localhost ([::1]:58716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEYm3-0004Iw-Qd
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 11:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEYkC-0001fv-Jv
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 11:05:12 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEYkB-0003Re-5Q
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 11:05:12 -0400
Received: by mail-wr1-x431.google.com with SMTP id r6so13754541wrt.4
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 08:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3FVRmcTzegrZx+hw8O+KmFS4HkMYUn5khuNNurixAI0=;
 b=VjA6Nevi5hk1gKIAQtlvoA76rmOxnJG05s4xwvX3es+NqLEFZbFOwkDwxpT9mFEjg4
 tO4qIGsmq5m/d9CBPKAiLhZ3552u1nqvNYHEYKjNv05Bn/1UBZOCcM02N1dQmu6M1dO9
 rLOI9ikqKuZjNptRL1yTD/OiVRZoAITmtKEZ/PKct8Qjyyjz7CtnTb4FJznCBtkyHQ8f
 lwK6uaJDjHzMwD1JNYMHKtE/ucYtD2fg/DiShO4ykFAmHFP/Zk7ETisG6Pmo8wFCJ/6m
 eFwL6GKdw6rA0vvZ6rHs3aZV72y99BfaNDCmofcRaGHV6SONjM2Nj0VwRTwFbvK6EpCt
 4iNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3FVRmcTzegrZx+hw8O+KmFS4HkMYUn5khuNNurixAI0=;
 b=e8a1DY/yDeCpLL0p/AoFWvQtL/0vaP8EVS+6C8NT5fG/TuUmvAnLOuIAyy+T9k/ZRQ
 dX+67LebvmQPny3Q5+kMTt5CmlvLsQlxTyoREql+0NfJnIkIIwcQ18bcZtmFo/HZxJNc
 7JkEwXZWk9A7o+csE01RBNyhbYxkCCgYPq+qrQny4XkjwHxCD76xd66EHUCpzmhhEbf1
 U/9PbyOP514G2o2mmR5wvejLfcIHxHGZMcmpjoQEq1TYFcTAsxkd9P8lgQkwj4P7loUm
 Y9u5OMc+fLwYUF+PWPnOpkzonkYulY5pANtVNwUDHRnP/cP0bKTAPt6V4wczB39KiIn+
 3JrA==
X-Gm-Message-State: AOAM530bCaCrV9PFwxvZYl5K3lmox97jUunmdGrGihNiOwxDzPiGty9g
 BPKYFeuEpM9736NmDkuPIT5zPXmnrmkyTg==
X-Google-Smtp-Source: ABdhPJwn72+SHIAcM4uD/i/9NpD/So1KcMC6tFbHLEk4RqxzOAuUY8RgZC7EymEKGMbysJMnVXjTZA==
X-Received: by 2002:adf:d23a:: with SMTP id k26mr3713447wrh.293.1628867108943; 
 Fri, 13 Aug 2021 08:05:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h9sm1836361wrv.84.2021.08.13.08.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 08:05:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 0/4] Zero sockaddr_in when initializing it
Date: Fri, 13 Aug 2021 16:05:02 +0100
Message-Id: <20210813150506.7768-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>,
 Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The POSIX spec for sockaddr_in says that implementations are allowed
to have implementation-dependent extensions controlled by extra
fields in the struct, and that the way to ensure these are not
accidentally activated is to zero out the whole data structure.
We have several places in our codebase where we don't zero-init
sockaddr_in structs and so (at least in theory) might run into this.
Coverity spotted the ones in the net code (CID 1005338); the
others in this series I found by looking at all uses of sockaddr_in.
(The gdbstub patch changes also a sockaddr_un use, for symmetry.)

Thanks to Eric for the analysis of what the spec says and why
Coverity is correct here.

thanks
-- PMM

Peter Maydell (4):
  net: Zero sockaddr_in in parse_host_port()
  gdbstub: Zero-initialize sockaddr structs
  tests/qtest/ipmi-bt-test: Zero-initialize sockaddr struct
  tests/tcg/multiarch/linux-test: Zero-initialize sockaddr structs

 gdbstub.c                        | 4 ++--
 net/net.c                        | 2 ++
 tests/qtest/ipmi-bt-test.c       | 2 +-
 tests/tcg/multiarch/linux-test.c | 4 ++--
 4 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.20.1


