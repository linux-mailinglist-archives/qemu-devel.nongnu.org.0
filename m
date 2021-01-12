Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9E52F293A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 08:52:13 +0100 (CET)
Received: from localhost ([::1]:39816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzETM-0003CD-Gq
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 02:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kzEQu-0001Yq-OH
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 02:49:40 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:35656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kzEQo-0002fW-Vt
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 02:49:37 -0500
Received: by mail-pj1-x102b.google.com with SMTP id b5so1146879pjl.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 23:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SBBrdrqRqLZbtY/JIW+pUTNmAvBkkd7n15BhnNFw+y4=;
 b=pI7kkHAe/c4EvtE0mPNvfIpja6+0H40p5UHDicRON6OnfUp8WzSlYhfFciDFZmaq9l
 CBBZmoUEtuFXPrIk5bChO4pwq1UvaUr7GXCw6lVvbviJ7iia+UsH8gFI/oEavHrUYsLq
 Via3SDYb3DGEPPaVp6Vwnrwrurd0TLRBIxZqY3aJyqkVvXkoCLw1Yf6q4D4LGTWK7+m1
 7A/S5k/GAzO+YKfjAS8qjlUvjvEA0V8RrKDCio9qcgF69UI2mnFnLW+c+gXgoZh9rLFY
 9rN0xhHuCk4LRSY6QI5zIgvgfJNT2kxt9gvB/Lban8Kr40gBoUVu+m2UwgAcbNREz33v
 sf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SBBrdrqRqLZbtY/JIW+pUTNmAvBkkd7n15BhnNFw+y4=;
 b=l36FSJM7fHK3PFC269V3d/j/S0vtn2YkJN24j+kAbHneM6I7ge8kDU6reP8X+ppmFJ
 54Xqou+kN5fxRlCbu7+5k7eoM9xYddpyjqAonlZg8Cc2XWBwrOoTgxV6LZ9kJCmsldwP
 QV5l217BLGiyzy7Zsr0eoi5OPNUq2IYg+dHkJxWc8WFcyiIzCRcYjxXIrcjOgteEehqd
 omCi9qh24W+8dbLWs0XqXnEwYyk5v32vYH6YOMLyygZ+RiXGpzQ5WiCHMICXY/UzCGau
 6ujdJraCvGGZ4eVOPfPvV2DUXLNRHao7jIvNmPpg+/f1ytwkoLi4SmuCu+zM4nlF+HQ6
 Lb0A==
X-Gm-Message-State: AOAM531KfztBnpUAR6Nz8N6+MGrR6LzFwFsOgSgPRXv/HZrF+OGj6qZm
 kq6OiqR2dhYhzvlwkmrnd68aQA==
X-Google-Smtp-Source: ABdhPJzhdA0GolRi9PX5GJQIydHRWUAU+kRa0xSdGlMiSMe427zYTv1Qjzgtzs9Zm67c1hiQhojaVg==
X-Received: by 2002:a17:90a:4817:: with SMTP id
 a23mr3239782pjh.16.1610437772781; 
 Mon, 11 Jan 2021 23:49:32 -0800 (PST)
Received: from always-libai.bytedance.net ([61.120.150.71])
 by smtp.gmail.com with ESMTPSA id 193sm2144582pfz.36.2021.01.11.23.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 23:49:32 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kbusch@kernel.org, its@irrelevant.dk, kwolf@redhat.com, mreitz@redhat.com
Subject: [PATCH v2 0/1] add smart_critical_warning property for nvme
Date: Tue, 12 Jan 2021 15:49:23 +0800
Message-Id: <20210112074924.217862-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: zhenwei pi <pizhenwei@bytedance.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1 -> v2:
Suggested by Philippe & Klaus, set/get smart_critical_warning by QMP.

v1:
Add smart_critical_warning for nvme device which can be set by QEMU
command line to emulate hardware error.

Zhenwei Pi (1):
  hw/block/nvme: add smart_critical_warning property

 hw/block/nvme.c | 28 ++++++++++++++++++++++++++++
 hw/block/nvme.h |  1 +
 2 files changed, 29 insertions(+)

-- 
2.25.1


