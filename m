Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517F1621BFA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 19:35:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osTQP-0005G8-FQ; Tue, 08 Nov 2022 13:34:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osTQC-0005Ew-2u
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 13:34:04 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osTQA-0002HU-7n
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 13:34:03 -0500
Received: by mail-wr1-x432.google.com with SMTP id l14so22421394wrw.2
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 10:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rGHXHt6jWv/68MPAEtQJ82HuJNjHo7la3w/60XAsQbo=;
 b=FBkmyvb378BdRsp5dH6Uxw6BGGU6Gqk5Ztlv6dIGVQnmVIwpfKfei5vAu88ZWMD+S9
 55DSCH35Jk5wVugF5MICTANVnilJ7fjtu7m2Nvxc6g3LdTskt4oguy+7zCTZVnn/XTj/
 eomrFG6UrCOwN6xK085oXsX738mW+M4wmQ4SIDYx8TALscp0/TRUbCy40d6U3+ShB8Oo
 qj9hQgF/dJe/EqGhuiRnBA2kpLp7wIUHhzKWQx+/Cuk+Nqibhr9noi6iiSgzPrVVucSi
 7xeUrEjOQEQwLdp9UqNqqi/S6Zf7T0rHlBoUGVN6KY04z+4jxCBOY76xghf/Vck0cXjA
 trSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rGHXHt6jWv/68MPAEtQJ82HuJNjHo7la3w/60XAsQbo=;
 b=yLOQ8ieeYTRM4VnaeGhE3hN7MGpwMATk3357RlssJc4HP1egy/jnQzG3FSLCrs81ge
 xP1evq5hmfHdmhPYifjwiY1jJUlt4Yd/dei/Tix23/7eHeSpz4yt7JDE8wzTzSTBDLfx
 zXoZH7aXkqRIYpZpKULaieKVdPL1kXeC+wMT7pGLLVBjdq26i5fWFD4p/C2r0aGPiZYP
 c8ymAnsfnthhU95NpvvHQYVhylH+mJ084qMXu8T+om8wGqhVuWXjIasQYd2Vl/MWMa/P
 +XmIO5/2gFanKIlSVmiUJULIedOko+mW6S3+Kd9qETTYz8/caHfn1ENriJ84koUz/ulH
 x9Yw==
X-Gm-Message-State: ACrzQf0oMMc7jiJxLC2sTCnKad8GjIk5hw5XYtn3ZN/1URO7RA/f1AUm
 kTMsf697UXu7FFUxRS/rDBROjEvvXtzZyA==
X-Google-Smtp-Source: AMsMyM7EyIrXI1dDXmuPRrZklz7Cl0izbydsaLuk9dx4cSKoLCH0NhAnkrKIrz3nwMrLH171M8WK7g==
X-Received: by 2002:a5d:5e84:0:b0:236:cdb8:c67f with SMTP id
 ck4-20020a5d5e84000000b00236cdb8c67fmr30531178wrb.159.1667932439475; 
 Tue, 08 Nov 2022 10:33:59 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a7bca55000000b003c6c182bef9sm18158080wml.36.2022.11.08.10.33.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Nov 2022 10:33:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 David Hildenbrand <david@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>
Subject: [PULL 1/3] memory: Fix wrong end address dump
Date: Tue,  8 Nov 2022 19:33:50 +0100
Message-Id: <20221108183352.9466-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221108183352.9466-1-philmd@linaro.org>
References: <20221108183352.9466-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

From: Zhenzhong Duan <zhenzhong.duan@intel.com>

The end address of memory region section isn't correctly calculated
which leads to overflowed mtree dump:

  Dispatch
    Physical sections
      ......
      #70 @0000000000002000..0000000000011fff io [ROOT]
      #71 @0000000000005000..0000000000005fff (noname)
      #72 @0000000000005000..0000000000014fff io [ROOT]
      #73 @0000000000005658..0000000000005658 vmport
      #74 @0000000000005659..0000000000015658 io [ROOT]
      #75 @0000000000006000..0000000000015fff io [ROOT]

After fix:
      #70 @0000000000002000..0000000000004fff io [ROOT]
      #71 @0000000000005000..0000000000005fff (noname)
      #72 @0000000000005000..0000000000005657 io [ROOT]
      #73 @0000000000005658..0000000000005658 vmport
      #74 @0000000000005659..0000000000005fff io [ROOT]
      #75 @0000000000006000..000000000000ffff io [ROOT]

Fixes: 5e8fd947e2670 ("memory: Rework "info mtree" to print flat views and dispatch trees")
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20220622095912.3430583-1-zhenzhong.duan@intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 softmmu/physmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index d9578ccfd4..1b606a3002 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3712,7 +3712,7 @@ void mtree_print_dispatch(AddressSpaceDispatch *d, MemoryRegion *root)
                     " %s%s%s%s%s",
             i,
             s->offset_within_address_space,
-            s->offset_within_address_space + MR_SIZE(s->mr->size),
+            s->offset_within_address_space + MR_SIZE(s->size),
             s->mr->name ? s->mr->name : "(noname)",
             i < ARRAY_SIZE(names) ? names[i] : "",
             s->mr == root ? " [ROOT]" : "",
-- 
2.38.1


