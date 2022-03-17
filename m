Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410874DBE05
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:15:29 +0100 (CET)
Received: from localhost ([::1]:36504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUiTw-0006sa-Al
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:15:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKr-0001HO-J4
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:05 -0400
Received: from [2607:f8b0:4864:20::52f] (port=47100
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKq-0002Gu-2x
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:05 -0400
Received: by mail-pg1-x52f.google.com with SMTP id o23so1809157pgk.13
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GQKtq5EmgHv2pf8acDMhuJ8SB17+NoN37aNM30IhfvE=;
 b=Lsod1GtFUEt517UJOi3A3oEv86HBCdTwBElarCuipGoSc0O0Jxun5sXB/K5aNG27MR
 Xy86Grkaka2so4CY88pyQ4lJ7YnSwpmhMXrjUvSKVG9cL9KdOfRje04nXvEHVE8ION0f
 Le2sye3e649YM5LTlwtoPN3uXDWInzhD6JM30ZIHYHUID9Kqg0S7xHhWDA+/meXvQ8ED
 pH+rPmgqSrGtX/hDMreK9iOix4aWFglwiF2W9ZdgR+1sN/lAifutsk3rORXePkAX1toz
 8tEq+V8DDp3KZ1XVBW5TyIVjRsGM33G9PtDF4jx+tYJ68wgkwZ7mDSDX7pBwpMVQ0eBA
 jnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GQKtq5EmgHv2pf8acDMhuJ8SB17+NoN37aNM30IhfvE=;
 b=JYdxAD7wCut2M/GWWwcHCcJ2ZhsuY5e03D4+1edHlPbFBIbNk6dITmpQDp8GniO/Es
 hJZP++xJpJJrWfDTtDfcU3jCHKlZ+oQXfCPfnD0ZYVB/GwBT8pAcrYqVNA63VeWyYqpn
 5PWrGheJywVaRFCXcHypJxOhEs+SMC8cn7uZZEjKWKjSX9kXn93M7/OGrGDvCcjoJqLA
 mLIrdVVXs7uHklATRU6paE0eU/tB++hbRXLVpbwWgFnu2+TvmQQOtLCdb19wDHMKy51Z
 w92hIbl+chVxvdQXGLr3/wsg/l+dND8t8EAkr+R+lqdQ5WC9BnXmVpOvDAie1ajovj8X
 Kbvw==
X-Gm-Message-State: AOAM530cLMmFsW8aKom8o6Sk0yp0NVwm7iqvT6frqM7+hLc+yQtdosou
 Wz4lnECW8YXIAvhGD8zWndE9Pgk2RsJQMg==
X-Google-Smtp-Source: ABdhPJwOHGi6NKmOFcx2gFtneGE9RPRZb9xbX75fzCa6Uft/F1stbmY8wvIxII7P0l1PhIKE/gvn2Q==
X-Received: by 2002:a63:6a41:0:b0:37c:7a6e:e7a3 with SMTP id
 f62-20020a636a41000000b0037c7a6ee7a3mr2245861pgc.528.1647493562740; 
 Wed, 16 Mar 2022 22:06:02 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:06:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 23/51] target/nios2: Handle EXCP_UNALIGN and
 EXCP_UALIGND
Date: Wed, 16 Mar 2022 22:05:10 -0700
Message-Id: <20220317050538.924111-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These misaligned data and misaligned destination exceptions
are defined, but not currently raised.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 285f3aae1d..0392c0ea84 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -119,6 +119,12 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         case EXCP_ILLEGAL:
             name = "ILLEGAL insn";
             break;
+        case EXCP_UNALIGN:
+            name = "Misaligned (data)";
+            break;
+        case EXCP_UNALIGND:
+            name = "Misaligned (destination)";
+            break;
         case EXCP_TRAP:
             name = "TRAP insn";
             break;
@@ -167,6 +173,8 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     case EXCP_SUPERD:
     case EXCP_ILLEGAL:
     case EXCP_TRAP:
+    case EXCP_UNALIGN:
+    case EXCP_UNALIGND:
         do_exception(cpu, cpu->exception_addr, false);
         break;
 
-- 
2.25.1


