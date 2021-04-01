Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D27B9351481
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:33:48 +0200 (CEST)
Received: from localhost ([::1]:59450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRva7-0004J7-V3
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPK-0000mx-G8
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:38 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:44908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPE-0006hO-LS
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:35 -0400
Received: by mail-ej1-x62f.google.com with SMTP id e14so2301842ejz.11
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 04:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=16KFCO3ieOKGNO78IkfXmCnzdtyYQDIwmMaQzvcQVWg=;
 b=dmymLPXrZbBL8EboANDgncnNXyhkvytNYi8dDFzRETjABvygCtf0McNmRn/2K1WC+/
 PvaJbG8SrFz/FjNNsWASl9Egxls8qwsC89o0h/CcRPrXBSypv7Gk8dfhb5wP5wRdMa8M
 Z2FhMQNDzO2SMWAYYRyblslsttO2VCAdU9iX6KcaB7RMKo+7NzoXVNgEmlANqGwO9hxP
 4RULpGcy+4vRvNZ1RrF+cYBeYEIt1zR16l1M23bBh9COL6SEQ+1bsbC9E5UrmWgDNKKM
 vZM3ZHe8VoQDMuUyb+DpkpX6YZixFHb2wu4x7MtL/LFj7bO1WLpN+OWES1h+bz0fmrr2
 Xzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=16KFCO3ieOKGNO78IkfXmCnzdtyYQDIwmMaQzvcQVWg=;
 b=l5zyBRBbfySQC7xl0u4cvu2rUoyotYuFdgfLJiWPqIP9coe0nTNsSUmKz0Tsu/9SHE
 00+9N35wqNM4ZGQwrFbSLLsn9EQ11FBz6g4Ddotr3Hsqw0O77Kh94qaRUK7DPCeGw3Vd
 a25OXBi6ZuO86kfhiwAkVE0Fk8jpxi+0mWnVb8qoO2jNUtATWtqRUJU854k4QgCA3Cvv
 bU+zg1Se8RMWt0A1irVcDFbw69PM5gR1+fXTxZ6MfbZLWm/5aKMkrzf1g9Qk2Um/S8e7
 PWHY7qfUKI7+v92fR+8Ngt9CpREQvgG1kOzioq2vOd6SZ+WuD5zP5DDpzcDgxZ9VlxAs
 wABQ==
X-Gm-Message-State: AOAM531MgSXTuinRwVIhUEFifrvZxGvsVjepa7tpgS22D3c9XNrDCUlp
 6PMit3r7RkNDAjmhtWlu7q0oxjQjt/Y=
X-Google-Smtp-Source: ABdhPJyvU6YKMk/D6es0h2++8LcuEwJrPtIHFw00XXk/xbwwkhghVdykzhutjKLFHHrRm3bczyoRmA==
X-Received: by 2002:a17:907:204c:: with SMTP id
 pg12mr8547271ejb.225.1617276151488; 
 Thu, 01 Apr 2021 04:22:31 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d15sm3383516edx.62.2021.04.01.04.22.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 04:22:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/12] hexagon: do not specify executables as inputs
Date: Thu,  1 Apr 2021 13:22:21 +0200
Message-Id: <20210401112223.55711-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210401112223.55711-1-pbonzini@redhat.com>
References: <20210401112223.55711-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
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

gen_semantics is an executable, not an input.  Meson 0.57 special cases
the first argument and @INPUT@ is not expanded there.  Fix that by
not including it in the input, only in the command.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/hexagon/meson.build | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index 15318a6fa7..5dd68907b1 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -33,8 +33,7 @@ gen_semantics = executable(
 semantics_generated = custom_target(
     'semantics_generated.pyinc',
     output: 'semantics_generated.pyinc',
-    input: gen_semantics,
-    command: ['@INPUT@', '@OUTPUT@'],
+    command: [gen_semantics, '@OUTPUT@'],
 )
 hexagon_ss.add(semantics_generated)
 
@@ -154,8 +153,7 @@ gen_dectree_import = executable(
 iset_py = custom_target(
     'iset.py',
     output: 'iset.py',
-    input: gen_dectree_import,
-    command: ['@INPUT@', '@OUTPUT@'],
+    command: [gen_dectree_import, '@OUTPUT@'],
 )
 hexagon_ss.add(iset_py)
 
-- 
2.30.1



