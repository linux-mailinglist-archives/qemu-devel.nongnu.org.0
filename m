Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F15443278B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:26:33 +0200 (CEST)
Received: from localhost ([::1]:44156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcYHI-0001oj-Nc
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtd-0008Ox-14
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:02:05 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:40931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXta-0001wV-5w
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:02:04 -0400
Received: by mail-il1-x131.google.com with SMTP id k3so5597931ilo.7
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HPM2AzR8oxs4nLDPoDsk3u1X7tCQIZsDcwBBkLry0yo=;
 b=GJwBQFgmf4MAUHfvDecqbOVCBJdLu21CUaELdwmil5hl8DU9JkaJWngSXS2WnbpSS0
 j6w5hg/I3/hN2zHs1ypqg7i9x+CJqRQyS3HpN6nDbGHPYH7xfuV8rCLTa9OATiDV/+LJ
 9ZuVuXLFVjju7hNjREqt/Y2XP8yVg+xiiXpmcyCA7hC88fAb1UDHFHT+Q1pymjX3NsEo
 4t3GrZFF61Jy1dMgjvOSC4IIbxpGuJNP0FzkQJ6pqNDMUq1S59bMwXLQ1wrmjS3uRY/j
 JiEq5eNo6eYd5jMzRF/5OV8qSPyft91wBLKKZ0DtnauAMtSLhtPgVDoSotm5rRcOffmT
 L0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HPM2AzR8oxs4nLDPoDsk3u1X7tCQIZsDcwBBkLry0yo=;
 b=pQA6tx58/LA9EDVjlRCzjVN6lFoQt5K//q9z7v0Yv63gpjgcZfP+hMSnSN06vwSU5B
 Zq29OvW05zCXqEfjtrP+dRUyll07Rn5WYlSLdbFmbYa5OdZUMuQl6ckapiCD2gPg+9um
 8b6Z8zDql1w7gtBWgy+Cle6aC+3MduvxeS2CYxdZYjHBH4kMIwank7HzPdRzqW87qY0u
 Y6Nv+Z3Bhgm8vFOKITx8CN08Qq0B8QgFpNASZ0HhY+ViAOH0k3S57ANBDy3nmZKfavFf
 23ymKXZY81hpNkm0rlWmM1QrnSRKG+rBp9b5rtBmvbuGu6WBQbczeTExlpoKrdknir3E
 Omwg==
X-Gm-Message-State: AOAM532CKAhYZKNhol6VWsYv8esr8opo+l3kILeVU6WjbR60dGmi1Iw+
 A86w7X/ksrLRCMMRoh2jpEhEyqW/oAvDbQ==
X-Google-Smtp-Source: ABdhPJxWjR9xh4SZK1zNuilupLDY3GkDrhTXK/3vNDouMqzHMs3JnyVb+y7UAOyrkuK3hqlT9WEVYw==
X-Received: by 2002:a05:6e02:20ca:: with SMTP id
 10mr15971021ilq.118.1634583720772; 
 Mon, 18 Oct 2021 12:02:00 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:02:00 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 18/23] bsd-user/target_os_elf: If ELF_HWCAP2 is defined,
 publish it
Date: Mon, 18 Oct 2021 13:01:10 -0600
Message-Id: <20211018190115.5365-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some architectures publish AT_HWCAP2 as well as AT_HWCAP. Those
architectures will define ELF_HWCAP2 in their target_arch_elf.h files
for the value for this process. If it is defined, then publish it.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
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


