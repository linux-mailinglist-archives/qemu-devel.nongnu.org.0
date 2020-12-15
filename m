Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9EB2DAEC4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:20:22 +0100 (CET)
Received: from localhost ([::1]:60090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBBd-0001Cn-Rx
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:20:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4b-0001Zc-K2
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:05 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4Q-00079r-GT
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:05 -0500
Received: by mail-wr1-x443.google.com with SMTP id m5so19977523wrx.9
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vNqEQ8OeKCs61MrvZEg2K4vVh2wkS8dFPkArMrG4Pf4=;
 b=kvoDayvDHRUB5sbbi5HOOK/JcEVZMYFb2cdoL23Nb01hegykHCPrKnzOy2EZNHmxHj
 teaA94IT+p7zz8yTF2bZyR51tP0ykAMXbzcZIp+q59eCSe8YZfh4oaIkT01NpNN7Pd03
 sgPODZyqy19JGzgEiJH7CtBo9kWx54bCXOhHAlCfAzlFOGdNdLnTJwKaMPdEf8WUjeCC
 /mxorXY109GuiAdce5iuuDlX7M+az/6Ml54VnH83DNhxaGtU7p5FkXED/UdjKf71t1JD
 Td6k9Im0tabKU1pdmcJ6UkerLDlkH82dBLzAU1l/smKUsXo+jKjgN/0rXRpa6ex1HS6N
 zdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vNqEQ8OeKCs61MrvZEg2K4vVh2wkS8dFPkArMrG4Pf4=;
 b=qJdsaJjLNYTVtsiaHGYzHeXa2V1drJcfZE0oACdpOG5LF8hCfEOKXCVFdc3yShHdAY
 6rHxfIIi+Oui84ubOZcaYVhD6NwZu0qenjgPdJSsYaQrlMDTisbzpgpPBblpz9pPV/FM
 Ph0OTsIvftPth7aLsRTCkGIvToKDznQ+lPPe3msqMT/sgMUyP2DyTVvAu7S27z+VWOnn
 m7HDytynK+AlxiZv3jTiB4OfFCDHeol0eOcKLggCuCrv+HBdRPx2ngynMKPan0KS6/E3
 HvhtQ0Fa7x7tMPUE4z5Ct7xZjnLh8+wCXp0uNWOl8NsJsDRdZJguQEQD8JdZ2TceFy5k
 GXxQ==
X-Gm-Message-State: AOAM530/Y4U1PfaZOGvgQ8ZMXhfZ2YuK/U3nGJINrj8NI3ADYz1W9pIy
 fdmLWSgStcjSudF6az36Ub/orA7Wre/vig==
X-Google-Smtp-Source: ABdhPJxY8+/VVHFfh2FP87Ha9SZB3d6azUvqb+anbTuDOemwIwMXenKQj9E0T4hsy5Jp3xsOldiXAw==
X-Received: by 2002:adf:c844:: with SMTP id e4mr35182645wrh.345.1608041572446; 
 Tue, 15 Dec 2020 06:12:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w21sm19667319wmi.45.2020.12.15.06.12.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:12:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/20] elf_ops.h: Be more verbose with ROM blob names
Date: Tue, 15 Dec 2020 14:12:28 +0000
Message-Id: <20201215141237.17868-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215141237.17868-1-peter.maydell@linaro.org>
References: <20201215141237.17868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of making the ROM blob name something like:
  phdr #0: /home/petmay01/linaro/qemu-misc-tests/ldmia-fault.axf
make it a little more self-explanatory for people who don't know
ELF format details:
  /home/petmay01/linaro/qemu-misc-tests/ldmia-fault.axf ELF program header segment 0

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201129203923.10622-5-peter.maydell@linaro.org
---
 include/hw/elf_ops.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 53e0152af53..8e8436831d2 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -544,7 +544,8 @@ static int glue(load_elf, SZ)(const char *name, int fd,
             if (mem_size != 0) {
                 if (load_rom) {
                     g_autofree char *label =
-                        g_strdup_printf("phdr #%d: %s", i, name);
+                        g_strdup_printf("%s ELF program header segment %d",
+                                        name, i);
 
                     /*
                      * rom_add_elf_program() takes its own reference to
-- 
2.20.1


