Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E048664F44B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:55:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Jbq-0000L6-IT; Fri, 16 Dec 2022 17:55:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Jbk-0000Jz-U7
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:55:12 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Jbi-0008NR-7V
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:55:12 -0500
Received: by mail-ej1-x62e.google.com with SMTP id bj12so9372586ejb.13
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v/YOV179n9CJl3E8APthvcSa5yzKT5bj6FVc9BAjukk=;
 b=fh7WkwcZfQc1Ki+wwx5L/2nuYN3JkcTXqFnmnEjndqp/p+5XKvtrHXNwR0iQ4CiPK6
 BRiLVWg36eWFaa40OQ5MIt81dO1v71B0c8bue/L0fSCobhJ4TqzNbu3bqhaigyTi7HeH
 LWPNn2fch99FvG/+McIa9W6h+gFmgEqlTt3T2OHUKVphbBhsRz4px4vu51Y4pNOrp/2M
 cLtOt88n7WQIDskAijY6zPI9ZCMJRLe5epwvnSCVc3T/k5Pq/DhDuZxpGyNF4pe+a39d
 RKbHiDXhKUNzBXEOnpewQL0GtQGOZjwk/P6dfQKo3P1WoDg42AWlBMKARmq0v7fuX8bW
 XT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v/YOV179n9CJl3E8APthvcSa5yzKT5bj6FVc9BAjukk=;
 b=HKfwCPWWI72m1qThqJUKFlt83HVJA3aqeNJ94GEdoPN12LqI3/pwiedqQ8eu+Bzh0H
 bpyYEPcXnRtkzewnb5SD7dWstWrvSf15lflN5JJggS9EjNsvEBoo7VU6aVfb1M8C6kXe
 ZERX5EsQxfDFwp5cynmepiNwoeIvAqYcPSSm+KV1s4uo9OHbV/D37/j+X7y+HS2tt+Pj
 5s6QKO4iETyy+bnjDTNZNpj6DoUPKuEmPEWFZIayHxW7Mr9keFocWc68dEcY/tccVPwU
 FsZgptwdgj8fjj6LzB/OIQdEzOOXrOUSub5H52oFpg8ttS/n0BHb6SAHVoheovArh5Sr
 K+Iw==
X-Gm-Message-State: AFqh2kp6iIVGk8vW3r1tNEftpRWKmx1V/+UUN8zgd6mbO9XpMjcPT8Xq
 ieJOmZScFJrV77bpEXAaPinVzJPyKRuu2M4+1/A=
X-Google-Smtp-Source: AMrXdXv3yW7pH0MQTx2jABdiFzV7ZOaOM6drfLC4o9mvCJZyDFSZyTCKvCCGiYQTFRYcvqUWmccSgA==
X-Received: by 2002:a17:906:9f26:b0:7cd:dbe8:e4f7 with SMTP id
 fy38-20020a1709069f2600b007cddbe8e4f7mr8861349ejc.77.1671231307564; 
 Fri, 16 Dec 2022 14:55:07 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 26-20020a170906319a00b007c0c679ca2fsm1306174ejy.26.2022.12.16.14.55.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:55:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] scripts/git.orderfile: Display MAINTAINERS changes first
Date: Fri, 16 Dec 2022 23:55:05 +0100
Message-Id: <20221216225505.26052-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

If we get custom to see MAINTAINERS changes first,
we might catch missing MAINTAINERS updates easier.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 scripts/git.orderfile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/git.orderfile b/scripts/git.orderfile
index b32203b710..8edac0380b 100644
--- a/scripts/git.orderfile
+++ b/scripts/git.orderfile
@@ -9,6 +9,8 @@
 #   git config diff.orderFile scripts/git.orderfile
 #
 
+MAINTAINERS
+
 # Documentation
 docs/*
 *.rst
-- 
2.38.1


