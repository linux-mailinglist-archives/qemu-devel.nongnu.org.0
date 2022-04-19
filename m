Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC5250649F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:37:07 +0200 (CEST)
Received: from localhost ([::1]:57460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghU1-0006LR-R9
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggm2-0001Am-4P
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:39 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:33917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggly-0004RW-P6
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:35 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 ay36-20020a05600c1e2400b0038ebc885115so449007wmb.1
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hxPhwL6qgxcmhMQ66xzVRzRdrcl35BPxtCNFTsQVnNU=;
 b=ILHn1ZSZcAvvhMJeIzdjWtRVW2oPqH2DIJpp6+AU7lAOoZDFc2FUdUQs93oiwj0+Kv
 2q4EapY6sp4tqsdMmEI++i9IRhQrl/h/Y+YK/5LZiB3Q6+iLpRJe679v9UF7rbsG5y6s
 M8UtPWMiwa/KQnC5+szJtm3vIsFL2ar0cF438gwVljTI22XGWZbpQ/Dp1D0e40XVpQvY
 YcN9NIWPHdFl72lFo4FS1zKHd0egBhlp60cZpAZ24QfaxtP6soi/aqz2lR9qR50yInag
 nc08mYPLl4I3quzg+aI3hHCOmAsYyNxgJZ+XGCGhqGleRFktKbQBEJF7OVs4iHsFZDE+
 zGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hxPhwL6qgxcmhMQ66xzVRzRdrcl35BPxtCNFTsQVnNU=;
 b=dd7bvYi8Yo2oShJa0NoXY8SmbC5ikOJ7XM8nnRUpnv0css9XIGB32UPSnT7EM998Rb
 DgZ7pnPUQ8Wgwg2BtMLbmeTRBTuw5CmNTDm90CywKpZdLgVfyLGQrcD+UV1M/ZAVxCFv
 PHicVh6+EJjv2crwanaDktBHzi7mFApE52tpo4JMYA7g2OcmaswnRe5fh0wWEpLiBcnJ
 LWGEtcGgZ19kSB8pqgH6X2IIJ46i91l2tQwItJmPDJR+c+v7mv5UKNUjeyxZNAp/8mux
 thWTO4f//lerdjMY5NsxbxtEXUxObrAIJLDlBlYkFYJcUp4lOMARrZ72SoSdEdM52Kn5
 xU4A==
X-Gm-Message-State: AOAM532qcSPPs9Wi68gAK1kyRU9XeJeRI/A1i16a4UkxbwJEOk/Elsq9
 oeDP4EYaAmEbXajvdU3a0X7lBkkB0Nsqrg==
X-Google-Smtp-Source: ABdhPJzHcg4rjAuMF9PSzR2uV4chkyCax2ZkjQAsAiO/S5zEZsRCTXvlXvd6i2mSokRvhOr76thidw==
X-Received: by 2002:a05:600c:1584:b0:38e:c80e:b8b5 with SMTP id
 r4-20020a05600c158400b0038ec80eb8b5mr18098727wmf.99.1650347491030; 
 Mon, 18 Apr 2022 22:51:31 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/53] include: move cpu_exec* declarations to cpu-common.h
Date: Tue, 19 Apr 2022 07:50:43 +0200
Message-Id: <20220419055109.142788-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-23-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/exec/cpu-common.h | 3 +++
 include/qemu-common.h     | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 5979fc1f8e..5968551a05 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -19,6 +19,9 @@ typedef uint64_t vaddr;
 #define VADDR_PRIX PRIX64
 #define VADDR_MAX UINT64_MAX
 
+void cpu_exec_init_all(void);
+void cpu_exec_step_atomic(CPUState *cpu);
+
 /* Using intptr_t ensures that qemu_*_page_mask is sign-extended even
  * when intptr_t is 32-bit and we are aligning a long long.
  */
diff --git a/include/qemu-common.h b/include/qemu-common.h
index 08f40a9d1e..ced260d08b 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -24,9 +24,6 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-void cpu_exec_init_all(void);
-void cpu_exec_step_atomic(CPUState *cpu);
-
 /**
  * set_preferred_target_page_bits:
  * @bits: number of bits needed to represent an address within the page
-- 
2.35.1



