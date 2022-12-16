Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710DA64F3F6
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:18:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Irw-0001Z7-Eb; Fri, 16 Dec 2022 17:07:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Irt-0001YU-RZ
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:07:49 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Irs-000662-AH
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:07:49 -0500
Received: by mail-ej1-x62f.google.com with SMTP id fc4so9194094ejc.12
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dnjBpu8YAsQiqTIBqdAxGgUmmCKdMDBQ66ZGoKps2Ew=;
 b=V3iElN+pWdNXlbuPkzYch26WWW47kZLvkp4pklr7MqLTRunNn+TowQUCROmuGTluTf
 FsYrRMIjbaKMvwPHXlfASr9BDsiFaNk5utWdmxOagO2T38fiu9GKn2LnXis0PoxQ+y4M
 jQbhdKk5M8mKJ4olp/u/KIfYKN+m7g/B7yk272XBW3r9g7vjxf8hIvdcnnyTrWybBjhD
 QZEnwyq0y5KBYC6dw/g5x1zKU+Ygl2Khg01/qm6G75KuQIWVNQw+qzd370FBZ9tYzVS/
 FXrTuzGh4dxHBWogjOU7q51i3Ndq71mTCiVkLUl/lNwRyIaEDc5r/1JqjfsuvhJLEHat
 jo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dnjBpu8YAsQiqTIBqdAxGgUmmCKdMDBQ66ZGoKps2Ew=;
 b=NlPEq9sWoDDUGSl1Z6dp1ZrvDGMUeCEUeL6lE4iKUDr43QLGoADUS9gwylELyZztvr
 Lhl0eMm+Mm8h+m56gVPrjC+Z45sgmgVCQkMeZYQrY8C1Pu04yAuZXVIutv179Vx7ZNYl
 Cy+hMso02SpstNS0c1zbvNCXtdUy6UTk0ecG3CviA4sbSLIf1LMCepOMIe/F0ff5vyio
 lUues0DjkJ+T+ohs4b5UajUFSicRXm3c+XtG22GJefJZ82jERJI0tgeYAWv74cZLnJTY
 fiUuqWSUkGr2xAZOBm7toH/SsSKktBWnsn2tXe+EkdxNmlKe7gjKn5sOyQ/m2vHy/kXr
 lpNQ==
X-Gm-Message-State: ANoB5pnqZ8NIrPwfWQw0SnyeHxDVC73E9XMfxWsnZ4w6L4tJJV3TTMLw
 jCkeY3PUAcVug8h3XPiSWc8GNvrNouE3qjEqQ8M=
X-Google-Smtp-Source: AA0mqf5FXdnuw+SCM5bPyadVl6lKNY8k4Ioju8XS7pTqY32yMybMBXqVv08QWaAB2Z4v9CR/OLRXLw==
X-Received: by 2002:a17:906:698f:b0:7ad:d250:b903 with SMTP id
 i15-20020a170906698f00b007add250b903mr38530813ejr.56.1671228466702; 
 Fri, 16 Dec 2022 14:07:46 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a17090653d700b007bed316a6d9sm1308360ejo.18.2022.12.16.14.07.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:07:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] sysemu/kvm: Remove CONFIG_USER_ONLY guard
Date: Fri, 16 Dec 2022 23:07:37 +0100
Message-Id: <20221216220738.7355-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220738.7355-1-philmd@linaro.org>
References: <20221216220738.7355-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

User emulation shouldn't really include this header; if included
these declarations are guarded by CONFIG_KVM_IS_POSSIBLE.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/kvm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index e9a97eda8c..c8281c07a7 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -471,10 +471,8 @@ uint64_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index);
 
 void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len);
 
-#if !defined(CONFIG_USER_ONLY)
 int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
                                        hwaddr *phys_addr);
-#endif
 
 #endif /* NEED_CPU_H */
 
-- 
2.38.1


