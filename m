Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5634AB67F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 09:21:37 +0100 (CET)
Received: from localhost ([::1]:51258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGzHC-0004o5-Ox
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 03:21:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyrT-0005oT-7p
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:55:00 -0500
Received: from [2a00:1450:4864:20::42a] (port=47060
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyrD-0001rl-Ty
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:54:57 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r29so5169089wrr.13
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HlFCuXpNKMgKtSobhP2+/ylmEOSJUiLMiQZ2aHtDlr4=;
 b=qlF4nelG8NzZW+DiOh2XDcUqD9Q2GWrr14PSweOmTIcjhkRtarNbGCqCWVDPzHNFyq
 MUxM8RPHvFsSnkxJ9NUTIc52gVpUR9aTqkRA6gbdfwXxUv25I1wZmLEuOKlyEJ+AYsWb
 M74nledhuySLOTqkXbSj7mxpmTVYAhOkTMayYDSHPU3uw5XDXKNxwVK5PlH6r5sy0izG
 +GbZRPxHCH4w6IErTM4AosLy2wrKtpQA2FFJoA0YM+jH/mFyAYzfTU9STSmegEQ9L+yo
 KiC0giKzGG2Dwrh8EeYCs5ahv4CfqhRll33si52/5CxpHlofubhPBbDeEZFA8Gf8LDnU
 CigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HlFCuXpNKMgKtSobhP2+/ylmEOSJUiLMiQZ2aHtDlr4=;
 b=Jd/HyK+0Y8nWMkxDXhTYsEQpsIL/JDecNrN9DsHIoMCjGJYTPmFlD7EAJZugaUbJOt
 xEe6q6hQTrSJ04bRGHxt4qX3yFeCU2Ex3ZRUciuNxcw4T2g5daF5qBn9qGFU3c5pDxiS
 E0iipdCY74gOiL1FOjxFbnOZsEyAEFoPWRDaoi91gZVTj4PQZsKQHu6uumlgiGeP98o/
 aKTaBdlc+4p8zTvH83xlPNhjG8Bp2BuA0e206eIp6QfflnxYHnKBSaWxmXy9EyokgWmR
 pF71ifsod5acZ+0fqSUQXKAzUz90F8/qBiRfwUgsIfy5emrRyg/SIGB7WzwjNqgMDJ9I
 F96Q==
X-Gm-Message-State: AOAM532Gn1sGPVvVmTK7xre83UXIMbnPCH1/EmQeoZLvVrflNpo3jdCy
 y0xBntUZfVDgQF3GiA8y4mRATY3p5DY=
X-Google-Smtp-Source: ABdhPJwisWKcewenze1KpIEDhuOLPYBLdxe/kBjPGR1f3ppM0CrVQ0y0VcBR8PqV+PHojE6cf0JP/A==
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr5474400wrw.537.1644220477286; 
 Sun, 06 Feb 2022 23:54:37 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id i13sm10677302wrf.3.2022.02.06.23.54.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:54:36 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 02/21] accel/meson: Only build hw virtualization with
 system emulation
Date: Mon,  7 Feb 2022 08:54:07 +0100
Message-Id: <20220207075426.81934-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/meson.build | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/accel/meson.build b/accel/meson.build
index dfd808d2c8..b9a963cf80 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -2,12 +2,14 @@ specific_ss.add(files('accel-common.c'))
 softmmu_ss.add(files('accel-softmmu.c'))
 user_ss.add(files('accel-user.c'))
 
-subdir('hvf')
-subdir('qtest')
-subdir('kvm')
 subdir('tcg')
-subdir('xen')
-subdir('stubs')
+if have_system
+  subdir('hvf')
+  subdir('qtest')
+  subdir('kvm')
+  subdir('xen')
+  subdir('stubs')
+endif
 
 dummy_ss = ss.source_set()
 dummy_ss.add(files(
-- 
2.34.1


