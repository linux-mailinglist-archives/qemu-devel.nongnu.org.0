Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5C6427420
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 01:21:05 +0200 (CEST)
Received: from localhost ([::1]:55766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYzAm-0001FM-7d
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 19:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5O-0000BD-QN
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:30 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:34719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5N-0006mF-6f
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:30 -0400
Received: by mail-il1-x134.google.com with SMTP id g2so10428714ild.1
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 16:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NJfk0n48BOWpkXyZ5ySu54DMX1fxRfS+CzrpXRoYLXM=;
 b=bFPq7nzdSU3QwNZxVJNiQOpzPSrZbqywqf15GuAcPuQz0bAhr0EvvdXKYGLQvAwmIO
 T2HqCBKexioF2jdN2jnToSos9vJhfPduXCwo+X4N8EP5spB7KJZzasZHl3LHe5Wd3yRh
 LG/4SYeIxGBvTUmHzeiBs1aBKYTSZo2Lk+dSfBqKUhPDbEjUMvkCgPNdIF4oe9XkViW3
 mniCusOchXF6mwyslxkAorEo9ZMvP8YOIqufDeel8zYkHuXh1MKDZNX8faprc+yxsVje
 jANXkCJX7ISUeUBZoC3zsh+CASPukKj1K19LvaqlFxtmk/3u1RgZb3xaGVp5vvRBu0Nm
 Gtlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NJfk0n48BOWpkXyZ5ySu54DMX1fxRfS+CzrpXRoYLXM=;
 b=yhh1g7cZgbsTcPeQnU8zJ9ZadPd070klyhLlgSAgGnAqfQDyVQgqJI1ZJMpprZmf8w
 OdFykB33yim+ZkI8/jBi/7S0PJAyGklNcvUJXBcN18R5t/IfckFkr/XQACk6t2SjxriM
 rYfBc/kBXeIswpytK1yyTP4zJyjMUsFB+UDSBrvzog1qm+iEXPiFdIDEQNW8CV0Wexpn
 qWtwMIDFT91sXmTT8uQQCVuAYTzdRWKiz616s9SCrRsfSbuLciYbRNOPVvo20iJsQLRz
 RkWTnGhlL4g9ep/RXMcItczkd7zPHWR/BKHQB5XoD4WgSBHShLKzJ/eN8QtAPDIgXZNa
 13+w==
X-Gm-Message-State: AOAM533ANW8ztQQYgnQYCKaIWzTIXP3mUXEpeswUEw7NTHoa655uIP+x
 Qzr11IElRd6DJ3AzSEeIqT8wxwJhbklltg==
X-Google-Smtp-Source: ABdhPJxNYULUinJlu5icgJaIzNgFJaD8SrAgALj96HxGqBXGrLQCeSAOki7O/ciJrzA4gI8UJPYatA==
X-Received: by 2002:a05:6e02:1bee:: with SMTP id
 y14mr10370585ilv.21.1633734927901; 
 Fri, 08 Oct 2021 16:15:27 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id b15sm293628ion.8.2021.10.08.16.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:15:27 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/15] bsd-user/target_os_elf: If ELF_HWCAP2 is defined,
 publish it
Date: Fri,  8 Oct 2021 17:15:00 -0600
Message-Id: <20211008231506.17471-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008231506.17471-1-imp@bsdimp.com>
References: <20211008231506.17471-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some architectures publish AT_HWCAP2 as well as AT_HWCAP. Those
architectures will define ELF_HWCAP2 in their target_arch_elf.h files
for the value for this process. If it is defined, then publish it.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 bsd-user/freebsd/target_os_elf.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/bsd-user/freebsd/target_os_elf.h b/bsd-user/freebsd/target_os_elf.h
index adcffd1ddb..e5ac8e8e50 100644
--- a/bsd-user/freebsd/target_os_elf.h
+++ b/bsd-user/freebsd/target_os_elf.h
@@ -112,6 +112,10 @@ static abi_ulong target_create_elf_tables(abi_ulong p, int argc, int envc,
         NEW_AUX_ENT(AT_ENTRY, load_bias + exec->e_entry);
         features = ELF_HWCAP;
         NEW_AUX_ENT(FREEBSD_AT_HWCAP, features);
+#ifdef ELF_HWCAP2
+        features = ELF_HWCAP2;
+        NEW_AUX_ENT(FREEBSD_AT_HWCAP2, features);
+#endif
         NEW_AUX_ENT(AT_UID, (abi_ulong)getuid());
         NEW_AUX_ENT(AT_EUID, (abi_ulong)geteuid());
         NEW_AUX_ENT(AT_GID, (abi_ulong)getgid());
-- 
2.32.0


