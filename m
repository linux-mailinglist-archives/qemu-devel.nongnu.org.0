Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78284B659E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:14:46 +0100 (CET)
Received: from localhost ([::1]:37302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJsyz-0002Mv-S1
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:14:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsoY-00021r-Vx
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:03:59 -0500
Received: from [2607:f8b0:4864:20::635] (port=42635
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsoQ-00029r-Oo
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:03:53 -0500
Received: by mail-pl1-x635.google.com with SMTP id z17so12499908plb.9
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nu4DUrbIWXAn4pHgWXMlADFVEGOdcq7Po3cgGBBjqHs=;
 b=N7NHPhS3i4LprApVCgRvDg7OkZeBY6Q6o2+rpXcy7u8dIyhJe0L3du3g3LVfbSovjd
 UKPJGa4r7fh5YolDFaKTXWhKjG+UOgzw5iC8r9GXyhknHrHkr1+Q7FWgeZNFRHcdq2ck
 SAQczRBuFcpDQ7dSwL5Ez525t64PUysj9/Uce1RnwQTjc3H7MBd/3+bTaBCBX7P4HnBg
 palmq7yWzZoHBvoeMvFGUr/q3DgbYANQl6Tidttu3Mo43WE2BlP1sOr68CTOHTYcpkfD
 44/B3qsU/FOcEBgInZR1LAe7Eggs2nfxIjuvlAAUynLVIvDNGBoj7afZnqqdpijPNGWL
 EAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Nu4DUrbIWXAn4pHgWXMlADFVEGOdcq7Po3cgGBBjqHs=;
 b=nDF1BPDBVE2/mRO5LFCWGHW5ACvDtqXaIexynLlgEcqTvubnRiTzTbGp3rebK4Bv5d
 LeI3XNOHfTX9KNMi/rx5YVqaX1ucUFm8TRTzuAgjBnHljjNwWnEvhzY2lGojugV8COPH
 koe2fgAzdLs73tLkF8yevt2DiOFbo5wxdCv+3PRukPDsHcqI6zfUgA4l914DE/zizyYB
 Jels/cwxtsLNqzZ51upE/2laDZxARAqx03SpCv/NkHe33zi1e9Ix3VZKRTSZlgA0/9Ij
 n4XmNIc93rL7XGDd5WMCLwJaL49VmdRdy/IdwW63GtytM+7cn93eaHh2yu2FvCdmA1W3
 fxuQ==
X-Gm-Message-State: AOAM532fOoK2OxCchyrjDAFisxLf5qF/edG1C7ZP0G0l/+hpYuz8JN6F
 YLWFZQ48QCNCNrPEImA1kbqlGepWFqo=
X-Google-Smtp-Source: ABdhPJxL+RtnkMyZpa4qkpaDTWWtgfVeD0g1h0nvuTBhOAueS3nwtQWOgliAKCYXWRgKGGXKVbBqDA==
X-Received: by 2002:a17:902:6502:: with SMTP id
 b2mr3037965plk.43.1644912218568; 
 Tue, 15 Feb 2022 00:03:38 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id k3sm1778525pgt.29.2022.02.15.00.03.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 00:03:38 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 03/15] tests/fp/berkeley-testfloat-3: Ignore ignored
 #pragma directives
Date: Tue, 15 Feb 2022 09:02:55 +0100
Message-Id: <20220215080307.69550-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215080307.69550-1-f4bug@amsat.org>
References: <20220215080307.69550-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Since we already use -Wno-unknown-pragmas, we can also use
-Wno-ignored-pragmas. This silences hundred of warnings using
clang 13 on macOS Monterey:

  [409/771] Compiling C object tests/fp/libtestfloat.a.p/berkeley-testfloat-3_source_test_az_f128_rx.c.o
  ../tests/fp/berkeley-testfloat-3/source/test_az_f128_rx.c:49:14: warning: '#pragma FENV_ACCESS' is not supported on this target - ignored [-Wignored-pragmas]
  #pragma STDC FENV_ACCESS ON
               ^
  1 warning generated.

Having:

  $ cc -v
  Apple clang version 13.0.0 (clang-1300.0.29.30)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/fp/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/fp/meson.build b/tests/fp/meson.build
index 59776a00a7..5192264a08 100644
--- a/tests/fp/meson.build
+++ b/tests/fp/meson.build
@@ -30,6 +30,7 @@ tfcflags = [
   '-Wno-implicit-fallthrough',
   '-Wno-strict-prototypes',
   '-Wno-unknown-pragmas',
+  '-Wno-ignored-pragmas',
   '-Wno-uninitialized',
   '-Wno-missing-prototypes',
   '-Wno-return-type',
-- 
2.34.1


