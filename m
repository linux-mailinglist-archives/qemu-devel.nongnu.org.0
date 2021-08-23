Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504883F4E6F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:33:50 +0200 (CEST)
Received: from localhost ([::1]:33540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mICtR-0002qi-DN
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mICr2-0000hX-Ls
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:31:20 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:52021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mICr0-0008Dx-UR
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:31:20 -0400
Received: by mail-pj1-x102d.google.com with SMTP id oa17so12343734pjb.1
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9YhbKwcUIZlKjGGWVi9LMyqnGm4JxOOty0zVYcxDAZE=;
 b=h2J3IlMyjH9ZkP2gtGlijdCb8ddrBoG4sVMzTr4Zwoj5Odz8UAOA6kJPLLqcY+y9T0
 Gq2Qf/5R04P0l4nArWXfqnRRd2b5xMfHsx5ISkVjG/RfzkTYTToikdxOisFdJcPJ4NpK
 kCuWLRK+CcYK6Q8EuE6/x+Bdg3qqJz1TKiiJtaABXSVL4pkV2y/Xoem2myVwEW8ZjJG4
 lBvnGenhn6DEjnVb5ZBXIGmr2NuenLdfgsayl0iN+MYz8KUQHUk0IpF4sDzOps661V8S
 +I1e/KSCa6yEzHSG0ZuqcgNUYIUdT98GLL+X4M9RohvyVgomL/Zz7zgrdJxaFrj/jyox
 MJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9YhbKwcUIZlKjGGWVi9LMyqnGm4JxOOty0zVYcxDAZE=;
 b=O4zLAOKFFtE0/XTdW6cyQ950GnSM3OFYgpM+t+0aq6MSE+U3adtQpzeJMkiWwFznH6
 Mhz2LWnZFr/ZCVu7ruV3rlkYssYM6krd0Wu7D72vzLONIoOZUUmNDIDvXYSJmS7/VJfA
 K6Yyh3GznWXp0witezBsTsxWBDJ10N/1W1RB49jOGo1sUbqJfsHzyPwERcdghy+eoNgO
 27yJpkJ2xBfZthEqrLbSdbo/QZUEC6kBNLAbtcMiswjzXX5dVXLFvhWRrXfdKUfYB1IF
 BNvKX1QiC/GGhzquphaibjlvDDSFsVk91ysohoMMxHCt1o+gmA4nVerXIJTHXEj63t99
 1xzw==
X-Gm-Message-State: AOAM532JbAeXveEJI72HzSUS1PfWUfGY2YTwGqlmdmec8RHy2im/5cAL
 lzKyB2qhSzrXrESy0EqAqzOLPuWPzmQ=
X-Google-Smtp-Source: ABdhPJwzAgf1/3PoEuE9eNqlN/8AvKLQBB+yrDkPfU+ZBjownPV5cyGou/NKLYXmTXgJEF6VPtn8Zg==
X-Received: by 2002:a17:903:310a:b0:133:9bb6:98bd with SMTP id
 w10-20020a170903310a00b001339bb698bdmr7342299plc.19.1629736277424; 
 Mon, 23 Aug 2021 09:31:17 -0700 (PDT)
Received: from localhost.localdomain ([120.138.13.180])
 by smtp.gmail.com with ESMTPSA id x19sm16371243pfa.104.2021.08.23.09.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:31:17 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/5] python: Add entry point for aqmp-tui
Date: Mon, 23 Aug 2021 21:59:36 +0530
Message-Id: <20210823162938.32757-4-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210823162938.32757-1-niteesh.gs@gmail.com>
References: <20210823162938.32757-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: ehabkost@redhat.com, kchamart@redhat.com, jsnow@redhat.com,
 armbru@redhat.com, wainersm@redhat.com,
 G S Niteesh Babu <niteesh.gs@gmail.com>, stefanha@redhat.com, crosa@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an entry point for aqmp-tui. This will allow it to be run from
the command line using "aqmp-tui localhost:1234"
More options available in the TUI can be found using "aqmp-tui -h"

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/setup.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/python/setup.cfg b/python/setup.cfg
index e9ceaea637..0850c7a10f 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -66,6 +66,7 @@ console_scripts =
     qom-fuse = qemu.qmp.qom_fuse:QOMFuse.entry_point [fuse]
     qemu-ga-client = qemu.qmp.qemu_ga_client:main
     qmp-shell = qemu.qmp.qmp_shell:main
+    aqmp-tui = qemu.aqmp.aqmp_tui:main [tui]
 
 [flake8]
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
-- 
2.17.1


