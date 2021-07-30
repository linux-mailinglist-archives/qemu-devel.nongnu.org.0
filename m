Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB673DBFC2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:25:02 +0200 (CEST)
Received: from localhost ([::1]:45748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Z41-0001cP-HQ
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9YyU-0004i2-5d
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:18 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:55810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9YyS-0000v7-MQ
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:17 -0400
Received: by mail-pj1-x1029.google.com with SMTP id ca5so16808090pjb.5
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nZM4J6JiCIrfL4/oLzRMeJRNaEbQ96TGbVpQWlNgGI0=;
 b=Ojlc1O0NzLFSLtLBE0JNceI71q+paL7lvyx3+5B3CDDCp7lPf2sbkotXLEV9AhHeBX
 XKD0nSUqdord8HpeNg48n2lj6rmlj2AuWmn1c5VTRFd4469Ey7vyV6/fieFTPfYGsiZF
 UkldATYD6OoO/vaAz9KdfgZJkNfqkqfdhP/1BWQT/vV2zrrUVUlQIpfWomwlwQMjkg/b
 i9aVLpJN7wSw4Nfz21iQbx0hSEggk3X9aRvAKFOU50pXGUzWmTF1dEYs2jcpjNHioZBh
 szLmVQDB69bJEUoP1UrOCZNq4D982JKEaiQu0Yk4/ZiSDa/WJnRRww6uIqomGcI8+uQO
 aYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nZM4J6JiCIrfL4/oLzRMeJRNaEbQ96TGbVpQWlNgGI0=;
 b=IfnPP9nlrWRTRc8dlXQn3Y/ktl+JvslR2XuUhtCw04l3CjlnNHqhpX3CJndj+kBDB4
 Rxa8U4kTX/AeQ/x7YBb1yeQBsAIZW5ZW492pU0d+CCEgjy8Culr4JQ+gNhasPiHlIzQ9
 8HNV9/ihZONvwkAZTHCqx1UMaM8Sbx1iobdRgSdqbJg4jZ9iA5FBBnMR9BopV3sqUGPT
 urwHRHgH5ysV8SDrBChHwd9YeL0uBmq5j7GYGuI6Kppmn3Qih+s+ShgXATQnXF30fqpS
 uw6n+F1wP2viynIgPBC89fRu2DlpDaki301z24bON62dKX8eUUjiTmzI7g0dAtHes2rN
 IgAA==
X-Gm-Message-State: AOAM532TtmWaxULmbDrIuN3/RP0pq3b5kuu/ZRycaFml+XWbVZmURbcL
 alxOn+6iwwqqoq3EIuMNEYajeH6ZIm1y0g==
X-Google-Smtp-Source: ABdhPJyehhd03OpJvGCNGEBWjWsOJVL8ATsIIIkUIav48Xpby3T20fd9f0jKTohjrFrWrxW8SUxN9w==
X-Received: by 2002:aa7:8246:0:b029:39a:1e0a:cd48 with SMTP id
 e6-20020aa782460000b029039a1e0acd48mr4648658pfn.14.1627676355252; 
 Fri, 30 Jul 2021 13:19:15 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.243])
 by smtp.gmail.com with ESMTPSA id s50sm3256842pfw.212.2021.07.30.13.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 13:19:14 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/13] python: add entry point for aqmp-tui
Date: Sat, 31 Jul 2021 01:48:38 +0530
Message-Id: <20210730201846.5147-6-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210730201846.5147-1-niteesh.gs@gmail.com>
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x1029.google.com
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
index 50f9894468..8cd9ac0d81 100644
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


