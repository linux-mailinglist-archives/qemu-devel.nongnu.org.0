Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00432389FC5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:27:54 +0200 (CEST)
Received: from localhost ([::1]:58530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lje26-0005pl-1q
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxb-0005NU-FM
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:18 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:45026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxV-0001Ul-Ri
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:13 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so4671125wmg.3
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wULB0dT529terV3VemdiO1RbK/5UYU6YHyBr4JHxFbU=;
 b=Z8cz6PXe+9jdi7ZTbluXVqf2qe/ccyRCHWcB8gWswkBu2s/5pH6f39oyEMS4MyhTE9
 ppv6kR0baT5C4SA/gASEC/7+cM6/RG1nRYItKSb7BPyHzBv6dVXPUIGf00ghvfY9Bt15
 3GH5SLgjfE7vigxCm1k4oeu0eCn8aMW79mfOJnQoTIKgrBea4wYJKnXo+yh5+kSahPzD
 JNMQn/qqTlDGrCgELVBVG69igUNSnK9Ix3oU0YSN+SdF/sObYSTRRuxm2iNfb5EZ8siT
 VTU+8o2RA8Dx/LlERCLBrxKoZT+wk0KHToVNDazf2W33f6fsU71nsOW67AzRUfIj8Wtu
 URHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wULB0dT529terV3VemdiO1RbK/5UYU6YHyBr4JHxFbU=;
 b=NuqGeJpnNinIkAUvFOs0hn2gpI3cTQlIXBqHuc/wWnvv+weDfq+02nr0fn5vl6BrZw
 Bpy3i1DJeA1fvFoBxh4FlyseMhqNp1D6zrdosoe1GZourxVfIh0LkDiGBinBKySjxztr
 smr1wHCr4pYOWI5CZAAJHmlJgV1kv9El4ktBpgJ14ZGJy7a1f7GSD1S2H8JQaLmFhFPX
 kQtNORLvZ3Uu5v0cB17eJFAEAHBESVa4Kh98fHyVhyHKsIEnBjGKl/rPWIGSd0n6T2WK
 rpMlZIymwu9XuUsNTwFT4BokZ+i1isuBPgin5DJP/kkmuLl+H3zh3BSawUfF7GDvPBqw
 awfA==
X-Gm-Message-State: AOAM533lnmvHszWyUKftP64fnTsVx3Ao4lu45S7g3pTNM/lI86iQfC6C
 sphTT5kcvkf6A+3WNUzoGdoDDvzCwLpNtQ==
X-Google-Smtp-Source: ABdhPJz4dD3aJ/HnK8K+Va/dF8JCyS0YLKVMCFlPYKwAU/fi52wHW55TqvQ2TPidXgIn/Rr1FsHGmQ==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr2338979wmr.66.1621498983315;
 Thu, 20 May 2021 01:23:03 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.02 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/26] object: add more commands to preconfig mode
Date: Thu, 20 May 2021 10:22:38 +0200
Message-Id: <20210520082257.187061-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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



