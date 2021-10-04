Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FC042085D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:35:22 +0200 (CEST)
Received: from localhost ([::1]:40428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKNV-0004Df-Dg
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXKKL-0001Kb-UA
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:32:14 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:45692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXKKI-0007g7-2X
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:32:04 -0400
Received: by mail-ed1-x52e.google.com with SMTP id r18so62192885edv.12
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 02:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VMxPJY6t4uoMf/I961hE4R2GzgtcCFDrssDoN4r5NzQ=;
 b=ZO0EuWW9PywSMerGVyMCJtxrYVQ2fSnzqXtq0HVWcSijwA8UDVu7IQPOjJcRxZR0Nt
 me27zzblbb0WFiGfB4VqS0EIHdisTCOQxfkxGpxFBqrAsmKmsr1v+KsdRZBgnhngZ53C
 61cqbrw80ukWdw/MDpHHtxGUQhDeys2Los9jh2WkKvJ6kXBjXgJeR3fSphL4d7hkU5Ji
 ssYU9BidSokM8oIe0+gG2abgITlFAn/Cyfoix/JJiDaSGer7QKVCnmool/5a2oYvjClk
 hvJTHKdvEddAE4WZCKAZ2qI0/7+pB4Cut/MXKNVcGHX+lOXXts8pe6KxRetH4a/eboCQ
 MZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VMxPJY6t4uoMf/I961hE4R2GzgtcCFDrssDoN4r5NzQ=;
 b=Aa89rx7d1Aou1pNYWhqSxpA75BLebAIQmfcd48iVf8zfMbcODaNMRUWbSpg9Jof3ok
 pYzz0ziaH32lvb8gTqTfUMRVZOONgVWRqDCVRI1AJ4fjtHwgfEF/RTtuqFebmUW5L6oH
 +DYuFOUM2lrQ4lQ41z0et+NDUHPnEXIfTZg7yymCXG0ZVV+4ZCYbLgdoJfgiprxD20fP
 /Z1188mgM+iOYSESTcRLySfIrRDPCQwimlB2H7Y57nFtHIE7FQeq8D955IDoIyKcsN6k
 PZYUFXxxZF9zSfvg8yJ9Jkm//zrgjgqtnoxilJ8mWqlvurkWYVCZNio1Lv+dVrJAxrXB
 lW3A==
X-Gm-Message-State: AOAM531012LoI70W5Mc8KsQjOEm1ewazZp9srHjRRWuzjRsetGgF4WLa
 rfcQPG0PAnwc1ft4H+7gwjfyd0v6S4Y=
X-Google-Smtp-Source: ABdhPJzXG8QT03RyltZI7lTbgFCSLaoG65vMl7So7orPtEeMJEeWAmpkwyEJMno+zcP0mRgp7CuPxg==
X-Received: by 2002:a17:907:7601:: with SMTP id
 jx1mr16063811ejc.69.1633339920557; 
 Mon, 04 Oct 2021 02:32:00 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id d21sm5007143edp.27.2021.10.04.02.31.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 02:32:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] hexagon: use env keyword argument to pass PYTHONPATH
Date: Mon,  4 Oct 2021 11:30:51 +0200
Message-Id: <20211004093053.87883-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004093053.87883-1-pbonzini@redhat.com>
References: <20211004093053.87883-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

This feature is new in meson 0.57 and allows getting rid of the "env" wrapper.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/hexagon/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index 6fd9360b74..c6d858ffb2 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -156,7 +156,8 @@ dectree_generated = custom_target(
     'dectree_generated.h.inc',
     output: 'dectree_generated.h.inc',
     depends: [iset_py],
-    command: ['env', 'PYTHONPATH=' + meson.current_build_dir(), files('dectree.py'), '@OUTPUT@'],
+    env: {'PYTHONPATH': meson.current_build_dir()},
+    command: [python, files('dectree.py'), '@OUTPUT@'],
 )
 hexagon_ss.add(dectree_generated)
 
-- 
2.31.1



