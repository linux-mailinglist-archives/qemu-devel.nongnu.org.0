Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEC438F200
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:07:07 +0200 (CEST)
Received: from localhost ([::1]:57114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llE2k-0002MZ-Mj
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeQ-0004o7-9i
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:58 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeI-0004LT-Fu
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:56 -0400
Received: by mail-ej1-x633.google.com with SMTP id f18so12624017ejq.10
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wULB0dT529terV3VemdiO1RbK/5UYU6YHyBr4JHxFbU=;
 b=mIE6nmxjwT50+xy58ba/L1HWXFR2FvOaWppFbmwuciJwMx2+Ob4rJqVjqxNal5UG18
 VI1Xf4HrC/L91h5F26yPjrSyeQ9L1LQktDRC8jEoj15f2vTR3njR4g1O8EzAmN/8nwvX
 i/8qzMm5v2JzCMNtP0JagEI0iSFD07axbTgBvAF7GfIUL2T0jljMSPGPugcahmWfEGet
 5mDZ5I45/RU5IisRY301ijqxTbg1VvbuNTK3zcQ/k6LtxkIhnSGRnOli86+KY1V47B1H
 ZcaYQtJdCOuuBGKfcNtNZ/avVh9WiJSOMAGBrSoPLPKFbayDBb7nIS8LtafJf8K79h2y
 nspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wULB0dT529terV3VemdiO1RbK/5UYU6YHyBr4JHxFbU=;
 b=Ex0Z6V41WCaSaEGcaxN5hR/XlNogkZcCRAGDBTkVZozWU1ybaBGSv8khzbAL3jJaPe
 mX9PhxKhxlJqlH5sVA2J5RHSfek8COFtEv+oBl45HUpk1MyPHnPrMOmhqo3NkxBwzlnI
 3+ae984b+xYi27TpADbL9YbEjVfbP0iFVPlsUIsIPUXLJN3n5Ksoluy3QVcdPHhDzSrB
 n22LSizBrNmAhfTUGR2LAL7/qMJy4PeXjknBx9YSjLtgY7OXW8IHA0X2o4rhoI+R9dM/
 uSxCZfzEhD5FoxUoDqzGfG9yRDUR07rmFanV+BRHvfK2tEsgsDs+m16Y0G0lmBUCqzav
 yjTA==
X-Gm-Message-State: AOAM532jN/+XSwgxgj+d0yR868ASZvkmEWn9jPYYCe2iPefpGaEWPvO+
 IivdrG0ogPggUlOoigpWqyzK3t/DEd17xg==
X-Google-Smtp-Source: ABdhPJznFr93j3ui+YfjKhAApDwrpl9v6AUG/n1gLUDf9JQRpADJwADMeSZDOV50kNnSoREFyfwoLA==
X-Received: by 2002:a17:907:abc:: with SMTP id
 bz28mr23754293ejc.262.1621874496398; 
 Mon, 24 May 2021 09:41:36 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.35 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/28] object: add more commands to preconfig mode
Date: Mon, 24 May 2021 18:41:09 +0200
Message-Id: <20210524164131.383778-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Creating and destroying QOM objects does not require a fully constructed
machine.  Allow running object-add and object-del before machine
initialization has concluded.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands.hx | 2 ++
 qapi/qom.json   | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 435c591a1c..146a13c896 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1297,6 +1297,7 @@ ERST
         .help       = "create QOM object",
         .cmd        = hmp_object_add,
         .command_completion = object_add_completion,
+        .flags      = "p",
     },
 
 SRST
@@ -1311,6 +1312,7 @@ ERST
         .help       = "destroy QOM object",
         .cmd        = hmp_object_del,
         .command_completion = object_del_completion,
+        .flags      = "p",
     },
 
 SRST
diff --git a/qapi/qom.json b/qapi/qom.json
index 40d70c434a..4f48035831 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -857,7 +857,8 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'object-add', 'data': 'ObjectOptions', 'boxed': true }
+{ 'command': 'object-add', 'data': 'ObjectOptions', 'boxed': true,
+  'allow-preconfig': true }
 
 ##
 # @object-del:
@@ -877,4 +878,5 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'object-del', 'data': {'id': 'str'} }
+{ 'command': 'object-del', 'data': {'id': 'str'},
+  'allow-preconfig': true }
-- 
2.31.1



