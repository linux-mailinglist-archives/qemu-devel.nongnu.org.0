Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A486BED76
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 16:56:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdCQ6-0002l0-V6; Fri, 17 Mar 2023 11:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdCQ4-0002kY-IM
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:55:04 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdCQ2-0007n4-Jc
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:55:04 -0400
Received: by mail-pl1-x633.google.com with SMTP id a2so5743343plm.4
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 08:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679068499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=askS0DPb36wWSlWBcou6AQU6SXy8h0tFjS5nQCc6vaA=;
 b=Vfp4xpx/71EHcr8FctyahoeNr5bWU0tU84bZownV+f77nW87XfsVYEm1nmdoWGcDiS
 zKqNMtfGxW2DVeU4srp/v+XKtzHYzUm2ULHcKNWChbU6EP/+kU8LrNk903jJoevoR80T
 Yq5TyLX2wJR4k/2u+566lWIJv0SG/xF7WxprXxTDefl9TaysN0D6kLUCudUX4O542b1A
 gpuGmZXrMOYHfzlD4fx4Yyn7m60OaTMixarj5fXFgz35Hk+AzWiUDRZSdNlj/oJBby+a
 PA5rObGnN0t1UqFYkqlL/VtNOM3ibiM6C04zvcy/ZMYrb/o79eQvu+PkSX5ehBrxg9Jj
 KZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679068499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=askS0DPb36wWSlWBcou6AQU6SXy8h0tFjS5nQCc6vaA=;
 b=7OYLMYmk6b5w3UdUFGDsxpvS8eP1hzrI4dGlMxJ94BxYJXlesSvlVqs3ri2NH2Ngs+
 SWjxfiDRyfGvQAwRoSvRorvNsUr/APsYuaXLzcWFGnz8oRYbyTKZnOFVUgBAga7Sl9J2
 Zwc7cUAc7/n9S1bcQFlqwbN5gI184xnZXwF6AXyOXvurNMWyrBI9dLxzpu2GQ82DG2cM
 qx7qYlzPO0JBcH71ZabuJV+JSEi+IFNQjXprEnKKd42DhqRGWMb5cNdj6TzFgfSQaAoC
 WSQHr9+3wBiUaptxRVpDjXfKMCc9h613Eh/xoZLJX89v0fDauyR/0hwjWhQLAwZk159/
 T3YA==
X-Gm-Message-State: AO0yUKUsVEQe5uuiAp8Hyj06/glh1UL9sD0+JC9lVjQVLT79/N/33JMR
 okLxeV7c2RF+OXbOjpVoEWISBX09KIIuezkO38A=
X-Google-Smtp-Source: AK7set9x0loyCHxOP/rEjNGvf13VMhOJGXnJ1yYK24MvlRtncYNlFSJeoQn7/pPQFOxfQt23LSTxgQ==
X-Received: by 2002:a05:6a20:158e:b0:d4:c806:bdc0 with SMTP id
 h14-20020a056a20158e00b000d4c806bdc0mr9513037pzj.17.1679068499470; 
 Fri, 17 Mar 2023 08:54:59 -0700 (PDT)
Received: from stoup.. (96-82-119-43-static.hfc.comcastbusiness.net.
 [96.82.119.43]) by smtp.gmail.com with ESMTPSA id
 s5-20020a656445000000b004fb3e5681cesm1668986pgv.20.2023.03.17.08.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 08:54:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PATCH v2 1/9] linux-user: Diagnose misaligned -R size
Date: Fri, 17 Mar 2023 08:54:47 -0700
Message-Id: <20230317155455.341843-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230317155455.341843-1-richard.henderson@linaro.org>
References: <20230317155455.341843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

We have been enforcing host page alignment for the non-R
fallback of MAX_RESERVED_VA, but failing to enforce for -R.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/main.c b/linux-user/main.c
index 4b18461969..39d9bd4d7a 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -793,6 +793,12 @@ int main(int argc, char **argv, char **envp)
      */
     max_reserved_va = MAX_RESERVED_VA(cpu);
     if (reserved_va != 0) {
+        if (reserved_va % qemu_host_page_size) {
+            char *s = size_to_str(qemu_host_page_size);
+            fprintf(stderr, "Reserved virtual address not aligned mod %s\n", s);
+            g_free(s);
+            exit(EXIT_FAILURE);
+        }
         if (max_reserved_va && reserved_va > max_reserved_va) {
             fprintf(stderr, "Reserved virtual address too big\n");
             exit(EXIT_FAILURE);
-- 
2.34.1


