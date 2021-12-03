Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FEA4679AC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 15:47:16 +0100 (CET)
Received: from localhost ([::1]:48986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt9qF-0003el-4n
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 09:47:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mt9na-00026k-Gl
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 09:44:30 -0500
Received: from [2a00:1450:4864:20::32e] (port=40830
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mt9nY-00010P-O8
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 09:44:30 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so5045015wmj.5
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 06:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n0E2zKB0IP6dBPB91yi7clgYPhuSx9WI6z7N00/mqtg=;
 b=g03eNq/G6o0j+AYsGVNn0MRdc+h+xmYM7cDRmVc0IQPe/V0v7L/QAaZopjEpvuQjvS
 xyzDnzsDcY8PaJEdFQM+EqqkKXosCWEM74LkjF5OWKASjABP6uWDN90r/ToKRdZETa6f
 D+VtbsFw7YO7DlMldFqyAVP+YtmaQBX+N8R7TlH15nhL4rWNWzg8EDudq99bMzxXI13b
 Bw+qhf13K7SFUPGhm7r0KBKCh7HcySXQ1EJunsJZAPc7YahuhmHLXVyIeyHy3EDeJCgu
 cUKobg28vhCdDi6RMMXntIjDWo8XVeVI9+UZRVUFETK3BtEJWEZvEedXP1iAz92wmr2c
 4tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n0E2zKB0IP6dBPB91yi7clgYPhuSx9WI6z7N00/mqtg=;
 b=W8LX9QwYihRj6SpJ4ahSuuYoztCteEXYrefCPAHT5JPYTBWs2Wf2KB0DuP+DexlLX6
 oa3JKc3N6MzTGz9djDhCbg8uztl05FCCv8c19yAQNTBFyRMrKe4fsz3+YglXfoJn42sI
 e1Fx/Mo4laSSBmpWCc8WNCOQNF4i7vUgmFg3jkuhc4z2cNjfy22KjksgEGndZLiakDef
 HBThcgXisJWly+9om71XQvMmLKQmhgi7zXzULJY36dWvBHhdMGYicMncRr6DGYaZHKLq
 DDwiE5bIC/g8+Gh4z+323xtxKY05WkG4ZvQui2F/8tsUFvUNZtnrUoQCO0JaCvShatXn
 BWiw==
X-Gm-Message-State: AOAM531aWYOPCvLqMHAT7xj82UjVSofU3uevjEvZyUxEOiwomskDzRgM
 bSd/RLjr5UEJfd1LpalxiP2maQ==
X-Google-Smtp-Source: ABdhPJwqcSxdcRXlo9UrDkInIuF8vDEdfWrLjxUScp1A5RRKSHUnneVWMIk2zcl3mlPH9iQ2KjHqmQ==
X-Received: by 2002:a05:600c:1e27:: with SMTP id
 ay39mr15593679wmb.84.1638542663643; 
 Fri, 03 Dec 2021 06:44:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f7sm3337530wri.74.2021.12.03.06.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 06:44:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E836C1FF96;
 Fri,  3 Dec 2021 14:44:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH  0/2] insn plugin tweaks for measuring frequency
Date: Fri,  3 Dec 2021 14:44:19 +0000
Message-Id: <20211203144421.1445232-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: minyihh@uci.edu, robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series was prompted by yesterdays email thread:

  Subject: Suggestions for TCG performance improvements
  Date: Thu, 2 Dec 2021 09:47:13 +0000
  Message-ID: <c76bde31-8f3b-2d03-b7c7-9e026d4b5873@huawei.com>

which made me think if we could leverage the TCG plugins to measure
how frequently we these flush events happen. My initial measurements
with a Debian arm64 system indicate we do some sort of tlbi
instruction every 47 thousand instructions.

Alex Bennée (2):
  tests/plugin: allow libinsn.so per-CPU counts
  tests/plugins: add instruction matching to libinsn.so

 tests/plugin/insn.c | 125 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 117 insertions(+), 8 deletions(-)

-- 
2.30.2


