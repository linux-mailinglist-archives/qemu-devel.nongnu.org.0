Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA7B4323A1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:17:41 +0200 (CEST)
Received: from localhost ([::1]:35644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVKW-0004Ws-VX
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV91-0007jS-7e
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:48 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:43670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8r-00083R-BF
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:46 -0400
Received: by mail-io1-xd2d.google.com with SMTP id y67so16840917iof.10
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HPM2AzR8oxs4nLDPoDsk3u1X7tCQIZsDcwBBkLry0yo=;
 b=m2KfaWDiti4qVZd4bdat+efvu9hCsLSXRkXu5+ItglaQP6cp64jnfmTje5NS/zA3vJ
 jmlvFqWt7LLoG3NMHp/InHqHEwheQaimeyz2ewZ2uzvZckLsVe2fsYL+18NRa/FOigu2
 rkhNB/px9r/mb8hHJzo2Xk5vOjlkQd147fjl3LO82+XkVwbQlFKS5pizQOhzkBK1Lm6p
 h2cyte5ZU4cagZ38le19b+ELCVwZy5ZRfeIfRFqlD+9Iz+MD79pElaemDr8aU4QHZtf4
 xUuFl4zcN4CiO6Yfb5VbObDn5GezkY4wRqsuJNK1kFrKvDhlJt8IWfWnHLqp/R6IJiAL
 tNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HPM2AzR8oxs4nLDPoDsk3u1X7tCQIZsDcwBBkLry0yo=;
 b=E+6G0JqjhBNFW46G/on8gqqloShm5nOHbAYWQqxMqxnc8M1HAKceQTKUiqIVB/7Sla
 osiR08Yznuu66Q7J2xcJMgYiyXfLB0zYh/gsVKG7ymmrTuHkJOwoeFm+SucsAApLkFMl
 MVz8jp2nHsub20hd/Q+l43WZwHihQWQ+QFIY7R6+VVMAKz194sg+PHV0EXzPEZh+yLGr
 xPso2DjnaWz+fS0kavTewDfyqX9yJi0oZ6fihjsjD+vxr7CIDi+Ysif7B+K9y+K6E/e/
 DzKS+5VVjq+GVF3dU9pXyRYt/H/dhHWYzMwUMrkA1OfplVIvorGa57j9JkG0tgUZ/tc5
 fUng==
X-Gm-Message-State: AOAM531TOAGc8Sn8Bs+ndHhBuzEhkE7NoDqWJl9TH7tUNPkgn5RpyTdk
 GME24Ba7Sa2Y5D+sy0L6rgqKhROVaMVg+A==
X-Google-Smtp-Source: ABdhPJxlbZybojS6WdItxOLrHJX3xXP7wpx4s0JojAd9XxXGJn7Blhh/3qGZnBv1xWP1/3Sur1teEQ==
X-Received: by 2002:a05:6602:1591:: with SMTP id
 e17mr14616870iow.146.1634573132620; 
 Mon, 18 Oct 2021 09:05:32 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:32 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/23] bsd-user/target_os_elf: If ELF_HWCAP2 is defined,
 publish it
Date: Mon, 18 Oct 2021 10:04:53 -0600
Message-Id: <20211018160458.1976-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
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


